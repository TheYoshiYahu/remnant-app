-- ----- fragment: minion_thewisdomofsolomon_19.sql (session253 the-wisdom-of-solomon 19) -----
-- Source anchor: apocrypha/the-wisdom-of-solomon ch19. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: wis19 (view _session253_wis19_lookup). Sort band base 58450, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_wis19_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: wisdom-19-red-sea-way-and-grave
  ('apocrypha', 'the-wisdom-of-solomon', 19, 7, 'canon', 'exodus', 14, 21, 'free', E'Exodus 14:21 — *And Moses stretched out his hand over the sea; and the LORD caused the sea to go back by a strong east wind all that night, and made the sea dry land, and the waters were divided.* The dry land and the way through the Red sea Wisdom 19:7 names is the very dividing of the waters in the Torah.'),
  ('apocrypha', 'the-wisdom-of-solomon', 19, 8, 'canon', 'exodus', 14, 22, 'free', E'Exodus 14:22 — *And the children of Israel went into the midst of the sea upon the dry ground: and the waters were a wall unto them on their right hand, and on their left.* Wisdom 19:8''s people who ''went'' through, defended by Yahuah''s hand, are Israel walled in by the waters.'),
  ('apocrypha', 'the-wisdom-of-solomon', 19, 3, 'canon', 'exodus', 14, 28, 'free', E'Exodus 14:28 — *And the waters returned, and covered the chariots, and the horsemen, and all the host of Pharaoh that came into the sea after them; there remained not so much as one of them.* The pursuers of Wisdom 19:2-3, drawn by their destiny, find in the same sea the ''strange death'' (19:5) — a grave where Israel found a road.'),
  -- thread: wisdom-19-song-of-the-redeemed
  ('apocrypha', 'the-wisdom-of-solomon', 19, 9, 'canon', 'exodus', 15, 1, 'free', E'Exodus 15:1 — *Then sang Moses and the children of Israel this song unto the LORD, and spake, saying, I will sing unto the LORD, for he hath triumphed gloriously: the horse and his rider hath he thrown into the sea.* The leaping, horse-like praise of Wisdom 19:9 is the Song of the Sea — Israel''s first worship after the crossing.'),
  ('apocrypha', 'the-wisdom-of-solomon', 19, 22, 'canon', 'exodus', 15, 13, 'free', E'Exodus 15:13 — *Thou in thy mercy hast led forth the people which thou hast redeemed: thou hast guided them in thy strength unto thy holy habitation.* The closing magnifying of His people in Wisdom 19:22 echoes the song''s confession that mercy led the redeemed to the holy habitation.'),
  ('apocrypha', 'the-wisdom-of-solomon', 19, 22, 'canon', 'deuteronomy', 7, 6, 'free', E'Deuteronomy 7:6 — *For thou art an holy people unto the LORD thy God: the LORD thy God hath chosen thee to be a special people unto himself, above all people that are upon the face of the earth.* Wisdom''s final word that Yahuah magnified and glorified His people rests on the Torah''s doctrine of election.'),
  -- thread: wisdom-19-creature-fashioned-anew
  ('apocrypha', 'the-wisdom-of-solomon', 19, 6, 'canon', 'isaiah', 43, 19, 'free', E'Isaiah 43:19 — *Behold, I will do a new thing; now it shall spring forth; shall ye not know it? I will even make a way in the wilderness, and rivers in the desert.* The creature ''fashioned again anew'' in Wisdom 19:6 is Isaiah''s ''new thing'' — a way made where there was none, for His people.'),
  ('apocrypha', 'the-wisdom-of-solomon', 19, 7, 'canon', 'isaiah', 43, 16, 'free', E'Isaiah 43:16 — *Thus saith the LORD, which maketh a way in the sea, and a path in the mighty waters.* Wisdom 19:7''s ''way without impediment'' out of the Red sea is exactly the LORD who makes a path in the mighty waters.'),
  ('apocrypha', 'the-wisdom-of-solomon', 19, 6, 'canon', 'romans', 8, 19, 'free', E'Romans 8:19 — *For the earnest expectation of the creature waiteth for the manifestation of the sons of God.* The ''whole creature'' re-fashioned to keep His children unhurt (Wisdom 19:6) is the very creature Paul says waits for the revealing of the sons of God.'),
  ('apocrypha', 'the-wisdom-of-solomon', 19, 18, 'canon', 'revelation', 21, 1, 'free', E'Revelation 21:1 — *And I saw a new heaven and a new earth: for the first heaven and the first earth were passed away; and there was no more sea.* The elements re-harmonized in Wisdom 19:18 anticipate the final re-creation John beholds, where the sea itself is gone.'),
  -- thread: wisdom-19-elements-changed-fire-in-water
  ('apocrypha', 'the-wisdom-of-solomon', 19, 20, 'canon', 'exodus', 9, 24, 'free', E'Exodus 9:24 — *So there was hail, and fire mingled with the hail, very grievous, such as there was none like it in all the land of Egypt since it became a nation.* Wisdom 19:20''s fire having power in the water is the Torah''s hail mingled with fire — the elements set against their own nature.'),
  ('apocrypha', 'the-wisdom-of-solomon', 19, 7, 'canon', 'exodus', 13, 21, 'free', E'Exodus 13:21 — *And the LORD went before them by day in a pillar of a cloud, to lead them the way; and by night in a pillar of fire, to give them light; to go by day and night.* The cloud shadowing the camp in Wisdom 19:7 is the pillar that was cloud by day and fire by night — element bent to guard His people.'),
  -- thread: wisdom-19-sodom-and-the-inhospitable
  ('apocrypha', 'the-wisdom-of-solomon', 19, 17, 'canon', 'genesis', 19, 11, 'free', E'Genesis 19:11 — *And they smote the men that were at the door of the house with blindness, both small and great: so that they wearied themselves to find the door.* Wisdom 19:17''s blindness at the doors of the righteous man, every one seeking his own door, is the smiting of the Sodomites at Lot''s house.'),
  ('apocrypha', 'the-wisdom-of-solomon', 19, 14, 'canon', 'matthew', 10, 15, 'free', E'Matthew 10:15 — *Verily I say unto you, It shall be more tolerable for the land of Sodom and Gomorrah in the day of judgment, than for that city.* Wisdom 19:14 makes Egypt''s mistreatment of the stranger worse than Sodom''s; Yahusha likewise weighs the inhospitable city below Sodom in judgment.'),
  ('apocrypha', 'the-wisdom-of-solomon', 19, 14, 'apocrypha', 'ecclesiasticus', 16, 8, 'extras', E'Ecclesiasticus 16:8 — *Neither spared he the place where Lot sojourned, but abhorred them for their pride.* Yeshua ben Sira, like Wisdom 19:14, recalls Sodom''s pride and inhospitality as the pattern of judgment on those who despise the stranger.'),
  -- thread: wisdom-19-quails-and-the-plagues
  ('apocrypha', 'the-wisdom-of-solomon', 19, 10, 'canon', 'exodus', 8, 3, 'free', E'Exodus 8:3 — *And the river shall bring forth frogs abundantly, which shall go up and come into thine house, and into thy bedchamber, and upon thy bed.* Wisdom 19:10''s river casting up frogs instead of fishes is the second plague of the Torah.'),
  ('apocrypha', 'the-wisdom-of-solomon', 19, 12, 'canon', 'numbers', 11, 31, 'free', E'Numbers 11:31 — *And there went forth a wind from the LORD, and brought quails from the sea, and let them fall by the camp.* The quails ''from the sea for their contentment'' in Wisdom 19:12 are the wilderness quail-provision of Numbers 11.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_wis19_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_wis19_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-19-red-sea-way-and-grave',
       E'The sea: a way for Yashar''el, a grave for Egypt',
       E'Wisdom rehearses the climactic deliverance: *As namely, a cloud shadowing the camp; and where water stood before, dry land appeared; and out of the Red sea a way without impediment; and out of the violent stream a green field* (Wisdom of Solomon 19:7), and the ungodly, *having given them leave to depart... they would repent and pursue them* (Wisdom of Solomon 19:2). The Torah account stands behind every line: *And Moses stretched out his hand over the sea; and the LORD caused the sea to go back by a strong east wind all that night, and made the sea dry land, and the waters were divided* (Exodus 14:21), and the same waters that walled up for Israel closed over Pharaoh''s host — *and the waters returned, and covered the chariots, and the horsemen, and all the host of Pharaoh that came into the sea after them; there remained not so much as one of them* (Exodus 14:28). One element, two destinies — escape for the elect, the grave for the oppressor; mercy and judgment are the same act of the same hand. It ain''t new: the apocryphal hymn is only retelling the Exodus.',
       sv.verse_id, ev.verse_id, 'extras', 58450
  FROM _session253_wis19_lookup sv, _session253_wis19_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=19 AND sv.verse_number=2
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=19 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-19-song-of-the-redeemed',
       E'Leaping like lambs, praising the Deliverer',
       E'On the far shore the redeemed break into praise: *For they went at large like horses, and leaped like lambs, praising you, O Yahuah (God), who hadst delivered them* (Wisdom of Solomon 19:9), and the book seals its whole argument with a doxology — *For in all things, O Yahuah (God), you did magnify your people, and glorify them, neither did you lightly regard them: but did assist them in every time and place* (Wisdom of Solomon 19:22). This is the Song of the Sea continued: *Then sang Moses and the children of Israel this song unto the LORD, and spake, saying, I will sing unto the LORD, for he hath triumphed gloriously: the horse and his rider hath he thrown into the sea* (Exodus 15:1), the song that ends in covenant rest — *Thou in thy mercy hast led forth the people which thou hast redeemed: thou hast guided them in thy strength unto thy holy habitation* (Exodus 15:13). The lamb-imagery is no accident: deliverance through the sea is birthed by the Passover lamb, and the redeemed leap for the One who magnifies His people. Election sung, not earned.',
       sv.verse_id, ev.verse_id, 'extras', 58453
  FROM _session253_wis19_lookup sv, _session253_wis19_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=19 AND sv.verse_number=9
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=19 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-19-creature-fashioned-anew',
       E'The whole creature fashioned again anew',
       E'Wisdom gives the cosmic key to the plagues and the crossing: *For the whole creature in his proper kind was fashioned again anew, serving the peculiar commandments that were given to them, that your children might be kept without hurt* (Wisdom of Solomon 19:6) — creation itself re-tuned, *the elements were changed in themselves by a kind of harmony, like as in a psaltery notes change the name of the tune, and yet are always sounds* (Wisdom of Solomon 19:18). This is the same renewal the prophets and apostles announce. Isaiah binds the new thing to the very sea-road of Exodus: *Thus saith the LORD, which maketh a way in the sea, and a path in the mighty waters* (Isaiah 43:16) — *Behold, I will do a new thing; now it shall spring forth; shall ye not know it? I will even make a way in the wilderness, and rivers in the desert* (Isaiah 43:19). Paul hears the whole creation groaning toward that day — *For the earnest expectation of the creature waiteth for the manifestation of the sons of God* (Romans 8:19) — and John sees its consummation: *And I saw a new heaven and a new earth: for the first heaven and the first earth were passed away; and there was no more sea* (Revelation 21:1). The creature fashioned anew for the elect is the first-fruits of the new creation. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 58456
  FROM _session253_wis19_lookup sv, _session253_wis19_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=19 AND sv.verse_number=6
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=19 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-19-elements-changed-fire-in-water',
       E'Fire in the water: the elements forget their nature',
       E'Wisdom marvels at the plagues'' reversal of nature for Israel''s sake: *The fire had power in the water, forgetting his own virtue: and the water forgat his own quenching nature* (Wisdom of Solomon 19:20) — *For earthly things were turned into watery, and the things, that before swam in the water, now went upon the ground* (Wisdom of Solomon 19:19). The hail-and-fire plague is the source: *So there was hail, and fire mingled with the hail, very grievous, such as there was none like it in all the land of Egypt since it became a nation* (Exodus 9:24). And the protecting cloud of Wisdom 19:7 stood as fire by night — *And the LORD went before them by day in a pillar of a cloud, to lead them the way; and by night in a pillar of fire, to give them light; to go by day and night* (Exodus 13:21). The same fire that consumes Egypt lights Israel''s road; the elements obey their Maker''s command, not their own ''virtue.'' Creation is His servant, re-tuned to keep the covenant seed.',
       sv.verse_id, ev.verse_id, 'extras', 58459
  FROM _session253_wis19_lookup sv, _session253_wis19_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=19 AND sv.verse_number=18
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=19 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-19-sodom-and-the-inhospitable',
       E'Egypt''s sin worse than Sodom''s: smiting the stranger',
       E'Wisdom indicts Egypt by comparison to Sodom: *Therefore even with blindness were these stricken, as those were at the doors of the righteous man: when, being compassed about with horrible great darkness, every one sought the passage of his own doors* (Wisdom of Solomon 19:17) — for *the Sodomites did not receive those, whom they knew not when they came: but these brought friends into bondage, that had well deserved of them* (Wisdom of Solomon 19:14). The blindness at the door is straight from the Lot account: *And they smote the men that were at the door of the house with blindness, both small and great: so that they wearied themselves to find the door* (Genesis 19:11). The two judgments rhyme — strangers despised, light withdrawn — and the Scriptures hold both up as warnings. Yahusha Himself ranks the inhospitable city beneath Sodom: *Verily I say unto you, It shall be more tolerable for the land of Sodom and Gomorrah in the day of judgment, than for that city* (Matthew 10:15). Hospitality to the stranger is covenant weight; its refusal invites the doom of Sodom and Egypt alike.',
       sv.verse_id, ev.verse_id, 'extras', 58462
  FROM _session253_wis19_lookup sv, _session253_wis19_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=19 AND sv.verse_number=13
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=19 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-19-quails-and-the-plagues',
       E'Frogs, flies, and quails: the strange land remembered',
       E'Wisdom recalls the plagues poured on Egypt and the food given to Israel: *how the ground brought forth flies instead of cattle, and how the river cast up a multitude of frogs instead of fishes* (Wisdom of Solomon 19:10), and then *For quails came up to them from the sea for their contentment* (Wisdom of Solomon 19:12). The frogs from the river are Exodus 8: *And the river shall bring forth frogs abundantly, which shall go up and come into thine house, and into thy bedchamber, and upon thy bed* (Exodus 8:3). The quails are the wilderness provision of Numbers 11: *And there went forth a wind from the LORD, and brought quails from the sea, and let them fall by the camp* (Numbers 11:31). The same creation that plagues Egypt feeds Israel — judgment and mercy from one hand, the elements serving ''the peculiar commandments that were given to them'' (19:6). The Maker disposes His creatures for and against, by covenant.',
       sv.verse_id, ev.verse_id, 'extras', 58465
  FROM _session253_wis19_lookup sv, _session253_wis19_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=19 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=19 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: wisdom-19-red-sea-way-and-grave
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 14:21 — *And Moses stretched out his hand over the sea; and the LORD caused the sea to go back by a strong east wind all that night, and made the sea dry land, and the waters were divided.* The dry land and the way through the Red sea Wisdom 19:7 names is the very dividing of the waters in the Torah.'
  FROM cross_reference_threads t, cross_references x, _session253_wis19_lookup sv, _session253_wis19_lookup tv
 WHERE t.slug='wisdom-19-red-sea-way-and-grave'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=19 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=14 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 14:22 — *And the children of Israel went into the midst of the sea upon the dry ground: and the waters were a wall unto them on their right hand, and on their left.* Wisdom 19:8''s people who ''went'' through, defended by Yahuah''s hand, are Israel walled in by the waters.'
  FROM cross_reference_threads t, cross_references x, _session253_wis19_lookup sv, _session253_wis19_lookup tv
 WHERE t.slug='wisdom-19-red-sea-way-and-grave'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=19 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=14 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 14:28 — *And the waters returned, and covered the chariots, and the horsemen, and all the host of Pharaoh that came into the sea after them; there remained not so much as one of them.* The pursuers of Wisdom 19:2-3, drawn by their destiny, find in the same sea the ''strange death'' (19:5) — a grave where Israel found a road.'
  FROM cross_reference_threads t, cross_references x, _session253_wis19_lookup sv, _session253_wis19_lookup tv
 WHERE t.slug='wisdom-19-red-sea-way-and-grave'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=19 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=14 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-19-song-of-the-redeemed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 15:1 — *Then sang Moses and the children of Israel this song unto the LORD, and spake, saying, I will sing unto the LORD, for he hath triumphed gloriously: the horse and his rider hath he thrown into the sea.* The leaping, horse-like praise of Wisdom 19:9 is the Song of the Sea — Israel''s first worship after the crossing.'
  FROM cross_reference_threads t, cross_references x, _session253_wis19_lookup sv, _session253_wis19_lookup tv
 WHERE t.slug='wisdom-19-song-of-the-redeemed'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=19 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=15 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 15:13 — *Thou in thy mercy hast led forth the people which thou hast redeemed: thou hast guided them in thy strength unto thy holy habitation.* The closing magnifying of His people in Wisdom 19:22 echoes the song''s confession that mercy led the redeemed to the holy habitation.'
  FROM cross_reference_threads t, cross_references x, _session253_wis19_lookup sv, _session253_wis19_lookup tv
 WHERE t.slug='wisdom-19-song-of-the-redeemed'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=19 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=15 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 7:6 — *For thou art an holy people unto the LORD thy God: the LORD thy God hath chosen thee to be a special people unto himself, above all people that are upon the face of the earth.* Wisdom''s final word that Yahuah magnified and glorified His people rests on the Torah''s doctrine of election.'
  FROM cross_reference_threads t, cross_references x, _session253_wis19_lookup sv, _session253_wis19_lookup tv
 WHERE t.slug='wisdom-19-song-of-the-redeemed'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=19 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-19-creature-fashioned-anew
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 43:19 — *Behold, I will do a new thing; now it shall spring forth; shall ye not know it? I will even make a way in the wilderness, and rivers in the desert.* The creature ''fashioned again anew'' in Wisdom 19:6 is Isaiah''s ''new thing'' — a way made where there was none, for His people.'
  FROM cross_reference_threads t, cross_references x, _session253_wis19_lookup sv, _session253_wis19_lookup tv
 WHERE t.slug='wisdom-19-creature-fashioned-anew'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=19 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=43 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 43:16 — *Thus saith the LORD, which maketh a way in the sea, and a path in the mighty waters.* Wisdom 19:7''s ''way without impediment'' out of the Red sea is exactly the LORD who makes a path in the mighty waters.'
  FROM cross_reference_threads t, cross_references x, _session253_wis19_lookup sv, _session253_wis19_lookup tv
 WHERE t.slug='wisdom-19-creature-fashioned-anew'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=19 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=43 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 8:19 — *For the earnest expectation of the creature waiteth for the manifestation of the sons of God.* The ''whole creature'' re-fashioned to keep His children unhurt (Wisdom 19:6) is the very creature Paul says waits for the revealing of the sons of God.'
  FROM cross_reference_threads t, cross_references x, _session253_wis19_lookup sv, _session253_wis19_lookup tv
 WHERE t.slug='wisdom-19-creature-fashioned-anew'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=19 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 21:1 — *And I saw a new heaven and a new earth: for the first heaven and the first earth were passed away; and there was no more sea.* The elements re-harmonized in Wisdom 19:18 anticipate the final re-creation John beholds, where the sea itself is gone.'
  FROM cross_reference_threads t, cross_references x, _session253_wis19_lookup sv, _session253_wis19_lookup tv
 WHERE t.slug='wisdom-19-creature-fashioned-anew'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=19 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-19-elements-changed-fire-in-water
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 9:24 — *So there was hail, and fire mingled with the hail, very grievous, such as there was none like it in all the land of Egypt since it became a nation.* Wisdom 19:20''s fire having power in the water is the Torah''s hail mingled with fire — the elements set against their own nature.'
  FROM cross_reference_threads t, cross_references x, _session253_wis19_lookup sv, _session253_wis19_lookup tv
 WHERE t.slug='wisdom-19-elements-changed-fire-in-water'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=19 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=9 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 13:21 — *And the LORD went before them by day in a pillar of a cloud, to lead them the way; and by night in a pillar of fire, to give them light; to go by day and night.* The cloud shadowing the camp in Wisdom 19:7 is the pillar that was cloud by day and fire by night — element bent to guard His people.'
  FROM cross_reference_threads t, cross_references x, _session253_wis19_lookup sv, _session253_wis19_lookup tv
 WHERE t.slug='wisdom-19-elements-changed-fire-in-water'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=19 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=13 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-19-sodom-and-the-inhospitable
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 19:11 — *And they smote the men that were at the door of the house with blindness, both small and great: so that they wearied themselves to find the door.* Wisdom 19:17''s blindness at the doors of the righteous man, every one seeking his own door, is the smiting of the Sodomites at Lot''s house.'
  FROM cross_reference_threads t, cross_references x, _session253_wis19_lookup sv, _session253_wis19_lookup tv
 WHERE t.slug='wisdom-19-sodom-and-the-inhospitable'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=19 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=19 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 10:15 — *Verily I say unto you, It shall be more tolerable for the land of Sodom and Gomorrah in the day of judgment, than for that city.* Wisdom 19:14 makes Egypt''s mistreatment of the stranger worse than Sodom''s; Yahusha likewise weighs the inhospitable city below Sodom in judgment.'
  FROM cross_reference_threads t, cross_references x, _session253_wis19_lookup sv, _session253_wis19_lookup tv
 WHERE t.slug='wisdom-19-sodom-and-the-inhospitable'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=19 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=10 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ecclesiasticus 16:8 — *Neither spared he the place where Lot sojourned, but abhorred them for their pride.* Yeshua ben Sira, like Wisdom 19:14, recalls Sodom''s pride and inhospitality as the pattern of judgment on those who despise the stranger.'
  FROM cross_reference_threads t, cross_references x, _session253_wis19_lookup sv, _session253_wis19_lookup tv
 WHERE t.slug='wisdom-19-sodom-and-the-inhospitable'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=19 AND sv.verse_number=14
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=16 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-19-quails-and-the-plagues
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 8:3 — *And the river shall bring forth frogs abundantly, which shall go up and come into thine house, and into thy bedchamber, and upon thy bed.* Wisdom 19:10''s river casting up frogs instead of fishes is the second plague of the Torah.'
  FROM cross_reference_threads t, cross_references x, _session253_wis19_lookup sv, _session253_wis19_lookup tv
 WHERE t.slug='wisdom-19-quails-and-the-plagues'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=19 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=8 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 11:31 — *And there went forth a wind from the LORD, and brought quails from the sea, and let them fall by the camp.* The quails ''from the sea for their contentment'' in Wisdom 19:12 are the wilderness quail-provision of Numbers 11.'
  FROM cross_reference_threads t, cross_references x, _session253_wis19_lookup sv, _session253_wis19_lookup tv
 WHERE t.slug='wisdom-19-quails-and-the-plagues'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=19 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=11 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

