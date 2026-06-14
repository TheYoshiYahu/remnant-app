-- ----- fragment: minion_martyrdompolycarp_01.sql (session253 martyrdom-polycarp 1) -----
-- Source anchor: lightfoot-apostolic-fathers/martyrdom-polycarp ch1. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: martyrdo1 (view _session253_martyrdo1_lookup). Sort band base 70900, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_martyrdo1_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: martyrdom-polycarp-1-conformable-to-the-gospel
  ('lightfoot-apostolic-fathers', 'martyrdom-polycarp', 1, 1, 'canon', 'philippians', 3, 10, 'free', E'Philippians 3:10 -- *That I may know him, and the power of his resurrection, and the fellowship of his sufferings, being made conformable unto his death.* Polycarp''s death "conformable to the Gospel" is Paul''s same word for being conformed to the Messiah''s death.'),
  ('lightfoot-apostolic-fathers', 'martyrdom-polycarp', 1, 1, 'canon', '1-peter', 1, 11, 'free', E'1 Peter 1:11 -- *Searching what, or what manner of time the Spirit of Messiah (Christ) which was in them did signify, when it testified beforehand the sufferings of Messiah (Christ), and the glory that should follow.* The suffering-then-glory pattern Peter names is the very Gospel the martyrdom is said to be conformable to in 1:1.'),
  ('lightfoot-apostolic-fathers', 'martyrdom-polycarp', 1, 19, 'canon', 'matthew', 20, 22, 'free', E'Matthew 20:22 -- *But Yahusha (Jesus) answered and said, Ye know not what ye ask. Are ye able to drink of the cup that I shall drink of, and to be baptized with the baptism that I am baptized with? They say unto him, We are able.* Polycarp''s martyrdom "after the pattern of the Gospel" (1:19) is the drinking of the cup the Master held out to His own.'),
  -- thread: martyrdom-polycarp-1-my-king-who-saved-me
  ('lightfoot-apostolic-fathers', 'martyrdom-polycarp', 1, 8, 'canon', 'revelation', 2, 10, 'free', E'Revelation 2:10 -- *Fear none of those things which thou shalt suffer: behold, the devil shall cast some of you into prison, that ye may be tried; and ye shall have tribulation ten days: be thou faithful unto death, and I will give thee a crown of life.* The Messiah spoke this to the church in Smyrna -- Polycarp''s own city -- and Polycarp''s "how can I blaspheme my King who saved me?" (1:8) is that faithfulness unto death.'),
  ('lightfoot-apostolic-fathers', 'martyrdom-polycarp', 1, 8, 'canon', 'romans', 8, 35, 'free', E'Romans 8:35 -- *Who shall separate us from the love of Messiah (Christ)? shall tribulation, or distress, or persecution, or famine, or nakedness, or peril, or sword?* Neither the proconsul''s threats nor the fire could separate Polycarp from the King he had served eighty-six years (1:8).'),
  ('lightfoot-apostolic-fathers', 'martyrdom-polycarp', 1, 8, 'canon', 'acts', 7, 60, 'free', E'Acts 7:60 -- *And he kneeled down, and cried with a loud voice, Yahuah (Lord), lay not this sin to their charge. And when he had said this, he fell asleep.* Stephen the first martyr dies blessing his killers, the same constancy with which Polycarp faced his accusers (1:8).'),
  ('lightfoot-apostolic-fathers', 'martyrdom-polycarp', 1, 8, 'canon', 'luke', 23, 34, 'free', E'Luke 23:34 -- *Then said Yahusha (Jesus), Father, forgive them; for they know not what they do. And they parted his raiment, and cast lots.* The Master''s own forbearance toward His executioners is the pattern of the witness Polycarp keeps in refusing to blaspheme his King (1:8).'),
  -- thread: martyrdom-polycarp-1-the-cup-unto-resurrection
  ('lightfoot-apostolic-fathers', 'martyrdom-polycarp', 1, 14, 'canon', 'matthew', 20, 23, 'free', E'Matthew 20:23 -- *And he saith unto them, Ye shall drink indeed of my cup, and be baptized with the baptism that I am baptized with: but to sit on my right hand, and on my left, is not mine to give, but it shall be given to them for whom it is prepared of my Father.* Polycarp''s prayer to receive "a portion... in the cup of [Thy] Messiah" (1:14) is the very cup the Master said His own would drink.'),
  ('lightfoot-apostolic-fathers', 'martyrdom-polycarp', 1, 14, 'canon', 'daniel', 12, 2, 'free', E'Daniel 12:2 -- *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* Polycarp''s hope of "resurrection of eternal life, both of soul and of body" (1:14) rests on Daniel''s promise of the awakening of the dead.'),
  ('lightfoot-apostolic-fathers', 'martyrdom-polycarp', 1, 14, 'canon', 'romans', 8, 17, 'free', E'Romans 8:17 -- *And if children, then heirs; heirs of Elohim (God), and joint-heirs with Messiah (Christ); if so be that we suffer with him, that we may be also glorified together.* Polycarp offered as "a burnt sacrifice acceptable to Elohim" (1:14) is the suffering-with that Paul says ends in being glorified together.'),
  -- thread: martyrdom-polycarp-1-gold-refined-in-the-furnace
  ('lightfoot-apostolic-fathers', 'martyrdom-polycarp', 1, 15, 'canon', '1-peter', 1, 7, 'free', E'1 Peter 1:7 -- *That the trial of your faith, being much more precious than of gold that perisheth, though it be tried with fire, might be found unto praise and honour and glory at the appearing of Yahusha HaMashiach (Jesus Christ).* The body in the flame "like gold and silver refined in a furnace" (1:15) is Peter''s trial-by-fire of faith more precious than gold.'),
  ('lightfoot-apostolic-fathers', 'martyrdom-polycarp', 1, 15, 'canon', 'zechariah', 13, 9, 'free', E'Zechariah 13:9 -- *And I will bring the third part through the fire, and will refine them as silver is refined, and will try them as gold is tried: they shall call on my name, and I will hear them: I will say, It is my people: and they shall say, Yahuah (LORD) is my Elohim (God).* The refining of the faithful through fire is the same picture the witnesses saw in Polycarp''s flame (1:15).'),
  ('lightfoot-apostolic-fathers', 'martyrdom-polycarp', 1, 15, 'canon', 'malachi', 3, 3, 'free', E'Malachi 3:3 -- *And he shall sit as a refiner and purifier of silver: and he shall purify the sons of Levi, and purge them as gold and silver, that they may offer unto Yahuah (LORD) an offering in righteousness.* Polycarp refined "like gold and silver in a furnace" (1:15) is the offering in righteousness the Refiner purges out.'),
  -- thread: martyrdom-polycarp-1-precious-bones-crown-of-immortality
  ('lightfoot-apostolic-fathers', 'martyrdom-polycarp', 1, 18, 'canon', 'psalms', 116, 15, 'free', E'Psalms 116:15 -- *Precious in the sight of Yahuah (LORD) is the death of his saints.* The bones "more valuable than precious stones and finer than refined gold" (1:18) are precious because the saint''s death is precious to Yahuah Himself.'),
  ('lightfoot-apostolic-fathers', 'martyrdom-polycarp', 1, 17, 'canon', 'revelation', 2, 10, 'free', E'Revelation 2:10 -- *Fear none of those things which thou shalt suffer: behold, the devil shall cast some of you into prison, that ye may be tried; and ye shall have tribulation ten days: be thou faithful unto death, and I will give thee a crown of life.* Polycarp "crowned with the crown of immortality" (1:17) receives the very crown of life promised to faithful Smyrna.'),
  ('lightfoot-apostolic-fathers', 'martyrdom-polycarp', 1, 20, 'canon', '1-peter', 1, 4, 'free', E'1 Peter 1:4 -- *To an inheritance incorruptible, and undefiled, and that fadeth not away, reserved in heaven for you.* The Elohim "who maketh election from His own servants" (1:20) keeps for His elect this incorruptible inheritance reserved in heaven.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_martyrdo1_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_martyrdo1_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'martyrdom-polycarp-1-conformable-to-the-gospel',
       E'A martyrdom conformable to the Gospel',
       E'The Smyrnaeans set the whole account under one banner: *For nearly all the foregoing events came to pass that Yahuah (Lord) might show us once more an example of martyrdom which is conformable to the Gospel. For he lingered that he might be delivered up, even as Yahuah (Lord) did, to the end that we too might be imitators of him* (Martyrdom of Polycarp 1:1) -- and they close it the same way: *whose martyrdom all desire to imitate, seeing that it was after the pattern of the Gospel of Messiah (Christ)* (Martyrdom of Polycarp 1:19). It ain''t new -- this is Paul''s own longing: *That I may know him, and the power of his resurrection, and the fellowship of his sufferings, being made conformable unto his death* (Philippians 3:10). Peter had already named the pattern the prophets searched out -- *the sufferings of Messiah (Christ), and the glory that should follow* (1 Peter 1:11) -- and the Master Himself asked whether His own could drink it: *Are ye able to drink of the cup that I shall drink of* (Matthew 20:22). The witness is not a new religion; it is the Gospel re-enacted in the faithful.',
       sv.verse_id, ev.verse_id, 'extras', 70900
  FROM _session253_martyrdo1_lookup sv, _session253_martyrdo1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='martyrdom-polycarp' AND sv.chapter_number=1 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='martyrdom-polycarp' AND ev.chapter_number=1 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'martyrdom-polycarp-1-my-king-who-saved-me',
       E'My King who saved me -- faithful unto death',
       E'Pressed to revile the Messiah and go free, the old bishop answers: *Fourscore and six years have I been His servant, and He hath done me no wrong. How then can I blaspheme my King who saved me?* (Martyrdom of Polycarp 1:8). It ain''t new -- this is the crown the risen Messiah promised Smyrna by name: *be thou faithful unto death, and I will give thee a crown of life* (Revelation 2:10). Nothing could pry him loose, just as Paul vowed: *Who shall separate us from the love of Messiah (Christ)? shall tribulation, or distress, or persecution, or famine, or nakedness, or peril, or sword?* (Romans 8:35) -- *Nay, in all these things we are more than conquerors through him that loved us* (Romans 8:37). And his dying posture is the Master''s and Stephen''s: where Yahusha prayed *Father, forgive them; for they know not what they do* (Luke 23:34), and Stephen *kneeled down, and cried with a loud voice, Yahuah (Lord), lay not this sin to their charge* (Acts 7:60), Polycarp too remembered and blessed to the end.',
       sv.verse_id, ev.verse_id, 'extras', 70903
  FROM _session253_martyrdo1_lookup sv, _session253_martyrdo1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='martyrdom-polycarp' AND sv.chapter_number=1 AND sv.verse_number=8
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='martyrdom-polycarp' AND ev.chapter_number=1 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'martyrdom-polycarp-1-the-cup-unto-resurrection',
       E'The cup of the Messiah unto resurrection of eternal life',
       E'Bound to the stake, Polycarp prays as a willing offering: *like a noble ram out of a great flock for an offering, a burnt sacrifice made ready and acceptable to Elohim (God)... that I might receive a portion amongst the number of martyrs in the cup of [Thy] Messiah (Christ) unto resurrection of eternal life, both of soul and of body* (Martyrdom of Polycarp 1:14). It ain''t new -- the cup is the Master''s: *Ye shall drink indeed of my cup, and be baptized with the baptism that I am baptized with* (Matthew 20:23). The hope of body-and-soul resurrection is Daniel''s: *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt* (Daniel 12:2). And the suffering-then-glory is Paul''s inheritance clause: *if so be that we suffer with him, that we may be also glorified together* (Romans 8:17).',
       sv.verse_id, ev.verse_id, 'extras', 70906
  FROM _session253_martyrdo1_lookup sv, _session253_martyrdo1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='martyrdom-polycarp' AND sv.chapter_number=1 AND sv.verse_number=14
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='martyrdom-polycarp' AND ev.chapter_number=1 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'martyrdom-polycarp-1-gold-refined-in-the-furnace',
       E'Gold and silver refined in a furnace -- the trial of faith',
       E'The eyewitnesses see no ordinary burning: *it was there in the midst, not like flesh burning, but like [a loaf in the oven or like] gold and silver refined in a furnace. For we perceived such a fragrant smell, as if it were the wafted odour of frankincense or some other precious spice* (Martyrdom of Polycarp 1:15). It ain''t new -- Peter named the trial: *That the trial of your faith, being much more precious than of gold that perisheth, though it be tried with fire, might be found unto praise and honour and glory* (1 Peter 1:7). The prophets had long shown the refining furnace of the faithful remnant: *And I will bring the third part through the fire, and will refine them as silver is refined, and will try them as gold is tried: they shall call on my name, and I will hear them* (Zechariah 13:9); *And he shall sit as a refiner and purifier of silver... that they may offer unto Yahuah (LORD) an offering in righteousness* (Malachi 3:3). The fire that would not consume him was a refining, not a destroying.',
       sv.verse_id, ev.verse_id, 'extras', 70909
  FROM _session253_martyrdo1_lookup sv, _session253_martyrdo1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='martyrdom-polycarp' AND sv.chapter_number=1 AND sv.verse_number=15
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='martyrdom-polycarp' AND ev.chapter_number=1 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'martyrdom-polycarp-1-precious-bones-crown-of-immortality',
       E'More precious than gold -- the crown of immortality and the elect',
       E'The Evil One could not keep the saints from honouring him: *crowned with the crown of immortality and had won a reward which none could gainsay* (Martyrdom of Polycarp 1:17); and his remains were *bones which are more valuable than precious stones and finer than refined gold* (Martyrdom of Polycarp 1:18), kept for the day Yahuah *who maketh election from His own servants* (Martyrdom of Polycarp 1:20) would gather them. It ain''t new -- the death of such a one is no waste to Heaven: *Precious in the sight of Yahuah (LORD) is the death of his saints* (Psalm 116:15). The crown of immortality is the very crown the Messiah pledged to Smyrna: *be thou faithful unto death, and I will give thee a crown of life* (Revelation 2:10). And election precedes confession -- the inheritance kept *incorruptible, and undefiled, and that fadeth not away, reserved in heaven for you* (1 Peter 1:4).',
       sv.verse_id, ev.verse_id, 'extras', 70912
  FROM _session253_martyrdo1_lookup sv, _session253_martyrdo1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='martyrdom-polycarp' AND sv.chapter_number=1 AND sv.verse_number=17
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='martyrdom-polycarp' AND ev.chapter_number=1 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: martyrdom-polycarp-1-conformable-to-the-gospel
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Philippians 3:10 -- *That I may know him, and the power of his resurrection, and the fellowship of his sufferings, being made conformable unto his death.* Polycarp''s death "conformable to the Gospel" is Paul''s same word for being conformed to the Messiah''s death.'
  FROM cross_reference_threads t, cross_references x, _session253_martyrdo1_lookup sv, _session253_martyrdo1_lookup tv
 WHERE t.slug='martyrdom-polycarp-1-conformable-to-the-gospel'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='martyrdom-polycarp' AND sv.chapter_number=1 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=3 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Peter 1:11 -- *Searching what, or what manner of time the Spirit of Messiah (Christ) which was in them did signify, when it testified beforehand the sufferings of Messiah (Christ), and the glory that should follow.* The suffering-then-glory pattern Peter names is the very Gospel the martyrdom is said to be conformable to in 1:1.'
  FROM cross_reference_threads t, cross_references x, _session253_martyrdo1_lookup sv, _session253_martyrdo1_lookup tv
 WHERE t.slug='martyrdom-polycarp-1-conformable-to-the-gospel'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='martyrdom-polycarp' AND sv.chapter_number=1 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=1 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 20:22 -- *But Yahusha (Jesus) answered and said, Ye know not what ye ask. Are ye able to drink of the cup that I shall drink of, and to be baptized with the baptism that I am baptized with? They say unto him, We are able.* Polycarp''s martyrdom "after the pattern of the Gospel" (1:19) is the drinking of the cup the Master held out to His own.'
  FROM cross_reference_threads t, cross_references x, _session253_martyrdo1_lookup sv, _session253_martyrdo1_lookup tv
 WHERE t.slug='martyrdom-polycarp-1-conformable-to-the-gospel'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='martyrdom-polycarp' AND sv.chapter_number=1 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=20 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: martyrdom-polycarp-1-my-king-who-saved-me
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 2:10 -- *Fear none of those things which thou shalt suffer: behold, the devil shall cast some of you into prison, that ye may be tried; and ye shall have tribulation ten days: be thou faithful unto death, and I will give thee a crown of life.* The Messiah spoke this to the church in Smyrna -- Polycarp''s own city -- and Polycarp''s "how can I blaspheme my King who saved me?" (1:8) is that faithfulness unto death.'
  FROM cross_reference_threads t, cross_references x, _session253_martyrdo1_lookup sv, _session253_martyrdo1_lookup tv
 WHERE t.slug='martyrdom-polycarp-1-my-king-who-saved-me'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='martyrdom-polycarp' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=2 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 8:35 -- *Who shall separate us from the love of Messiah (Christ)? shall tribulation, or distress, or persecution, or famine, or nakedness, or peril, or sword?* Neither the proconsul''s threats nor the fire could separate Polycarp from the King he had served eighty-six years (1:8).'
  FROM cross_reference_threads t, cross_references x, _session253_martyrdo1_lookup sv, _session253_martyrdo1_lookup tv
 WHERE t.slug='martyrdom-polycarp-1-my-king-who-saved-me'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='martyrdom-polycarp' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 7:60 -- *And he kneeled down, and cried with a loud voice, Yahuah (Lord), lay not this sin to their charge. And when he had said this, he fell asleep.* Stephen the first martyr dies blessing his killers, the same constancy with which Polycarp faced his accusers (1:8).'
  FROM cross_reference_threads t, cross_references x, _session253_martyrdo1_lookup sv, _session253_martyrdo1_lookup tv
 WHERE t.slug='martyrdom-polycarp-1-my-king-who-saved-me'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='martyrdom-polycarp' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=60
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Luke 23:34 -- *Then said Yahusha (Jesus), Father, forgive them; for they know not what they do. And they parted his raiment, and cast lots.* The Master''s own forbearance toward His executioners is the pattern of the witness Polycarp keeps in refusing to blaspheme his King (1:8).'
  FROM cross_reference_threads t, cross_references x, _session253_martyrdo1_lookup sv, _session253_martyrdo1_lookup tv
 WHERE t.slug='martyrdom-polycarp-1-my-king-who-saved-me'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='martyrdom-polycarp' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=23 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: martyrdom-polycarp-1-the-cup-unto-resurrection
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 20:23 -- *And he saith unto them, Ye shall drink indeed of my cup, and be baptized with the baptism that I am baptized with: but to sit on my right hand, and on my left, is not mine to give, but it shall be given to them for whom it is prepared of my Father.* Polycarp''s prayer to receive "a portion... in the cup of [Thy] Messiah" (1:14) is the very cup the Master said His own would drink.'
  FROM cross_reference_threads t, cross_references x, _session253_martyrdo1_lookup sv, _session253_martyrdo1_lookup tv
 WHERE t.slug='martyrdom-polycarp-1-the-cup-unto-resurrection'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='martyrdom-polycarp' AND sv.chapter_number=1 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=20 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 12:2 -- *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* Polycarp''s hope of "resurrection of eternal life, both of soul and of body" (1:14) rests on Daniel''s promise of the awakening of the dead.'
  FROM cross_reference_threads t, cross_references x, _session253_martyrdo1_lookup sv, _session253_martyrdo1_lookup tv
 WHERE t.slug='martyrdom-polycarp-1-the-cup-unto-resurrection'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='martyrdom-polycarp' AND sv.chapter_number=1 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 8:17 -- *And if children, then heirs; heirs of Elohim (God), and joint-heirs with Messiah (Christ); if so be that we suffer with him, that we may be also glorified together.* Polycarp offered as "a burnt sacrifice acceptable to Elohim" (1:14) is the suffering-with that Paul says ends in being glorified together.'
  FROM cross_reference_threads t, cross_references x, _session253_martyrdo1_lookup sv, _session253_martyrdo1_lookup tv
 WHERE t.slug='martyrdom-polycarp-1-the-cup-unto-resurrection'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='martyrdom-polycarp' AND sv.chapter_number=1 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: martyrdom-polycarp-1-gold-refined-in-the-furnace
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Peter 1:7 -- *That the trial of your faith, being much more precious than of gold that perisheth, though it be tried with fire, might be found unto praise and honour and glory at the appearing of Yahusha HaMashiach (Jesus Christ).* The body in the flame "like gold and silver refined in a furnace" (1:15) is Peter''s trial-by-fire of faith more precious than gold.'
  FROM cross_reference_threads t, cross_references x, _session253_martyrdo1_lookup sv, _session253_martyrdo1_lookup tv
 WHERE t.slug='martyrdom-polycarp-1-gold-refined-in-the-furnace'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='martyrdom-polycarp' AND sv.chapter_number=1 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=1 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Zechariah 13:9 -- *And I will bring the third part through the fire, and will refine them as silver is refined, and will try them as gold is tried: they shall call on my name, and I will hear them: I will say, It is my people: and they shall say, Yahuah (LORD) is my Elohim (God).* The refining of the faithful through fire is the same picture the witnesses saw in Polycarp''s flame (1:15).'
  FROM cross_reference_threads t, cross_references x, _session253_martyrdo1_lookup sv, _session253_martyrdo1_lookup tv
 WHERE t.slug='martyrdom-polycarp-1-gold-refined-in-the-furnace'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='martyrdom-polycarp' AND sv.chapter_number=1 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=13 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Malachi 3:3 -- *And he shall sit as a refiner and purifier of silver: and he shall purify the sons of Levi, and purge them as gold and silver, that they may offer unto Yahuah (LORD) an offering in righteousness.* Polycarp refined "like gold and silver in a furnace" (1:15) is the offering in righteousness the Refiner purges out.'
  FROM cross_reference_threads t, cross_references x, _session253_martyrdo1_lookup sv, _session253_martyrdo1_lookup tv
 WHERE t.slug='martyrdom-polycarp-1-gold-refined-in-the-furnace'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='martyrdom-polycarp' AND sv.chapter_number=1 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: martyrdom-polycarp-1-precious-bones-crown-of-immortality
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalms 116:15 -- *Precious in the sight of Yahuah (LORD) is the death of his saints.* The bones "more valuable than precious stones and finer than refined gold" (1:18) are precious because the saint''s death is precious to Yahuah Himself.'
  FROM cross_reference_threads t, cross_references x, _session253_martyrdo1_lookup sv, _session253_martyrdo1_lookup tv
 WHERE t.slug='martyrdom-polycarp-1-precious-bones-crown-of-immortality'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='martyrdom-polycarp' AND sv.chapter_number=1 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=116 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 2:10 -- *Fear none of those things which thou shalt suffer: behold, the devil shall cast some of you into prison, that ye may be tried; and ye shall have tribulation ten days: be thou faithful unto death, and I will give thee a crown of life.* Polycarp "crowned with the crown of immortality" (1:17) receives the very crown of life promised to faithful Smyrna.'
  FROM cross_reference_threads t, cross_references x, _session253_martyrdo1_lookup sv, _session253_martyrdo1_lookup tv
 WHERE t.slug='martyrdom-polycarp-1-precious-bones-crown-of-immortality'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='martyrdom-polycarp' AND sv.chapter_number=1 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=2 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Peter 1:4 -- *To an inheritance incorruptible, and undefiled, and that fadeth not away, reserved in heaven for you.* The Elohim "who maketh election from His own servants" (1:20) keeps for His elect this incorruptible inheritance reserved in heaven.'
  FROM cross_reference_threads t, cross_references x, _session253_martyrdo1_lookup sv, _session253_martyrdo1_lookup tv
 WHERE t.slug='martyrdom-polycarp-1-precious-bones-crown-of-immortality'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='martyrdom-polycarp' AND sv.chapter_number=1 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=1 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

