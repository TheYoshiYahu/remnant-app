-- ----- fragment: minion_matthew_02.sql (S260 Matthew depth) -----
-- ============================================================================
-- Matthew 2 — full-library cross-reference threads (NT DEPTH pass)
-- 5 threads / 23 members. sort_order band 11030, step +3.
-- ============================================================================

-- ── 3a. Temp view ──────────────────────────────────────────────────────────
CREATE TEMP VIEW _mt02_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1',
   'pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ── 3b. cross_references rows ──────────────────────────────────────────────
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES

  -- THREAD 1 — Bethlehem / the star / born King: the Ruler out of Judah (Matt 2:1-6)
  ('canon','matthew',2,6,'canon','micah',5,2, 'free', E'*But thou, Beth-lehem Ephratah, though thou be little among the thousands of Yahudah (Judah), yet out of thee shall he come forth unto me that is to be ruler in Yashar''el (Israel); whose goings forth have been from of old, from everlasting* (Micah 5:2). The chief priests answer Herod straight out of the prophet — the little town, the Ruler, the goings-forth from everlasting. This is the scepter-line of Judah brought to its head.'),
  ('canon','matthew',2,6,'canon','micah',5,3, 'free', E'*Therefore will he give them up, until the time that she which travaileth hath brought forth: then the remnant of his brethren shall return unto the children of Yashar''el (Israel)* (Micah 5:3). The very next breath of the Bethlehem oracle is two-house: the Ruler is born so that *the remnant of his brethren shall return* — Judah and Ephraim gathered, not a scattering but a homecoming.'),
  ('canon','matthew',2,2,'canon','numbers',24,17, 'free', E'*there shall come a Star out of Jacob, and a Sceptre shall rise out of Yashar''el (Israel)* (Numbers 24:17). Balaam — a foreign seer — saw a Star rise over Jacob and a Scepter with it. The wise men *from the east* read that ancient star-and-scepter word and came seeking the King; the nations themselves carry the prophecy home.'),
  ('canon','matthew',2,6,'canon','2-samuel',5,2, 'free', E'*Thou shalt feed my people Yashar''el (Israel), and thou shalt be a captain over Yashar''el (Israel)* (2 Samuel 5:2). The word over David at Hebron — *feed my people, be a captain* — is the same shepherd-Ruler word Micah folds into Bethlehem: *out of thee shall come a Governor, that shall rule my people Yashar''el (Israel)*. The Son of David shepherds the whole house.'),

  -- THREAD 2 — wise men from the east / gold, frankincense, myrrh (Matt 2:1-2,11)
  ('canon','matthew',2,11,'canon','isaiah',60,3, 'free', E'*And the Gentiles shall come to thy light, and kings to the brightness of thy rising* (Isaiah 60:3). The magi following the star are the first-fruits of this word — the nations drawn to the light risen over Yashar''el, kings bending toward the brightness.'),
  ('canon','matthew',2,11,'canon','isaiah',60,6, 'free', E'*all they from Sheba shall come: they shall bring gold and incense; and they shall shew forth the praises of Yahuah (LORD)* (Isaiah 60:6). Gold and incense from the east — Isaiah named the gifts centuries before the wise men *opened their treasures* and *presented unto him gifts; gold, and frankincense, and myrrh.*'),
  ('canon','matthew',2,11,'canon','psalms',72,10, 'free', E'*The kings of Tarshish and of the isles shall bring presents: the kings of Sheba and Seba shall offer gifts* (Psalm 72:10). The royal psalm of Solomon foresaw kings of far countries bringing tribute to the king''s Son — the magi kneeling with their gifts are this psalm answered.'),
  ('canon','matthew',2,11,'canon','psalms',72,11, 'free', E'*Yea, all kings shall fall down before him: all nations shall serve him* (Psalm 72:11). *They fell down, and worshipped him* — the wise men do exactly what the psalm foretold of every nation before the King. The worship of the nations begins at a manger.'),

  -- THREAD 3 — flight to Egypt / out of Egypt have I called my son (Matt 2:13-15)
  ('canon','matthew',2,15,'canon','hosea',11,1, 'free', E'*When Yashar''el (Israel) was a child, then I loved him, and called my son out of Egypt* (Hosea 11:1). Matthew quotes it: *Out of Egypt have I called my son.* In Hosea the son IS the nation — and Yahusha walks the nation''s whole road over again: down into Egypt, then called up out of it. He recapitulates Yashar''el, gathering the firstborn-people''s story into himself.'),
  ('canon','matthew',2,15,'canon','exodus',4,22, 'free', E'*Thus saith Yahuah (LORD), Yashar''el (Israel) is my son, even my firstborn* (Exodus 4:22). This is the root of Hosea''s *my son*: the nation is Yahuah''s firstborn. When the Formed Son comes out of Egypt, he steps into the firstborn-son calling of the whole house — not displacing Yashar''el but embodying her.'),
  ('canon','matthew',2,15,'apocrypha','the-wisdom-of-solomon',10,15, 'extras', E'*She delivered the righteous people and blameless seed from the nation that oppressed them* (Wisdom of Solomon 10:15). The old wisdom-witness remembered the Exodus as Wisdom delivering the *righteous people* out of Egypt — the same pattern now drawn up into one Child, called out of Egypt and kept safe from the king who sought his life.'),
  ('canon','matthew',2,15,'jasher','jasher',81,4, 'extras', E'*And at the end of two hundred and ten years, Yahuah (the Lord) brought forth the children of Israel from Egypt with a strong hand* (Jasher 81:4). Jasher keeps the memory of the going-up from Egypt with a strong hand. Yahusha''s own coming-up out of Egypt is that deliverance gathered into the Son — Yahuah bringing his firstborn home once more.'),

  -- THREAD 4 — Herod slays the children / Rachel weeping → restoration (Matt 2:16-18)
  ('canon','matthew',2,18,'canon','jeremiah',31,15, 'free', E'*A voice was heard in Ramah, lamentation, and bitter weeping; Rahel weeping for her children refused to be comforted for her children, because they were not* (Jeremiah 31:15). Matthew hears Rachel weeping again over Bethlehem''s slain little ones. But in Jeremiah this lament is the doorway, not the end — read on.'),
  ('canon','matthew',2,18,'canon','jeremiah',31,16, 'free', E'*Refrain thy voice from weeping, and thine eyes from tears: for thy work shall be rewarded, saith Yahuah (LORD); and they shall come again from the land of the enemy* (Jeremiah 31:16). The very next verse turns the weeping: *refrain thy voice... they shall come again.* Rachel''s tears are answered by the promise of return. The lament opens straight onto restoration.'),
  ('canon','matthew',2,18,'canon','jeremiah',31,17, 'free', E'*And there is hope in thine end, saith Yahuah (LORD), that thy children shall come again to their own border* (Jeremiah 31:17). *Hope in thine end* — *thy children shall come again.* Matthew anchors the grief of Bethlehem in a passage whose burden is homecoming. The mourning mother will see her children restored to their own border.'),
  ('canon','matthew',2,18,'canon','jeremiah',31,33, 'free', E'*I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people* (Jeremiah 31:33). The same chapter that holds Rachel''s tears holds the new-covenant promise — the Torah written on the heart, both houses gathered. The comfort Jeremiah promises is the very thing the Child Herod feared comes to give.'),

  -- THREAD 5 — return / He shall be called a Nazarene = the netzer Branch (Matt 2:19-23)
  ('canon','matthew',2,23,'canon','isaiah',11,1, 'free', E'*And there shall come forth a rod out of the stem of Jesse, and a Branch shall grow out of his roots* (Isaiah 11:1). *A Nazarene* — netzer, the Branch. Isaiah''s *Branch* (netzer) growing out of Jesse''s cut-down stem is the very word hidden in *Nazareth.* The despised town carries the prophet''s name for the Sprout of David.'),
  ('canon','matthew',2,23,'canon','judges',13,5, 'free', E'*the child shall be a Nazarite unto Elohim (God) from the womb: and he shall begin to deliver Yashar''el (Israel)* (Judges 13:5). The Nazarite Samson — set apart from the womb to *deliver Yashar''el* — sounds the second chord under *Nazarene*: a son consecrated from the womb to save his people. The deliverer-from-the-womb pattern is fulfilled in a greater Son.'),
  ('canon','matthew',2,23,'canon','isaiah',53,2, 'free', E'*For he shall grow up before him as a tender plant, and as a root out of a dry ground: he hath no form nor comeliness... no beauty that we should desire him* (Isaiah 53:2). The Branch grows up as a *tender plant... out of a dry ground* — lowly, overlooked, from despised Nazareth. The Sprout of Jesse comes without splendor, as the prophet said.'),
  ('canon','matthew',2,23,'canon','isaiah',53,3, 'free', E'*He is despised and rejected of men; a man of sorrows, and acquainted with grief... he was despised, and we esteemed him not* (Isaiah 53:3). *Can there any good thing come out of Nazareth?* — the despised town fits the despised Branch. To be called a Nazarene is already to be the rejected One of Isaiah 53, esteemed not by men.')

)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _mt02_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _mt02_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ── 3c. threads ────────────────────────────────────────────────────────────
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-2-bethlehem-the-star-born-king-the-ruler-out-of-judah-micah-5-numbers-24',
       E'And thou Bethlehem... out of thee shall come a Governor — the Ruler out of Judah (Micah 5; Numbers 24; 2 Samuel 5)',
       E'When the wise men ask *Where is he that is born King of the Yahudim (Jews)?* Herod''s own scribes answer out of the prophet. **Micah 5:2** names the place and the Person: *But thou, Beth-lehem Ephratah, though thou be little among the thousands of Yahudah (Judah), yet out of thee shall he come forth unto me that is to be ruler in Yashar''el (Israel); whose goings forth have been from of old, from everlasting.* The little town, the Ruler, the goings-forth from everlasting — this is the scepter-line of Judah come to its head. And the next breath is two-house: **Micah 5:3** — *then the remnant of his brethren shall return unto the children of Yashar''el (Israel)* — the Ruler is born so the scattered remnant comes home, Judah and Ephraim gathered, never one cast off. The star itself was sung long before by a foreign seer: **Numbers 24:17** — *there shall come a Star out of Jacob, and a Sceptre shall rise out of Yashar''el (Israel)* — so the magi from the east read Balaam''s star-and-scepter word and carried the prophecy back to its King. And the office is David''s own: **2 Samuel 5:2** — *Thou shalt feed my people Yashar''el (Israel), and thou shalt be a captain over Yashar''el (Israel)* — the same shepherd-Ruler word Micah folds into Bethlehem (*out of thee shall come a Governor, that shall rule my people Yashar''el*). The Son of David is born to shepherd the whole house.',
       sv.verse_id, ev.verse_id, 'free', 11030
  FROM _mt02_lookup sv, _mt02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=2 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=2 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-2-wise-men-from-the-east-gold-frankincense-myrrh-nations-to-the-king-isaiah-60-psalm-72',
       E'Wise men from the east — gold, frankincense and myrrh: the nations come to the King (Isaiah 60; Psalm 72)',
       E'The magi who *opened their treasures* and *presented unto him gifts; gold, and frankincense, and myrrh* are the first-fruits of a long-promised ingathering of the nations. **Isaiah 60:3** — *And the Gentiles shall come to thy light, and kings to the brightness of thy rising* — the nations drawn to the light risen over Yashar''el, exactly as a star drew the wise men. And Isaiah even named the gifts: **60:6** — *all they from Sheba shall come: they shall bring gold and incense; and they shall shew forth the praises of Yahuah (LORD).* Gold and incense from the east, centuries before the wise men brought them. The royal psalm sees the same procession: **Psalm 72:10** — *The kings of Tarshish and of the isles shall bring presents: the kings of Sheba and Seba shall offer gifts* — and **72:11** — *Yea, all kings shall fall down before him: all nations shall serve him.* When the magi *fell down, and worshipped him,* the psalm was answered before our eyes. This is not the nations replacing Yashar''el but the nations drawn to her light and her King — the worship of all peoples beginning at a manger.',
       sv.verse_id, ev.verse_id, 'free', 11033
  FROM _mt02_lookup sv, _mt02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=2 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=2 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-2-flight-to-egypt-out-of-egypt-have-i-called-my-son-hosea-11-exodus-4',
       E'Out of Egypt have I called my son — the Child recapitulates Israel the firstborn (Hosea 11; Exodus 4; Wisdom 10; Jasher 81)',
       E'When the angel sends Joseph to *flee into Egypt,* Matthew says it fulfilled *Out of Egypt have I called my son.* That is **Hosea 11:1** — *When Yashar''el (Israel) was a child, then I loved him, and called my son out of Egypt.* In Hosea the *son* IS the nation; and Yahusha walks the nation''s whole road over again — down into Egypt, then called up out of it — gathering the firstborn-people''s story into himself. He does not replace Yashar''el; he embodies her. The root of Hosea''s *my son* is **Exodus 4:22** — *Thus saith Yahuah (LORD), Yashar''el (Israel) is my son, even my firstborn.* The Formed Son steps into the firstborn-son calling of the whole house. The older witnesses remember the same deliverance: **Wisdom of Solomon 10:15** — *She delivered the righteous people and blameless seed from the nation that oppressed them* — and **Jasher 81:4** — *And at the end of two hundred and ten years, Yahuah (the Lord) brought forth the children of Israel from Egypt with a strong hand.* The Exodus pattern — the firstborn kept safe from a murderous king and brought up out of Egypt — is now drawn up into one Child, called out of Egypt and home again.',
       sv.verse_id, ev.verse_id, 'extras', 11036
  FROM _mt02_lookup sv, _mt02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=2 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=2 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-2-rachel-weeping-for-her-children-lament-that-opens-onto-restoration-jeremiah-31',
       E'Rachel weeping for her children — a lament that opens straight onto restoration (Jeremiah 31)',
       E'Herod''s slaughter of Bethlehem''s little ones makes Matthew hear an ancient cry: **Jeremiah 31:15** — *A voice was heard in Ramah, lamentation, and bitter weeping; Rahel weeping for her children refused to be comforted for her children, because they were not.* But in Jeremiah this weeping is a doorway, not the end — and we must read on, or we leave the mother in despair Scripture refuses to leave her in. **31:16** — *Refrain thy voice from weeping, and thine eyes from tears: for thy work shall be rewarded, saith Yahuah (LORD); and they shall come again from the land of the enemy.* The very next verse turns the tears: *they shall come again.* **31:17** — *And there is hope in thine end, saith Yahuah (LORD), that thy children shall come again to their own border.* Hope in the end; the children restored to their own border. And the whole chapter rests on the new-covenant promise: **31:33** — *I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people* — the Torah written on the heart, both houses gathered. The comfort Jeremiah promises is the very gift the Child Herod feared comes to bring. Rachel''s lament is real, but it opens onto homecoming, not despair.',
       sv.verse_id, ev.verse_id, 'free', 11039
  FROM _mt02_lookup sv, _mt02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=2 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=2 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-2-he-shall-be-called-a-nazarene-the-netzer-branch-isaiah-11-judges-13-isaiah-53',
       E'He shall be called a Nazarene — the netzer Branch out of Jesse, the despised One (Isaiah 11; Judges 13; Isaiah 53)',
       E'Joseph settles in *a city called Nazareth: that it might be fulfilled... He shall be called a Nazarene.* The word hides a prophecy. **Isaiah 11:1** — *And there shall come forth a rod out of the stem of Jesse, and a Branch shall grow out of his roots.* The Hebrew for *Branch* is netzer — the very root inside *Nazareth* and *Nazarene.* The despised little town carries the prophet''s name for the Sprout of David growing out of Jesse''s cut-down stem. A second chord sounds under the word: **Judges 13:5** — *the child shall be a Nazarite unto Elohim (God) from the womb: and he shall begin to deliver Yashar''el (Israel)* — a son set apart from the womb to deliver his people, the pattern now fulfilled in a greater Son. And the Branch comes lowly, as Isaiah foresaw: **53:2** — *For he shall grow up before him as a tender plant, and as a root out of a dry ground: he hath no form nor comeliness... no beauty that we should desire him* — and **53:3** — *He is despised and rejected of men; a man of sorrows, and acquainted with grief... he was despised, and we esteemed him not.* *Can there any good thing come out of Nazareth?* — the despised town fits the despised Branch perfectly. To be called a Nazarene is already to be the rejected, sorrow-acquainted Servant of Isaiah 53, the netzer that men esteemed not.',
       sv.verse_id, ev.verse_id, 'free', 11042
  FROM _mt02_lookup sv, _mt02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=2 AND sv.verse_number=19
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=2 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

