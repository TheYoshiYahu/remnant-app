-- ----- fragment: minion_1enoch_63.sql (session250 1-enoch 63) -----
-- Source anchor: enoch/1-enoch ch63. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en63 (view _session250_en63_lookup). Sort band base 51550, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en63_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-63-too-late-confession
  ('enoch', '1-enoch', 63, 3, 'canon', 'proverbs', 1, 28, 'free', E'Proverbs 1:28 — *Then shall they call upon me, but I will not answer; they shall seek me early, but they shall not find me:* The kings'' late supplication at the Son of Adam''s hands (63:3) is the cry that Wisdom long ago foretold would go unanswered.'),
  ('enoch', '1-enoch', 63, 4, 'canon', 'luke', 13, 25, 'free', E'Luke 13:25 — *When once the master of the house is risen up, and hath shut to the door, and ye begin to stand without, and to knock at the door, saying, Yahuah (Lord), Yahuah (Lord), open unto us; and he shall answer and say unto you, I know you not whence ye are:* Yahusha''s shut door is Enoch''s pressed-out departure (63:4) — the petition is heard but the hour of mercy has passed.'),
  ('enoch', '1-enoch', 63, 3, 'canon', 'matthew', 25, 11, 'free', E'Matthew 25:11 — *Afterward came also the other virgins, saying, Yahuah (Lord), Yahuah (Lord), open to us.* The late cry of the foolish virgins matches the kings'' too-late worship of that Son of Adam (63:3).'),
  ('enoch', '1-enoch', 63, 3, 'canon', 'matthew', 25, 12, 'free', E'Matthew 25:12 — *But he answered and said, Verily I say unto you, I know you not.* The refusal that meets the late virgins is the shame and darkness that meets the kings who supplicate too late (63:3-4).'),
  ('enoch', '1-enoch', 63, 4, 'canon', 'isaiah', 26, 10, 'free', E'Isaiah 26:10 — *Let favour be shewed to the wicked, yet will he not learn righteousness: in the land of uprightness will he deal unjustly, and will not behold the majesty of Yahuah (LORD).* The wicked who would not learn now confess only under pressure, then go forth in shame (63:4).'),
  -- thread: 1-enoch-63-elect-one-throne-of-glory
  ('enoch', '1-enoch', 63, 2, 'canon', 'daniel', 7, 13, 'free', E'Daniel 7:13 — *I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him.* The Head of Days seating the Elect One on the throne of glory (63:2) is Daniel''s Ancient of days bringing the one LIKE the Son of Adam near — Enoch names the figure Daniel sees by comparison.'),
  ('enoch', '1-enoch', 63, 6, 'canon', 'daniel', 7, 14, 'free', E'Daniel 7:14 — *And there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him: his dominion is an everlasting dominion, which shall not pass away, and his kingdom that which shall not be destroyed.* The Son of Adam driving the sinners from the earth (63:6) exercises the everlasting dominion given Him before the Ancient of days.'),
  ('enoch', '1-enoch', 63, 2, 'canon', 'isaiah', 11, 4, 'free', E'Isaiah 11:4 — *But with righteousness shall he judge the poor, and reprove with equity for the meek of the earth: and he shall smite the earth with the rod of his mouth, and with the breath of his lips shall he slay the wicked.* The word of His mouth that slays the sinners (63:2) is the rod-of-the-mouth of the Branch from Jesse''s stem.'),
  ('enoch', '1-enoch', 63, 2, 'canon', 'psalms', 2, 9, 'free', E'Psalms 2:9 — *Thou shalt break them with a rod of iron; thou shalt dash them in pieces like a potter''s vessel.* The Anointed Son who breaks the rebellious kings is the Elect One whose mouth-word slays the sinners (63:2).'),
  ('enoch', '1-enoch', 63, 5, 'canon', 'matthew', 25, 31, 'free', E'Matthew 25:31 — *When the Son of Adam shall come in his glory, and all the holy angels with him, then shall he sit upon the throne of his glory:* Yahusha names Himself the Son of Adam seated on the throne of glory to judge — the very seat from which the Elect One weighs deeds in the balance (63:5).'),
  -- thread: 1-enoch-63-kings-terror-too-late
  ('enoch', '1-enoch', 63, 8, 'canon', 'revelation', 6, 15, 'free', E'Revelation 6:15 — *And the kings of the earth, and the great men, and the rich men, and the chief captains, and the mighty men, and every bondman, and every free man, hid themselves in the dens and in the rocks of the mountains;* John''s roll of the terrified is Enoch''s kings and mighty whose countenance falls when they see the Son of Adam (63:8).'),
  ('enoch', '1-enoch', 63, 8, 'canon', 'revelation', 6, 16, 'free', E'Revelation 6:16 — *And said to the mountains and rocks, Fall on us, and hide us from the face of him that sitteth on the throne, and from the wrath of the Lamb:* The dread before Him that sitteth on the throne is Enoch''s terror at seeing that Son of Adam sitting on the throne of his glory (63:8).'),
  ('enoch', '1-enoch', 63, 7, 'canon', 'revelation', 6, 17, 'free', E'Revelation 6:17 — *For the great day of his wrath is come; and who shall be able to stand?* The day of wrath that none can stand against is Enoch''s day when the kings are seized with great terror and travail-pain (63:7).'),
  ('enoch', '1-enoch', 63, 8, 'apocrypha', 'the-wisdom-of-solomon', 5, 3, 'extras', E'Wisdom of Solomon 5:3 — *And they repenting and groaning for anguish of spirit shall say within themselves, This was he, whom we had sometimes in derision, and a proverb of reproach:* The wicked''s late, useless remorse on beholding the righteous One mirrors the kings'' fallen countenance before the Son of Adam (63:8).'),
  ('enoch', '1-enoch', 63, 7, 'apocrypha', 'the-wisdom-of-solomon', 5, 8, 'extras', E'Wisdom of Solomon 5:8 — *What has pride profited us? or what good has riches with our vaunting brought us?* The hollow boast of pride and riches is exactly the lament of Enoch''s kings and earth-possessors seized with travail (63:7).'),
  -- thread: 1-enoch-63-driven-from-the-earth-forever
  ('enoch', '1-enoch', 63, 6, 'enoch', '1-enoch', 62, 9, 'extras', E'1 Enoch 62:9 — *And this Son of Adam whom thou hast seen Shall raise up the kings and the mighty from their seats, [And the strong from their thrones] And shall loosen the reins of the strong, And break the teeth of the sinners.* The Son of Adam who drives the sinners from the earth (63:6) is the same One seen a chapter before breaking the teeth of the sinners.'),
  ('enoch', '1-enoch', 63, 9, 'enoch', '1-enoch', 62, 10, 'extras', E'1 Enoch 62:10 — *And he shall put down the kings from their thrones and kingdoms Because they do not extol and praise Him, Nor humbly acknowledge whence the kingdom was bestowed upon them.* The kings who perish for ever (63:9) are those put down for refusing to acknowledge the One from whom their kingdom was bestowed.'),
  ('enoch', '1-enoch', 63, 6, 'apocrypha', 'the-wisdom-of-solomon', 5, 6, 'extras', E'Wisdom of Solomon 5:6 — *Therefore have we erred from the way of truth, and the light of righteousness has not shined to us, and the sun of righteousness rose not upon us.* Those who led the world astray (63:6) confess at last that they themselves erred from the way of truth.'),
  ('enoch', '1-enoch', 63, 9, 'canon', 'psalms', 2, 12, 'free', E'Psalms 2:12 — *Kiss the Son, lest he be angry, and ye perish from the way, when his wrath is kindled but a little. Blessed are all they that put their trust in him.* The perishing for ever and ever (63:9) is precisely the perishing-from-the-way the kings courted by refusing to kiss the Son while there was time.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en63_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en63_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-63-too-late-confession',
       E'They Plead Too Late: I Know You Not',
       E'The proud now fall and confess, but the door is shut. *And all the kings and the mighty and the exalted and those who rule the earth Shall fall down on their faces before him and worship and set their hope upon that Son of Adam, And shall petition him and supplicate for mercy at his hands* (1 Enoch 63:3) — yet *Nevertheless that Yahuah (God) of Spirits will so press them That they shall hastily go forth from His presence, And their faces shall be filled with shame, And darkness shall be their dwelling* (1 Enoch 63:4). The Tanakh warned that the cry comes too late: *Then shall they call upon me, but I will not answer; they shall seek me early, but they shall not find me:* (Proverbs 1:28), for *Let favour be shewed to the wicked, yet will he not learn righteousness: in the land of uprightness will he deal unjustly, and will not behold the majesty of Yahuah (LORD).* (Isaiah 26:10). Yahusha sealed the same door in two parables — the shut house, *and ye begin to stand without, and to knock at the door, saying, Yahuah (Lord), Yahuah (Lord), open unto us; and he shall answer and say unto you, I know you not whence ye are:* (Luke 13:25), and the late virgins, *Yahuah (Lord), Yahuah (Lord), open to us. But he answered and said, Verily I say unto you, I know you not.* (Matthew 25:11-12). It ain''t new: election precedes confession, and a confession wrung out by terror is not the keeping of the covenant — the petition is real but the respite is past.',
       sv.verse_id, ev.verse_id, 'extras', 51550
  FROM _session250_en63_lookup sv, _session250_en63_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=63 AND sv.verse_number=3
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=63 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-63-elect-one-throne-of-glory',
       E'The Elect One Seated to Judge',
       E'The Father seats the Son to judge, and the verdict goes forth by the word of His mouth. *And the Head of Days shall seat him on the throne of His glory, And the spirit of righteousness is poured out upon him, And the word of his mouth slays the sinners* (1 Enoch 63:2); *And the Elect One shall stand up and judge them, And shall weigh their deeds in the balance, And their secret ways according to the word of the name of Yahuah (God) of Spirits* (1 Enoch 63:5). The Head of Days is the Father (formless) who enthrones the Formed Son; this is Daniel''s vision, where *behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him* (Daniel 7:13) — keep the kaph: Daniel sees *one like* the Son of Adam, the figure resembling mortal-man because he took on flesh, while Enoch openly NAMES that same One. To Him *was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him* (Daniel 7:14). The slaying word is Messiah''s own: *he shall smite the earth with the rod of his mouth, and with the breath of his lips shall he slay the wicked* (Isaiah 11:4); *Thou shalt break them with a rod of iron; thou shalt dash them in pieces like a potter''s vessel* (Psalm 2:9); and Yahusha confirms the seat, *When the Son of Adam shall come in his glory, and all the holy angels with him, then shall he sit upon the throne of his glory:* (Matthew 25:31). The Son is ordered under the Father, worshipped with Him yet distinct — not co-equal-persons, not a mere man, not a created angel.',
       sv.verse_id, ev.verse_id, 'extras', 51553
  FROM _session250_en63_lookup sv, _session250_en63_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=63 AND sv.verse_number=2
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=63 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-63-kings-terror-too-late',
       E'Terror of the Kings Before the Son of Adam',
       E'When the proud finally SEE the One they mocked, terror seizes them. *And one portion of them shall look on the other, And they shall be terrified, And their countenance shall fall, And pain shall seize them, When they see that Son of Adam Sitting on the throne of his glory* (1 Enoch 63:8); *In those days the kings and the mighty who possess the earth Shall be seized with great terror, And shall be seized with pain like a woman in travail* (1 Enoch 63:7). John saw the same rout: *And the kings of the earth, and the great men, and the rich men, and the chief captains, and the mighty men, and every bondman, and every free man, hid themselves in the dens and in the rocks of the mountains;* (Revelation 6:15), crying *to the mountains and rocks, Fall on us, and hide us from the face of him that sitteth on the throne, and from the wrath of the Lamb:* (Revelation 6:16), *For the great day of his wrath is come; and who shall be able to stand?* (Revelation 6:17). The Wisdom of Solomon gives the wicked their late soliloquy as they behold the righteous One they derided: *And they repenting and groaning for anguish of spirit shall say within themselves, This was he, whom we had sometimes in derision, and a proverb of reproach:* (Wisdom of Solomon 5:3), *What has pride profited us? or what good has riches with our vaunting brought us?* (Wisdom of Solomon 5:8). It ain''t new — the same list of kings, mighty, and earth-possessors, the same too-late dread before the throne.',
       sv.verse_id, ev.verse_id, 'extras', 51556
  FROM _session250_en63_lookup sv, _session250_en63_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=63 AND sv.verse_number=7
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=63 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-63-driven-from-the-earth-forever',
       E'Driven From the Earth, Perished For Ever',
       E'The sentence is final: the sinners are swept off the earth and perish without end. *And the Son of Adam shall cause the sinners to be driven from the face of the earth, And those who have led the world astray* (1 Enoch 63:6); *And Yahuah (God) of Spirits shall drive them from the face of the earth, And they shall be driven from the face of the earth, And they shall perish for ever and ever* (1 Enoch 63:9). This is the same Son of Adam whose coming Enoch saw a chapter earlier — *And this Son of Adam whom thou hast seen Shall raise up the kings and the mighty from their seats... And break the teeth of the sinners* (1 Enoch 62:9) — and who *shall put down the kings from their thrones and kingdoms Because they do not extol and praise Him* (1 Enoch 62:10). Wisdom names the cause of their ruin: they confess *Therefore have we erred from the way of truth, and the light of righteousness has not shined to us, and the sun of righteousness rose not upon us.* (Wisdom of Solomon 5:6). And Psalm 2 holds out the only escape that the kings refused while there was time: *Kiss the Son, lest he be angry, and ye perish from the way, when his wrath is kindled but a little. Blessed are all they that put their trust in him.* (Psalm 2:12). Torah stands: the everlasting perishing falls on those who led the world astray from the covenant, not on those who kept His way.',
       sv.verse_id, ev.verse_id, 'extras', 51559
  FROM _session250_en63_lookup sv, _session250_en63_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=63 AND sv.verse_number=6
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=63 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-63-too-late-confession
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 1:28 — *Then shall they call upon me, but I will not answer; they shall seek me early, but they shall not find me:* The kings'' late supplication at the Son of Adam''s hands (63:3) is the cry that Wisdom long ago foretold would go unanswered.'
  FROM cross_reference_threads t, cross_references x, _session250_en63_lookup sv, _session250_en63_lookup tv
 WHERE t.slug='1-enoch-63-too-late-confession'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=63 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=1 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 13:25 — *When once the master of the house is risen up, and hath shut to the door, and ye begin to stand without, and to knock at the door, saying, Yahuah (Lord), Yahuah (Lord), open unto us; and he shall answer and say unto you, I know you not whence ye are:* Yahusha''s shut door is Enoch''s pressed-out departure (63:4) — the petition is heard but the hour of mercy has passed.'
  FROM cross_reference_threads t, cross_references x, _session250_en63_lookup sv, _session250_en63_lookup tv
 WHERE t.slug='1-enoch-63-too-late-confession'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=63 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=13 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 25:11 — *Afterward came also the other virgins, saying, Yahuah (Lord), Yahuah (Lord), open to us.* The late cry of the foolish virgins matches the kings'' too-late worship of that Son of Adam (63:3).'
  FROM cross_reference_threads t, cross_references x, _session250_en63_lookup sv, _session250_en63_lookup tv
 WHERE t.slug='1-enoch-63-too-late-confession'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=63 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 25:12 — *But he answered and said, Verily I say unto you, I know you not.* The refusal that meets the late virgins is the shame and darkness that meets the kings who supplicate too late (63:3-4).'
  FROM cross_reference_threads t, cross_references x, _session250_en63_lookup sv, _session250_en63_lookup tv
 WHERE t.slug='1-enoch-63-too-late-confession'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=63 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Isaiah 26:10 — *Let favour be shewed to the wicked, yet will he not learn righteousness: in the land of uprightness will he deal unjustly, and will not behold the majesty of Yahuah (LORD).* The wicked who would not learn now confess only under pressure, then go forth in shame (63:4).'
  FROM cross_reference_threads t, cross_references x, _session250_en63_lookup sv, _session250_en63_lookup tv
 WHERE t.slug='1-enoch-63-too-late-confession'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=63 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=26 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-63-elect-one-throne-of-glory
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:13 — *I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him.* The Head of Days seating the Elect One on the throne of glory (63:2) is Daniel''s Ancient of days bringing the one LIKE the Son of Adam near — Enoch names the figure Daniel sees by comparison.'
  FROM cross_reference_threads t, cross_references x, _session250_en63_lookup sv, _session250_en63_lookup tv
 WHERE t.slug='1-enoch-63-elect-one-throne-of-glory'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=63 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:14 — *And there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him: his dominion is an everlasting dominion, which shall not pass away, and his kingdom that which shall not be destroyed.* The Son of Adam driving the sinners from the earth (63:6) exercises the everlasting dominion given Him before the Ancient of days.'
  FROM cross_reference_threads t, cross_references x, _session250_en63_lookup sv, _session250_en63_lookup tv
 WHERE t.slug='1-enoch-63-elect-one-throne-of-glory'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=63 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 11:4 — *But with righteousness shall he judge the poor, and reprove with equity for the meek of the earth: and he shall smite the earth with the rod of his mouth, and with the breath of his lips shall he slay the wicked.* The word of His mouth that slays the sinners (63:2) is the rod-of-the-mouth of the Branch from Jesse''s stem.'
  FROM cross_reference_threads t, cross_references x, _session250_en63_lookup sv, _session250_en63_lookup tv
 WHERE t.slug='1-enoch-63-elect-one-throne-of-glory'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=63 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalms 2:9 — *Thou shalt break them with a rod of iron; thou shalt dash them in pieces like a potter''s vessel.* The Anointed Son who breaks the rebellious kings is the Elect One whose mouth-word slays the sinners (63:2).'
  FROM cross_reference_threads t, cross_references x, _session250_en63_lookup sv, _session250_en63_lookup tv
 WHERE t.slug='1-enoch-63-elect-one-throne-of-glory'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=63 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Matthew 25:31 — *When the Son of Adam shall come in his glory, and all the holy angels with him, then shall he sit upon the throne of his glory:* Yahusha names Himself the Son of Adam seated on the throne of glory to judge — the very seat from which the Elect One weighs deeds in the balance (63:5).'
  FROM cross_reference_threads t, cross_references x, _session250_en63_lookup sv, _session250_en63_lookup tv
 WHERE t.slug='1-enoch-63-elect-one-throne-of-glory'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=63 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-63-kings-terror-too-late
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 6:15 — *And the kings of the earth, and the great men, and the rich men, and the chief captains, and the mighty men, and every bondman, and every free man, hid themselves in the dens and in the rocks of the mountains;* John''s roll of the terrified is Enoch''s kings and mighty whose countenance falls when they see the Son of Adam (63:8).'
  FROM cross_reference_threads t, cross_references x, _session250_en63_lookup sv, _session250_en63_lookup tv
 WHERE t.slug='1-enoch-63-kings-terror-too-late'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=63 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=6 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 6:16 — *And said to the mountains and rocks, Fall on us, and hide us from the face of him that sitteth on the throne, and from the wrath of the Lamb:* The dread before Him that sitteth on the throne is Enoch''s terror at seeing that Son of Adam sitting on the throne of his glory (63:8).'
  FROM cross_reference_threads t, cross_references x, _session250_en63_lookup sv, _session250_en63_lookup tv
 WHERE t.slug='1-enoch-63-kings-terror-too-late'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=63 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=6 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 6:17 — *For the great day of his wrath is come; and who shall be able to stand?* The day of wrath that none can stand against is Enoch''s day when the kings are seized with great terror and travail-pain (63:7).'
  FROM cross_reference_threads t, cross_references x, _session250_en63_lookup sv, _session250_en63_lookup tv
 WHERE t.slug='1-enoch-63-kings-terror-too-late'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=63 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=6 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Wisdom of Solomon 5:3 — *And they repenting and groaning for anguish of spirit shall say within themselves, This was he, whom we had sometimes in derision, and a proverb of reproach:* The wicked''s late, useless remorse on beholding the righteous One mirrors the kings'' fallen countenance before the Son of Adam (63:8).'
  FROM cross_reference_threads t, cross_references x, _session250_en63_lookup sv, _session250_en63_lookup tv
 WHERE t.slug='1-enoch-63-kings-terror-too-late'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=63 AND sv.verse_number=8
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=5 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Wisdom of Solomon 5:8 — *What has pride profited us? or what good has riches with our vaunting brought us?* The hollow boast of pride and riches is exactly the lament of Enoch''s kings and earth-possessors seized with travail (63:7).'
  FROM cross_reference_threads t, cross_references x, _session250_en63_lookup sv, _session250_en63_lookup tv
 WHERE t.slug='1-enoch-63-kings-terror-too-late'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=63 AND sv.verse_number=7
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-63-driven-from-the-earth-forever
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 62:9 — *And this Son of Adam whom thou hast seen Shall raise up the kings and the mighty from their seats, [And the strong from their thrones] And shall loosen the reins of the strong, And break the teeth of the sinners.* The Son of Adam who drives the sinners from the earth (63:6) is the same One seen a chapter before breaking the teeth of the sinners.'
  FROM cross_reference_threads t, cross_references x, _session250_en63_lookup sv, _session250_en63_lookup tv
 WHERE t.slug='1-enoch-63-driven-from-the-earth-forever'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=63 AND sv.verse_number=6
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=62 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 62:10 — *And he shall put down the kings from their thrones and kingdoms Because they do not extol and praise Him, Nor humbly acknowledge whence the kingdom was bestowed upon them.* The kings who perish for ever (63:9) are those put down for refusing to acknowledge the One from whom their kingdom was bestowed.'
  FROM cross_reference_threads t, cross_references x, _session250_en63_lookup sv, _session250_en63_lookup tv
 WHERE t.slug='1-enoch-63-driven-from-the-earth-forever'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=63 AND sv.verse_number=9
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=62 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Wisdom of Solomon 5:6 — *Therefore have we erred from the way of truth, and the light of righteousness has not shined to us, and the sun of righteousness rose not upon us.* Those who led the world astray (63:6) confess at last that they themselves erred from the way of truth.'
  FROM cross_reference_threads t, cross_references x, _session250_en63_lookup sv, _session250_en63_lookup tv
 WHERE t.slug='1-enoch-63-driven-from-the-earth-forever'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=63 AND sv.verse_number=6
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=5 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalms 2:12 — *Kiss the Son, lest he be angry, and ye perish from the way, when his wrath is kindled but a little. Blessed are all they that put their trust in him.* The perishing for ever and ever (63:9) is precisely the perishing-from-the-way the kings courted by refusing to kiss the Son while there was time.'
  FROM cross_reference_threads t, cross_references x, _session250_en63_lookup sv, _session250_en63_lookup tv
 WHERE t.slug='1-enoch-63-driven-from-the-earth-forever'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=63 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

