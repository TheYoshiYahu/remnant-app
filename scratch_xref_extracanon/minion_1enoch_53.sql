-- ----- fragment: minion_1enoch_53.sql (session250 1-enoch 53) -----
-- Source anchor: enoch/1-enoch ch53. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en53 (view _session250_en53_lookup). Sort band base 51300, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en53_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-53-valley-of-judgement
  ('enoch', '1-enoch', 53, 1, 'enoch', '1-enoch', 54, 1, 'extras', E'1 Enoch 54:1 — *And I looked and turned to another part of the earth, and saw there a deep valley with burning fire.* The next chapter reveals the deep valley of 53:1 as a valley of burning fire.'),
  ('enoch', '1-enoch', 53, 2, 'enoch', '1-enoch', 54, 2, 'extras', E'1 Enoch 54:2 — *And they brought the kings and the mighty, and began to cast them into this deep valley.* The valley that shall not become full (53:2) is filled with the kings and the mighty cast in.'),
  ('enoch', '1-enoch', 53, 2, 'canon', 'isaiah', 66, 24, 'free', E'Isaiah 66:24 — *And they shall go forth, and look upon the carcases of the men that have transgressed against me: for their worm shall not die, neither shall their fire be quenched; and they shall be an abhorring unto all flesh.* Isaiah names the same never-filled, never-quenched judgement on the transgressors that Enoch''s bottomless valley holds.'),
  -- thread: 1-enoch-53-instruments-of-satan-kings-mighty
  ('enoch', '1-enoch', 53, 6, 'canon', 'isaiah', 30, 33, 'free', E'Isaiah 30:33 — *For Tophet is ordained of old; yea, for the king it is prepared; he hath made it deep and large: the pile thereof is fire and much wood; the breath of Yahuah (LORD), like a stream of brimstone, doth kindle it.* Isaiah''s Tophet, prepared of old for the king, is the very deep furnace whose instruments the angels ready for the kings and mighty in 53:6.'),
  ('enoch', '1-enoch', 53, 5, 'canon', 'matthew', 13, 41, 'free', E'Matthew 13:41 — *The Son of Adam shall send forth his angels, and they shall gather out of his kingdom all things that offend, and them which do iniquity;* The Son of Adam dispatches the same angels of punishment Enoch sees making ready the instruments at 53:4-5.'),
  ('enoch', '1-enoch', 53, 6, 'canon', 'matthew', 13, 42, 'free', E'Matthew 13:42 — *And shall cast them into a furnace of fire: there shall be wailing and gnashing of teeth.* The furnace into which the workers of iniquity are cast is the destruction the instruments of 53:6 are prepared to accomplish.'),
  ('enoch', '1-enoch', 53, 6, 'enoch', '1-enoch', 62, 9, 'extras', E'1 Enoch 62:9 — *And this Son of Adam whom thou hast seen Shall raise up the kings and the mighty from their seats, [And the strong from their thrones] And shall loosen the reins of the strong, And break the teeth of the sinners.* The named Son of Adam executes the very judgement on the kings and mighty for whom the instruments are prepared in 53:6.'),
  ('enoch', '1-enoch', 53, 6, 'apocrypha', 'the-wisdom-of-solomon', 6, 6, 'extras', E'Wisdom of Solomon 6:6 — *For mercy will soon pardon the meanest: but mighty men shall be mightily tormented.* Wisdom weighs the sentence to the station exactly as 53:6 reserves the instruments for the kings, the mighty, and the exalted.'),
  ('enoch', '1-enoch', 53, 6, 'canon', 'revelation', 19, 20, 'free', E'Revelation 19:20 — *These both were cast alive into a lake of fire burning with brimstone.* The beast and false prophet — chief of the kings and mighty — are cast into the burning lake the instruments of 53:6 foretell.'),
  -- thread: 1-enoch-53-sinners-destroyed-before-yahuah-of-spirits
  ('enoch', '1-enoch', 53, 3, 'canon', 'revelation', 6, 15, 'free', E'Revelation 6:15 — *And the kings of the earth, and the great men, and the rich men, and the chief captains, and the mighty men, and every bondman, and every free man, hid themselves in the dens and in the rocks of the mountains;* The same kings and mighty of 53:3 flee, undone before the face from which they cannot be hidden.'),
  ('enoch', '1-enoch', 53, 3, 'canon', 'revelation', 6, 16, 'free', E'Revelation 6:16 — *And said to the mountains and rocks, Fall on us, and hide us from the face of him that sitteth on the throne, and from the wrath of the Lamb:* The sinners destroyed *before the face of Yahuah of Spirits* (53:3) are those who beg to be hidden from that very face.'),
  ('enoch', '1-enoch', 53, 3, 'canon', 'isaiah', 24, 21, 'free', E'Isaiah 24:21 — *And it shall come to pass in that day, that Yahuah (LORD) shall punish the host of the high ones that are on high, and the kings of the earth upon the earth.* Isaiah joins the host above and the kings below under one judgement, as 53:3 banishes the oppressors from off the face of His earth.'),
  ('enoch', '1-enoch', 53, 3, 'canon', 'isaiah', 24, 22, 'free', E'Isaiah 24:22 — *And they shall be gathered together, as prisoners are gathered in the pit, and shall be shut up in the prison, and after many days shall they be visited.* The pit-prison for the gathered transgressors mirrors the perishing for ever and ever of the sinners in 53:3.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en53_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en53_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-53-valley-of-judgement',
       E'The deep valley with open mouths — the place of judgement',
       E'Enoch is shown the appointed pit: *There mine eyes saw a deep valley with open mouths, And all who dwell on the dry ground and the sea and the islands shall bring gifts and offerings and acknowledgments to Him.* (1 Enoch 53:1), *But the valley shall not become full.* (1 Enoch 53:2) — a hollow that swallows the wicked yet is never filled. The very next chapter names what fills it: *And I looked and turned to another part of the earth, and saw there a deep valley with burning fire.* (1 Enoch 54:1), *And they brought the kings and the mighty, and began to cast them into this deep valley.* (1 Enoch 54:2). The Tanakh closes on the same unquenchable scene outside the gathered: *And they shall go forth, and look upon the carcases of the men that have transgressed against me: for their worm shall not die, neither shall their fire be quenched; and they shall be an abhorring unto all flesh.* (Isaiah 66:24) — the judgement is for transgressing the covenant, not for keeping it; the way of the righteous is never the thing condemned.',
       sv.verse_id, ev.verse_id, 'extras', 51300
  FROM _session250_en53_lookup sv, _session250_en53_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=53 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=53 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-53-instruments-of-satan-kings-mighty',
       E'The angels of punishment prepare the instruments of Satan for the kings and mighty',
       E'Enoch sees the executioners at their work: *And I saw there all the angels of punishment abiding (there) And preparing all the instruments of Satan.* (1 Enoch 53:4), and when he asks for whom, the answer is plain: *These they prepare for the kings and the mighty and the exalted, And for those who dwell on the earth, That they may thereby be destroyed.* (1 Enoch 53:6). The instruments are forged for the great precisely because they ruled and would not acknowledge the Most High — *And this Son of Adam whom thou hast seen Shall raise up the kings and the mighty from their seats, [And the strong from their thrones] And shall loosen the reins of the strong, And break the teeth of the sinners.* (1 Enoch 62:9). The Tanakh had already declared the furnace prepared for the king himself: *For Tophet is ordained of old; yea, for the king it is prepared; he hath made it deep and large: the pile thereof is fire and much wood; the breath of Yahuah (LORD), like a stream of brimstone, doth kindle it.* (Isaiah 30:33). The Son of Adam in the Gospels sends the very reapers Enoch watches: *The Son of Adam shall send forth his angels, and they shall gather out of his kingdom all things that offend, and them which do iniquity;* (Matthew 13:41), *And shall cast them into a furnace of fire: there shall be wailing and gnashing of teeth.* (Matthew 13:42) — note the title stands undisguised here, Son of Adam, the very name 1 Enoch gives the Elect One enthroned. The Apocrypha measures the sentence to the office: *For mercy will soon pardon the meanest: but mighty men shall be mightily tormented.* (Wisdom of Solomon 6:6). And the Revelation shows the last instrument fall on the chief of these mighty ones: *These both were cast alive into a lake of fire burning with brimstone.* (Revelation 19:20).',
       sv.verse_id, ev.verse_id, 'extras', 51303
  FROM _session250_en53_lookup sv, _session250_en53_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=53 AND sv.verse_number=4
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=53 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-53-sinners-destroyed-before-yahuah-of-spirits',
       E'The sinners destroyed before the face of Yahuah of Spirits',
       E'The lawless devour the oppressed, but their end is fixed before the throne: *And their hands commit lawless deeds, And the sinners devour all whom they lawlessly oppress: Yet the sinners shall be destroyed before the face of Yahuah (God) of Spirits, And they shall be banished from off the face of His earth, And they shall perish for ever and ever.* (1 Enoch 53:3). The Revelation shows that same face the kings cannot endure: *And the kings of the earth, and the great men, and the rich men, and the chief captains, and the mighty men, and every bondman, and every free man, hid themselves in the dens and in the rocks of the mountains;* (Revelation 6:15), *And said to the mountains and rocks, Fall on us, and hide us from the face of him that sitteth on the throne, and from the wrath of the Lamb:* (Revelation 6:16). Isaiah had named the day the high ones above and the kings below are gathered to the pit together: *And it shall come to pass in that day, that Yahuah (LORD) shall punish the host of the high ones that are on high, and the kings of the earth upon the earth.* (Isaiah 24:21), *And they shall be gathered together, as prisoners are gathered in the pit, and shall be shut up in the prison, and after many days shall they be visited.* (Isaiah 24:22) — the Watchers above and the tyrants below answer to one Judge, and His judgement is for the breach of the everlasting covenant, not for those who keep His way.',
       sv.verse_id, ev.verse_id, 'extras', 51306
  FROM _session250_en53_lookup sv, _session250_en53_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=53 AND sv.verse_number=3
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=53 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-53-valley-of-judgement
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 54:1 — *And I looked and turned to another part of the earth, and saw there a deep valley with burning fire.* The next chapter reveals the deep valley of 53:1 as a valley of burning fire.'
  FROM cross_reference_threads t, cross_references x, _session250_en53_lookup sv, _session250_en53_lookup tv
 WHERE t.slug='1-enoch-53-valley-of-judgement'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=53 AND sv.verse_number=1
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=54 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 54:2 — *And they brought the kings and the mighty, and began to cast them into this deep valley.* The valley that shall not become full (53:2) is filled with the kings and the mighty cast in.'
  FROM cross_reference_threads t, cross_references x, _session250_en53_lookup sv, _session250_en53_lookup tv
 WHERE t.slug='1-enoch-53-valley-of-judgement'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=53 AND sv.verse_number=2
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=54 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 66:24 — *And they shall go forth, and look upon the carcases of the men that have transgressed against me: for their worm shall not die, neither shall their fire be quenched; and they shall be an abhorring unto all flesh.* Isaiah names the same never-filled, never-quenched judgement on the transgressors that Enoch''s bottomless valley holds.'
  FROM cross_reference_threads t, cross_references x, _session250_en53_lookup sv, _session250_en53_lookup tv
 WHERE t.slug='1-enoch-53-valley-of-judgement'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=53 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=66 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-53-instruments-of-satan-kings-mighty
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 30:33 — *For Tophet is ordained of old; yea, for the king it is prepared; he hath made it deep and large: the pile thereof is fire and much wood; the breath of Yahuah (LORD), like a stream of brimstone, doth kindle it.* Isaiah''s Tophet, prepared of old for the king, is the very deep furnace whose instruments the angels ready for the kings and mighty in 53:6.'
  FROM cross_reference_threads t, cross_references x, _session250_en53_lookup sv, _session250_en53_lookup tv
 WHERE t.slug='1-enoch-53-instruments-of-satan-kings-mighty'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=53 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=30 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 13:41 — *The Son of Adam shall send forth his angels, and they shall gather out of his kingdom all things that offend, and them which do iniquity;* The Son of Adam dispatches the same angels of punishment Enoch sees making ready the instruments at 53:4-5.'
  FROM cross_reference_threads t, cross_references x, _session250_en53_lookup sv, _session250_en53_lookup tv
 WHERE t.slug='1-enoch-53-instruments-of-satan-kings-mighty'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=53 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=13 AND tv.verse_number=41
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 13:42 — *And shall cast them into a furnace of fire: there shall be wailing and gnashing of teeth.* The furnace into which the workers of iniquity are cast is the destruction the instruments of 53:6 are prepared to accomplish.'
  FROM cross_reference_threads t, cross_references x, _session250_en53_lookup sv, _session250_en53_lookup tv
 WHERE t.slug='1-enoch-53-instruments-of-satan-kings-mighty'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=53 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=13 AND tv.verse_number=42
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 62:9 — *And this Son of Adam whom thou hast seen Shall raise up the kings and the mighty from their seats, [And the strong from their thrones] And shall loosen the reins of the strong, And break the teeth of the sinners.* The named Son of Adam executes the very judgement on the kings and mighty for whom the instruments are prepared in 53:6.'
  FROM cross_reference_threads t, cross_references x, _session250_en53_lookup sv, _session250_en53_lookup tv
 WHERE t.slug='1-enoch-53-instruments-of-satan-kings-mighty'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=53 AND sv.verse_number=6
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=62 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Wisdom of Solomon 6:6 — *For mercy will soon pardon the meanest: but mighty men shall be mightily tormented.* Wisdom weighs the sentence to the station exactly as 53:6 reserves the instruments for the kings, the mighty, and the exalted.'
  FROM cross_reference_threads t, cross_references x, _session250_en53_lookup sv, _session250_en53_lookup tv
 WHERE t.slug='1-enoch-53-instruments-of-satan-kings-mighty'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=53 AND sv.verse_number=6
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=6 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Revelation 19:20 — *These both were cast alive into a lake of fire burning with brimstone.* The beast and false prophet — chief of the kings and mighty — are cast into the burning lake the instruments of 53:6 foretell.'
  FROM cross_reference_threads t, cross_references x, _session250_en53_lookup sv, _session250_en53_lookup tv
 WHERE t.slug='1-enoch-53-instruments-of-satan-kings-mighty'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=53 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=19 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-53-sinners-destroyed-before-yahuah-of-spirits
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 6:15 — *And the kings of the earth, and the great men, and the rich men, and the chief captains, and the mighty men, and every bondman, and every free man, hid themselves in the dens and in the rocks of the mountains;* The same kings and mighty of 53:3 flee, undone before the face from which they cannot be hidden.'
  FROM cross_reference_threads t, cross_references x, _session250_en53_lookup sv, _session250_en53_lookup tv
 WHERE t.slug='1-enoch-53-sinners-destroyed-before-yahuah-of-spirits'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=53 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=6 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 6:16 — *And said to the mountains and rocks, Fall on us, and hide us from the face of him that sitteth on the throne, and from the wrath of the Lamb:* The sinners destroyed *before the face of Yahuah of Spirits* (53:3) are those who beg to be hidden from that very face.'
  FROM cross_reference_threads t, cross_references x, _session250_en53_lookup sv, _session250_en53_lookup tv
 WHERE t.slug='1-enoch-53-sinners-destroyed-before-yahuah-of-spirits'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=53 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=6 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 24:21 — *And it shall come to pass in that day, that Yahuah (LORD) shall punish the host of the high ones that are on high, and the kings of the earth upon the earth.* Isaiah joins the host above and the kings below under one judgement, as 53:3 banishes the oppressors from off the face of His earth.'
  FROM cross_reference_threads t, cross_references x, _session250_en53_lookup sv, _session250_en53_lookup tv
 WHERE t.slug='1-enoch-53-sinners-destroyed-before-yahuah-of-spirits'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=53 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=24 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 24:22 — *And they shall be gathered together, as prisoners are gathered in the pit, and shall be shut up in the prison, and after many days shall they be visited.* The pit-prison for the gathered transgressors mirrors the perishing for ever and ever of the sinners in 53:3.'
  FROM cross_reference_threads t, cross_references x, _session250_en53_lookup sv, _session250_en53_lookup tv
 WHERE t.slug='1-enoch-53-sinners-destroyed-before-yahuah-of-spirits'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=53 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=24 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

