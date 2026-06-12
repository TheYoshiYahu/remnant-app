-- ----- fragment: minion_thewisdomofsolomon_18.sql (session253 the-wisdom-of-solomon 18) -----
-- Source anchor: apocrypha/the-wisdom-of-solomon ch18. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: wis18 (view _session253_wis18_lookup). Sort band base 58425, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_wis18_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: wisdom-18-burning-pillar
  ('apocrypha', 'the-wisdom-of-solomon', 18, 3, 'canon', 'exodus', 13, 21, 'free', E'Exodus 13:21 — *And Yahuah (LORD) went before them by day in a pillar of a cloud, to lead them the way; and by night in a pillar of fire, to give them light; to go by day and night:* The very pillar Wisdom 18:3 names as the burning guide of the unknown journey.'),
  ('apocrypha', 'the-wisdom-of-solomon', 18, 3, 'canon', 'exodus', 13, 22, 'free', E'Exodus 13:22 — *He took not away the pillar of the cloud by day, nor the pillar of fire by night, from before the people.* The unfailing presence that, in Wisdom 18:3, entertains the saints honourably as an harmless sun.'),
  ('apocrypha', 'the-wisdom-of-solomon', 18, 3, 'canon', 'exodus', 14, 20, 'free', E'Exodus 14:20 — *And it came between the camp of the Egyptians and the camp of Yashar''el (Israel); and it was a cloud and darkness to them, but it gave light by night to these: so that the one came not near the other all the night.* The one fire is light to Israel and darkness to Egypt — Wisdom 18:3-4''s two-edged mercy-in-judgment.'),
  ('apocrypha', 'the-wisdom-of-solomon', 18, 4, 'canon', 'exodus', 12, 42, 'free', E'Exodus 12:42 — *It is a night to be much observed unto Yahuah (LORD) for bringing them out from the land of Egypt: this is that night of Yahuah (LORD) to be observed of all the children of Yashar''el (Israel) in their generations.* The night by which the uncorrupt light of the law (Wisdom 18:4) was given through Israel to the world.'),
  -- thread: wisdom-18-passover-firstborn
  ('apocrypha', 'the-wisdom-of-solomon', 18, 13, 'canon', 'exodus', 12, 29, 'free', E'Exodus 12:29 — *And it came to pass, that at midnight Yahuah (LORD) smote all the firstborn in the land of Egypt, from the firstborn of Pharaoh that sat on his throne unto the firstborn of the captive that was in the dungeon; and all the firstborn of cattle.* The destruction of the firstborn that, in Wisdom 18:13, made Egypt confess Israel to be the sons of Yahuah.'),
  ('apocrypha', 'the-wisdom-of-solomon', 18, 12, 'canon', 'exodus', 12, 30, 'free', E'Exodus 12:30 — *And Pharaoh rose up in the night, he, and all his servants, and all the Egyptians; and there was a great cry in Egypt; for there was not a house where there was not one dead.* Wisdom 18:11-12''s innumerable dead and lamentable cry, with none left to bury — master and king and common person alike.'),
  ('apocrypha', 'the-wisdom-of-solomon', 18, 6, 'canon', 'exodus', 12, 13, 'free', E'Exodus 12:13 — *And the blood shall be to you for a token upon the houses where ye are: and when I see the blood, I will pass over you, and the plague shall not be upon you to destroy you, when I smite the land of Egypt.* The blood-token behind the oaths the fathers were certified by (Wisdom 18:6) — the lamb that turns the destroyer aside.'),
  ('apocrypha', 'the-wisdom-of-solomon', 18, 9, 'canon', 'exodus', 12, 14, 'free', E'Exodus 12:14 — *And this day shall be unto you for a memorial; and ye shall keep it a feast to Yahuah (LORD) throughout your generations; ye shall keep it a feast by an ordinance for ever.* The holy law the righteous children consented to in Wisdom 18:9 — the Passover kept by ordinance forever, Torah standing.'),
  -- thread: wisdom-18-word-warrior
  ('apocrypha', 'the-wisdom-of-solomon', 18, 15, 'canon', 'john', 1, 14, 'free', E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The Almighty Word that leaped from the throne in Wisdom 18:15 is the Logos made flesh — heaven touched, earth stood upon.'),
  ('apocrypha', 'the-wisdom-of-solomon', 18, 15, 'canon', 'revelation', 19, 11, 'free', E'Revelation 19:11 — *And I saw heaven opened, and behold a white horse; and he that sat upon him was called Faithful and True, and in righteousness he doth judge and make war.* The fierce man of war leaping from heaven (Wisdom 18:15) rides out of opened heaven to judge and make war.'),
  ('apocrypha', 'the-wisdom-of-solomon', 18, 15, 'canon', 'revelation', 19, 13, 'free', E'Revelation 19:13 — *And he was clothed with a vesture dipped in blood: and his name is called The Word of Elohim (God).* The very name Wisdom 18:15 gives the warrior — the Almighty Word — borne by the rider into the land of destruction.'),
  ('apocrypha', 'the-wisdom-of-solomon', 18, 16, 'canon', 'revelation', 19, 15, 'free', E'Revelation 19:15 — *And out of his mouth goeth a sharp sword, that with it he should smite the nations: and he shall rule them with a rod of iron: and he treadeth the winepress of the fierceness and wrath of El Shaddai (Almighty God).* The unfeigned commandment as a sharp sword filling all things with death (Wisdom 18:16) — the Word''s blade that smites the nations.'),
  ('apocrypha', 'the-wisdom-of-solomon', 18, 16, 'canon', 'hebrews', 4, 12, 'free', E'Hebrews 4:12 — *For the word of Elohim (God) is quick, and powerful, and sharper than any twoedged sword, piercing even to the dividing asunder of soul and spirit, and of the joints and marrow, and is a discerner of the thoughts and intents of the heart.* The Word-as-sharp-sword of Wisdom 18:16, now turned inward to discern the heart.'),
  -- thread: wisdom-18-aaron-incense-atonement
  ('apocrypha', 'the-wisdom-of-solomon', 18, 21, 'canon', 'numbers', 16, 46, 'free', E'Numbers 16:46 — *And Moses said unto Aaron, Take a censer, and put fire therein from off the altar, and put on incense, and go quickly unto the congregation, and make an atonement for them: for there is wrath gone out from Yahuah (LORD); the plague is begun.* The propitiation of incense Wisdom 18:21 names — the priest''s shield of his proper ministry against the wrath.'),
  ('apocrypha', 'the-wisdom-of-solomon', 18, 23, 'canon', 'numbers', 16, 48, 'free', E'Numbers 16:48 — *And he stood between the dead and the living; and the plague was stayed.* The very posture of Wisdom 18:23 — Aaron standing between, staying the wrath, parting the way to the living.'),
  ('apocrypha', 'the-wisdom-of-solomon', 18, 22, 'canon', 'exodus', 12, 13, 'free', E'Exodus 12:13 — *And the blood shall be to you for a token upon the houses where ye are: and when I see the blood, I will pass over you, and the plague shall not be upon you to destroy you, when I smite the land of Egypt.* The oaths and covenants made with the fathers, by which the blameless man subdues the destroyer (Wisdom 18:22) — the same blood-token that turns the plague aside.'),
  ('apocrypha', 'the-wisdom-of-solomon', 18, 21, 'canon', 'hebrews', 4, 12, 'free', E'Hebrews 4:12 — *For the word of Elohim (God) is quick, and powerful, and sharper than any twoedged sword, piercing even to the dividing asunder of soul and spirit, and of the joints and marrow, and is a discerner of the thoughts and intents of the heart.* The blameless man subdues the destroyer with a word (Wisdom 18:22) — intercession in the power of the living Word.'),
  -- thread: wisdom-18-priestly-garment-world
  ('apocrypha', 'the-wisdom-of-solomon', 18, 24, 'canon', 'exodus', 28, 17, 'free', E'Exodus 28:17 — *And thou shalt set in it settings of stones, even four rows of stones: the first row shall be a sardius, a topaz, and a carbuncle: this shall be the first row.* The four rows of stones of Wisdom 18:24 — the high priest''s breastplate, the glory of the fathers graven.'),
  ('apocrypha', 'the-wisdom-of-solomon', 18, 24, 'canon', 'exodus', 28, 29, 'free', E'Exodus 28:29 — *And Aaron shall bear the names of the children of Yashar''el (Israel) in the breastplate of judgment upon his heart, when he goeth in unto the holy place, for a memorial before Yahuah (LORD) continually.* The glory of the fathers graven on the garment (Wisdom 18:24) — all twelve tribes carried before the throne for a memorial.'),
  ('apocrypha', 'the-wisdom-of-solomon', 18, 24, 'canon', 'exodus', 28, 36, 'free', E'Exodus 28:36 — *And thou shalt make a plate of pure gold, and grave upon it, like the engravings of a signet, HOLINESS TO THE Yahuah (LORD).* Your Majesty upon the diadem of his head (Wisdom 18:24) — the Name on the golden plate that the destroyer dares not pass.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_wis18_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_wis18_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-18-burning-pillar',
       E'The burning pillar of fire — a guide for the unknown journey',
       E'Wisdom turns to the night of the Exodus and the column of fire that led the saints out: *Instead of which you gavest them a burning pillar of fire, both to be a guide of the unknown journey, and an harmless sun to entertain them honourably.* (Wisdom of Solomon 18:3) The same fire that delivers Israel blinds Egypt, *who had kept your sons shut up, by whom the uncorrupt light of the law was to be given to the world* (Wisdom of Solomon 18:4) — the light is Torah. It ain''t new: this is the Exodus pillar itself, *And Yahuah (LORD) went before them by day in a pillar of a cloud, to lead them the way; and by night in a pillar of fire, to give them light; to go by day and night* (Exodus 13:21), the abiding presence that *He took not away the pillar of the cloud by day, nor the pillar of fire by night, from before the people* (Exodus 13:22). At the sea the one fire is two-edged — darkness to the enemy, light to the redeemed: *it was a cloud and darkness to them, but it gave light by night to these* (Exodus 14:20). Wisdom''s ''harmless sun'' is mercy-in-judgment: the same glory guides Israel and confounds the oppressor.',
       sv.verse_id, ev.verse_id, 'extras', 58425
  FROM _session253_wis18_lookup sv, _session253_wis18_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=18 AND sv.verse_number=3
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=18 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-18-passover-firstborn',
       E'The Passover night — the firstborn smitten, the fathers certified by oath',
       E'Wisdom rehearses the night of the tenth plague and the covenant oath that steadied Israel''s faith: *Of that night were our fathers certified afore, that assuredly knowing to what oaths they had given credence, they might afterwards be of good cheer.* (Wisdom of Solomon 18:6) The destroyer passes through, and the smiting of the firstborn at last forces Egypt''s confession: *upon the destruction of the firstborn, they acknowledged this people to be the sons of Yahuah (God)* (Wisdom of Solomon 18:13). It ain''t new — this is Passover midnight: *And it came to pass, that at midnight Yahuah (LORD) smote all the firstborn in the land of Egypt, from the firstborn of Pharaoh that sat on his throne unto the firstborn of the captive that was in the dungeon; and all the firstborn of cattle* (Exodus 12:29), so that *there was a great cry in Egypt; for there was not a house where there was not one dead* (Exodus 12:30). The deliverance hung on the blood-token of the lamb: *when I see the blood, I will pass over you, and the plague shall not be upon you to destroy you* (Exodus 12:13). One night, two destinies — salvation for the righteous, destruction for the enemies (Wisdom 18:7).',
       sv.verse_id, ev.verse_id, 'extras', 58428
  FROM _session253_wis18_lookup sv, _session253_wis18_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=18 AND sv.verse_number=5
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=18 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-18-word-warrior',
       E'The Almighty Word leaping from heaven — the warrior with the sharp sword',
       E'Here is Wisdom''s most arresting figure: at the dead-still midnight the very Word of Yahuah springs from the throne as an armed warrior. *Your Almighty word leaped down from heaven out of your royal throne, as a fierce man of war into the midst of a land of destruction,* (Wisdom of Solomon 18:15) *And brought your unfeigned commandment as a sharp sword, and standing up filled all things with death; and it touched the heaven, but it stood upon the earth.* (Wisdom of Solomon 18:16) The personified Word that delivers and judges is the Logos: *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth* (John 1:14) — the Word that touches heaven yet stands on earth. The warrior who rides out of opened heaven to make war bears the same title and the same blade: *And he was clothed with a vesture dipped in blood: and his name is called The Word of Elohim (God)* (Revelation 19:13), *and out of his mouth goeth a sharp sword, that with it he should smite the nations* (Revelation 19:15), *he that sat upon him was called Faithful and True, and in righteousness he doth judge and make war* (Revelation 19:11). And the sword is His own self-disclosure: *For the word of Elohim (God) is quick, and powerful, and sharper than any twoedged sword* (Hebrews 4:12). It ain''t new — the Word that came down on Passover night is the Word that returns in glory.',
       sv.verse_id, ev.verse_id, 'extras', 58431
  FROM _session253_wis18_lookup sv, _session253_wis18_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=18 AND sv.verse_number=14
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=18 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-18-aaron-incense-atonement',
       E'The blameless man with the incense — standing between the dead and the living',
       E'Even Israel tastes the wrath in the wilderness, and a priest''s atonement halts the plague: *For then the blameless man made haste, and stood forth to defend them; and bringing the shield of his proper ministry, even prayer, and the propitiation of incense, set himself against the wrath, and so brought the calamity to an end, declaring that he was your servant.* (Wisdom of Solomon 18:21) He conquers not by arms but by covenant: *he overcame the destroyer, not with strength of body, nor force of arms, but with a word subdued him that punished, alleging the oaths and covenants made with the fathers* (Wisdom of Solomon 18:22), and *standing between, he stayed the wrath, and parted the way to the living* (Wisdom of Solomon 18:23). It ain''t new — this is Aaron in the plague of Korah: *And Moses said unto Aaron, Take a censer, and put fire therein from off the altar, and put on incense, and go quickly unto the congregation, and make an atonement for them: for there is wrath gone out from Yahuah (LORD); the plague is begun* (Numbers 16:46). The priest runs into the breach: *And he stood between the dead and the living; and the plague was stayed* (Numbers 16:48). The intercessor who pleads the covenant and stays the wrath is the figure of the great High Priest — mercy in the midst of judgment, the seed kept.',
       sv.verse_id, ev.verse_id, 'extras', 58434
  FROM _session253_wis18_lookup sv, _session253_wis18_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=18 AND sv.verse_number=21
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=18 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-18-priestly-garment-world',
       E'The long garment — the whole world, the glory of the fathers, the diadem of Majesty',
       E'Wisdom unveils the priest''s robe as a cosmos and a covenant memorial — the reason the destroyer gives place: *For in the long garment was the whole world, and in the four rows of the stones was the glory of the fathers graven, and your Majesty upon the diadem of his head.* (Wisdom of Solomon 18:24) *To these the destroyer gave place, and was afraid of them: for it was enough that they only tasted of the wrath.* (Wisdom of Solomon 18:25) It ain''t new — the four rows of stones are the breastplate of the high priest, each engraved with a tribe of Israel: *And thou shalt set in it settings of stones, even four rows of stones* (Exodus 28:17), borne *for a memorial before Yahuah (LORD) continually* (Exodus 28:29), with *HOLINESS TO THE Yahuah (LORD)* upon the golden plate of the diadem (Exodus 28:36). The whole house of Israel — the glory of the fathers — is carried on the priest''s heart into the presence; the Name on his brow stays the wrath. The mediator who bears all twelve tribes before the throne is the type of the one who gathers and keeps the seed.',
       sv.verse_id, ev.verse_id, 'extras', 58437
  FROM _session253_wis18_lookup sv, _session253_wis18_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=18 AND sv.verse_number=24
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=18 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: wisdom-18-burning-pillar
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 13:21 — *And Yahuah (LORD) went before them by day in a pillar of a cloud, to lead them the way; and by night in a pillar of fire, to give them light; to go by day and night:* The very pillar Wisdom 18:3 names as the burning guide of the unknown journey.'
  FROM cross_reference_threads t, cross_references x, _session253_wis18_lookup sv, _session253_wis18_lookup tv
 WHERE t.slug='wisdom-18-burning-pillar'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=18 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=13 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 13:22 — *He took not away the pillar of the cloud by day, nor the pillar of fire by night, from before the people.* The unfailing presence that, in Wisdom 18:3, entertains the saints honourably as an harmless sun.'
  FROM cross_reference_threads t, cross_references x, _session253_wis18_lookup sv, _session253_wis18_lookup tv
 WHERE t.slug='wisdom-18-burning-pillar'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=18 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=13 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 14:20 — *And it came between the camp of the Egyptians and the camp of Yashar''el (Israel); and it was a cloud and darkness to them, but it gave light by night to these: so that the one came not near the other all the night.* The one fire is light to Israel and darkness to Egypt — Wisdom 18:3-4''s two-edged mercy-in-judgment.'
  FROM cross_reference_threads t, cross_references x, _session253_wis18_lookup sv, _session253_wis18_lookup tv
 WHERE t.slug='wisdom-18-burning-pillar'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=18 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=14 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Exodus 12:42 — *It is a night to be much observed unto Yahuah (LORD) for bringing them out from the land of Egypt: this is that night of Yahuah (LORD) to be observed of all the children of Yashar''el (Israel) in their generations.* The night by which the uncorrupt light of the law (Wisdom 18:4) was given through Israel to the world.'
  FROM cross_reference_threads t, cross_references x, _session253_wis18_lookup sv, _session253_wis18_lookup tv
 WHERE t.slug='wisdom-18-burning-pillar'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=18 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=42
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-18-passover-firstborn
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 12:29 — *And it came to pass, that at midnight Yahuah (LORD) smote all the firstborn in the land of Egypt, from the firstborn of Pharaoh that sat on his throne unto the firstborn of the captive that was in the dungeon; and all the firstborn of cattle.* The destruction of the firstborn that, in Wisdom 18:13, made Egypt confess Israel to be the sons of Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_wis18_lookup sv, _session253_wis18_lookup tv
 WHERE t.slug='wisdom-18-passover-firstborn'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=18 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 12:30 — *And Pharaoh rose up in the night, he, and all his servants, and all the Egyptians; and there was a great cry in Egypt; for there was not a house where there was not one dead.* Wisdom 18:11-12''s innumerable dead and lamentable cry, with none left to bury — master and king and common person alike.'
  FROM cross_reference_threads t, cross_references x, _session253_wis18_lookup sv, _session253_wis18_lookup tv
 WHERE t.slug='wisdom-18-passover-firstborn'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=18 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 12:13 — *And the blood shall be to you for a token upon the houses where ye are: and when I see the blood, I will pass over you, and the plague shall not be upon you to destroy you, when I smite the land of Egypt.* The blood-token behind the oaths the fathers were certified by (Wisdom 18:6) — the lamb that turns the destroyer aside.'
  FROM cross_reference_threads t, cross_references x, _session253_wis18_lookup sv, _session253_wis18_lookup tv
 WHERE t.slug='wisdom-18-passover-firstborn'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=18 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Exodus 12:14 — *And this day shall be unto you for a memorial; and ye shall keep it a feast to Yahuah (LORD) throughout your generations; ye shall keep it a feast by an ordinance for ever.* The holy law the righteous children consented to in Wisdom 18:9 — the Passover kept by ordinance forever, Torah standing.'
  FROM cross_reference_threads t, cross_references x, _session253_wis18_lookup sv, _session253_wis18_lookup tv
 WHERE t.slug='wisdom-18-passover-firstborn'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=18 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-18-word-warrior
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The Almighty Word that leaped from the throne in Wisdom 18:15 is the Logos made flesh — heaven touched, earth stood upon.'
  FROM cross_reference_threads t, cross_references x, _session253_wis18_lookup sv, _session253_wis18_lookup tv
 WHERE t.slug='wisdom-18-word-warrior'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=18 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 19:11 — *And I saw heaven opened, and behold a white horse; and he that sat upon him was called Faithful and True, and in righteousness he doth judge and make war.* The fierce man of war leaping from heaven (Wisdom 18:15) rides out of opened heaven to judge and make war.'
  FROM cross_reference_threads t, cross_references x, _session253_wis18_lookup sv, _session253_wis18_lookup tv
 WHERE t.slug='wisdom-18-word-warrior'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=18 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=19 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 19:13 — *And he was clothed with a vesture dipped in blood: and his name is called The Word of Elohim (God).* The very name Wisdom 18:15 gives the warrior — the Almighty Word — borne by the rider into the land of destruction.'
  FROM cross_reference_threads t, cross_references x, _session253_wis18_lookup sv, _session253_wis18_lookup tv
 WHERE t.slug='wisdom-18-word-warrior'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=18 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=19 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 19:15 — *And out of his mouth goeth a sharp sword, that with it he should smite the nations: and he shall rule them with a rod of iron: and he treadeth the winepress of the fierceness and wrath of El Shaddai (Almighty God).* The unfeigned commandment as a sharp sword filling all things with death (Wisdom 18:16) — the Word''s blade that smites the nations.'
  FROM cross_reference_threads t, cross_references x, _session253_wis18_lookup sv, _session253_wis18_lookup tv
 WHERE t.slug='wisdom-18-word-warrior'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=18 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=19 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Hebrews 4:12 — *For the word of Elohim (God) is quick, and powerful, and sharper than any twoedged sword, piercing even to the dividing asunder of soul and spirit, and of the joints and marrow, and is a discerner of the thoughts and intents of the heart.* The Word-as-sharp-sword of Wisdom 18:16, now turned inward to discern the heart.'
  FROM cross_reference_threads t, cross_references x, _session253_wis18_lookup sv, _session253_wis18_lookup tv
 WHERE t.slug='wisdom-18-word-warrior'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=18 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=4 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-18-aaron-incense-atonement
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 16:46 — *And Moses said unto Aaron, Take a censer, and put fire therein from off the altar, and put on incense, and go quickly unto the congregation, and make an atonement for them: for there is wrath gone out from Yahuah (LORD); the plague is begun.* The propitiation of incense Wisdom 18:21 names — the priest''s shield of his proper ministry against the wrath.'
  FROM cross_reference_threads t, cross_references x, _session253_wis18_lookup sv, _session253_wis18_lookup tv
 WHERE t.slug='wisdom-18-aaron-incense-atonement'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=18 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=16 AND tv.verse_number=46
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 16:48 — *And he stood between the dead and the living; and the plague was stayed.* The very posture of Wisdom 18:23 — Aaron standing between, staying the wrath, parting the way to the living.'
  FROM cross_reference_threads t, cross_references x, _session253_wis18_lookup sv, _session253_wis18_lookup tv
 WHERE t.slug='wisdom-18-aaron-incense-atonement'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=18 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=16 AND tv.verse_number=48
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 12:13 — *And the blood shall be to you for a token upon the houses where ye are: and when I see the blood, I will pass over you, and the plague shall not be upon you to destroy you, when I smite the land of Egypt.* The oaths and covenants made with the fathers, by which the blameless man subdues the destroyer (Wisdom 18:22) — the same blood-token that turns the plague aside.'
  FROM cross_reference_threads t, cross_references x, _session253_wis18_lookup sv, _session253_wis18_lookup tv
 WHERE t.slug='wisdom-18-aaron-incense-atonement'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=18 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hebrews 4:12 — *For the word of Elohim (God) is quick, and powerful, and sharper than any twoedged sword, piercing even to the dividing asunder of soul and spirit, and of the joints and marrow, and is a discerner of the thoughts and intents of the heart.* The blameless man subdues the destroyer with a word (Wisdom 18:22) — intercession in the power of the living Word.'
  FROM cross_reference_threads t, cross_references x, _session253_wis18_lookup sv, _session253_wis18_lookup tv
 WHERE t.slug='wisdom-18-aaron-incense-atonement'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=18 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=4 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-18-priestly-garment-world
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 28:17 — *And thou shalt set in it settings of stones, even four rows of stones: the first row shall be a sardius, a topaz, and a carbuncle: this shall be the first row.* The four rows of stones of Wisdom 18:24 — the high priest''s breastplate, the glory of the fathers graven.'
  FROM cross_reference_threads t, cross_references x, _session253_wis18_lookup sv, _session253_wis18_lookup tv
 WHERE t.slug='wisdom-18-priestly-garment-world'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=18 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=28 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 28:29 — *And Aaron shall bear the names of the children of Yashar''el (Israel) in the breastplate of judgment upon his heart, when he goeth in unto the holy place, for a memorial before Yahuah (LORD) continually.* The glory of the fathers graven on the garment (Wisdom 18:24) — all twelve tribes carried before the throne for a memorial.'
  FROM cross_reference_threads t, cross_references x, _session253_wis18_lookup sv, _session253_wis18_lookup tv
 WHERE t.slug='wisdom-18-priestly-garment-world'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=18 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=28 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 28:36 — *And thou shalt make a plate of pure gold, and grave upon it, like the engravings of a signet, HOLINESS TO THE Yahuah (LORD).* Your Majesty upon the diadem of his head (Wisdom 18:24) — the Name on the golden plate that the destroyer dares not pass.'
  FROM cross_reference_threads t, cross_references x, _session253_wis18_lookup sv, _session253_wis18_lookup tv
 WHERE t.slug='wisdom-18-priestly-garment-world'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=18 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=28 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

