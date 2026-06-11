-- ----- fragment: minion_1enoch_20.sql (session250 1-enoch 20) -----
-- Source anchor: enoch/1-enoch ch20. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en20 (view _session250_en20_lookup). Sort band base 50475, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en20_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-20-seven-holy-angels-who-watch
  ('enoch', '1-enoch', 20, 1, 'apocrypha', 'tobit', 12, 15, 'extras', E'Tobit 12:15 — *I am Raphael, one of the seven holy angels, which present the prayers of the saints, and which go in and out before the glory of the Holy One.* Tobit names the same sevenfold company of holy angels that Enoch lists, and names Raphael among them, exactly as 1 Enoch 20:1 introduces the seven who watch.'),
  ('enoch', '1-enoch', 20, 1, 'canon', 'revelation', 8, 2, 'free', E'Revelation 8:2 — *And I saw the seven angels which stood before Elohim (God); and to them were given seven trumpets.* John sees the same seven standing before the throne that Enoch enumerates in 1 Enoch 20:1.'),
  ('enoch', '1-enoch', 20, 1, 'canon', 'revelation', 8, 3, 'free', E'Revelation 8:3 — *And another angel came and stood at the altar, having a golden censer; and there was given unto him much incense, that he should offer it with the prayers of all saints upon the golden altar which was before the throne.* The office of presenting the saints'' prayers — Raphael''s office among the seven — is shown at the altar, matching the watching host of 1 Enoch 20:1.'),
  -- thread: 1-enoch-20-michael-the-chief-prince
  ('enoch', '1-enoch', 20, 5, 'canon', 'daniel', 10, 13, 'free', E'Daniel 10:13 — *But the prince of the kingdom of Persia withstood me one and twenty days: but, lo, Michael, one of the chief princes, came to help me; and I remained there with the kings of Persia.* Daniel''s ''one of the chief princes'' is Enoch''s ''one of the holy and honoured angels'' set over the best part of mankind in 1 Enoch 20:5.'),
  ('enoch', '1-enoch', 20, 5, 'canon', 'daniel', 10, 21, 'free', E'Daniel 10:21 — *But I will shew thee that which is noted in the scripture of truth: and there is none that holdeth with me in these things, but Michael your prince.* Michael is ''your prince'' — set over the covenant people, the best part of mankind of 1 Enoch 20:5.'),
  ('enoch', '1-enoch', 20, 5, 'canon', 'daniel', 12, 1, 'free', E'Daniel 12:1 — *And at that time shall Michael stand up, the great prince which standeth for the children of thy people: and there shall be a time of trouble, such as never was since there was a nation even to that same time: and at that time thy people shall be delivered, every one that shall be found written in the book.* Michael stands for the elect at the judgement, the very office Enoch assigns him over the best part of mankind in 1 Enoch 20:5.'),
  ('enoch', '1-enoch', 20, 5, 'canon', 'revelation', 12, 7, 'free', E'Revelation 12:7 — *And there was war in heaven: Michael and his angels fought against the dragon; and the dragon fought and his angels,* Michael''s office over chaos in 1 Enoch 20:5 is shown as open war against the dragon and the rebel host.'),
  ('enoch', '1-enoch', 20, 5, 'enoch', '1-enoch', 40, 9, 'extras', E'1 Enoch 40:9 — *And he said unto me: ‘This first is Michael, the merciful and long-suffering: and the second, who is set over all sickness and all wounds, is Raphael: and the third, who is set over all the powers, is Gabriel: and the fourth, who is set over the repentance unto hope of those who inherit eternal life, is named Phanuel.’* Enoch names Michael first again among the archangels, the same honoured prince of 1 Enoch 20:5.'),
  -- thread: 1-enoch-20-gabriel-stands-in-the-presence
  ('enoch', '1-enoch', 20, 7, 'canon', 'luke', 1, 19, 'free', E'Luke 1:19 — *And the angel answering said unto him, I am Gabriel, that stand in the presence of Elohim (God); and am sent to speak unto thee, and to shew thee these glad tidings.* Gabriel, named among the holy angels in 1 Enoch 20:7, stands in the divine presence in the Gospel exactly as one of Enoch''s seven who watch.'),
  ('enoch', '1-enoch', 20, 7, 'canon', 'genesis', 3, 24, 'free', E'Genesis 3:24 — *So he drove out the man; and he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life.* The Cherubim over Paradise that Gabriel is set above in 1 Enoch 20:7 are the very Cherubim posted to guard Eden''s tree of life.'),
  ('enoch', '1-enoch', 20, 7, 'canon', 'revelation', 22, 2, 'free', E'Revelation 22:2 — *In the midst of the street of it, and on either side of the river, was there the tree of life, which bare twelve manner of fruits, and yielded her fruit every month: and the leaves of the tree were for the healing of the nations.* The Paradise Gabriel guards in 1 Enoch 20:7 is restored as the tree of life in the New Jerusalem.'),
  ('enoch', '1-enoch', 20, 7, 'canon', 'revelation', 2, 7, 'free', E'Revelation 2:7 — *He that hath an ear, let him hear what the Spirit saith unto the churches; To him that overcometh will I give to eat of the tree of life, which is in the midst of the paradise of Elohim (God).* The ''paradise of Elohim'' the overcomer inherits is the very Paradise Gabriel is set over in 1 Enoch 20:7.'),
  -- thread: 1-enoch-20-uriel-raguel-over-tartarus-and-the-luminaries
  ('enoch', '1-enoch', 20, 4, 'enoch', '1-enoch', 21, 5, 'extras', E'1 Enoch 21:5 — *’This place is the end of heaven and earth: this has become a prison for the stars and the host of heaven.* Raguel''s vengeance on the world of the luminaries in 1 Enoch 20:4 is the binding of the transgressing stars Enoch sees imprisoned one chapter later.'),
  ('enoch', '1-enoch', 20, 4, 'enoch', '1-enoch', 21, 6, 'extras', E'1 Enoch 21:6 — *And the stars which roll over the fire are they which have transgressed the commandment of Yahuah (God) in the beginning of their rising, because they did not come forth at their appointed times.* The luminaries Raguel takes vengeance on in 1 Enoch 20:4 are these stars that broke their appointed order.'),
  ('enoch', '1-enoch', 20, 2, 'canon', '2-peter', 2, 4, 'free', E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* the ''hell'' here is Tartarus, the very place Uriel is set over in 1 Enoch 20:2 where the rebel angels are held until judgement.'),
  ('enoch', '1-enoch', 20, 2, 'canon', 'jude', 1, 6, 'free', E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* The chained host reserved for judgement is held in the Tartarus Uriel oversees in 1 Enoch 20:2.'),
  ('enoch', '1-enoch', 20, 4, 'canon', 'jude', 1, 13, 'free', E'Jude 1:13 — *Raging waves of the sea, foaming out their own shame; wandering stars, to whom is reserved the blackness of darkness for ever.* Jude''s ''wandering stars'' are Enoch''s transgressing luminaries that Raguel takes vengeance on in 1 Enoch 20:4.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en20_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en20_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-20-seven-holy-angels-who-watch',
       E'The seven holy angels who watch',
       E'Enoch''s guide names the heavenly host that attends the throne: *And these are the names of the holy angels who watch.* (1 Enoch 20:1) — seven offices set in order under the Creator. The canon shows the same seven standing before Elohim and bearing the prayers of the saints: when Raphael unveils himself to Tobit he says *I am Raphael, one of the seven holy angels, which present the prayers of the saints, and which go in and out before the glory of the Holy One.* (Tobit 12:15) — the very count Enoch gives, with the very office. John sees that company at the seventh seal: *And I saw the seven angels which stood before Elohim (God); and to them were given seven trumpets.* (Revelation 8:2), and the angel at the altar bears *the prayers of all saints upon the golden altar which was before the throne.* (Revelation 8:3) These are watchers who *kept* their estate — the loyal host serving the Creator''s order — in deliberate contrast to the fallen Watchers of chapters 6–16. It ain''t new: the sevenfold attending host is canon, not invention.',
       sv.verse_id, ev.verse_id, 'extras', 50475
  FROM _session250_en20_lookup sv, _session250_en20_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=20 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=20 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-20-michael-the-chief-prince',
       E'Michael, set over the best part of mankind',
       E'Of the seven, Enoch singles out one: *Michael, one of the holy and honoured angels, who is set over the best part of mankind and over chaos.* (1 Enoch 20:5) Daniel knows him by name and office — the prince who contends for Yahuah''s covenant people: *but, lo, Michael, one of the chief princes, came to help me* (Daniel 10:13), *there is none that holdeth with me in these things, but Michael your prince* (Daniel 10:21), and at the end *at that time shall Michael stand up, the great prince which standeth for the children of thy people* (Daniel 12:1) — set over the elect, the very ''best part of mankind'' Enoch names. Revelation shows that same prince at war against the rebel host: *And there was war in heaven: Michael and his angels fought against the dragon; and the dragon fought and his angels* (Revelation 12:7). And Enoch himself names Michael again among the four — *This first is Michael, the merciful and long-suffering* (1 Enoch 40:9). This is not a replacement of Israel by another people: Michael stands FOR the children of Daniel''s people, the covenant nation gathered and kept. The honoured prince of the loyal host guards the elect against the dragon''s seed-war until the reckoning. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 50478
  FROM _session250_en20_lookup sv, _session250_en20_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=20 AND sv.verse_number=5
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=20 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-20-gabriel-stands-in-the-presence',
       E'Gabriel, over Paradise and the Cherubim',
       E'Enoch sets one angel over the garden and its guardians: *Gabriel, one of the holy angels, who is over Paradise and the serpents and the Cherubim.* (1 Enoch 20:7) The Cherubim over Paradise are no invention — they were posted at Eden''s gate to guard the way to the tree of life: *So he drove out the man; and he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life.* (Genesis 3:24) Gabriel is the same angel who stands in the divine presence and is sent to announce: *And the angel answering said unto him, I am Gabriel, that stand in the presence of Elohim (God); and am sent to speak unto thee, and to shew thee these glad tidings.* (Luke 1:19) Enoch names him a third time among the four: *the third, who is set over all the powers, is Gabriel* (1 Enoch 40:9). The Paradise he guards is not lost but restored — the tree of life returns in the New Jerusalem: *In the midst of the street of it, and on either side of the river, was there the tree of life* (Revelation 22:2); *To him that overcometh will I give to eat of the tree of life, which is in the midst of the paradise of Elohim (God)* (Revelation 2:7). Eden barred is Eden restored. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 50481
  FROM _session250_en20_lookup sv, _session250_en20_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=20 AND sv.verse_number=7
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=20 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-20-uriel-raguel-over-tartarus-and-the-luminaries',
       E'Uriel and Raguel — over Tartarus and the transgressing lights',
       E'Two of the seven are set over the place of binding and over the order of the lights: *Uriel, one of the holy angels, who is over the world and over Tartarus.* (1 Enoch 20:2) and *Raguel, one of the holy angels who takes vengeance on the world of the luminaries.* (1 Enoch 20:4) Tartarus is the prison Enoch has already shown — the abyss where the rebel host is bound: *This place is the end of heaven and earth: this has become a prison for the stars and the host of heaven* (1 Enoch 21:5), the stars *which have transgressed the commandment of Yahuah (God) in the beginning of their rising, because they did not come forth at their appointed times* (1 Enoch 21:6) — Raguel''s ''vengeance on the world of the luminaries'' is precisely the binding of the lights that broke their appointed order. The canon names this very prison and this very office of guarding it until the reckoning: *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment* (2 Peter 2:4) — the word rendered ''cast down to hell'' is *tartaroo*, Uriel''s Tartarus — and *the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day* (Jude 1:6), the *wandering stars, to whom is reserved the blackness of darkness for ever* (Jude 1:13). The rebel host is held, not annihilated — bound till judgement, the way Sheol holds the dead till the reckoning. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 50484
  FROM _session250_en20_lookup sv, _session250_en20_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=20 AND sv.verse_number=2
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=20 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-20-seven-holy-angels-who-watch
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Tobit 12:15 — *I am Raphael, one of the seven holy angels, which present the prayers of the saints, and which go in and out before the glory of the Holy One.* Tobit names the same sevenfold company of holy angels that Enoch lists, and names Raphael among them, exactly as 1 Enoch 20:1 introduces the seven who watch.'
  FROM cross_reference_threads t, cross_references x, _session250_en20_lookup sv, _session250_en20_lookup tv
 WHERE t.slug='1-enoch-20-seven-holy-angels-who-watch'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=20 AND sv.verse_number=1
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=12 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 8:2 — *And I saw the seven angels which stood before Elohim (God); and to them were given seven trumpets.* John sees the same seven standing before the throne that Enoch enumerates in 1 Enoch 20:1.'
  FROM cross_reference_threads t, cross_references x, _session250_en20_lookup sv, _session250_en20_lookup tv
 WHERE t.slug='1-enoch-20-seven-holy-angels-who-watch'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=20 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=8 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 8:3 — *And another angel came and stood at the altar, having a golden censer; and there was given unto him much incense, that he should offer it with the prayers of all saints upon the golden altar which was before the throne.* The office of presenting the saints'' prayers — Raphael''s office among the seven — is shown at the altar, matching the watching host of 1 Enoch 20:1.'
  FROM cross_reference_threads t, cross_references x, _session250_en20_lookup sv, _session250_en20_lookup tv
 WHERE t.slug='1-enoch-20-seven-holy-angels-who-watch'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=20 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=8 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-20-michael-the-chief-prince
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 10:13 — *But the prince of the kingdom of Persia withstood me one and twenty days: but, lo, Michael, one of the chief princes, came to help me; and I remained there with the kings of Persia.* Daniel''s ''one of the chief princes'' is Enoch''s ''one of the holy and honoured angels'' set over the best part of mankind in 1 Enoch 20:5.'
  FROM cross_reference_threads t, cross_references x, _session250_en20_lookup sv, _session250_en20_lookup tv
 WHERE t.slug='1-enoch-20-michael-the-chief-prince'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=20 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=10 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 10:21 — *But I will shew thee that which is noted in the scripture of truth: and there is none that holdeth with me in these things, but Michael your prince.* Michael is ''your prince'' — set over the covenant people, the best part of mankind of 1 Enoch 20:5.'
  FROM cross_reference_threads t, cross_references x, _session250_en20_lookup sv, _session250_en20_lookup tv
 WHERE t.slug='1-enoch-20-michael-the-chief-prince'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=20 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=10 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 12:1 — *And at that time shall Michael stand up, the great prince which standeth for the children of thy people: and there shall be a time of trouble, such as never was since there was a nation even to that same time: and at that time thy people shall be delivered, every one that shall be found written in the book.* Michael stands for the elect at the judgement, the very office Enoch assigns him over the best part of mankind in 1 Enoch 20:5.'
  FROM cross_reference_threads t, cross_references x, _session250_en20_lookup sv, _session250_en20_lookup tv
 WHERE t.slug='1-enoch-20-michael-the-chief-prince'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=20 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 12:7 — *And there was war in heaven: Michael and his angels fought against the dragon; and the dragon fought and his angels,* Michael''s office over chaos in 1 Enoch 20:5 is shown as open war against the dragon and the rebel host.'
  FROM cross_reference_threads t, cross_references x, _session250_en20_lookup sv, _session250_en20_lookup tv
 WHERE t.slug='1-enoch-20-michael-the-chief-prince'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=20 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Enoch 40:9 — *And he said unto me: ‘This first is Michael, the merciful and long-suffering: and the second, who is set over all sickness and all wounds, is Raphael: and the third, who is set over all the powers, is Gabriel: and the fourth, who is set over the repentance unto hope of those who inherit eternal life, is named Phanuel.’* Enoch names Michael first again among the archangels, the same honoured prince of 1 Enoch 20:5.'
  FROM cross_reference_threads t, cross_references x, _session250_en20_lookup sv, _session250_en20_lookup tv
 WHERE t.slug='1-enoch-20-michael-the-chief-prince'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=20 AND sv.verse_number=5
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=40 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-20-gabriel-stands-in-the-presence
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Luke 1:19 — *And the angel answering said unto him, I am Gabriel, that stand in the presence of Elohim (God); and am sent to speak unto thee, and to shew thee these glad tidings.* Gabriel, named among the holy angels in 1 Enoch 20:7, stands in the divine presence in the Gospel exactly as one of Enoch''s seven who watch.'
  FROM cross_reference_threads t, cross_references x, _session250_en20_lookup sv, _session250_en20_lookup tv
 WHERE t.slug='1-enoch-20-gabriel-stands-in-the-presence'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=20 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:24 — *So he drove out the man; and he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life.* The Cherubim over Paradise that Gabriel is set above in 1 Enoch 20:7 are the very Cherubim posted to guard Eden''s tree of life.'
  FROM cross_reference_threads t, cross_references x, _session250_en20_lookup sv, _session250_en20_lookup tv
 WHERE t.slug='1-enoch-20-gabriel-stands-in-the-presence'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=20 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 22:2 — *In the midst of the street of it, and on either side of the river, was there the tree of life, which bare twelve manner of fruits, and yielded her fruit every month: and the leaves of the tree were for the healing of the nations.* The Paradise Gabriel guards in 1 Enoch 20:7 is restored as the tree of life in the New Jerusalem.'
  FROM cross_reference_threads t, cross_references x, _session250_en20_lookup sv, _session250_en20_lookup tv
 WHERE t.slug='1-enoch-20-gabriel-stands-in-the-presence'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=20 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 2:7 — *He that hath an ear, let him hear what the Spirit saith unto the churches; To him that overcometh will I give to eat of the tree of life, which is in the midst of the paradise of Elohim (God).* The ''paradise of Elohim'' the overcomer inherits is the very Paradise Gabriel is set over in 1 Enoch 20:7.'
  FROM cross_reference_threads t, cross_references x, _session250_en20_lookup sv, _session250_en20_lookup tv
 WHERE t.slug='1-enoch-20-gabriel-stands-in-the-presence'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=20 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-20-uriel-raguel-over-tartarus-and-the-luminaries
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 21:5 — *’This place is the end of heaven and earth: this has become a prison for the stars and the host of heaven.* Raguel''s vengeance on the world of the luminaries in 1 Enoch 20:4 is the binding of the transgressing stars Enoch sees imprisoned one chapter later.'
  FROM cross_reference_threads t, cross_references x, _session250_en20_lookup sv, _session250_en20_lookup tv
 WHERE t.slug='1-enoch-20-uriel-raguel-over-tartarus-and-the-luminaries'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=20 AND sv.verse_number=4
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=21 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 21:6 — *And the stars which roll over the fire are they which have transgressed the commandment of Yahuah (God) in the beginning of their rising, because they did not come forth at their appointed times.* The luminaries Raguel takes vengeance on in 1 Enoch 20:4 are these stars that broke their appointed order.'
  FROM cross_reference_threads t, cross_references x, _session250_en20_lookup sv, _session250_en20_lookup tv
 WHERE t.slug='1-enoch-20-uriel-raguel-over-tartarus-and-the-luminaries'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=20 AND sv.verse_number=4
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=21 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* the ''hell'' here is Tartarus, the very place Uriel is set over in 1 Enoch 20:2 where the rebel angels are held until judgement.'
  FROM cross_reference_threads t, cross_references x, _session250_en20_lookup sv, _session250_en20_lookup tv
 WHERE t.slug='1-enoch-20-uriel-raguel-over-tartarus-and-the-luminaries'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=20 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* The chained host reserved for judgement is held in the Tartarus Uriel oversees in 1 Enoch 20:2.'
  FROM cross_reference_threads t, cross_references x, _session250_en20_lookup sv, _session250_en20_lookup tv
 WHERE t.slug='1-enoch-20-uriel-raguel-over-tartarus-and-the-luminaries'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=20 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jude 1:13 — *Raging waves of the sea, foaming out their own shame; wandering stars, to whom is reserved the blackness of darkness for ever.* Jude''s ''wandering stars'' are Enoch''s transgressing luminaries that Raguel takes vengeance on in 1 Enoch 20:4.'
  FROM cross_reference_threads t, cross_references x, _session250_en20_lookup sv, _session250_en20_lookup tv
 WHERE t.slug='1-enoch-20-uriel-raguel-over-tartarus-and-the-luminaries'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=20 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