-- ── 3d. thread_members ─────────────────────────────────────────────────────
-- THREAD 1 — Bethlehem / Ruler out of Judah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Micah 5:2 — *out of thee shall he come forth... that is to be ruler in Yashar''el; whose goings forth have been from of old, from everlasting* — the scribes'' own answer to Herod.'
  FROM cross_reference_threads t, cross_references x, _mt02_lookup sv, _mt02_lookup tv
 WHERE t.slug='matthew-2-bethlehem-the-star-born-king-the-ruler-out-of-judah-micah-5-numbers-24'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=2 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=5 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Micah 5:3 — *then the remnant of his brethren shall return unto the children of Yashar''el* — the Bethlehem oracle is two-house homecoming.'
  FROM cross_reference_threads t, cross_references x, _mt02_lookup sv, _mt02_lookup tv
 WHERE t.slug='matthew-2-bethlehem-the-star-born-king-the-ruler-out-of-judah-micah-5-numbers-24'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=2 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=5 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Numbers 24:17 — *there shall come a Star out of Jacob, and a Sceptre shall rise out of Yashar''el* — the star Balaam saw, which the magi followed.'
  FROM cross_reference_threads t, cross_references x, _mt02_lookup sv, _mt02_lookup tv
 WHERE t.slug='matthew-2-bethlehem-the-star-born-king-the-ruler-out-of-judah-micah-5-numbers-24'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=2 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=24 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Samuel 5:2 — *Thou shalt feed my people Yashar''el, and thou shalt be a captain over Yashar''el* — the shepherd-Ruler office of David, fulfilled in his greater Son.'
  FROM cross_reference_threads t, cross_references x, _mt02_lookup sv, _mt02_lookup tv
 WHERE t.slug='matthew-2-bethlehem-the-star-born-king-the-ruler-out-of-judah-micah-5-numbers-24'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=2 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=5 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 — wise men / gold frankincense myrrh
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 60:3 — *And the Gentiles shall come to thy light, and kings to the brightness of thy rising* — the nations drawn to the risen light, as the star drew the magi.'
  FROM cross_reference_threads t, cross_references x, _mt02_lookup sv, _mt02_lookup tv
 WHERE t.slug='matthew-2-wise-men-from-the-east-gold-frankincense-myrrh-nations-to-the-king-isaiah-60-psalm-72'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=2 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=60 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 60:6 — *they shall bring gold and incense; and they shall shew forth the praises of Yahuah* — the gifts named centuries before the magi brought them.'
  FROM cross_reference_threads t, cross_references x, _mt02_lookup sv, _mt02_lookup tv
 WHERE t.slug='matthew-2-wise-men-from-the-east-gold-frankincense-myrrh-nations-to-the-king-isaiah-60-psalm-72'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=2 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=60 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 72:10 — *The kings of Tarshish and of the isles shall bring presents: the kings of Sheba and Seba shall offer gifts* — kings of far countries bringing tribute to the King''s Son.'
  FROM cross_reference_threads t, cross_references x, _mt02_lookup sv, _mt02_lookup tv
 WHERE t.slug='matthew-2-wise-men-from-the-east-gold-frankincense-myrrh-nations-to-the-king-isaiah-60-psalm-72'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=2 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=72 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 72:11 — *Yea, all kings shall fall down before him: all nations shall serve him* — answered when the wise men fell down and worshipped him.'
  FROM cross_reference_threads t, cross_references x, _mt02_lookup sv, _mt02_lookup tv
 WHERE t.slug='matthew-2-wise-men-from-the-east-gold-frankincense-myrrh-nations-to-the-king-isaiah-60-psalm-72'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=2 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=72 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 — out of Egypt
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hosea 11:1 — *When Yashar''el was a child, then I loved him, and called my son out of Egypt* — the verse Matthew quotes; the son IS the nation, recapitulated in the Child.'
  FROM cross_reference_threads t, cross_references x, _mt02_lookup sv, _mt02_lookup tv
 WHERE t.slug='matthew-2-flight-to-egypt-out-of-egypt-have-i-called-my-son-hosea-11-exodus-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=2 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=11 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 4:22 — *Yashar''el is my son, even my firstborn* — the root of Hosea''s *my son*; the Formed Son embodies the firstborn-people.'
  FROM cross_reference_threads t, cross_references x, _mt02_lookup sv, _mt02_lookup tv
 WHERE t.slug='matthew-2-flight-to-egypt-out-of-egypt-have-i-called-my-son-hosea-11-exodus-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=2 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=4 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Wisdom of Solomon 10:15 — *She delivered the righteous people and blameless seed from the nation that oppressed them* — the Exodus remembered as deliverance of the righteous people.'
  FROM cross_reference_threads t, cross_references x, _mt02_lookup sv, _mt02_lookup tv
 WHERE t.slug='matthew-2-flight-to-egypt-out-of-egypt-have-i-called-my-son-hosea-11-exodus-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=2 AND sv.verse_number=15
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=10 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jasher 81:4 — *Yahuah brought forth the children of Israel from Egypt with a strong hand* — the going-up from Egypt, gathered into the Son called out of Egypt.'
  FROM cross_reference_threads t, cross_references x, _mt02_lookup sv, _mt02_lookup tv
 WHERE t.slug='matthew-2-flight-to-egypt-out-of-egypt-have-i-called-my-son-hosea-11-exodus-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=2 AND sv.verse_number=15
   AND tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=81 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 — Rachel weeping → restoration
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 31:15 — *Rahel weeping for her children refused to be comforted... because they were not* — the cry Matthew hears over Bethlehem; the doorway, not the end.'
  FROM cross_reference_threads t, cross_references x, _mt02_lookup sv, _mt02_lookup tv
 WHERE t.slug='matthew-2-rachel-weeping-for-her-children-lament-that-opens-onto-restoration-jeremiah-31'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=2 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 31:16 — *Refrain thy voice from weeping... they shall come again from the land of the enemy* — the very next verse turns the tears to return.'
  FROM cross_reference_threads t, cross_references x, _mt02_lookup sv, _mt02_lookup tv
 WHERE t.slug='matthew-2-rachel-weeping-for-her-children-lament-that-opens-onto-restoration-jeremiah-31'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=2 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 31:17 — *there is hope in thine end... thy children shall come again to their own border* — the lament resolved in homecoming.'
  FROM cross_reference_threads t, cross_references x, _mt02_lookup sv, _mt02_lookup tv
 WHERE t.slug='matthew-2-rachel-weeping-for-her-children-lament-that-opens-onto-restoration-jeremiah-31'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=2 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jeremiah 31:33 — *I will put my law in their inward parts, and write it in their hearts* — the new-covenant comfort the same chapter promises, both houses gathered.'
  FROM cross_reference_threads t, cross_references x, _mt02_lookup sv, _mt02_lookup tv
 WHERE t.slug='matthew-2-rachel-weeping-for-her-children-lament-that-opens-onto-restoration-jeremiah-31'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=2 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 — Nazarene / netzer Branch
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 11:1 — *a Branch shall grow out of his roots* — netzer, the very root inside Nazareth/Nazarene; the Sprout of Jesse.'
  FROM cross_reference_threads t, cross_references x, _mt02_lookup sv, _mt02_lookup tv
 WHERE t.slug='matthew-2-he-shall-be-called-a-nazarene-the-netzer-branch-isaiah-11-judges-13-isaiah-53'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=2 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Judges 13:5 — *the child shall be a Nazarite... and he shall begin to deliver Yashar''el* — the deliverer-from-the-womb pattern under the word Nazarene.'
  FROM cross_reference_threads t, cross_references x, _mt02_lookup sv, _mt02_lookup tv
 WHERE t.slug='matthew-2-he-shall-be-called-a-nazarene-the-netzer-branch-isaiah-11-judges-13-isaiah-53'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=2 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=13 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 53:2 — *he shall grow up... as a root out of a dry ground: he hath no form nor comeliness* — the Branch comes lowly, from despised Nazareth.'
  FROM cross_reference_threads t, cross_references x, _mt02_lookup sv, _mt02_lookup tv
 WHERE t.slug='matthew-2-he-shall-be-called-a-nazarene-the-netzer-branch-isaiah-11-judges-13-isaiah-53'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=2 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 53:3 — *He is despised and rejected of men... and we esteemed him not* — to be a Nazarene is to be the rejected Servant; *can any good thing come out of Nazareth?*'
  FROM cross_reference_threads t, cross_references x, _mt02_lookup sv, _mt02_lookup tv
 WHERE t.slug='matthew-2-he-shall-be-called-a-nazarene-the-netzer-branch-isaiah-11-judges-13-isaiah-53'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=2 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
