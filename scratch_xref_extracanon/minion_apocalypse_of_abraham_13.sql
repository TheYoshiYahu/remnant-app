-- ----- fragment: minion_apocalypseofabraham_13.sql (session253 apocalypse-of-abraham 13) -----
-- Source anchor: apocalypse-of-abraham/apocalypse-of-abraham ch13. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: aoa13 (view _session253_aoa13_lookup). Sort band base 67300, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_aoa13_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: apocalypse-of-abraham-13-the-bird-driven-from-the-sacrifice
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 13, 1, 'canon', 'genesis', 15, 9, 'free', E'Genesis 15:9 — *And he said unto him, Take me an heifer of three years old, and a she goat of three years old, and a ram of three years old, and a turtledove, and a young pigeon.* The divided animals and the birds of Apocalypse of Abraham 13:1 are the very covenant offering Yahuah commanded Abram to take.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 13, 1, 'canon', 'genesis', 15, 10, 'free', E'Genesis 15:10 — *And he took unto him all these, and divided them in the midst, and laid each piece one against another: but the birds divided he not.* That the angel takes the birds whole in Apocalypse of Abraham 13:1 keeps faith with Abram dividing the beasts but not the birds.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 13, 3, 'canon', 'genesis', 15, 11, 'free', E'Genesis 15:11 — *And when the fowls came down upon the carcases, Abram drove them away.* The unclean bird Abraham drives off in Apocalypse of Abraham 13:3 is the same fowl that came down upon the covenant carcases and was driven away in Genesis.'),
  -- thread: apocalypse-of-abraham-13-this-is-azazel
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 13, 7, 'canon', 'leviticus', 16, 8, 'free', E'Leviticus 16:8 — *And Aaron shall cast lots upon the two goats; one lot for Yahuah (LORD), and the other lot for the scapegoat.* The naming of Azazel in Apocalypse of Abraham 13:7 reaches straight back to the lot of the scapegoat cast on the day of atonement.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 13, 8, 'canon', 'leviticus', 16, 10, 'free', E'Leviticus 16:10 — *But the goat, on which the lot fell to be the scapegoat, shall be presented alive before Yahuah (LORD), to make an atonement with him, and to let him go for a scapegoat into the wilderness.* The disgrace pronounced on Azazel in Apocalypse of Abraham 13:8 is the sending-away of the uncleanness-bearing goat into the wilderness.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 13, 7, 'enoch', '1-enoch', 10, 8, 'extras', E'1 Enoch 10:8 — *And the whole earth has been corrupted through the works that were taught by Azâzêl: to him ascribe all sin.* The ungodliness named in Apocalypse of Abraham 13:7 is the same Watcher to whom the earth''s corruption and all sin are ascribed.'),
  -- thread: apocalypse-of-abraham-13-his-lot-on-earth-cast-down
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 13, 10, 'enoch', '1-enoch', 10, 4, 'extras', E'1 Enoch 10:4 — *And again Yahuah (God) said to Raphael: ''Bind Azâzêl hand and foot, and cast him into the darkness: and make an opening in the desert, which is in Dûdâêl, and cast him therein.* Azazel made a dweller upon the earth in Apocalypse of Abraham 13:10 is the same Watcher bound and cast into the desert-darkness.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 13, 9, 'canon', 'jude', 1, 6, 'free', E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* That Azazel''s lot is on the earth and not in heaven (Apocalypse of Abraham 13:9) is the angels who left their first habitation, reserved unto judgment.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 13, 10, 'canon', 'revelation', 12, 9, 'free', E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The adversary made a dweller upon the earth in Apocalypse of Abraham 13:10 is the dragon cast down to the earth with his angels.'),
  -- thread: apocalypse-of-abraham-13-the-righteous-not-in-thy-hand
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 13, 13, 'canon', 'zechariah', 3, 2, 'free', E'Zechariah 3:2 — *And Yahuah (LORD) said unto Satan, Yahuah (LORD) rebuke thee, O Satan; even Yahuah (LORD) that hath chosen Jerusalem rebuke thee: is not this a brand plucked out of the fire?* The angel''s "Depart from this man!" in Apocalypse of Abraham 13:13 is the LORD''s rebuke of the accuser who resists the chosen.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 13, 12, 'canon', 'james', 4, 7, 'free', E'James 4:7 — *Submit yourselves therefore to Elohim (God). Resist the devil, and he will flee from you.* That the tempter has no leave to play upon the righteous (Apocalypse of Abraham 13:12) is the devil who flees when resisted.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 13, 10, 'canon', 'luke', 10, 19, 'free', E'Luke 10:19 — *Behold, I give unto you power to tread on serpents and scorpions, and over all the power of the enemy: and nothing shall by any means hurt you.* The righteous kept out of the unclean one''s hand in Apocalypse of Abraham 13:10 are given power over all the power of the enemy.'),
  -- thread: apocalypse-of-abraham-13-the-vesture-transferred
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 13, 15, 'canon', 'zechariah', 3, 4, 'free', E'Zechariah 3:4 — *And he answered and spake unto those that stood before him, saying, Take away the filthy garments from him. And unto him he said, Behold, I have caused thine iniquity to pass from thee, and I will clothe thee with change of raiment.* The heavenly vesture set aside for Abraham in Apocalypse of Abraham 13:15 is the change of raiment the LORD puts upon the chosen one before the angel.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 13, 15, 'canon', 'zechariah', 3, 3, 'free', E'Zechariah 3:3 — *Now Joshua was clothed with filthy garments, and stood before the angel.* The mortality transferred to Azazel in Apocalypse of Abraham 13:15 answers to the filthy garments stripped from the righteous who stands before the angel.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_aoa13_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_aoa13_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-13-the-bird-driven-from-the-sacrifice',
       E'The unclean bird driven from the divided sacrifice',
       E'Abraham keeps the covenant-cutting and waits for the evening offering, and the adversary comes as a bird upon the carcasses: *And I did everything according to the commandment of the angel, and gave the angels, who had come to us, the divided animals, but the angel took the birds.* (Apocalypse of Abraham 13:1) — *And there flew an unclean bird down upon the carcasses, and I drove it away.* (Apocalypse of Abraham 13:3) It ain''t new — this is the very scene of Genesis 15, the divided heifer and goat and ram, the turtledove and pigeon, and the fowls that came down: *And he said unto him, Take me an heifer of three years old, and a she goat of three years old, and a ram of three years old, and a turtledove, and a young pigeon.* (Genesis 15:9) — *And he took unto him all these, and divided them in the midst, and laid each piece one against another: but the birds divided he not.* (Genesis 15:10) — *And when the fowls came down upon the carcases, Abram drove them away.* (Genesis 15:11) The one fowl Abram drove from the covenant in Genesis is here named: ungodliness, Azazel, come to spoil the offering of the friend of Elohim.',
       sv.verse_id, ev.verse_id, 'extras', 67300
  FROM _session253_aoa13_lookup sv, _session253_aoa13_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=13 AND sv.verse_number=1
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=13 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-13-this-is-azazel',
       E'This is ungodliness, this is Azazel — the goat sent away',
       E'The bird that speaks is unmasked: *And he said: "This is ungodliness, this is Azazel."* (Apocalypse of Abraham 13:7) — *And he said to it: "Disgrace upon thee, Azazel!"* (Apocalypse of Abraham 13:8) It ain''t new — Azazel is the lot of the scapegoat in the Torah''s day of atonement, the goat that bears uncleanness away into the wilderness while the LORD''s lot is offered for the people: *And Aaron shall cast lots upon the two goats; one lot for Yahuah (LORD), and the other lot for the scapegoat.* (Leviticus 16:8) — *But the goat, on which the lot fell to be the scapegoat, shall be presented alive before Yahuah (LORD), to make an atonement with him, and to let him go for a scapegoat into the wilderness.* (Leviticus 16:10) And the Watchers'' apparatus names him plainly — the corrupter of the earth to whom all sin is ascribed: *And the whole earth has been corrupted through the works that were taught by Azâzêl: to him ascribe all sin.* (1 Enoch 8:1 / 1 Enoch 10:8). Two lots, two peoples; the unclean is sent away, the righteous is kept.',
       sv.verse_id, ev.verse_id, 'extras', 67303
  FROM _session253_aoa13_lookup sv, _session253_aoa13_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=13 AND sv.verse_number=7
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=13 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-13-his-lot-on-earth-cast-down',
       E'Abraham''s lot in heaven, Azazel''s upon the earth',
       E'The angel pronounces the two dwelling-places: *For Abraham''s lot is in heaven, but thine upon the earth.* (Apocalypse of Abraham 13:9) — *Because thou hast chosen and loved this for the dwelling-place of thine uncleanness, therefore the eternal mighty Yahuah (Lord) made thee a dweller upon the earth...* (Apocalypse of Abraham 13:10) It ain''t new — this is the fallen one cast down out of the heights to the earth. The Watchers'' apparatus binds and casts Azazel into the desert until the judgment: *And again Yahuah (God) said to Raphael: ''Bind Azâzêl hand and foot, and cast him into the darkness: and make an opening in the desert, which is in Dûdâêl, and cast him therein.* (1 Enoch 10:4) The angels that kept not their first estate are reserved in chains: *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* (Jude 1:6) — and the great dragon and his angels are flung to the earth: *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* (Revelation 12:9) The adversary''s reach is the dust; Abraham''s portion is above.',
       sv.verse_id, ev.verse_id, 'extras', 67306
  FROM _session253_aoa13_lookup sv, _session253_aoa13_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=13 AND sv.verse_number=9
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=13 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-13-the-righteous-not-in-thy-hand',
       E'The bodies of the righteous not in the tempter''s hand — rebuked and put to flight',
       E'The adversary is denied his hold on the elect: *...hath not permitted that the bodies of the righteous should be in thy hand, in order that thereby the life of the righteous and the destruction of the unclean may be assured.* (Apocalypse of Abraham 13:10) — *For it hath not been given to thee to play the tempter in regard to all the righteous.* (Apocalypse of Abraham 13:12) — *Depart from this man!* (Apocalypse of Abraham 13:13) It ain''t new — this is the very rebuke of the accuser standing at the right hand to resist the chosen, plucked as a brand from the fire: *And Yahuah (LORD) said unto Satan, Yahuah (LORD) rebuke thee, O Satan; even Yahuah (LORD) that hath chosen Jerusalem rebuke thee: is not this a brand plucked out of the fire?* (Zechariah 3:2) The friend of Elohim has only to stand fast and the tempter is put to flight: *Submit yourselves therefore to Elohim (God). Resist the devil, and he will flee from you.* (James 4:7) — for authority over the enemy has been given: *Behold, I give unto you power to tread on serpents and scorpions, and over all the power of the enemy: and nothing shall by any means hurt you.* (Luke 10:19) The system accuses; Yahuah rebukes; the elect are kept.',
       sv.verse_id, ev.verse_id, 'extras', 67309
  FROM _session253_aoa13_lookup sv, _session253_aoa13_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=13 AND sv.verse_number=12
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=13 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-13-the-vesture-transferred',
       E'The heavenly vesture set aside for the righteous, the mortality transferred',
       E'The garment is exchanged: *For, behold, the vesture which in heaven was formerly thine hath been set aside for him, and the mortality which was his hath been transferred to thee.* (Apocalypse of Abraham 13:15) It ain''t new — before the angel of Yahuah the chosen one stands in filthy garments while the accuser resists, and the LORD takes away the filth and clothes him in the raiment of heaven: *Now Joshua was clothed with filthy garments, and stood before the angel.* (Zechariah 3:3) — *And he answered and spake unto those that stood before him, saying, Take away the filthy garments from him. And unto him he said, Behold, I have caused thine iniquity to pass from thee, and I will clothe thee with change of raiment.* (Zechariah 3:4) The fallen one is stripped to his mortality; the friend of Elohim is robed in the vesture that was the adversary''s lost glory — the same exchange the prophet saw at the right hand of the resisting Satan.',
       sv.verse_id, ev.verse_id, 'extras', 67312
  FROM _session253_aoa13_lookup sv, _session253_aoa13_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=13 AND sv.verse_number=15
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=13 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: apocalypse-of-abraham-13-the-bird-driven-from-the-sacrifice
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 15:9 — *And he said unto him, Take me an heifer of three years old, and a she goat of three years old, and a ram of three years old, and a turtledove, and a young pigeon.* The divided animals and the birds of Apocalypse of Abraham 13:1 are the very covenant offering Yahuah commanded Abram to take.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa13_lookup sv, _session253_aoa13_lookup tv
 WHERE t.slug='apocalypse-of-abraham-13-the-bird-driven-from-the-sacrifice'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 15:10 — *And he took unto him all these, and divided them in the midst, and laid each piece one against another: but the birds divided he not.* That the angel takes the birds whole in Apocalypse of Abraham 13:1 keeps faith with Abram dividing the beasts but not the birds.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa13_lookup sv, _session253_aoa13_lookup tv
 WHERE t.slug='apocalypse-of-abraham-13-the-bird-driven-from-the-sacrifice'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 15:11 — *And when the fowls came down upon the carcases, Abram drove them away.* The unclean bird Abraham drives off in Apocalypse of Abraham 13:3 is the same fowl that came down upon the covenant carcases and was driven away in Genesis.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa13_lookup sv, _session253_aoa13_lookup tv
 WHERE t.slug='apocalypse-of-abraham-13-the-bird-driven-from-the-sacrifice'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=13 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-13-this-is-azazel
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 16:8 — *And Aaron shall cast lots upon the two goats; one lot for Yahuah (LORD), and the other lot for the scapegoat.* The naming of Azazel in Apocalypse of Abraham 13:7 reaches straight back to the lot of the scapegoat cast on the day of atonement.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa13_lookup sv, _session253_aoa13_lookup tv
 WHERE t.slug='apocalypse-of-abraham-13-this-is-azazel'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=13 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=16 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 16:10 — *But the goat, on which the lot fell to be the scapegoat, shall be presented alive before Yahuah (LORD), to make an atonement with him, and to let him go for a scapegoat into the wilderness.* The disgrace pronounced on Azazel in Apocalypse of Abraham 13:8 is the sending-away of the uncleanness-bearing goat into the wilderness.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa13_lookup sv, _session253_aoa13_lookup tv
 WHERE t.slug='apocalypse-of-abraham-13-this-is-azazel'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=13 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=16 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 10:8 — *And the whole earth has been corrupted through the works that were taught by Azâzêl: to him ascribe all sin.* The ungodliness named in Apocalypse of Abraham 13:7 is the same Watcher to whom the earth''s corruption and all sin are ascribed.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa13_lookup sv, _session253_aoa13_lookup tv
 WHERE t.slug='apocalypse-of-abraham-13-this-is-azazel'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=13 AND sv.verse_number=7
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-13-his-lot-on-earth-cast-down
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 10:4 — *And again Yahuah (God) said to Raphael: ''Bind Azâzêl hand and foot, and cast him into the darkness: and make an opening in the desert, which is in Dûdâêl, and cast him therein.* Azazel made a dweller upon the earth in Apocalypse of Abraham 13:10 is the same Watcher bound and cast into the desert-darkness.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa13_lookup sv, _session253_aoa13_lookup tv
 WHERE t.slug='apocalypse-of-abraham-13-his-lot-on-earth-cast-down'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=13 AND sv.verse_number=10
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* That Azazel''s lot is on the earth and not in heaven (Apocalypse of Abraham 13:9) is the angels who left their first habitation, reserved unto judgment.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa13_lookup sv, _session253_aoa13_lookup tv
 WHERE t.slug='apocalypse-of-abraham-13-his-lot-on-earth-cast-down'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=13 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The adversary made a dweller upon the earth in Apocalypse of Abraham 13:10 is the dragon cast down to the earth with his angels.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa13_lookup sv, _session253_aoa13_lookup tv
 WHERE t.slug='apocalypse-of-abraham-13-his-lot-on-earth-cast-down'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=13 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-13-the-righteous-not-in-thy-hand
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Zechariah 3:2 — *And Yahuah (LORD) said unto Satan, Yahuah (LORD) rebuke thee, O Satan; even Yahuah (LORD) that hath chosen Jerusalem rebuke thee: is not this a brand plucked out of the fire?* The angel''s "Depart from this man!" in Apocalypse of Abraham 13:13 is the LORD''s rebuke of the accuser who resists the chosen.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa13_lookup sv, _session253_aoa13_lookup tv
 WHERE t.slug='apocalypse-of-abraham-13-the-righteous-not-in-thy-hand'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=13 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=3 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'James 4:7 — *Submit yourselves therefore to Elohim (God). Resist the devil, and he will flee from you.* That the tempter has no leave to play upon the righteous (Apocalypse of Abraham 13:12) is the devil who flees when resisted.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa13_lookup sv, _session253_aoa13_lookup tv
 WHERE t.slug='apocalypse-of-abraham-13-the-righteous-not-in-thy-hand'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=13 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=4 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Luke 10:19 — *Behold, I give unto you power to tread on serpents and scorpions, and over all the power of the enemy: and nothing shall by any means hurt you.* The righteous kept out of the unclean one''s hand in Apocalypse of Abraham 13:10 are given power over all the power of the enemy.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa13_lookup sv, _session253_aoa13_lookup tv
 WHERE t.slug='apocalypse-of-abraham-13-the-righteous-not-in-thy-hand'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=13 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=10 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-13-the-vesture-transferred
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Zechariah 3:4 — *And he answered and spake unto those that stood before him, saying, Take away the filthy garments from him. And unto him he said, Behold, I have caused thine iniquity to pass from thee, and I will clothe thee with change of raiment.* The heavenly vesture set aside for Abraham in Apocalypse of Abraham 13:15 is the change of raiment the LORD puts upon the chosen one before the angel.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa13_lookup sv, _session253_aoa13_lookup tv
 WHERE t.slug='apocalypse-of-abraham-13-the-vesture-transferred'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=13 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=3 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Zechariah 3:3 — *Now Joshua was clothed with filthy garments, and stood before the angel.* The mortality transferred to Azazel in Apocalypse of Abraham 13:15 answers to the filthy garments stripped from the righteous who stands before the angel.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa13_lookup sv, _session253_aoa13_lookup tv
 WHERE t.slug='apocalypse-of-abraham-13-the-vesture-transferred'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=13 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=3 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

