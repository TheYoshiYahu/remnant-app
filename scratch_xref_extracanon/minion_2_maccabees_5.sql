-- ----- fragment: minion_2maccabees_05.sql (session253 2-maccabees 5) -----
-- Source anchor: apocrypha/2-maccabees ch5. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2mac5 (view _session253_2mac5_lookup). Sort band base 62100, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2mac5_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-maccabees-5-place-for-the-people
  ('apocrypha', '2-maccabees', 5, 19, 'canon', 'matthew', 12, 6, 'free', E'Matthew 12:6 — *But I say unto you, That in this place is one greater than the temple.* The Messiah, standing in the very temple Antiochus had once defiled, declares Himself greater than it — confirming that the place was always for the sake of the One it pointed to, not the reverse, as 2 Maccabees 5:19 insists.'),
  ('apocrypha', '2-maccabees', 5, 19, 'canon', 'acts', 7, 48, 'free', E'Acts 7:48 — *Howbeit the El Elyon (most High) dwelleth not in temples made with hands; as saith the prophet,* Stephen, martyred for the same covenant the Maccabees died for, voices the chronicler''s exact theology — Yahuah is not contained by the building He let Antiochus strip in 2 Maccabees 5:19.'),
  ('apocrypha', '2-maccabees', 5, 19, 'canon', 'acts', 7, 49, 'free', E'Acts 7:49 — *Heaven is my throne, and earth is my footstool: what house will ye build me? saith Yahuah (Lord): or what is the place of my rest?* Heaven itself is His throne, so the plundered sanctuary of 2 Maccabees 5:19 was never His dwelling but His people''s gift.'),
  ('apocrypha', '2-maccabees', 5, 19, 'canon', '1-kings', 8, 27, 'free', E'1 Kings 8:27 — *But will Elohim (God) indeed dwell on the earth? behold, the heaven and heaven of heavens cannot contain thee; how much less this house that I have builded?* Solomon confessed at the dedication what the chronicler reaffirms in 2 Maccabees 5:19 — the house could not contain Yahuah, so it was made for the people, not the people for it.'),
  -- thread: 2-maccabees-5-whom-the-lord-loveth-he-chasteneth
  ('apocrypha', '2-maccabees', 5, 17, 'canon', 'hebrews', 12, 6, 'free', E'Hebrews 12:6 — *For whom Yahuah (Lord) loveth he chasteneth, and scourgeth every son whom he receiveth.* The anger ''for a while for the sins'' in 2 Maccabees 5:17 is precisely the scourging of a beloved son, not the wrath of rejection — discipline that proves sonship, never law-as-curse.'),
  ('apocrypha', '2-maccabees', 5, 17, 'apocrypha', '2-maccabees', 6, 12, 'extras', E'2 Maccabees 6:12 — *Now I beseech those that read this book, that they be not discouraged for these calamities, but that they judge those punishments not to be for destruction, but for a chastening of our nation.* The chronicler''s own gloss on his narrative makes 2 Maccabees 5:17 explicit — these blows are a chastening of the nation, not its destruction.'),
  ('apocrypha', '2-maccabees', 5, 20, 'apocrypha', '2-maccabees', 7, 33, 'extras', E'2 Maccabees 7:33 — *And though the living Yahuah (God) be angry with us a little while for our chastening and correction, yet shall he be at one again with his servants.* The martyrs voice the same hope as 2 Maccabees 5:20 — the wrath is brief, and the reconciled Yahuah sets His people (and His place) up again.'),
  -- thread: 2-maccabees-5-abomination-and-the-slaughter
  ('apocrypha', '2-maccabees', 5, 13, 'canon', 'daniel', 11, 28, 'free', E'Daniel 11:28 — *Then shall he return into his land with great riches; and his heart shall be against the holy covenant; and he shall do exploits, and return to his own land.* Daniel foresaw this very rage against the covenant city that erupts in the slaughter of 2 Maccabees 5:13 — the king whose heart is set against the holy covenant.'),
  ('apocrypha', '2-maccabees', 5, 11, 'canon', 'daniel', 11, 31, 'free', E'Daniel 11:31 — *And arms shall stand on his part, and they shall pollute the sanctuary of strength, and shall take away the daily sacrifice, and they shall place the abomination that maketh desolate.* The desolating power of Daniel''s vision is the very king who ''took the city by force of arms'' in 2 Maccabees 5:11 — the abomination embodied in Antiochus.'),
  ('apocrypha', '2-maccabees', 5, 13, 'canon', 'matthew', 24, 15, 'free', E'Matthew 24:15 — *When ye therefore shall see the abomination of desolation, spoken of by Daniel the prophet, stand in the holy place, (whoso readeth, let him understand:)* The Messiah lifts the Maccabean horror of 2 Maccabees 5:13 into a sign of the last days — the same abomination that desolated the holy place will rise again at the end.'),
  ('apocrypha', '2-maccabees', 5, 14, 'apocrypha', '1-maccabees', 1, 24, 'extras', E'1 Maccabees 1:24 — *And when he had taken all away, he went into his own land, having made a great massacre, and spoken very proudly.* The companion chronicle records the same ''great massacre'' counted in the fourscore thousand of 2 Maccabees 5:14 — one witness confirming the other.'),
  -- thread: 2-maccabees-5-the-holy-vessels-plundered
  ('apocrypha', '2-maccabees', 5, 16, 'apocrypha', '1-maccabees', 1, 21, 'extras', E'1 Maccabees 1:21 — *And entered proudly into the sanctuary, and took away the golden altar, and the candlestick of light, and all the vessels thereof,* The companion account names the holy vessels Antiochus seized ''with polluted hands'' in 2 Maccabees 5:16 — the golden altar and candlestick stripped from the most holy place.'),
  ('apocrypha', '2-maccabees', 5, 15, 'canon', 'daniel', 11, 31, 'free', E'Daniel 11:31 — *And arms shall stand on his part, and they shall pollute the sanctuary of strength, and shall take away the daily sacrifice, and they shall place the abomination that maketh desolate.* Antiochus presuming into ''the most holy temple of all the world'' in 2 Maccabees 5:15 is the polluting of the sanctuary Daniel had already written down.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2mac5_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2mac5_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-5-place-for-the-people',
       E'The place for the people''s sake — not temples made with hands',
       E'When Antiochus stripped the sanctuary he never reckoned with the truth the chronicler sets at the heart of the chapter: *Nevertheless Yahuah (God) did not choose the people for the place’s sake, but the place for the people’s sake.* (2 Maccabees 5:19) The covenant people are the treasure; the house was given for their sake, not they for the building''s. The Messiah says the same standing in that same temple — *But I say unto you, That in this place is one greater than the temple.* (Matthew 12:6) Stephen, dying like the Maccabean martyrs, presses it further: *Howbeit the El Elyon (most High) dwelleth not in temples made with hands; as saith the prophet,* (Acts 7:48) — *Heaven is my throne, and earth is my footstool: what house will ye build me? saith Yahuah (Lord): or what is the place of my rest?* (Acts 7:49) And Solomon himself, the day he dedicated it, confessed it: *But will Elohim (God) indeed dwell on the earth? behold, the heaven and heaven of heavens cannot contain thee; how much less this house that I have builded?* (1 Kings 8:27) It ain''t new — the stones could be plundered, but the Most High was never housed in them.',
       sv.verse_id, ev.verse_id, 'extras', 62100
  FROM _session253_2mac5_lookup sv, _session253_2mac5_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=5 AND sv.verse_number=19
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=5 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-5-whom-the-lord-loveth-he-chasteneth',
       E'The wrath for a while — a chastening, not a casting off',
       E'The chronicler reads the catastrophe not as Yahuah''s defeat but as His fatherly discipline: *And so haughty was Antiochus in mind, that he considered not that Yahuah (God) was angry for a while for the sins of them that dwelt in the city, and therefore his eye was not upon the place.* (2 Maccabees 5:17) The sister chapter says it plainly — *Now I beseech those that read this book, that they be not discouraged for these calamities, but that they judge those punishments not to be for destruction, but for a chastening of our nation.* (2 Maccabees 6:12) The seven brothers under torment say the same — *And though the living Yahuah (God) be angry with us a little while for our chastening and correction, yet shall he be at one again with his servants.* (2 Maccabees 7:33) This is the Father''s rod, not the curse of the law: *For whom Yahuah (Lord) loveth he chasteneth, and scourgeth every son whom he receiveth.* (Hebrews 12:6) The wrath is *for a while*; the covenant stands, and the reconciled House is set up again with all glory.',
       sv.verse_id, ev.verse_id, 'extras', 62103
  FROM _session253_2mac5_lookup sv, _session253_2mac5_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=5 AND sv.verse_number=17
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=5 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-5-abomination-and-the-slaughter',
       E'Forty thousand slain — the kingdom of man against the holy covenant',
       E'Returning from Egypt in a fury, Antiochus turns the sword on the covenant city: *And commanded his men of war not to spare such as they met, and to slay such as went up upon the houses.* (2 Maccabees 5:12) *Thus there was killing of young and old, making away of men, women, and children, slaying of virgins and infants.* (2 Maccabees 5:13) The tyrant is the abomination foretold — *and his heart shall be against the holy covenant; and he shall do exploits, and return to his own land.* (Daniel 11:28) *And arms shall stand on his part, and they shall pollute the sanctuary of strength, and shall take away the daily sacrifice, and they shall place the abomination that maketh desolate.* (Daniel 11:31) The Messiah names that same desolating power as the sign of the end — *When ye therefore shall see the abomination of desolation, spoken of by Daniel the prophet, stand in the holy place, (whoso readeth, let him understand:)* (Matthew 24:15) And the sister account remembers the same massacre — *And when he had taken all away, he went into his own land, having made a great massacre, and spoken very proudly.* (1 Maccabees 1:24) Antiochus is the type of the antichrist kingdom-of-man, and the slaughtered remnant the seed kept through the fire.',
       sv.verse_id, ev.verse_id, 'extras', 62106
  FROM _session253_2mac5_lookup sv, _session253_2mac5_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=5 AND sv.verse_number=11
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=5 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-5-the-holy-vessels-plundered',
       E'The holy vessels carried off with polluted hands',
       E'Not content with blood, Antiochus profanes the sanctuary itself: *Yet was he not content with this, but presumed to go into the most holy temple of all the world; Menelaus, that traitor to the laws, and to his own country, being his guide:* (2 Maccabees 5:15) *And taking the holy vessels with polluted hands, and with profane hands pulling down the things that were dedicated by other kings to the augmentation and glory and honour of the place, he gave them away.* (2 Maccabees 5:16) The sister scroll lists the very vessels he seized — *And entered proudly into the sanctuary, and took away the golden altar, and the candlestick of light, and all the vessels thereof,* (1 Maccabees 1:21) This polluting of the sanctuary is exactly what Daniel foretold — *And arms shall stand on his part, and they shall pollute the sanctuary of strength, and shall take away the daily sacrifice, and they shall place the abomination that maketh desolate.* (Daniel 11:31) The kingdom of man lays hands on the holy things; yet what is dedicated to Yahuah is never finally lost — the place reconciled is set up again with all glory.',
       sv.verse_id, ev.verse_id, 'extras', 62109
  FROM _session253_2mac5_lookup sv, _session253_2mac5_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=5 AND sv.verse_number=15
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=5 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-maccabees-5-place-for-the-people
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 12:6 — *But I say unto you, That in this place is one greater than the temple.* The Messiah, standing in the very temple Antiochus had once defiled, declares Himself greater than it — confirming that the place was always for the sake of the One it pointed to, not the reverse, as 2 Maccabees 5:19 insists.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac5_lookup sv, _session253_2mac5_lookup tv
 WHERE t.slug='2-maccabees-5-place-for-the-people'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=5 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=12 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Acts 7:48 — *Howbeit the El Elyon (most High) dwelleth not in temples made with hands; as saith the prophet,* Stephen, martyred for the same covenant the Maccabees died for, voices the chronicler''s exact theology — Yahuah is not contained by the building He let Antiochus strip in 2 Maccabees 5:19.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac5_lookup sv, _session253_2mac5_lookup tv
 WHERE t.slug='2-maccabees-5-place-for-the-people'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=5 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=48
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 7:49 — *Heaven is my throne, and earth is my footstool: what house will ye build me? saith Yahuah (Lord): or what is the place of my rest?* Heaven itself is His throne, so the plundered sanctuary of 2 Maccabees 5:19 was never His dwelling but His people''s gift.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac5_lookup sv, _session253_2mac5_lookup tv
 WHERE t.slug='2-maccabees-5-place-for-the-people'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=5 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=49
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Kings 8:27 — *But will Elohim (God) indeed dwell on the earth? behold, the heaven and heaven of heavens cannot contain thee; how much less this house that I have builded?* Solomon confessed at the dedication what the chronicler reaffirms in 2 Maccabees 5:19 — the house could not contain Yahuah, so it was made for the people, not the people for it.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac5_lookup sv, _session253_2mac5_lookup tv
 WHERE t.slug='2-maccabees-5-place-for-the-people'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=5 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=8 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-5-whom-the-lord-loveth-he-chasteneth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 12:6 — *For whom Yahuah (Lord) loveth he chasteneth, and scourgeth every son whom he receiveth.* The anger ''for a while for the sins'' in 2 Maccabees 5:17 is precisely the scourging of a beloved son, not the wrath of rejection — discipline that proves sonship, never law-as-curse.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac5_lookup sv, _session253_2mac5_lookup tv
 WHERE t.slug='2-maccabees-5-whom-the-lord-loveth-he-chasteneth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=5 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Maccabees 6:12 — *Now I beseech those that read this book, that they be not discouraged for these calamities, but that they judge those punishments not to be for destruction, but for a chastening of our nation.* The chronicler''s own gloss on his narrative makes 2 Maccabees 5:17 explicit — these blows are a chastening of the nation, not its destruction.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac5_lookup sv, _session253_2mac5_lookup tv
 WHERE t.slug='2-maccabees-5-whom-the-lord-loveth-he-chasteneth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=5 AND sv.verse_number=17
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=6 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Maccabees 7:33 — *And though the living Yahuah (God) be angry with us a little while for our chastening and correction, yet shall he be at one again with his servants.* The martyrs voice the same hope as 2 Maccabees 5:20 — the wrath is brief, and the reconciled Yahuah sets His people (and His place) up again.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac5_lookup sv, _session253_2mac5_lookup tv
 WHERE t.slug='2-maccabees-5-whom-the-lord-loveth-he-chasteneth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=5 AND sv.verse_number=20
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=7 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-5-abomination-and-the-slaughter
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 11:28 — *Then shall he return into his land with great riches; and his heart shall be against the holy covenant; and he shall do exploits, and return to his own land.* Daniel foresaw this very rage against the covenant city that erupts in the slaughter of 2 Maccabees 5:13 — the king whose heart is set against the holy covenant.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac5_lookup sv, _session253_2mac5_lookup tv
 WHERE t.slug='2-maccabees-5-abomination-and-the-slaughter'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=5 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=11 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 11:31 — *And arms shall stand on his part, and they shall pollute the sanctuary of strength, and shall take away the daily sacrifice, and they shall place the abomination that maketh desolate.* The desolating power of Daniel''s vision is the very king who ''took the city by force of arms'' in 2 Maccabees 5:11 — the abomination embodied in Antiochus.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac5_lookup sv, _session253_2mac5_lookup tv
 WHERE t.slug='2-maccabees-5-abomination-and-the-slaughter'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=5 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=11 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 24:15 — *When ye therefore shall see the abomination of desolation, spoken of by Daniel the prophet, stand in the holy place, (whoso readeth, let him understand:)* The Messiah lifts the Maccabean horror of 2 Maccabees 5:13 into a sign of the last days — the same abomination that desolated the holy place will rise again at the end.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac5_lookup sv, _session253_2mac5_lookup tv
 WHERE t.slug='2-maccabees-5-abomination-and-the-slaughter'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=5 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Maccabees 1:24 — *And when he had taken all away, he went into his own land, having made a great massacre, and spoken very proudly.* The companion chronicle records the same ''great massacre'' counted in the fourscore thousand of 2 Maccabees 5:14 — one witness confirming the other.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac5_lookup sv, _session253_2mac5_lookup tv
 WHERE t.slug='2-maccabees-5-abomination-and-the-slaughter'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=5 AND sv.verse_number=14
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=1 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-5-the-holy-vessels-plundered
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Maccabees 1:21 — *And entered proudly into the sanctuary, and took away the golden altar, and the candlestick of light, and all the vessels thereof,* The companion account names the holy vessels Antiochus seized ''with polluted hands'' in 2 Maccabees 5:16 — the golden altar and candlestick stripped from the most holy place.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac5_lookup sv, _session253_2mac5_lookup tv
 WHERE t.slug='2-maccabees-5-the-holy-vessels-plundered'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=5 AND sv.verse_number=16
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=1 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 11:31 — *And arms shall stand on his part, and they shall pollute the sanctuary of strength, and shall take away the daily sacrifice, and they shall place the abomination that maketh desolate.* Antiochus presuming into ''the most holy temple of all the world'' in 2 Maccabees 5:15 is the polluting of the sanctuary Daniel had already written down.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac5_lookup sv, _session253_2mac5_lookup tv
 WHERE t.slug='2-maccabees-5-the-holy-vessels-plundered'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=5 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=11 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

