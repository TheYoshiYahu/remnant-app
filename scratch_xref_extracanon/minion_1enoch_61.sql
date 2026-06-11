-- ----- fragment: minion_1enoch_61.sql (session250 1-enoch 61) -----
-- Source anchor: enoch/1-enoch ch61. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en61 (view _session250_en61_lookup). Sort band base 51500, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en61_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-61-measuring-cords-righteous
  ('enoch', '1-enoch', 61, 1, 'canon', 'zechariah', 2, 1, 'free', E'Zechariah 2:1 — *I lifted up mine eyes again, and looked, and behold a man with a measuring line in his hand.* The same surveyor with the cord that Enoch''s angels carry north to stake out the inheritance.'),
  ('enoch', '1-enoch', 61, 2, 'canon', 'zechariah', 2, 2, 'free', E'Zechariah 2:2 — *Then said I, Whither goest thou? And he said unto me, To measure Jerusalem, to see what is the breadth thereof, and what is the length thereof.* Enoch asks the angels the same question — ''Why have those taken these cords?'' — and is told ''They have gone to measure.'''),
  ('enoch', '1-enoch', 61, 3, 'canon', 'revelation', 11, 1, 'free', E'Revelation 11:1 — *And there was given me a reed like unto a rod: and the angel stood, saying, Rise, and measure the temple of Elohim (God), and the altar, and them that worship therein.* John is handed the same measuring rod to mark off the worshippers who belong to the Yahuah (God) of Spirits.'),
  ('enoch', '1-enoch', 61, 3, 'canon', 'revelation', 21, 15, 'free', E'Revelation 21:15 — *And he that talked with me had a golden reed to measure the city, and the gates thereof, and the wall thereof.* The measures of the righteous in Enoch become the golden reed that surveys the holy city for the elect.'),
  -- thread: 1-enoch-61-desert-beasts-sea-give-back-dead
  ('enoch', '1-enoch', 61, 5, 'canon', 'daniel', 12, 2, 'free', E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The ''depths of the earth'' Enoch says will give back its dead — the same awakening from the dust on the day of the Elect One.'),
  ('enoch', '1-enoch', 61, 5, 'canon', 'isaiah', 26, 19, 'free', E'Isaiah 26:19 — *Thy dead men shall live, together with my dead body shall they arise. Awake and sing, ye that dwell in dust: for thy dew is as the dew of herbs, and the earth shall cast out the dead.* Isaiah''s ''the earth shall cast out the dead'' is Enoch''s secret of the depths returning the perished elect.'),
  ('enoch', '1-enoch', 61, 5, 'canon', 'revelation', 20, 13, 'free', E'Revelation 20:13 — *And the sea gave up the dead which were in it; and death and hell delivered up the dead which were in them: and they were judged every man according to their works.* The very sea that ''devoured'' Enoch''s righteous gives them back, for none can be destroyed before the Yahuah (God) of Spirits.'),
  -- thread: 1-enoch-61-elect-one-throne-of-glory-judges
  ('enoch', '1-enoch', 61, 8, 'enoch', '1-enoch', 62, 1, 'extras', E'1 Enoch 62:1 — *And thus Yahuah (God) of Spirits named the Elect One, And seated him on the throne of His glory, And he shall judge all the works of the holy in heaven above, And weigh their deeds in the balance.* The next chapter repeats the enthronement and adds that the Father NAMES him — a title, not Daniel''s comparative.'),
  ('enoch', '1-enoch', 61, 8, 'canon', 'matthew', 25, 31, 'free', E'Matthew 25:31 — *When the Son of Adam shall come in his glory, and all the holy angels with him, then shall he sit upon the throne of his glory:* Yahusha (Jesus) claims Enoch''s throne of glory as His own seat of judgement, the named Son of Adam come in flesh.'),
  ('enoch', '1-enoch', 61, 8, 'canon', 'daniel', 7, 13, 'free', E'Daniel 7:13 — *I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him.* Daniel keeps the kaph — one *like* the Son of Adam — brought before the Head of Days; Enoch names that same One the Elect One set on the throne of glory.'),
  -- thread: 1-enoch-61-spirit-of-wisdom-on-elect-one
  ('enoch', '1-enoch', 61, 11, 'canon', 'isaiah', 11, 2, 'free', E'Isaiah 11:2 — *And the spirit of Yahuah (LORD) shall rest upon him, the spirit of wisdom and understanding, the spirit of counsel and might, the spirit of knowledge and of the fear of Yahuah (LORD);* The ''spirit of wisdom'' the host names on the Elect One is the very Spirit Isaiah rests on the Branch.'),
  ('enoch', '1-enoch', 61, 11, 'canon', 'isaiah', 11, 4, 'free', E'Isaiah 11:4 — *But with righteousness shall he judge the poor, and reprove with equity for the meek of the earth: and he shall smite the earth with the rod of his mouth, and with the breath of his lips shall he slay the wicked.* The Spirit-borne righteous judgement that equips Enoch''s Elect One to judge the works of the holy.'),
  ('enoch', '1-enoch', 61, 11, 'enoch', '1-enoch', 49, 3, 'extras', E'1 Enoch 49:3 — *And in him dwells the spirit of wisdom, And the spirit which gives insight, And the spirit of understanding and of might, And the spirit of those who have fallen asleep in righteousness.* Enoch''s own parallel fixing the sevenfold Spirit of wisdom and might on the Elect One.'),
  -- thread: 1-enoch-61-host-of-heaven-bless-one-voice
  ('enoch', '1-enoch', 61, 10, 'canon', 'revelation', 4, 8, 'free', E'Revelation 4:8 — *And the four beasts had each of them six wings about him; and they were full of eyes within: and they rest not day and night, saying, Holy, holy, holy, Yahuah Elohim (Lord God) Almighty, which was, and is, and is to come.* John''s living creatures are Enoch''s Cherubim and Seraphim, blessing the name of the Yahuah (God) of Spirits with one voice without ceasing.'),
  ('enoch', '1-enoch', 61, 11, 'canon', 'daniel', 7, 10, 'free', E'Daniel 7:10 — *A fiery stream issued and came forth from before him: thousand thousands ministered unto him, and ten thousand times ten thousand stood before him: the judgment was set, and the books were opened.* Daniel numbers the host that Enoch summons to bless with one voice as the judgement is set before the Head of Days.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en61_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en61_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-61-measuring-cords-righteous',
       E'The measuring cords for the portion of the righteous',
       E'Enoch watches the angels carry surveyors'' cords to mark out the inheritance of the elect: *And I saw in those days how long cords were given to those angels, and they took to themselves wings and flew, and they went towards the north.* (1 Enoch 61:1) — *‘These shall bring the measures of the righteous, And the ropes of the righteous to the righteous, That they may stay themselves on the name of Yahuah (God) of Spirits for ever and ever.* (1 Enoch 61:3) This is no new image. Zechariah saw the same surveyor of the inheritance: *I lifted up mine eyes again, and looked, and behold a man with a measuring line in his hand.* (Zechariah 2:1) — sent *To measure Jerusalem, to see what is the breadth thereof, and what is the length thereof.* (Zechariah 2:2) John, at the end, is handed the same cord to mark off who belongs to the Yahuah (God) of Spirits: *And there was given me a reed like unto a rod: and the angel stood, saying, Rise, and measure the temple of Elohim (God), and the altar, and them that worship therein.* (Revelation 11:1) — and the angel measures the city itself, *And he that talked with me had a golden reed to measure the city, and the gates thereof, and the wall thereof.* (Revelation 21:15) The measuring is election made visible: the elect''s portion is staked out and secured before the Father, the Head of Days, never a self-chosen class but a people allotted to His name.',
       sv.verse_id, ev.verse_id, 'extras', 51500
  FROM _session250_en61_lookup sv, _session250_en61_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=61 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=61 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-61-desert-beasts-sea-give-back-dead',
       E'The desert, the beasts, and the sea give back the righteous dead',
       E'The measuring cords reach even the perished, for nothing of the elect is lost before the Yahuah (God) of Spirits: *And these measures shall reveal all the secrets of the depths of the earth, And those who have been destroyed by the desert, And those who have been devoured by the beasts, And those who have been devoured by the fish of the sea, That they may return and stay themselves On the day of the Elect One; For none shall be destroyed before Yahuah (God) of Spirits, And none can be destroyed.* (1 Enoch 61:5) Daniel saw this same resurrection of the measured ones: *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* (Daniel 12:2) Isaiah sang it: *Thy dead men shall live, together with my dead body shall they arise. Awake and sing, ye that dwell in dust: for thy dew is as the dew of herbs, and the earth shall cast out the dead.* (Isaiah 26:19) And John watched the very sea that ''devoured'' them surrender its dead: *And the sea gave up the dead which were in it; and death and hell delivered up the dead which were in them: and they were judged every man according to their works.* (Revelation 20:13) Enoch''s promise that ''none can be destroyed'' is the resurrection hope — the earth, the wilderness, and the deep all give back the elect on the day of the Elect One.',
       sv.verse_id, ev.verse_id, 'extras', 51503
  FROM _session250_en61_lookup sv, _session250_en61_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=61 AND sv.verse_number=5
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=61 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-61-elect-one-throne-of-glory-judges',
       E'The Head of Days seats the Elect One on the throne of glory',
       E'The Father, the Head of Days, enthrones the Formed Son to judge: *And the Head of Days placed the Elect One on the throne of His glory; And he shall judge all the works of the holy in heaven above, And weigh their deeds in the balance.* (1 Enoch 61:8) — *And when he shall lift up his countenance To judge their secret ways according to the word of the name of Yahuah (God) of Spirits ... Then shall they all with one voice speak and bless, And glorify and extol and laud the name of Yahuah (God) of Spirits.* (1 Enoch 61:9) Enoch repeats it in the very next chapter, where the Father *names* the One — never a comparative: *And thus Yahuah (God) of Spirits named the Elect One, And seated him on the throne of His glory, And he shall judge all the works of the holy in heaven above, And weigh their deeds in the balance.* (1 Enoch 62:1) Yahusha (Jesus) claims this enthronement as His own: *When the Son of Adam shall come in his glory, and all the holy angels with him, then shall he sit upon the throne of his glory:* (Matthew 25:31) Daniel saw the scene with the kaph kept in place — *one like the Son of Adam* — brought before the same Head of Days, here called the Ancient of days: *I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him.* (Daniel 7:13) Daniel sees one *like* the Son of Adam — the Formed cloud-rider resembling mortal-man because He took on flesh; Enoch names that same One the Elect One, ordered under the Head of Days yet seated on His throne, worshipped with Him and distinct from Him.',
       sv.verse_id, ev.verse_id, 'extras', 51506
  FROM _session250_en61_lookup sv, _session250_en61_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=61 AND sv.verse_number=8
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=61 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-61-spirit-of-wisdom-on-elect-one',
       E'The sevenfold Spirit on the Elect One',
       E'The blessing of the host names the Spirit that rests on the Elect One: *And they shall raise one voice and bless and glorify and extol and praise the name of Yahuah (God) of Spirits in faith and in the spirit of faith, and in the spirit of wisdom, and of patience, and in the spirit of mercy, and in the spirit of judgement and of peace, and in the spirit of goodness ...* (1 Enoch 61:11) Isaiah laid this Spirit on the Branch from Jesse long before: *And the spirit of Yahuah (LORD) shall rest upon him, the spirit of wisdom and understanding, the spirit of counsel and might, the spirit of knowledge and of the fear of Yahuah (LORD);* (Isaiah 11:2) — and it equips Him to judge as Enoch''s Elect One judges: *But with righteousness shall he judge the poor, and reprove with equity for the meek of the earth: and he shall smite the earth with the rod of his mouth, and with the breath of his lips shall he slay the wicked.* (Isaiah 11:4) — *And righteousness shall be the girdle of his loins, and faithfulness the girdle of his reins.* (Isaiah 11:5) Enoch himself fixes this Spirit on the Elect One: *And in him dwells the spirit of wisdom, And the spirit which gives insight, And the spirit of understanding and of might, And the spirit of those who have fallen asleep in righteousness.* (1 Enoch 49:3) The Formed Son carries the Father''s own Spirit to judge with righteousness — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 51509
  FROM _session250_en61_lookup sv, _session250_en61_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=61 AND sv.verse_number=11
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=61 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-61-host-of-heaven-bless-one-voice',
       E'The whole host of heaven bless with one voice',
       E'When the Elect One lifts up His countenance to judge, all heaven answers as one: *And He will summon all the host of the heavens, and all the holy ones above, and the host of Elohim (God), the Cherubim, Seraphim and Ophanim, and all the angels of power, and all the angels of principalities, and the Chosen One ...* (1 Enoch 61:10) — *and shall all say with one voice: ‘Blessed is He, and may the name of Yahuah (God) of Spirits be blessed for ever and ever.’* (1 Enoch 61:11) John saw that same ceaseless one-voiced worship of the living creatures around the throne: *And the four beasts had each of them six wings about him; and they were full of eyes within: and they rest not day and night, saying, Holy, holy, holy, Yahuah Elohim (Lord God) Almighty, which was, and is, and is to come.* (Revelation 4:8) Daniel numbered the host that ministers and stands before the Head of Days at the judgement seat: *A fiery stream issued and came forth from before him: thousand thousands ministered unto him, and ten thousand times ten thousand stood before him: the judgment was set, and the books were opened.* (Daniel 7:10) The Cherubim, Seraphim, and Ophanim of Enoch are the four living creatures and the ten thousand times ten thousand — heaven blessing the name of the Father with one voice.',
       sv.verse_id, ev.verse_id, 'extras', 51512
  FROM _session250_en61_lookup sv, _session250_en61_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=61 AND sv.verse_number=10
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=61 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-61-measuring-cords-righteous
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Zechariah 2:1 — *I lifted up mine eyes again, and looked, and behold a man with a measuring line in his hand.* The same surveyor with the cord that Enoch''s angels carry north to stake out the inheritance.'
  FROM cross_reference_threads t, cross_references x, _session250_en61_lookup sv, _session250_en61_lookup tv
 WHERE t.slug='1-enoch-61-measuring-cords-righteous'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=61 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=2 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Zechariah 2:2 — *Then said I, Whither goest thou? And he said unto me, To measure Jerusalem, to see what is the breadth thereof, and what is the length thereof.* Enoch asks the angels the same question — ''Why have those taken these cords?'' — and is told ''They have gone to measure.'''
  FROM cross_reference_threads t, cross_references x, _session250_en61_lookup sv, _session250_en61_lookup tv
 WHERE t.slug='1-enoch-61-measuring-cords-righteous'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=61 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=2 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 11:1 — *And there was given me a reed like unto a rod: and the angel stood, saying, Rise, and measure the temple of Elohim (God), and the altar, and them that worship therein.* John is handed the same measuring rod to mark off the worshippers who belong to the Yahuah (God) of Spirits.'
  FROM cross_reference_threads t, cross_references x, _session250_en61_lookup sv, _session250_en61_lookup tv
 WHERE t.slug='1-enoch-61-measuring-cords-righteous'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=61 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=11 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 21:15 — *And he that talked with me had a golden reed to measure the city, and the gates thereof, and the wall thereof.* The measures of the righteous in Enoch become the golden reed that surveys the holy city for the elect.'
  FROM cross_reference_threads t, cross_references x, _session250_en61_lookup sv, _session250_en61_lookup tv
 WHERE t.slug='1-enoch-61-measuring-cords-righteous'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=61 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-61-desert-beasts-sea-give-back-dead
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The ''depths of the earth'' Enoch says will give back its dead — the same awakening from the dust on the day of the Elect One.'
  FROM cross_reference_threads t, cross_references x, _session250_en61_lookup sv, _session250_en61_lookup tv
 WHERE t.slug='1-enoch-61-desert-beasts-sea-give-back-dead'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=61 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 26:19 — *Thy dead men shall live, together with my dead body shall they arise. Awake and sing, ye that dwell in dust: for thy dew is as the dew of herbs, and the earth shall cast out the dead.* Isaiah''s ''the earth shall cast out the dead'' is Enoch''s secret of the depths returning the perished elect.'
  FROM cross_reference_threads t, cross_references x, _session250_en61_lookup sv, _session250_en61_lookup tv
 WHERE t.slug='1-enoch-61-desert-beasts-sea-give-back-dead'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=61 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=26 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 20:13 — *And the sea gave up the dead which were in it; and death and hell delivered up the dead which were in them: and they were judged every man according to their works.* The very sea that ''devoured'' Enoch''s righteous gives them back, for none can be destroyed before the Yahuah (God) of Spirits.'
  FROM cross_reference_threads t, cross_references x, _session250_en61_lookup sv, _session250_en61_lookup tv
 WHERE t.slug='1-enoch-61-desert-beasts-sea-give-back-dead'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=61 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-61-elect-one-throne-of-glory-judges
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 62:1 — *And thus Yahuah (God) of Spirits named the Elect One, And seated him on the throne of His glory, And he shall judge all the works of the holy in heaven above, And weigh their deeds in the balance.* The next chapter repeats the enthronement and adds that the Father NAMES him — a title, not Daniel''s comparative.'
  FROM cross_reference_threads t, cross_references x, _session250_en61_lookup sv, _session250_en61_lookup tv
 WHERE t.slug='1-enoch-61-elect-one-throne-of-glory-judges'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=61 AND sv.verse_number=8
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=62 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 25:31 — *When the Son of Adam shall come in his glory, and all the holy angels with him, then shall he sit upon the throne of his glory:* Yahusha (Jesus) claims Enoch''s throne of glory as His own seat of judgement, the named Son of Adam come in flesh.'
  FROM cross_reference_threads t, cross_references x, _session250_en61_lookup sv, _session250_en61_lookup tv
 WHERE t.slug='1-enoch-61-elect-one-throne-of-glory-judges'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=61 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 7:13 — *I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him.* Daniel keeps the kaph — one *like* the Son of Adam — brought before the Head of Days; Enoch names that same One the Elect One set on the throne of glory.'
  FROM cross_reference_threads t, cross_references x, _session250_en61_lookup sv, _session250_en61_lookup tv
 WHERE t.slug='1-enoch-61-elect-one-throne-of-glory-judges'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=61 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-61-spirit-of-wisdom-on-elect-one
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 11:2 — *And the spirit of Yahuah (LORD) shall rest upon him, the spirit of wisdom and understanding, the spirit of counsel and might, the spirit of knowledge and of the fear of Yahuah (LORD);* The ''spirit of wisdom'' the host names on the Elect One is the very Spirit Isaiah rests on the Branch.'
  FROM cross_reference_threads t, cross_references x, _session250_en61_lookup sv, _session250_en61_lookup tv
 WHERE t.slug='1-enoch-61-spirit-of-wisdom-on-elect-one'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=61 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 11:4 — *But with righteousness shall he judge the poor, and reprove with equity for the meek of the earth: and he shall smite the earth with the rod of his mouth, and with the breath of his lips shall he slay the wicked.* The Spirit-borne righteous judgement that equips Enoch''s Elect One to judge the works of the holy.'
  FROM cross_reference_threads t, cross_references x, _session250_en61_lookup sv, _session250_en61_lookup tv
 WHERE t.slug='1-enoch-61-spirit-of-wisdom-on-elect-one'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=61 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 49:3 — *And in him dwells the spirit of wisdom, And the spirit which gives insight, And the spirit of understanding and of might, And the spirit of those who have fallen asleep in righteousness.* Enoch''s own parallel fixing the sevenfold Spirit of wisdom and might on the Elect One.'
  FROM cross_reference_threads t, cross_references x, _session250_en61_lookup sv, _session250_en61_lookup tv
 WHERE t.slug='1-enoch-61-spirit-of-wisdom-on-elect-one'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=61 AND sv.verse_number=11
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=49 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-61-host-of-heaven-bless-one-voice
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 4:8 — *And the four beasts had each of them six wings about him; and they were full of eyes within: and they rest not day and night, saying, Holy, holy, holy, Yahuah Elohim (Lord God) Almighty, which was, and is, and is to come.* John''s living creatures are Enoch''s Cherubim and Seraphim, blessing the name of the Yahuah (God) of Spirits with one voice without ceasing.'
  FROM cross_reference_threads t, cross_references x, _session250_en61_lookup sv, _session250_en61_lookup tv
 WHERE t.slug='1-enoch-61-host-of-heaven-bless-one-voice'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=61 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=4 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:10 — *A fiery stream issued and came forth from before him: thousand thousands ministered unto him, and ten thousand times ten thousand stood before him: the judgment was set, and the books were opened.* Daniel numbers the host that Enoch summons to bless with one voice as the judgement is set before the Head of Days.'
  FROM cross_reference_threads t, cross_references x, _session250_en61_lookup sv, _session250_en61_lookup tv
 WHERE t.slug='1-enoch-61-host-of-heaven-bless-one-voice'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=61 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

