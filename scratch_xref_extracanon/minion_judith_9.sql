-- ----- fragment: minion_judith_09.sql (session253 judith 9) -----
-- Source anchor: apocrypha/judith ch9. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: jdt9 (view _session253_jdt9_lookup). Sort band base 60200, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_jdt9_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: judith-9-simeon-zeal
  ('apocrypha', 'judith', 9, 2, 'canon', 'genesis', 34, 25, 'free', E'Genesis 34:25 — *And it came to pass on the third day, when they were sore, that two of the sons of Jacob, Simeon and Levi, Dinah''s brethren, took each man his sword, and came upon the city boldly, and slew all the males.* This is the very sword of Simeon Judith 9:2 invokes, drawn to avenge the defiling of a maid.'),
  ('apocrypha', 'judith', 9, 3, 'canon', 'genesis', 34, 27, 'free', E'Genesis 34:27 — *The sons of Jacob came upon the slain, and spoiled the city, because they had defiled their sister.* Judith 9:3''s slain rulers dyed in blood is the spoiling of Shechem, the covenant zeal that abhorred the pollution of the seed.'),
  -- thread: judith-9-foreknowledge
  ('apocrypha', 'judith', 9, 6, 'canon', 'daniel', 4, 37, 'free', E'Daniel 4:37 — *Now I Nebuchadnezzar praise and extol and honour the King of heaven, all whose works are truth, and his ways judgment: and those that walk in pride he is able to abase.* The very king whose general Holofernes besieges Israel confesses the foreknown judgment Judith 9:6 trusts.'),
  ('apocrypha', 'judith', 9, 5, 'canon', 'isaiah', 37, 36, 'free', E'Isaiah 37:36 — *Then the angel of Yahuah (LORD) went forth, and smote in the camp of the Assyrians a hundred and fourscore and five thousand: and when they arose early in the morning, behold, they were all dead corpses.* Yahuah determined the Assyrian''s fall beforehand, as Judith 9:5 confesses of the things which ensued after.'),
  -- thread: judith-9-breaketh-battles
  ('apocrypha', 'judith', 9, 7, 'canon', 'exodus', 15, 3, 'free', E'Exodus 15:3 — *Yahuah (LORD) is a man of war: Yahuah (LORD) is his name.* Judith 9:7 names Him the One that breaketh the battles, the same warrior-name Yashar''el sang at the Red Sea.'),
  ('apocrypha', 'judith', 9, 7, 'canon', 'isaiah', 31, 1, 'free', E'Isaiah 31:1 — *Woe to them that go down to Egypt for help; and stay on horses, and trust in chariots, because they are many; and in horsemen, because they are very strong; but they look not unto the Holy One of Yashar''el (Israel), neither seek Yahuah (LORD)!* The Assyrians'' trust in horse and spear of Judith 9:7 is the same condemned reliance on flesh over the Holy One.'),
  ('apocrypha', 'judith', 9, 7, 'canon', 'isaiah', 31, 3, 'free', E'Isaiah 31:3 — *Now the Egyptians are men, and not Elohim (God); and their horses flesh, and not spirit. When Yahuah (LORD) shall stretch out his hand, both he that helpeth shall fall, and he that is holpen shall fall down, and they all shall fail together.* When Yahuah breaks the battle of Judith 9:7, the host of horse and man fails together as mere flesh.'),
  -- thread: judith-9-defile-the-sanctuary
  ('apocrypha', 'judith', 9, 8, 'canon', 'isaiah', 37, 23, 'free', E'Isaiah 37:23 — *Whom hast thou reproached and blasphemed? and against whom hast thou exalted thy voice, and lifted up thine eyes on high? even against the Holy One of Yashar''el (Israel).* The Assyrian purpose to defile the sanctuary in Judith 9:8 is the same blasphemy lifted against the Holy One.'),
  ('apocrypha', 'judith', 9, 9, 'canon', 'daniel', 4, 30, 'free', E'Daniel 4:30 — *The king spake, and said, Is not this great Babylon, that I have built for the house of the kingdom by the might of my power, and for the honour of my majesty?* The pride Judith 9:9 asks Yahuah to behold is the kingdom-of-man''s boast in its own might, the very arrogance Yahuah abased in Nebuchadnezzar.'),
  -- thread: judith-9-hand-of-a-woman
  ('apocrypha', 'judith', 9, 10, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Judith 9:10''s plea to break the proud by the hand of a woman stands in the line of the first enmity, the head of the serpent bruised through the woman.'),
  ('apocrypha', 'judith', 9, 10, 'canon', 'judges', 4, 9, 'free', E'Judges 4:9 — *And she said, I will surely go with thee: notwithstanding the journey that thou takest shall not be for thine honour; for Yahuah (LORD) shall sell Sisera into the hand of a woman. And Deborah arose, and went with Barak to Kedesh.* Judith 9:10 asks for the same victory Yahuah granted by selling the captain into a woman''s hand.'),
  ('apocrypha', 'judith', 9, 10, 'canon', 'judges', 4, 21, 'free', E'Judges 4:21 — *Then Jael Heber''s wife took a nail of the tent, and took an hammer in her hand, and went softly unto him, and smote the nail into his temples, and fastened it into the ground: for he was fast asleep and weary. So he died.* Jael''s hammer on a sleeping captain prefigures the stateliness broken by the hand of a woman Judith 9:10 prays for.'),
  ('apocrypha', 'judith', 9, 10, 'apocrypha', 'judith', 13, 8, 'extras', E'Judith 13:8 — *And she struck twice upon his neck with all her might, and she took away his head from him.* Judith''s own hand fulfils the petition of Judith 9:10, breaking the tyrant''s stateliness exactly as she prayed.'),
  -- thread: judith-9-saviour-of-the-weak
  ('apocrypha', 'judith', 9, 11, 'canon', '1-samuel', 14, 6, 'free', E'1 Samuel 14:6 — *And Jonathan said to the young man that bare his armour, Come, and let us go over unto the garrison of these uncircumcised: it may be that Yahuah (LORD) will work for us: for there is no restraint to Yahuah (LORD) to save by many or by few.* Judith 9:11''s God whose power stands not in multitude is the same who saves by many or by few.'),
  ('apocrypha', 'judith', 9, 11, 'canon', 'psalms', 33, 16, 'free', E'Psalms 33:16 — *There is no king saved by the multitude of an host: a mighty man is not delivered by much strength.* The psalm states plainly the truth Judith 9:11 prays from, that strength of men cannot deliver.'),
  ('apocrypha', 'judith', 9, 11, 'canon', '1-samuel', 2, 4, 'free', E'1 Samuel 2:4 — *The bows of the mighty men are broken, and they that stumbled are girded with strength.* Hannah''s song that the mighty are broken and the weak girded is the same reversal Judith 9:11 trusts in the helper of the oppressed.'),
  ('apocrypha', 'judith', 9, 11, 'canon', 'luke', 1, 52, 'free', E'Luke 1:52 — *He hath put down the mighty from their seats, and exalted them of low degree.* Mary''s Magnificat is Judith 9:11 sung again, the strong cast down and the forlorn upheld by Yahuah.'),
  -- thread: judith-9-elohim-of-israel-only
  ('apocrypha', 'judith', 9, 14, 'canon', 'isaiah', 37, 23, 'free', E'Isaiah 37:23 — *Whom hast thou reproached and blasphemed? and against whom hast thou exalted thy voice, and lifted up thine eyes on high? even against the Holy One of Yashar''el (Israel).* Judith 9:14 prays that every nation acknowledge the One the Assyrian blasphemed, the sole protector of Yashar''el.'),
  ('apocrypha', 'judith', 9, 14, 'canon', 'daniel', 4, 37, 'free', E'Daniel 4:37 — *Now I Nebuchadnezzar praise and extol and honour the King of heaven, all whose works are truth, and his ways judgment: and those that walk in pride he is able to abase.* Judith 9:14''s plea that every nation own Yahuah is answered when even the proud king of the kingdom-of-man is brought to confess Him.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_jdt9_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_jdt9_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-9-simeon-zeal',
       E'The sword of Simeon — zeal for the seed kept undefiled',
       E'Judith opens her prayer by invoking her forefather Simeon''s covenant zeal: *O Yahuah (God) of my father Simeon, to whom you gavest a sword to take vengeance of the strangers, who loosened the girdle of a maid to defile her, and discovered the thigh to her shame, and polluted her virginity to her reproach; for you saidst, It shall not be so; and yet they did so:* (Judith 9:2). She remembers how *you gavest their rulers to be slain, so that they dyed their bed in blood, being deceived, and smotest the servants with their lords, and the lords upon their thrones;* (Judith 9:3). This is the deed of Dinah avenged: *And it came to pass on the third day, when they were sore, that two of the sons of Jacob, Simeon and Levi, Dinah''s brethren, took each man his sword, and came upon the city boldly, and slew all the males.* (Genesis 34:25), *The sons of Jacob came upon the slain, and spoiled the city, because they had defiled their sister.* (Genesis 34:27). It ain''t new: the same zeal that guarded the seed from defilement in Shechem now arms a widow against Assyria.',
       sv.verse_id, ev.verse_id, 'extras', 60200
  FROM _session253_jdt9_lookup sv, _session253_jdt9_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=9 AND sv.verse_number=2
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=9 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-9-foreknowledge',
       E'Yahuah''s ways prepared — His judgments are in His foreknowledge',
       E'Judith confesses that the deliverance is settled before the hand ever moves: *For you have wrought not only those things, but also the things which fell out before, and which ensued after; you have thought upon the things which are now, and which are to come.* (Judith 9:5), *Yea, what things you did determine were ready at hand, and said, Lo, we are here: for all your ways are prepared, and your judgments are in your foreknowledge.* (Judith 9:6). This is election, not chance — Yahuah humbles the proud king by His own counsel: *Now I Nebuchadnezzar praise and extol and honour the King of heaven, all whose works are truth, and his ways judgment: and those that walk in pride he is able to abase.* (Daniel 4:37). The kingdom-of-man tyrant, Holofernes as Nebuchadnezzar''s arm, is dismantled by a foreknown decree.',
       sv.verse_id, ev.verse_id, 'extras', 60203
  FROM _session253_jdt9_lookup sv, _session253_jdt9_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=9 AND sv.verse_number=5
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=9 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-9-breaketh-battles',
       E'Yahuah breaketh the battles — not horse and spear',
       E'Judith strips the Assyrians of their boast in arms: *For, behold, the Assyrians are multiplied in their power; they are exalted with horse and man; they glory in the strength of their footmen; they trust in shield, and spear, and bow, and sling; and know not that you are Yahuah (God) that breakest the battles: Yahuah (God) is your name.* (Judith 9:7). The name is the same one sung at the Sea: *Yahuah (LORD) is a man of war: Yahuah (LORD) is his name.* (Exodus 15:3). And the prophet pronounces woe on every such trust: *Woe to them that go down to Egypt for help; and stay on horses, and trust in chariots, because they are many; and in horsemen, because they are very strong; but they look not unto the Holy One of Yashar''el (Israel), neither seek Yahuah (LORD)!* (Isaiah 31:1). It ain''t new: the kingdom of man trusts the chariot; Yahuah breaks the battle.',
       sv.verse_id, ev.verse_id, 'extras', 60206
  FROM _session253_jdt9_lookup sv, _session253_jdt9_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=9 AND sv.verse_number=7
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=9 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-9-defile-the-sanctuary',
       E'The pride that purposed to defile the sanctuary',
       E'Judith names the tyrant''s true crime — blasphemy against the holy house: *Throw down their strength in your power, and bring down their force in your wrath: for they have purposed to defile your sanctuary, and to pollute the tabernacle where your glorious name resteth and to cast down with sword the horn of your altar.* (Judith 9:8), *Behold their pride, and send your wrath upon their heads...* (Judith 9:9). This is the Assyrian boast Sennacherib made before, and the answer the prophet gave: *Whom hast thou reproached and blasphemed? and against whom hast thou exalted thy voice, and lifted up thine eyes on high? even against the Holy One of Yashar''el (Israel).* (Isaiah 37:23). It is Babylon''s proud word over again: *The king spake, and said, Is not this great Babylon, that I have built for the house of the kingdom by the might of my power, and for the honour of my majesty?* (Daniel 4:30). The kingdom-of-man system that demands worship and pollutes the sanctuary is the antichrist pattern Yahuah throws down.',
       sv.verse_id, ev.verse_id, 'extras', 60209
  FROM _session253_jdt9_lookup sv, _session253_jdt9_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=9 AND sv.verse_number=8
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=9 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-9-hand-of-a-woman',
       E'Break their stateliness by the hand of a woman',
       E'Here is the heart of the prayer — and the enmity first spoken in Eden: *Smite by the deceit of my lips the servant with the prince, and the prince with the servant: break down their stateliness by the hand of a woman.* (Judith 9:10). It echoes the first promise: *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* (Genesis 3:15). It is Jael''s nail again, sold into a woman''s hand: *And she said, I will surely go with thee: notwithstanding the journey that thou takest shall not be for thine honour; for Yahuah (LORD) shall sell Sisera into the hand of a woman. And Deborah arose, and went with Barak to Kedesh.* (Judges 4:9), *Then Jael Heber''s wife took a nail of the tent, and took an hammer in her hand, and went softly unto him, and smote the nail into his temples, and fastened it into the ground: for he was fast asleep and weary. So he died.* (Judges 4:21). Judith''s own hand will answer the prayer: *And she struck twice upon his neck with all her might, and she took away his head from him.* (Judith 13:8). It ain''t new: the proud head is bruised by the hand of a woman.',
       sv.verse_id, ev.verse_id, 'extras', 60212
  FROM _session253_jdt9_lookup sv, _session253_jdt9_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=9 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=9 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-9-saviour-of-the-weak',
       E'Not in multitude — a saviour of them without hope',
       E'Judith confesses the whole logic of Yahuah''s deliverance: *For your power stands not in multitude nor your might in strong men: for you are a Yahuah (God) of the afflicted, an helper of the oppressed, an upholder of the weak, a protector of the forlorn, a saviour of them that are without hope.* (Judith 9:11). This is the war-cry of faith: *And Jonathan said to the young man that bare his armour, Come, and let us go over unto the garrison of these uncircumcised: it may be that Yahuah (LORD) will work for us: for there is no restraint to Yahuah (LORD) to save by many or by few.* (1 Samuel 14:6), and the psalm''s verdict: *There is no king saved by the multitude of an host: a mighty man is not delivered by much strength.* (Psalms 33:16). Hannah sang it before Mary did: *The bows of the mighty men are broken, and they that stumbled are girded with strength.* (1 Samuel 2:4). And the Magnificat seals it: *He hath put down the mighty from their seats, and exalted them of low degree.* (Luke 1:52). It ain''t new: Yahuah saves not by many, the weak confound the mighty, the humble are exalted.',
       sv.verse_id, ev.verse_id, 'extras', 60215
  FROM _session253_jdt9_lookup sv, _session253_jdt9_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=9 AND sv.verse_number=11
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=9 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-9-elohim-of-israel-only',
       E'That every nation know there is none other that protecteth Yashar''el',
       E'Judith closes pleading the covenant name over the whole earth: *I pray you, I pray you, O Yahuah (God) of my father, and Yahuah (God) of the inheritance of Yashar''el (Israel), Yahuah (God) of the heavens and earth, Creator of the waters, king of every creature, hear you my prayer:* (Judith 9:12), that the deceit fall *who have purposed cruel things against your covenant, and your hallowed house, and against the top of Sion, and against the house of the possession of your children.* (Judith 9:13), *And make every nation and tribe to acknowledge that you are Yahuah (God) of all power and might, and that there is none other that protecteth the people of Yashar''el (Israel) but you.* (Judith 9:14). This is Hezekiah''s prayer answered, that the nations know the LORD alone: *Whom hast thou reproached and blasphemed?... even against the Holy One of Yashar''el (Israel).* (Isaiah 37:23). And the proud king himself is brought to confess it: *Now I Nebuchadnezzar praise and extol and honour the King of heaven, all whose works are truth, and his ways judgment: and those that walk in pride he is able to abase.* (Daniel 4:37). The election of Yashar''el is vindicated before every nation and tribe.',
       sv.verse_id, ev.verse_id, 'extras', 60218
  FROM _session253_jdt9_lookup sv, _session253_jdt9_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=9 AND sv.verse_number=12
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=9 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: judith-9-simeon-zeal
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 34:25 — *And it came to pass on the third day, when they were sore, that two of the sons of Jacob, Simeon and Levi, Dinah''s brethren, took each man his sword, and came upon the city boldly, and slew all the males.* This is the very sword of Simeon Judith 9:2 invokes, drawn to avenge the defiling of a maid.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt9_lookup sv, _session253_jdt9_lookup tv
 WHERE t.slug='judith-9-simeon-zeal'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=9 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=34 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 34:27 — *The sons of Jacob came upon the slain, and spoiled the city, because they had defiled their sister.* Judith 9:3''s slain rulers dyed in blood is the spoiling of Shechem, the covenant zeal that abhorred the pollution of the seed.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt9_lookup sv, _session253_jdt9_lookup tv
 WHERE t.slug='judith-9-simeon-zeal'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=9 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=34 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-9-foreknowledge
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 4:37 — *Now I Nebuchadnezzar praise and extol and honour the King of heaven, all whose works are truth, and his ways judgment: and those that walk in pride he is able to abase.* The very king whose general Holofernes besieges Israel confesses the foreknown judgment Judith 9:6 trusts.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt9_lookup sv, _session253_jdt9_lookup tv
 WHERE t.slug='judith-9-foreknowledge'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=9 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=4 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 37:36 — *Then the angel of Yahuah (LORD) went forth, and smote in the camp of the Assyrians a hundred and fourscore and five thousand: and when they arose early in the morning, behold, they were all dead corpses.* Yahuah determined the Assyrian''s fall beforehand, as Judith 9:5 confesses of the things which ensued after.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt9_lookup sv, _session253_jdt9_lookup tv
 WHERE t.slug='judith-9-foreknowledge'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=9 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=37 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-9-breaketh-battles
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 15:3 — *Yahuah (LORD) is a man of war: Yahuah (LORD) is his name.* Judith 9:7 names Him the One that breaketh the battles, the same warrior-name Yashar''el sang at the Red Sea.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt9_lookup sv, _session253_jdt9_lookup tv
 WHERE t.slug='judith-9-breaketh-battles'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=9 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=15 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 31:1 — *Woe to them that go down to Egypt for help; and stay on horses, and trust in chariots, because they are many; and in horsemen, because they are very strong; but they look not unto the Holy One of Yashar''el (Israel), neither seek Yahuah (LORD)!* The Assyrians'' trust in horse and spear of Judith 9:7 is the same condemned reliance on flesh over the Holy One.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt9_lookup sv, _session253_jdt9_lookup tv
 WHERE t.slug='judith-9-breaketh-battles'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=9 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=31 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 31:3 — *Now the Egyptians are men, and not Elohim (God); and their horses flesh, and not spirit. When Yahuah (LORD) shall stretch out his hand, both he that helpeth shall fall, and he that is holpen shall fall down, and they all shall fail together.* When Yahuah breaks the battle of Judith 9:7, the host of horse and man fails together as mere flesh.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt9_lookup sv, _session253_jdt9_lookup tv
 WHERE t.slug='judith-9-breaketh-battles'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=9 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=31 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-9-defile-the-sanctuary
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 37:23 — *Whom hast thou reproached and blasphemed? and against whom hast thou exalted thy voice, and lifted up thine eyes on high? even against the Holy One of Yashar''el (Israel).* The Assyrian purpose to defile the sanctuary in Judith 9:8 is the same blasphemy lifted against the Holy One.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt9_lookup sv, _session253_jdt9_lookup tv
 WHERE t.slug='judith-9-defile-the-sanctuary'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=9 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=37 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 4:30 — *The king spake, and said, Is not this great Babylon, that I have built for the house of the kingdom by the might of my power, and for the honour of my majesty?* The pride Judith 9:9 asks Yahuah to behold is the kingdom-of-man''s boast in its own might, the very arrogance Yahuah abased in Nebuchadnezzar.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt9_lookup sv, _session253_jdt9_lookup tv
 WHERE t.slug='judith-9-defile-the-sanctuary'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=9 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=4 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-9-hand-of-a-woman
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Judith 9:10''s plea to break the proud by the hand of a woman stands in the line of the first enmity, the head of the serpent bruised through the woman.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt9_lookup sv, _session253_jdt9_lookup tv
 WHERE t.slug='judith-9-hand-of-a-woman'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=9 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Judges 4:9 — *And she said, I will surely go with thee: notwithstanding the journey that thou takest shall not be for thine honour; for Yahuah (LORD) shall sell Sisera into the hand of a woman. And Deborah arose, and went with Barak to Kedesh.* Judith 9:10 asks for the same victory Yahuah granted by selling the captain into a woman''s hand.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt9_lookup sv, _session253_jdt9_lookup tv
 WHERE t.slug='judith-9-hand-of-a-woman'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=9 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=4 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Judges 4:21 — *Then Jael Heber''s wife took a nail of the tent, and took an hammer in her hand, and went softly unto him, and smote the nail into his temples, and fastened it into the ground: for he was fast asleep and weary. So he died.* Jael''s hammer on a sleeping captain prefigures the stateliness broken by the hand of a woman Judith 9:10 prays for.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt9_lookup sv, _session253_jdt9_lookup tv
 WHERE t.slug='judith-9-hand-of-a-woman'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=9 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=4 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Judith 13:8 — *And she struck twice upon his neck with all her might, and she took away his head from him.* Judith''s own hand fulfils the petition of Judith 9:10, breaking the tyrant''s stateliness exactly as she prayed.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt9_lookup sv, _session253_jdt9_lookup tv
 WHERE t.slug='judith-9-hand-of-a-woman'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=9 AND sv.verse_number=10
   AND tv.edition_slug='apocrypha' AND tv.book_slug='judith' AND tv.chapter_number=13 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-9-saviour-of-the-weak
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Samuel 14:6 — *And Jonathan said to the young man that bare his armour, Come, and let us go over unto the garrison of these uncircumcised: it may be that Yahuah (LORD) will work for us: for there is no restraint to Yahuah (LORD) to save by many or by few.* Judith 9:11''s God whose power stands not in multitude is the same who saves by many or by few.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt9_lookup sv, _session253_jdt9_lookup tv
 WHERE t.slug='judith-9-saviour-of-the-weak'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=9 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=14 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 33:16 — *There is no king saved by the multitude of an host: a mighty man is not delivered by much strength.* The psalm states plainly the truth Judith 9:11 prays from, that strength of men cannot deliver.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt9_lookup sv, _session253_jdt9_lookup tv
 WHERE t.slug='judith-9-saviour-of-the-weak'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=9 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=33 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Samuel 2:4 — *The bows of the mighty men are broken, and they that stumbled are girded with strength.* Hannah''s song that the mighty are broken and the weak girded is the same reversal Judith 9:11 trusts in the helper of the oppressed.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt9_lookup sv, _session253_jdt9_lookup tv
 WHERE t.slug='judith-9-saviour-of-the-weak'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=9 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Luke 1:52 — *He hath put down the mighty from their seats, and exalted them of low degree.* Mary''s Magnificat is Judith 9:11 sung again, the strong cast down and the forlorn upheld by Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt9_lookup sv, _session253_jdt9_lookup tv
 WHERE t.slug='judith-9-saviour-of-the-weak'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=9 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=52
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-9-elohim-of-israel-only
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 37:23 — *Whom hast thou reproached and blasphemed? and against whom hast thou exalted thy voice, and lifted up thine eyes on high? even against the Holy One of Yashar''el (Israel).* Judith 9:14 prays that every nation acknowledge the One the Assyrian blasphemed, the sole protector of Yashar''el.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt9_lookup sv, _session253_jdt9_lookup tv
 WHERE t.slug='judith-9-elohim-of-israel-only'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=9 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=37 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 4:37 — *Now I Nebuchadnezzar praise and extol and honour the King of heaven, all whose works are truth, and his ways judgment: and those that walk in pride he is able to abase.* Judith 9:14''s plea that every nation own Yahuah is answered when even the proud king of the kingdom-of-man is brought to confess Him.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt9_lookup sv, _session253_jdt9_lookup tv
 WHERE t.slug='judith-9-elohim-of-israel-only'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=9 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=4 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

