-- ----- fragment: minion_1adameve_71.sql (session253 1-adam-eve 71) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch71. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae71 (view _session253_1ae71_lookup). Sort band base 65750, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae71_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-71-false-angels-deceiver
  ('adam-eve-conflict', '1-adam-eve', 71, 3, 'canon', '2-corinthians', 11, 14, 'free', E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* Adam exposes the very ruse Paul names: devils wearing the false appearance of angels (1 Adam and Eve 71:3).'),
  ('adam-eve-conflict', '1-adam-eve', 71, 3, 'canon', 'john', 8, 44, 'free', E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* Adam discerns the lying spirit behind the counterfeit words ''Elohim never spoke'' them (1 Adam and Eve 71:3).'),
  ('adam-eve-conflict', '1-adam-eve', 71, 3, 'canon', 'revelation', 12, 9, 'free', E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The deceiver of the whole world is the same serpent who came to Adam in stolen angelic dress (1 Adam and Eve 71:3).'),
  ('adam-eve-conflict', '1-adam-eve', 71, 4, 'canon', 'james', 4, 7, 'free', E'James 4:7 — *Submit yourselves therefore to Elohim (God). Resist the devil, and he will flee from you.* Adam''s rebuke makes the devils flee, the very pattern James commands (1 Adam and Eve 71:4).'),
  ('adam-eve-conflict', '1-adam-eve', 71, 4, 'canon', '1-peter', 5, 8, 'free', E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour.* The fled devils only retreat to prowl again, as the lion ever does (1 Adam and Eve 71:4).'),
  -- thread: 1-adam-eve-71-forty-days-repentance
  ('adam-eve-conflict', '1-adam-eve', 71, 6, 'canon', 'exodus', 34, 28, 'free', E'Exodus 34:28 — *And he was there with Yahuah (LORD) forty days and forty nights; he did neither eat bread, nor drink water. And he wrote upon the tables the words of the covenant, the ten commandments.* Adam''s neither-eat-nor-drink forty days mirrors Moses on the mount (1 Adam and Eve 71:6).'),
  ('adam-eve-conflict', '1-adam-eve', 71, 6, 'canon', 'matthew', 4, 2, 'free', E'Matthew 4:2 — *And when he had fasted forty days and forty nights, he was afterward an hungred.* The first Adam fasts forty days in penitence; the last Adam fasts forty days in triumph over the same tempter (1 Adam and Eve 71:6).'),
  ('adam-eve-conflict', '1-adam-eve', 71, 6, 'canon', 'exodus', 20, 7, 'free', E'Exodus 20:7 — *Thou shalt not take the name of Yahuah Elohayka (the LORD thy God) in vain; for Yahuah (LORD) will not hold him guiltless that taketh his name in vain.* Adam fasts in terror precisely because he swore rashly by the great Name (1 Adam and Eve 71:5-6).'),
  ('adam-eve-conflict', '1-adam-eve', 71, 6, 'canon', 'psalms', 32, 5, 'free', E'Psalm 32:5 — *I acknowledged my sin unto thee, and mine iniquity have I not hid. I said, I will confess my transgressions unto Yahuah (LORD); and thou forgavest the iniquity of my sin. Selah.* Adam''s tearful confession is the very pattern of the penitent David sings (1 Adam and Eve 71:6).'),
  -- thread: 1-adam-eve-71-word-raises-forgives
  ('adam-eve-conflict', '1-adam-eve', 71, 7, 'canon', 'john', 1, 1, 'free', E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word Elohim sends to raise Adam is the eternal Logos who was with Elohim from the beginning (1 Adam and Eve 71:7).'),
  ('adam-eve-conflict', '1-adam-eve', 71, 7, 'canon', 'john', 1, 14, 'free', E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The Word that lifts Adam from the dust will one day take flesh to lift the whole race (1 Adam and Eve 71:7).'),
  ('adam-eve-conflict', '1-adam-eve', 71, 7, 'canon', 'hebrews', 1, 1, 'free', E'Hebrews 1:1 — *Elohim (God), who at sundry times and in divers manners spake in time past unto the fathers by the prophets.* Elohim''s speaking to Adam by His Word is the first of the sundry times He addressed the fathers (1 Adam and Eve 71:7).'),
  ('adam-eve-conflict', '1-adam-eve', 71, 9, 'canon', '1-john', 1, 9, 'free', E'1 John 1:9 — *If we confess our sins, he is faithful and just to forgive us our sins, and to cleanse us from all unrighteousness.* Adam confesses and is forgiven by the faithful Word, the very promise John seals (1 Adam and Eve 71:8-9).'),
  -- thread: 1-adam-eve-71-jealous-satan-seed-war
  ('adam-eve-conflict', '1-adam-eve', 71, 14, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Satan''s jealous plot to destroy Adam and Eve is the enmity Yahuah set against the woman''s seed (1 Adam and Eve 71:14).'),
  ('adam-eve-conflict', '1-adam-eve', 71, 14, 'canon', '1-john', 3, 8, 'free', E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* The devil who plans to destroy Adam will himself be undone by the manifested Son (1 Adam and Eve 71:14).'),
  ('adam-eve-conflict', '1-adam-eve', 71, 14, 'apocrypha', 'the-wisdom-of-solomon', 2, 24, 'extras', E'Wisdom of Solomon 2:24 — *Nevertheless through envy of the devil came death into the world: and they that do hold of his side do find it.* Wisdom names the envy that drives Satan''s jealousy against Adam and Eve (1 Adam and Eve 71:14).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae71_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae71_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-71-false-angels-deceiver',
       E'Devils under the false appearance of angels',
       E'Adam pierces the disguise: *But Elohim (God) never spoke the words that you have said; and you are not Elohim''s (God''s) angels, and you weren''t sent from Him. But you are devils that have come to me under the false appearance of angels. Away from me; you cursed of Elohim (God)!* (1 Adam and Eve 71:3). It ain''t new — the adversary''s oldest weapon is not force but disguise. *And no marvel; for Satan himself is transformed into an angel of light* (2 Corinthians 11:14). He is the liar by nature: *He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it* (John 8:44). The same dragon prowls in every age — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour* (1 Peter 5:8) — *that old serpent, called the Devil, and Satan, which deceiveth the whole world* (Revelation 12:9). Adam''s answer is the saints'' answer: *Resist the devil, and he will flee from you* (James 4:7), and indeed *Then those devils fled from before Adam* (1 Adam and Eve 71:4).',
       sv.verse_id, ev.verse_id, 'extras', 65750
  FROM _session253_1ae71_lookup sv, _session253_1ae71_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=71 AND sv.verse_number=3
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=71 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-71-forty-days-repentance',
       E'Forty days and forty nights of repentance',
       E'Grieved at the oath he swore by the great Name, Adam casts himself down: *Then Adam got up, and spread his hands before Elohim (God), beseeching and entreating Him with tears, to forgive him what he had done. And Adam remained thus standing and praying forty days and forty nights. He neither ate nor drank until he dropped down on the ground from hunger and thirst* (1 Adam and Eve 71:6). The forty-day fast is the covenant rhythm — Moses *was there with Yahuah (LORD) forty days and forty nights; he did neither eat bread, nor drink water* (Exodus 34:28), and the Messiah Himself *had fasted forty days and forty nights, he was afterward an hungred* (Matthew 4:2). Adam''s dread is to have taken the Name in vain — *Thou shalt not take the name of Yahuah Elohayka (the LORD thy God) in vain; for Yahuah (LORD) will not hold him guiltless that taketh his name in vain* (Exodus 20:7) — yet the way of return was open before Sinai: *I acknowledged my sin unto thee, and mine iniquity have I not hid. I said, I will confess my transgressions unto Yahuah (LORD); and thou forgavest the iniquity of my sin* (Psalm 32:5).',
       sv.verse_id, ev.verse_id, 'extras', 65753
  FROM _session253_1ae71_lookup sv, _session253_1ae71_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=71 AND sv.verse_number=6
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=71 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-71-word-raises-forgives',
       E'The Word of Elohim raises him and forgives',
       E'When Adam falls from hunger, mercy comes in Person: *Then Elohim (God) sent His Word to Adam, who raised him up from where he lay* (1 Adam and Eve 71:7), and after Adam''s plea, *And Elohim (God) forgave Adam, saying to him, ''Beware of Satan''* (1 Adam and Eve 71:9). This Word who comes, comforts, and forgives is the Logos — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God)* (John 1:1), *And the Word was made flesh, and dwelt among us* (John 1:14). He is the One through whom the Father has always spoken: *Elohim (God), who at sundry times and in divers manners spake in time past unto the fathers by the prophets* (Hebrews 1:1), *the brightness of his glory, and the express image of his person* (Hebrews 1:3). And the forgiveness Adam receives flows from that same Word: *If we confess our sins, he is faithful and just to forgive us our sins, and to cleanse us from all unrighteousness* (1 John 1:9). It ain''t new — the Comforter who lifts the fallen first walked outside Eden''s gate.',
       sv.verse_id, ev.verse_id, 'extras', 65756
  FROM _session253_1ae71_lookup sv, _session253_1ae71_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=71 AND sv.verse_number=7
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=71 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-71-jealous-satan-seed-war',
       E'Satan jealous, planning to destroy the seed',
       E'The chapter closes on the war that began at the gate: *But Satan was jealous of them; and planned to destroy them* (1 Adam and Eve 71:14). This is Genesis 3:15 in motion — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15) — every assault upon Adam and Eve is the serpent striking at the seed of the woman. Wisdom names the motive: *Nevertheless through envy of the devil came death into the world: and they that do hold of his side do find it* (Wisdom of Solomon 2:24). But the head-bruising is sure: *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil* (1 John 3:8). The jealous adversary who plotted by the river will be crushed.',
       sv.verse_id, ev.verse_id, 'extras', 65759
  FROM _session253_1ae71_lookup sv, _session253_1ae71_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=71 AND sv.verse_number=14
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=71 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-71-false-angels-deceiver
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* Adam exposes the very ruse Paul names: devils wearing the false appearance of angels (1 Adam and Eve 71:3).'
  FROM cross_reference_threads t, cross_references x, _session253_1ae71_lookup sv, _session253_1ae71_lookup tv
 WHERE t.slug='1-adam-eve-71-false-angels-deceiver'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=71 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=11 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* Adam discerns the lying spirit behind the counterfeit words ''Elohim never spoke'' them (1 Adam and Eve 71:3).'
  FROM cross_reference_threads t, cross_references x, _session253_1ae71_lookup sv, _session253_1ae71_lookup tv
 WHERE t.slug='1-adam-eve-71-false-angels-deceiver'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=71 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The deceiver of the whole world is the same serpent who came to Adam in stolen angelic dress (1 Adam and Eve 71:3).'
  FROM cross_reference_threads t, cross_references x, _session253_1ae71_lookup sv, _session253_1ae71_lookup tv
 WHERE t.slug='1-adam-eve-71-false-angels-deceiver'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=71 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'James 4:7 — *Submit yourselves therefore to Elohim (God). Resist the devil, and he will flee from you.* Adam''s rebuke makes the devils flee, the very pattern James commands (1 Adam and Eve 71:4).'
  FROM cross_reference_threads t, cross_references x, _session253_1ae71_lookup sv, _session253_1ae71_lookup tv
 WHERE t.slug='1-adam-eve-71-false-angels-deceiver'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=71 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=4 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour.* The fled devils only retreat to prowl again, as the lion ever does (1 Adam and Eve 71:4).'
  FROM cross_reference_threads t, cross_references x, _session253_1ae71_lookup sv, _session253_1ae71_lookup tv
 WHERE t.slug='1-adam-eve-71-false-angels-deceiver'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=71 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-71-forty-days-repentance
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 34:28 — *And he was there with Yahuah (LORD) forty days and forty nights; he did neither eat bread, nor drink water. And he wrote upon the tables the words of the covenant, the ten commandments.* Adam''s neither-eat-nor-drink forty days mirrors Moses on the mount (1 Adam and Eve 71:6).'
  FROM cross_reference_threads t, cross_references x, _session253_1ae71_lookup sv, _session253_1ae71_lookup tv
 WHERE t.slug='1-adam-eve-71-forty-days-repentance'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=71 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=34 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 4:2 — *And when he had fasted forty days and forty nights, he was afterward an hungred.* The first Adam fasts forty days in penitence; the last Adam fasts forty days in triumph over the same tempter (1 Adam and Eve 71:6).'
  FROM cross_reference_threads t, cross_references x, _session253_1ae71_lookup sv, _session253_1ae71_lookup tv
 WHERE t.slug='1-adam-eve-71-forty-days-repentance'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=71 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=4 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 20:7 — *Thou shalt not take the name of Yahuah Elohayka (the LORD thy God) in vain; for Yahuah (LORD) will not hold him guiltless that taketh his name in vain.* Adam fasts in terror precisely because he swore rashly by the great Name (1 Adam and Eve 71:5-6).'
  FROM cross_reference_threads t, cross_references x, _session253_1ae71_lookup sv, _session253_1ae71_lookup tv
 WHERE t.slug='1-adam-eve-71-forty-days-repentance'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=71 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 32:5 — *I acknowledged my sin unto thee, and mine iniquity have I not hid. I said, I will confess my transgressions unto Yahuah (LORD); and thou forgavest the iniquity of my sin. Selah.* Adam''s tearful confession is the very pattern of the penitent David sings (1 Adam and Eve 71:6).'
  FROM cross_reference_threads t, cross_references x, _session253_1ae71_lookup sv, _session253_1ae71_lookup tv
 WHERE t.slug='1-adam-eve-71-forty-days-repentance'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=71 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=32 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-71-word-raises-forgives
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word Elohim sends to raise Adam is the eternal Logos who was with Elohim from the beginning (1 Adam and Eve 71:7).'
  FROM cross_reference_threads t, cross_references x, _session253_1ae71_lookup sv, _session253_1ae71_lookup tv
 WHERE t.slug='1-adam-eve-71-word-raises-forgives'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=71 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The Word that lifts Adam from the dust will one day take flesh to lift the whole race (1 Adam and Eve 71:7).'
  FROM cross_reference_threads t, cross_references x, _session253_1ae71_lookup sv, _session253_1ae71_lookup tv
 WHERE t.slug='1-adam-eve-71-word-raises-forgives'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=71 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 1:1 — *Elohim (God), who at sundry times and in divers manners spake in time past unto the fathers by the prophets.* Elohim''s speaking to Adam by His Word is the first of the sundry times He addressed the fathers (1 Adam and Eve 71:7).'
  FROM cross_reference_threads t, cross_references x, _session253_1ae71_lookup sv, _session253_1ae71_lookup tv
 WHERE t.slug='1-adam-eve-71-word-raises-forgives'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=71 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 John 1:9 — *If we confess our sins, he is faithful and just to forgive us our sins, and to cleanse us from all unrighteousness.* Adam confesses and is forgiven by the faithful Word, the very promise John seals (1 Adam and Eve 71:8-9).'
  FROM cross_reference_threads t, cross_references x, _session253_1ae71_lookup sv, _session253_1ae71_lookup tv
 WHERE t.slug='1-adam-eve-71-word-raises-forgives'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=71 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=1 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-71-jealous-satan-seed-war
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Satan''s jealous plot to destroy Adam and Eve is the enmity Yahuah set against the woman''s seed (1 Adam and Eve 71:14).'
  FROM cross_reference_threads t, cross_references x, _session253_1ae71_lookup sv, _session253_1ae71_lookup tv
 WHERE t.slug='1-adam-eve-71-jealous-satan-seed-war'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=71 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* The devil who plans to destroy Adam will himself be undone by the manifested Son (1 Adam and Eve 71:14).'
  FROM cross_reference_threads t, cross_references x, _session253_1ae71_lookup sv, _session253_1ae71_lookup tv
 WHERE t.slug='1-adam-eve-71-jealous-satan-seed-war'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=71 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Wisdom of Solomon 2:24 — *Nevertheless through envy of the devil came death into the world: and they that do hold of his side do find it.* Wisdom names the envy that drives Satan''s jealousy against Adam and Eve (1 Adam and Eve 71:14).'
  FROM cross_reference_threads t, cross_references x, _session253_1ae71_lookup sv, _session253_1ae71_lookup tv
 WHERE t.slug='1-adam-eve-71-jealous-satan-seed-war'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=71 AND sv.verse_number=14
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=2 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

