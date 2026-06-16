-- ----- fragment: minion_matthew_10.sql (S260 Matthew depth) -----
-- =====================================================================
-- Matthew 10 — full-library cross-reference threads (NT DEPTH pass)
-- 5 threads / 23 members. Band floor 11270, step +3.
-- =====================================================================

CREATE TEMP VIEW _mt10_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1',
   'pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ---------------------------------------------------------------------
-- SECTION B — cross_references rows (one VALUES tuple per member)
-- ---------------------------------------------------------------------
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES

  -- THREAD 1: lost sheep of the house of Israel (10:5-6)
  ('canon','matthew',10,6,'canon','ezekiel',34,16, 'free', E'*I will seek that which was lost, and bring again that which was driven away, and will bind up that which was broken, and will strengthen that which was sick* (Ezekiel 34:16). The Master sends the twelve to *the lost sheep of the house of Yashar''el* (Matthew 10:6) because the Shepherd Himself had already declared, two verses earlier, *I, even I, will both search my sheep, and seek them out* (Ezekiel 34:11). The mission is the Shepherd''s own search-and-rescue of His scattered flock.'),
  ('canon','matthew',10,6,'canon','jeremiah',50,6, 'free', E'*My people hath been lost sheep: their shepherds have caused them to go astray, they have turned them away on the mountains: they have gone from mountain to hill, they have forgotten their restingplace* (Jeremiah 50:6). This is the very phrase Yahusha takes up — *the lost sheep of the house of Yashar''el*. They are not no-people; they are Yahuah''s OWN people, lost and to be gathered home.'),
  ('canon','matthew',10,6,'canon','jeremiah',50,17, 'free', E'*Yashar''el is a scattered sheep; the lions have driven him away: first the king of Assyria hath devoured him; and last this Nebuchadrezzar king of Babylon hath broken his bones* (Jeremiah 50:17). Assyria scattered the northern house first — *the lost sheep* dispersed among the nations. The twelve go first to gather what Assyria scattered, the dispersed of Ephraim/Yashar''el coming home.'),
  ('canon','matthew',10,6,'canon','isaiah',53,6, 'free', E'*All we like sheep have gone astray; we have turned every one to his own way; and Yahuah hath laid on him the iniquity of us all* (Isaiah 53:6). The lost sheep are gathered not by a new errand but by the Servant who bears their iniquity — the Shepherd who lays down His life that the scattered may be brought in.'),
  ('canon','matthew',10,6,'canon','jeremiah',50,4, 'free', E'*In those days, and in that time, saith Yahuah, the children of Yashar''el shall come, they and the children of Yahudah together, going and weeping... They shall ask the way to Zion with their faces thitherward* (Jeremiah 50:4-5). The end of the search is BOTH houses — Yashar''el and Yahudah — joined in one perpetual covenant. The lost sheep are gathered, never cast off (cf. Romans 11:1-2, *Elohim hath not cast away his people*).'),

  -- THREAD 2: sheep among wolves / the Spirit of your Father speaketh (10:16-20)
  ('canon','matthew',10,16,'canon','genesis',3,1, 'free', E'*Now the serpent was more subtil than any beast of the field which Yahuah Elohim had made* (Genesis 3:1). *Be ye therefore wise as serpents, and harmless as doves* (Matthew 10:16). The serpent''s subtlety was bent to deceive; the disciple takes the shrewdness and keeps the dove''s innocence — wise without guile, sent as sheep among wolves yet harming none.'),
  ('canon','matthew',10,16,'canon','micah',7,5, 'free', E'*Trust ye not in a friend, put ye not confidence in a guide... For the son dishonoureth the father, the daughter riseth up against her mother... a man''s enemies are the men of his own house* (Micah 7:5-6). The wolves are not only the councils and the synagogues — they rise within a man''s own household. The sheep walk into a world already turned against them.'),
  ('canon','matthew',10,20,'canon','exodus',4,12, 'free', E'*Now therefore go, and I will be with thy mouth, and teach thee what thou shalt say* (Exodus 4:12). When the slow-tongued Moses pleaded he could not speak, Yahuah promised to BE with his mouth. So here: *take no thought how or what ye shall speak... For it is not ye that speak, but the Spirit of your Father which speaketh in you* (Matthew 10:19-20). The same Father who filled Moses'' mouth fills the disciple''s.'),
  ('canon','matthew',10,20,'canon','mark',13,11, 'free', E'*But when they shall lead you, and deliver you up, take no thought beforehand what ye shall speak, neither do ye premeditate: but whatsoever shall be given you in that hour, that speak ye: for it is not ye that speak, but the Ruach HaKodesh* (Mark 13:11). The promise stands across the gospels — the Father''s own Spirit answers for His sent ones in the hour of trial.'),

  -- THREAD 3: fear not them which kill the body / sparrows (10:26-31)
  ('canon','matthew',10,28,'canon','isaiah',8,12, 'free', E'*Neither fear ye their fear, nor be afraid. Sanctify Yahuah Tseva''ot himself; and let him be your fear, and let him be your dread* (Isaiah 8:12-13). *Fear not them which kill the body... but rather fear him which is able to destroy both soul and body* (Matthew 10:28). The cure for the fear of men is the fear of Yahuah — the one holy dread that drives out every other.'),
  ('canon','matthew',10,28,'canon','psalms',56,11, 'free', E'*In Elohim have I put my trust: I will not be afraid what man can do unto me* (Psalm 56:11). The disciple sent among wolves carries David''s settled confidence — man may kill the body, but the soul rests in the One who holds it.'),
  ('canon','matthew',10,28,'canon','proverbs',29,25, 'free', E'*The fear of man bringeth a snare: but whoso putteth his trust in Yahuah shall be safe* (Proverbs 29:25). The fear of men is itself the trap the wolves set; trust in Yahuah is the open ground. To *fear not them which kill the body* is wisdom''s own counsel.'),
  ('canon','matthew',10,29,'apocrypha','the-wisdom-of-solomon',16,26, 'extras', E'*That thy children, O Yahuah, whom thou lovest, might know, that it is not the growing of fruits that nourisheth man: but that it is thy word, which preserveth them that put their trust in thee* (Wisdom of Solomon 16:26). *Are not two sparrows sold for a farthing? and one of them shall not fall on the ground without your Father* (Matthew 10:29). The same Father who numbers the hairs and marks the sparrow''s fall preserves His own — not the world''s provision but His word keeps them.'),
  ('canon','matthew',10,31,'canon','luke',12,7, 'free', E'*But even the very hairs of your head are all numbered. Fear not therefore: ye are of more value than many sparrows* (Luke 12:7). The Master repeats it for emphasis across the gospels — the Father''s reckoning of the smallest sparrow is the measure of His care for the one He sends.'),

  -- THREAD 4: not peace but a sword / a man's foes / lose your life (10:34-39)
  ('canon','matthew',10,35,'canon','micah',7,6, 'free', E'*For the son dishonoureth the father, the daughter riseth up against her mother, the daughter in law against her mother in law; a man''s enemies are the men of his own house* (Micah 7:6). Yahusha quotes Micah word for word — *a man''s foes shall be they of his own household* (Matthew 10:36). The sword is not malice but the division that comes when one in a house turns to Yahuah and the rest will not.'),
  ('canon','matthew',10,37,'canon','deuteronomy',33,9, 'free', E'*Who said unto his father and to his mother, I have not seen him; neither did he acknowledge his brethren, nor knew his own children: for they have observed thy word, and kept thy covenant* (Deuteronomy 33:9). Levi''s blessing is loyalty to Yahuah set ABOVE kin. *He that loveth father or mother more than me is not worthy of me* (Matthew 10:37) — the fifth commandment still stands, but the Master must be loved first, as Levi loved the covenant first.'),
  ('canon','matthew',10,37,'apocrypha','ecclesiasticus',7,27, 'extras', E'*Honour thy father with thy whole heart, and forget not the sorrows of thy mother. Remember that thou wast begotten of them; and how canst thou recompense them the things that they have done for thee?* (Sirach 7:27-28). The honour owed to father and mother is never abolished — the Master who says *love me more* in Matthew 10:37 still upholds the commandment in full. It is an ordering of loves, not a cancelling of the fifth word.'),
  ('canon','matthew',10,38,'canon','genesis',22,12, 'free', E'*Lay not thine hand upon the lad... for now I know that thou fearest Elohim, seeing thou hast not withheld thy son, thine only son from me* (Genesis 22:12). *He that taketh not his cross, and followeth after me, is not worthy of me* (Matthew 10:38). Abraham, who did not withhold his only son, is the pattern of the cross-bearer — the one who holds even the dearest love loosely for Yahuah''s sake.'),
  ('canon','matthew',10,39,'canon','luke',12,51, 'free', E'*Suppose ye that I am come to give peace on earth? I tell you, Nay; but rather division: For from henceforth there shall be five in one house divided... The father shall be divided against the son, and the son against the father* (Luke 12:51-53). Luke records the same hard word — the sword is the line drawn through households when the kingdom comes near, the cost of finding life by losing it.'),

  -- THREAD 5: he that receiveth you receiveth me / a cup of cold water (10:40-42)
  ('canon','matthew',10,40,'canon','exodus',4,16, 'free', E'*And he shall be thy spokesman unto the people... he shall be to thee instead of a mouth, and thou shalt be to him instead of Elohim* (Exodus 4:16). The sent one carries the Sender — to receive Aaron was to receive Moses'' word, to receive the disciple is to receive Yahusha, and *he that receiveth me receiveth him that sent me* (Matthew 10:40). The Formed Son is Himself the Sent One of the Father; His apostles bear that same chain of sending.'),
  ('canon','matthew',10,41,'canon','1-kings',17,9, 'free', E'*Arise, get thee to Zarephath... behold, I have commanded a widow woman there to sustain thee* (1 Kings 17:9). The widow who fed Elijah with her last handful of meal received a prophet in the name of a prophet — *the barrel of meal wasted not, neither did the cruse of oil fail* (1 Kings 17:16). *He that receiveth a prophet in the name of a prophet shall receive a prophet''s reward* (Matthew 10:41).'),
  ('canon','matthew',10,41,'canon','2-kings',4,10, 'free', E'*Let us make a little chamber, I pray thee, on the wall; and let us set for him there a bed, and a table, and a stool, and a candlestick: and it shall be, when he cometh to us, that he shall turn in thither* (2 Kings 4:10). The Shunammite who lodged Elisha received a holy man of Elohim, and her reward was a son given and a son raised. To receive the prophet is to share the prophet''s portion.'),
  ('canon','matthew',10,42,'canon','proverbs',19,17, 'free', E'*He that hath pity upon the poor lendeth unto Yahuah; and that which he hath given will he pay him again* (Proverbs 19:17). *Whosoever shall give to drink unto one of these little ones a cup of cold water only... he shall in no wise lose his reward* (Matthew 10:42). The smallest kindness to the least is a loan to Yahuah Himself, and He repays in full.')

)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _mt10_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _mt10_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ---------------------------------------------------------------------
-- SECTION C — threads
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-10-the-lost-sheep-of-the-house-of-israel-ezekiel-34-jeremiah-50',
       E'But go rather to the lost sheep of the house of Yashar''el — the scattered flock sought out (Ezekiel 34; Jeremiah 50; Isaiah 53)',
       E'When Yahusha sends the twelve, He does not send them to strangers but to *the lost sheep of the house of Yashar''el* (Matthew 10:6) — and that phrase is lifted straight out of the prophets. *My people hath been lost sheep: their shepherds have caused them to go astray... they have forgotten their restingplace* (Jeremiah 50:6). The northern house was scattered first by Assyria — *Yashar''el is a scattered sheep; the lions have driven him away: first the king of Assyria hath devoured him* (Jeremiah 50:17) — dispersed among the nations and seemingly lost. But the Shepherd had already sworn to go after them Himself: *I, even I, will both search my sheep, and seek them out... I will seek that which was lost, and bring again that which was driven away* (Ezekiel 34:11,16). The mission of the twelve IS that search. And the gathering is never the casting-off of a people; it ends with BOTH houses brought home — *the children of Yashar''el shall come, they and the children of Yahudah together... they shall ask the way to Zion* (Jeremiah 50:4-5). The Servant who gathers them is the One on whom *Yahuah hath laid on him the iniquity of us all* (Isaiah 53:6). Hold the guard: *Elohim hath not cast away his people* (Romans 11:1-2). The lost sheep are sought, not rejected.',
       sv.verse_id, ev.verse_id, 'free', 11270
  FROM _mt10_lookup sv, _mt10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=10 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=10 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-10-sheep-among-wolves-spirit-of-your-father-speaketh-genesis-3-exodus-4',
       E'As sheep in the midst of wolves — it is the Spirit of your Father that speaketh (Genesis 3; Exodus 4; Micah 7)',
       E'*Behold, I send you forth as sheep in the midst of wolves: be ye therefore wise as serpents, and harmless as doves* (Matthew 10:16). The serpent of Eden was *more subtil than any beast of the field* (Genesis 3:1) — the disciple is to take that shrewdness and strip it of guile, wise without venom, innocent as the dove. And the wolves are not only the councils; they rise inside a man''s own house: *the son dishonoureth the father, the daughter riseth up against her mother... a man''s enemies are the men of his own house* (Micah 7:5-6). Yet the sheep are not sent unarmed. *Take no thought how or what ye shall speak... For it is not ye that speak, but the Spirit of your Father which speaketh in you* (Matthew 10:19-20). This is the old promise made to a slow-tongued man: *Now therefore go, and I will be with thy mouth, and teach thee what thou shalt say* (Exodus 4:12). The same Father who filled Moses'' mouth fills the disciple''s in the hour of trial — *whatsoever shall be given you in that hour, that speak ye: for it is not ye that speak, but the Ruach HaKodesh* (Mark 13:11). The sheep are defenceless; the Father is not.',
       sv.verse_id, ev.verse_id, 'free', 11273
  FROM _mt10_lookup sv, _mt10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=10 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=10 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-10-fear-not-them-which-kill-the-body-sparrows-isaiah-8-psalm-56',
       E'Fear not them which kill the body — not a sparrow falls without your Father (Isaiah 8; Psalm 56; Wisdom 16)',
       E'*And fear not them which kill the body, but are not able to kill the soul: but rather fear him which is able to destroy both soul and body in hell* (Matthew 10:28). The cure for the fear of men is one holy dread that swallows all others — exactly Isaiah''s counsel under the Assyrian terror: *neither fear ye their fear, nor be afraid. Sanctify Yahuah Tseva''ot himself; and let him be your fear, and let him be your dread* (Isaiah 8:12-13). David had learned it in the cave: *In Elohim have I put my trust: I will not be afraid what man can do unto me* (Psalm 56:11). And wisdom names the snare itself — *the fear of man bringeth a snare: but whoso putteth his trust in Yahuah shall be safe* (Proverbs 29:25). Why so fearless? Because the Father''s reckoning reaches the smallest thing: *Are not two sparrows sold for a farthing? and one of them shall not fall on the ground without your Father. But the very hairs of your head are all numbered* (Matthew 10:29-30). The same Father who marks the sparrow''s fall keeps His own — *it is not the growing of fruits that nourisheth man: but... thy word, which preserveth them that put their trust in thee* (Wisdom of Solomon 16:26). *Fear not therefore: ye are of more value than many sparrows* (Luke 12:7).',
       sv.verse_id, ev.verse_id, 'extras', 11276
  FROM _mt10_lookup sv, _mt10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=10 AND sv.verse_number=26
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=10 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-10-not-peace-but-a-sword-a-mans-foes-lose-your-life-micah-7-deuteronomy-33',
       E'I came not to send peace, but a sword — a man''s foes of his own household (Micah 7; Deuteronomy 33; Genesis 22)',
       E'*Think not that I am come to send peace on earth: I came not to send peace, but a sword* (Matthew 10:34). The sword is not the Master''s malice but the line the kingdom draws through a household — and He proves it by quoting Micah word for word: *the son dishonoureth the father, the daughter riseth up against her mother, the daughter in law against her mother in law; a man''s enemies are the men of his own house* (Micah 7:6). When one in a house turns to Yahuah and the rest will not, division is the cost. This is not the abolishing of the fifth commandment — *he that loveth father or mother more than me is not worthy of me* (Matthew 10:37) is an ordering of loves, not a cancelling of honour owed (*honour thy father with thy whole heart*, Sirach 7:27 still stands). It is Levi''s loyalty: *who said unto his father and to his mother, I have not seen him... for they have observed thy word, and kept thy covenant* (Deuteronomy 33:9) — the covenant set above kin. And it is Abraham at Moriah, who *hast not withheld thy son, thine only son* (Genesis 22:12), the pattern of the cross-bearer who holds even the dearest love loosely. *He that findeth his life shall lose it: and he that loseth his life for my sake shall find it* (Matthew 10:39) — for *suppose ye that I am come to give peace on earth? I tell you, Nay; but rather division* (Luke 12:51).',
       sv.verse_id, ev.verse_id, 'extras', 11279
  FROM _mt10_lookup sv, _mt10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=10 AND sv.verse_number=34
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=10 AND ev.verse_number=39
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-10-he-that-receiveth-you-receiveth-me-a-cup-of-cold-water-exodus-4-1-kings-17',
       E'He that receiveth you receiveth me — a cup of cold water shall not lose its reward (Exodus 4; 1 Kings 17; Proverbs 19)',
       E'*He that receiveth you receiveth me, and he that receiveth me receiveth him that sent me* (Matthew 10:40). The sent one carries the Sender — it is the pattern of Aaron, the mouth of Moses: *he shall be to thee instead of a mouth, and thou shalt be to him instead of Elohim* (Exodus 4:16). And it is the very chain of the gospel, for the Formed Son is Himself the Sent One of the Father; to receive His apostle is to receive Him, and to receive Him is to receive the Father who sent Him. The reward attaches to the welcome: *he that receiveth a prophet in the name of a prophet shall receive a prophet''s reward* (Matthew 10:41). So the widow of Zarephath, who gave Elijah her last handful — *the barrel of meal shall not waste, neither shall the cruse of oil fail* (1 Kings 17:9,16) — and the Shunammite who built Elisha a little chamber on the wall (*a bed, and a table, and a stool, and a candlestick*, 2 Kings 4:10) and was repaid with a son given and a son raised. Even the least kindness is logged in heaven: *whosoever shall give to drink unto one of these little ones a cup of cold water only... he shall in no wise lose his reward* (Matthew 10:42) — for *he that hath pity upon the poor lendeth unto Yahuah; and that which he hath given will he pay him again* (Proverbs 19:17).',
       sv.verse_id, ev.verse_id, 'free', 11282
  FROM _mt10_lookup sv, _mt10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=10 AND sv.verse_number=40
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=10 AND ev.verse_number=42
ON CONFLICT (slug) DO NOTHING;

