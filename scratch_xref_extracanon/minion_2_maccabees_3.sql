-- ----- fragment: minion_2maccabees_03.sql (session253 2-maccabees 3) -----
-- Source anchor: apocrypha/2-maccabees ch3. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2mac3 (view _session253_2mac3_lookup). Sort band base 62050, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2mac3_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-maccabees-3-widows-treasure
  ('apocrypha', '2-maccabees', 3, 10, 'canon', 'exodus', 22, 22, 'free', E'Exodus 22:22 — *Ye shall not afflict any widow, or fatherless child.* The treasury Heliodorus came to seize was the very substance the Torah forbids any man to afflict.'),
  ('apocrypha', '2-maccabees', 3, 10, 'canon', 'deuteronomy', 10, 18, 'free', E'Deuteronomy 10:18 — *He doth execute the judgment of the fatherless and widow, and loveth the stranger, in giving him food and raiment.* Yahuah Himself defends the cause whose relief was laid up in the house at 2-maccabees 3:10.'),
  ('apocrypha', '2-maccabees', 3, 10, 'canon', 'psalms', 68, 5, 'free', E'Psalm 68:5 — *A father of the fatherless, and a judge of the widows, is Elohim (God) in his holy habitation.* The God of the widow dwells in the very habitation Heliodorus presumed to plunder.'),
  ('apocrypha', '2-maccabees', 3, 10, 'canon', 'james', 1, 27, 'free', E'James 1:27 — *Pure religion and undefiled before Elohim (God) and the Father is this, To visit the fatherless and widows in their affliction, and to keep himself unspotted from the world.* The same covenant care the temple stored is named the heart of pure religion — it ain''t new.'),
  ('apocrypha', '2-maccabees', 3, 10, 'apocrypha', 'tobit', 4, 7, 'extras', E'Tobit 4:7 — *Give alms of your substance; and when you give alms, let not your eye be envious, neither turn your face from any poor, and the face of Yahuah (God) shall not be turned away from you.* The restored Tobit names the almsgiving for the poor that the temple treasury safeguarded in 2-maccabees 3:10.'),
  -- thread: 2-maccabees-3-priests-supplication
  ('apocrypha', '2-maccabees', 3, 15, 'canon', 'joel', 2, 17, 'free', E'Joel 2:17 — *Let the priests, the ministers of Yahuah (LORD), weep between the porch and the altar, and let them say, Spare thy people, O Yahuah (LORD), and give not thine heritage to reproach, that the heathen should rule over them: wherefore should they say among the people, Where is their Elohim (God)?* The very prophetic liturgy the priests enact prostrate before the altar in 2-maccabees 3:15.'),
  ('apocrypha', '2-maccabees', 3, 15, 'canon', 'numbers', 16, 48, 'free', E'Numbers 16:48 — *And he stood between the dead and the living; and the plague was stayed.* As Aaron''s priestly standing turned back wrath, so the priests'' supplication stands between the temple and the spoiler at 2-maccabees 3:15.'),
  ('apocrypha', '2-maccabees', 3, 22, 'canon', 'psalms', 127, 1, 'free', E'Psalm 127:1 — *Except Yahuah (LORD) build the house, they labour in vain that build it: except Yahuah (LORD) keep the city, the watchman waketh but in vain.* The people commit the keeping to the Almighty in 2-maccabees 3:22 because no human watch can guard the house.'),
  ('apocrypha', '2-maccabees', 3, 15, 'canon', 'hebrews', 7, 25, 'free', E'Hebrews 7:25 — *Wherefore he is able also to save them to the uttermost that come unto Elohim (God) by him, seeing he ever liveth to make intercession for them.* The interceding priesthood of Onias points to the High Priest who ever lives to intercede — it ain''t new.'),
  -- thread: 2-maccabees-3-dread-horseman
  ('apocrypha', '2-maccabees', 3, 25, 'canon', 'joshua', 5, 13, 'free', E'Joshua 5:13 — *And it came to pass, when Joshua was by Jericho, that he lifted up his eyes and looked, and, behold, there stood a man over against him with his sword drawn in his hand: and Joshua went unto him, and said unto him, Art thou for us, or for our adversaries?* The armed rider who strikes Heliodorus in 2-maccabees 3:25 is the same captain-of-the-host who stood sword-drawn for the LORD''s place.'),
  ('apocrypha', '2-maccabees', 3, 24, 'canon', 'joshua', 5, 14, 'free', E'Joshua 5:14 — *And he said, Nay; but as captain of the host of Yahuah (LORD) am I now come. And Joshua fell on his face to the earth, and did worship, and said unto him, What saith my lord unto his servant?* The Prince of all power who causes the apparition in 2-maccabees 3:24 is the captain of Yahuah''s host come to defend His own.'),
  ('apocrypha', '2-maccabees', 3, 24, 'canon', '2-kings', 19, 35, 'free', E'2 Kings 19:35 — *And it came to pass that night, that the angel of Yahuah (LORD) went out, and smote in the camp of the Assyrians an hundred fourscore and five thousand: and when they arose early in the morning, behold, they were all dead corpses.* The same heaven that smote Assyria for besieging Jerusalem strikes Heliodorus'' host in 2-maccabees 3:24.'),
  ('apocrypha', '2-maccabees', 3, 24, 'canon', '2-chronicles', 32, 21, 'free', E'2 Chronicles 32:21 — *And Yahuah (LORD) sent an angel, which cut off all the mighty men of valour, and the leaders and captains in the camp of the king of Assyria. So he returned with shame of face to his own land...* As one angel cut off Sennacherib''s captains, so the apparition routs the king''s treasurer in 2-maccabees 3:24.'),
  ('apocrypha', '2-maccabees', 3, 25, 'canon', 'psalms', 35, 5, 'free', E'Psalm 35:5 — *Let them be as chaff before the wind: and let the angel of Yahuah (LORD) chase them.* The fiercely running rider of 2-maccabees 3:25 is the chasing angel the psalmist summoned against the oppressors of the righteous.'),
  -- thread: 2-maccabees-3-cast-down-and-spared
  ('apocrypha', '2-maccabees', 3, 27, 'canon', 'acts', 9, 3, 'free', E'Acts 9:3 — *And as he journeyed, he came near Damascus: and suddenly there shined round about him a light from heaven:* As light from heaven felled the persecutor Saul, the dread apparition compasses Heliodorus with great darkness and casts him down in 2-maccabees 3:27.'),
  ('apocrypha', '2-maccabees', 3, 27, 'canon', 'acts', 9, 4, 'free', E'Acts 9:4 — *And he fell to the earth, and heard a voice saying unto him, Saul, Saul, why persecutest thou me?* Like Saul thrown to the earth and then made a herald, Heliodorus falls suddenly and is sent to declare the power he fought, in 2-maccabees 3:27,34.'),
  ('apocrypha', '2-maccabees', 3, 29, 'canon', 'psalms', 76, 7, 'free', E'Psalm 76:7 — *Thou, even thou, art to be feared: and who may stand in thy sight when once thou art angry?* Heliodorus lies cast down and speechless in 2-maccabees 3:29 because no man may stand before the wrath of Yahuah.'),
  ('apocrypha', '2-maccabees', 3, 27, 'apocrypha', '2-maccabees', 9, 5, 'extras', E'2 Maccabees 9:5 — *But Yahuah (God) Almighty, Yahuah (God) of Yashar''el (Israel), struck him with an incurable and invisible plague: or as soon as he had spoken these words, a pain of the bowels that was remediless came upon him, and sore torments of the inner parts;* The treasurer Heliodorus is felled and spared at a priest''s prayer in 2-maccabees 3:27, but the unrepentant Antiochus who likewise raged against the sanctuary is struck without remedy.'),
  -- thread: 2-maccabees-3-he-that-dwells-in-heaven-defends
  ('apocrypha', '2-maccabees', 3, 39, 'canon', 'psalms', 127, 1, 'free', E'Psalm 127:1 — *Except Yahuah (LORD) build the house, they labour in vain that build it: except Yahuah (LORD) keep the city, the watchman waketh but in vain.* Heliodorus confesses in 2-maccabees 3:39 that He who dwells in heaven keeps the place no man''s labour could defend.'),
  ('apocrypha', '2-maccabees', 3, 39, 'canon', 'zechariah', 2, 5, 'free', E'Zechariah 2:5 — *For I, saith Yahuah (LORD), will be unto her a wall of fire round about, and will be the glory in the midst of her.* The God who keeps His eye on the place and beats off its enemies in 2-maccabees 3:39 is the wall of fire round His city.'),
  ('apocrypha', '2-maccabees', 3, 39, 'canon', 'isaiah', 31, 5, 'free', E'Isaiah 31:5 — *As birds flying, so will Yahuah Tseva''ot (LORD of hosts) defend Jerusalem; defending also he will deliver it; and passing over he will preserve it.* The LORD who defends and preserves Jerusalem is the same that defendeth His place against all who would hurt it in 2-maccabees 3:39.'),
  ('apocrypha', '2-maccabees', 3, 38, 'canon', '2-thessalonians', 1, 6, 'free', E'2 Thessalonians 1:6 — *Seeing it is a righteous thing with Elohim (God) to recompense tribulation to them that trouble you;* The well-scourged spoiler of 2-maccabees 3:38 shows the righteous recompense the apostle promises to all who trouble the covenant people — it ain''t new.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2mac3_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2mac3_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-3-widows-treasure',
       E'The treasure of the widow and the fatherless',
       E'When Heliodorus comes to plunder the temple, the high priest tells him what the treasury truly holds: *Then the high priest told him that there was such money laid up for the relief of widows and fatherless children:* (2 Maccabees 3:10) — the king''s man covets gold, but it is the substance of the helpless. The Torah set a fence around exactly this: *Ye shall not afflict any widow, or fatherless child.* (Exodus 22:22), for of Yahuah it is said *He doth execute the judgment of the fatherless and widow, and loveth the stranger, in giving him food and raiment.* (Deuteronomy 10:18) and *A father of the fatherless, and a judge of the widows, is Elohim (God) in his holy habitation.* (Psalm 68:5). The same covenant heart runs straight into the apostolic age — *Pure religion and undefiled before Elohim (God) and the Father is this, To visit the fatherless and widows in their affliction, and to keep himself unspotted from the world.* (James 1:27) — it ain''t new. And the restored Tobit names the very almsgiving the temple safeguarded: *Give alms of your substance; and when you give alms, let not your eye be envious, neither turn your face from any poor, and the face of Yahuah (God) shall not be turned away from you.* (Tobit 4:7). To rob this house is to rob the poor of the covenant.',
       sv.verse_id, ev.verse_id, 'extras', 62050
  FROM _session253_2mac3_lookup sv, _session253_2mac3_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=3 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=3 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-3-priests-supplication',
       E'The priests cry out between the porch and the altar',
       E'Against the king''s decree the city does not arm itself but prays: *But the priests, prostrating themselves before the altar in their priests'' vestments, called to heaven upon him that made a law concerning things given to be kept, that they should safely be preserved for such as had committed them to be kept.* (2 Maccabees 3:15), and all the people *called upon the Almighty Yahuah (God) to keep the things committed of trust safe and sure for those that had committed them.* (2 Maccabees 3:22). This is the prophet''s own liturgy of intercession: *Let the priests, the ministers of Yahuah (LORD), weep between the porch and the altar, and let them say, Spare thy people, O Yahuah (LORD), and give not thine heritage to reproach, that the heathen should rule over them...* (Joel 2:17). It is Aaron standing in the breach — *And he stood between the dead and the living; and the plague was stayed.* (Numbers 16:48) — for no watchman avails alone: *Except Yahuah (LORD) build the house, they labour in vain that build it: except Yahuah (LORD) keep the city, the watchman waketh but in vain.* (Psalm 127:1). And the priestly intercession of Onias foreshadows the High Priest who *is able also to save them to the uttermost that come unto Elohim (God) by him, seeing he ever liveth to make intercession for them.* (Hebrews 7:25).',
       sv.verse_id, ev.verse_id, 'extras', 62053
  FROM _session253_2mac3_lookup sv, _session253_2mac3_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=3 AND sv.verse_number=15
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=3 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-3-dread-horseman',
       E'The dread horseman and the captain of the host',
       E'Heliodorus presumes to enter, and heaven answers in arms: *Yahuah (God) of spirits, and the Prince of all power, caused a great apparition...* (2 Maccabees 3:24), *For there appeared to them an horse with a terrible rider upon him, and adorned with a very fair covering, and he ran fiercely, and struck at Heliodorus with his forefeet, and it seemed that he that sat upon the horse had complete harness of gold.* (2 Maccabees 3:25). This is the armed Prince Joshua met before Jericho: *And it came to pass, when Joshua was by Jericho, that he lifted up his eyes and looked, and, behold, there stood a man over against him with his sword drawn in his hand...* (Joshua 5:13), *And he said, Nay; but as captain of the host of Yahuah (LORD) am I now come...* (Joshua 5:14). It is the lone angel who routs an empire — *And it came to pass that night, that the angel of Yahuah (LORD) went out, and smote in the camp of the Assyrians an hundred fourscore and five thousand...* (2 Kings 19:35), *And Yahuah (LORD) sent an angel, which cut off all the mighty men of valour, and the leaders and captains in the camp of the king of Assyria...* (2 Chronicles 32:21) — and the chasing angel of the psalm: *Let them be as chaff before the wind: and let the angel of Yahuah (LORD) chase them.* (Psalm 35:5). The kingdom of man marches on the holy place; the host of heaven scatters it.',
       sv.verse_id, ev.verse_id, 'extras', 62056
  FROM _session253_2mac3_lookup sv, _session253_2mac3_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=3 AND sv.verse_number=24
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=3 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-3-cast-down-and-spared',
       E'Cast down speechless, raised up a witness',
       E'The two young men scourge the spoiler and he falls: *And Heliodorus fell suddenly to the ground, and was compassed with great darkness...* (2 Maccabees 3:27), *For he by the hand of Yahuah (God) was cast down, and lay speechless without all hope of life.* (2 Maccabees 3:29) — yet at Onias'' atoning prayer he is spared and sent out to *declare to all men the mighty power of Yahuah (God).* (2 Maccabees 3:34). The persecutor felled by light and raised a herald is the very shape of Saul on the Damascus road: *And as he journeyed, he came near Damascus: and suddenly there shined round about him a light from heaven:* (Acts 9:3), *And he fell to the earth, and heard a voice saying unto him, Saul, Saul, why persecutest thou me?* (Acts 9:4). For no flesh may stand when heaven rises: *Thou, even thou, art to be feared: and who may stand in thy sight when once thou art angry?* (Psalm 76:7). And the lesson Heliodorus learns the hard kings refuse — in the very same book Antiochus, who like Heliodorus stretched out his hand against the sanctuary, is met not with mercy but the end of the proud: *But Yahuah (God) Almighty, Yahuah (God) of Yashar''el (Israel), struck him with an incurable and invisible plague... and sore torments of the inner parts;* (2 Maccabees 9:5).',
       sv.verse_id, ev.verse_id, 'extras', 62059
  FROM _session253_2mac3_lookup sv, _session253_2mac3_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=3 AND sv.verse_number=27
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=3 AND ev.verse_number=34
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-3-he-that-dwells-in-heaven-defends',
       E'He that dwells in heaven defends His place',
       E'Heliodorus himself bears the verdict back to the king: *If you have any enemy or traitor, send him thither, and you shall receive him well scourged, if he escape with his life: for in that place, no doubt, there is an especial power of Yahuah (God).* (2 Maccabees 3:38), *For he that dwells in heaven has his eye on that place, and defendeth it; and he beateth and destroys them that come to hurt it.* (2 Maccabees 3:39). The watchman is Yahuah Himself: *Except Yahuah (LORD) build the house, they labour in vain that build it: except Yahuah (LORD) keep the city, the watchman waketh but in vain.* (Psalm 127:1), who promises to His city *For I, saith Yahuah (LORD), will be unto her a wall of fire round about, and will be the glory in the midst of her.* (Zechariah 2:5), and who covers it like birds in flight — *As birds flying, so will Yahuah Tseva''ot (LORD of hosts) defend Jerusalem; defending also he will deliver it; and passing over he will preserve it.* (Isaiah 31:5). It is no less than the righteous judgment the apostle preaches — *Seeing it is a righteous thing with Elohim (God) to recompense tribulation to them that trouble you;* (2 Thessalonians 1:6). The kingdom of man cannot strip the house its Builder guards.',
       sv.verse_id, ev.verse_id, 'extras', 62062
  FROM _session253_2mac3_lookup sv, _session253_2mac3_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=3 AND sv.verse_number=38
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=3 AND ev.verse_number=39
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-maccabees-3-widows-treasure
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 22:22 — *Ye shall not afflict any widow, or fatherless child.* The treasury Heliodorus came to seize was the very substance the Torah forbids any man to afflict.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac3_lookup sv, _session253_2mac3_lookup tv
 WHERE t.slug='2-maccabees-3-widows-treasure'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=3 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=22 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 10:18 — *He doth execute the judgment of the fatherless and widow, and loveth the stranger, in giving him food and raiment.* Yahuah Himself defends the cause whose relief was laid up in the house at 2-maccabees 3:10.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac3_lookup sv, _session253_2mac3_lookup tv
 WHERE t.slug='2-maccabees-3-widows-treasure'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=3 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=10 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 68:5 — *A father of the fatherless, and a judge of the widows, is Elohim (God) in his holy habitation.* The God of the widow dwells in the very habitation Heliodorus presumed to plunder.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac3_lookup sv, _session253_2mac3_lookup tv
 WHERE t.slug='2-maccabees-3-widows-treasure'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=3 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=68 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'James 1:27 — *Pure religion and undefiled before Elohim (God) and the Father is this, To visit the fatherless and widows in their affliction, and to keep himself unspotted from the world.* The same covenant care the temple stored is named the heart of pure religion — it ain''t new.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac3_lookup sv, _session253_2mac3_lookup tv
 WHERE t.slug='2-maccabees-3-widows-treasure'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=3 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Tobit 4:7 — *Give alms of your substance; and when you give alms, let not your eye be envious, neither turn your face from any poor, and the face of Yahuah (God) shall not be turned away from you.* The restored Tobit names the almsgiving for the poor that the temple treasury safeguarded in 2-maccabees 3:10.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac3_lookup sv, _session253_2mac3_lookup tv
 WHERE t.slug='2-maccabees-3-widows-treasure'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=3 AND sv.verse_number=10
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=4 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-3-priests-supplication
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joel 2:17 — *Let the priests, the ministers of Yahuah (LORD), weep between the porch and the altar, and let them say, Spare thy people, O Yahuah (LORD), and give not thine heritage to reproach, that the heathen should rule over them: wherefore should they say among the people, Where is their Elohim (God)?* The very prophetic liturgy the priests enact prostrate before the altar in 2-maccabees 3:15.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac3_lookup sv, _session253_2mac3_lookup tv
 WHERE t.slug='2-maccabees-3-priests-supplication'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=3 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 16:48 — *And he stood between the dead and the living; and the plague was stayed.* As Aaron''s priestly standing turned back wrath, so the priests'' supplication stands between the temple and the spoiler at 2-maccabees 3:15.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac3_lookup sv, _session253_2mac3_lookup tv
 WHERE t.slug='2-maccabees-3-priests-supplication'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=3 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=16 AND tv.verse_number=48
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 127:1 — *Except Yahuah (LORD) build the house, they labour in vain that build it: except Yahuah (LORD) keep the city, the watchman waketh but in vain.* The people commit the keeping to the Almighty in 2-maccabees 3:22 because no human watch can guard the house.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac3_lookup sv, _session253_2mac3_lookup tv
 WHERE t.slug='2-maccabees-3-priests-supplication'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=3 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=127 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hebrews 7:25 — *Wherefore he is able also to save them to the uttermost that come unto Elohim (God) by him, seeing he ever liveth to make intercession for them.* The interceding priesthood of Onias points to the High Priest who ever lives to intercede — it ain''t new.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac3_lookup sv, _session253_2mac3_lookup tv
 WHERE t.slug='2-maccabees-3-priests-supplication'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=3 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=7 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-3-dread-horseman
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 5:13 — *And it came to pass, when Joshua was by Jericho, that he lifted up his eyes and looked, and, behold, there stood a man over against him with his sword drawn in his hand: and Joshua went unto him, and said unto him, Art thou for us, or for our adversaries?* The armed rider who strikes Heliodorus in 2-maccabees 3:25 is the same captain-of-the-host who stood sword-drawn for the LORD''s place.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac3_lookup sv, _session253_2mac3_lookup tv
 WHERE t.slug='2-maccabees-3-dread-horseman'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=3 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=5 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joshua 5:14 — *And he said, Nay; but as captain of the host of Yahuah (LORD) am I now come. And Joshua fell on his face to the earth, and did worship, and said unto him, What saith my lord unto his servant?* The Prince of all power who causes the apparition in 2-maccabees 3:24 is the captain of Yahuah''s host come to defend His own.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac3_lookup sv, _session253_2mac3_lookup tv
 WHERE t.slug='2-maccabees-3-dread-horseman'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=3 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=5 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Kings 19:35 — *And it came to pass that night, that the angel of Yahuah (LORD) went out, and smote in the camp of the Assyrians an hundred fourscore and five thousand: and when they arose early in the morning, behold, they were all dead corpses.* The same heaven that smote Assyria for besieging Jerusalem strikes Heliodorus'' host in 2-maccabees 3:24.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac3_lookup sv, _session253_2mac3_lookup tv
 WHERE t.slug='2-maccabees-3-dread-horseman'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=3 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=19 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Chronicles 32:21 — *And Yahuah (LORD) sent an angel, which cut off all the mighty men of valour, and the leaders and captains in the camp of the king of Assyria. So he returned with shame of face to his own land...* As one angel cut off Sennacherib''s captains, so the apparition routs the king''s treasurer in 2-maccabees 3:24.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac3_lookup sv, _session253_2mac3_lookup tv
 WHERE t.slug='2-maccabees-3-dread-horseman'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=3 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=32 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Psalm 35:5 — *Let them be as chaff before the wind: and let the angel of Yahuah (LORD) chase them.* The fiercely running rider of 2-maccabees 3:25 is the chasing angel the psalmist summoned against the oppressors of the righteous.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac3_lookup sv, _session253_2mac3_lookup tv
 WHERE t.slug='2-maccabees-3-dread-horseman'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=3 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=35 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-3-cast-down-and-spared
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Acts 9:3 — *And as he journeyed, he came near Damascus: and suddenly there shined round about him a light from heaven:* As light from heaven felled the persecutor Saul, the dread apparition compasses Heliodorus with great darkness and casts him down in 2-maccabees 3:27.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac3_lookup sv, _session253_2mac3_lookup tv
 WHERE t.slug='2-maccabees-3-cast-down-and-spared'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=3 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=9 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Acts 9:4 — *And he fell to the earth, and heard a voice saying unto him, Saul, Saul, why persecutest thou me?* Like Saul thrown to the earth and then made a herald, Heliodorus falls suddenly and is sent to declare the power he fought, in 2-maccabees 3:27,34.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac3_lookup sv, _session253_2mac3_lookup tv
 WHERE t.slug='2-maccabees-3-cast-down-and-spared'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=3 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=9 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 76:7 — *Thou, even thou, art to be feared: and who may stand in thy sight when once thou art angry?* Heliodorus lies cast down and speechless in 2-maccabees 3:29 because no man may stand before the wrath of Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac3_lookup sv, _session253_2mac3_lookup tv
 WHERE t.slug='2-maccabees-3-cast-down-and-spared'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=3 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=76 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Maccabees 9:5 — *But Yahuah (God) Almighty, Yahuah (God) of Yashar''el (Israel), struck him with an incurable and invisible plague: or as soon as he had spoken these words, a pain of the bowels that was remediless came upon him, and sore torments of the inner parts;* The treasurer Heliodorus is felled and spared at a priest''s prayer in 2-maccabees 3:27, but the unrepentant Antiochus who likewise raged against the sanctuary is struck without remedy.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac3_lookup sv, _session253_2mac3_lookup tv
 WHERE t.slug='2-maccabees-3-cast-down-and-spared'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=3 AND sv.verse_number=27
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=9 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-3-he-that-dwells-in-heaven-defends
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 127:1 — *Except Yahuah (LORD) build the house, they labour in vain that build it: except Yahuah (LORD) keep the city, the watchman waketh but in vain.* Heliodorus confesses in 2-maccabees 3:39 that He who dwells in heaven keeps the place no man''s labour could defend.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac3_lookup sv, _session253_2mac3_lookup tv
 WHERE t.slug='2-maccabees-3-he-that-dwells-in-heaven-defends'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=3 AND sv.verse_number=39
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=127 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Zechariah 2:5 — *For I, saith Yahuah (LORD), will be unto her a wall of fire round about, and will be the glory in the midst of her.* The God who keeps His eye on the place and beats off its enemies in 2-maccabees 3:39 is the wall of fire round His city.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac3_lookup sv, _session253_2mac3_lookup tv
 WHERE t.slug='2-maccabees-3-he-that-dwells-in-heaven-defends'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=3 AND sv.verse_number=39
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=2 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 31:5 — *As birds flying, so will Yahuah Tseva''ot (LORD of hosts) defend Jerusalem; defending also he will deliver it; and passing over he will preserve it.* The LORD who defends and preserves Jerusalem is the same that defendeth His place against all who would hurt it in 2-maccabees 3:39.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac3_lookup sv, _session253_2mac3_lookup tv
 WHERE t.slug='2-maccabees-3-he-that-dwells-in-heaven-defends'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=3 AND sv.verse_number=39
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=31 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Thessalonians 1:6 — *Seeing it is a righteous thing with Elohim (God) to recompense tribulation to them that trouble you;* The well-scourged spoiler of 2-maccabees 3:38 shows the righteous recompense the apostle promises to all who trouble the covenant people — it ain''t new.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac3_lookup sv, _session253_2mac3_lookup tv
 WHERE t.slug='2-maccabees-3-he-that-dwells-in-heaven-defends'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=3 AND sv.verse_number=38
   AND tv.edition_slug='canon' AND tv.book_slug='2-thessalonians' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

