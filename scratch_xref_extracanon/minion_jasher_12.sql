-- ----- fragment: minion_jasher_12.sql (session252 jasher 12) -----
-- Source anchor: jasher/jasher ch12. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja12 (view _session252_ja12_lookup). Sort band base 55275, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja12_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-12-furnace-deliverance
  ('jasher', 'jasher', 12, 6, 'canon', 'daniel', 3, 6, 'free', E'Daniel 3:6 — *And whoso falleth not down and worshippeth shall the same hour be cast into the midst of a burning fiery furnace.* Nimrod''s brick furnace prepared three days and nights (Jasher 12:6) is the same king-of-man instrument Nebuchadnezzar wields against those who will not worship the image.'),
  ('jasher', 'jasher', 12, 26, 'canon', 'daniel', 3, 22, 'free', E'Daniel 3:22 — *Therefore because the king''s commandment was urgent, and the furnace exceeding hot, the flame of the fire slew those men that took up Shadrach, Meshach, and Abed-nego.* As the flame slays Nebuchadnezzar''s executioners, so the fire spreads over Nimrod''s servants and twelve of them die while Abram walks unharmed (Jasher 12:26).'),
  ('jasher', 'jasher', 12, 27, 'canon', 'daniel', 3, 27, 'free', E'Daniel 3:27 — *And the princes, governors, and captains, and the king''s counsellors, being gathered together, saw these men, upon whose bodies the fire had no power, nor was an hair of their head singed, neither were their coats changed, nor the smell of fire had passed on them.* The same wonder the king''s princes report of Abram, whose garments are unburned though the binding cord is consumed (Jasher 12:27).'),
  ('jasher', 'jasher', 12, 25, 'canon', 'isaiah', 43, 2, 'free', E'Isaiah 43:2 — *When thou passest through the waters, I will be with thee; and through the rivers, they shall not overflow thee: when thou walkest through the fire, thou shalt not be burned; neither shall the flame kindle upon thee.* The covenant word the legend dramatizes as Abram remains and walks about in the fire (Jasher 12:25).'),
  ('jasher', 'jasher', 12, 24, 'canon', 'hebrews', 11, 34, 'free', E'Hebrews 11:34 — *Quenched the violence of fire, escaped the edge of the sword, out of weakness were made strong, waxed valiant in fight, turned to flight the armies of the aliens.* The faith-roll''s quenched fire, the same deliverance Yahuah works for Abram when he came down and the man was not burned (Jasher 12:24).'),
  -- thread: jasher-12-nimrod-slay-the-seed
  ('jasher', 'jasher', 12, 16, 'canon', 'exodus', 1, 16, 'free', E'Exodus 1:16 — *And he said, When ye do the office of a midwife to the Hebrew women, and see them upon the stools; if it be a son, then ye shall kill him: but if it be a daughter, then she shall live.* Pharaoh''s decree against the Hebrew sons is the same king-of-man terror that made Nimrod kill the substituted child and seek Abram''s death (Jasher 12:10, 16).'),
  ('jasher', 'jasher', 12, 58, 'canon', 'matthew', 2, 13, 'free', E'Matthew 2:13 — *Arise, and take the young child and his mother, and flee into Egypt, and be thou there until I bring thee word: for Herod will seek the young child to destroy him.* Herod''s hunt for the child mirrors Nimrod sending servants in secret to seize Abram and put him to death (Jasher 12:58).'),
  ('jasher', 'jasher', 12, 55, 'canon', 'revelation', 12, 4, 'free', E'Revelation 12:4 — *And his tail drew the third part of the stars of heaven, and did cast them to the earth: and the dragon stood before the woman which was ready to be delivered, for to devour her child as soon as it was born.* The dragon waiting to devour the child is the same star-and-slaughter pattern Nimrod''s seers read, the seed of Abram that will slay the king in latter days (Jasher 12:55).'),
  ('jasher', 'jasher', 12, 53, 'canon', 'psalms', 105, 14, 'free', E'Psalm 105:14 — *He suffered no man to do them wrong: yea, he reproved kings for their sakes.* Yahuah''s guard over the patriarchs against kings answers the counsellor''s threat that Abram''s seed will war with and smite the king''s hosts (Jasher 12:53).'),
  -- thread: jasher-12-haran-dies-ur
  ('jasher', 'jasher', 12, 26, 'canon', 'genesis', 11, 28, 'free', E'Genesis 11:28 — *And Haran died before his father Terah in the land of his nativity, in Ur of the Chaldees.* The bare canon record that Jasher fills out — Haran burned to ashes in the fire of Casdim because his heart was not perfect with Yahuah (Jasher 12:26).'),
  ('jasher', 'jasher', 12, 44, 'canon', 'genesis', 11, 29, 'free', E'Genesis 11:29 — *And Abram and Nahor took them wives: the name of Abram''s wife was Sarai; and the name of Nahor''s wife, Milcah, the daughter of Haran, the father of Milcah, and the father of Iscah.* The same double marriage of the brothers to Haran''s daughters that Jasher records (Jasher 12:44).'),
  ('jasher', 'jasher', 12, 44, 'canon', 'genesis', 11, 30, 'free', E'Genesis 11:30 — *But Sarai was barren; she had no child.* The same note Jasher carries, that Sarai was barren and had no offspring in those days (Jasher 12:44).'),
  -- thread: jasher-12-abram-called-out-of-ur
  ('jasher', 'jasher', 12, 65, 'canon', 'joshua', 24, 2, 'free', E'Joshua 24:2 — *And Joshua said unto all the people, Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods.* The idolatrous land Abram begs Terah to leave for Canaan (Jasher 12:65) is the very world Joshua names — the fathers served other gods beyond the river.'),
  ('jasher', 'jasher', 12, 42, 'canon', 'isaiah', 51, 2, 'free', E'Isaiah 51:2 — *Look unto Abraham your father, and unto Sarah that bare you: for I called him alone, and blessed him, and increased him.* Called alone — election before confession, the same Abram who from that day served Yahuah all his days and inclined men''s hearts to Him (Jasher 12:42-43).'),
  ('jasher', 'jasher', 12, 68, 'canon', 'acts', 7, 2, 'free', E'Acts 7:2 — *And he said, Men, brethren, and fathers, hearken; The Elohim (God) of glory appeared unto our father Abraham, when he was in Mesopotamia, before he dwelt in Charran.* Stephen sets the call in Mesopotamia before Haran, the same flight from Nimrod''s reach toward Canaan that Abram urges on Terah (Jasher 12:68).'),
  ('jasher', 'jasher', 12, 68, 'canon', 'genesis', 12, 1, 'free', E'Genesis 12:1 — *Now Yahuah (LORD) had said unto Abram, Get thee out of thy country, and from thy kindred, and from thy father''s house, unto a land that I will shew thee.* The canon call that Jasher dramatizes as Abram''s plea to leave the land of Nimrod and go to Canaan (Jasher 12:68).'),
  ('jasher', 'jasher', 12, 42, 'canon', 'hebrews', 11, 8, 'free', E'Hebrews 11:8 — *By faith Abraham, when he was called to go out into a place which he should after receive for an inheritance, obeyed; and he went out, not knowing whither he went.* The faith that walked in Yahuah''s ways and followed His law all Abram''s days (Jasher 12:42) is the faith that obeyed the call.'),
  -- thread: jasher-12-jubilees-self-link
  ('jasher', 'jasher', 12, 26, 'jubilees', 'jubilees', 12, 14, 'extras', E'Jubilees 12:14 — *And Haran hasted to save them, but the fire flamed over him, and he was burnt in the fire, and he died in Ur of the Chaldees before Terah his father, and they buried him in Ur of the Chaldees...* The same death of Haran by fire in the Chaldees that Jasher records, his heart not perfect with Yahuah (Jasher 12:26).'),
  ('jasher', 'jasher', 12, 44, 'jubilees', 'jubilees', 12, 9, 'extras', E'Jubilees 12:9 — *And in the fortieth jubilee, in the second week, in the seventh year thereof, Abram took to himself a wife, and her name was Sarai, the daughter of his father, and she became his wife.* The same marriage of Abram to Sarai that Jasher records alongside Nahor''s to Milca (Jasher 12:44).'),
  ('jasher', 'jasher', 12, 68, 'jubilees', 'jubilees', 12, 2, 'extras', E'Jubilees 12:2 — *What help and profit have we from those idols which you do worship, And before which you do bow yourself? For there is no spirit in them, For they are dumb forms, and a misleading of the heart. Worship them not: Worship the Elohim (God) of heaven, Who causes the rain and the dew to descend on the earth...* Abram''s idol-polemic to his father, the same plea Jasher gives him to cast away the vain things and serve Yahuah (Jasher 12:68).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja12_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja12_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-12-furnace-deliverance',
       E'Cast into the fire and not burned — the refuse-to-bow witness',
       E'Nimrod''s sages decree the chosen man must die in the flames: *And they all answered the king saying, The man who reviles the king should be hanged upon a tree; but having done all the things that he said, and having despised our gods, he must therefore be burned to death, for this is the law in this matter.* (Jasher 12:5). They bind Abram and cast him in — *And they bound their hands and feet with linen cords, and the servants of the king lifted them up and cast them both into the furnace.* (Jasher 12:23) — but Yahuah comes down and Abram walks unharmed: *And Abram walked in the midst of the fire three days and three nights... and even the lower garments which are upon him are not burned, but the cord with which he was bound is burned.* (Jasher 12:27). It ain''t new — the same architecture recurs in Babylon, where a later king-of-man builds an idol, decrees the furnace, and three who will not bow are cast in: *And whoso falleth not down and worshippeth shall the same hour be cast into the midst of a burning fiery furnace.* (Daniel 3:6); *Therefore because the king''s commandment was urgent, and the furnace exceeding hot, the flame of the fire slew those men that took up Shadrach, Meshach, and Abed-nego.* (Daniel 3:22), exactly as the flame here slays twelve of Nimrod''s men (Jasher 12:26); and the deliverance is identical: *And the princes, governors, and captains, and the king''s counsellors, being gathered together, saw these men, upon whose bodies the fire had no power, nor was an hair of their head singed, neither were their coats changed, nor the smell of fire had passed on them.* (Daniel 3:27). The prophets name the covenant promise the legend dramatizes — *when thou walkest through the fire, thou shalt not be burned; neither shall the flame kindle upon thee.* (Isaiah 43:2) — and the faith-roll counts it among the elect: *Quenched the violence of fire, escaped the edge of the sword, out of weakness were made strong, waxed valiant in fight, turned to flight the armies of the aliens.* (Hebrews 11:34). The kingdom-of-man commands worship and the chosen seed refuses; the fire bows, not the witness.',
       sv.verse_id, ev.verse_id, 'extras', 55275
  FROM _session252_ja12_lookup sv, _session252_ja12_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=12 AND sv.verse_number=5
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=12 AND ev.verse_number=35
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-12-nimrod-slay-the-seed',
       E'Nimrod''s dream — the king-of-man who would slay the chosen seed',
       E'Two years later the tyrant dreams of a man like Abram coming forth from the furnace with a drawn sword, and his counsellor reads it as the seed-war: *And behold the day will come when Abram and his seed and the children of his household will war with my king, and they will smite all the king''s hosts and his troops.* (Jasher 12:53). So Nimrod resolves what every kingdom-of-man resolves against the seed — *And Nimrod hearkened to the voice of Anuki, and he sent some of his servants in secret to go and seize Abram, and bring him before the king to suffer death.* (Jasher 12:58). It ain''t new: it is the antichrist pattern that runs the whole canon. Pharaoh decrees the death of the Hebrew sons — *And he said, When ye do the office of a midwife to the Hebrew women, and see them upon the stools; if it be a son, then ye shall kill him: but if it be a daughter, then she shall live.* (Exodus 1:16); Herod hunts the child — *Arise, and take the young child and his mother, and flee into Egypt, and be thou there until I bring thee word: for Herod will seek the young child to destroy him.* (Matthew 2:13); and behind every throne stands the dragon — *And his tail drew the third part of the stars of heaven, and did cast them to the earth: and the dragon stood before the woman which was ready to be delivered, for to devour her child as soon as it was born.* (Revelation 12:4), the same star-and-slaughter omen Nimrod''s conjurors first read at Abram''s birth. But Yahuah guards the seed against the kings: *He suffered no man to do them wrong: yea, he reproved kings for their sakes.* (Psalm 105:14). The tyrant slays the seed; the seed is kept.',
       sv.verse_id, ev.verse_id, 'extras', 55278
  FROM _session252_ja12_lookup sv, _session252_ja12_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=12 AND sv.verse_number=45
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=12 AND ev.verse_number=58
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-12-haran-dies-ur',
       E'Haran dead in Ur, Sarai barren — Jasher fills out Genesis 11',
       E'Where Jasher gives the legend, Genesis gives the bare record it expands. Abram''s brother dies in the fire of the Chaldees: *And Haran died when they had cast him into the fire, and he was burned to ashes, for his heart was not perfect with Yahuah (the Lord)... and twelve men of them died.* (Jasher 12:26), and Abram and Nahor marry: *And at that time Nahor and Abram took to themselves wives, the daughters of their brother Haran; the wife of Nahor was Milca and the name of Abram''s wife was Sarai. And Sarai, wife of Abram, was barren; she had no offspring in those days.* (Jasher 12:44). It ain''t new — this is Genesis told straight: *Now these are the generations of Terah: Terah begat Abram, Nahor, and Haran; and Haran begat Lot.* (Genesis 11:27); *And Haran died before his father Terah in the land of his nativity, in Ur of the Chaldees.* (Genesis 11:28) — Jasher only tells us how Haran died and why; *And Abram and Nahor took them wives: the name of Abram''s wife was Sarai; and the name of Nahor''s wife, Milcah, the daughter of Haran, the father of Milcah, and the father of Iscah.* (Genesis 11:29); *But Sarai was barren; she had no child.* (Genesis 11:30). The retelling carries the canon, name for name.',
       sv.verse_id, ev.verse_id, 'extras', 55281
  FROM _session252_ja12_lookup sv, _session252_ja12_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=12 AND sv.verse_number=26
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=12 AND ev.verse_number=44
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-12-abram-called-out-of-ur',
       E'Get thee out — the election of Abram from the idolatrous world',
       E'Delivered from the fire, Abram does not found a religion; he serves Yahuah and draws others, then urges his father to leave the land of the tyrant: *And Abram returned on that day and went to his father''s house, he and the men that followed him, and Abram served Yahuah his Elohim (the Lord his God) all the days of his life, and he walked in his ways and followed his law.* (Jasher 12:42); *Now therefore hearken to my voice, and let us arise and go to the land of Canaan, out of the reach of injury from Nimrod; and serve you Yahuah (the Lord) who created you in the earth and it will be well with you; and cast away all the vain things which you pursue.* (Jasher 12:68). It ain''t new — this is the election the canon names: Yahuah took Abram out of the world that served other gods, *Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods. And I took your father Abraham from the other side of the flood* (Joshua 24:2-3); *Look unto Abraham your father, and unto Sarah that bare you: for I called him alone, and blessed him, and increased him.* (Isaiah 51:2) — called alone, election before any confession; *The Elohim (God) of glory appeared unto our father Abraham, when he was in Mesopotamia, before he dwelt in Charran* (Acts 7:2); and the call itself: *Now Yahuah (LORD) had said unto Abram, Get thee out of thy country, and from thy kindred, and from thy father''s house, unto a land that I will shew thee* (Genesis 12:1). The seed is chosen and kept out of the idolatrous world — not a church, the covenant line.',
       sv.verse_id, ev.verse_id, 'extras', 55284
  FROM _session252_ja12_lookup sv, _session252_ja12_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=12 AND sv.verse_number=42
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=12 AND ev.verse_number=68
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-12-jubilees-self-link',
       E'The same events in Jubilees — Haran in the fire, the wife, the call',
       E'Jasher narrates the very events the Jubilees apparatus carries, and the two confirm each other. Haran dies in the fire of the Chaldees: *And Haran died when they had cast him into the fire, and he was burned to ashes, for his heart was not perfect with Yahuah (the Lord)* (Jasher 12:26) — Jubilees gives the same death by fire in Ur: *And Haran hasted to save them, but the fire flamed over him, and he was burnt in the fire, and he died in Ur of the Chaldees before Terah his father, and they buried him in Ur of the Chaldees...* (Jubilees 12:14). Abram takes Sarai to wife: *the wife of Nahor was Milca and the name of Abram''s wife was Sarai* (Jasher 12:44) — *And in the fortieth jubilee, in the second week, in the seventh year thereof, Abram took to himself a wife, and her name was Sarai, the daughter of his father, and she became his wife.* (Jubilees 12:9). And Abram urges Terah to forsake the idols and follow Yahuah — *serve you Yahuah (the Lord) who created you in the earth... and cast away all the vain things which you pursue* (Jasher 12:68) — exactly as Jubilees has him plead: *Worship the Elohim (God) of heaven, Who causes the rain and the dew to descend on the earth... Why do you worship things that have no spirit in them? For they are the work of (men''s) hands...* (Jubilees 12:2). Two witnesses to the one covenant story — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55287
  FROM _session252_ja12_lookup sv, _session252_ja12_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=12 AND sv.verse_number=26
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=12 AND ev.verse_number=68
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-12-furnace-deliverance
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 3:6 — *And whoso falleth not down and worshippeth shall the same hour be cast into the midst of a burning fiery furnace.* Nimrod''s brick furnace prepared three days and nights (Jasher 12:6) is the same king-of-man instrument Nebuchadnezzar wields against those who will not worship the image.'
  FROM cross_reference_threads t, cross_references x, _session252_ja12_lookup sv, _session252_ja12_lookup tv
 WHERE t.slug='jasher-12-furnace-deliverance'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=12 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=3 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 3:22 — *Therefore because the king''s commandment was urgent, and the furnace exceeding hot, the flame of the fire slew those men that took up Shadrach, Meshach, and Abed-nego.* As the flame slays Nebuchadnezzar''s executioners, so the fire spreads over Nimrod''s servants and twelve of them die while Abram walks unharmed (Jasher 12:26).'
  FROM cross_reference_threads t, cross_references x, _session252_ja12_lookup sv, _session252_ja12_lookup tv
 WHERE t.slug='jasher-12-furnace-deliverance'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=12 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=3 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 3:27 — *And the princes, governors, and captains, and the king''s counsellors, being gathered together, saw these men, upon whose bodies the fire had no power, nor was an hair of their head singed, neither were their coats changed, nor the smell of fire had passed on them.* The same wonder the king''s princes report of Abram, whose garments are unburned though the binding cord is consumed (Jasher 12:27).'
  FROM cross_reference_threads t, cross_references x, _session252_ja12_lookup sv, _session252_ja12_lookup tv
 WHERE t.slug='jasher-12-furnace-deliverance'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=12 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=3 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 43:2 — *When thou passest through the waters, I will be with thee; and through the rivers, they shall not overflow thee: when thou walkest through the fire, thou shalt not be burned; neither shall the flame kindle upon thee.* The covenant word the legend dramatizes as Abram remains and walks about in the fire (Jasher 12:25).'
  FROM cross_reference_threads t, cross_references x, _session252_ja12_lookup sv, _session252_ja12_lookup tv
 WHERE t.slug='jasher-12-furnace-deliverance'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=12 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=43 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Hebrews 11:34 — *Quenched the violence of fire, escaped the edge of the sword, out of weakness were made strong, waxed valiant in fight, turned to flight the armies of the aliens.* The faith-roll''s quenched fire, the same deliverance Yahuah works for Abram when he came down and the man was not burned (Jasher 12:24).'
  FROM cross_reference_threads t, cross_references x, _session252_ja12_lookup sv, _session252_ja12_lookup tv
 WHERE t.slug='jasher-12-furnace-deliverance'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=12 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-12-nimrod-slay-the-seed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 1:16 — *And he said, When ye do the office of a midwife to the Hebrew women, and see them upon the stools; if it be a son, then ye shall kill him: but if it be a daughter, then she shall live.* Pharaoh''s decree against the Hebrew sons is the same king-of-man terror that made Nimrod kill the substituted child and seek Abram''s death (Jasher 12:10, 16).'
  FROM cross_reference_threads t, cross_references x, _session252_ja12_lookup sv, _session252_ja12_lookup tv
 WHERE t.slug='jasher-12-nimrod-slay-the-seed'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=12 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 2:13 — *Arise, and take the young child and his mother, and flee into Egypt, and be thou there until I bring thee word: for Herod will seek the young child to destroy him.* Herod''s hunt for the child mirrors Nimrod sending servants in secret to seize Abram and put him to death (Jasher 12:58).'
  FROM cross_reference_threads t, cross_references x, _session252_ja12_lookup sv, _session252_ja12_lookup tv
 WHERE t.slug='jasher-12-nimrod-slay-the-seed'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=12 AND sv.verse_number=58
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=2 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 12:4 — *And his tail drew the third part of the stars of heaven, and did cast them to the earth: and the dragon stood before the woman which was ready to be delivered, for to devour her child as soon as it was born.* The dragon waiting to devour the child is the same star-and-slaughter pattern Nimrod''s seers read, the seed of Abram that will slay the king in latter days (Jasher 12:55).'
  FROM cross_reference_threads t, cross_references x, _session252_ja12_lookup sv, _session252_ja12_lookup tv
 WHERE t.slug='jasher-12-nimrod-slay-the-seed'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=12 AND sv.verse_number=55
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 105:14 — *He suffered no man to do them wrong: yea, he reproved kings for their sakes.* Yahuah''s guard over the patriarchs against kings answers the counsellor''s threat that Abram''s seed will war with and smite the king''s hosts (Jasher 12:53).'
  FROM cross_reference_threads t, cross_references x, _session252_ja12_lookup sv, _session252_ja12_lookup tv
 WHERE t.slug='jasher-12-nimrod-slay-the-seed'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=12 AND sv.verse_number=53
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=105 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-12-haran-dies-ur
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 11:28 — *And Haran died before his father Terah in the land of his nativity, in Ur of the Chaldees.* The bare canon record that Jasher fills out — Haran burned to ashes in the fire of Casdim because his heart was not perfect with Yahuah (Jasher 12:26).'
  FROM cross_reference_threads t, cross_references x, _session252_ja12_lookup sv, _session252_ja12_lookup tv
 WHERE t.slug='jasher-12-haran-dies-ur'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=12 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 11:29 — *And Abram and Nahor took them wives: the name of Abram''s wife was Sarai; and the name of Nahor''s wife, Milcah, the daughter of Haran, the father of Milcah, and the father of Iscah.* The same double marriage of the brothers to Haran''s daughters that Jasher records (Jasher 12:44).'
  FROM cross_reference_threads t, cross_references x, _session252_ja12_lookup sv, _session252_ja12_lookup tv
 WHERE t.slug='jasher-12-haran-dies-ur'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=12 AND sv.verse_number=44
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 11:30 — *But Sarai was barren; she had no child.* The same note Jasher carries, that Sarai was barren and had no offspring in those days (Jasher 12:44).'
  FROM cross_reference_threads t, cross_references x, _session252_ja12_lookup sv, _session252_ja12_lookup tv
 WHERE t.slug='jasher-12-haran-dies-ur'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=12 AND sv.verse_number=44
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-12-abram-called-out-of-ur
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 24:2 — *And Joshua said unto all the people, Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods.* The idolatrous land Abram begs Terah to leave for Canaan (Jasher 12:65) is the very world Joshua names — the fathers served other gods beyond the river.'
  FROM cross_reference_threads t, cross_references x, _session252_ja12_lookup sv, _session252_ja12_lookup tv
 WHERE t.slug='jasher-12-abram-called-out-of-ur'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=12 AND sv.verse_number=65
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 51:2 — *Look unto Abraham your father, and unto Sarah that bare you: for I called him alone, and blessed him, and increased him.* Called alone — election before confession, the same Abram who from that day served Yahuah all his days and inclined men''s hearts to Him (Jasher 12:42-43).'
  FROM cross_reference_threads t, cross_references x, _session252_ja12_lookup sv, _session252_ja12_lookup tv
 WHERE t.slug='jasher-12-abram-called-out-of-ur'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=12 AND sv.verse_number=42
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=51 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 7:2 — *And he said, Men, brethren, and fathers, hearken; The Elohim (God) of glory appeared unto our father Abraham, when he was in Mesopotamia, before he dwelt in Charran.* Stephen sets the call in Mesopotamia before Haran, the same flight from Nimrod''s reach toward Canaan that Abram urges on Terah (Jasher 12:68).'
  FROM cross_reference_threads t, cross_references x, _session252_ja12_lookup sv, _session252_ja12_lookup tv
 WHERE t.slug='jasher-12-abram-called-out-of-ur'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=12 AND sv.verse_number=68
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 12:1 — *Now Yahuah (LORD) had said unto Abram, Get thee out of thy country, and from thy kindred, and from thy father''s house, unto a land that I will shew thee.* The canon call that Jasher dramatizes as Abram''s plea to leave the land of Nimrod and go to Canaan (Jasher 12:68).'
  FROM cross_reference_threads t, cross_references x, _session252_ja12_lookup sv, _session252_ja12_lookup tv
 WHERE t.slug='jasher-12-abram-called-out-of-ur'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=12 AND sv.verse_number=68
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Hebrews 11:8 — *By faith Abraham, when he was called to go out into a place which he should after receive for an inheritance, obeyed; and he went out, not knowing whither he went.* The faith that walked in Yahuah''s ways and followed His law all Abram''s days (Jasher 12:42) is the faith that obeyed the call.'
  FROM cross_reference_threads t, cross_references x, _session252_ja12_lookup sv, _session252_ja12_lookup tv
 WHERE t.slug='jasher-12-abram-called-out-of-ur'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=12 AND sv.verse_number=42
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-12-jubilees-self-link
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jubilees 12:14 — *And Haran hasted to save them, but the fire flamed over him, and he was burnt in the fire, and he died in Ur of the Chaldees before Terah his father, and they buried him in Ur of the Chaldees...* The same death of Haran by fire in the Chaldees that Jasher records, his heart not perfect with Yahuah (Jasher 12:26).'
  FROM cross_reference_threads t, cross_references x, _session252_ja12_lookup sv, _session252_ja12_lookup tv
 WHERE t.slug='jasher-12-jubilees-self-link'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=12 AND sv.verse_number=26
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=12 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 12:9 — *And in the fortieth jubilee, in the second week, in the seventh year thereof, Abram took to himself a wife, and her name was Sarai, the daughter of his father, and she became his wife.* The same marriage of Abram to Sarai that Jasher records alongside Nahor''s to Milca (Jasher 12:44).'
  FROM cross_reference_threads t, cross_references x, _session252_ja12_lookup sv, _session252_ja12_lookup tv
 WHERE t.slug='jasher-12-jubilees-self-link'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=12 AND sv.verse_number=44
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=12 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 12:2 — *What help and profit have we from those idols which you do worship, And before which you do bow yourself? For there is no spirit in them, For they are dumb forms, and a misleading of the heart. Worship them not: Worship the Elohim (God) of heaven, Who causes the rain and the dew to descend on the earth...* Abram''s idol-polemic to his father, the same plea Jasher gives him to cast away the vain things and serve Yahuah (Jasher 12:68).'
  FROM cross_reference_threads t, cross_references x, _session252_ja12_lookup sv, _session252_ja12_lookup tv
 WHERE t.slug='jasher-12-jubilees-self-link'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=12 AND sv.verse_number=68
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