-- ---------------------------------------------------------------------
-- SECTION D — thread_members
-- ---------------------------------------------------------------------

-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 34:16 — *I will seek that which was lost, and bring again that which was driven away... and will strengthen that which was sick.* The Shepherd''s own search for the scattered flock.'
  FROM cross_reference_threads t, cross_references x, _mt10_lookup sv, _mt10_lookup tv
 WHERE t.slug='matthew-10-the-lost-sheep-of-the-house-of-israel-ezekiel-34-jeremiah-50'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=10 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=34 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 50:6 — *My people hath been lost sheep: their shepherds have caused them to go astray.* The exact phrase Yahusha takes up: lost, but still *my people.*'
  FROM cross_reference_threads t, cross_references x, _mt10_lookup sv, _mt10_lookup tv
 WHERE t.slug='matthew-10-the-lost-sheep-of-the-house-of-israel-ezekiel-34-jeremiah-50'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=10 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=50 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 50:17 — *Yashar''el is a scattered sheep... first the king of Assyria hath devoured him.* The northern house scattered first — the lost sheep dispersed among the nations.'
  FROM cross_reference_threads t, cross_references x, _mt10_lookup sv, _mt10_lookup tv
 WHERE t.slug='matthew-10-the-lost-sheep-of-the-house-of-israel-ezekiel-34-jeremiah-50'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=10 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=50 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 53:6 — *All we like sheep have gone astray... and Yahuah hath laid on him the iniquity of us all.* The Servant-Shepherd who gathers the lost by bearing their sin.'
  FROM cross_reference_threads t, cross_references x, _mt10_lookup sv, _mt10_lookup tv
 WHERE t.slug='matthew-10-the-lost-sheep-of-the-house-of-israel-ezekiel-34-jeremiah-50'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=10 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jeremiah 50:4 — *the children of Yashar''el shall come, they and the children of Yahudah together... they shall ask the way to Zion.* Both houses gathered home — the Romans 11 guard: gathered, never cast off.'
  FROM cross_reference_threads t, cross_references x, _mt10_lookup sv, _mt10_lookup tv
 WHERE t.slug='matthew-10-the-lost-sheep-of-the-house-of-israel-ezekiel-34-jeremiah-50'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=10 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=50 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:1 — *Now the serpent was more subtil than any beast of the field.* Take the serpent''s shrewdness, strip it of guile — wise as serpents, harmless as doves.'
  FROM cross_reference_threads t, cross_references x, _mt10_lookup sv, _mt10_lookup tv
 WHERE t.slug='matthew-10-sheep-among-wolves-spirit-of-your-father-speaketh-genesis-3-exodus-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=10 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Micah 7:5 — *Trust ye not in a friend... a man''s enemies are the men of his own house* (7:5-6). The wolves rise even within the household.'
  FROM cross_reference_threads t, cross_references x, _mt10_lookup sv, _mt10_lookup tv
 WHERE t.slug='matthew-10-sheep-among-wolves-spirit-of-your-father-speaketh-genesis-3-exodus-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=10 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=7 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 4:12 — *I will be with thy mouth, and teach thee what thou shalt say.* The Father who filled the slow-tongued Moses fills the disciple before the councils.'
  FROM cross_reference_threads t, cross_references x, _mt10_lookup sv, _mt10_lookup tv
 WHERE t.slug='matthew-10-sheep-among-wolves-spirit-of-your-father-speaketh-genesis-3-exodus-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=10 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=4 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Mark 13:11 — *it is not ye that speak, but the Ruach HaKodesh.* The same promise across the gospels — the Father''s Spirit answers in the hour of trial.'
  FROM cross_reference_threads t, cross_references x, _mt10_lookup sv, _mt10_lookup tv
 WHERE t.slug='matthew-10-sheep-among-wolves-spirit-of-your-father-speaketh-genesis-3-exodus-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=10 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=13 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 8:12-13 — *neither fear ye their fear... let him be your fear, and let him be your dread.* The fear of Yahuah drives out the fear of men.'
  FROM cross_reference_threads t, cross_references x, _mt10_lookup sv, _mt10_lookup tv
 WHERE t.slug='matthew-10-fear-not-them-which-kill-the-body-sparrows-isaiah-8-psalm-56'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=10 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=8 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 56:11 — *In Elohim have I put my trust: I will not be afraid what man can do unto me.* David''s settled confidence under the threat of men.'
  FROM cross_reference_threads t, cross_references x, _mt10_lookup sv, _mt10_lookup tv
 WHERE t.slug='matthew-10-fear-not-them-which-kill-the-body-sparrows-isaiah-8-psalm-56'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=10 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=56 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 29:25 — *The fear of man bringeth a snare: but whoso putteth his trust in Yahuah shall be safe.* The fear of men is itself the trap.'
  FROM cross_reference_threads t, cross_references x, _mt10_lookup sv, _mt10_lookup tv
 WHERE t.slug='matthew-10-fear-not-them-which-kill-the-body-sparrows-isaiah-8-psalm-56'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=10 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=29 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Wisdom of Solomon 16:26 — *it is not the growing of fruits that nourisheth man: but... thy word, which preserveth them that put their trust in thee.* The Father who marks the sparrow preserves His own.'
  FROM cross_reference_threads t, cross_references x, _mt10_lookup sv, _mt10_lookup tv
 WHERE t.slug='matthew-10-fear-not-them-which-kill-the-body-sparrows-isaiah-8-psalm-56'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=10 AND sv.verse_number=29
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=16 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Luke 12:7 — *the very hairs of your head are all numbered. Fear not therefore: ye are of more value than many sparrows.* The Master repeats it: the Father''s reckoning is the measure of His care.'
  FROM cross_reference_threads t, cross_references x, _mt10_lookup sv, _mt10_lookup tv
 WHERE t.slug='matthew-10-fear-not-them-which-kill-the-body-sparrows-isaiah-8-psalm-56'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=10 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=12 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Micah 7:6 — *the son dishonoureth the father... a man''s enemies are the men of his own house.* Yahusha quotes Micah word for word — the sword is household division for Yahuah''s sake.'
  FROM cross_reference_threads t, cross_references x, _mt10_lookup sv, _mt10_lookup tv
 WHERE t.slug='matthew-10-not-peace-but-a-sword-a-mans-foes-lose-your-life-micah-7-deuteronomy-33'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=10 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=7 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 33:9 — Levi *said unto his father and to his mother, I have not seen him... for they have observed thy word, and kept thy covenant.* Loyalty to Yahuah set above kin — the fifth commandment kept, the Master loved first.'
  FROM cross_reference_threads t, cross_references x, _mt10_lookup sv, _mt10_lookup tv
 WHERE t.slug='matthew-10-not-peace-but-a-sword-a-mans-foes-lose-your-life-micah-7-deuteronomy-33'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=10 AND sv.verse_number=37
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=33 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Sirach 7:27-28 — *Honour thy father with thy whole heart, and forget not the sorrows of thy mother.* The fifth word is never abolished; *love me more* is an ordering of loves, not a cancelling.'
  FROM cross_reference_threads t, cross_references x, _mt10_lookup sv, _mt10_lookup tv
 WHERE t.slug='matthew-10-not-peace-but-a-sword-a-mans-foes-lose-your-life-micah-7-deuteronomy-33'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=10 AND sv.verse_number=37
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=7 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 22:12 — *thou hast not withheld thy son, thine only son from me.* Abraham at Moriah is the pattern of the cross-bearer who holds even the dearest love loosely for Yahuah.'
  FROM cross_reference_threads t, cross_references x, _mt10_lookup sv, _mt10_lookup tv
 WHERE t.slug='matthew-10-not-peace-but-a-sword-a-mans-foes-lose-your-life-micah-7-deuteronomy-33'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=10 AND sv.verse_number=38
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Luke 12:51-53 — *I am come... not to send peace, but rather division... The father shall be divided against the son.* Luke''s parallel — the sword is the line the kingdom draws through a house.'
  FROM cross_reference_threads t, cross_references x, _mt10_lookup sv, _mt10_lookup tv
 WHERE t.slug='matthew-10-not-peace-but-a-sword-a-mans-foes-lose-your-life-micah-7-deuteronomy-33'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=10 AND sv.verse_number=39
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=12 AND tv.verse_number=51
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 4:16 — Aaron *shall be to thee instead of a mouth, and thou shalt be to him instead of Elohim.* The sent one carries the Sender; the Formed Son is Himself the Father''s Sent One.'
  FROM cross_reference_threads t, cross_references x, _mt10_lookup sv, _mt10_lookup tv
 WHERE t.slug='matthew-10-he-that-receiveth-you-receiveth-me-a-cup-of-cold-water-exodus-4-1-kings-17'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=10 AND sv.verse_number=40
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=4 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Kings 17:9 — the widow of Zarephath commanded to sustain Elijah; she gave her last handful and *the barrel of meal wasted not* (17:16). To receive a prophet is to share a prophet''s reward.'
  FROM cross_reference_threads t, cross_references x, _mt10_lookup sv, _mt10_lookup tv
 WHERE t.slug='matthew-10-he-that-receiveth-you-receiveth-me-a-cup-of-cold-water-exodus-4-1-kings-17'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=10 AND sv.verse_number=41
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=17 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Kings 4:10 — the Shunammite builds Elisha *a little chamber... a bed, and a table, and a stool, and a candlestick.* She received a holy man, and was repaid with a son given and raised.'
  FROM cross_reference_threads t, cross_references x, _mt10_lookup sv, _mt10_lookup tv
 WHERE t.slug='matthew-10-he-that-receiveth-you-receiveth-me-a-cup-of-cold-water-exodus-4-1-kings-17'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=10 AND sv.verse_number=41
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=4 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 19:17 — *He that hath pity upon the poor lendeth unto Yahuah; and that which he hath given will he pay him again.* The cup of cold water to the least is a loan to Yahuah Himself.'
  FROM cross_reference_threads t, cross_references x, _mt10_lookup sv, _mt10_lookup tv
 WHERE t.slug='matthew-10-he-that-receiveth-you-receiveth-me-a-cup-of-cold-water-exodus-4-1-kings-17'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=10 AND sv.verse_number=42
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=19 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
