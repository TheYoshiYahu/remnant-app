-- ----- fragment: minion_hermas_03.sql (session253 hermas 3) -----
-- Source anchor: lightfoot-apostolic-fathers/hermas ch3. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: herm3 (view _session253_herm3_lookup). Sort band base 71550, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_herm3_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: hermas-3-tower-living-stones
  ('lightfoot-apostolic-fathers', 'hermas', 3, 2, 'canon', '1-peter', 2, 5, 'free', E'1 Peter 2:5 — *Ye also, as lively stones, are built up a spiritual house, an holy priesthood, to offer up spiritual sacrifices, acceptable to Elohim (God) by Yahusha HaMashiach (Jesus Christ).* Hermas''s glistening square stones builded into the tower are Kepha''s living stones built up into one spiritual house (Hermas 3:2).'),
  ('lightfoot-apostolic-fathers', 'hermas', 3, 3, 'canon', 'ephesians', 2, 20, 'free', E'Ephesians 2:20 — *And are built upon the foundation of the apostles and prophets, Yahusha HaMashiach (Jesus Christ) himself being the chief corner stone;* the Church that the Lady says she herself is, is the very building Sha''ul frames upon the apostles with Messiah the corner (Hermas 3:3).'),
  ('lightfoot-apostolic-fathers', 'hermas', 3, 3, 'canon', 'ephesians', 2, 22, 'free', E'Ephesians 2:22 — *In whom ye also are builded together for an habitation of Elohim (God) through the Spirit.* The tower strengthened by the unseen power of the Master is this same habitation builded together for Elohim (Hermas 3:3).'),
  ('lightfoot-apostolic-fathers', 'hermas', 3, 3, 'canon', 'revelation', 21, 2, 'free', E'Revelation 21:2 — *And I John saw the holy city, new Jerusalem, coming down from Elohim (God) out of heaven, prepared as a bride adorned for her husband.* The tower-Church seen by Hermas is the same bride-city Yochanan beheld, the finished dwelling of the saints (Hermas 3:3).'),
  -- thread: hermas-3-stones-tried-and-fitted
  ('lightfoot-apostolic-fathers', 'hermas', 3, 5, 'canon', '1-corinthians', 3, 11, 'free', E'1 Corinthians 3:11 — *For other foundation can no man lay than that is laid, which is Yahusha HaMashiach (Jesus Christ).* The whole tower fits as one stone because it rests on the single foundation Sha''ul names (Hermas 3:5).'),
  ('lightfoot-apostolic-fathers', 'hermas', 3, 5, 'canon', '1-corinthians', 3, 13, 'free', E'1 Corinthians 3:13 — *Every man''s work shall be made manifest: for the day shall declare it, because it shall be revealed by fire; and the fire shall try every man''s work of what sort it is.* The stones broken and cast off, versus those fitted in, are works tried by the same proving fire (Hermas 3:5).'),
  ('lightfoot-apostolic-fathers', 'hermas', 3, 5, 'canon', 'john', 14, 15, 'free', E'John 14:15 — *If ye love me, keep my commandments.* The stones approved because they rightly performed His commandments are the lovers of Messiah who keep what He commands — the Torah honoured, never abolished (Hermas 3:5).'),
  ('lightfoot-apostolic-fathers', 'hermas', 3, 6, 'canon', 'malachi', 3, 3, 'free', E'Malachi 3:3 — *And he shall sit as a refiner and purifier of silver: and he shall purify the sons of Levi, and purge them as gold and silver, that they may offer unto Yahuah (LORD) an offering in righteousness.* The cutting away of the round stones and purging of the unfit is Malachi''s refiner''s fire making an offering in righteousness (Hermas 3:6).'),
  -- thread: hermas-3-second-repentance
  ('lightfoot-apostolic-fathers', 'hermas', 3, 5, 'canon', 'ezekiel', 33, 11, 'free', E'Ezekiel 33:11 — *Say unto them, As I live, saith Adonai Yahuah (the Lord GOD), I have no pleasure in the death of the wicked; but that the wicked turn from his way and live: turn ye, turn ye from your evil ways; for why will ye die, O house of Yashar''el (Israel)?* The fallen stones kept near the tower for repentance are Yechezqel''s wicked called to turn and live (Hermas 3:5).'),
  ('lightfoot-apostolic-fathers', 'hermas', 3, 5, 'canon', 'ezekiel', 18, 30, 'free', E'Ezekiel 18:30 — *Therefore I will judge you, O house of Yashar''el (Israel), every one according to his ways, saith Adonai Yahuah (the Lord GOD). Repent, and turn yourselves from all your transgressions; so iniquity shall not be your ruin.* Hermas''s offer of repentance before the building is finished echoes the prophet''s summons to turn before iniquity becomes ruin (Hermas 3:5).'),
  ('lightfoot-apostolic-fathers', 'hermas', 3, 7, 'canon', '2-peter', 3, 9, 'free', E'2 Peter 3:9 — *Yahuah (Lord) is not slack concerning his promise, as some men count slackness; but is longsuffering to us-ward, not willing that any should perish, but that all should come to repentance.* The space yet given the rejected stones is the Master''s longsuffering, unwilling that any perish (Hermas 3:7).'),
  ('lightfoot-apostolic-fathers', 'hermas', 3, 7, 'canon', 'luke', 15, 7, 'free', E'Luke 15:7 — *I say unto you, that likewise joy shall be in heaven over one sinner that repenteth, more than over ninety and nine just persons, which need no repentance.* The Lady''s word that those who weep, if they repent, shall be glad, is heaven''s own joy over the one sinner returning (Hermas 3:7).'),
  -- thread: hermas-3-seven-virtues-the-called
  ('lightfoot-apostolic-fathers', 'hermas', 3, 8, 'canon', '2-peter', 1, 5, 'free', E'2 Peter 1:5 — *And beside this, giving all diligence, add to your faith virtue; and to virtue knowledge;* Hermas''s chain beginning with Faith and rising through her daughters is Kepha''s ladder built upon faith (Hermas 3:8).'),
  ('lightfoot-apostolic-fathers', 'hermas', 3, 8, 'canon', '2-peter', 1, 6, 'free', E'2 Peter 1:6 — *And to knowledge temperance; and to temperance patience; and to patience godliness;* the daughters Continence and Knowledge in Hermas answer rung-for-rung to Kepha''s temperance, knowledge, and godliness (Hermas 3:8).'),
  ('lightfoot-apostolic-fathers', 'hermas', 3, 8, 'canon', '2-peter', 1, 7, 'free', E'2 Peter 1:7 — *And to godliness brotherly kindness; and to brotherly kindness charity.* Hermas crowns the seven with Love just as Kepha crowns the ladder with charity, the last and greatest virtue (Hermas 3:8).'),
  ('lightfoot-apostolic-fathers', 'hermas', 3, 8, 'canon', '1-john', 5, 3, 'free', E'1 John 5:3 — *For this is the love of Elohim (God), that we keep his commandments: and his commandments are not grievous.* The Love that crowns Hermas''s virtues is defined by Yochanan as the keeping of the commandments — the mandates that stand, not a law cast off (Hermas 3:8).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_herm3_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_herm3_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-3-tower-living-stones',
       E'The tower upon the waters — the Church built of living stones',
       E'Hermas sees the vision the Lady promised: *a great tower being builded upon the waters, of glistening square stones* — and she tells him plainly, *The tower, which thou seest building, is myself, the Church.* It ain''t new. Kepha had already named the same house: *Ye also, as lively stones, are built up a spiritual house, an holy priesthood* (1 Peter 2:5). Sha''ul laid the same foundation: *And are built upon the foundation of the apostles and prophets, Yahusha HaMashiach (Jesus Christ) himself being the chief corner stone* (Ephesians 2:20), the building in whom *ye also are builded together for an habitation of Elohim (God) through the Spirit* (Ephesians 2:22). And Hermas''s holy city seen rising is the same Yochanan saw: *And I John saw the holy city, new Jerusalem, coming down from Elohim (God) out of heaven, prepared as a bride adorned for her husband* (Revelation 21:2). The tower is founded upon the waters *because your life is saved and shall be saved by water* — the elect fitted into the one house, not a church that replaces Yashar''el but the gathering of the called.',
       sv.verse_id, ev.verse_id, 'extras', 71550
  FROM _session253_herm3_lookup sv, _session253_herm3_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=3 AND sv.verse_number=2
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=3 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-3-stones-tried-and-fitted',
       E'The stones tried, fitted, and refined — every man''s work proved',
       E'The six young men *took them and builded*; the stones from the deep *fitted in their joining with the other stones... as if it were built of one stone*, while others were broken and *thrown to a distance from the tower*. The Lady names them: the squared white stones *are the apostles and bishops and teachers and deacons, who walked after the holiness of Elohim*; the unhewn yet approved *walked in the uprightness of Yahuah (Lord), and rightly performed His commandments*. This is no law-as-curse — the commandments STAND and the doers are built in. Sha''ul lays the same one foundation and warns the builders: *For other foundation can no man lay than that is laid, which is Yahusha HaMashiach (Jesus Christ)* (1 Corinthians 3:11), and *the fire shall try every man''s work of what sort it is* (1 Corinthians 3:13). The refining is Malachi''s: *And he shall sit as a refiner and purifier of silver... that they may offer unto Yahuah (LORD) an offering in righteousness* (Malachi 3:3). The tried stones fit because they kept covenant; it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 71553
  FROM _session253_herm3_lookup sv, _session253_herm3_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=3 AND sv.verse_number=5
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=3 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-3-second-repentance',
       E'The second repentance — a place yet for the fallen who return',
       E'The heart of the Shepherd: the rejected stones are *they that have sinned, and desire to repent... because they will be useful for the building, if they repent.* The Lady warns the time is short — *if the building shall be finished, they have no more any place* — yet the door still stands open while the tower is a-building. This is the prophets'' own plea. Yechezqel: *I have no pleasure in the death of the wicked; but that the wicked turn from his way and live: turn ye, turn ye from your evil ways* (Ezekiel 33:11), and *Repent, and turn yourselves from all your transgressions; so iniquity shall not be your ruin* (Ezekiel 18:30). Kepha tells why the door yet stands: *not willing that any should perish, but that all should come to repentance* (2 Peter 3:9). And heaven''s gladness over the one who turns: *likewise joy shall be in heaven over one sinner that repenteth* (Luke 15:7). The second repentance offered the fallen is the old covenant mercy — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 71556
  FROM _session253_herm3_lookup sv, _session253_herm3_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=3 AND sv.verse_number=5
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=3 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-3-seven-virtues-the-called',
       E'The seven women — Faith and her daughters, the virtue-ladder of the called',
       E'Seven women bear up the tower: *The first... is called Faith; through her are saved the elect of Elohim* — election before confession — and from her are born her daughters in order: *From Faith is born Continence, from Continence Simplicity, from Simplicity Guilelessness, from Guilelessness Reverence, from Reverence Knowledge, from Knowledge Love.* Kepha gives the same ladder rung for rung: *add to your faith virtue; and to virtue knowledge; And to knowledge temperance; and to temperance patience; and to patience godliness; And to godliness brotherly kindness; and to brotherly kindness charity* (2 Peter 1:5-7) — faith first, love crowning. And the love that crowns is the keeping of the commandments: *For this is the love of Elohim (God), that we keep his commandments: and his commandments are not grievous* (1 John 5:3). The virtues are no new gospel; they are the old path of the faithful, the mandates that build the saint into the tower.',
       sv.verse_id, ev.verse_id, 'extras', 71559
  FROM _session253_herm3_lookup sv, _session253_herm3_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=3 AND sv.verse_number=8
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=3 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: hermas-3-tower-living-stones
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Peter 2:5 — *Ye also, as lively stones, are built up a spiritual house, an holy priesthood, to offer up spiritual sacrifices, acceptable to Elohim (God) by Yahusha HaMashiach (Jesus Christ).* Hermas''s glistening square stones builded into the tower are Kepha''s living stones built up into one spiritual house (Hermas 3:2).'
  FROM cross_reference_threads t, cross_references x, _session253_herm3_lookup sv, _session253_herm3_lookup tv
 WHERE t.slug='hermas-3-tower-living-stones'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=3 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=2 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ephesians 2:20 — *And are built upon the foundation of the apostles and prophets, Yahusha HaMashiach (Jesus Christ) himself being the chief corner stone;* the Church that the Lady says she herself is, is the very building Sha''ul frames upon the apostles with Messiah the corner (Hermas 3:3).'
  FROM cross_reference_threads t, cross_references x, _session253_herm3_lookup sv, _session253_herm3_lookup tv
 WHERE t.slug='hermas-3-tower-living-stones'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=3 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=2 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ephesians 2:22 — *In whom ye also are builded together for an habitation of Elohim (God) through the Spirit.* The tower strengthened by the unseen power of the Master is this same habitation builded together for Elohim (Hermas 3:3).'
  FROM cross_reference_threads t, cross_references x, _session253_herm3_lookup sv, _session253_herm3_lookup tv
 WHERE t.slug='hermas-3-tower-living-stones'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=3 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=2 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 21:2 — *And I John saw the holy city, new Jerusalem, coming down from Elohim (God) out of heaven, prepared as a bride adorned for her husband.* The tower-Church seen by Hermas is the same bride-city Yochanan beheld, the finished dwelling of the saints (Hermas 3:3).'
  FROM cross_reference_threads t, cross_references x, _session253_herm3_lookup sv, _session253_herm3_lookup tv
 WHERE t.slug='hermas-3-tower-living-stones'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=3 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-3-stones-tried-and-fitted
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Corinthians 3:11 — *For other foundation can no man lay than that is laid, which is Yahusha HaMashiach (Jesus Christ).* The whole tower fits as one stone because it rests on the single foundation Sha''ul names (Hermas 3:5).'
  FROM cross_reference_threads t, cross_references x, _session253_herm3_lookup sv, _session253_herm3_lookup tv
 WHERE t.slug='hermas-3-stones-tried-and-fitted'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=3 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=3 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Corinthians 3:13 — *Every man''s work shall be made manifest: for the day shall declare it, because it shall be revealed by fire; and the fire shall try every man''s work of what sort it is.* The stones broken and cast off, versus those fitted in, are works tried by the same proving fire (Hermas 3:5).'
  FROM cross_reference_threads t, cross_references x, _session253_herm3_lookup sv, _session253_herm3_lookup tv
 WHERE t.slug='hermas-3-stones-tried-and-fitted'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=3 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=3 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 14:15 — *If ye love me, keep my commandments.* The stones approved because they rightly performed His commandments are the lovers of Messiah who keep what He commands — the Torah honoured, never abolished (Hermas 3:5).'
  FROM cross_reference_threads t, cross_references x, _session253_herm3_lookup sv, _session253_herm3_lookup tv
 WHERE t.slug='hermas-3-stones-tried-and-fitted'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=3 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=14 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Malachi 3:3 — *And he shall sit as a refiner and purifier of silver: and he shall purify the sons of Levi, and purge them as gold and silver, that they may offer unto Yahuah (LORD) an offering in righteousness.* The cutting away of the round stones and purging of the unfit is Malachi''s refiner''s fire making an offering in righteousness (Hermas 3:6).'
  FROM cross_reference_threads t, cross_references x, _session253_herm3_lookup sv, _session253_herm3_lookup tv
 WHERE t.slug='hermas-3-stones-tried-and-fitted'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=3 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-3-second-repentance
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 33:11 — *Say unto them, As I live, saith Adonai Yahuah (the Lord GOD), I have no pleasure in the death of the wicked; but that the wicked turn from his way and live: turn ye, turn ye from your evil ways; for why will ye die, O house of Yashar''el (Israel)?* The fallen stones kept near the tower for repentance are Yechezqel''s wicked called to turn and live (Hermas 3:5).'
  FROM cross_reference_threads t, cross_references x, _session253_herm3_lookup sv, _session253_herm3_lookup tv
 WHERE t.slug='hermas-3-second-repentance'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=3 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=33 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 18:30 — *Therefore I will judge you, O house of Yashar''el (Israel), every one according to his ways, saith Adonai Yahuah (the Lord GOD). Repent, and turn yourselves from all your transgressions; so iniquity shall not be your ruin.* Hermas''s offer of repentance before the building is finished echoes the prophet''s summons to turn before iniquity becomes ruin (Hermas 3:5).'
  FROM cross_reference_threads t, cross_references x, _session253_herm3_lookup sv, _session253_herm3_lookup tv
 WHERE t.slug='hermas-3-second-repentance'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=3 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=18 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Peter 3:9 — *Yahuah (Lord) is not slack concerning his promise, as some men count slackness; but is longsuffering to us-ward, not willing that any should perish, but that all should come to repentance.* The space yet given the rejected stones is the Master''s longsuffering, unwilling that any perish (Hermas 3:7).'
  FROM cross_reference_threads t, cross_references x, _session253_herm3_lookup sv, _session253_herm3_lookup tv
 WHERE t.slug='hermas-3-second-repentance'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=3 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=3 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Luke 15:7 — *I say unto you, that likewise joy shall be in heaven over one sinner that repenteth, more than over ninety and nine just persons, which need no repentance.* The Lady''s word that those who weep, if they repent, shall be glad, is heaven''s own joy over the one sinner returning (Hermas 3:7).'
  FROM cross_reference_threads t, cross_references x, _session253_herm3_lookup sv, _session253_herm3_lookup tv
 WHERE t.slug='hermas-3-second-repentance'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=3 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=15 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-3-seven-virtues-the-called
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Peter 1:5 — *And beside this, giving all diligence, add to your faith virtue; and to virtue knowledge;* Hermas''s chain beginning with Faith and rising through her daughters is Kepha''s ladder built upon faith (Hermas 3:8).'
  FROM cross_reference_threads t, cross_references x, _session253_herm3_lookup sv, _session253_herm3_lookup tv
 WHERE t.slug='hermas-3-seven-virtues-the-called'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=3 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=1 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Peter 1:6 — *And to knowledge temperance; and to temperance patience; and to patience godliness;* the daughters Continence and Knowledge in Hermas answer rung-for-rung to Kepha''s temperance, knowledge, and godliness (Hermas 3:8).'
  FROM cross_reference_threads t, cross_references x, _session253_herm3_lookup sv, _session253_herm3_lookup tv
 WHERE t.slug='hermas-3-seven-virtues-the-called'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=3 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Peter 1:7 — *And to godliness brotherly kindness; and to brotherly kindness charity.* Hermas crowns the seven with Love just as Kepha crowns the ladder with charity, the last and greatest virtue (Hermas 3:8).'
  FROM cross_reference_threads t, cross_references x, _session253_herm3_lookup sv, _session253_herm3_lookup tv
 WHERE t.slug='hermas-3-seven-virtues-the-called'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=3 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=1 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 John 5:3 — *For this is the love of Elohim (God), that we keep his commandments: and his commandments are not grievous.* The Love that crowns Hermas''s virtues is defined by Yochanan as the keeping of the commandments — the mandates that stand, not a law cast off (Hermas 3:8).'
  FROM cross_reference_threads t, cross_references x, _session253_herm3_lookup sv, _session253_herm3_lookup tv
 WHERE t.slug='hermas-3-seven-virtues-the-called'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=3 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=5 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

