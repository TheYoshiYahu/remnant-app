-- ----- fragment: minion_2maccabees_15.sql (session253 2-maccabees 15) -----
-- Source anchor: apocrypha/2-maccabees ch15. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2mac15 (view _session253_2mac15_lookup). Sort band base 62350, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2mac15_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-maccabees-15-sabbath-kept
  ('apocrypha', '2-maccabees', 15, 4, 'canon', 'exodus', 31, 16, 'free', E'Exodus 31:16 — *Wherefore the children of Yashar''el (Israel) shall keep the sabbath, to observe the sabbath throughout their generations, for a perpetual covenant.* The seventh-day rest the Yahudim confess before Nicanor is the perpetual sign of the covenant given at Sinai, not a yoke to be set aside under threat.'),
  ('apocrypha', '2-maccabees', 15, 2, 'canon', 'exodus', 20, 11, 'free', E'Exodus 20:11 — *For in six days Yahuah (LORD) made heaven and earth, the sea, and all that in them is, and rested the seventh day: wherefore Yahuah (LORD) blessed the sabbath day, and hallowed it.* The One who ''seeth all things'' has ''honoured with holiness above all other days'' the very day He hallowed at creation in 2 Maccabees 15:2.'),
  -- thread: 2-maccabees-15-comfort-law-and-prophets
  ('apocrypha', '2-maccabees', 15, 9, 'canon', 'deuteronomy', 20, 1, 'free', E'Deuteronomy 20:1 — *When thou goest out to battle against thine enemies, and seest horses, and chariots, and a people more than thou, be not afraid of them: for Yahuah (LORD) thy God is with thee, which brought thee up out of the land of Egypt.* The Torah Judas reads to his men is the same word of war that bids Yashar''el not to fear the multitude in 2 Maccabees 15:9.'),
  ('apocrypha', '2-maccabees', 15, 8, 'canon', 'deuteronomy', 31, 6, 'free', E'Deuteronomy 31:6 — *Be strong and of a good courage, fear not, nor be afraid of them: for Yahuah (LORD) thy God, he it is that doth go with thee; he will not fail thee, nor forsake thee.* Judas exhorts his people ''not to fear the coming of the heathen'' on the strength of this same Mosaic charge in 2 Maccabees 15:8.'),
  -- thread: 2-maccabees-15-jeremiah-intercedes
  ('apocrypha', '2-maccabees', 15, 14, 'canon', 'jeremiah', 15, 1, 'free', E'Jeremiah 15:1 — *Then said Yahuah (LORD) unto me, Though Moses and Samuel stood before me, yet my mind could not be toward this people: cast them out of my sight, and let them go forth.* The very Jeremiah who knew the weight of standing before Elohim for the people is the grey-haired intercessor ''who prayeth much for the people, and for the holy city'' in 2 Maccabees 15:14.'),
  ('apocrypha', '2-maccabees', 15, 12, 'canon', 'zechariah', 1, 12, 'free', E'Zechariah 1:12 — *Then the angel of Yahuah (LORD) answered and said, O Yahuah Tseva''ot (LORD of hosts), how long wilt thou not have mercy on Jerusalem and on the cities of Yahudah (Judah), against which thou hast had indignation these threescore and ten years?* Onias''s uplifted hands ''for the whole body of the Yahudim'' echo the heavenly intercession for Jerusalem in 2 Maccabees 15:12.'),
  ('apocrypha', '2-maccabees', 15, 14, 'canon', 'revelation', 8, 4, 'free', E'Revelation 8:4 — *And the smoke of the incense, which came with the prayers of the saints, ascended up before Elohim (God) out of the angel''s hand.* The prayers of Onias and Jeremiah for the holy city are the same saints'' prayers that rise before the throne in 2 Maccabees 15:14.'),
  -- thread: 2-maccabees-15-golden-sword
  ('apocrypha', '2-maccabees', 15, 16, 'canon', 'ephesians', 6, 17, 'free', E'Ephesians 6:17 — *And take the helmet of salvation, and the sword of the Spirit, which is the word of Elohim (God).* The ''holy sword, a gift from Yahuah'' that Jeremiah hands Judas is the covenant''s true weapon, the word of Elohim, in 2 Maccabees 15:16.'),
  ('apocrypha', '2-maccabees', 15, 16, 'canon', 'hebrews', 4, 12, 'free', E'Hebrews 4:12 — *For the word of Elohim (God) is quick, and powerful, and sharper than any twoedged sword, piercing even to the dividing asunder of soul and spirit, and of the joints and marrow, and is a discerner of the thoughts and intents of the heart.* The blade with which Judas shall ''wound the adversaries'' is the living word that cuts sharper than any edge in 2 Maccabees 15:16.'),
  ('apocrypha', '2-maccabees', 15, 15, 'canon', 'revelation', 1, 16, 'free', E'Revelation 1:16 — *And he had in his right hand seven stars: and out of his mouth went a sharp twoedged sword: and his countenance was as the sun shineth in his strength.* The golden sword from Jeremiah''s right hand foreshadows the twoedged sword from the mouth of the Glorified One in 2 Maccabees 15:15.'),
  -- thread: 2-maccabees-15-angel-and-deliverance
  ('apocrypha', '2-maccabees', 15, 22, 'canon', '2-kings', 19, 35, 'free', E'2 Kings 19:35 — *And it came to pass that night, that the angel of Yahuah (LORD) went out, and smote in the camp of the Assyrians an hundred fourscore and five thousand: and when they arose early in the morning, behold, they were all dead corpses.* Judas pleads this exact deliverance — the angel slaying the hundred fourscore and five thousand of Sennacherib — as the pattern for his own day in 2 Maccabees 15:22.'),
  ('apocrypha', '2-maccabees', 15, 22, 'canon', 'isaiah', 37, 36, 'free', E'Isaiah 37:36 — *Then the angel of Yahuah (LORD) went forth, and smote in the camp of the Assyrians a hundred and fourscore and five thousand: and when they arose early in the morning, behold, they were all dead corpses.* The prophet records the very angelic blow Judas recalls against the host of Sennacherib in 2 Maccabees 15:22.'),
  -- thread: 2-maccabees-15-nicanors-day-feast
  ('apocrypha', '2-maccabees', 15, 36, 'canon', 'esther', 9, 28, 'free', E'Esther 9:28 — *And that these days should be remembered and kept throughout every generation, every family, every province, and every city; and that these days of Purim should not fail from among the Yahudim (Jews), nor the memorial of them perish from their seed.* Nicanor''s Day is ordained ''the day before Mardocheus'' day'' — set beside the very feast of Purim whose perpetual keeping Esther 9:28 commands, in 2 Maccabees 15:36.'),
  ('apocrypha', '2-maccabees', 15, 36, 'canon', 'john', 10, 22, 'free', E'John 10:22 — *And it was at Jerusalem the feast of the dedication, and it was winter.* The Maccabean habit of ordaining feasts of deliverance is the same covenant rhythm by which the rededication became the feast the Messiah kept, illuminating the decree of 2 Maccabees 15:36.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2mac15_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2mac15_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-15-sabbath-kept',
       E'The Sabbath kept though the sword be drawn',
       E'Nicanor schemes to fall on Judas on the day of rest, and the very Yahudim pressed into his ranks plead the holiness of the day: *Nevertheless the Yahudim (Jews) that were compelled to go with him said, O destroy not so cruelly and barbarously, but give honour to that day, which he, that seeth all things, has honoured with holiness above all other days* (2 Maccabees 15:2). When the tyrant sneers, *if there were a Mighty one in heaven, that had commanded the sabbath day to be kept* (2 Maccabees 15:3), they answer with the bare witness of Sinai: *There is in heaven a living Yahuah (God), and mighty, who commanded the seventh day to be kept* (2 Maccabees 15:4). This is no law-as-curse but the seal of the everlasting covenant — *Wherefore the children of Yashar''el (Israel) shall keep the sabbath, to observe the sabbath throughout their generations, for a perpetual covenant* (Exodus 31:16). It Ain''t New: the Torah-faithful confess the Sabbath before the kingdom of man, even on the field of battle.',
       sv.verse_id, ev.verse_id, 'extras', 62350
  FROM _session253_2mac15_lookup sv, _session253_2mac15_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=15 AND sv.verse_number=2
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=15 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-15-comfort-law-and-prophets',
       E'Comforted out of the law and the prophets',
       E'Judas does not arm his people first with iron but with the memory of the covenant: *And so comforting them out of the law and the prophets, and withal putting them in mind of the battles that they won afore, he made them more cheerful* (2 Maccabees 15:9). He bids them *not to fear the coming of the heathen against them, but to remember the help which in former times they had received from heaven* (2 Maccabees 15:8). This is the very posture Moses gave to Yashar''el: *When thou goest out to battle against thine enemies, and seest horses, and chariots, and a people more than thou, be not afraid of them: for Yahuah (LORD) thy God is with thee* (Deuteronomy 20:1), and the word that steadies every covenant heart — *Be strong and of a good courage, fear not, nor be afraid of them: for Yahuah (LORD) thy God, he it is that doth go with thee* (Deuteronomy 31:6). The Scriptures themselves are the armoury.',
       sv.verse_id, ev.verse_id, 'extras', 62353
  FROM _session253_2mac15_lookup sv, _session253_2mac15_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=15 AND sv.verse_number=8
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=15 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-15-jeremiah-intercedes',
       E'Onias and Jeremiah — the prophet who prayeth much for the people',
       E'Judas''s dream-vision shows the great cloud of witnesses interceding for the covenant people: Onias the former high priest, *holding up his hands prayed for the whole body of the Yahudim (Jews)* (2 Maccabees 15:12), and beside him *a man with gray hairs, and exceeding glorious* whom Onias names — *This is a lover of the brothers, who prayeth much for the people, and for the holy city, to wit, Jeremias the prophet of Yahuah (God)* (2 Maccabees 15:14). It Ain''t New that the prophets stand before Elohim on Yashar''el''s behalf: Jeremiah himself heard *Then said Yahuah (LORD) unto me, Though Moses and Samuel stood before me, yet my mind could not be toward this people* (Jeremiah 15:1) — the same Jeremiah now pictured pleading for them. The angel of Yahuah cries the same plea in Zechariah''s night-vision — *O Yahuah Tseva''ot (LORD of hosts), how long wilt thou not have mercy on Jerusalem and on the cities of Yahudah (Judah)* (Zechariah 1:12) — and in the heavenly temple *the smoke of the incense, which came with the prayers of the saints, ascended up before Elohim (God) out of the angel''s hand* (Revelation 8:4). The intercession that armed Judas still rises before the throne.',
       sv.verse_id, ev.verse_id, 'extras', 62356
  FROM _session253_2mac15_lookup sv, _session253_2mac15_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=15 AND sv.verse_number=12
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=15 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-15-golden-sword',
       E'The holy sword, a gift from Yahuah',
       E'Jeremiah arms Judas not with steel but with a heavenly weapon: *Whereupon Jeremias holding forth his right hand gave to Judas a sword of gold, and in giving it spoke thus* (2 Maccabees 15:15), *Take this holy sword, a gift from Yahuah (God), with the which you shall wound the adversaries* (2 Maccabees 15:16). The true sword the covenant people wield is the word of Elohim — *And take the helmet of salvation, and the sword of the Spirit, which is the word of Elohim (God)* (Ephesians 6:17), the word that is *quick, and powerful, and sharper than any twoedged sword* (Hebrews 4:12). And the One who comes to make war carries that very blade — *out of his mouth went a sharp twoedged sword* (Revelation 1:16). The golden sword from the prophet''s hand is the same living word by which the adversary''s system is undone.',
       sv.verse_id, ev.verse_id, 'extras', 62359
  FROM _session253_2mac15_lookup sv, _session253_2mac15_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=15 AND sv.verse_number=15
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=15 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-15-angel-and-deliverance',
       E'Send a good angel before us — the host of Sennacherib remembered',
       E'Lifting his hands toward heaven, Judas pleads the great deliverance of old: *O Yahuah (God), you did send your angel in the time of Ezekias king of Judea, and did slay in the host of Sennacherib an hundred fourscore and five thousand* (2 Maccabees 15:22), and so he prays, *send a good angel before us for a fear and dread to them* (2 Maccabees 15:23). It Ain''t New — the deliverance he remembers is written plain: *And it came to pass that night, that the angel of Yahuah (LORD) went out, and smote in the camp of the Assyrians an hundred fourscore and five thousand* (2 Kings 19:35), the same word standing in the prophet — *Then the angel of Yahuah (LORD) went forth, and smote in the camp of the Assyrians a hundred and fourscore and five thousand* (Isaiah 37:36). The victory comes not by arms but by the hand of heaven, as Judas confesses: *knowing that victory comes not by arms, but even as it seemeth good to him, he gives it to such as are worthy* (2 Maccabees 15:21).',
       sv.verse_id, ev.verse_id, 'extras', 62362
  FROM _session253_2mac15_lookup sv, _session253_2mac15_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=15 AND sv.verse_number=21
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=15 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-15-nicanors-day-feast',
       E'Nicanor''s Day kept as a feast — and here shall be an end',
       E'The deliverance is sealed into the calendar of the covenant people: *And they ordained all with a common decree in no case to let that day pass without solemnity, but to celebrate the thirteenth day of the twelfth month, which in the Syrian tongue is called Adar, the day before Mardocheus'' day* (2 Maccabees 15:36). It Ain''t New to fix a day of remembrance: of Purim it is written *that these days should be remembered and kept throughout every generation, every family, every province, and every city; and that these days of Purim should not fail from among the Yahudim (Jews)* (Esther 9:28) — and Nicanor''s Day is set the eve before. So too the rededication the Maccabees won became the feast the Messiah Himself walked in — *And it was at Jerusalem the feast of the dedication, and it was winter* (John 10:22). The author lays down his pen with the candour of a man, not a prophet: *And if I have done well, and as is fitting the story, it is that which I desired: but if slenderly and meanly, it is that which I could attain to* (2 Maccabees 15:38).',
       sv.verse_id, ev.verse_id, 'extras', 62365
  FROM _session253_2mac15_lookup sv, _session253_2mac15_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=15 AND sv.verse_number=36
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=15 AND ev.verse_number=38
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-maccabees-15-sabbath-kept
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 31:16 — *Wherefore the children of Yashar''el (Israel) shall keep the sabbath, to observe the sabbath throughout their generations, for a perpetual covenant.* The seventh-day rest the Yahudim confess before Nicanor is the perpetual sign of the covenant given at Sinai, not a yoke to be set aside under threat.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac15_lookup sv, _session253_2mac15_lookup tv
 WHERE t.slug='2-maccabees-15-sabbath-kept'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=15 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=31 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 20:11 — *For in six days Yahuah (LORD) made heaven and earth, the sea, and all that in them is, and rested the seventh day: wherefore Yahuah (LORD) blessed the sabbath day, and hallowed it.* The One who ''seeth all things'' has ''honoured with holiness above all other days'' the very day He hallowed at creation in 2 Maccabees 15:2.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac15_lookup sv, _session253_2mac15_lookup tv
 WHERE t.slug='2-maccabees-15-sabbath-kept'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=15 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-15-comfort-law-and-prophets
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 20:1 — *When thou goest out to battle against thine enemies, and seest horses, and chariots, and a people more than thou, be not afraid of them: for Yahuah (LORD) thy God is with thee, which brought thee up out of the land of Egypt.* The Torah Judas reads to his men is the same word of war that bids Yashar''el not to fear the multitude in 2 Maccabees 15:9.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac15_lookup sv, _session253_2mac15_lookup tv
 WHERE t.slug='2-maccabees-15-comfort-law-and-prophets'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=15 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=20 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 31:6 — *Be strong and of a good courage, fear not, nor be afraid of them: for Yahuah (LORD) thy God, he it is that doth go with thee; he will not fail thee, nor forsake thee.* Judas exhorts his people ''not to fear the coming of the heathen'' on the strength of this same Mosaic charge in 2 Maccabees 15:8.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac15_lookup sv, _session253_2mac15_lookup tv
 WHERE t.slug='2-maccabees-15-comfort-law-and-prophets'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=15 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=31 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-15-jeremiah-intercedes
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 15:1 — *Then said Yahuah (LORD) unto me, Though Moses and Samuel stood before me, yet my mind could not be toward this people: cast them out of my sight, and let them go forth.* The very Jeremiah who knew the weight of standing before Elohim for the people is the grey-haired intercessor ''who prayeth much for the people, and for the holy city'' in 2 Maccabees 15:14.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac15_lookup sv, _session253_2mac15_lookup tv
 WHERE t.slug='2-maccabees-15-jeremiah-intercedes'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=15 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=15 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Zechariah 1:12 — *Then the angel of Yahuah (LORD) answered and said, O Yahuah Tseva''ot (LORD of hosts), how long wilt thou not have mercy on Jerusalem and on the cities of Yahudah (Judah), against which thou hast had indignation these threescore and ten years?* Onias''s uplifted hands ''for the whole body of the Yahudim'' echo the heavenly intercession for Jerusalem in 2 Maccabees 15:12.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac15_lookup sv, _session253_2mac15_lookup tv
 WHERE t.slug='2-maccabees-15-jeremiah-intercedes'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=15 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=1 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 8:4 — *And the smoke of the incense, which came with the prayers of the saints, ascended up before Elohim (God) out of the angel''s hand.* The prayers of Onias and Jeremiah for the holy city are the same saints'' prayers that rise before the throne in 2 Maccabees 15:14.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac15_lookup sv, _session253_2mac15_lookup tv
 WHERE t.slug='2-maccabees-15-jeremiah-intercedes'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=15 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=8 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-15-golden-sword
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ephesians 6:17 — *And take the helmet of salvation, and the sword of the Spirit, which is the word of Elohim (God).* The ''holy sword, a gift from Yahuah'' that Jeremiah hands Judas is the covenant''s true weapon, the word of Elohim, in 2 Maccabees 15:16.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac15_lookup sv, _session253_2mac15_lookup tv
 WHERE t.slug='2-maccabees-15-golden-sword'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=15 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=6 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 4:12 — *For the word of Elohim (God) is quick, and powerful, and sharper than any twoedged sword, piercing even to the dividing asunder of soul and spirit, and of the joints and marrow, and is a discerner of the thoughts and intents of the heart.* The blade with which Judas shall ''wound the adversaries'' is the living word that cuts sharper than any edge in 2 Maccabees 15:16.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac15_lookup sv, _session253_2mac15_lookup tv
 WHERE t.slug='2-maccabees-15-golden-sword'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=15 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=4 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 1:16 — *And he had in his right hand seven stars: and out of his mouth went a sharp twoedged sword: and his countenance was as the sun shineth in his strength.* The golden sword from Jeremiah''s right hand foreshadows the twoedged sword from the mouth of the Glorified One in 2 Maccabees 15:15.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac15_lookup sv, _session253_2mac15_lookup tv
 WHERE t.slug='2-maccabees-15-golden-sword'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=15 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=1 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-15-angel-and-deliverance
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Kings 19:35 — *And it came to pass that night, that the angel of Yahuah (LORD) went out, and smote in the camp of the Assyrians an hundred fourscore and five thousand: and when they arose early in the morning, behold, they were all dead corpses.* Judas pleads this exact deliverance — the angel slaying the hundred fourscore and five thousand of Sennacherib — as the pattern for his own day in 2 Maccabees 15:22.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac15_lookup sv, _session253_2mac15_lookup tv
 WHERE t.slug='2-maccabees-15-angel-and-deliverance'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=15 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=19 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 37:36 — *Then the angel of Yahuah (LORD) went forth, and smote in the camp of the Assyrians a hundred and fourscore and five thousand: and when they arose early in the morning, behold, they were all dead corpses.* The prophet records the very angelic blow Judas recalls against the host of Sennacherib in 2 Maccabees 15:22.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac15_lookup sv, _session253_2mac15_lookup tv
 WHERE t.slug='2-maccabees-15-angel-and-deliverance'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=15 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=37 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-15-nicanors-day-feast
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Esther 9:28 — *And that these days should be remembered and kept throughout every generation, every family, every province, and every city; and that these days of Purim should not fail from among the Yahudim (Jews), nor the memorial of them perish from their seed.* Nicanor''s Day is ordained ''the day before Mardocheus'' day'' — set beside the very feast of Purim whose perpetual keeping Esther 9:28 commands, in 2 Maccabees 15:36.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac15_lookup sv, _session253_2mac15_lookup tv
 WHERE t.slug='2-maccabees-15-nicanors-day-feast'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=15 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='esther' AND tv.chapter_number=9 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 10:22 — *And it was at Jerusalem the feast of the dedication, and it was winter.* The Maccabean habit of ordaining feasts of deliverance is the same covenant rhythm by which the rededication became the feast the Messiah kept, illuminating the decree of 2 Maccabees 15:36.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac15_lookup sv, _session253_2mac15_lookup tv
 WHERE t.slug='2-maccabees-15-nicanors-day-feast'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=15 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=10 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

