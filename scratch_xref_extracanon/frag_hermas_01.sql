-- ----- fragment: minion_hermas_01.sql (session253 hermas 1) -----
-- Source anchor: lightfoot-apostolic-fathers/hermas ch1. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: herm1 (view _session253_herm1_lookup). Sort band base 71500, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_herm1_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: hermas-1-second-repentance
  ('lightfoot-apostolic-fathers', 'hermas', 1, 3, 'canon', 'ezekiel', 18, 31, 'free', E'Ezekiel 18:31 — *Cast away from you all your transgressions, whereby ye have transgressed; and make you a new heart and a new spirit: for why will ye die, O house of Yashar''el (Israel)?* The very plea Hermas hears — repent with all the heart and be written among the saints — was Yahuah''s plea to His house long before.'),
  ('lightfoot-apostolic-fathers', 'hermas', 1, 3, 'canon', 'ezekiel', 18, 32, 'free', E'Ezekiel 18:32 — *For I have no pleasure in the death of him that dieth, saith Adonai Yahuah (the Lord GOD): wherefore turn yourselves, and live ye.* The lady''s mercy toward the corrupted family echoes the Father who delights not in death but in the turning.'),
  ('lightfoot-apostolic-fathers', 'hermas', 1, 3, 'canon', 'luke', 15, 10, 'free', E'Luke 15:10 — *Likewise, I say unto you, there is joy in the presence of the angels of Elohim (God) over one sinner that repenteth.* Hermas is told his children, if they repent, are written with the saints — the same heaven-joy the Messiah set over one returning sinner.'),
  ('lightfoot-apostolic-fathers', 'hermas', 1, 3, 'canon', '2-peter', 3, 9, 'free', E'2 Peter 3:9 — *Yahuah (Lord) is not slack concerning his promise, as some men count slackness; but is longsuffering to us-ward, not willing that any should perish, but that all should come to repentance.* The space given Hermas to reprove and convert his household is Yahuah''s longsuffering, willing that all come to repentance.'),
  ('lightfoot-apostolic-fathers', 'hermas', 1, 3, 'canon', 'revelation', 20, 12, 'free', E'Revelation 20:12 — *And I saw the dead, small and great, stand before Elohim (God); and the books were opened: and another book was opened, which is the book of life: and the dead were judged out of those things which were written in the books, according to their works.* The books of life in which the repentant are written are opened at the great white throne.'),
  -- thread: hermas-1-church-formed-by-wisdom
  ('lightfoot-apostolic-fathers', 'hermas', 1, 3, 'canon', '1-peter', 2, 5, 'free', E'1 Peter 2:5 — *Ye also, as lively stones, are built up a spiritual house, an holy priesthood, to offer up spiritual sacrifices, acceptable to Elohim (God) by Yahusha HaMashiach (Jesus Christ).* The holy Church that Elohim formed by His own wisdom is the spiritual house of living stones Kepha describes.'),
  ('lightfoot-apostolic-fathers', 'hermas', 1, 3, 'canon', 'ephesians', 2, 20, 'free', E'Ephesians 2:20 — *And are built upon the foundation of the apostles and prophets, Yahusha HaMashiach (Jesus Christ) himself being the chief corner stone.* The Church formed in Hermas''s vision stands on the same prophet-and-apostle foundation, the Messiah Himself the corner stone.'),
  ('lightfoot-apostolic-fathers', 'hermas', 1, 3, 'canon', 'ephesians', 2, 22, 'free', E'Ephesians 2:22 — *In whom ye also are builded together for an habitation of Elohim (God) through the Spirit.* What Hermas calls the holy Church that Elohim blessed, Sha''ul calls the habitation of Elohim built together through the Spirit.'),
  ('lightfoot-apostolic-fathers', 'hermas', 1, 3, 'canon', 'revelation', 21, 2, 'free', E'Revelation 21:2 — *And I John saw the holy city, new Jerusalem, coming down from Elohim (God) out of heaven, prepared as a bride adorned for her husband.* The blessed Church of the vision is consummated as the New Jerusalem, the bride adorned — gated by the twelve tribes, founded on the apostles, the gathering of Yashar''el and not its replacement.'),
  -- thread: hermas-1-keep-the-ordinances-promise
  ('lightfoot-apostolic-fathers', 'hermas', 1, 3, 'canon', 'isaiah', 66, 22, 'free', E'Isaiah 66:22 — *For as the new heavens and the new earth, which I will make, shall remain before me, saith Yahuah (LORD), so shall your seed and your name remain.* The promise made level for the elect in Hermas is the enduring seed and name Yahuah swears to keep in the new heavens and new earth.'),
  ('lightfoot-apostolic-fathers', 'hermas', 1, 3, 'canon', 'isaiah', 66, 23, 'free', E'Isaiah 66:23 — *And it shall come to pass, that from one new moon to another, and from one sabbath to another, shall all flesh come to worship before me, saith Yahuah (LORD).* The ordinances the elect must keep are no abolished thing: the Sabbath and new moon endure as all flesh comes to worship.'),
  ('lightfoot-apostolic-fathers', 'hermas', 1, 3, 'canon', 'malachi', 3, 3, 'free', E'Malachi 3:3 — *And he shall sit as a refiner and purifier of silver: and he shall purify the sons of Levi, and purge them as gold and silver, that they may offer unto Yahuah (LORD) an offering in righteousness.* The elect kept for the promise are the silver refined and purged, fitted to offer in righteousness.'),
  ('lightfoot-apostolic-fathers', 'hermas', 1, 3, 'canon', '1-corinthians', 3, 13, 'free', E'1 Corinthians 3:13 — *Every man''s work shall be made manifest: for the day shall declare it, because it shall be revealed by fire; and the fire shall try every man''s work of what sort it is.* The stones built into Elohim''s holy house are tried by the fire of the day, even as Hermas''s family must be strengthened in faith.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_herm1_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_herm1_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-1-second-repentance',
       E'Repent with all the heart — written in the books of life',
       E'The aged lady consoles the grieving Hermas: *for I know that if they shall repent with all their heart, they shall be written in the books of life with the saints* — the second repentance offered to the fallen household, that none should perish. It ain''t new. The Tanakh already pleads it: *Cast away from you all your transgressions, whereby ye have transgressed; and make you a new heart and a new spirit: for why will ye die, O house of Yashar''el (Israel)?* (Ezekiel 18:31), and *For I have no pleasure in the death of him that dieth, saith Adonai Yahuah (the Lord GOD): wherefore turn yourselves, and live ye* (Ezekiel 18:32). The Messiah unfolds the same heart of the Father: *Likewise, I say unto you, there is joy in the presence of the angels of Elohim (God) over one sinner that repenteth* (Luke 15:10). And Kepha (Peter) names the longsuffering behind the delay: *Yahuah (Lord) is not slack concerning his promise, as some men count slackness; but is longsuffering to us-ward, not willing that any should perish, but that all should come to repentance* (2 Peter 3:9). The names written in the books of life stand at the judgment: *and another book was opened, which is the book of life* (Revelation 20:12).',
       sv.verse_id, ev.verse_id, 'extras', 71500
  FROM _session253_herm1_lookup sv, _session253_herm1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=1 AND sv.verse_number=3
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=1 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-1-church-formed-by-wisdom',
       E'By His own wisdom He formed His holy Church',
       E'Hermas hears the glories of Elohim read aloud: *the Elohim (God) of Hosts, Who by His invisible and mighty power and by His great wisdom created the world... and by His own wisdom and providence formed His holy Church, which also He blessed.* It ain''t new — the same Wisdom by which the heavens were fixed forms the assembly. The Church appears not as a new thing but as the living temple Scripture had already described: *Ye also, as lively stones, are built up a spiritual house, an holy priesthood, to offer up spiritual sacrifices, acceptable to Elohim (God) by Yahusha HaMashiach (Jesus Christ)* (1 Peter 2:5); *And are built upon the foundation of the apostles and prophets, Yahusha HaMashiach (Jesus Christ) himself being the chief corner stone* (Ephesians 2:20); *In whom ye also are builded together for an habitation of Elohim (God) through the Spirit* (Ephesians 2:22). And the building rises to the City that comes down adorned: *And I John saw the holy city, new Jerusalem, coming down from Elohim (God) out of heaven, prepared as a bride adorned for her husband* (Revelation 21:2) — her twelve gates the twelve tribes of Yashar''el, her twelve foundations the apostles, the two houses gathered as one and not a new people replacing the old.',
       sv.verse_id, ev.verse_id, 'extras', 71503
  FROM _session253_herm1_lookup sv, _session253_herm1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=1 AND sv.verse_number=3
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=1 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-1-keep-the-ordinances-promise',
       E'If they keep the ordinances they received — the promise made level',
       E'The reading closes with the condition of the promise: Elohim *removeth the heavens and the mountains and the hills and the seas, and all things are made level for His elect, that He may fulfil to them the promise which He promised with great glory and rejoicing, if so be that they shall keep the ordinances of Elohim (God), which they received, with great faith.* It ain''t new: the promise is kept to the elect who keep the commandments — election precedes confession, and the ordinances stand. The mountains made level for His people is Yeshayahu''s (Isaiah''s) highway of return, and the everlasting worship is appointed: *For as the new heavens and the new earth, which I will make, shall remain before me, saith Yahuah (LORD), so shall your seed and your name remain* (Isaiah 66:22); *And it shall come to pass, that from one new moon to another, and from one sabbath to another, shall all flesh come to worship before me, saith Yahuah (LORD)* (Isaiah 66:23) — the Sabbath and the feasts kept into the world to come. The stones of the holy house are tried and fitted by fire: *And he shall sit as a refiner and purifier of silver: and he shall purify the sons of Levi, and purge them as gold and silver, that they may offer unto Yahuah (LORD) an offering in righteousness* (Malachi 3:3); *Every man''s work shall be made manifest: for the day shall declare it, because it shall be revealed by fire; and the fire shall try every man''s work of what sort it is* (1 Corinthians 3:13).',
       sv.verse_id, ev.verse_id, 'extras', 71506
  FROM _session253_herm1_lookup sv, _session253_herm1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=1 AND sv.verse_number=3
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=1 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: hermas-1-second-repentance
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 18:31 — *Cast away from you all your transgressions, whereby ye have transgressed; and make you a new heart and a new spirit: for why will ye die, O house of Yashar''el (Israel)?* The very plea Hermas hears — repent with all the heart and be written among the saints — was Yahuah''s plea to His house long before.'
  FROM cross_reference_threads t, cross_references x, _session253_herm1_lookup sv, _session253_herm1_lookup tv
 WHERE t.slug='hermas-1-second-repentance'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=18 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 18:32 — *For I have no pleasure in the death of him that dieth, saith Adonai Yahuah (the Lord GOD): wherefore turn yourselves, and live ye.* The lady''s mercy toward the corrupted family echoes the Father who delights not in death but in the turning.'
  FROM cross_reference_threads t, cross_references x, _session253_herm1_lookup sv, _session253_herm1_lookup tv
 WHERE t.slug='hermas-1-second-repentance'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=18 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Luke 15:10 — *Likewise, I say unto you, there is joy in the presence of the angels of Elohim (God) over one sinner that repenteth.* Hermas is told his children, if they repent, are written with the saints — the same heaven-joy the Messiah set over one returning sinner.'
  FROM cross_reference_threads t, cross_references x, _session253_herm1_lookup sv, _session253_herm1_lookup tv
 WHERE t.slug='hermas-1-second-repentance'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=15 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Peter 3:9 — *Yahuah (Lord) is not slack concerning his promise, as some men count slackness; but is longsuffering to us-ward, not willing that any should perish, but that all should come to repentance.* The space given Hermas to reprove and convert his household is Yahuah''s longsuffering, willing that all come to repentance.'
  FROM cross_reference_threads t, cross_references x, _session253_herm1_lookup sv, _session253_herm1_lookup tv
 WHERE t.slug='hermas-1-second-repentance'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=3 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Revelation 20:12 — *And I saw the dead, small and great, stand before Elohim (God); and the books were opened: and another book was opened, which is the book of life: and the dead were judged out of those things which were written in the books, according to their works.* The books of life in which the repentant are written are opened at the great white throne.'
  FROM cross_reference_threads t, cross_references x, _session253_herm1_lookup sv, _session253_herm1_lookup tv
 WHERE t.slug='hermas-1-second-repentance'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-1-church-formed-by-wisdom
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Peter 2:5 — *Ye also, as lively stones, are built up a spiritual house, an holy priesthood, to offer up spiritual sacrifices, acceptable to Elohim (God) by Yahusha HaMashiach (Jesus Christ).* The holy Church that Elohim formed by His own wisdom is the spiritual house of living stones Kepha describes.'
  FROM cross_reference_threads t, cross_references x, _session253_herm1_lookup sv, _session253_herm1_lookup tv
 WHERE t.slug='hermas-1-church-formed-by-wisdom'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=2 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ephesians 2:20 — *And are built upon the foundation of the apostles and prophets, Yahusha HaMashiach (Jesus Christ) himself being the chief corner stone.* The Church formed in Hermas''s vision stands on the same prophet-and-apostle foundation, the Messiah Himself the corner stone.'
  FROM cross_reference_threads t, cross_references x, _session253_herm1_lookup sv, _session253_herm1_lookup tv
 WHERE t.slug='hermas-1-church-formed-by-wisdom'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=2 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ephesians 2:22 — *In whom ye also are builded together for an habitation of Elohim (God) through the Spirit.* What Hermas calls the holy Church that Elohim blessed, Sha''ul calls the habitation of Elohim built together through the Spirit.'
  FROM cross_reference_threads t, cross_references x, _session253_herm1_lookup sv, _session253_herm1_lookup tv
 WHERE t.slug='hermas-1-church-formed-by-wisdom'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=2 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 21:2 — *And I John saw the holy city, new Jerusalem, coming down from Elohim (God) out of heaven, prepared as a bride adorned for her husband.* The blessed Church of the vision is consummated as the New Jerusalem, the bride adorned — gated by the twelve tribes, founded on the apostles, the gathering of Yashar''el and not its replacement.'
  FROM cross_reference_threads t, cross_references x, _session253_herm1_lookup sv, _session253_herm1_lookup tv
 WHERE t.slug='hermas-1-church-formed-by-wisdom'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-1-keep-the-ordinances-promise
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 66:22 — *For as the new heavens and the new earth, which I will make, shall remain before me, saith Yahuah (LORD), so shall your seed and your name remain.* The promise made level for the elect in Hermas is the enduring seed and name Yahuah swears to keep in the new heavens and new earth.'
  FROM cross_reference_threads t, cross_references x, _session253_herm1_lookup sv, _session253_herm1_lookup tv
 WHERE t.slug='hermas-1-keep-the-ordinances-promise'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=66 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 66:23 — *And it shall come to pass, that from one new moon to another, and from one sabbath to another, shall all flesh come to worship before me, saith Yahuah (LORD).* The ordinances the elect must keep are no abolished thing: the Sabbath and new moon endure as all flesh comes to worship.'
  FROM cross_reference_threads t, cross_references x, _session253_herm1_lookup sv, _session253_herm1_lookup tv
 WHERE t.slug='hermas-1-keep-the-ordinances-promise'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=66 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Malachi 3:3 — *And he shall sit as a refiner and purifier of silver: and he shall purify the sons of Levi, and purge them as gold and silver, that they may offer unto Yahuah (LORD) an offering in righteousness.* The elect kept for the promise are the silver refined and purged, fitted to offer in righteousness.'
  FROM cross_reference_threads t, cross_references x, _session253_herm1_lookup sv, _session253_herm1_lookup tv
 WHERE t.slug='hermas-1-keep-the-ordinances-promise'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Corinthians 3:13 — *Every man''s work shall be made manifest: for the day shall declare it, because it shall be revealed by fire; and the fire shall try every man''s work of what sort it is.* The stones built into Elohim''s holy house are tried by the fire of the day, even as Hermas''s family must be strengthened in faith.'
  FROM cross_reference_threads t, cross_references x, _session253_herm1_lookup sv, _session253_herm1_lookup tv
 WHERE t.slug='hermas-1-keep-the-ordinances-promise'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=3 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

