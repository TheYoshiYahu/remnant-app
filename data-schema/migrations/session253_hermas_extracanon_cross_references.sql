-- =====================================================================
-- Session 253 — Shepherd of Hermas ch1 FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py ../data-schema/migrations/session253_hermas_extracanon_cross_references.sql
-- =====================================================================

\echo 'session253 — Shepherd of Hermas ch1 cross-references starting...'
BEGIN;

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

-- ----- fragment: minion_hermas_02.sql (session253 hermas 2) -----
-- Source anchor: lightfoot-apostolic-fathers/hermas ch2. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: herm2 (view _session253_herm2_lookup). Sort band base 71525, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_herm2_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: hermas-2-second-repentance
  ('lightfoot-apostolic-fathers', 'hermas', 2, 2, 'canon', 'ezekiel', 33, 11, 'free', E'Ezekiel 33:11 — *Say unto them, As I live, saith Adonai Yahuah (the Lord GOD), I have no pleasure in the death of the wicked; but that the wicked turn from his way and live: turn ye, turn ye from your evil ways; for why will ye die, O house of Yashar''el (Israel)?* The forgiveness offered the fallen in Hermas 2:2 is Yahuah''s own ancient plea — He desires the turning, not the death, of the sinner.'),
  ('lightfoot-apostolic-fathers', 'hermas', 2, 2, 'canon', 'ezekiel', 18, 21, 'free', E'Ezekiel 18:21 — *But if the wicked will turn from all his sins that he hath committed, and keep all my statutes, and do that which is lawful and right, he shall surely live, he shall not die.* Hermas 2:2 grants the fallen forgiveness if they repent with the whole heart — Ezekiel ties that turning to keeping the statutes, so the commandments stand.'),
  ('lightfoot-apostolic-fathers', 'hermas', 2, 2, 'canon', '2-peter', 3, 9, 'free', E'2 Peter 3:9 — *Yahuah (Lord) is not slack concerning his promise, as some men count slackness; but is longsuffering to us-ward, not willing that any should perish, but that all should come to repentance.* The set day and offered mercy of Hermas 2:2 flow from the Master''s longsuffering — He delays so that all might turn.'),
  ('lightfoot-apostolic-fathers', 'hermas', 2, 2, 'canon', 'luke', 15, 7, 'free', E'Luke 15:7 — *I say unto you, that likewise joy shall be in heaven over one sinner that repenteth, more than over ninety and nine just persons, which need no repentance.* The mercy held out to all the saints that have sinned in Hermas 2:2 is the joy of heaven over the one who returns.'),
  -- thread: hermas-2-double-minded
  ('lightfoot-apostolic-fathers', 'hermas', 2, 2, 'canon', 'james', 1, 8, 'free', E'James 1:8 — *A double minded man is unstable in all his ways.* Hermas 2:2 commands the saints to remove double-mindedness from the heart — James names the very instability the steadfast must shed.'),
  ('lightfoot-apostolic-fathers', 'hermas', 2, 2, 'canon', 'james', 4, 8, 'free', E'James 4:8 — *Draw nigh to Elohim (God), and he will draw nigh to you. Cleanse your hands, ye sinners; and purify your hearts, ye double minded.* The whole-hearted repentance of Hermas 2:2 is James''s call to the double minded to cleanse and purify and so draw near.'),
  ('lightfoot-apostolic-fathers', 'hermas', 2, 2, 'canon', 'joel', 2, 12, 'free', E'Joel 2:12 — *Therefore also now, saith Yahuah (LORD), turn ye even to me with all your heart, and with fasting, and with weeping, and with mourning.* Hermas fasted before the writing was opened and urges repentance with the whole heart — Joel sets the pattern of turning to Yahuah with all the heart and with fasting.'),
  -- thread: hermas-2-endure-not-deny
  ('lightfoot-apostolic-fathers', 'hermas', 2, 2, 'canon', 'matthew', 10, 33, 'free', E'Matthew 10:33 — *But whosoever shall deny me before men, him will I also deny before my Father which is in heaven.* Hermas 2:2 warns that those who deny their Lord are rejected from their life — the Messiah Himself spoke the same warning against denial.'),
  ('lightfoot-apostolic-fathers', 'hermas', 2, 2, 'canon', '2-timothy', 2, 12, 'free', E'2 Timothy 2:12 — *If we suffer, we shall also reign with him: if we deny him, he also will deny us:* The endurance and the denial-warning of Hermas 2:2 are Shaul''s faithful saying — suffering with Him reigns, denying Him is denied.'),
  ('lightfoot-apostolic-fathers', 'hermas', 2, 2, 'canon', 'revelation', 2, 10, 'free', E'Revelation 2:10 — *Fear none of those things which thou shalt suffer: behold, the devil shall cast some of you into prison, that ye may be tried; and ye shall have tribulation ten days: be thou faithful unto death, and I will give thee a crown of life.* The blessing on those who endure the great tribulation in Hermas 2:2 is the Messiah''s promise of the crown to the faithful unto death.'),
  -- thread: hermas-2-church-created-before-all
  ('lightfoot-apostolic-fathers', 'hermas', 2, 4, 'canon', 'ephesians', 1, 4, 'free', E'Ephesians 1:4 — *According as he hath chosen us in him before the foundation of the world, that we should be holy and without blame before him in love:* The Church created before all things in Hermas 2:4 is the assembly chosen in Him before the world''s foundation — election precedes confession.'),
  ('lightfoot-apostolic-fathers', 'hermas', 2, 4, 'canon', 'proverbs', 8, 23, 'free', E'Proverbs 8:23 — *I was set up from everlasting, from the beginning, or ever the earth was.* For her sake the world was framed (Hermas 2:4) echoes the Formed Wisdom set up from everlasting before the earth was.'),
  ('lightfoot-apostolic-fathers', 'hermas', 2, 4, 'canon', 'ephesians', 2, 20, 'free', E'Ephesians 2:20 — *And are built upon the foundation of the apostles and prophets, Yahusha HaMashiach (Jesus Christ) himself being the chief corner stone;* The aged-woman Church of Hermas 2:4 is the building of the elect, founded on prophets and apostles with the Messiah as the corner stone.'),
  ('lightfoot-apostolic-fathers', 'hermas', 2, 4, 'canon', '1-peter', 2, 5, 'free', E'1 Peter 2:5 — *Ye also, as lively stones, are built up a spiritual house, an holy priesthood, to offer up spiritual sacrifices, acceptable to Elohim (God) by Yahusha HaMashiach (Jesus Christ).* The Church for whose sake the world was framed (Hermas 2:4) is built of living stones — the elect fitted into a spiritual house.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_herm2_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_herm2_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-2-second-repentance',
       E'Repentance offered to the fallen — turn with the whole heart',
       E'The little book given to Hermas pleads with the fallen seed and yet swings wide the door of return: *Thy seed, Hermas, have sinned against Elohim (God), and have blasphemed Yahuah (Lord)... then all their sins which they sinned aforetime are forgiven to them; yea, and to all the saints that have sinned unto this day, if they repent with their whole heart, and remove double-mindedness from their heart.* It ain''t new — this is the very heart of Yahuah declared to Yashar''el through Ezekiel, *As I live, saith Adonai Yahuah (the Lord GOD), I have no pleasure in the death of the wicked; but that the wicked turn from his way and live: turn ye, turn ye from your evil ways; for why will ye die, O house of Yashar''el (Israel)?* (Ezekiel 33:11), and *But if the wicked will turn from all his sins that he hath committed, and keep all my statutes, and do that which is lawful and right, he shall surely live, he shall not die.* (Ezekiel 18:21). The Master who *is longsuffering to us-ward, not willing that any should perish, but that all should come to repentance.* (2 Peter 3:9) is the same who fills heaven with joy over the one who turns: *I say unto you, that likewise joy shall be in heaven over one sinner that repenteth, more than over ninety and nine just persons, which need no repentance.* (Luke 15:7). Repentance bound to keeping the statutes — Torah stands.',
       sv.verse_id, ev.verse_id, 'extras', 71525
  FROM _session253_herm2_lookup sv, _session253_herm2_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=2 AND sv.verse_number=2
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=2 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-2-double-minded',
       E'Remove double-mindedness — be not double-minded',
       E'The book commands the saints to *remove double-mindedness from their heart*, and again: *Ye therefore that work righteousness be stedfast, and be not double-minded, that ye may have admission with the holy angels.* This is the very burden of Yaaqob (James), who warns that *A double minded man is unstable in all his ways.* (James 1:8) and calls the wavering to repentance: *Draw nigh to Elohim (God), and he will draw nigh to you. Cleanse your hands, ye sinners; and purify your hearts, ye double minded.* (James 4:8). The turning Hermas urges is the whole-hearted return Yahuah sought of old: *Therefore also now, saith Yahuah (LORD), turn ye even to me with all your heart, and with fasting, and with weeping, and with mourning* (Joel 2:12) — and Hermas himself fasted fifteen days before the writing was opened to him.',
       sv.verse_id, ev.verse_id, 'extras', 71528
  FROM _session253_herm2_lookup sv, _session253_herm2_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=2 AND sv.verse_number=2
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=2 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-2-endure-not-deny',
       E'Endure the tribulation, deny not — faithful unto death',
       E'The vision blesses the faithful who hold fast through the coming trial: *Blessed are ye, as many as endure patiently the great tribulation that cometh, and as many as shall not deny their life. For Yahuah (Lord) sware concerning His Son, that those who denied their Lord should be rejected from their life.* The same word stands in the Messiah''s own mouth — *But whosoever shall deny me before men, him will I also deny before my Father which is in heaven.* (Matthew 10:33) — and in Shaul''s faithful saying, *If we suffer, we shall also reign with him: if we deny him, he also will deny us* (2 Timothy 2:12). To the persecuted assembly the call is to faithfulness unto death: *Fear none of those things which thou shalt suffer... be thou faithful unto death, and I will give thee a crown of life.* (Revelation 2:10). The martyr-faithfulness of the fathers is the canon''s own — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 71531
  FROM _session253_herm2_lookup sv, _session253_herm2_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=2 AND sv.verse_number=2
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=2 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-2-church-created-before-all',
       E'The Church the aged woman — created before all things, the elect',
       E'The youth unveils the aged woman: *''The Church,'' saith he. I said unto him, ''Wherefore then is she aged?'' ''Because,'' saith he, ''she was created before all things; therefore is she aged; and for her sake the world was framed.''* The assembly of the called was no afterthought — its foreknown election stands *According as he hath chosen us in him before the foundation of the world, that we should be holy and without blame before him in love* (Ephesians 1:4). The pattern of a chosen one set up before the world was is Wisdom''s own song, *Yahuah (LORD) possessed me in the beginning of his way, before his works of old. I was set up from everlasting, from the beginning, or ever the earth was* (Proverbs 8:22-23), the Formed Wisdom by whom *were all things created* (Colossians 1:16). And the elect themselves — the living stones — are *built upon the foundation of the apostles and prophets, Yahusha HaMashiach (Jesus Christ) himself being the chief corner stone* (Ephesians 2:20), the holy temple wherein the called are fitted together. Election precedes confession; the gathering is the foreknown remnant, not a church that replaces Yashar''el.',
       sv.verse_id, ev.verse_id, 'extras', 71534
  FROM _session253_herm2_lookup sv, _session253_herm2_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=2 AND sv.verse_number=4
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=2 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: hermas-2-second-repentance
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 33:11 — *Say unto them, As I live, saith Adonai Yahuah (the Lord GOD), I have no pleasure in the death of the wicked; but that the wicked turn from his way and live: turn ye, turn ye from your evil ways; for why will ye die, O house of Yashar''el (Israel)?* The forgiveness offered the fallen in Hermas 2:2 is Yahuah''s own ancient plea — He desires the turning, not the death, of the sinner.'
  FROM cross_reference_threads t, cross_references x, _session253_herm2_lookup sv, _session253_herm2_lookup tv
 WHERE t.slug='hermas-2-second-repentance'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=2 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=33 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 18:21 — *But if the wicked will turn from all his sins that he hath committed, and keep all my statutes, and do that which is lawful and right, he shall surely live, he shall not die.* Hermas 2:2 grants the fallen forgiveness if they repent with the whole heart — Ezekiel ties that turning to keeping the statutes, so the commandments stand.'
  FROM cross_reference_threads t, cross_references x, _session253_herm2_lookup sv, _session253_herm2_lookup tv
 WHERE t.slug='hermas-2-second-repentance'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=2 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=18 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Peter 3:9 — *Yahuah (Lord) is not slack concerning his promise, as some men count slackness; but is longsuffering to us-ward, not willing that any should perish, but that all should come to repentance.* The set day and offered mercy of Hermas 2:2 flow from the Master''s longsuffering — He delays so that all might turn.'
  FROM cross_reference_threads t, cross_references x, _session253_herm2_lookup sv, _session253_herm2_lookup tv
 WHERE t.slug='hermas-2-second-repentance'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=2 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=3 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Luke 15:7 — *I say unto you, that likewise joy shall be in heaven over one sinner that repenteth, more than over ninety and nine just persons, which need no repentance.* The mercy held out to all the saints that have sinned in Hermas 2:2 is the joy of heaven over the one who returns.'
  FROM cross_reference_threads t, cross_references x, _session253_herm2_lookup sv, _session253_herm2_lookup tv
 WHERE t.slug='hermas-2-second-repentance'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=2 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=15 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-2-double-minded
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'James 1:8 — *A double minded man is unstable in all his ways.* Hermas 2:2 commands the saints to remove double-mindedness from the heart — James names the very instability the steadfast must shed.'
  FROM cross_reference_threads t, cross_references x, _session253_herm2_lookup sv, _session253_herm2_lookup tv
 WHERE t.slug='hermas-2-double-minded'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=2 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'James 4:8 — *Draw nigh to Elohim (God), and he will draw nigh to you. Cleanse your hands, ye sinners; and purify your hearts, ye double minded.* The whole-hearted repentance of Hermas 2:2 is James''s call to the double minded to cleanse and purify and so draw near.'
  FROM cross_reference_threads t, cross_references x, _session253_herm2_lookup sv, _session253_herm2_lookup tv
 WHERE t.slug='hermas-2-double-minded'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=2 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=4 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Joel 2:12 — *Therefore also now, saith Yahuah (LORD), turn ye even to me with all your heart, and with fasting, and with weeping, and with mourning.* Hermas fasted before the writing was opened and urges repentance with the whole heart — Joel sets the pattern of turning to Yahuah with all the heart and with fasting.'
  FROM cross_reference_threads t, cross_references x, _session253_herm2_lookup sv, _session253_herm2_lookup tv
 WHERE t.slug='hermas-2-double-minded'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=2 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-2-endure-not-deny
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 10:33 — *But whosoever shall deny me before men, him will I also deny before my Father which is in heaven.* Hermas 2:2 warns that those who deny their Lord are rejected from their life — the Messiah Himself spoke the same warning against denial.'
  FROM cross_reference_threads t, cross_references x, _session253_herm2_lookup sv, _session253_herm2_lookup tv
 WHERE t.slug='hermas-2-endure-not-deny'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=2 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=10 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Timothy 2:12 — *If we suffer, we shall also reign with him: if we deny him, he also will deny us:* The endurance and the denial-warning of Hermas 2:2 are Shaul''s faithful saying — suffering with Him reigns, denying Him is denied.'
  FROM cross_reference_threads t, cross_references x, _session253_herm2_lookup sv, _session253_herm2_lookup tv
 WHERE t.slug='hermas-2-endure-not-deny'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=2 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='2-timothy' AND tv.chapter_number=2 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 2:10 — *Fear none of those things which thou shalt suffer: behold, the devil shall cast some of you into prison, that ye may be tried; and ye shall have tribulation ten days: be thou faithful unto death, and I will give thee a crown of life.* The blessing on those who endure the great tribulation in Hermas 2:2 is the Messiah''s promise of the crown to the faithful unto death.'
  FROM cross_reference_threads t, cross_references x, _session253_herm2_lookup sv, _session253_herm2_lookup tv
 WHERE t.slug='hermas-2-endure-not-deny'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=2 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=2 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-2-church-created-before-all
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ephesians 1:4 — *According as he hath chosen us in him before the foundation of the world, that we should be holy and without blame before him in love:* The Church created before all things in Hermas 2:4 is the assembly chosen in Him before the world''s foundation — election precedes confession.'
  FROM cross_reference_threads t, cross_references x, _session253_herm2_lookup sv, _session253_herm2_lookup tv
 WHERE t.slug='hermas-2-church-created-before-all'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=1 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 8:23 — *I was set up from everlasting, from the beginning, or ever the earth was.* For her sake the world was framed (Hermas 2:4) echoes the Formed Wisdom set up from everlasting before the earth was.'
  FROM cross_reference_threads t, cross_references x, _session253_herm2_lookup sv, _session253_herm2_lookup tv
 WHERE t.slug='hermas-2-church-created-before-all'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=8 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ephesians 2:20 — *And are built upon the foundation of the apostles and prophets, Yahusha HaMashiach (Jesus Christ) himself being the chief corner stone;* The aged-woman Church of Hermas 2:4 is the building of the elect, founded on prophets and apostles with the Messiah as the corner stone.'
  FROM cross_reference_threads t, cross_references x, _session253_herm2_lookup sv, _session253_herm2_lookup tv
 WHERE t.slug='hermas-2-church-created-before-all'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=2 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Peter 2:5 — *Ye also, as lively stones, are built up a spiritual house, an holy priesthood, to offer up spiritual sacrifices, acceptable to Elohim (God) by Yahusha HaMashiach (Jesus Christ).* The Church for whose sake the world was framed (Hermas 2:4) is built of living stones — the elect fitted into a spiritual house.'
  FROM cross_reference_threads t, cross_references x, _session253_herm2_lookup sv, _session253_herm2_lookup tv
 WHERE t.slug='hermas-2-church-created-before-all'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=2 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

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

-- ----- fragment: minion_hermas_04.sql (session253 hermas 4) -----
-- Source anchor: lightfoot-apostolic-fathers/hermas ch4. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: herm4 (view _session253_herm4_lookup). Sort band base 71575, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_herm4_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: hermas-4-beast-great-tribulation
  ('lightfoot-apostolic-fathers', 'hermas', 4, 1, 'canon', 'matthew', 24, 21, 'free', E'Matthew 24:21 — *For then shall be great tribulation, such as was not since the beginning of the world to this time, no, nor ever shall be.* The Messiah names the very tribulation the beast of Hermas 4:1 is shown to typify.'),
  ('lightfoot-apostolic-fathers', 'hermas', 4, 1, 'canon', 'matthew', 24, 13, 'free', E'Matthew 24:13 — *But he that shall endure unto the end, the same shall be saved.* Hermas passes the beast by faith and is unhurt, as the Master promises the enduring one in Hermas 4:1.'),
  ('lightfoot-apostolic-fathers', 'hermas', 4, 1, 'canon', '1-peter', 1, 7, 'free', E'1 Peter 1:7 — *That the trial of your faith, being much more precious than of gold that perisheth, though it be tried with fire, might be found unto praise and honour and glory at the appearing of Yahusha HaMashiach (Jesus Christ):* The fiery beast is the trial of faith more precious than gold that Hermas 4:1 endures unmoved.'),
  -- thread: hermas-4-repent-whole-heart-cast-care
  ('lightfoot-apostolic-fathers', 'hermas', 4, 2, 'canon', 'ezekiel', 18, 30, 'free', E'Ezekiel 18:30 — *Therefore I will judge you, O house of Yashar''el (Israel), every one according to his ways, saith Adonai Yahuah (the Lord GOD). Repent, and turn yourselves from all your transgressions; so iniquity shall not be your ruin.* The prophet''s whole-hearted turning is the very repentance the Church urges in Hermas 4:2.'),
  ('lightfoot-apostolic-fathers', 'hermas', 4, 2, 'canon', '2-peter', 3, 9, 'free', E'2 Peter 3:9 — *Yahuah (Lord) is not slack concerning his promise, as some men count slackness; but is longsuffering to us-ward, not willing that any should perish, but that all should come to repentance.* The longsuffering that gives time to prepare and repent is the mercy Hermas 4:2 declares to the elect.'),
  ('lightfoot-apostolic-fathers', 'hermas', 4, 2, 'canon', 'psalms', 55, 22, 'free', E'Psalm 55:22 — *Cast thy burden upon Yahuah (LORD), and he shall sustain thee: he shall never suffer the righteous to be moved.* The Psalmist''s casting of the burden is word-for-word the counsel that delivered Hermas in 4:2.'),
  ('lightfoot-apostolic-fathers', 'hermas', 4, 2, 'canon', '1-peter', 5, 7, 'free', E'1 Peter 5:7 — *Casting all your care upon him; for he careth for you.* Peter repeats the same exhortation the Church gives Hermas, to cast every care upon Yahuah in 4:2.'),
  -- thread: hermas-4-gold-tried-fire-tower-elect
  ('lightfoot-apostolic-fathers', 'hermas', 4, 3, 'canon', 'malachi', 3, 3, 'free', E'Malachi 3:3 — *And he shall sit as a refiner and purifier of silver: and he shall purify the sons of Levi, and purge them as gold and silver, that they may offer unto Yahuah (LORD) an offering in righteousness.* The refiner''s fire that purges gold is exactly the testing that makes the saints useful for the tower in Hermas 4:3.'),
  ('lightfoot-apostolic-fathers', 'hermas', 4, 3, 'canon', 'zechariah', 13, 9, 'free', E'Zechariah 13:9 — *And I will bring the third part through the fire, and will refine them as silver is refined, and will try them as gold is tried: they shall call on my name, and I will hear them: I will say, It is my people: and they shall say, Yahuah (LORD) is my Elohim (God).* The remnant brought through the fire and tried as gold is the very purifying of the golden ones in Hermas 4:3.'),
  ('lightfoot-apostolic-fathers', 'hermas', 4, 3, 'canon', '1-peter', 2, 5, 'free', E'1 Peter 2:5 — *Ye also, as lively stones, are built up a spiritual house, an holy priesthood, to offer up spiritual sacrifices, acceptable to Elohim (God) by Yahusha HaMashiach (Jesus Christ).* The living-stone house is the tower the purified are made useful to build in Hermas 4:3.'),
  ('lightfoot-apostolic-fathers', 'hermas', 4, 3, 'canon', 'revelation', 21, 27, 'free', E'Revelation 21:27 — *And there shall in no wise enter into it any thing that defileth, neither whatsoever worketh abomination, or maketh a lie: but they which are written in the Lamb''s book of life.* The white coming-age where the elect without spot dwell is the New Jerusalem of Hermas 4:3, entered only by the undefiled.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_herm4_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_herm4_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-4-beast-great-tribulation',
       E'The beast — a type of the great tribulation to come',
       E'Hermas sees the fourth vision *for a type of the impending tribulation* — *a huge beast like some sea-monster, and from its mouth fiery locusts issued forth* — and the word comes, *Be not of doubtful mind, Hermas*. Having *put on the faith of Yahuah (Lord)* he passes through unhurt: the beast *stretcheth itself on the ground... and stirred not at all until I had passed by it*. It ain''t new. The Master Himself named the beast''s hour: *For then shall be great tribulation, such as was not since the beginning of the world to this time, no, nor ever shall be* (Matthew 24:21) — yet the promise stands for the faithful, *But he that shall endure unto the end, the same shall be saved* (Matthew 24:13). And the trial is not wrath but refining: *That the trial of your faith, being much more precious than of gold that perisheth, though it be tried with fire, might be found unto praise and honour and glory at the appearing of Yahusha HaMashiach (Jesus Christ)* (1 Peter 1:7). The doubtful mind is the only enemy; the faith of Yahuah shuts the lion''s mouth.',
       sv.verse_id, ev.verse_id, 'extras', 71575
  FROM _session253_herm4_lookup sv, _session253_herm4_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=4 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=4 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-4-repent-whole-heart-cast-care',
       E'Repent with your whole heart — cast your care upon Yahuah',
       E'The Church charges Hermas: *declare to the elect of Yahuah (Lord) His mighty works*, for *If therefore ye prepare yourselves beforehand, and repent (and turn) unto Yahuah (Lord) with your whole heart, ye shall be able to escape it.* And the counsel that saved him: *thou didst cast thy care upon Elohim (God), and didst open thy heart to Yahuah (Lord)... Cast your cares upon Yahuah (Lord) and He will set them straight.* It ain''t new — this is the second repentance offered to the fallen, the everlasting call of the prophets: *Repent, and turn yourselves from all your transgressions; so iniquity shall not be your ruin* (Ezekiel 18:30); and the patience of Elohim that holds the door, *not willing that any should perish, but that all should come to repentance* (2 Peter 3:9). The casting of care is straight from the Psalter, *Cast thy burden upon Yahuah (LORD), and he shall sustain thee* (Psalm 55:22), echoed by the apostle, *Casting all your care upon him; for he careth for you* (1 Peter 5:7). The elect are charged before they confess; the commandment to turn stands.',
       sv.verse_id, ev.verse_id, 'extras', 71578
  FROM _session253_herm4_lookup sv, _session253_herm4_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=4 AND sv.verse_number=2
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=4 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-4-gold-tried-fire-tower-elect',
       E'Gold tried in the fire — the elect built into the tower',
       E'The four colours are unfolded: *as the gold is tested by the fire and is made useful, so ye also... are being tested in yourselves. Ye then that abide and pass through the fire will be purified by it... and shall be useful for the building of the tower. But the white portion is the coming age, in which the elect of Elohim (God) shall dwell; because the elect of Elohim (God) shall be without spot and pure unto life eternal.* It ain''t new. The refining fire is the prophet''s: *And he shall sit as a refiner and purifier of silver: and he shall purify the sons of Levi, and purge them as gold and silver* (Malachi 3:3); and the remnant passed through it, *And I will bring the third part through the fire, and will refine them as silver is refined, and will try them as gold is tried: they shall call on my name, and I will hear them* (Zechariah 13:9). The tower is the house of living stones, *Ye also, as lively stones, are built up a spiritual house, an holy priesthood* (1 Peter 2:5); and into the white age, the New Jerusalem, *there shall in no wise enter into it any thing that defileth... but they which are written in the Lamb''s book of life* (Revelation 21:27) — the elect without spot, tried and fitted before they are placed.',
       sv.verse_id, ev.verse_id, 'extras', 71581
  FROM _session253_herm4_lookup sv, _session253_herm4_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=4 AND sv.verse_number=3
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=4 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: hermas-4-beast-great-tribulation
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 24:21 — *For then shall be great tribulation, such as was not since the beginning of the world to this time, no, nor ever shall be.* The Messiah names the very tribulation the beast of Hermas 4:1 is shown to typify.'
  FROM cross_reference_threads t, cross_references x, _session253_herm4_lookup sv, _session253_herm4_lookup tv
 WHERE t.slug='hermas-4-beast-great-tribulation'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=4 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 24:13 — *But he that shall endure unto the end, the same shall be saved.* Hermas passes the beast by faith and is unhurt, as the Master promises the enduring one in Hermas 4:1.'
  FROM cross_reference_threads t, cross_references x, _session253_herm4_lookup sv, _session253_herm4_lookup tv
 WHERE t.slug='hermas-4-beast-great-tribulation'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=4 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Peter 1:7 — *That the trial of your faith, being much more precious than of gold that perisheth, though it be tried with fire, might be found unto praise and honour and glory at the appearing of Yahusha HaMashiach (Jesus Christ):* The fiery beast is the trial of faith more precious than gold that Hermas 4:1 endures unmoved.'
  FROM cross_reference_threads t, cross_references x, _session253_herm4_lookup sv, _session253_herm4_lookup tv
 WHERE t.slug='hermas-4-beast-great-tribulation'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=4 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=1 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-4-repent-whole-heart-cast-care
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 18:30 — *Therefore I will judge you, O house of Yashar''el (Israel), every one according to his ways, saith Adonai Yahuah (the Lord GOD). Repent, and turn yourselves from all your transgressions; so iniquity shall not be your ruin.* The prophet''s whole-hearted turning is the very repentance the Church urges in Hermas 4:2.'
  FROM cross_reference_threads t, cross_references x, _session253_herm4_lookup sv, _session253_herm4_lookup tv
 WHERE t.slug='hermas-4-repent-whole-heart-cast-care'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=4 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=18 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Peter 3:9 — *Yahuah (Lord) is not slack concerning his promise, as some men count slackness; but is longsuffering to us-ward, not willing that any should perish, but that all should come to repentance.* The longsuffering that gives time to prepare and repent is the mercy Hermas 4:2 declares to the elect.'
  FROM cross_reference_threads t, cross_references x, _session253_herm4_lookup sv, _session253_herm4_lookup tv
 WHERE t.slug='hermas-4-repent-whole-heart-cast-care'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=4 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=3 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 55:22 — *Cast thy burden upon Yahuah (LORD), and he shall sustain thee: he shall never suffer the righteous to be moved.* The Psalmist''s casting of the burden is word-for-word the counsel that delivered Hermas in 4:2.'
  FROM cross_reference_threads t, cross_references x, _session253_herm4_lookup sv, _session253_herm4_lookup tv
 WHERE t.slug='hermas-4-repent-whole-heart-cast-care'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=4 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=55 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Peter 5:7 — *Casting all your care upon him; for he careth for you.* Peter repeats the same exhortation the Church gives Hermas, to cast every care upon Yahuah in 4:2.'
  FROM cross_reference_threads t, cross_references x, _session253_herm4_lookup sv, _session253_herm4_lookup tv
 WHERE t.slug='hermas-4-repent-whole-heart-cast-care'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=4 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-4-gold-tried-fire-tower-elect
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Malachi 3:3 — *And he shall sit as a refiner and purifier of silver: and he shall purify the sons of Levi, and purge them as gold and silver, that they may offer unto Yahuah (LORD) an offering in righteousness.* The refiner''s fire that purges gold is exactly the testing that makes the saints useful for the tower in Hermas 4:3.'
  FROM cross_reference_threads t, cross_references x, _session253_herm4_lookup sv, _session253_herm4_lookup tv
 WHERE t.slug='hermas-4-gold-tried-fire-tower-elect'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=4 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Zechariah 13:9 — *And I will bring the third part through the fire, and will refine them as silver is refined, and will try them as gold is tried: they shall call on my name, and I will hear them: I will say, It is my people: and they shall say, Yahuah (LORD) is my Elohim (God).* The remnant brought through the fire and tried as gold is the very purifying of the golden ones in Hermas 4:3.'
  FROM cross_reference_threads t, cross_references x, _session253_herm4_lookup sv, _session253_herm4_lookup tv
 WHERE t.slug='hermas-4-gold-tried-fire-tower-elect'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=4 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=13 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Peter 2:5 — *Ye also, as lively stones, are built up a spiritual house, an holy priesthood, to offer up spiritual sacrifices, acceptable to Elohim (God) by Yahusha HaMashiach (Jesus Christ).* The living-stone house is the tower the purified are made useful to build in Hermas 4:3.'
  FROM cross_reference_threads t, cross_references x, _session253_herm4_lookup sv, _session253_herm4_lookup tv
 WHERE t.slug='hermas-4-gold-tried-fire-tower-elect'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=4 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=2 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 21:27 — *And there shall in no wise enter into it any thing that defileth, neither whatsoever worketh abomination, or maketh a lie: but they which are written in the Lamb''s book of life.* The white coming-age where the elect without spot dwell is the New Jerusalem of Hermas 4:3, entered only by the undefiled.'
  FROM cross_reference_threads t, cross_references x, _session253_herm4_lookup sv, _session253_herm4_lookup tv
 WHERE t.slug='hermas-4-gold-tried-fire-tower-elect'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=4 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_hermas_05.sql (session253 hermas 5) -----
-- Source anchor: lightfoot-apostolic-fathers/hermas ch5. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: herm5 (view _session253_herm5_lookup). Sort band base 71600, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_herm5_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: hermas-5-shepherd-angel-of-repentance
  ('lightfoot-apostolic-fathers', 'hermas', 5, 1, 'canon', 'ezekiel', 33, 11, 'free', E'Ezekiel 33:11 — *Say unto them, As I live, saith Adonai Yahuah (the Lord GOD), I have no pleasure in the death of the wicked; but that the wicked turn from his way and live: turn ye, turn ye from your evil ways; for why will ye die, O house of Yashar''el (Israel)?* The angel of repentance carries Yahuah''s own ancient plea to the fallen in hermas 5:1.'),
  ('lightfoot-apostolic-fathers', 'hermas', 5, 1, 'canon', 'ezekiel', 18, 30, 'free', E'Ezekiel 18:30 — *Therefore I will judge you, O house of Yashar''el (Israel), every one according to his ways, saith Adonai Yahuah (the Lord GOD). Repent, and turn yourselves from all your transgressions; so iniquity shall not be your ruin.* The second repentance the shepherd offers in hermas 5:1 is the prophet''s call to turn and live.'),
  ('lightfoot-apostolic-fathers', 'hermas', 5, 1, 'canon', '2-peter', 3, 9, 'free', E'2 Peter 3:9 — *Yahuah (Lord) is not slack concerning his promise, as some men count slackness; but is longsuffering to us-ward, not willing that any should perish, but that all should come to repentance.* The Master''s longsuffering is why the angel of repentance is sent to dwell with Hermas in hermas 5:1.'),
  ('lightfoot-apostolic-fathers', 'hermas', 5, 1, 'canon', 'luke', 15, 7, 'free', E'Luke 15:7 — *I say unto you, that likewise joy shall be in heaven over one sinner that repenteth, more than over ninety and nine just persons, which need no repentance.* The Good Shepherd''s joy over the recovered is the heart of the shepherd of repentance in hermas 5:1.'),
  -- thread: hermas-5-keep-the-commandments
  ('lightfoot-apostolic-fathers', 'hermas', 5, 1, 'canon', 'john', 14, 15, 'free', E'John 14:15 — *If ye love me, keep my commandments.* The shepherd''s call to keep and walk in the commandments with a pure heart in hermas 5:1 is the Messiah''s own measure of love.'),
  ('lightfoot-apostolic-fathers', 'hermas', 5, 1, 'canon', '1-john', 5, 3, 'free', E'1 John 5:3 — *For this is the love of Elohim (God), that we keep his commandments: and his commandments are not grievous.* The keeping the shepherd commands in hermas 5:1 is love made visible, the yoke that is not a burden.'),
  ('lightfoot-apostolic-fathers', 'hermas', 5, 1, 'canon', 'malachi', 4, 4, 'free', E'Malachi 4:4 — *Remember ye the law of Moses my servant, which I commanded unto him in Horeb for all Yashar''el (Israel), with the statutes and judgments.* The commandments Hermas is told to write and keep in hermas 5:1 are the same statutes and judgments that endure.'),
  ('lightfoot-apostolic-fathers', 'hermas', 5, 1, 'canon', 'psalms', 15, 2, 'free', E'Psalm 15:2 — *He that walketh uprightly, and worketh righteousness, and speaketh the truth in his heart.* The pure heart that walks in the commandments in hermas 5:1 is the dweller in Yahuah''s holy hill.'),
  -- thread: hermas-5-remember-whence-fallen
  ('lightfoot-apostolic-fathers', 'hermas', 5, 1, 'canon', 'revelation', 2, 5, 'free', E'Revelation 2:5 — *Remember therefore from whence thou art fallen, and repent, and do the first works; or else I will come unto thee quickly, and will remove thy candlestick out of his place, except thou repent.* The shepherd''s either-or of promise or its opposite in hermas 5:1 is the Messiah''s own charge to repent and do the first works.'),
  ('lightfoot-apostolic-fathers', 'hermas', 5, 1, 'canon', 'matthew', 7, 14, 'free', E'Matthew 7:14 — *Because strait is the gate, and narrow is the way, which leadeth unto life, and few there be that find it.* The two outcomes the shepherd lays out in hermas 5:1 are the two ways: the narrow road of keeping, or its opposite.'),
  ('lightfoot-apostolic-fathers', 'hermas', 5, 1, 'canon', 'ezekiel', 18, 32, 'free', E'Ezekiel 18:32 — *For I have no pleasure in the death of him that dieth, saith Adonai Yahuah (the Lord GOD): wherefore turn yourselves, and live ye.* The opposite that the unrepentant receive in hermas 5:1 is the death Yahuah takes no pleasure in — turn, and live.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_herm5_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_herm5_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-5-shepherd-angel-of-repentance',
       E'The shepherd, the angel of repentance',
       E'Hermas is met by a glorious figure in a shepherd''s garb — *‘I,’ saith he, ‘am the shepherd, unto whom thou wast delivered.’* — and at the close he names him plainly: *All these the shepherd, the angel of repentance, commanded me so to write.* The shepherd who guards and gathers the flock, and the call to *turn ye, turn ye*, is no new thing. Yahuah pleads through Ezekiel, *As I live, saith Adonai Yahuah (the Lord GOD), I have no pleasure in the death of the wicked; but that the wicked turn from his way and live: turn ye, turn ye from your evil ways; for why will ye die, O house of Yashar''el (Israel)?* (Ezekiel 33:11). And again, *Repent, and turn yourselves from all your transgressions; so iniquity shall not be your ruin* (Ezekiel 18:30). The Master is *not willing that any should perish, but that all should come to repentance* (2 Peter 3:9) — election before confession, the seed kept, the wanderer sought.',
       sv.verse_id, ev.verse_id, 'extras', 71600
  FROM _session253_herm5_lookup sv, _session253_herm5_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=5 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=5 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-5-keep-the-commandments',
       E'Keep the commandments and live',
       E'The shepherd''s charge is plain: *‘Be not confounded, but strengthen thyself in my commandments which I am about to command thee’* — and the promise hangs on the keeping: *If then, when ye hear them, ye keep them and walk in them, and do them with a pure heart, ye shall receive from Yahuah (Lord) all things that He promised you; but if, when ye hear them, ye do not repent, but still add to your sins, ye shall receive from Yahuah (Lord) the opposite.* This is the everlasting word, never law-as-curse. The Messiah Himself binds love to obedience: *If ye love me, keep my commandments* (John 14:15), and the beloved disciple confirms, *For this is the love of Elohim (God), that we keep his commandments: and his commandments are not grievous* (1 John 5:3). The charge to remember stands from of old: *Remember ye the law of Moses my servant, which I commanded unto him in Horeb for all Yashar''el (Israel), with the statutes and judgments* (Malachi 4:4).',
       sv.verse_id, ev.verse_id, 'extras', 71603
  FROM _session253_herm5_lookup sv, _session253_herm5_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=5 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=5 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-5-remember-whence-fallen',
       E'Repent, or receive the opposite',
       E'The shepherd sets the two outcomes before the hearer: keep the commandments and *ye shall receive from Yahuah (Lord) all things that He promised you*, or *if, when ye hear them, ye do not repent, but still add to your sins, ye shall receive from Yahuah (Lord) the opposite.* The risen Messiah speaks the very same warning to His assemblies: *Remember therefore from whence thou art fallen, and repent, and do the first works; or else I will come unto thee quickly, and will remove thy candlestick out of his place, except thou repent* (Revelation 2:5). And the way is narrow, the two ways set before every soul: *Because strait is the gate, and narrow is the way, which leadeth unto life, and few there be that find it* (Matthew 7:14). The second repentance is real mercy, but it is a door to be walked through, not a license to *add to your sins*.',
       sv.verse_id, ev.verse_id, 'extras', 71606
  FROM _session253_herm5_lookup sv, _session253_herm5_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=5 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=5 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: hermas-5-shepherd-angel-of-repentance
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 33:11 — *Say unto them, As I live, saith Adonai Yahuah (the Lord GOD), I have no pleasure in the death of the wicked; but that the wicked turn from his way and live: turn ye, turn ye from your evil ways; for why will ye die, O house of Yashar''el (Israel)?* The angel of repentance carries Yahuah''s own ancient plea to the fallen in hermas 5:1.'
  FROM cross_reference_threads t, cross_references x, _session253_herm5_lookup sv, _session253_herm5_lookup tv
 WHERE t.slug='hermas-5-shepherd-angel-of-repentance'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=33 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 18:30 — *Therefore I will judge you, O house of Yashar''el (Israel), every one according to his ways, saith Adonai Yahuah (the Lord GOD). Repent, and turn yourselves from all your transgressions; so iniquity shall not be your ruin.* The second repentance the shepherd offers in hermas 5:1 is the prophet''s call to turn and live.'
  FROM cross_reference_threads t, cross_references x, _session253_herm5_lookup sv, _session253_herm5_lookup tv
 WHERE t.slug='hermas-5-shepherd-angel-of-repentance'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=18 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Peter 3:9 — *Yahuah (Lord) is not slack concerning his promise, as some men count slackness; but is longsuffering to us-ward, not willing that any should perish, but that all should come to repentance.* The Master''s longsuffering is why the angel of repentance is sent to dwell with Hermas in hermas 5:1.'
  FROM cross_reference_threads t, cross_references x, _session253_herm5_lookup sv, _session253_herm5_lookup tv
 WHERE t.slug='hermas-5-shepherd-angel-of-repentance'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=3 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Luke 15:7 — *I say unto you, that likewise joy shall be in heaven over one sinner that repenteth, more than over ninety and nine just persons, which need no repentance.* The Good Shepherd''s joy over the recovered is the heart of the shepherd of repentance in hermas 5:1.'
  FROM cross_reference_threads t, cross_references x, _session253_herm5_lookup sv, _session253_herm5_lookup tv
 WHERE t.slug='hermas-5-shepherd-angel-of-repentance'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=15 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-5-keep-the-commandments
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 14:15 — *If ye love me, keep my commandments.* The shepherd''s call to keep and walk in the commandments with a pure heart in hermas 5:1 is the Messiah''s own measure of love.'
  FROM cross_reference_threads t, cross_references x, _session253_herm5_lookup sv, _session253_herm5_lookup tv
 WHERE t.slug='hermas-5-keep-the-commandments'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=14 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 John 5:3 — *For this is the love of Elohim (God), that we keep his commandments: and his commandments are not grievous.* The keeping the shepherd commands in hermas 5:1 is love made visible, the yoke that is not a burden.'
  FROM cross_reference_threads t, cross_references x, _session253_herm5_lookup sv, _session253_herm5_lookup tv
 WHERE t.slug='hermas-5-keep-the-commandments'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=5 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Malachi 4:4 — *Remember ye the law of Moses my servant, which I commanded unto him in Horeb for all Yashar''el (Israel), with the statutes and judgments.* The commandments Hermas is told to write and keep in hermas 5:1 are the same statutes and judgments that endure.'
  FROM cross_reference_threads t, cross_references x, _session253_herm5_lookup sv, _session253_herm5_lookup tv
 WHERE t.slug='hermas-5-keep-the-commandments'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 15:2 — *He that walketh uprightly, and worketh righteousness, and speaketh the truth in his heart.* The pure heart that walks in the commandments in hermas 5:1 is the dweller in Yahuah''s holy hill.'
  FROM cross_reference_threads t, cross_references x, _session253_herm5_lookup sv, _session253_herm5_lookup tv
 WHERE t.slug='hermas-5-keep-the-commandments'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=15 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-5-remember-whence-fallen
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 2:5 — *Remember therefore from whence thou art fallen, and repent, and do the first works; or else I will come unto thee quickly, and will remove thy candlestick out of his place, except thou repent.* The shepherd''s either-or of promise or its opposite in hermas 5:1 is the Messiah''s own charge to repent and do the first works.'
  FROM cross_reference_threads t, cross_references x, _session253_herm5_lookup sv, _session253_herm5_lookup tv
 WHERE t.slug='hermas-5-remember-whence-fallen'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=2 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 7:14 — *Because strait is the gate, and narrow is the way, which leadeth unto life, and few there be that find it.* The two outcomes the shepherd lays out in hermas 5:1 are the two ways: the narrow road of keeping, or its opposite.'
  FROM cross_reference_threads t, cross_references x, _session253_herm5_lookup sv, _session253_herm5_lookup tv
 WHERE t.slug='hermas-5-remember-whence-fallen'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 18:32 — *For I have no pleasure in the death of him that dieth, saith Adonai Yahuah (the Lord GOD): wherefore turn yourselves, and live ye.* The opposite that the unrepentant receive in hermas 5:1 is the death Yahuah takes no pleasure in — turn, and live.'
  FROM cross_reference_threads t, cross_references x, _session253_herm5_lookup sv, _session253_herm5_lookup tv
 WHERE t.slug='hermas-5-remember-whence-fallen'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=18 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_hermas_06.sql (session253 hermas 6) -----
-- Source anchor: lightfoot-apostolic-fathers/hermas ch6. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: herm6 (view _session253_herm6_lookup). Sort band base 71625, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_herm6_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: hermas-6-elohim-is-one
  ('lightfoot-apostolic-fathers', 'hermas', 6, 1, 'canon', 'deuteronomy', 6, 4, 'free', E'Deuteronomy 6:4 — *Hear, O Yashar''el (Israel): Yahuah Eloheinu (The LORD our God) is one Yahuah (LORD):* The Shepherd''s first command to believe Elohim is One is the Shema verbatim behind Hermas 6:1.'),
  ('lightfoot-apostolic-fathers', 'hermas', 6, 1, 'canon', 'mark', 12, 29, 'free', E'Mark 12:29 — *And Yahusha (Jesus) answered him, The first of all the commandments is, Hear, O Yashar''el (Israel); Yahuah Eloheinu (The Lord our God) is one Yahuah (Lord):* The Messiah names the same confession ''first of all,'' exactly as Hermas 6:1 sets it ''first of all.'''),
  ('lightfoot-apostolic-fathers', 'hermas', 6, 1, 'canon', 'isaiah', 45, 5, 'free', E'Isaiah 45:5 — *I am Yahuah (LORD), and there is none else, there is no Elohim (God) beside me: I girded thee, though thou hast not known me:* Isaiah''s ''none else'' undergirds the Mandate''s belief that Elohim is One in Hermas 6:1.'),
  ('lightfoot-apostolic-fathers', 'hermas', 6, 1, 'canon', '1-john', 5, 1, 'free', E'1 John 5:1 — *Whosoever believeth that Yahusha (Jesus) is the Messiah (Christ) is born of Elohim (God): and every one that loveth him that begat loveth him also that is begotten of him.* The new birth springs from this same believing that the Shepherd commands first in Hermas 6:1.'),
  -- thread: hermas-6-created-from-nothing
  ('lightfoot-apostolic-fathers', 'hermas', 6, 1, 'apocrypha', '2-maccabees', 7, 28, 'extras', E'2 Maccabees 7:28 — *I beseech you, my son, look upon the heaven and the earth, and all that is in it, and consider that Yahuah (God) made them of things that were not; and so was mankind made likewise.* The martyr-mother''s ''made them of things that were not'' is the same creation ''from non-existence into being'' in Hermas 6:1.'),
  ('lightfoot-apostolic-fathers', 'hermas', 6, 1, 'canon', 'nehemiah', 9, 6, 'free', E'Nehemiah 9:6 — *Thou, even thou, art Yahuah (LORD) alone; thou hast made heaven, the heaven of heavens, with all their host, the earth, and all things that are therein, the seas, and all that is therein, and thou preservest them all; and the host of heaven worshippeth thee.* The Levites'' sole Maker of ''all things'' matches the Mandate''s One who created and orders all things in Hermas 6:1.'),
  ('lightfoot-apostolic-fathers', 'hermas', 6, 1, 'canon', 'psalms', 33, 6, 'free', E'Psalms 33:6 — *By the word of Yahuah (LORD) were the heavens made; and all the host of them by the breath of his mouth.* The Psalm gives the means of the Mandate''s bringing-into-being, the word and breath behind Hermas 6:1.'),
  ('lightfoot-apostolic-fathers', 'hermas', 6, 1, 'canon', 'hebrews', 11, 3, 'free', E'Hebrews 11:3 — *Through faith we understand that the worlds were framed by the word of Elohim (God), so that things which are seen were not made of things which do appear.* Hebrews makes creation from the unseen the content of the very faith the Shepherd commands in Hermas 6:1.'),
  -- thread: hermas-6-fear-and-keep-the-commandment
  ('lightfoot-apostolic-fathers', 'hermas', 6, 1, 'canon', 'deuteronomy', 10, 12, 'free', E'Deuteronomy 10:12 — *And now, Yashar''el (Israel), what doth Yahuah Elohayka (the LORD thy God) require of thee, but to fear Yahuah Elohayka (the LORD thy God), to walk in all his ways, and to love him, and to serve Yahuah Elohayka (the LORD thy God) with all thy heart and with all thy soul,* Moses'' ''fear and walk and serve'' is the same charge the Shepherd compresses into fear-and-keep-the-commandment in Hermas 6:1.'),
  ('lightfoot-apostolic-fathers', 'hermas', 6, 1, 'canon', 'psalms', 111, 10, 'free', E'Psalms 111:10 — *The fear of Yahuah (LORD) is the beginning of wisdom: a good understanding have all they that do his commandments: his praise endureth for ever.* The Psalm joins the fear of Yahuah to doing the commandments, the exact pairing of fear-then-keep in Hermas 6:1.'),
  ('lightfoot-apostolic-fathers', 'hermas', 6, 1, 'canon', 'john', 14, 15, 'free', E'John 14:15 — *If ye love me, keep my commandments.* The Messiah ties love to commandment-keeping just as the Mandate makes life unto Elohim hang on ''if thou keep this commandment'' in Hermas 6:1.'),
  ('lightfoot-apostolic-fathers', 'hermas', 6, 1, 'canon', '1-john', 5, 3, 'free', E'1 John 5:3 — *For this is the love of Elohim (God), that we keep his commandments: and his commandments are not grievous.* John shows the commandment the Shepherd urges is not a burden but the love that lives unto Elohim in Hermas 6:1.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_herm6_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_herm6_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-6-elohim-is-one',
       E'Believe that Elohim is One',
       E'The first Mandate opens with the Shema itself: *‘First of all, believe that Elohim (God) is One, even He Who created all things and set them in order... Who comprehendeth all things, being alone incomprehensible.’* (Hermas 6:1). It ain''t new — the Shepherd is reciting Moses: *Hear, O Yashar''el (Israel): Yahuah Eloheinu (The LORD our God) is one Yahuah (LORD):* (Deuteronomy 6:4). When the scribe asked the Messiah the first commandment of all, He gave back the same word: *And Yahusha (Jesus) answered him, The first of all the commandments is, Hear, O Yashar''el (Israel); Yahuah Eloheinu (The Lord our God) is one Yahuah (Lord):* (Mark 12:29). Isaiah seals the confession of the One beside whom there is no other: *I am Yahuah (LORD), and there is none else, there is no Elohim (God) beside me: I girded thee, though thou hast not known me:* (Isaiah 45:5). And John makes belief the door of the new birth — election before confession: *Whosoever believeth that Yahusha (Jesus) is the Messiah (Christ) is born of Elohim (God): and every one that loveth him that begat loveth him also that is begotten of him.* (1 John 5:1).',
       sv.verse_id, ev.verse_id, 'extras', 71625
  FROM _session253_herm6_lookup sv, _session253_herm6_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=6 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=6 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-6-created-from-nothing',
       E'Who created all things from non-existence',
       E'The Mandate confesses the Maker who *created all things and set them in order, and brought all things from non-existence into being* (Hermas 6:1) — the doctrine of creation out of nothing. The mother of the Maccabean martyrs preached the very same to her son before his death: *I beseech you, my son, look upon the heaven and the earth, and all that is in it, and consider that Yahuah (God) made them of things that were not; and so was mankind made likewise.* (2 Maccabees 7:28). Nehemiah''s Levites bless the same sole Maker: *Thou, even thou, art Yahuah (LORD) alone; thou hast made heaven, the heaven of heavens, with all their host... and thou preservest them all; and the host of heaven worshippeth thee.* (Nehemiah 9:6). The Psalm names the means — His word and breath: *By the word of Yahuah (LORD) were the heavens made; and all the host of them by the breath of his mouth.* (Psalms 33:6). And Hebrews calls it the very content of faith: *Through faith we understand that the worlds were framed by the word of Elohim (God), so that things which are seen were not made of things which do appear.* (Hebrews 11:3).',
       sv.verse_id, ev.verse_id, 'extras', 71628
  FROM _session253_herm6_lookup sv, _session253_herm6_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=6 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=6 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-6-fear-and-keep-the-commandment',
       E'Fear Him and keep the commandment, and live',
       E'The Mandate turns belief into walk: *Believe Him therefore, and fear Him, and in this fear be continent. Keep these things... and shalt clothe thyself with every excellence of righteousness, and shalt live unto Elohim (God), if thou keep this commandment.* (Hermas 6:1). This is Moses'' summary of the whole way: *And now, Yashar''el (Israel), what doth Yahuah Elohayka (the LORD thy God) require of thee, but to fear Yahuah Elohayka (the LORD thy God), to walk in all his ways, and to love him, and to serve Yahuah Elohayka (the LORD thy God) with all thy heart and with all thy soul,* (Deuteronomy 10:12). The fear that the Shepherd makes the start of continence the Psalm makes the start of wisdom, joined to doing the commandments: *The fear of Yahuah (LORD) is the beginning of wisdom: a good understanding have all they that do his commandments: his praise endureth for ever.* (Psalms 111:10). The Messiah bound love and keeping together: *If ye love me, keep my commandments.* (John 14:15) — and John testifies the commandments are no burden: *For this is the love of Elohim (God), that we keep his commandments: and his commandments are not grievous.* (1 John 5:3). The commandment stands; to keep it is to live unto Elohim.',
       sv.verse_id, ev.verse_id, 'extras', 71631
  FROM _session253_herm6_lookup sv, _session253_herm6_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=6 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=6 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: hermas-6-elohim-is-one
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 6:4 — *Hear, O Yashar''el (Israel): Yahuah Eloheinu (The LORD our God) is one Yahuah (LORD):* The Shepherd''s first command to believe Elohim is One is the Shema verbatim behind Hermas 6:1.'
  FROM cross_reference_threads t, cross_references x, _session253_herm6_lookup sv, _session253_herm6_lookup tv
 WHERE t.slug='hermas-6-elohim-is-one'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=6 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Mark 12:29 — *And Yahusha (Jesus) answered him, The first of all the commandments is, Hear, O Yashar''el (Israel); Yahuah Eloheinu (The Lord our God) is one Yahuah (Lord):* The Messiah names the same confession ''first of all,'' exactly as Hermas 6:1 sets it ''first of all.'''
  FROM cross_reference_threads t, cross_references x, _session253_herm6_lookup sv, _session253_herm6_lookup tv
 WHERE t.slug='hermas-6-elohim-is-one'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=6 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=12 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 45:5 — *I am Yahuah (LORD), and there is none else, there is no Elohim (God) beside me: I girded thee, though thou hast not known me:* Isaiah''s ''none else'' undergirds the Mandate''s belief that Elohim is One in Hermas 6:1.'
  FROM cross_reference_threads t, cross_references x, _session253_herm6_lookup sv, _session253_herm6_lookup tv
 WHERE t.slug='hermas-6-elohim-is-one'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=6 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=45 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 John 5:1 — *Whosoever believeth that Yahusha (Jesus) is the Messiah (Christ) is born of Elohim (God): and every one that loveth him that begat loveth him also that is begotten of him.* The new birth springs from this same believing that the Shepherd commands first in Hermas 6:1.'
  FROM cross_reference_threads t, cross_references x, _session253_herm6_lookup sv, _session253_herm6_lookup tv
 WHERE t.slug='hermas-6-elohim-is-one'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=6 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=5 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-6-created-from-nothing
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Maccabees 7:28 — *I beseech you, my son, look upon the heaven and the earth, and all that is in it, and consider that Yahuah (God) made them of things that were not; and so was mankind made likewise.* The martyr-mother''s ''made them of things that were not'' is the same creation ''from non-existence into being'' in Hermas 6:1.'
  FROM cross_reference_threads t, cross_references x, _session253_herm6_lookup sv, _session253_herm6_lookup tv
 WHERE t.slug='hermas-6-created-from-nothing'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=6 AND sv.verse_number=1
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=7 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Nehemiah 9:6 — *Thou, even thou, art Yahuah (LORD) alone; thou hast made heaven, the heaven of heavens, with all their host, the earth, and all things that are therein, the seas, and all that is therein, and thou preservest them all; and the host of heaven worshippeth thee.* The Levites'' sole Maker of ''all things'' matches the Mandate''s One who created and orders all things in Hermas 6:1.'
  FROM cross_reference_threads t, cross_references x, _session253_herm6_lookup sv, _session253_herm6_lookup tv
 WHERE t.slug='hermas-6-created-from-nothing'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=6 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=9 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalms 33:6 — *By the word of Yahuah (LORD) were the heavens made; and all the host of them by the breath of his mouth.* The Psalm gives the means of the Mandate''s bringing-into-being, the word and breath behind Hermas 6:1.'
  FROM cross_reference_threads t, cross_references x, _session253_herm6_lookup sv, _session253_herm6_lookup tv
 WHERE t.slug='hermas-6-created-from-nothing'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=6 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=33 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hebrews 11:3 — *Through faith we understand that the worlds were framed by the word of Elohim (God), so that things which are seen were not made of things which do appear.* Hebrews makes creation from the unseen the content of the very faith the Shepherd commands in Hermas 6:1.'
  FROM cross_reference_threads t, cross_references x, _session253_herm6_lookup sv, _session253_herm6_lookup tv
 WHERE t.slug='hermas-6-created-from-nothing'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=6 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-6-fear-and-keep-the-commandment
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 10:12 — *And now, Yashar''el (Israel), what doth Yahuah Elohayka (the LORD thy God) require of thee, but to fear Yahuah Elohayka (the LORD thy God), to walk in all his ways, and to love him, and to serve Yahuah Elohayka (the LORD thy God) with all thy heart and with all thy soul,* Moses'' ''fear and walk and serve'' is the same charge the Shepherd compresses into fear-and-keep-the-commandment in Hermas 6:1.'
  FROM cross_reference_threads t, cross_references x, _session253_herm6_lookup sv, _session253_herm6_lookup tv
 WHERE t.slug='hermas-6-fear-and-keep-the-commandment'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=6 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=10 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 111:10 — *The fear of Yahuah (LORD) is the beginning of wisdom: a good understanding have all they that do his commandments: his praise endureth for ever.* The Psalm joins the fear of Yahuah to doing the commandments, the exact pairing of fear-then-keep in Hermas 6:1.'
  FROM cross_reference_threads t, cross_references x, _session253_herm6_lookup sv, _session253_herm6_lookup tv
 WHERE t.slug='hermas-6-fear-and-keep-the-commandment'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=6 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=111 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 14:15 — *If ye love me, keep my commandments.* The Messiah ties love to commandment-keeping just as the Mandate makes life unto Elohim hang on ''if thou keep this commandment'' in Hermas 6:1.'
  FROM cross_reference_threads t, cross_references x, _session253_herm6_lookup sv, _session253_herm6_lookup tv
 WHERE t.slug='hermas-6-fear-and-keep-the-commandment'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=6 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=14 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 John 5:3 — *For this is the love of Elohim (God), that we keep his commandments: and his commandments are not grievous.* John shows the commandment the Shepherd urges is not a burden but the love that lives unto Elohim in Hermas 6:1.'
  FROM cross_reference_threads t, cross_references x, _session253_herm6_lookup sv, _session253_herm6_lookup tv
 WHERE t.slug='hermas-6-fear-and-keep-the-commandment'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=6 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=5 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_hermas_07.sql (session253 hermas 7) -----
-- Source anchor: lightfoot-apostolic-fathers/hermas ch7. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: herm7 (view _session253_herm7_lookup). Sort band base 71650, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_herm7_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: hermas-7-speak-evil-of-no-man
  ('lightfoot-apostolic-fathers', 'hermas', 7, 1, 'canon', 'leviticus', 19, 16, 'free', E'Leviticus 19:16 — *Thou shalt not go up and down as a talebearer among thy people: neither shalt thou stand against the blood of thy neighbour: I am Yahuah (LORD).* The Torah''s ban on the talebearer is the very commandment Hermas 7:1 calls keeping, naming slander a restless demon.'),
  ('lightfoot-apostolic-fathers', 'hermas', 7, 1, 'canon', 'psalms', 15, 3, 'free', E'Psalms 15:3 — *He that backbiteth not with his tongue, nor doeth evil to his neighbour, nor taketh up a reproach against his neighbour.* The one who dwells in Yahuah''s holy hill refuses the backbiting that Hermas 7:1 calls the home of factions.'),
  ('lightfoot-apostolic-fathers', 'hermas', 7, 1, 'canon', 'james', 4, 11, 'free', E'James 4:11 — *Speak not evil one of another, brethren. He that speaketh evil of his brother, and judgeth his brother, speaketh evil of the law, and judgeth the law: but if thou judge the law, thou art not a doer of the law, but a judge.* James binds the slanderer to the standing law, the same Torah-honoring guard Hermas 7:1 lays on the tongue.'),
  ('lightfoot-apostolic-fathers', 'hermas', 7, 1, 'canon', 'ephesians', 4, 29, 'free', E'Ephesians 4:29 — *Let no corrupt communication proceed out of your mouth, but that which is good to the use of edifying, that it may minister grace unto the hearers.* Paul''s clean speech is the positive of Hermas 7:1''s refraining from slander, the mouth made smooth and gladsome.'),
  -- thread: hermas-7-grudge-against-thy-brother
  ('lightfoot-apostolic-fathers', 'hermas', 7, 1, 'canon', 'leviticus', 19, 18, 'free', E'Leviticus 19:18 — *Thou shalt not avenge, nor bear any grudge against the children of thy people, but thou shalt love thy neighbour as thyself: I am Yahuah (LORD).* Hermas 7:1 warns that the believed slander breeds a grudge against thy brother — the exact thing Torah forbids, commanding love instead.'),
  ('lightfoot-apostolic-fathers', 'hermas', 7, 1, 'canon', 'leviticus', 19, 17, 'free', E'Leviticus 19:17 — *Thou shalt not hate thy brother in thine heart: thou shalt in any wise rebuke thy neighbour, and not suffer sin upon him.* The heart-level guard against hating a brother answers Hermas 7:1''s caution that listening to slander makes thee responsible for the sin.'),
  ('lightfoot-apostolic-fathers', 'hermas', 7, 1, 'canon', 'romans', 14, 10, 'free', E'Romans 14:10 — *But why dost thou judge thy brother? or why dost thou set at nought thy brother? for we shall all stand before the judgment seat of Messiah (Christ).* Paul forbids the brother-judging a believed slander produces, the grudge Hermas 7:1 calls sin in the hearer.'),
  ('lightfoot-apostolic-fathers', 'hermas', 7, 1, 'canon', 'matthew', 7, 1, 'free', E'Matthew 7:1 — *Judge not, that ye be not judged.* The Master''s word against judging undergirds Hermas 7:1''s refusal to take up a grudge against a brother on a slanderer''s word.'),
  -- thread: hermas-7-give-to-all-freely
  ('lightfoot-apostolic-fathers', 'hermas', 7, 1, 'canon', 'deuteronomy', 15, 10, 'free', E'Deuteronomy 15:10 — *Thou shalt surely give him, and thine heart shall not be grieved when thou givest unto him: because that for this thing Yahuah Elohayka (the LORD thy God) shall bless thee in all thy works, and in all that thou puttest thine hand unto.* The Torah''s ungrudging open hand is the freely-give commandment Hermas 7:1 calls glorious in the sight of Elohim.'),
  ('lightfoot-apostolic-fathers', 'hermas', 7, 1, 'canon', 'luke', 6, 30, 'free', E'Luke 6:30 — *Give to every man that asketh of thee; and of him that taketh away thy goods ask them not again.* The Master''s unmeasured giving matches Hermas 7:1''s charge to give to all in want, making no distinction to whom.'),
  ('lightfoot-apostolic-fathers', 'hermas', 7, 1, 'canon', '2-corinthians', 9, 7, 'free', E'2 Corinthians 9:7 — *Every man according as he purposeth in his heart, so let him give; not grudgingly, or of necessity: for Elohim (God) loveth a cheerful giver.* Paul names the sincere, ungrudging heart Hermas 7:1 calls the ministration glorious before Elohim.'),
  ('lightfoot-apostolic-fathers', 'hermas', 7, 1, 'canon', 'luke', 6, 38, 'free', E'Luke 6:38 — *Give, and it shall be given unto you; good measure, pressed down, and shaken together, and running over, shall men give into your bosom. For with the same measure that ye mete withal it shall be measured to you again.* The Master''s promise of overflowing return crowns Hermas 7:1''s call to give freely of Elohim''s own bounties.'),
  -- thread: hermas-7-render-an-account
  ('lightfoot-apostolic-fathers', 'hermas', 7, 1, 'canon', 'romans', 14, 12, 'free', E'Romans 14:12 — *So then every one of us shall give account of himself to Elohim (God).* Paul''s universal reckoning is the account Hermas 7:1 says both giver and receiver shall render to Elohim.'),
  ('lightfoot-apostolic-fathers', 'hermas', 7, 1, 'canon', 'matthew', 7, 17, 'free', E'Matthew 7:17 — *Even so every good tree bringeth forth good fruit; but a corrupt tree bringeth forth evil fruit.* The good fruit of a pure heart answers Hermas 7:1''s call to work that which is good and keep the commandment sincerely.'),
  ('lightfoot-apostolic-fathers', 'hermas', 7, 1, 'canon', 'matthew', 7, 24, 'free', E'Matthew 7:24 — *Therefore whosoever heareth these sayings of mine, and doeth them, I will liken him unto a wise man, which built his house upon a rock.* The Master commends the doer, not the hearer only, just as Hermas 7:1 charges to keep this commandment as told.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_herm7_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_herm7_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-7-speak-evil-of-no-man',
       E'Slander the restless demon — speak evil of no man',
       E'The Shepherd''s Second Mandate sets a guard on the tongue: *‘First of all, speak evil of no man, neither take pleasure in listening to a slanderer... Slander is evil; it is a restless demon, never at peace, but always having its home among factions. Refrain from it therefore, and thou shalt have success at all times with all men.’* It ain''t new — the Torah forbade the talebearer long before: *Thou shalt not go up and down as a talebearer among thy people: neither shalt thou stand against the blood of thy neighbour: I am Yahuah (LORD)* (Leviticus 19:16), and barred the backbiter from the holy hill: *He that backbiteth not with his tongue, nor doeth evil to his neighbour, nor taketh up a reproach against his neighbour* (Psalms 15:3). James carries the same everlasting commandment into the assembly, binding the tongue to the standing law: *Speak not evil one of another, brethren. He that speaketh evil of his brother, and judgeth his brother, speaketh evil of the law, and judgeth the law* (James 4:11), and Paul echoes the clean mouth: *Let no corrupt communication proceed out of your mouth, but that which is good to the use of edifying, that it may minister grace unto the hearers* (Ephesians 4:29). The commandment stands.',
       sv.verse_id, ev.verse_id, 'extras', 71650
  FROM _session253_herm7_lookup sv, _session253_herm7_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=7 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=7 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-7-grudge-against-thy-brother',
       E'Believe not the slander — bear no grudge against thy brother',
       E'Hermas warns that the hearer shares the slanderer''s sin: *‘Otherwise thou that hearest too shalt be responsible for the sin of him that speaketh the evil, if thou believest the slander, which thou hearest; for in believing it thou thyself also wilt have a grudge against thy brother.’* The Torah already joined the inward grudge to the outward duty of love: *Thou shalt not avenge, nor bear any grudge against the children of thy people, but thou shalt love thy neighbour as thyself: I am Yahuah (LORD)* (Leviticus 19:18); and *Thou shalt not hate thy brother in thine heart: thou shalt in any wise rebuke thy neighbour, and not suffer sin upon him* (Leviticus 19:17). Paul forbids the very judging that a believed slander breeds: *But why dost thou judge thy brother? or why dost thou set at nought thy brother? for we shall all stand before the judgment seat of Messiah (Christ)* (Romans 14:10), as the Master taught: *Judge not, that ye be not judged* (Matthew 7:1). It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 71653
  FROM _session253_herm7_lookup sv, _session253_herm7_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=7 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=7 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-7-give-to-all-freely',
       E'Give to all freely — the cheerful giver and the account',
       E'The Mandate turns to almsgiving: *‘Work that which is good, and of thy labours, which Elohim (God) giveth thee, give to all that are in want freely, not questioning to whom thou shalt give... Give to all; for to all Elohim (God) desireth that there should be given of His own bounties... He then that giveth is guiltless... in sincerity, by making no distinction to whom to give or not to give.’* This is no new ethic. The Torah commanded the open hand: *Thou shalt surely give him, and thine heart shall not be grieved when thou givest unto him: because that for this thing Yahuah Elohayka (the LORD thy God) shall bless thee in all thy works* (Deuteronomy 15:10). The Master taught the same unmeasured giving: *Give to every man that asketh of thee; and of him that taketh away thy goods ask them not again* (Luke 6:30), with the promise *Give, and it shall be given unto you; good measure, pressed down, and shaken together, and running over, shall men give into your bosom* (Luke 6:38). And Paul names the heart Hermas commends: *Every man according as he purposeth in his heart, so let him give; not grudgingly, or of necessity: for Elohim (God) loveth a cheerful giver* (2 Corinthians 9:7). It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 71656
  FROM _session253_herm7_lookup sv, _session253_herm7_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=7 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=7 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-7-render-an-account',
       E'They shall render an account — keep this commandment, repent sincerely',
       E'Hermas grounds giving in the coming reckoning and seals the Mandate with repentance: *‘They then that receive shall render an account to Elohim (God) why they received it, and to what end; for they that receive in distress shall not be judged, but they that receive by false pretence shall pay the penalty... Therefore keep this commandment, as I have told thee, that thine own repentance and that of thy household may be found to be sincere, and [thy] heart pure and undefiled.’* Paul speaks the same universal account: *So then every one of us shall give account of himself to Elohim (God)* (Romans 14:12). The good tree must bear good fruit: *Even so every good tree bringeth forth good fruit; but a corrupt tree bringeth forth evil fruit* (Matthew 7:17). And keeping the commandment is the path of the doers, not the mere hearers: *Therefore whosoever heareth these sayings of mine, and doeth them, I will liken him unto a wise man, which built his house upon a rock* (Matthew 7:24). The commandment stands, and the heart pure and undefiled is the fruit of sincere repentance.',
       sv.verse_id, ev.verse_id, 'extras', 71659
  FROM _session253_herm7_lookup sv, _session253_herm7_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=7 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=7 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: hermas-7-speak-evil-of-no-man
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 19:16 — *Thou shalt not go up and down as a talebearer among thy people: neither shalt thou stand against the blood of thy neighbour: I am Yahuah (LORD).* The Torah''s ban on the talebearer is the very commandment Hermas 7:1 calls keeping, naming slander a restless demon.'
  FROM cross_reference_threads t, cross_references x, _session253_herm7_lookup sv, _session253_herm7_lookup tv
 WHERE t.slug='hermas-7-speak-evil-of-no-man'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 15:3 — *He that backbiteth not with his tongue, nor doeth evil to his neighbour, nor taketh up a reproach against his neighbour.* The one who dwells in Yahuah''s holy hill refuses the backbiting that Hermas 7:1 calls the home of factions.'
  FROM cross_reference_threads t, cross_references x, _session253_herm7_lookup sv, _session253_herm7_lookup tv
 WHERE t.slug='hermas-7-speak-evil-of-no-man'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=15 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'James 4:11 — *Speak not evil one of another, brethren. He that speaketh evil of his brother, and judgeth his brother, speaketh evil of the law, and judgeth the law: but if thou judge the law, thou art not a doer of the law, but a judge.* James binds the slanderer to the standing law, the same Torah-honoring guard Hermas 7:1 lays on the tongue.'
  FROM cross_reference_threads t, cross_references x, _session253_herm7_lookup sv, _session253_herm7_lookup tv
 WHERE t.slug='hermas-7-speak-evil-of-no-man'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=4 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ephesians 4:29 — *Let no corrupt communication proceed out of your mouth, but that which is good to the use of edifying, that it may minister grace unto the hearers.* Paul''s clean speech is the positive of Hermas 7:1''s refraining from slander, the mouth made smooth and gladsome.'
  FROM cross_reference_threads t, cross_references x, _session253_herm7_lookup sv, _session253_herm7_lookup tv
 WHERE t.slug='hermas-7-speak-evil-of-no-man'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=4 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-7-grudge-against-thy-brother
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 19:18 — *Thou shalt not avenge, nor bear any grudge against the children of thy people, but thou shalt love thy neighbour as thyself: I am Yahuah (LORD).* Hermas 7:1 warns that the believed slander breeds a grudge against thy brother — the exact thing Torah forbids, commanding love instead.'
  FROM cross_reference_threads t, cross_references x, _session253_herm7_lookup sv, _session253_herm7_lookup tv
 WHERE t.slug='hermas-7-grudge-against-thy-brother'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 19:17 — *Thou shalt not hate thy brother in thine heart: thou shalt in any wise rebuke thy neighbour, and not suffer sin upon him.* The heart-level guard against hating a brother answers Hermas 7:1''s caution that listening to slander makes thee responsible for the sin.'
  FROM cross_reference_threads t, cross_references x, _session253_herm7_lookup sv, _session253_herm7_lookup tv
 WHERE t.slug='hermas-7-grudge-against-thy-brother'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 14:10 — *But why dost thou judge thy brother? or why dost thou set at nought thy brother? for we shall all stand before the judgment seat of Messiah (Christ).* Paul forbids the brother-judging a believed slander produces, the grudge Hermas 7:1 calls sin in the hearer.'
  FROM cross_reference_threads t, cross_references x, _session253_herm7_lookup sv, _session253_herm7_lookup tv
 WHERE t.slug='hermas-7-grudge-against-thy-brother'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=14 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 7:1 — *Judge not, that ye be not judged.* The Master''s word against judging undergirds Hermas 7:1''s refusal to take up a grudge against a brother on a slanderer''s word.'
  FROM cross_reference_threads t, cross_references x, _session253_herm7_lookup sv, _session253_herm7_lookup tv
 WHERE t.slug='hermas-7-grudge-against-thy-brother'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-7-give-to-all-freely
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 15:10 — *Thou shalt surely give him, and thine heart shall not be grieved when thou givest unto him: because that for this thing Yahuah Elohayka (the LORD thy God) shall bless thee in all thy works, and in all that thou puttest thine hand unto.* The Torah''s ungrudging open hand is the freely-give commandment Hermas 7:1 calls glorious in the sight of Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_herm7_lookup sv, _session253_herm7_lookup tv
 WHERE t.slug='hermas-7-give-to-all-freely'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=15 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 6:30 — *Give to every man that asketh of thee; and of him that taketh away thy goods ask them not again.* The Master''s unmeasured giving matches Hermas 7:1''s charge to give to all in want, making no distinction to whom.'
  FROM cross_reference_threads t, cross_references x, _session253_herm7_lookup sv, _session253_herm7_lookup tv
 WHERE t.slug='hermas-7-give-to-all-freely'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=6 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Corinthians 9:7 — *Every man according as he purposeth in his heart, so let him give; not grudgingly, or of necessity: for Elohim (God) loveth a cheerful giver.* Paul names the sincere, ungrudging heart Hermas 7:1 calls the ministration glorious before Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_herm7_lookup sv, _session253_herm7_lookup tv
 WHERE t.slug='hermas-7-give-to-all-freely'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=9 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Luke 6:38 — *Give, and it shall be given unto you; good measure, pressed down, and shaken together, and running over, shall men give into your bosom. For with the same measure that ye mete withal it shall be measured to you again.* The Master''s promise of overflowing return crowns Hermas 7:1''s call to give freely of Elohim''s own bounties.'
  FROM cross_reference_threads t, cross_references x, _session253_herm7_lookup sv, _session253_herm7_lookup tv
 WHERE t.slug='hermas-7-give-to-all-freely'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=6 AND tv.verse_number=38
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-7-render-an-account
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 14:12 — *So then every one of us shall give account of himself to Elohim (God).* Paul''s universal reckoning is the account Hermas 7:1 says both giver and receiver shall render to Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_herm7_lookup sv, _session253_herm7_lookup tv
 WHERE t.slug='hermas-7-render-an-account'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=14 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 7:17 — *Even so every good tree bringeth forth good fruit; but a corrupt tree bringeth forth evil fruit.* The good fruit of a pure heart answers Hermas 7:1''s call to work that which is good and keep the commandment sincerely.'
  FROM cross_reference_threads t, cross_references x, _session253_herm7_lookup sv, _session253_herm7_lookup tv
 WHERE t.slug='hermas-7-render-an-account'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 7:24 — *Therefore whosoever heareth these sayings of mine, and doeth them, I will liken him unto a wise man, which built his house upon a rock.* The Master commends the doer, not the hearer only, just as Hermas 7:1 charges to keep this commandment as told.'
  FROM cross_reference_threads t, cross_references x, _session253_herm7_lookup sv, _session253_herm7_lookup tv
 WHERE t.slug='hermas-7-render-an-account'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_hermas_08.sql (session253 hermas 8) -----
-- Source anchor: lightfoot-apostolic-fathers/hermas ch8. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: herm8 (view _session253_herm8_lookup). Sort band base 71675, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_herm8_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: hermas-8-love-truth-spirit-of-truth
  ('lightfoot-apostolic-fathers', 'hermas', 8, 1, 'canon', 'john', 14, 17, 'free', E'John 14:17 — *Even the Spirit of truth; whom the world cannot receive, because it seeth him not, neither knoweth him: but ye know him; for he dwelleth with you, and shall be in you.* The very Spirit of truth Hermas says Elohim made to dwell in the flesh is the Comforter the Messiah promised to abide in His own.'),
  ('lightfoot-apostolic-fathers', 'hermas', 8, 1, 'canon', 'ephesians', 4, 15, 'free', E'Ephesians 4:15 — *But speaking the truth in love, may grow up into him in all things, which is the head, even Messiah (Christ):* Paul''s ''speaking the truth in love'' is the same mandate Hermas receives — truth out of the mouth so the body grows up into the Head.'),
  ('lightfoot-apostolic-fathers', 'hermas', 8, 1, 'canon', 'zechariah', 8, 3, 'free', E'Zechariah 8:3 — *Thus saith Yahuah (LORD); I am returned unto Zion, and will dwell in the midst of Jerusalem: and Jerusalem shall be called a city of truth; and the mountain of Yahuah Tseva''ot (LORD of hosts) the holy mountain.* The Yahuah who ''dwelleth in thee'' and is true in every word is the same who returns to dwell in a city called by truth.'),
  -- thread: hermas-8-lying-defiles-the-commandment
  ('lightfoot-apostolic-fathers', 'hermas', 8, 1, 'canon', 'proverbs', 12, 22, 'free', E'Proverbs 12:22 — *Lying lips are abomination to Yahuah (LORD): but they that deal truly are his delight.* Hermas'' ''robbers of Yahuah'' who defile the commandment are the lying lips Yahuah calls abomination over against those who deal truly.'),
  ('lightfoot-apostolic-fathers', 'hermas', 8, 1, 'canon', 'ephesians', 4, 25, 'free', E'Ephesians 4:25 — *Wherefore putting away lying, speak every man truth with his neighbour: for we are members one of another.* The deposit of a spirit ''free from lies'' is kept exactly as Paul commands: put away lying and render truth to the neighbour.'),
  ('lightfoot-apostolic-fathers', 'hermas', 8, 1, 'canon', '1-john', 1, 6, 'free', E'1 John 1:6 — *If we say that we have fellowship with him, and walk in darkness, we lie, and do not the truth:* To return a lying spirit, as Hermas warns, is to claim fellowship while walking in darkness — to lie and not do the truth.'),
  -- thread: hermas-8-second-repentance-live-unto-god
  ('lightfoot-apostolic-fathers', 'hermas', 8, 1, 'canon', '1-john', 1, 9, 'free', E'1 John 1:9 — *If we confess our sins, he is faithful and just to forgive us our sins, and to cleanse us from all unrighteousness.* The Shepherd''s offer that past falsehoods become credible once truth is kept is the same faithful cleansing John promises the one who confesses.'),
  ('lightfoot-apostolic-fathers', 'hermas', 8, 1, 'canon', 'psalms', 51, 6, 'free', E'Psalms 51:6 — *Behold, thou desirest truth in the inward parts: and in the hidden part thou shalt make me to know wisdom.* Hermas weeping that he never spake a true word echoes David''s penitent confession that Yahuah desires truth in the inward parts.'),
  ('lightfoot-apostolic-fathers', 'hermas', 8, 1, 'canon', 'john', 14, 15, 'free', E'John 14:15 — *If ye love me, keep my commandments.* To ''hear this command'' and abstain from falsehood that one may ''live unto Elohim'' is exactly the love the Master measures by keeping His commandments.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_herm8_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_herm8_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-8-love-truth-spirit-of-truth',
       E'Mandate Three: love truth, that the Spirit of truth be found true',
       E'Mandate Three of the Shepherd is the command of truth: *Again he saith to me; ''Love truth, and let nothing but truth proceed out of thy mouth, that the Spirit which Elohim (God) made to dwell in this flesh, may be found true in the sight of all men; and thus shall Yahuah (Lord), Who dwelleth in thee, be glorified; for Yahuah (Lord) is true in every word, and with Him there is no falsehood.''* It ain''t new — the Master had already named that indwelling gift the Spirit of truth: *Even the Spirit of truth; whom the world cannot receive, because it seeth him not, neither knoweth him: but ye know him; for he dwelleth with you, and shall be in you.* (John 17 — given in John 14:17). Paul presses the same walk in the called: *But speaking the truth in love, may grow up into him in all things, which is the head, even Messiah (Christ):* (Ephesians 4:15), and Yahuah Himself is jealous for a city of truth: *I am returned unto Zion, and will dwell in the midst of Jerusalem: and Jerusalem shall be called a city of truth* (Zechariah 8:3). The commandment stands and the seed is kept; the Spirit of truth is no new thing.',
       sv.verse_id, ev.verse_id, 'extras', 71675
  FROM _session253_herm8_lookup sv, _session253_herm8_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=8 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=8 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-8-lying-defiles-the-commandment',
       E'Liars rob Yahuah and defile the commandment',
       E'Hermas warns that the lying spirit is theft of a holy deposit: *They therefore that speak lies set Yahuah (Lord) at nought, and become robbers of Yahuah (Lord), for they do not deliver up to Him the deposit which they received. For they received of Him a spirit free from lies. This if they shall return a lying spirit, they have defiled the commandment of Yahuah (Lord) and have become robbers.''* The canon ties lying lips to defilement of the commandment, never abolishing it: *Lying lips are abomination to Yahuah (LORD): but they that deal truly are his delight.* (Proverbs 12:22). Paul commands the same putting-away in the new man: *Wherefore putting away lying, speak every man truth with his neighbour: for we are members one of another.* (Ephesians 4:25). And John makes the walk the test of fellowship: *If we say that we have fellowship with him, and walk in darkness, we lie, and do not the truth:* (1 John 1:6). The commandment of truth is everlasting, not a curse to be loosed.',
       sv.verse_id, ev.verse_id, 'extras', 71678
  FROM _session253_herm8_lookup sv, _session253_herm8_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=8 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=8 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-8-second-repentance-live-unto-god',
       E'The second repentance: guard the command and live unto Elohim',
       E'When Hermas despairs of being saved for a life of deceit, the Shepherd offers the second repentance — guard the command now and the past is redeemed: *If thou keep these things, and from henceforward speak nothing but truth, thou shalt be able to secure life for thyself. And whosoever shall hear this command, and abstain from falsehood, that most pernicious habit, shall live unto Elohim (God).''* This is the gospel''s own door to the fallen, not a new thing: *If we confess our sins, he is faithful and just to forgive us our sins, and to cleanse us from all unrighteousness.* (1 John 1:9). The longing for truth in the inward parts is David''s after his fall: *Behold, thou desirest truth in the inward parts: and in the hidden part thou shalt make me to know wisdom.* (Psalms 51:6); and the keeping of the command is the love the Master named: *If ye love me, keep my commandments.* (John 14:15). Election precedes confession; the called are summoned to repent and live — never to a law made curse, but to the commandment that stands.',
       sv.verse_id, ev.verse_id, 'extras', 71681
  FROM _session253_herm8_lookup sv, _session253_herm8_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=8 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=8 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: hermas-8-love-truth-spirit-of-truth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 14:17 — *Even the Spirit of truth; whom the world cannot receive, because it seeth him not, neither knoweth him: but ye know him; for he dwelleth with you, and shall be in you.* The very Spirit of truth Hermas says Elohim made to dwell in the flesh is the Comforter the Messiah promised to abide in His own.'
  FROM cross_reference_threads t, cross_references x, _session253_herm8_lookup sv, _session253_herm8_lookup tv
 WHERE t.slug='hermas-8-love-truth-spirit-of-truth'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=8 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=14 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ephesians 4:15 — *But speaking the truth in love, may grow up into him in all things, which is the head, even Messiah (Christ):* Paul''s ''speaking the truth in love'' is the same mandate Hermas receives — truth out of the mouth so the body grows up into the Head.'
  FROM cross_reference_threads t, cross_references x, _session253_herm8_lookup sv, _session253_herm8_lookup tv
 WHERE t.slug='hermas-8-love-truth-spirit-of-truth'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=8 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=4 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Zechariah 8:3 — *Thus saith Yahuah (LORD); I am returned unto Zion, and will dwell in the midst of Jerusalem: and Jerusalem shall be called a city of truth; and the mountain of Yahuah Tseva''ot (LORD of hosts) the holy mountain.* The Yahuah who ''dwelleth in thee'' and is true in every word is the same who returns to dwell in a city called by truth.'
  FROM cross_reference_threads t, cross_references x, _session253_herm8_lookup sv, _session253_herm8_lookup tv
 WHERE t.slug='hermas-8-love-truth-spirit-of-truth'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=8 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=8 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-8-lying-defiles-the-commandment
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 12:22 — *Lying lips are abomination to Yahuah (LORD): but they that deal truly are his delight.* Hermas'' ''robbers of Yahuah'' who defile the commandment are the lying lips Yahuah calls abomination over against those who deal truly.'
  FROM cross_reference_threads t, cross_references x, _session253_herm8_lookup sv, _session253_herm8_lookup tv
 WHERE t.slug='hermas-8-lying-defiles-the-commandment'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=8 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=12 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ephesians 4:25 — *Wherefore putting away lying, speak every man truth with his neighbour: for we are members one of another.* The deposit of a spirit ''free from lies'' is kept exactly as Paul commands: put away lying and render truth to the neighbour.'
  FROM cross_reference_threads t, cross_references x, _session253_herm8_lookup sv, _session253_herm8_lookup tv
 WHERE t.slug='hermas-8-lying-defiles-the-commandment'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=8 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=4 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 John 1:6 — *If we say that we have fellowship with him, and walk in darkness, we lie, and do not the truth:* To return a lying spirit, as Hermas warns, is to claim fellowship while walking in darkness — to lie and not do the truth.'
  FROM cross_reference_threads t, cross_references x, _session253_herm8_lookup sv, _session253_herm8_lookup tv
 WHERE t.slug='hermas-8-lying-defiles-the-commandment'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=8 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-8-second-repentance-live-unto-god
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 John 1:9 — *If we confess our sins, he is faithful and just to forgive us our sins, and to cleanse us from all unrighteousness.* The Shepherd''s offer that past falsehoods become credible once truth is kept is the same faithful cleansing John promises the one who confesses.'
  FROM cross_reference_threads t, cross_references x, _session253_herm8_lookup sv, _session253_herm8_lookup tv
 WHERE t.slug='hermas-8-second-repentance-live-unto-god'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=8 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=1 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 51:6 — *Behold, thou desirest truth in the inward parts: and in the hidden part thou shalt make me to know wisdom.* Hermas weeping that he never spake a true word echoes David''s penitent confession that Yahuah desires truth in the inward parts.'
  FROM cross_reference_threads t, cross_references x, _session253_herm8_lookup sv, _session253_herm8_lookup tv
 WHERE t.slug='hermas-8-second-repentance-live-unto-god'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=8 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=51 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 14:15 — *If ye love me, keep my commandments.* To ''hear this command'' and abstain from falsehood that one may ''live unto Elohim'' is exactly the love the Master measures by keeping His commandments.'
  FROM cross_reference_threads t, cross_references x, _session253_herm8_lookup sv, _session253_herm8_lookup tv
 WHERE t.slug='hermas-8-second-repentance-live-unto-god'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=8 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=14 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_hermas_09.sql (session253 hermas 9) -----
-- Source anchor: lightfoot-apostolic-fathers/hermas ch9. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: herm9 (view _session253_herm9_lookup). Sort band base 71700, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_herm9_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: hermas-9-purity-of-heart-no-adultery
  ('lightfoot-apostolic-fathers', 'hermas', 9, 1, 'canon', 'matthew', 5, 28, 'free', E'Matthew 5:28 — *But I say unto you, That whosoever looketh on a woman to lust after her hath committed adultery with her already in his heart.* The Shepherd''s warning against the lustful thought entering the heart is the Master''s own teaching, not a new severity.'),
  ('lightfoot-apostolic-fathers', 'hermas', 9, 1, 'canon', 'ezekiel', 18, 6, 'free', E'Ezekiel 18:6 — *And hath not eaten upon the mountains, neither hath lifted up his eyes to the idols of the house of Yashar''el (Israel), neither hath defiled his neighbour’s wife, neither hath come near to a menstruous woman,* — the Torah''s portrait of the just man already names guarding the neighbour''s wife, the very purity Hermas is charged to keep.'),
  ('lightfoot-apostolic-fathers', 'hermas', 9, 1, 'canon', 'matthew', 5, 32, 'free', E'Matthew 5:32 — *But I say unto you, That whosoever shall put away his wife, saving for the cause of fornication, causeth her to commit adultery: and whosoever shall marry her that is divorced committeth adultery.* The Shepherd''s ruling that the man who divorces and then marries another likewise commits adultery is drawn straight from the Master''s word.'),
  -- thread: hermas-9-divorce-and-the-door-to-return
  ('lightfoot-apostolic-fathers', 'hermas', 9, 1, 'canon', 'matthew', 19, 9, 'free', E'Matthew 19:9 — *And I say unto you, Whosoever shall put away his wife, except it be for fornication, and shall marry another, committeth adultery: and whoso marrieth her which is put away doth commit adultery.* The Shepherd''s exact ruling — divorce for fornication, but remarriage is itself adultery — is the Master''s word verbatim in substance.'),
  ('lightfoot-apostolic-fathers', 'hermas', 9, 1, 'canon', '1-corinthians', 7, 11, 'free', E'1 Corinthians 7:11 — *But and if she depart, let her remain unmarried, or be reconciled to her husband: and let not the husband put away his wife.* Paul too holds the separated spouse single for the sake of reconciliation, just as the Shepherd bids the husband abide alone that the wife may return.'),
  ('lightfoot-apostolic-fathers', 'hermas', 9, 1, 'canon', 'ezekiel', 33, 11, 'free', E'Ezekiel 33:11 — *Say unto them, As I live, saith Adonai Yahuah (the Lord GOD), I have no pleasure in the death of the wicked; but that the wicked turn from his way and live: turn ye, turn ye from your evil ways; for why will ye die, O house of Yashar''el (Israel)?* The husband kept single so the penitent wife may be received mirrors Yahuah''s own desire that the sinner turn and live, not perish.'),
  -- thread: hermas-9-repentance-is-understanding
  ('lightfoot-apostolic-fathers', 'hermas', 9, 2, 'canon', 'luke', 15, 7, 'free', E'Luke 15:7 — *I say unto you, that likewise joy shall be in heaven over one sinner that repenteth, more than over ninety and nine just persons, which need no repentance.* The Shepherd''s praise of repentance as great understanding matches heaven''s own joy over the sinner who turns.'),
  ('lightfoot-apostolic-fathers', 'hermas', 9, 2, 'canon', 'ezekiel', 18, 30, 'free', E'Ezekiel 18:30 — *Therefore I will judge you, O house of Yashar''el (Israel), every one according to his ways, saith Adonai Yahuah (the Lord GOD). Repent, and turn yourselves from all your transgressions; so iniquity shall not be your ruin.* The very repentance the angel presides over is the prophet''s standing summons to Israel — it ain''t new.'),
  ('lightfoot-apostolic-fathers', 'hermas', 9, 2, 'canon', '2-peter', 3, 9, 'free', E'2 Peter 3:9 — *Yahuah (Lord) is not slack concerning his promise, as some men count slackness; but is longsuffering to us-ward, not willing that any should perish, but that all should come to repentance.* The understanding given to all who repent flows from Yahuah''s longsuffering, which aims that all come to repentance.'),
  -- thread: hermas-9-keep-my-commandments-and-live
  ('lightfoot-apostolic-fathers', 'hermas', 9, 2, 'canon', 'matthew', 19, 17, 'free', E'Matthew 19:17 — *And he said unto him, Why callest thou me good? there is none good but one, that is, Elohim (God): but if thou wilt enter into life, keep the commandments.* The Shepherd''s ''keep my commandments and walk in them and live'' is the Master''s own answer to the man who asked how to inherit life.'),
  ('lightfoot-apostolic-fathers', 'hermas', 9, 4, 'canon', 'deuteronomy', 30, 16, 'free', E'Deuteronomy 30:16 — *In that I command thee this day to love Yahuah Elohayka (the LORD thy God), to walk in his ways, and to keep his commandments and his statutes and his judgments, that thou mayest live and multiply: and Yahuah Elohayka (the LORD thy God) shall bless thee in the land whither thou goest to possess it.* Keeping the commandments unto life and remission is Moses'' covenant word, not a later invention — the commandments stand and bring life.'),
  ('lightfoot-apostolic-fathers', 'hermas', 9, 2, 'canon', '1-john', 5, 3, 'free', E'1 John 5:3 — *For this is the love of Elohim (God), that we keep his commandments: and his commandments are not grievous.* The Shepherd''s call to keep and walk in the commandments unto life is the apostle''s own measure of love — and far from grievous.'),
  ('lightfoot-apostolic-fathers', 'hermas', 9, 4, 'canon', 'john', 14, 15, 'free', E'John 14:15 — *If ye love me, keep my commandments.* The remission promised to those who keep the commandments and walk in purity rests on the Master''s binding of love to obedience.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_herm9_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_herm9_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-9-purity-of-heart-no-adultery',
       E'Look not on another''s wife — adultery of the heart',
       E'The Shepherd charges Hermas: *‘I charge thee,’ saith he, ‘to keep purity, and let not a thought enter into thy heart concerning another’s wife, or concerning fornication, or concerning any such like evil deeds; for in so doing thou committest a great sin. But remember thine own wife always, and thou shalt never go wrong.’* (Hermas 9:1) It ain''t new — the Master in the mountain reaches the same depth, sin conceived in the heart: *But I say unto you, That whosoever looketh on a woman to lust after her hath committed adultery with her already in his heart.* (Matthew 5:28) The Torah''s own measure of the righteous man is the man who *hath not... defiled his neighbour’s wife* (Ezekiel 18:6), and the holiness that drives out lawlessness is no later doctrine but the standing demand of the covenant.',
       sv.verse_id, ev.verse_id, 'extras', 71700
  FROM _session253_herm9_lookup sv, _session253_herm9_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=9 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=9 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-9-divorce-and-the-door-to-return',
       E'Let him abide alone, that she may repent and return',
       E'On the unfaithful wife the Shepherd rules: *‘Let him divorce her,’ saith he, ‘and let the husband abide alone: but if after divorcing his wife he shall marry another, he likewise committeth adultery.’* And then the open door: *‘Certainly,’ saith he, ‘if the husband receiveth her not, he sinneth and bringeth great sin upon himself; nay, one who hath sinned and repented must be received... For the sake of her repentance therefore the husband ought not to marry.’* (Hermas 9:1) This is no new law but the Master''s: *And I say unto you, Whosoever shall put away his wife, except it be for fornication, and shall marry another, committeth adultery* (Matthew 19:9). And the husband is held single precisely so the door of return stays open — for the heart of Yahuah is *I have no pleasure in the death of the wicked; but that the wicked turn from his way and live* (Ezekiel 33:11).',
       sv.verse_id, ev.verse_id, 'extras', 71703
  FROM _session253_herm9_lookup sv, _session253_herm9_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=9 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=9 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-9-repentance-is-understanding',
       E'To repent is great understanding',
       E'The angel set over repentance teaches: *‘To repent is great understanding,’ saith he. ‘For the man that hath sinned understandeth that he hath done evil before Yahuah (Lord), and the deed which he hath done entereth into his heart, and he repenteth, and doeth no more evil, but doeth good lavishly, and humbleth his own soul...’* (Hermas 9:2) It ain''t new — heaven itself rejoices at this turning: *I say unto you, that likewise joy shall be in heaven over one sinner that repenteth, more than over ninety and nine just persons, which need no repentance.* (Luke 15:7) And the prophet long before set the same call: *Repent, and turn yourselves from all your transgressions; so iniquity shall not be your ruin.* (Ezekiel 18:30) The longsuffering of Yahuah aims at nothing else: *not willing that any should perish, but that all should come to repentance.* (2 Peter 3:9)',
       sv.verse_id, ev.verse_id, 'extras', 71706
  FROM _session253_herm9_lookup sv, _session253_herm9_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=9 AND sv.verse_number=2
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=9 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-9-keep-my-commandments-and-live',
       E'Keep my commandments, walk in them, and live',
       E'The Shepherd''s promise hangs on obedience: *‘Thou shalt live,’ saith he, ‘if thou keep my commandments and walk in them; and whosoever shall hear these commandments and keep them, shall live unto Elohim (God).’* (Hermas 9:2) And again at the close: *‘But for thy former transgressions there shall be remission, if thou keepest my com- mandments. Yea, and all shall have remission, if they keep these my commandments, and walk in this purity.’* (Hermas 9:4) It ain''t new — this is Moses'' own life-set-before-you: *See, I have set before thee this day life and good, and death and evil* (Deuteronomy 30:15), and the Master''s plain word: *but if thou wilt enter into life, keep the commandments* (Matthew 19:17). The beloved disciple says the same — *For this is the love of Elohim (God), that we keep his commandments: and his commandments are not grievous* (1 John 5:3) — and the Master ties love itself to obedience: *If ye love me, keep my commandments* (John 14:15). The commandments stand; they are never the curse.',
       sv.verse_id, ev.verse_id, 'extras', 71709
  FROM _session253_herm9_lookup sv, _session253_herm9_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=9 AND sv.verse_number=2
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=9 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: hermas-9-purity-of-heart-no-adultery
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 5:28 — *But I say unto you, That whosoever looketh on a woman to lust after her hath committed adultery with her already in his heart.* The Shepherd''s warning against the lustful thought entering the heart is the Master''s own teaching, not a new severity.'
  FROM cross_reference_threads t, cross_references x, _session253_herm9_lookup sv, _session253_herm9_lookup tv
 WHERE t.slug='hermas-9-purity-of-heart-no-adultery'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=9 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 18:6 — *And hath not eaten upon the mountains, neither hath lifted up his eyes to the idols of the house of Yashar''el (Israel), neither hath defiled his neighbour’s wife, neither hath come near to a menstruous woman,* — the Torah''s portrait of the just man already names guarding the neighbour''s wife, the very purity Hermas is charged to keep.'
  FROM cross_reference_threads t, cross_references x, _session253_herm9_lookup sv, _session253_herm9_lookup tv
 WHERE t.slug='hermas-9-purity-of-heart-no-adultery'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=9 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=18 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 5:32 — *But I say unto you, That whosoever shall put away his wife, saving for the cause of fornication, causeth her to commit adultery: and whosoever shall marry her that is divorced committeth adultery.* The Shepherd''s ruling that the man who divorces and then marries another likewise commits adultery is drawn straight from the Master''s word.'
  FROM cross_reference_threads t, cross_references x, _session253_herm9_lookup sv, _session253_herm9_lookup tv
 WHERE t.slug='hermas-9-purity-of-heart-no-adultery'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=9 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-9-divorce-and-the-door-to-return
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 19:9 — *And I say unto you, Whosoever shall put away his wife, except it be for fornication, and shall marry another, committeth adultery: and whoso marrieth her which is put away doth commit adultery.* The Shepherd''s exact ruling — divorce for fornication, but remarriage is itself adultery — is the Master''s word verbatim in substance.'
  FROM cross_reference_threads t, cross_references x, _session253_herm9_lookup sv, _session253_herm9_lookup tv
 WHERE t.slug='hermas-9-divorce-and-the-door-to-return'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=9 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=19 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Corinthians 7:11 — *But and if she depart, let her remain unmarried, or be reconciled to her husband: and let not the husband put away his wife.* Paul too holds the separated spouse single for the sake of reconciliation, just as the Shepherd bids the husband abide alone that the wife may return.'
  FROM cross_reference_threads t, cross_references x, _session253_herm9_lookup sv, _session253_herm9_lookup tv
 WHERE t.slug='hermas-9-divorce-and-the-door-to-return'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=9 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=7 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 33:11 — *Say unto them, As I live, saith Adonai Yahuah (the Lord GOD), I have no pleasure in the death of the wicked; but that the wicked turn from his way and live: turn ye, turn ye from your evil ways; for why will ye die, O house of Yashar''el (Israel)?* The husband kept single so the penitent wife may be received mirrors Yahuah''s own desire that the sinner turn and live, not perish.'
  FROM cross_reference_threads t, cross_references x, _session253_herm9_lookup sv, _session253_herm9_lookup tv
 WHERE t.slug='hermas-9-divorce-and-the-door-to-return'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=9 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=33 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-9-repentance-is-understanding
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Luke 15:7 — *I say unto you, that likewise joy shall be in heaven over one sinner that repenteth, more than over ninety and nine just persons, which need no repentance.* The Shepherd''s praise of repentance as great understanding matches heaven''s own joy over the sinner who turns.'
  FROM cross_reference_threads t, cross_references x, _session253_herm9_lookup sv, _session253_herm9_lookup tv
 WHERE t.slug='hermas-9-repentance-is-understanding'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=9 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=15 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 18:30 — *Therefore I will judge you, O house of Yashar''el (Israel), every one according to his ways, saith Adonai Yahuah (the Lord GOD). Repent, and turn yourselves from all your transgressions; so iniquity shall not be your ruin.* The very repentance the angel presides over is the prophet''s standing summons to Israel — it ain''t new.'
  FROM cross_reference_threads t, cross_references x, _session253_herm9_lookup sv, _session253_herm9_lookup tv
 WHERE t.slug='hermas-9-repentance-is-understanding'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=9 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=18 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Peter 3:9 — *Yahuah (Lord) is not slack concerning his promise, as some men count slackness; but is longsuffering to us-ward, not willing that any should perish, but that all should come to repentance.* The understanding given to all who repent flows from Yahuah''s longsuffering, which aims that all come to repentance.'
  FROM cross_reference_threads t, cross_references x, _session253_herm9_lookup sv, _session253_herm9_lookup tv
 WHERE t.slug='hermas-9-repentance-is-understanding'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=9 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=3 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-9-keep-my-commandments-and-live
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 19:17 — *And he said unto him, Why callest thou me good? there is none good but one, that is, Elohim (God): but if thou wilt enter into life, keep the commandments.* The Shepherd''s ''keep my commandments and walk in them and live'' is the Master''s own answer to the man who asked how to inherit life.'
  FROM cross_reference_threads t, cross_references x, _session253_herm9_lookup sv, _session253_herm9_lookup tv
 WHERE t.slug='hermas-9-keep-my-commandments-and-live'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=9 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=19 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 30:16 — *In that I command thee this day to love Yahuah Elohayka (the LORD thy God), to walk in his ways, and to keep his commandments and his statutes and his judgments, that thou mayest live and multiply: and Yahuah Elohayka (the LORD thy God) shall bless thee in the land whither thou goest to possess it.* Keeping the commandments unto life and remission is Moses'' covenant word, not a later invention — the commandments stand and bring life.'
  FROM cross_reference_threads t, cross_references x, _session253_herm9_lookup sv, _session253_herm9_lookup tv
 WHERE t.slug='hermas-9-keep-my-commandments-and-live'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=9 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 John 5:3 — *For this is the love of Elohim (God), that we keep his commandments: and his commandments are not grievous.* The Shepherd''s call to keep and walk in the commandments unto life is the apostle''s own measure of love — and far from grievous.'
  FROM cross_reference_threads t, cross_references x, _session253_herm9_lookup sv, _session253_herm9_lookup tv
 WHERE t.slug='hermas-9-keep-my-commandments-and-live'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=9 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=5 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'John 14:15 — *If ye love me, keep my commandments.* The remission promised to those who keep the commandments and walk in purity rests on the Master''s binding of love to obedience.'
  FROM cross_reference_threads t, cross_references x, _session253_herm9_lookup sv, _session253_herm9_lookup tv
 WHERE t.slug='hermas-9-keep-my-commandments-and-live'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=9 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=14 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_hermas_10.sql (session253 hermas 10) -----
-- Source anchor: lightfoot-apostolic-fathers/hermas ch10. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: herm10 (view _session253_herm10_lookup). Sort band base 71725, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_herm10_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: hermas-10-longsuffering-fruit-spirit
  ('lightfoot-apostolic-fathers', 'hermas', 10, 1, 'canon', 'galatians', 5, 22, 'free', E'Galatians 5:22 — *But the fruit of the Spirit is love, joy, peace, longsuffering, gentleness, goodness, faith,* the apostle''s own list naming the very long-suffering Hermas 10:1 calls the sweet honey of the Spirit who abides pure within.'),
  ('lightfoot-apostolic-fathers', 'hermas', 10, 1, 'canon', 'ephesians', 4, 2, 'free', E'Ephesians 4:2 — *With all lowliness and meekness, with longsuffering, forbearing one another in love;* the walk worthy of the calling that matches Hermas 10:1''s mastery over evil through long-suffering.'),
  ('lightfoot-apostolic-fathers', 'hermas', 10, 1, 'canon', '1-corinthians', 13, 4, 'free', E'1 Corinthians 13:4 — *Charity suffereth long, and is kind; charity envieth not; charity vaunteth not itself, is not puffed up,* the love that suffers long, sweeter than honey, in which Yahuah dwells per Hermas 10:1.'),
  ('lightfoot-apostolic-fathers', 'hermas', 10, 1, 'canon', 'proverbs', 14, 29, 'free', E'Proverbs 14:29 — *He that is slow to wrath is of great understanding: but he that is hasty of spirit exalteth folly.* The Tanakh already weds long-suffering to understanding, exactly as Hermas 10:1 opens: be long-suffering and understanding.'),
  -- thread: hermas-10-angry-temper-double-minded
  ('lightfoot-apostolic-fathers', 'hermas', 10, 2, 'canon', 'james', 1, 8, 'free', E'James 1:8 — *A double minded man is unstable in all his ways.* James names the very dipsuchos (double-minded) man whom Hermas 10:2 says the angry temper leads astray, while it cannot move the one full in faith.'),
  ('lightfoot-apostolic-fathers', 'hermas', 10, 2, 'canon', 'james', 1, 19, 'free', E'James 1:19 — *Wherefore, my beloved brethren, let every man be swift to hear, slow to speak, slow to wrath:* the apostolic counsel against the wrath that Hermas 10:2 traces from foolishness into bitterness, wrath, anger, and spite.'),
  ('lightfoot-apostolic-fathers', 'hermas', 10, 2, 'canon', 'james', 1, 20, 'free', E'James 1:20 — *For the wrath of man worketh not the righteousness of Elohim (God).* This is precisely why the angry temper leads the servant astray from righteousness in Hermas 10:2.'),
  ('lightfoot-apostolic-fathers', 'hermas', 10, 2, 'canon', 'proverbs', 14, 17, 'free', E'Proverbs 14:17 — *He that is soon angry dealeth foolishly: and a man of wicked devices is hated.* The Tanakh already calls anger foolish, the same diagnosis Hermas 10:2 gives: angry temper is in the first place foolish, fickle, and senseless.'),
  ('lightfoot-apostolic-fathers', 'hermas', 10, 2, 'canon', 'ecclesiastes', 7, 9, 'free', E'Ecclesiastes 7:9 — *Be not hasty in thy spirit to be angry: for anger resteth in the bosom of fools.* The preacher lodges anger in the fool''s bosom, echoing Hermas 10:2''s chain of evil elements composing the great and incurable sin.'),
  -- thread: hermas-10-grieve-not-the-spirit-keep-commandment
  ('lightfoot-apostolic-fathers', 'hermas', 10, 1, 'canon', 'ephesians', 4, 30, 'free', E'Ephesians 4:30 — *And grieve not the holy Spirit of Elohim (God), whereby ye are sealed unto the day of redemption.* The grieved, sealed Spirit is the same delicate Ruach who, in Hermas 10:1, is straitened and seeks to retire when the angry temper approaches.'),
  ('lightfoot-apostolic-fathers', 'hermas', 10, 1, 'canon', 'ephesians', 4, 31, 'free', E'Ephesians 4:31 — *Let all bitterness, and wrath, and anger, and clamour, and evil speaking, be put away from you, with all malice:* the very catalogue of bitterness and wrath Hermas 10:1 says chokes the Spirit out of the vessel.'),
  ('lightfoot-apostolic-fathers', 'hermas', 10, 1, 'canon', '1-corinthians', 3, 16, 'free', E'1 Corinthians 3:16 — *Know ye not that ye are the temple of Elohim (God), and that the Spirit of Elohim (God) dwelleth in you?* The believer is the vessel of Hermas 10:1 in which the Ruach HaKodesh abides and must be kept pure.'),
  ('lightfoot-apostolic-fathers', 'hermas', 10, 2, 'canon', 'john', 14, 15, 'free', E'John 14:15 — *If ye love me, keep my commandments.* Hermas 10:2''s charge never to neglect this commandment, that one may keep the remaining commandments, is the Master''s own word — the commandments stand.'),
  ('lightfoot-apostolic-fathers', 'hermas', 10, 2, 'canon', 'john', 14, 16, 'free', E'John 14:16 — *And I will pray the Father, and he shall give you another Comforter, that he may abide with you for ever;* the abiding Comforter is the very Spirit Hermas 10:1-2 says dwells in the kept vessel and departs from the wrathful one.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_herm10_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_herm10_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-10-longsuffering-fruit-spirit',
       E'Long-suffering, the sweet honey: the fruit of the indwelling Spirit',
       E'Mandate 5 sets long-suffering against angry temper and makes the heart a vessel for the Ruach HaKodesh: *Be thou long-suffering and understanding, he saith, and thou shalt have the mastery over all evil deeds, and shalt work all righteousness. For if thou art long-suffering, the Ruach HaKodesh (Holy Spirit) that abideth in thee shall be pure, not being darkened by another evil spirit... For if you take a little wormwood, and pour it into a jar of honey, is not the whole of the honey spoiled... long-suffering is very sweet, beyond the sweetness of honey, and is useful to Yahuah (Lord), and He dwelleth in it* (Hermas 10:1). It ain''t new — this is the apostle''s own list: *But the fruit of the Spirit is love, joy, peace, longsuffering, gentleness, goodness, faith* (Galatians 5:22); *With all lowliness and meekness, with longsuffering, forbearing one another in love* (Ephesians 4:2); *Charity suffereth long, and is kind; charity envieth not; charity vaunteth not itself, is not puffed up* (1 Corinthians 13:4). And the proverb already knew it: *He that is slow to wrath is of great understanding: but he that is hasty of spirit exalteth folly* (Proverbs 14:29). The single drop of wormwood that ruins the honey is the angry temper that grieves the gentle Spirit dwelling within.',
       sv.verse_id, ev.verse_id, 'extras', 71725
  FROM _session253_herm10_lookup sv, _session253_herm10_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=10 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=10 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-10-angry-temper-double-minded',
       E'Angry temper subverts the double-minded; faith stands firm',
       E'The Shepherd unfolds how the angry temper works ruin: *Hear now, saith he, the working of angry temper, how evil it is, and how it subverteth the servants of Elohim (God)... But it doth not lead astray them that are full in the faith, nor can it work upon them, because the power of Yahuah (Lord) is with them; but them that are empty and double-minded it leadeth astray... then from foolishness is engendered bitterness, and from bitterness wrath, and from wrath anger, and from anger spite* (Hermas 10:2). The same double-minded instability is named by James: *A double minded man is unstable in all his ways* (James 1:8); and the same chain from wrath to ruin: *Wherefore, my beloved brethren, let every man be swift to hear, slow to speak, slow to wrath: For the wrath of man worketh not the righteousness of Elohim (God)* (James 1:19-20). The proverb seals it: *He that is soon angry dealeth foolishly: and a man of wicked devices is hated* (Proverbs 14:17); and the preacher: *Be not hasty in thy spirit to be angry: for anger resteth in the bosom of fools* (Ecclesiastes 7:9). The faithful are kept; the wavering are dragged about — election holds the heart that the temper cannot pry loose.',
       sv.verse_id, ev.verse_id, 'extras', 71728
  FROM _session253_herm10_lookup sv, _session253_herm10_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=10 AND sv.verse_number=2
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=10 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-10-grieve-not-the-spirit-keep-commandment',
       E'Grieve not the Spirit: the pure vessel, the kept commandment',
       E'The delicate Spirit will not share the vessel with wrath: *if any angry temper approach, forthwith the Ruach HaKodesh (Holy Spirit), being delicate, is straitened, not having the place clear, and seeketh to retire from the place; for he is being choked by the evil spirit* (Hermas 10:1); and the charge to keep this commandment so the rest may be kept: *See then that thou never neglect this commandment; for if thou master this commandment, thou shalt be able likewise to keep the remaining commandments* (Hermas 10:2). Paul says the same of the sealed Spirit and the bitterness that drives Him out: *And grieve not the holy Spirit of Elohim (God), whereby ye are sealed unto the day of redemption. Let all bitterness, and wrath, and anger, and clamour, and evil speaking, be put away from you, with all malice* (Ephesians 4:30-31). The believer is that vessel: *Know ye not that ye are the temple of Elohim (God), and that the Spirit of Elohim (God) dwelleth in you?* (1 Corinthians 3:16). And the Master Himself binds love, the kept commandment, and the abiding Comforter together: *If ye love me, keep my commandments. And I will pray the Father, and he shall give you another Comforter, that he may abide with you for ever* (John 14:15-16). It ain''t new — the commandments stand, and the Spirit dwells in the heart that keeps them.',
       sv.verse_id, ev.verse_id, 'extras', 71731
  FROM _session253_herm10_lookup sv, _session253_herm10_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=10 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=10 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: hermas-10-longsuffering-fruit-spirit
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Galatians 5:22 — *But the fruit of the Spirit is love, joy, peace, longsuffering, gentleness, goodness, faith,* the apostle''s own list naming the very long-suffering Hermas 10:1 calls the sweet honey of the Spirit who abides pure within.'
  FROM cross_reference_threads t, cross_references x, _session253_herm10_lookup sv, _session253_herm10_lookup tv
 WHERE t.slug='hermas-10-longsuffering-fruit-spirit'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=10 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=5 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ephesians 4:2 — *With all lowliness and meekness, with longsuffering, forbearing one another in love;* the walk worthy of the calling that matches Hermas 10:1''s mastery over evil through long-suffering.'
  FROM cross_reference_threads t, cross_references x, _session253_herm10_lookup sv, _session253_herm10_lookup tv
 WHERE t.slug='hermas-10-longsuffering-fruit-spirit'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=10 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=4 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Corinthians 13:4 — *Charity suffereth long, and is kind; charity envieth not; charity vaunteth not itself, is not puffed up,* the love that suffers long, sweeter than honey, in which Yahuah dwells per Hermas 10:1.'
  FROM cross_reference_threads t, cross_references x, _session253_herm10_lookup sv, _session253_herm10_lookup tv
 WHERE t.slug='hermas-10-longsuffering-fruit-spirit'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=10 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=13 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 14:29 — *He that is slow to wrath is of great understanding: but he that is hasty of spirit exalteth folly.* The Tanakh already weds long-suffering to understanding, exactly as Hermas 10:1 opens: be long-suffering and understanding.'
  FROM cross_reference_threads t, cross_references x, _session253_herm10_lookup sv, _session253_herm10_lookup tv
 WHERE t.slug='hermas-10-longsuffering-fruit-spirit'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=10 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=14 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-10-angry-temper-double-minded
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'James 1:8 — *A double minded man is unstable in all his ways.* James names the very dipsuchos (double-minded) man whom Hermas 10:2 says the angry temper leads astray, while it cannot move the one full in faith.'
  FROM cross_reference_threads t, cross_references x, _session253_herm10_lookup sv, _session253_herm10_lookup tv
 WHERE t.slug='hermas-10-angry-temper-double-minded'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=10 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'James 1:19 — *Wherefore, my beloved brethren, let every man be swift to hear, slow to speak, slow to wrath:* the apostolic counsel against the wrath that Hermas 10:2 traces from foolishness into bitterness, wrath, anger, and spite.'
  FROM cross_reference_threads t, cross_references x, _session253_herm10_lookup sv, _session253_herm10_lookup tv
 WHERE t.slug='hermas-10-angry-temper-double-minded'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=10 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'James 1:20 — *For the wrath of man worketh not the righteousness of Elohim (God).* This is precisely why the angry temper leads the servant astray from righteousness in Hermas 10:2.'
  FROM cross_reference_threads t, cross_references x, _session253_herm10_lookup sv, _session253_herm10_lookup tv
 WHERE t.slug='hermas-10-angry-temper-double-minded'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=10 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 14:17 — *He that is soon angry dealeth foolishly: and a man of wicked devices is hated.* The Tanakh already calls anger foolish, the same diagnosis Hermas 10:2 gives: angry temper is in the first place foolish, fickle, and senseless.'
  FROM cross_reference_threads t, cross_references x, _session253_herm10_lookup sv, _session253_herm10_lookup tv
 WHERE t.slug='hermas-10-angry-temper-double-minded'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=10 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=14 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Ecclesiastes 7:9 — *Be not hasty in thy spirit to be angry: for anger resteth in the bosom of fools.* The preacher lodges anger in the fool''s bosom, echoing Hermas 10:2''s chain of evil elements composing the great and incurable sin.'
  FROM cross_reference_threads t, cross_references x, _session253_herm10_lookup sv, _session253_herm10_lookup tv
 WHERE t.slug='hermas-10-angry-temper-double-minded'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=10 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-10-grieve-not-the-spirit-keep-commandment
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ephesians 4:30 — *And grieve not the holy Spirit of Elohim (God), whereby ye are sealed unto the day of redemption.* The grieved, sealed Spirit is the same delicate Ruach who, in Hermas 10:1, is straitened and seeks to retire when the angry temper approaches.'
  FROM cross_reference_threads t, cross_references x, _session253_herm10_lookup sv, _session253_herm10_lookup tv
 WHERE t.slug='hermas-10-grieve-not-the-spirit-keep-commandment'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=10 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=4 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ephesians 4:31 — *Let all bitterness, and wrath, and anger, and clamour, and evil speaking, be put away from you, with all malice:* the very catalogue of bitterness and wrath Hermas 10:1 says chokes the Spirit out of the vessel.'
  FROM cross_reference_threads t, cross_references x, _session253_herm10_lookup sv, _session253_herm10_lookup tv
 WHERE t.slug='hermas-10-grieve-not-the-spirit-keep-commandment'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=10 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=4 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Corinthians 3:16 — *Know ye not that ye are the temple of Elohim (God), and that the Spirit of Elohim (God) dwelleth in you?* The believer is the vessel of Hermas 10:1 in which the Ruach HaKodesh abides and must be kept pure.'
  FROM cross_reference_threads t, cross_references x, _session253_herm10_lookup sv, _session253_herm10_lookup tv
 WHERE t.slug='hermas-10-grieve-not-the-spirit-keep-commandment'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=10 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=3 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'John 14:15 — *If ye love me, keep my commandments.* Hermas 10:2''s charge never to neglect this commandment, that one may keep the remaining commandments, is the Master''s own word — the commandments stand.'
  FROM cross_reference_threads t, cross_references x, _session253_herm10_lookup sv, _session253_herm10_lookup tv
 WHERE t.slug='hermas-10-grieve-not-the-spirit-keep-commandment'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=10 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=14 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'John 14:16 — *And I will pray the Father, and he shall give you another Comforter, that he may abide with you for ever;* the abiding Comforter is the very Spirit Hermas 10:1-2 says dwells in the kept vessel and departs from the wrathful one.'
  FROM cross_reference_threads t, cross_references x, _session253_herm10_lookup sv, _session253_herm10_lookup tv
 WHERE t.slug='hermas-10-grieve-not-the-spirit-keep-commandment'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=10 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=14 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_hermas_11.sql (session253 hermas 11) -----
-- Source anchor: lightfoot-apostolic-fathers/hermas ch11. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: herm11 (view _session253_herm11_lookup). Sort band base 71750, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_herm11_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: hermas-11-two-ways-straight-and-crooked
  ('lightfoot-apostolic-fathers', 'hermas', 11, 1, 'canon', 'deuteronomy', 30, 19, 'free', E'Deuteronomy 30:19 — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live:* The Shepherd''s straight-and-crooked ways are Moses'' life-and-death set before Yashar''el — the very same covenant choice.'),
  ('lightfoot-apostolic-fathers', 'hermas', 11, 1, 'canon', 'psalms', 1, 1, 'free', E'Psalms 1:1 — *Blessed is the man that walketh not in the counsel of the ungodly, nor standeth in the way of sinners, nor sitteth in the seat of the scornful.* The Psalter opens on the two ways Hermas walks — the level road of the righteous against the crooked path of the ungodly.'),
  ('lightfoot-apostolic-fathers', 'hermas', 11, 1, 'canon', 'matthew', 7, 14, 'free', E'Matthew 7:14 — *Because strait is the gate, and narrow is the way, which leadeth unto life, and few there be that find it.* The Messiah''s narrow way is Hermas''s straight, level, untracked-by-stumbling path that leadeth unto life.'),
  ('lightfoot-apostolic-fathers', 'hermas', 11, 1, 'canon', 'joel', 2, 12, 'free', E'Joel 2:12 — *Therefore also now, saith Yahuah (LORD), turn ye even to me with all your heart, and with fasting, and with weeping, and with mourning:* Whosoever turns to Yahuah with his whole heart walks the straight way — the prophet''s whole-hearted repentance the Shepherd presses upon the fallen.'),
  -- thread: hermas-11-two-angels-try-the-spirits
  ('lightfoot-apostolic-fathers', 'hermas', 11, 2, 'canon', 'galatians', 5, 17, 'free', E'Galatians 5:17 — *For the flesh lusteth against the Spirit, and the Spirit against the flesh: and these are contrary the one to the other: so that ye cannot do the things that ye would.* The two angels in Hermas''s heart are Sha''ul''s Spirit and flesh, contrary the one to the other.'),
  ('lightfoot-apostolic-fathers', 'hermas', 11, 2, 'canon', 'galatians', 5, 22, 'free', E'Galatians 5:22 — *But the fruit of the Spirit is love, joy, peace, longsuffering, gentleness, goodness, faith,* These are the works of Hermas''s angel of righteousness — gentle, tranquil, speaking of purity and holiness — known by their fruit.'),
  ('lightfoot-apostolic-fathers', 'hermas', 11, 2, 'canon', '1-john', 4, 1, 'free', E'1 John 4:1 — *Beloved, believe not every spirit, but try the spirits whether they are of Elohim (God): because many false prophets are gone out into the world.* Hermas is taught to know each angel by his works — the apostle''s same charge to try the spirits.'),
  ('lightfoot-apostolic-fathers', 'hermas', 11, 2, 'canon', 'james', 4, 7, 'free', E'James 4:7 — *Submit yourselves therefore to Elohim (God). Resist the devil, and he will flee from you.* The Shepherd''s counsel to stand aloof from the angel of wickedness and trust nothing of him is Ya''akov''s resist-the-devil.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_herm11_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_herm11_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-11-two-ways-straight-and-crooked',
       E'The two ways — the straight path and the crooked',
       E'The Shepherd sets the ancient Two Ways before Hermas: *the way of righteousness is straight, but the way of unrighteousness is crooked. But walk thou in the straight [and level] path, and leave the crooked one alone... Thou shalt walk, he saith, yea, and whosoever shall turn unto Yahuah (Lord) with his whole heart shall walk in it* (Hermas 11:1). It ain''t new — this is the choice Moses set before Yashar''el: *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live* (Deuteronomy 30:19), and the Psalter''s opening blessing on the man whose *delight is in the law of Yahuah (LORD)* and not in *the counsel of the ungodly* (Psalms 1:1). The Messiah Himself draws the same two roads: *Enter ye in at the strait gate... strait is the gate, and narrow is the way, which leadeth unto life, and few there be that find it* (Matthew 7:13-14). And the turning of the whole heart is the prophet''s call to repentance — *turn ye even to me with all your heart* (Joel 2:12) — the second repentance the Shepherd everywhere offers.',
       sv.verse_id, ev.verse_id, 'extras', 71750
  FROM _session253_herm11_lookup sv, _session253_herm11_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=11 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=11 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-11-two-angels-try-the-spirits',
       E'The two angels — try the spirits',
       E'The Shepherd reveals the two spirits that dwell with a man: *There are two angels with a man, one of righteousness and one of wickedness... The angel of righteousness is delicate and bashful and gentle and tranquil... he speaketh with thee of righteousness, of purity, of holiness, and of contentment... Now see the works of the angel of wickedness also. First of all, he is quick-tempered and bitter and senseless, and his works are evil, overthrowing the servants of Elohim (God)* (Hermas 11:2). This is the same warfare Sha''ul names — *the flesh lusteth against the Spirit, and the Spirit against the flesh: and these are contrary the one to the other* (Galatians 5:17) — whose fruit is *love, joy, peace, longsuffering, gentleness, goodness, faith* (Galatians 5:22), the very virtues of Hermas''s angel of righteousness. John bids the same discernment: *believe not every spirit, but try the spirits whether they are of Elohim (God)* (1 John 4:1). And the remedy is Ya''akov''s: *Resist the devil, and he will flee from you* (James 4:7) — the Shepherd''s word to stand aloof from the angel of wickedness.',
       sv.verse_id, ev.verse_id, 'extras', 71753
  FROM _session253_herm11_lookup sv, _session253_herm11_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=11 AND sv.verse_number=2
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=11 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: hermas-11-two-ways-straight-and-crooked
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 30:19 — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live:* The Shepherd''s straight-and-crooked ways are Moses'' life-and-death set before Yashar''el — the very same covenant choice.'
  FROM cross_reference_threads t, cross_references x, _session253_herm11_lookup sv, _session253_herm11_lookup tv
 WHERE t.slug='hermas-11-two-ways-straight-and-crooked'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=11 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 1:1 — *Blessed is the man that walketh not in the counsel of the ungodly, nor standeth in the way of sinners, nor sitteth in the seat of the scornful.* The Psalter opens on the two ways Hermas walks — the level road of the righteous against the crooked path of the ungodly.'
  FROM cross_reference_threads t, cross_references x, _session253_herm11_lookup sv, _session253_herm11_lookup tv
 WHERE t.slug='hermas-11-two-ways-straight-and-crooked'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=11 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 7:14 — *Because strait is the gate, and narrow is the way, which leadeth unto life, and few there be that find it.* The Messiah''s narrow way is Hermas''s straight, level, untracked-by-stumbling path that leadeth unto life.'
  FROM cross_reference_threads t, cross_references x, _session253_herm11_lookup sv, _session253_herm11_lookup tv
 WHERE t.slug='hermas-11-two-ways-straight-and-crooked'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=11 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Joel 2:12 — *Therefore also now, saith Yahuah (LORD), turn ye even to me with all your heart, and with fasting, and with weeping, and with mourning:* Whosoever turns to Yahuah with his whole heart walks the straight way — the prophet''s whole-hearted repentance the Shepherd presses upon the fallen.'
  FROM cross_reference_threads t, cross_references x, _session253_herm11_lookup sv, _session253_herm11_lookup tv
 WHERE t.slug='hermas-11-two-ways-straight-and-crooked'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=11 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-11-two-angels-try-the-spirits
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Galatians 5:17 — *For the flesh lusteth against the Spirit, and the Spirit against the flesh: and these are contrary the one to the other: so that ye cannot do the things that ye would.* The two angels in Hermas''s heart are Sha''ul''s Spirit and flesh, contrary the one to the other.'
  FROM cross_reference_threads t, cross_references x, _session253_herm11_lookup sv, _session253_herm11_lookup tv
 WHERE t.slug='hermas-11-two-angels-try-the-spirits'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=11 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=5 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Galatians 5:22 — *But the fruit of the Spirit is love, joy, peace, longsuffering, gentleness, goodness, faith,* These are the works of Hermas''s angel of righteousness — gentle, tranquil, speaking of purity and holiness — known by their fruit.'
  FROM cross_reference_threads t, cross_references x, _session253_herm11_lookup sv, _session253_herm11_lookup tv
 WHERE t.slug='hermas-11-two-angels-try-the-spirits'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=11 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=5 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 John 4:1 — *Beloved, believe not every spirit, but try the spirits whether they are of Elohim (God): because many false prophets are gone out into the world.* Hermas is taught to know each angel by his works — the apostle''s same charge to try the spirits.'
  FROM cross_reference_threads t, cross_references x, _session253_herm11_lookup sv, _session253_herm11_lookup tv
 WHERE t.slug='hermas-11-two-angels-try-the-spirits'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=11 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=4 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'James 4:7 — *Submit yourselves therefore to Elohim (God). Resist the devil, and he will flee from you.* The Shepherd''s counsel to stand aloof from the angel of wickedness and trust nothing of him is Ya''akov''s resist-the-devil.'
  FROM cross_reference_threads t, cross_references x, _session253_herm11_lookup sv, _session253_herm11_lookup tv
 WHERE t.slug='hermas-11-two-angels-try-the-spirits'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=11 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=4 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_hermas_12.sql (session253 hermas 12) -----
-- Source anchor: lightfoot-apostolic-fathers/hermas ch12. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: herm12 (view _session253_herm12_lookup). Sort band base 71775, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_herm12_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: hermas-12-fear-of-yahuah
  ('lightfoot-apostolic-fathers', 'hermas', 12, 1, 'canon', 'ecclesiastes', 12, 13, 'free', E'Ecclesiastes 12:13 — *Let us hear the conclusion of the whole matter: Fear Elohim (God), and keep his commandments: for this is the whole duty of man.* Solomon''s conclusion is the Shepherd''s whole mandate — fear Yahuah and keep His commandments, the whole duty of man (hermas 12:1).'),
  ('lightfoot-apostolic-fathers', 'hermas', 12, 1, 'canon', 'psalms', 111, 10, 'free', E'Psalm 111:10 — *The fear of Yahuah (LORD) is the beginning of wisdom: a good understanding have all they that do his commandments: his praise endureth for ever.* The Mandate''s pairing of fear with commandment-keeping is the very wisdom of the Psalm, where to fear and to do are one (hermas 12:1).'),
  ('lightfoot-apostolic-fathers', 'hermas', 12, 1, 'canon', 'deuteronomy', 10, 12, 'free', E'Deuteronomy 10:12 — *And now, Yashar''el (Israel), what doth Yahuah Elohayka (the LORD thy God) require of thee, but to fear Yahuah Elohayka (the LORD thy God), to walk in all his ways, and to love him, and to serve Yahuah Elohayka (the LORD thy God) with all thy heart and with all thy soul,* Moses'' single requirement — fear and walk in His ways — is the soil from which the Shepherd''s mandate grows (hermas 12:1).'),
  ('lightfoot-apostolic-fathers', 'hermas', 12, 1, 'canon', 'proverbs', 1, 7, 'free', E'Proverbs 1:7 — *The fear of Yahuah (LORD) is the beginning of knowledge: but fools despise wisdom and instruction.* The Shepherd calls the fear of Yahuah ''powerful and great and glorious'' — Proverbs names it the very beginning of knowledge (hermas 12:1).'),
  -- thread: hermas-12-keep-commandments-have-life
  ('lightfoot-apostolic-fathers', 'hermas', 12, 1, 'canon', 'john', 14, 15, 'free', E'John 14:15 — *If ye love me, keep my commandments.* The Messiah binds love to commandment-keeping exactly as the Shepherd binds life unto Elohim to keeping His commandments (hermas 12:1).'),
  ('lightfoot-apostolic-fathers', 'hermas', 12, 1, 'canon', 'john', 14, 21, 'free', E'John 14:21 — *He that hath my commandments, and keepeth them, he it is that loveth me: and he that loveth me shall be loved of my Father, and I will love him, and will manifest myself to him.* Those who keep the commandments ''have life unto Elohim'' in the Mandate because the Father loves and manifests Himself to the one who keeps them (hermas 12:1).'),
  ('lightfoot-apostolic-fathers', 'hermas', 12, 1, 'canon', '1-john', 5, 3, 'free', E'1 John 5:3 — *For this is the love of Elohim (God), that we keep his commandments: and his commandments are not grievous.* John defines the love the Shepherd commends — keeping commandments that are not grievous but life-giving (hermas 12:1).'),
  -- thread: hermas-12-master-over-the-devil
  ('lightfoot-apostolic-fathers', 'hermas', 12, 1, 'canon', 'matthew', 10, 28, 'free', E'Matthew 10:28 — *And fear not them which kill the body, but are not able to kill the soul: but rather fear him which is able to destroy both soul and body in hell.* The Messiah''s ordering of fear — not the enemy but Yahuah alone — is exactly the Shepherd''s ''fear not the devil... fear Yahuah'' (hermas 12:1).'),
  ('lightfoot-apostolic-fathers', 'hermas', 12, 1, 'canon', 'proverbs', 8, 13, 'free', E'Proverbs 8:13 — *The fear of Yahuah (LORD) is to hate evil: pride, and arrogancy, and the evil way, and the froward mouth, do I hate.* The Mandate''s call to ''fear the works of the devil, for they are evil'' is the fear of Yahuah that Proverbs defines as the hatred of evil (hermas 12:1).'),
  ('lightfoot-apostolic-fathers', 'hermas', 12, 1, 'canon', 'deuteronomy', 10, 20, 'free', E'Deuteronomy 10:20 — *Thou shalt fear Yahuah Elohayka (the LORD thy God); him shalt thou serve, and to him shalt thou cleave, and swear by his name.* The Shepherd''s ''fear Yahuah, and thou shalt be master over the devil'' rests on Moses'' charge to fear and cleave to Yahuah alone (hermas 12:1).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_herm12_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_herm12_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-12-fear-of-yahuah',
       E'Fear Yahuah, and keep His commandments',
       E'Mandate 7 opens with the ancient charge: *''Fear Yahuah (Lord),'' saith he, ''and keep His commandments. So keeping the commandments of Elohim (God) thou shalt be powerful in every deed... Therefore the fear of Yahuah (Lord) is powerful and great and glorious.''* It ain''t new — the Shepherd is reciting the Tanakh. Solomon set the same yoke at the end of all his searching: *Let us hear the conclusion of the whole matter: Fear Elohim (God), and keep his commandments: for this is the whole duty of man* (Ecclesiastes 12:13). It is the gate of wisdom itself: *The fear of Yahuah (LORD) is the beginning of wisdom: a good understanding have all they that do his commandments: his praise endureth for ever* (Psalm 111:10), and *The fear of Yahuah (LORD) is the beginning of knowledge* (Proverbs 1:7). And Moses gathered the whole life of the covenant into one demand: *And now, Yashar''el (Israel), what doth Yahuah Elohayka (the LORD thy God) require of thee, but to fear Yahuah Elohayka (the LORD thy God), to walk in all his ways, and to love him* (Deuteronomy 10:12). The fear of Yahuah and the keeping of His commandments are one thread, never law-as-curse.',
       sv.verse_id, ev.verse_id, 'extras', 71775
  FROM _session253_herm12_lookup sv, _session253_herm12_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=12 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=12 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-12-keep-commandments-have-life',
       E'They that keep His commandments have life unto Elohim',
       E'The angel presses the distinction: *''every creature feareth Yahuah (Lord), but not every one keepeth His commandments. Those then that fear Him and keep His commandments, they have life unto Elohim (God); but they that keep not His commandments have no life in them.''* This is the Messiah''s own test of love. *If ye love me, keep my commandments* (John 14:15); *He that hath my commandments, and keepeth them, he it is that loveth me: and he that loveth me shall be loved of my Father* (John 14:21). The beloved disciple sealed it: *For this is the love of Elohim (God), that we keep his commandments: and his commandments are not grievous* (1 John 5:3). The Shepherd''s ''life unto Elohim'' is no novelty — it is the keeping of the everlasting commandments, which election makes a delight and never a curse.',
       sv.verse_id, ev.verse_id, 'extras', 71778
  FROM _session253_herm12_lookup sv, _session253_herm12_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=12 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=12 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-12-master-over-the-devil',
       E'Fear Yahuah, and be master over the devil',
       E'The Mandate turns the disciple''s fear away from the enemy: *''But fear not the devil; for, if thou fear Yahuah (Lord), thou shalt be master over the devil, for there is no power in him.''* Yet it teaches a holy fear of evil works: *''But fear thou the works of the devil, for they are evil... thou wilt not do them, but abstain from them.''* The Messiah sets the same order of fear: *And fear not them which kill the body, but are not able to kill the soul: but rather fear him which is able to destroy both soul and body in hell* (Matthew 10:28). To fear Yahuah is to be loosed from every lesser fear, and the fear of Yahuah is itself the hatred of evil: *The fear of Yahuah (LORD) is to hate evil: pride, and arrogancy, and the evil way, and the froward mouth, do I hate* (Proverbs 8:13). And Moses had already commanded where alone our fear and cleaving belong: *Thou shalt fear Yahuah Elohayka (the LORD thy God); him shalt thou serve, and to him shalt thou cleave* (Deuteronomy 10:20).',
       sv.verse_id, ev.verse_id, 'extras', 71781
  FROM _session253_herm12_lookup sv, _session253_herm12_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=12 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=12 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: hermas-12-fear-of-yahuah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ecclesiastes 12:13 — *Let us hear the conclusion of the whole matter: Fear Elohim (God), and keep his commandments: for this is the whole duty of man.* Solomon''s conclusion is the Shepherd''s whole mandate — fear Yahuah and keep His commandments, the whole duty of man (hermas 12:1).'
  FROM cross_reference_threads t, cross_references x, _session253_herm12_lookup sv, _session253_herm12_lookup tv
 WHERE t.slug='hermas-12-fear-of-yahuah'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=12 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=12 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 111:10 — *The fear of Yahuah (LORD) is the beginning of wisdom: a good understanding have all they that do his commandments: his praise endureth for ever.* The Mandate''s pairing of fear with commandment-keeping is the very wisdom of the Psalm, where to fear and to do are one (hermas 12:1).'
  FROM cross_reference_threads t, cross_references x, _session253_herm12_lookup sv, _session253_herm12_lookup tv
 WHERE t.slug='hermas-12-fear-of-yahuah'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=12 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=111 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 10:12 — *And now, Yashar''el (Israel), what doth Yahuah Elohayka (the LORD thy God) require of thee, but to fear Yahuah Elohayka (the LORD thy God), to walk in all his ways, and to love him, and to serve Yahuah Elohayka (the LORD thy God) with all thy heart and with all thy soul,* Moses'' single requirement — fear and walk in His ways — is the soil from which the Shepherd''s mandate grows (hermas 12:1).'
  FROM cross_reference_threads t, cross_references x, _session253_herm12_lookup sv, _session253_herm12_lookup tv
 WHERE t.slug='hermas-12-fear-of-yahuah'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=12 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=10 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 1:7 — *The fear of Yahuah (LORD) is the beginning of knowledge: but fools despise wisdom and instruction.* The Shepherd calls the fear of Yahuah ''powerful and great and glorious'' — Proverbs names it the very beginning of knowledge (hermas 12:1).'
  FROM cross_reference_threads t, cross_references x, _session253_herm12_lookup sv, _session253_herm12_lookup tv
 WHERE t.slug='hermas-12-fear-of-yahuah'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=12 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=1 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-12-keep-commandments-have-life
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 14:15 — *If ye love me, keep my commandments.* The Messiah binds love to commandment-keeping exactly as the Shepherd binds life unto Elohim to keeping His commandments (hermas 12:1).'
  FROM cross_reference_threads t, cross_references x, _session253_herm12_lookup sv, _session253_herm12_lookup tv
 WHERE t.slug='hermas-12-keep-commandments-have-life'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=12 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=14 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 14:21 — *He that hath my commandments, and keepeth them, he it is that loveth me: and he that loveth me shall be loved of my Father, and I will love him, and will manifest myself to him.* Those who keep the commandments ''have life unto Elohim'' in the Mandate because the Father loves and manifests Himself to the one who keeps them (hermas 12:1).'
  FROM cross_reference_threads t, cross_references x, _session253_herm12_lookup sv, _session253_herm12_lookup tv
 WHERE t.slug='hermas-12-keep-commandments-have-life'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=12 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=14 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 John 5:3 — *For this is the love of Elohim (God), that we keep his commandments: and his commandments are not grievous.* John defines the love the Shepherd commends — keeping commandments that are not grievous but life-giving (hermas 12:1).'
  FROM cross_reference_threads t, cross_references x, _session253_herm12_lookup sv, _session253_herm12_lookup tv
 WHERE t.slug='hermas-12-keep-commandments-have-life'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=12 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=5 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-12-master-over-the-devil
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 10:28 — *And fear not them which kill the body, but are not able to kill the soul: but rather fear him which is able to destroy both soul and body in hell.* The Messiah''s ordering of fear — not the enemy but Yahuah alone — is exactly the Shepherd''s ''fear not the devil... fear Yahuah'' (hermas 12:1).'
  FROM cross_reference_threads t, cross_references x, _session253_herm12_lookup sv, _session253_herm12_lookup tv
 WHERE t.slug='hermas-12-master-over-the-devil'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=12 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=10 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 8:13 — *The fear of Yahuah (LORD) is to hate evil: pride, and arrogancy, and the evil way, and the froward mouth, do I hate.* The Mandate''s call to ''fear the works of the devil, for they are evil'' is the fear of Yahuah that Proverbs defines as the hatred of evil (hermas 12:1).'
  FROM cross_reference_threads t, cross_references x, _session253_herm12_lookup sv, _session253_herm12_lookup tv
 WHERE t.slug='hermas-12-master-over-the-devil'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=12 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=8 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 10:20 — *Thou shalt fear Yahuah Elohayka (the LORD thy God); him shalt thou serve, and to him shalt thou cleave, and swear by his name.* The Shepherd''s ''fear Yahuah, and thou shalt be master over the devil'' rests on Moses'' charge to fear and cleave to Yahuah alone (hermas 12:1).'
  FROM cross_reference_threads t, cross_references x, _session253_herm12_lookup sv, _session253_herm12_lookup tv
 WHERE t.slug='hermas-12-master-over-the-devil'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=12 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=10 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_hermas_13.sql (session253 hermas 13) -----
-- Source anchor: lightfoot-apostolic-fathers/hermas ch13. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: herm13 (view _session253_herm13_lookup). Sort band base 71800, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_herm13_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: hermas-13-twofold-temperance-two-ways
  ('lightfoot-apostolic-fathers', 'hermas', 13, 1, 'canon', 'psalms', 34, 14, 'free', E'Psalm 34:14 — *Depart from evil, and do good; seek peace, and pursue it.* The Shepherd''s twofold temperance — abstain from the evil, do the good — is David''s own two-way path of the righteous, word for word.'),
  ('lightfoot-apostolic-fathers', 'hermas', 13, 1, 'canon', 'amos', 5, 15, 'free', E'Amos 5:15 — *Hate the evil, and love the good, and establish judgment in the gate: it may be that Yahuah Elohim (the LORD God) of hosts will be gracious unto the remnant of Joseph.* Refrain from wickedness and do righteousness is the prophet''s own summons to the remnant — it ain''t new.'),
  ('lightfoot-apostolic-fathers', 'hermas', 13, 1, 'canon', 'amos', 5, 14, 'free', E'Amos 5:14 — *Seek good, and not evil, that ye may live: and so Yahuah (LORD), the Elohim (God) of hosts, shall be with you, as ye have spoken.* The Shepherd binds the doing of good to life unto Elohim, just as Amos binds seeking good to living.'),
  ('lightfoot-apostolic-fathers', 'hermas', 13, 1, 'canon', 'romans', 12, 9, 'free', E'Romans 12:9 — *Let love be without dissimulation. Abhor that which is evil; cleave to that which is good.* Sha''ul folds the two ways into one charge — hate the evil, hold to the good — the very twofold temperance the Shepherd commands.'),
  -- thread: hermas-13-abstain-from-wickedness
  ('lightfoot-apostolic-fathers', 'hermas', 13, 1, 'canon', 'isaiah', 1, 16, 'free', E'Isaiah 1:16 — *Wash you, make you clean; put away the evil of your doings from before mine eyes; cease to do evil;* the Shepherd''s call to be temperate as to evil and abstain from it is the prophet''s own cease-to-do-evil, spoken to a people he would cleanse.'),
  ('lightfoot-apostolic-fathers', 'hermas', 13, 1, 'canon', '1-thessalonians', 5, 22, 'free', E'1 Thessalonians 5:22 — *Abstain from all appearance of evil.* The whole charge to refrain from every wickedness is Sha''ul''s plain word to the children of the day, gathered into one line.'),
  ('lightfoot-apostolic-fathers', 'hermas', 13, 1, 'canon', '1-thessalonians', 5, 21, 'free', E'1 Thessalonians 5:21 — *Prove all things; hold fast that which is good.* Before bidding the faithful flee evil, Sha''ul bids them weigh and cleave to the good — the same twofold discernment the Shepherd teaches.'),
  -- thread: hermas-13-works-of-the-good
  ('lightfoot-apostolic-fathers', 'hermas', 13, 1, 'canon', 'isaiah', 1, 17, 'free', E'Isaiah 1:17 — *Learn to do well; seek judgment, relieve the oppressed, judge the fatherless, plead for the widow.* The Shepherd''s works of the good — righteousness, mercy, doing well — are the prophet''s own learn-to-do-well, the godly deeds that follow the washing clean.'),
  ('lightfoot-apostolic-fathers', 'hermas', 13, 1, 'canon', 'romans', 12, 12, 'free', E'Romans 12:12 — *Rejoicing in hope; patient in tribulation; continuing instant in prayer;* the patience and steadfast goodness the Shepherd lists among the works of the good are Sha''ul''s own marks of the living sacrifice.'),
  ('lightfoot-apostolic-fathers', 'hermas', 13, 1, 'canon', 'james', 1, 25, 'free', E'James 1:25 — *But whoso looketh into the perfect law of liberty, and continueth therein, he being not a forgetful hearer, but a doer of the work, this man shall be blessed in his deed.* The Shepherd''s promise that the one who keeps the good becomes blessed in his life is the doer''s blessing James pronounces over the keeper of the perfect law.'),
  -- thread: hermas-13-minister-to-widows-orphans
  ('lightfoot-apostolic-fathers', 'hermas', 13, 1, 'canon', 'james', 1, 27, 'free', E'James 1:27 — *Pure religion and undefiled before Elohim (God) and the Father is this, To visit the fatherless and widows in their affliction, and to keep himself unspotted from the world.* The Shepherd''s ministering to widows and visiting the orphans, while abstaining from all wickedness, is the very pure-and-undefiled religion James defines.'),
  ('lightfoot-apostolic-fathers', 'hermas', 13, 1, 'canon', 'romans', 12, 13, 'free', E'Romans 12:13 — *Distributing to the necessity of saints; given to hospitality.* The Shepherd''s charge to relieve the needy and to be hospitable is Sha''ul''s own word to the body of Messiah — the good works that build up the saints.'),
  ('lightfoot-apostolic-fathers', 'hermas', 13, 1, 'canon', 'romans', 12, 10, 'free', E'Romans 12:10 — *Be kindly affectioned one to another with brotherly love; in honour preferring one another;* the brotherly feeling, the reverence for the aged, and the bearing of no grudge that the Shepherd commends are Sha''ul''s own brotherly love that prefers another before self.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_herm13_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_herm13_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-13-twofold-temperance-two-ways',
       E'Refrain from evil, do the good — the two ways',
       E'The Shepherd opens Mandate Eight: *‘Be temperate as to what is evil, and do it not; but be not temperate as to what is good, but do it... Be temperate therefore in abstaining from all wickedness, and do that which is good.’* (Hermas 13:1) It ain''t new — this is the ancient two-fold path of the righteous, set down by David himself: *Depart from evil, and do good; seek peace, and pursue it.* (Psalm 34:14) Amos preaches the same turning to the house of Yashar''el: *Hate the evil, and love the good, and establish judgment in the gate* (Amos 5:15), and *Seek good, and not evil, that ye may live* (Amos 5:14). Sha''ul gathers the whole counsel into one breath: *Abhor that which is evil; cleave to that which is good* (Romans 12:9), and *overcome evil with good* (Romans 12:21). The two ways the Shepherd lays out are the old, well-worn path of the covenant.',
       sv.verse_id, ev.verse_id, 'extras', 71800
  FROM _session253_herm13_lookup sv, _session253_herm13_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=13 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=13 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-13-abstain-from-wickedness',
       E'Abstain from all wickedness — the works the servant must refuse',
       E'The Shepherd names the evils from which the servant of Elohim must be temperate: *‘from adultery and fornication, from the lawlessness of drunkenness, from wicked luxury... and vaunting and haughtiness and pride, and from falsehood and evil-speaking and hypocrisy, malice and all blasphemy.’* (Hermas 13:1) It ain''t new — this is the catalog the prophets and apostles already kept. Yeshayahu cries to a guilty people, *Wash you, make you clean; put away the evil of your doings from before mine eyes; cease to do evil* (Isaiah 1:16). Sha''ul lays the same standing charge upon the watchful, *Abstain from all appearance of evil* (1 Thessalonians 5:22), having first said, *Prove all things; hold fast that which is good* (1 Thessalonians 5:21). The list of wickedness is no new severity but the old refusal of the faithful.',
       sv.verse_id, ev.verse_id, 'extras', 71803
  FROM _session253_herm13_lookup sv, _session253_herm13_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=13 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=13 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-13-works-of-the-good',
       E'The works of the good — faith, fear of Yahuah, love, truth, patience',
       E'Then the Shepherd turns to the good in which no restraint is to be shown but only doing: *‘First of all, there is faith, fear of Yahuah (Lord), love, concord, words of righteousness, truth, patience; nothing is better than these in the life of men. If a man keep these... he becomes blessed in his life.’* (Hermas 13:1) It ain''t new — this is the prophet''s lesson and the apostle''s litany. Yeshayahu: *Learn to do well; seek judgment, relieve the oppressed, judge the fatherless, plead for the widow* (Isaiah 1:17). Sha''ul names the same virtues for the renewed mind, *Rejoicing in hope; patient in tribulation; continuing instant in prayer* (Romans 12:12), and the love that crowns them, *Let love be without dissimulation* (Romans 12:9). The works of the good are the doer''s blessing James proclaims: *but a doer of the work, this man shall be blessed in his deed* (James 1:25). The good path is the old path.',
       sv.verse_id, ev.verse_id, 'extras', 71806
  FROM _session253_herm13_lookup sv, _session253_herm13_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=13 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=13 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-13-minister-to-widows-orphans',
       E'Minister to widows, visit the orphans and the needy — pure religion',
       E'The Shepherd makes the good concrete: *‘to minister to widows, to visit the orphans and the needy, to ransom the servants of Elohim (God) from their afflictions, to be hospitable... to reverence the aged, to practise righteousness, to observe brotherly feeling, to endure injury, to be long-suffering, to bear no grudge.’* (Hermas 13:1) It ain''t new — this is the very heart of pure religion James names: *Pure religion and undefiled before Elohim (God) and the Father is this, To visit the fatherless and widows in their affliction, and to keep himself unspotted from the world* (James 1:27). Sha''ul bids the saints the same, *Distributing to the necessity of saints; given to hospitality* (Romans 12:13), and *Be kindly affectioned one to another with brotherly love; in honour preferring one another* (Romans 12:10). The mercy to the widow and orphan is the standing demand of the covenant, doing the good unto life.',
       sv.verse_id, ev.verse_id, 'extras', 71809
  FROM _session253_herm13_lookup sv, _session253_herm13_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=13 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=13 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: hermas-13-twofold-temperance-two-ways
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 34:14 — *Depart from evil, and do good; seek peace, and pursue it.* The Shepherd''s twofold temperance — abstain from the evil, do the good — is David''s own two-way path of the righteous, word for word.'
  FROM cross_reference_threads t, cross_references x, _session253_herm13_lookup sv, _session253_herm13_lookup tv
 WHERE t.slug='hermas-13-twofold-temperance-two-ways'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=34 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Amos 5:15 — *Hate the evil, and love the good, and establish judgment in the gate: it may be that Yahuah Elohim (the LORD God) of hosts will be gracious unto the remnant of Joseph.* Refrain from wickedness and do righteousness is the prophet''s own summons to the remnant — it ain''t new.'
  FROM cross_reference_threads t, cross_references x, _session253_herm13_lookup sv, _session253_herm13_lookup tv
 WHERE t.slug='hermas-13-twofold-temperance-two-ways'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=5 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Amos 5:14 — *Seek good, and not evil, that ye may live: and so Yahuah (LORD), the Elohim (God) of hosts, shall be with you, as ye have spoken.* The Shepherd binds the doing of good to life unto Elohim, just as Amos binds seeking good to living.'
  FROM cross_reference_threads t, cross_references x, _session253_herm13_lookup sv, _session253_herm13_lookup tv
 WHERE t.slug='hermas-13-twofold-temperance-two-ways'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=5 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 12:9 — *Let love be without dissimulation. Abhor that which is evil; cleave to that which is good.* Sha''ul folds the two ways into one charge — hate the evil, hold to the good — the very twofold temperance the Shepherd commands.'
  FROM cross_reference_threads t, cross_references x, _session253_herm13_lookup sv, _session253_herm13_lookup tv
 WHERE t.slug='hermas-13-twofold-temperance-two-ways'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=12 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-13-abstain-from-wickedness
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 1:16 — *Wash you, make you clean; put away the evil of your doings from before mine eyes; cease to do evil;* the Shepherd''s call to be temperate as to evil and abstain from it is the prophet''s own cease-to-do-evil, spoken to a people he would cleanse.'
  FROM cross_reference_threads t, cross_references x, _session253_herm13_lookup sv, _session253_herm13_lookup tv
 WHERE t.slug='hermas-13-abstain-from-wickedness'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=1 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Thessalonians 5:22 — *Abstain from all appearance of evil.* The whole charge to refrain from every wickedness is Sha''ul''s plain word to the children of the day, gathered into one line.'
  FROM cross_reference_threads t, cross_references x, _session253_herm13_lookup sv, _session253_herm13_lookup tv
 WHERE t.slug='hermas-13-abstain-from-wickedness'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-thessalonians' AND tv.chapter_number=5 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Thessalonians 5:21 — *Prove all things; hold fast that which is good.* Before bidding the faithful flee evil, Sha''ul bids them weigh and cleave to the good — the same twofold discernment the Shepherd teaches.'
  FROM cross_reference_threads t, cross_references x, _session253_herm13_lookup sv, _session253_herm13_lookup tv
 WHERE t.slug='hermas-13-abstain-from-wickedness'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-thessalonians' AND tv.chapter_number=5 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-13-works-of-the-good
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 1:17 — *Learn to do well; seek judgment, relieve the oppressed, judge the fatherless, plead for the widow.* The Shepherd''s works of the good — righteousness, mercy, doing well — are the prophet''s own learn-to-do-well, the godly deeds that follow the washing clean.'
  FROM cross_reference_threads t, cross_references x, _session253_herm13_lookup sv, _session253_herm13_lookup tv
 WHERE t.slug='hermas-13-works-of-the-good'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=1 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 12:12 — *Rejoicing in hope; patient in tribulation; continuing instant in prayer;* the patience and steadfast goodness the Shepherd lists among the works of the good are Sha''ul''s own marks of the living sacrifice.'
  FROM cross_reference_threads t, cross_references x, _session253_herm13_lookup sv, _session253_herm13_lookup tv
 WHERE t.slug='hermas-13-works-of-the-good'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=12 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'James 1:25 — *But whoso looketh into the perfect law of liberty, and continueth therein, he being not a forgetful hearer, but a doer of the work, this man shall be blessed in his deed.* The Shepherd''s promise that the one who keeps the good becomes blessed in his life is the doer''s blessing James pronounces over the keeper of the perfect law.'
  FROM cross_reference_threads t, cross_references x, _session253_herm13_lookup sv, _session253_herm13_lookup tv
 WHERE t.slug='hermas-13-works-of-the-good'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-13-minister-to-widows-orphans
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'James 1:27 — *Pure religion and undefiled before Elohim (God) and the Father is this, To visit the fatherless and widows in their affliction, and to keep himself unspotted from the world.* The Shepherd''s ministering to widows and visiting the orphans, while abstaining from all wickedness, is the very pure-and-undefiled religion James defines.'
  FROM cross_reference_threads t, cross_references x, _session253_herm13_lookup sv, _session253_herm13_lookup tv
 WHERE t.slug='hermas-13-minister-to-widows-orphans'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 12:13 — *Distributing to the necessity of saints; given to hospitality.* The Shepherd''s charge to relieve the needy and to be hospitable is Sha''ul''s own word to the body of Messiah — the good works that build up the saints.'
  FROM cross_reference_threads t, cross_references x, _session253_herm13_lookup sv, _session253_herm13_lookup tv
 WHERE t.slug='hermas-13-minister-to-widows-orphans'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=12 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 12:10 — *Be kindly affectioned one to another with brotherly love; in honour preferring one another;* the brotherly feeling, the reverence for the aged, and the bearing of no grudge that the Shepherd commends are Sha''ul''s own brotherly love that prefers another before self.'
  FROM cross_reference_threads t, cross_references x, _session253_herm13_lookup sv, _session253_herm13_lookup tv
 WHERE t.slug='hermas-13-minister-to-widows-orphans'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=12 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_hermas_14.sql (session253 hermas 14) -----
-- Source anchor: lightfoot-apostolic-fathers/hermas ch14. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: herm14 (view _session253_herm14_lookup). Sort band base 71825, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_herm14_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: hermas-14-ask-nothing-wavering
  ('lightfoot-apostolic-fathers', 'hermas', 14, 1, 'canon', 'james', 1, 6, 'free', E'James 1:6 — *But let him ask in faith, nothing wavering. For he that wavereth is like a wave of the sea driven with the wind and tossed.* The Shepherd''s ''ask of Yahuah nothing wavering'' is Ya''aqov''s (James''s) very word — the same charge to ask in faith, the same wavering soul tossed like the sea.'),
  ('lightfoot-apostolic-fathers', 'hermas', 14, 1, 'canon', 'james', 1, 7, 'free', E'James 1:7 — *For let not that man think that he shall receive any thing of Yahuah (Lord).* The Shepherd''s ruling that the waverer ''shall surely receive none of thy petitions'' is Ya''aqov''s (James''s) own sentence on the man who doubts — it ain''t new.'),
  -- thread: hermas-14-doubtful-minded-double-minded
  ('lightfoot-apostolic-fathers', 'hermas', 14, 1, 'canon', 'james', 1, 8, 'free', E'James 1:8 — *A double minded man is unstable in all his ways.* The Shepherd''s ''doubtful-minded'' man who never obtains his petitions is Ya''aqov''s (James''s) double-minded man, unstable in all his ways — the same divided heart in the same Spirit.'),
  ('lightfoot-apostolic-fathers', 'hermas', 14, 1, 'canon', 'james', 3, 15, 'free', E'James 3:15 — *This wisdom descendeth not from above, but is earthly, sensual, devilish.* The Shepherd''s word that doubtful-mindedness ''is an earthly spirit from the devil... a daughter of the devil'' matches Ya''aqov''s (James''s) verdict on what is earthly and devilish, not from above.'),
  -- thread: hermas-14-faith-from-above-receives-all
  ('lightfoot-apostolic-fathers', 'hermas', 14, 1, 'canon', 'matthew', 21, 22, 'free', E'Matthew 21:22 — *And all things, whatsoever ye shall ask in prayer, believing, ye shall receive.* The Shepherd''s promise that they who ask trusting and nothing doubting ''shall receive all things'' is the Master''s own word — ask believing, and receive.'),
  ('lightfoot-apostolic-fathers', 'hermas', 14, 1, 'canon', 'mark', 11, 24, 'free', E'Mark 11:24 — *Therefore I say unto you, What things soever ye desire, when ye pray, believe that ye receive them, and ye shall have them.* The Shepherd''s ''ask without wavering, nothing doubting, and ye receive'' is the Master''s command to believe when you pray, that you may have — it ain''t new.'),
  -- thread: hermas-14-put-on-strong-faith-please-elohim
  ('lightfoot-apostolic-fathers', 'hermas', 14, 1, 'canon', 'hebrews', 11, 6, 'free', E'Hebrews 11:6 — *But without faith it is impossible to please him: for he that cometh to Elohim (God) must believe that he is, and that he is a rewarder of them that diligently seek him.* The Shepherd''s call to ''put on faith which is strong and trust Elohim that thou wilt receive'' rests on the same foundation — he that cometh to Elohim must believe He rewards the seeker.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_herm14_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_herm14_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-14-ask-nothing-wavering',
       E'Ask of Yahuah nothing wavering — the double-minded receive nothing',
       E'The Shepherd sets the whole law of prayer in one charge: *turn to Yahuah (Lord) with thy whole heart, and ask of Him nothing wavering, and thou shalt know His exceeding compassion... ask of Yahuah (Lord), and thou shalt receive all things, and shalt lack nothing of all thy petitions, if thou ask of Yahuah (Lord) nothing wavering. But if thou waver in thy heart, thou shalt surely receive none of thy petitions.* (Hermas 14:1) It ain''t new — Ya''aqov (James) had already laid the same measure on the man who prays: *But let him ask in faith, nothing wavering. For he that wavereth is like a wave of the sea driven with the wind and tossed* (James 1:6), and the verdict that follows is the Shepherd''s verdict exactly: *For let not that man think that he shall receive any thing of Yahuah (Lord)* (James 1:7). The wavering heart and the empty hand stand together in both witnesses, one teaching, never two.',
       sv.verse_id, ev.verse_id, 'extras', 71825
  FROM _session253_herm14_lookup sv, _session253_herm14_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=14 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=14 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-14-doubtful-minded-double-minded',
       E'The doubtful-minded — the double-minded man unstable in all his ways',
       E'The Shepherd names the sickness and traces it to its root: *For they that waver towards Elohim (God), these are the doubtful-minded, and they never obtain any of their petitions... for every doubtful-minded man, if he repent not, shall hardly be saved... For indeed this doubtful-mindedness is a daughter of the devil, and worketh great wickedness against the servants of Elohim (God).* (Hermas 14:1) Ya''aqov (James) had already coined the very word and pronounced the very instability: *A double minded man is unstable in all his ways* (James 1:8). And the Shepherd''s word that this spirit *is an earthly spirit from the devil, and hath no power* is Ya''aqov''s (James''s) own anatomy of the wisdom that is not from above: *This wisdom descendeth not from above, but is earthly, sensual, devilish* (James 3:15). Two men of the same Spirit, naming the same divided heart — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 71828
  FROM _session253_herm14_lookup sv, _session253_herm14_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=14 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=14 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-14-faith-from-above-receives-all',
       E'Faith is from above and receiveth all — believe, and ye shall receive',
       E'Over against the waverer the Shepherd lifts the faithful soul: *But they that are complete in the faith make all their petitions trusting in Yahuah (Lord), and they receive, because they ask without wavering, nothing doubting... faith is from above from Yahuah (Lord), and hath great power.* (Hermas 14:1) This is the Master''s own promise in the temple court: *And all things, whatsoever ye shall ask in prayer, believing, ye shall receive* (Matthew 21:22), and again on the road from Bethany: *What things soever ye desire, when ye pray, believe that ye receive them, and ye shall have them* (Mark 11:24). The Shepherd''s ''ask without wavering, nothing doubting'' is the Master''s ''believing... and shall not doubt in his heart'' — the Shepherd of repentance teaches no new prayer, only the prayer Yahusha (Jesus) Himself gave.',
       sv.verse_id, ev.verse_id, 'extras', 71831
  FROM _session253_herm14_lookup sv, _session253_herm14_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=14 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=14 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-14-put-on-strong-faith-please-elohim',
       E'Put on faith which is strong — without faith it is impossible to please Him',
       E'The Shepherd''s closing charge turns from the warning to the cure: *Cleanse therefore thy heart from doubtful-mindedness, and put on faith, for it is strong, and trust Elohim (God) that thou wilt receive all thy petitions which thou askest... Do thou therefore serve that faith which hath power... and thou shalt live unto Elohim (God).* (Hermas 14:1) It ain''t new — the writer to the Ivrim (Hebrews) had set the same foundation under all approach to Yahuah: *But without faith it is impossible to please him: for he that cometh to Elohim (God) must believe that he is, and that he is a rewarder of them that diligently seek him* (Hebrews 11:6). The doubtful heart cannot please Him because it does not trust that He rewards the seeker; the strong faith the Shepherd bids us put on is the very faith that draws near believing — the one path to life unto Elohim.',
       sv.verse_id, ev.verse_id, 'extras', 71834
  FROM _session253_herm14_lookup sv, _session253_herm14_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=14 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=14 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: hermas-14-ask-nothing-wavering
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'James 1:6 — *But let him ask in faith, nothing wavering. For he that wavereth is like a wave of the sea driven with the wind and tossed.* The Shepherd''s ''ask of Yahuah nothing wavering'' is Ya''aqov''s (James''s) very word — the same charge to ask in faith, the same wavering soul tossed like the sea.'
  FROM cross_reference_threads t, cross_references x, _session253_herm14_lookup sv, _session253_herm14_lookup tv
 WHERE t.slug='hermas-14-ask-nothing-wavering'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=14 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'James 1:7 — *For let not that man think that he shall receive any thing of Yahuah (Lord).* The Shepherd''s ruling that the waverer ''shall surely receive none of thy petitions'' is Ya''aqov''s (James''s) own sentence on the man who doubts — it ain''t new.'
  FROM cross_reference_threads t, cross_references x, _session253_herm14_lookup sv, _session253_herm14_lookup tv
 WHERE t.slug='hermas-14-ask-nothing-wavering'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=14 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-14-doubtful-minded-double-minded
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'James 1:8 — *A double minded man is unstable in all his ways.* The Shepherd''s ''doubtful-minded'' man who never obtains his petitions is Ya''aqov''s (James''s) double-minded man, unstable in all his ways — the same divided heart in the same Spirit.'
  FROM cross_reference_threads t, cross_references x, _session253_herm14_lookup sv, _session253_herm14_lookup tv
 WHERE t.slug='hermas-14-doubtful-minded-double-minded'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=14 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'James 3:15 — *This wisdom descendeth not from above, but is earthly, sensual, devilish.* The Shepherd''s word that doubtful-mindedness ''is an earthly spirit from the devil... a daughter of the devil'' matches Ya''aqov''s (James''s) verdict on what is earthly and devilish, not from above.'
  FROM cross_reference_threads t, cross_references x, _session253_herm14_lookup sv, _session253_herm14_lookup tv
 WHERE t.slug='hermas-14-doubtful-minded-double-minded'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=14 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-14-faith-from-above-receives-all
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 21:22 — *And all things, whatsoever ye shall ask in prayer, believing, ye shall receive.* The Shepherd''s promise that they who ask trusting and nothing doubting ''shall receive all things'' is the Master''s own word — ask believing, and receive.'
  FROM cross_reference_threads t, cross_references x, _session253_herm14_lookup sv, _session253_herm14_lookup tv
 WHERE t.slug='hermas-14-faith-from-above-receives-all'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=14 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=21 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Mark 11:24 — *Therefore I say unto you, What things soever ye desire, when ye pray, believe that ye receive them, and ye shall have them.* The Shepherd''s ''ask without wavering, nothing doubting, and ye receive'' is the Master''s command to believe when you pray, that you may have — it ain''t new.'
  FROM cross_reference_threads t, cross_references x, _session253_herm14_lookup sv, _session253_herm14_lookup tv
 WHERE t.slug='hermas-14-faith-from-above-receives-all'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=14 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=11 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-14-put-on-strong-faith-please-elohim
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 11:6 — *But without faith it is impossible to please him: for he that cometh to Elohim (God) must believe that he is, and that he is a rewarder of them that diligently seek him.* The Shepherd''s call to ''put on faith which is strong and trust Elohim that thou wilt receive'' rests on the same foundation — he that cometh to Elohim must believe He rewards the seeker.'
  FROM cross_reference_threads t, cross_references x, _session253_herm14_lookup sv, _session253_herm14_lookup tv
 WHERE t.slug='hermas-14-put-on-strong-faith-please-elohim'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=14 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_hermas_15.sql (session253 hermas 15) -----
-- Source anchor: lightfoot-apostolic-fathers/hermas ch15. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: herm15 (view _session253_herm15_lookup). Sort band base 71850, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_herm15_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: hermas-15-sorrow-crushes-the-ruach
  ('lightfoot-apostolic-fathers', 'hermas', 15, 1, 'canon', 'ephesians', 4, 30, 'free', E'Ephesians 4:30 — *And grieve not the holy Spirit of Elohim (God), whereby ye are sealed unto the day of redemption.* The Shepherd''s warning that sorrow crusheth out the Ruach HaKodesh is Sha''ul''s own charge — grieve not the Spirit (Hermas 15:1).'),
  ('lightfoot-apostolic-fathers', 'hermas', 15, 1, 'canon', 'proverbs', 17, 22, 'free', E'Proverbs 17:22 — *A merry heart doeth good like a medicine: but a broken spirit drieth the bones.* That sorrow is most fatal to the servants of Elohim, while cheerfulness heals, is the wise man''s word long before the Shepherd (Hermas 15:1).'),
  -- thread: hermas-15-grieve-not-the-spirit-that-dwelleth
  ('lightfoot-apostolic-fathers', 'hermas', 15, 2, 'canon', 'ephesians', 4, 30, 'free', E'Ephesians 4:30 — *And grieve not the holy Spirit of Elohim (God), whereby ye are sealed unto the day of redemption.* The Shepherd''s ''afflict not the Ruach HaKodesh that dwelleth in thee'' is Sha''ul''s plain charge not to grieve the Spirit (Hermas 15:2).'),
  ('lightfoot-apostolic-fathers', 'hermas', 15, 2, 'canon', '1-thessalonians', 5, 19, 'free', E'1 Thessalonians 5:19 — *Quench not the Spirit.* The sadness that crusheth out the Ruach HaKodesh is the very quenching Sha''ul forbids (Hermas 15:2).'),
  ('lightfoot-apostolic-fathers', 'hermas', 15, 2, 'canon', 'psalms', 51, 11, 'free', E'Psalm 51:11 — *Cast me not away from thy presence; and take not thy holy spirit from me.* The Shepherd''s warning lest the Spirit depart from the saddened man is David''s own penitent plea that the holy Spirit not be taken away (Hermas 15:2).'),
  -- thread: hermas-15-godly-sorrow-unto-repentance
  ('lightfoot-apostolic-fathers', 'hermas', 15, 2, 'canon', '2-corinthians', 7, 10, 'free', E'2 Corinthians 7:10 — *For godly sorrow worketh repentance to salvation not to be repented of: but the sorrow of the world worketh death.* The Shepherd''s sadness that brings salvation because the man repented of his evil is Sha''ul''s godly sorrow that worketh repentance, set against the worldly sorrow that crusheth the Spirit unto death (Hermas 15:2).'),
  -- thread: hermas-15-clothe-thyself-in-cheerfulness
  ('lightfoot-apostolic-fathers', 'hermas', 15, 3, 'canon', 'nehemiah', 8, 10, 'free', E'Nehemiah 8:10 — *Then he said unto them, Go your way, eat the fat, and drink the sweet, and send portions unto them for whom nothing is prepared: for this day is holy unto our Lord: neither be ye sorry; for the joy of Yahuah (LORD) is your strength.* The Shepherd''s call to put away sadness and clothe in cheerfulness is Nehemiah''s word to the weeping people — the joy of Yahuah is their strength (Hermas 15:3).'),
  ('lightfoot-apostolic-fathers', 'hermas', 15, 3, 'canon', 'philippians', 4, 4, 'free', E'Philippians 4:4 — *Rejoice in Yahuah (Lord) alway: and again I say, Rejoice.* The Shepherd''s ''clothe thyself in cheerfulness... and rejoice in it'' is Sha''ul''s twice-spoken command to rejoice in Yahuah always (Hermas 15:3).'),
  ('lightfoot-apostolic-fathers', 'hermas', 15, 3, 'canon', '1-thessalonians', 5, 16, 'free', E'1 Thessalonians 5:16 — *Rejoice evermore.* The cheerfulness that hath favour with Elohim always is Sha''ul''s briefest charge — rejoice evermore (Hermas 15:3).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_herm15_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_herm15_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-15-sorrow-crushes-the-ruach',
       E'Sorrow crusheth out the Ruach HaKodesh — put her away',
       E'The Shepherd charges Hermas plainly: *‘Put away sorrow from thyself,’ saith he, ‘for she is the sister of doubtful-mindedness and of angry temper.’* He names her the deadliest of the spirits: *sorrow is more evil than all the spirits, and is most fatal to the servants of Elohim (God), and beyond all the spirits destroys a man, and crushes out the Ruach HaKodesh (Holy Spirit)* (Hermas 15:1). It ain''t new. Sha''ul lays the same charge upon every saint: *And grieve not the holy Spirit of Elohim (God), whereby ye are sealed unto the day of redemption* (Ephesians 4:30). And the wise man knew long before that a crushed spirit withers the whole man, while gladness heals: *A merry heart doeth good like a medicine: but a broken spirit drieth the bones* (Proverbs 17:22). The Shepherd is teaching no novel discipline — he is teaching the old wisdom and the apostle''s plain word.',
       sv.verse_id, ev.verse_id, 'extras', 71850
  FROM _session253_herm15_lookup sv, _session253_herm15_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=15 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=15 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-15-grieve-not-the-spirit-that-dwelleth',
       E'Afflict not the Ruach HaKodesh that dwelleth in thee, lest He depart',
       E'The Shepherd warns what sadness costs: *Put away therefore from thyself sadness, and afflict not the Ruach HaKodesh (Holy Spirit) that dwelleth in thee, lest haply He intercede with Elohim (God) [against thee], and depart from thee. For the Spirit of Elohim (God), that was given unto this flesh, endureth not sadness neither constraint* (Hermas 15:2). It ain''t new. This is Sha''ul''s very command: *And grieve not the holy Spirit of Elohim (God), whereby ye are sealed unto the day of redemption* (Ephesians 4:30), and his terse word to the assembly: *Quench not the Spirit* (1 Thessalonians 5:19). The dread of the Spirit departing is David''s own prayer in his repentance: *Cast me not away from thy presence; and take not thy holy spirit from me* (Psalm 51:11). The indwelling Ruach is grieved by the same sorrow the prophets and apostles already named — come and see, it is one teaching.',
       sv.verse_id, ev.verse_id, 'extras', 71853
  FROM _session253_herm15_lookup sv, _session253_herm15_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=15 AND sv.verse_number=2
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=15 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-15-godly-sorrow-unto-repentance',
       E'The sadness that worketh salvation — godly versus worldly sorrow',
       E'The Shepherd draws a fine line: the doubtful mind and the angry temper both sadden the Spirit, yet of the man embittered who turns he says, *again sorrow entereth into the heart of the man that was ill-tempered, and he is grieved at the deed which he hath done, and repenteth that he did evil. This sadness therefore seemeth to bring salvation, because he repented at having done the evil* (Hermas 15:2). It ain''t new — this is precisely Sha''ul''s two-edged word on grief: *For godly sorrow worketh repentance to salvation not to be repented of: but the sorrow of the world worketh death* (2 Corinthians 7:10). The Shepherd, the angel of repentance, makes the same distinction the apostle made: there is a sorrow that crushes the Spirit unto death, and a sorrow that turns the heart unto life.',
       sv.verse_id, ev.verse_id, 'extras', 71856
  FROM _session253_herm15_lookup sv, _session253_herm15_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=15 AND sv.verse_number=2
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=15 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-15-clothe-thyself-in-cheerfulness',
       E'Clothe thyself in cheerfulness — that the intercession ascend pure',
       E'The Shepherd ends with the cure: *Therefore clothe thyself in cheerfulness, which hath favour with Elohim (God) always, and is acceptable to Him, and rejoice in it* (Hermas 15:3). The sad man''s prayer cannot rise — *the intercession of a sad man hath never at any time power to ascend to the altar of Elohim (God)* — for *as vinegar when mingled with wine... hath not the same pleasant taste, so likewise sadness mingled with the Ruach HaKodesh (Holy Spirit) hath not the same intercession*. It ain''t new. Nehemiah set the joy of Yahuah against the people''s weeping on a holy day: *neither be ye sorry; for the joy of Yahuah (LORD) is your strength* (Nehemiah 8:10). Sha''ul made cheerfulness a standing command: *Rejoice in Yahuah (Lord) alway: and again I say, Rejoice* (Philippians 4:4), and *Rejoice evermore* (1 Thessalonians 5:16). To put on gladness and rejoice before the altar is the old path of the faithful, not a new word.',
       sv.verse_id, ev.verse_id, 'extras', 71859
  FROM _session253_herm15_lookup sv, _session253_herm15_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=15 AND sv.verse_number=3
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=15 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: hermas-15-sorrow-crushes-the-ruach
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ephesians 4:30 — *And grieve not the holy Spirit of Elohim (God), whereby ye are sealed unto the day of redemption.* The Shepherd''s warning that sorrow crusheth out the Ruach HaKodesh is Sha''ul''s own charge — grieve not the Spirit (Hermas 15:1).'
  FROM cross_reference_threads t, cross_references x, _session253_herm15_lookup sv, _session253_herm15_lookup tv
 WHERE t.slug='hermas-15-sorrow-crushes-the-ruach'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=15 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=4 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 17:22 — *A merry heart doeth good like a medicine: but a broken spirit drieth the bones.* That sorrow is most fatal to the servants of Elohim, while cheerfulness heals, is the wise man''s word long before the Shepherd (Hermas 15:1).'
  FROM cross_reference_threads t, cross_references x, _session253_herm15_lookup sv, _session253_herm15_lookup tv
 WHERE t.slug='hermas-15-sorrow-crushes-the-ruach'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=15 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=17 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-15-grieve-not-the-spirit-that-dwelleth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ephesians 4:30 — *And grieve not the holy Spirit of Elohim (God), whereby ye are sealed unto the day of redemption.* The Shepherd''s ''afflict not the Ruach HaKodesh that dwelleth in thee'' is Sha''ul''s plain charge not to grieve the Spirit (Hermas 15:2).'
  FROM cross_reference_threads t, cross_references x, _session253_herm15_lookup sv, _session253_herm15_lookup tv
 WHERE t.slug='hermas-15-grieve-not-the-spirit-that-dwelleth'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=15 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=4 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Thessalonians 5:19 — *Quench not the Spirit.* The sadness that crusheth out the Ruach HaKodesh is the very quenching Sha''ul forbids (Hermas 15:2).'
  FROM cross_reference_threads t, cross_references x, _session253_herm15_lookup sv, _session253_herm15_lookup tv
 WHERE t.slug='hermas-15-grieve-not-the-spirit-that-dwelleth'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=15 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='1-thessalonians' AND tv.chapter_number=5 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 51:11 — *Cast me not away from thy presence; and take not thy holy spirit from me.* The Shepherd''s warning lest the Spirit depart from the saddened man is David''s own penitent plea that the holy Spirit not be taken away (Hermas 15:2).'
  FROM cross_reference_threads t, cross_references x, _session253_herm15_lookup sv, _session253_herm15_lookup tv
 WHERE t.slug='hermas-15-grieve-not-the-spirit-that-dwelleth'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=15 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=51 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-15-godly-sorrow-unto-repentance
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Corinthians 7:10 — *For godly sorrow worketh repentance to salvation not to be repented of: but the sorrow of the world worketh death.* The Shepherd''s sadness that brings salvation because the man repented of his evil is Sha''ul''s godly sorrow that worketh repentance, set against the worldly sorrow that crusheth the Spirit unto death (Hermas 15:2).'
  FROM cross_reference_threads t, cross_references x, _session253_herm15_lookup sv, _session253_herm15_lookup tv
 WHERE t.slug='hermas-15-godly-sorrow-unto-repentance'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=15 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=7 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-15-clothe-thyself-in-cheerfulness
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Nehemiah 8:10 — *Then he said unto them, Go your way, eat the fat, and drink the sweet, and send portions unto them for whom nothing is prepared: for this day is holy unto our Lord: neither be ye sorry; for the joy of Yahuah (LORD) is your strength.* The Shepherd''s call to put away sadness and clothe in cheerfulness is Nehemiah''s word to the weeping people — the joy of Yahuah is their strength (Hermas 15:3).'
  FROM cross_reference_threads t, cross_references x, _session253_herm15_lookup sv, _session253_herm15_lookup tv
 WHERE t.slug='hermas-15-clothe-thyself-in-cheerfulness'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=15 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=8 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Philippians 4:4 — *Rejoice in Yahuah (Lord) alway: and again I say, Rejoice.* The Shepherd''s ''clothe thyself in cheerfulness... and rejoice in it'' is Sha''ul''s twice-spoken command to rejoice in Yahuah always (Hermas 15:3).'
  FROM cross_reference_threads t, cross_references x, _session253_herm15_lookup sv, _session253_herm15_lookup tv
 WHERE t.slug='hermas-15-clothe-thyself-in-cheerfulness'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=15 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Thessalonians 5:16 — *Rejoice evermore.* The cheerfulness that hath favour with Elohim always is Sha''ul''s briefest charge — rejoice evermore (Hermas 15:3).'
  FROM cross_reference_threads t, cross_references x, _session253_herm15_lookup sv, _session253_herm15_lookup tv
 WHERE t.slug='hermas-15-clothe-thyself-in-cheerfulness'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=15 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='1-thessalonians' AND tv.chapter_number=5 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_hermas_16.sql (session253 hermas 16) -----
-- Source anchor: lightfoot-apostolic-fathers/hermas ch16. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: herm16 (view _session253_herm16_lookup). Sort band base 71875, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_herm16_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: hermas-16-know-the-prophet-by-his-life
  ('lightfoot-apostolic-fathers', 'hermas', 16, 1, 'canon', 'matthew', 7, 15, 'free', E'Matthew 7:15 — *Beware of false prophets, which come to you in sheep’s clothing, but inwardly they are ravening wolves.* The Shepherd''s false prophet on the chair, who destroys the doubtful-minded, is the Master''s wolf in sheep''s clothing — the warning is one and the same.'),
  ('lightfoot-apostolic-fathers', 'hermas', 16, 1, 'canon', 'matthew', 7, 16, 'free', E'Matthew 7:16 — *Ye shall know them by their fruits. Do men gather grapes of thorns, or figs of thistles?* The Shepherd''s command to test the prophet ''by his life and his works'' is the Master''s own test of fruit — you know the tree by what it bears.'),
  ('lightfoot-apostolic-fathers', 'hermas', 16, 1, 'canon', 'matthew', 7, 19, 'free', E'Matthew 7:19 — *Every tree that bringeth not forth good fruit is hewn down, and cast into the fire.* The empty prophet whose earthly spirit comes from the devil bears no good fruit, and so falls under the same sentence the Master pronounced on the fruitless tree.'),
  -- thread: hermas-16-try-the-spirits
  ('lightfoot-apostolic-fathers', 'hermas', 16, 1, 'canon', '1-john', 4, 1, 'free', E'1 John 4:1 — *Beloved, believe not every spirit, but try the spirits whether they are of Elohim (God): because many false prophets are gone out into the world.* The Shepherd''s charge to trust the Spirit from Elohim and put no trust in the earthly spirit from the devil is the apostle''s own command to try the spirits — for the false prophets are abroad in both witnesses alike.'),
  -- thread: hermas-16-the-presumptuous-prophet
  ('lightfoot-apostolic-fathers', 'hermas', 16, 1, 'canon', 'jeremiah', 23, 16, 'free', E'Jeremiah 23:16 — *Thus saith Yahuah Tseva''ot (LORD of hosts), Hearken not unto the words of the prophets that prophesy unto you: they make you vain: they speak a vision of their own heart, and not out of the mouth of Yahuah (LORD).* The Shepherd''s empty prophet who answers out of his own emptiness is Yirmeyahu''s prophet who speaks a vision of his own heart and not out of the mouth of Yahuah.'),
  ('lightfoot-apostolic-fathers', 'hermas', 16, 1, 'canon', 'deuteronomy', 18, 21, 'free', E'Deuteronomy 18:21 — *And if thou say in thine heart, How shall we know the word which Yahuah (LORD) hath not spoken?* Hermas''s question, ''how shall a man know who is a prophet, and who a false prophet?'', is the very question Moses set before Yashar''el — it ain''t new.'),
  ('lightfoot-apostolic-fathers', 'hermas', 16, 1, 'canon', 'deuteronomy', 18, 22, 'free', E'Deuteronomy 18:22 — *When a prophet speaketh in the name of Yahuah (LORD), if the thing follow not, nor come to pass, that is the thing which Yahuah (LORD) hath not spoken, but the prophet hath spoken it presumptuously: thou shalt not be afraid of him.* The Torah''s test of the prophet by whether his word stands is the same discernment the Shepherd teaches — the true word has the power of deity, the presumptuous word is empty and fails.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_herm16_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_herm16_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-16-know-the-prophet-by-his-life',
       E'Test the prophet by his life and his works — know them by their fruits',
       E'When Hermas asks how a man may tell the true prophet from the false, the Shepherd answers not by oracle but by life: *‘By his life test the man that hath the divine Spirit. In the first place, he that hath the [divine] Spirit, which is from above, is gentle and tranquil and humble-minded, and abstaineth from all wickedness and vain desire of this present world...’* And he seals it: *‘Therefore test, by his life and his works, the man who says that he is moved by the Spirit.’* (Hermas 16:1) It ain''t new — the Master gave the very same measuring-rod on the mountain: *Beware of false prophets, which come to you in sheep’s clothing, but inwardly they are ravening wolves.* (Matthew 7:15) And how is the wolf unmasked? Not by the smoothness of his word but by his fruit: *Ye shall know them by their fruits. Do men gather grapes of thorns, or figs of thistles?* (Matthew 7:16), for *Every tree that bringeth not forth good fruit is hewn down, and cast into the fire.* (Matthew 7:19). The Shepherd''s gentle, humble, money-refusing prophet bears the fruit of the Spirit that is from above; the empty one is known the same way the Master named — by what grows from his life.',
       sv.verse_id, ev.verse_id, 'extras', 71875
  FROM _session253_herm16_lookup sv, _session253_herm16_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=16 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=16 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-16-try-the-spirits',
       E'Trust the Spirit from Elohim, try the empty spirit — believe not every spirit',
       E'The Shepherd sets two spirits before Hermas and bids him weigh them: *‘But do thou trust the Spirit that cometh from Elohim (God), and hath power; but in the earthly and empty spirit put no trust at all; for in it there is no power, for it cometh from the devil.’* The false prophet *‘speaketh also some true words; for the devil filleth him with his own spirit, if so be he shall be able to break down some of the righteous.’* (Hermas 16:1) It ain''t new — the beloved disciple gave the assembly this very discipline: *Beloved, believe not every spirit, but try the spirits whether they are of Elohim (God): because many false prophets are gone out into the world.* (1 John 4:1) The Shepherd''s warning that a lying spirit may even mix in true words, the better to break the righteous, is why Yochanan bids us not to believe every spirit but to prove them — the deceiver wears truth as a costume, and only the testing unmasks him.',
       sv.verse_id, ev.verse_id, 'extras', 71878
  FROM _session253_herm16_lookup sv, _session253_herm16_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=16 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=16 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-16-the-presumptuous-prophet',
       E'The prophet who speaks of his own heart — the presumptuous word that fails',
       E'The false prophet in Hermas has no Spirit of his own: *‘For being empty himself he giveth empty answers to empty enquirers; for whatever enquiry may be made of him, he answereth according to the emptiness of the man,’* and he *‘receiveth money for his prophesying, and if he receiveth not, he prophesieth not.’* (Hermas 16:1) It ain''t new — the prophets long before named this empty word for what it is: *Thus saith Yahuah Tseva''ot (LORD of hosts), Hearken not unto the words of the prophets that prophesy unto you: they make you vain: they speak a vision of their own heart, and not out of the mouth of Yahuah (LORD).* (Jeremiah 23:16). And Moses gave Yashar''el the plain test for the hireling oracle — *And if thou say in thine heart, How shall we know the word which Yahuah (LORD) hath not spoken?* (Deuteronomy 18:21) — answered by the fruit of the word itself: *When a prophet speaketh in the name of Yahuah (LORD), if the thing follow not, nor come to pass, that is the thing which Yahuah (LORD) hath not spoken, but the prophet hath spoken it presumptuously: thou shalt not be afraid of him.* (Deuteronomy 18:22). The Shepherd''s empty answerer is the Torah''s presumptuous prophet, the prophet of his own heart — the lie has a lineage, and so does the test that exposes it.',
       sv.verse_id, ev.verse_id, 'extras', 71881
  FROM _session253_herm16_lookup sv, _session253_herm16_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=16 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=16 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: hermas-16-know-the-prophet-by-his-life
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 7:15 — *Beware of false prophets, which come to you in sheep’s clothing, but inwardly they are ravening wolves.* The Shepherd''s false prophet on the chair, who destroys the doubtful-minded, is the Master''s wolf in sheep''s clothing — the warning is one and the same.'
  FROM cross_reference_threads t, cross_references x, _session253_herm16_lookup sv, _session253_herm16_lookup tv
 WHERE t.slug='hermas-16-know-the-prophet-by-his-life'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=16 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 7:16 — *Ye shall know them by their fruits. Do men gather grapes of thorns, or figs of thistles?* The Shepherd''s command to test the prophet ''by his life and his works'' is the Master''s own test of fruit — you know the tree by what it bears.'
  FROM cross_reference_threads t, cross_references x, _session253_herm16_lookup sv, _session253_herm16_lookup tv
 WHERE t.slug='hermas-16-know-the-prophet-by-his-life'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=16 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 7:19 — *Every tree that bringeth not forth good fruit is hewn down, and cast into the fire.* The empty prophet whose earthly spirit comes from the devil bears no good fruit, and so falls under the same sentence the Master pronounced on the fruitless tree.'
  FROM cross_reference_threads t, cross_references x, _session253_herm16_lookup sv, _session253_herm16_lookup tv
 WHERE t.slug='hermas-16-know-the-prophet-by-his-life'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=16 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-16-try-the-spirits
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 John 4:1 — *Beloved, believe not every spirit, but try the spirits whether they are of Elohim (God): because many false prophets are gone out into the world.* The Shepherd''s charge to trust the Spirit from Elohim and put no trust in the earthly spirit from the devil is the apostle''s own command to try the spirits — for the false prophets are abroad in both witnesses alike.'
  FROM cross_reference_threads t, cross_references x, _session253_herm16_lookup sv, _session253_herm16_lookup tv
 WHERE t.slug='hermas-16-try-the-spirits'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=16 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=4 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-16-the-presumptuous-prophet
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 23:16 — *Thus saith Yahuah Tseva''ot (LORD of hosts), Hearken not unto the words of the prophets that prophesy unto you: they make you vain: they speak a vision of their own heart, and not out of the mouth of Yahuah (LORD).* The Shepherd''s empty prophet who answers out of his own emptiness is Yirmeyahu''s prophet who speaks a vision of his own heart and not out of the mouth of Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_herm16_lookup sv, _session253_herm16_lookup tv
 WHERE t.slug='hermas-16-the-presumptuous-prophet'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=16 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=23 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 18:21 — *And if thou say in thine heart, How shall we know the word which Yahuah (LORD) hath not spoken?* Hermas''s question, ''how shall a man know who is a prophet, and who a false prophet?'', is the very question Moses set before Yashar''el — it ain''t new.'
  FROM cross_reference_threads t, cross_references x, _session253_herm16_lookup sv, _session253_herm16_lookup tv
 WHERE t.slug='hermas-16-the-presumptuous-prophet'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=16 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 18:22 — *When a prophet speaketh in the name of Yahuah (LORD), if the thing follow not, nor come to pass, that is the thing which Yahuah (LORD) hath not spoken, but the prophet hath spoken it presumptuously: thou shalt not be afraid of him.* The Torah''s test of the prophet by whether his word stands is the same discernment the Shepherd teaches — the true word has the power of deity, the presumptuous word is empty and fails.'
  FROM cross_reference_threads t, cross_references x, _session253_herm16_lookup sv, _session253_herm16_lookup tv
 WHERE t.slug='hermas-16-the-presumptuous-prophet'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=16 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_hermas_17.sql (session253 hermas 17) -----
-- Source anchor: lightfoot-apostolic-fathers/hermas ch17. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: herm17 (view _session253_herm17_lookup). Sort band base 71900, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_herm17_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: hermas-17-cast-out-evil-desire-put-on-good
  ('lightfoot-apostolic-fathers', 'hermas', 17, 1, 'canon', 'galatians', 5, 16, 'free', E'Galatians 5:16 — *This I say then, Walk in the Spirit, and ye shall not fulfil the lust of the flesh.* The Shepherd''s charge to put off the evil desire and put on the good is Sha''ul''s (Paul''s) walk in the Spirit that does not fulfil the flesh.'),
  ('lightfoot-apostolic-fathers', 'hermas', 17, 1, 'canon', 'galatians', 5, 17, 'free', E'Galatians 5:17 — *For the flesh lusteth against the Spirit, and the Spirit against the flesh: and these are contrary the one to the other: so that ye cannot do the things that ye would.* The two warring desires of Hermas — the wild evil desire against the good and holy — are Sha''ul''s flesh-against-Spirit, contrary one to the other.'),
  ('lightfoot-apostolic-fathers', 'hermas', 17, 2, 'canon', 'romans', 13, 14, 'free', E'Romans 13:14 — *But put ye on the Lord Yahusha HaMashiach (Lord Jesus Christ), and make not provision for the flesh, to fulfil the lusts thereof.* The Shepherd''s ''clothe thyself in the desire of righteousness'' is the apostle''s putting-on of the Master and making no provision for the flesh.'),
  ('lightfoot-apostolic-fathers', 'hermas', 17, 2, 'canon', 'romans', 6, 12, 'free', E'Romans 6:12 — *Let not sin therefore reign in your mortal body, that ye should obey it in the lusts thereof.* Bridling and directing the wild desire so it no longer masters the man is Sha''ul''s word that sin must not reign in the body unto its lusts.'),
  -- thread: hermas-17-armed-with-the-fear-resist-and-it-flees
  ('lightfoot-apostolic-fathers', 'hermas', 17, 2, 'canon', 'james', 4, 7, 'free', E'James 4:7 — *Submit yourselves therefore to Elohim (God). Resist the devil, and he will flee from you.* The Shepherd''s word that the evil desire, seen the man armed and resisting, shall flee far from him is Ya''aqov''s (James''s) own promise: resist the devil and he will flee.'),
  ('lightfoot-apostolic-fathers', 'hermas', 17, 2, 'canon', '1-peter', 5, 8, 'free', E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour:* The evil desire that is ''a daughter of the devil'' is the very adversary Kepha (Peter) bids us watch — sober and vigilant against the roaring lion.'),
  ('lightfoot-apostolic-fathers', 'hermas', 17, 2, 'canon', '1-peter', 5, 9, 'free', E'1 Peter 5:9 — *Whom resist stedfast in the faith, knowing that the same afflictions are accomplished in your brethren that are in the world.* The Shepherd''s armed resisting that drives the desire away is Kepha''s resist-stedfast-in-the-faith against the same adversary.'),
  -- thread: hermas-17-serve-the-good-desire-walk-in-the-commandments
  ('lightfoot-apostolic-fathers', 'hermas', 17, 3, 'canon', 'deuteronomy', 30, 11, 'free', E'Deuteronomy 30:11 — *For this commandment which I command thee this day, it is not hidden from thee, neither is it far off.* The Shepherd''s correction — that the commandments are not too hard for the man who sets his heart — is Moses'' own word that the commandment is not far off.'),
  ('lightfoot-apostolic-fathers', 'hermas', 17, 4, 'canon', 'deuteronomy', 30, 14, 'free', E'Deuteronomy 30:14 — *But the word is very nigh unto thee, in thy mouth, and in thy heart, that thou mayest do it.* The man who has Yahuah in his heart finds nothing easier than these commandments — Moses said the word is very nigh, in the heart, that thou mayest do it. The commandments are never the curse.'),
  ('lightfoot-apostolic-fathers', 'hermas', 17, 4, 'canon', 'ephesians', 6, 11, 'free', E'Ephesians 6:11 — *Put on the whole armour of Elohim (God), that ye may be able to stand against the wiles of the devil.* The armour of the fear of Yahuah the Shepherd bids the servant wear is Sha''ul''s (Paul''s) whole armour of Elohim, worn to stand against the wiles of the devil.'),
  -- thread: hermas-17-fear-not-the-devil-resist-and-he-flees
  ('lightfoot-apostolic-fathers', 'hermas', 17, 4, 'canon', 'james', 4, 7, 'free', E'James 4:7 — *Submit yourselves therefore to Elohim (God). Resist the devil, and he will flee from you.* The angel of repentance''s ''fear not the devil... and he will flee from you'' is Ya''aqov''s (James''s) word verbatim in substance — resist the devil and he will flee.'),
  ('lightfoot-apostolic-fathers', 'hermas', 17, 5, 'canon', '1-peter', 5, 9, 'free', E'1 Peter 5:9 — *Whom resist stedfast in the faith, knowing that the same afflictions are accomplished in your brethren that are in the world.* ''If then ye resist him, he will be vanquished'' is Kepha''s (Peter''s) resist-stedfast-in-the-faith against the same adversary.'),
  ('lightfoot-apostolic-fathers', 'hermas', 17, 6, 'canon', 'ephesians', 6, 11, 'free', E'Ephesians 6:11 — *Put on the whole armour of Elohim (God), that ye may be able to stand against the wiles of the devil.* The threatening of the devil is empty ''like the sinews of a dead man'' because the servant stands in Sha''ul''s (Paul''s) whole armour of Elohim against his wiles.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_herm17_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_herm17_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-17-cast-out-evil-desire-put-on-good',
       E'Strip off the evil desire, clothe thyself in the good — flesh against Spirit',
       E'The Shepherd opens the twelfth and last commandment with a stripping and a clothing: *He saith to me; ‘Remove from thyself all evil desire, and clothe thyself in the desire which is good and holy; for clothed with this desire thou shalt hate the evil desire, and shalt bridle and direct it as thou wilt.’* (Hermas 17:1) And the warning that the two desires war: *But do thou clothe thyself in the desire of righteousness... For this evil desire is a daughter of the devil.* (Hermas 17:2) It ain''t new — Sha''ul (Paul) names the very same two-fold pull and the very same remedy: *This I say then, Walk in the Spirit, and ye shall not fulfil the lust of the flesh.* (Galatians 5:16) — *For the flesh lusteth against the Spirit, and the Spirit against the flesh: and these are contrary the one to the other: so that ye cannot do the things that ye would.* (Galatians 5:17) The clothing language is his too: *But put ye on the Lord Yahusha HaMashiach (Lord Jesus Christ), and make not provision for the flesh, to fulfil the lusts thereof.* (Romans 13:14) The Shepherd''s bridling of the wild desire is the apostle''s *Let not sin therefore reign in your mortal body, that ye should obey it in the lusts thereof.* (Romans 6:12) Two desires, one Spirit-clothed walk — the old battle, not a new one.',
       sv.verse_id, ev.verse_id, 'extras', 71900
  FROM _session253_herm17_lookup sv, _session253_herm17_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=17 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=17 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-17-armed-with-the-fear-resist-and-it-flees',
       E'Armed with the fear of Yahuah, resist — and the evil desire flees',
       E'The Shepherd hands Hermas his armour: *But do thou clothe thyself in the desire of righteousness, and, having armed thyself with the fear of Yahuah (Lord), resist them. For the fear of Elohim (God) dwelleth in the good desire. If the evil desire shall see thee armed with the fear of Elohim (God) and resisting itself, it shall flee far from thee, and shall no more be seen of thee, being in fear of thine arms.* (Hermas 17:2) It ain''t new — this is Ya''aqov''s (James''s) plain promise word for word in substance: *Submit yourselves therefore to Elohim (God). Resist the devil, and he will flee from you.* (James 4:7) The desire is *a daughter of the devil,* so to resist her is to resist him — and Kepha (Peter) names the same adversary and the same posture: *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour:* (1 Peter 5:8) — *Whom resist stedfast in the faith, knowing that the same afflictions are accomplished in your brethren that are in the world.* (1 Peter 5:9) Resist, and the enemy flees: the apostles taught nothing the Shepherd does not also lay down.',
       sv.verse_id, ev.verse_id, 'extras', 71903
  FROM _session253_herm17_lookup sv, _session253_herm17_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=17 AND sv.verse_number=2
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=17 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-17-serve-the-good-desire-walk-in-the-commandments',
       E'Practise righteousness, truth, the fear of Yahuah — the commandments are not too hard',
       E'Asked how to serve the good desire, the Shepherd answers with a life, not a slogan: *‘practise righteousness and virtue, truth and the fear of Yahuah (Lord), faith and gentleness, and as many good deeds as are like these.’* (Hermas 17:3) And when Hermas frets that the commandments are *very hard,* the Shepherd corrects him — the man who sets his heart can keep them: *Aye,’ saith he, ‘the man that hath Yahuah (Lord) in his heart can master [all things and] all these commandments... ye shall perceive that nothing is easier than these commandments, nor sweeter, nor more gentle.* (Hermas 17:4) It ain''t new — and the commandments are never named the curse. Moses said the same of the very Torah: *For this commandment which I command thee this day, it is not hidden from thee, neither is it far off.* (Deuteronomy 30:11) — *But the word is very nigh unto thee, in thy mouth, and in thy heart, that thou mayest do it.* (Deuteronomy 30:14) And the armour the Shepherd hands is Sha''ul''s (Paul''s): *Put on the whole armour of Elohim (God), that ye may be able to stand against the wiles of the devil.* (Ephesians 6:11) The commandments stand, near and keepable to the heart that holds Yahuah; the Shepherd and Moses speak with one voice.',
       sv.verse_id, ev.verse_id, 'extras', 71906
  FROM _session253_herm17_lookup sv, _session253_herm17_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=17 AND sv.verse_number=3
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=17 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-17-fear-not-the-devil-resist-and-he-flees',
       E'The angel of repentance: fear not the devil — resist him and he flees',
       E'Here is the heart of the chapter — the angel set over repentance disarms the enemy''s terror: *‘fear not the devil, for there is no power in him against you. For I will be with you, I, the angel of repentance, who have the mastery over him. The devil hath fear alone, but his fear hath no force. Fear him not therefore; and he will flee from you.’* (Hermas 17:4) And again: *‘If then ye resist him, he will be vanquished, and will flee from you disgraced.’* (Hermas 17:5) And the closing comfort, that the threatening is empty: *But of the threatening of the devil fear not at all; for he is unstrung, like the sinews of a dead man.* (Hermas 17:6) It ain''t new — this is Ya''aqov''s (James''s) very promise: *Submit yourselves therefore to Elohim (God). Resist the devil, and he will flee from you.* (James 4:7) Kepha (Peter) gives the steadfast posture: *Whom resist stedfast in the faith, knowing that the same afflictions are accomplished in your brethren that are in the world.* (1 Peter 5:9) And the armour that makes the stand sure: *Put on the whole armour of Elohim (God), that ye may be able to stand against the wiles of the devil.* (Ephesians 6:11) The angel of repentance promises no new gospel — only the apostles'' own: stand, resist, and the toothless adversary flees.',
       sv.verse_id, ev.verse_id, 'extras', 71909
  FROM _session253_herm17_lookup sv, _session253_herm17_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=17 AND sv.verse_number=4
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=17 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: hermas-17-cast-out-evil-desire-put-on-good
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Galatians 5:16 — *This I say then, Walk in the Spirit, and ye shall not fulfil the lust of the flesh.* The Shepherd''s charge to put off the evil desire and put on the good is Sha''ul''s (Paul''s) walk in the Spirit that does not fulfil the flesh.'
  FROM cross_reference_threads t, cross_references x, _session253_herm17_lookup sv, _session253_herm17_lookup tv
 WHERE t.slug='hermas-17-cast-out-evil-desire-put-on-good'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=17 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=5 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Galatians 5:17 — *For the flesh lusteth against the Spirit, and the Spirit against the flesh: and these are contrary the one to the other: so that ye cannot do the things that ye would.* The two warring desires of Hermas — the wild evil desire against the good and holy — are Sha''ul''s flesh-against-Spirit, contrary one to the other.'
  FROM cross_reference_threads t, cross_references x, _session253_herm17_lookup sv, _session253_herm17_lookup tv
 WHERE t.slug='hermas-17-cast-out-evil-desire-put-on-good'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=17 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=5 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 13:14 — *But put ye on the Lord Yahusha HaMashiach (Lord Jesus Christ), and make not provision for the flesh, to fulfil the lusts thereof.* The Shepherd''s ''clothe thyself in the desire of righteousness'' is the apostle''s putting-on of the Master and making no provision for the flesh.'
  FROM cross_reference_threads t, cross_references x, _session253_herm17_lookup sv, _session253_herm17_lookup tv
 WHERE t.slug='hermas-17-cast-out-evil-desire-put-on-good'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=17 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=13 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 6:12 — *Let not sin therefore reign in your mortal body, that ye should obey it in the lusts thereof.* Bridling and directing the wild desire so it no longer masters the man is Sha''ul''s word that sin must not reign in the body unto its lusts.'
  FROM cross_reference_threads t, cross_references x, _session253_herm17_lookup sv, _session253_herm17_lookup tv
 WHERE t.slug='hermas-17-cast-out-evil-desire-put-on-good'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=17 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=6 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-17-armed-with-the-fear-resist-and-it-flees
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'James 4:7 — *Submit yourselves therefore to Elohim (God). Resist the devil, and he will flee from you.* The Shepherd''s word that the evil desire, seen the man armed and resisting, shall flee far from him is Ya''aqov''s (James''s) own promise: resist the devil and he will flee.'
  FROM cross_reference_threads t, cross_references x, _session253_herm17_lookup sv, _session253_herm17_lookup tv
 WHERE t.slug='hermas-17-armed-with-the-fear-resist-and-it-flees'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=17 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=4 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour:* The evil desire that is ''a daughter of the devil'' is the very adversary Kepha (Peter) bids us watch — sober and vigilant against the roaring lion.'
  FROM cross_reference_threads t, cross_references x, _session253_herm17_lookup sv, _session253_herm17_lookup tv
 WHERE t.slug='hermas-17-armed-with-the-fear-resist-and-it-flees'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=17 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Peter 5:9 — *Whom resist stedfast in the faith, knowing that the same afflictions are accomplished in your brethren that are in the world.* The Shepherd''s armed resisting that drives the desire away is Kepha''s resist-stedfast-in-the-faith against the same adversary.'
  FROM cross_reference_threads t, cross_references x, _session253_herm17_lookup sv, _session253_herm17_lookup tv
 WHERE t.slug='hermas-17-armed-with-the-fear-resist-and-it-flees'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=17 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-17-serve-the-good-desire-walk-in-the-commandments
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 30:11 — *For this commandment which I command thee this day, it is not hidden from thee, neither is it far off.* The Shepherd''s correction — that the commandments are not too hard for the man who sets his heart — is Moses'' own word that the commandment is not far off.'
  FROM cross_reference_threads t, cross_references x, _session253_herm17_lookup sv, _session253_herm17_lookup tv
 WHERE t.slug='hermas-17-serve-the-good-desire-walk-in-the-commandments'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=17 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 30:14 — *But the word is very nigh unto thee, in thy mouth, and in thy heart, that thou mayest do it.* The man who has Yahuah in his heart finds nothing easier than these commandments — Moses said the word is very nigh, in the heart, that thou mayest do it. The commandments are never the curse.'
  FROM cross_reference_threads t, cross_references x, _session253_herm17_lookup sv, _session253_herm17_lookup tv
 WHERE t.slug='hermas-17-serve-the-good-desire-walk-in-the-commandments'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=17 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ephesians 6:11 — *Put on the whole armour of Elohim (God), that ye may be able to stand against the wiles of the devil.* The armour of the fear of Yahuah the Shepherd bids the servant wear is Sha''ul''s (Paul''s) whole armour of Elohim, worn to stand against the wiles of the devil.'
  FROM cross_reference_threads t, cross_references x, _session253_herm17_lookup sv, _session253_herm17_lookup tv
 WHERE t.slug='hermas-17-serve-the-good-desire-walk-in-the-commandments'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=17 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=6 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-17-fear-not-the-devil-resist-and-he-flees
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'James 4:7 — *Submit yourselves therefore to Elohim (God). Resist the devil, and he will flee from you.* The angel of repentance''s ''fear not the devil... and he will flee from you'' is Ya''aqov''s (James''s) word verbatim in substance — resist the devil and he will flee.'
  FROM cross_reference_threads t, cross_references x, _session253_herm17_lookup sv, _session253_herm17_lookup tv
 WHERE t.slug='hermas-17-fear-not-the-devil-resist-and-he-flees'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=17 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=4 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Peter 5:9 — *Whom resist stedfast in the faith, knowing that the same afflictions are accomplished in your brethren that are in the world.* ''If then ye resist him, he will be vanquished'' is Kepha''s (Peter''s) resist-stedfast-in-the-faith against the same adversary.'
  FROM cross_reference_threads t, cross_references x, _session253_herm17_lookup sv, _session253_herm17_lookup tv
 WHERE t.slug='hermas-17-fear-not-the-devil-resist-and-he-flees'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=17 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ephesians 6:11 — *Put on the whole armour of Elohim (God), that ye may be able to stand against the wiles of the devil.* The threatening of the devil is empty ''like the sinews of a dead man'' because the servant stands in Sha''ul''s (Paul''s) whole armour of Elohim against his wiles.'
  FROM cross_reference_threads t, cross_references x, _session253_herm17_lookup sv, _session253_herm17_lookup tv
 WHERE t.slug='hermas-17-fear-not-the-devil-resist-and-he-flees'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=17 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=6 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_hermas_18.sql (session253 hermas 18) -----
-- Source anchor: lightfoot-apostolic-fathers/hermas ch18. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: herm18 (view _session253_herm18_lookup). Sort band base 71925, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_herm18_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: hermas-18-foreign-land-far-city
  ('lightfoot-apostolic-fathers', 'hermas', 18, 1, 'canon', 'hebrews', 11, 13, 'free', E'Hebrews 11:13 — *These all died in faith, not having received the promises, but having seen them afar off, and were persuaded of them, and embraced them, and confessed that they were strangers and pilgrims on the earth.* The Shepherd''s word that the servants of Elohim dwell in a foreign land is the patriarchs'' own confession — strangers and pilgrims, their city far off (Hermas 18:1).'),
  ('lightfoot-apostolic-fathers', 'hermas', 18, 1, 'canon', 'hebrews', 11, 16, 'free', E'Hebrews 11:16 — *But now they desire a better country, that is, an heavenly: wherefore Elohim (God) is not ashamed to be called their Elohim (God): for he hath prepared for them a city.* The far city in which Hermas''s people shall yet dwell is the heavenly country the faithful sought — the city Elohim Himself has prepared (Hermas 18:1).'),
  ('lightfoot-apostolic-fathers', 'hermas', 18, 1, 'canon', '1-peter', 2, 11, 'free', E'1 Peter 2:11 — *Dearly beloved, I beseech you as strangers and pilgrims, abstain from fleshly lusts, which war against the soul.* Kepha names the servants of Elohim by the same title Hermas gives them — strangers and pilgrims dwelling in a land not their home (Hermas 18:1).'),
  ('lightfoot-apostolic-fathers', 'hermas', 18, 1, 'canon', 'philippians', 3, 20, 'free', E'Philippians 3:20 — *For our conversation is in heaven; from whence also we look for the Saviour, the Lord Yahusha HaMashiach (Lord Jesus Christ).* The city far from this city, to which the servants of Elohim belong, is the heavenly citizenship Sha''ul confesses — it ain''t new (Hermas 18:1).'),
  -- thread: hermas-18-buy-not-estates-lay-up-treasure
  ('lightfoot-apostolic-fathers', 'hermas', 18, 1, 'canon', 'matthew', 6, 19, 'free', E'Matthew 6:19 — *Lay not up for yourselves treasures upon earth, where moth and rust doth corrupt, and where thieves break through and steal:* The Shepherd''s ban on preparing superfluous estates in this foreign land is the Master''s own warning against hoarding earthly treasure (Hermas 18:1).'),
  ('lightfoot-apostolic-fathers', 'hermas', 18, 1, 'canon', 'matthew', 6, 20, 'free', E'Matthew 6:20 — *But lay up for yourselves treasures in heaven, where neither moth nor rust doth corrupt, and where thieves do not break through nor steal:* The wealth Hermas bids us send to our own far city is the treasure in heaven the Master tells us to lay up (Hermas 18:1).'),
  ('lightfoot-apostolic-fathers', 'hermas', 18, 1, 'canon', '1-timothy', 6, 8, 'free', E'1 Timothy 6:8 — *And having food and raiment let us be therewith content.* The ''competency sufficient for thee'' that Hermas commands the sojourner is Sha''ul''s own contentment with food and raiment, not the heaping up of estates (Hermas 18:1).'),
  ('lightfoot-apostolic-fathers', 'hermas', 18, 1, 'canon', '1-timothy', 6, 19, 'free', E'1 Timothy 6:19 — *Laying up in store for themselves a good foundation against the time to come, that they may lay hold on eternal life.* The riches Hermas says we shall find waiting in our own city are the good foundation Sha''ul says the generous lay up against the time to come (Hermas 18:1).'),
  -- thread: hermas-18-buy-souls-visit-widows-orphans
  ('lightfoot-apostolic-fathers', 'hermas', 18, 1, 'canon', '1-timothy', 6, 18, 'free', E'1 Timothy 6:18 — *That they do good, that they be rich in good works, ready to distribute, willing to communicate;* The Shepherd''s charge to spend riches on souls in trouble rather than fields is Sha''ul''s call to the rich to be rich in good works, ready to distribute (Hermas 18:1).'),
  ('lightfoot-apostolic-fathers', 'hermas', 18, 1, 'canon', 'james', 1, 27, 'free', E'James 1:27 — *Pure religion and undefiled before Elohim (God) and the Father is this, To visit the fatherless and widows in their affliction, and to keep himself unspotted from the world.* Hermas''s command to visit widows and orphans and neglect them not is the very religion Ya''aqob (James) calls pure and undefiled (Hermas 18:1).'),
  ('lightfoot-apostolic-fathers', 'hermas', 18, 1, 'canon', 'proverbs', 19, 17, 'free', E'Proverbs 19:17 — *He that hath pity upon the poor lendeth unto Yahuah (LORD); and that which he hath given will he pay him again.* The souls in trouble whom Hermas bids us buy with our riches are the poor whom Mishle (Proverbs) says we lend to Yahuah, repaid in our own city (Hermas 18:1).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_herm18_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_herm18_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-18-foreign-land-far-city',
       E'Ye dwell in a foreign land — your city is far off',
       E'The Shepherd lays bare where the faithful truly live: *‘Ye know that ye, who are the servants of Elohim (God), are dwelling in a foreign land; for your city is far from this city. If then ye know your city, in which ye shall dwell, why do ye here prepare fields and expensive displays and buildings and dwelling-chambers which are superfluous?’* (Hermas 18:1) It ain''t new — this is the very confession of the patriarchs. They died still looking for home: *These all died in faith, not having received the promises, but having seen them afar off, and were persuaded of them, and embraced them, and confessed that they were strangers and pilgrims on the earth* (Hebrews 11:13), for *they desire a better country, that is, an heavenly: wherefore Elohim (God) is not ashamed to be called their Elohim (God): for he hath prepared for them a city* (Hebrews 11:16). Kepha names the same sojourning estate: *Dearly beloved, I beseech you as strangers and pilgrims, abstain from fleshly lusts, which war against the soul* (1 Peter 2:11). And Sha''ul fixes the citizenship beyond this world: *For our conversation is in heaven; from whence also we look for the Saviour, the Lord Yahusha HaMashiach (Lord Jesus Christ)* (Philippians 3:20). The pilgrim-people did not begin with Hermas; it is Abraham''s road, the whole counsel of the faithful.',
       sv.verse_id, ev.verse_id, 'extras', 71925
  FROM _session253_herm18_lookup sv, _session253_herm18_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=18 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=18 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-18-buy-not-estates-lay-up-treasure',
       E'Prepare nothing here but a competency — lay up treasure that travels home',
       E'Because the city is far, the Shepherd forbids the hoarding of estates in a land that is not ours: *‘as dwelling in a strange land prepare nothing more for thyself but a competency which is sufficient for thee’* (Hermas 18:1). It ain''t new — the Master in the mountain set the same choice: *Lay not up for yourselves treasures upon earth, where moth and rust doth corrupt, and where thieves break through and steal: But lay up for yourselves treasures in heaven, where neither moth nor rust doth corrupt, and where thieves do not break through nor steal* (Matthew 6:19-20). Sha''ul charges the rich to send their wealth on ahead by good works: *That they do good, that they be rich in good works, ready to distribute, willing to communicate; Laying up in store for themselves a good foundation against the time to come, that they may lay hold on eternal life* (1 Timothy 6:18-19). And contentment, not accumulation, is the pilgrim''s portion: *And having food and raiment let us be therewith content* (1 Timothy 6:8). The competency Hermas commands is the old wisdom — store the wealth where it travels home.',
       sv.verse_id, ev.verse_id, 'extras', 71928
  FROM _session253_herm18_lookup sv, _session253_herm18_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=18 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=18 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-18-buy-souls-visit-widows-orphans',
       E'Instead of fields buy souls — visit the widow and the orphan',
       E'Then comes the wealth that does travel home — not stone and field but mercy: *‘instead of fields buy ye souls that are in trouble, as each is able, and visit widows and orphans, and neglect them not’* (Hermas 18:1). It ain''t new — this is the religion the prophets and apostles named pure: *That they do good, that they be rich in good works, ready to distribute, willing to communicate* (1 Timothy 6:18), and the true and undefiled service is *To visit the fatherless and widows in their affliction* (James 1:27). The riches lent to the poor are lent to Yahuah Himself: *He that hath pity upon the poor lendeth unto Yahuah (LORD); and that which he hath given will he pay him again* (Proverbs 19:17). The good works Hermas commands are the grace-given purpose of every servant — *for to this end the Master enriched you, that ye might perform these ministrations for Him* — the same standing demand of mercy that runs through the whole counsel.',
       sv.verse_id, ev.verse_id, 'extras', 71931
  FROM _session253_herm18_lookup sv, _session253_herm18_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=18 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=18 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: hermas-18-foreign-land-far-city
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 11:13 — *These all died in faith, not having received the promises, but having seen them afar off, and were persuaded of them, and embraced them, and confessed that they were strangers and pilgrims on the earth.* The Shepherd''s word that the servants of Elohim dwell in a foreign land is the patriarchs'' own confession — strangers and pilgrims, their city far off (Hermas 18:1).'
  FROM cross_reference_threads t, cross_references x, _session253_herm18_lookup sv, _session253_herm18_lookup tv
 WHERE t.slug='hermas-18-foreign-land-far-city'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=18 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 11:16 — *But now they desire a better country, that is, an heavenly: wherefore Elohim (God) is not ashamed to be called their Elohim (God): for he hath prepared for them a city.* The far city in which Hermas''s people shall yet dwell is the heavenly country the faithful sought — the city Elohim Himself has prepared (Hermas 18:1).'
  FROM cross_reference_threads t, cross_references x, _session253_herm18_lookup sv, _session253_herm18_lookup tv
 WHERE t.slug='hermas-18-foreign-land-far-city'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=18 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Peter 2:11 — *Dearly beloved, I beseech you as strangers and pilgrims, abstain from fleshly lusts, which war against the soul.* Kepha names the servants of Elohim by the same title Hermas gives them — strangers and pilgrims dwelling in a land not their home (Hermas 18:1).'
  FROM cross_reference_threads t, cross_references x, _session253_herm18_lookup sv, _session253_herm18_lookup tv
 WHERE t.slug='hermas-18-foreign-land-far-city'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=18 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=2 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Philippians 3:20 — *For our conversation is in heaven; from whence also we look for the Saviour, the Lord Yahusha HaMashiach (Lord Jesus Christ).* The city far from this city, to which the servants of Elohim belong, is the heavenly citizenship Sha''ul confesses — it ain''t new (Hermas 18:1).'
  FROM cross_reference_threads t, cross_references x, _session253_herm18_lookup sv, _session253_herm18_lookup tv
 WHERE t.slug='hermas-18-foreign-land-far-city'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=18 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=3 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-18-buy-not-estates-lay-up-treasure
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 6:19 — *Lay not up for yourselves treasures upon earth, where moth and rust doth corrupt, and where thieves break through and steal:* The Shepherd''s ban on preparing superfluous estates in this foreign land is the Master''s own warning against hoarding earthly treasure (Hermas 18:1).'
  FROM cross_reference_threads t, cross_references x, _session253_herm18_lookup sv, _session253_herm18_lookup tv
 WHERE t.slug='hermas-18-buy-not-estates-lay-up-treasure'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=18 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=6 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 6:20 — *But lay up for yourselves treasures in heaven, where neither moth nor rust doth corrupt, and where thieves do not break through nor steal:* The wealth Hermas bids us send to our own far city is the treasure in heaven the Master tells us to lay up (Hermas 18:1).'
  FROM cross_reference_threads t, cross_references x, _session253_herm18_lookup sv, _session253_herm18_lookup tv
 WHERE t.slug='hermas-18-buy-not-estates-lay-up-treasure'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=18 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=6 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Timothy 6:8 — *And having food and raiment let us be therewith content.* The ''competency sufficient for thee'' that Hermas commands the sojourner is Sha''ul''s own contentment with food and raiment, not the heaping up of estates (Hermas 18:1).'
  FROM cross_reference_threads t, cross_references x, _session253_herm18_lookup sv, _session253_herm18_lookup tv
 WHERE t.slug='hermas-18-buy-not-estates-lay-up-treasure'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=18 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-timothy' AND tv.chapter_number=6 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Timothy 6:19 — *Laying up in store for themselves a good foundation against the time to come, that they may lay hold on eternal life.* The riches Hermas says we shall find waiting in our own city are the good foundation Sha''ul says the generous lay up against the time to come (Hermas 18:1).'
  FROM cross_reference_threads t, cross_references x, _session253_herm18_lookup sv, _session253_herm18_lookup tv
 WHERE t.slug='hermas-18-buy-not-estates-lay-up-treasure'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=18 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-timothy' AND tv.chapter_number=6 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-18-buy-souls-visit-widows-orphans
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Timothy 6:18 — *That they do good, that they be rich in good works, ready to distribute, willing to communicate;* The Shepherd''s charge to spend riches on souls in trouble rather than fields is Sha''ul''s call to the rich to be rich in good works, ready to distribute (Hermas 18:1).'
  FROM cross_reference_threads t, cross_references x, _session253_herm18_lookup sv, _session253_herm18_lookup tv
 WHERE t.slug='hermas-18-buy-souls-visit-widows-orphans'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=18 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-timothy' AND tv.chapter_number=6 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'James 1:27 — *Pure religion and undefiled before Elohim (God) and the Father is this, To visit the fatherless and widows in their affliction, and to keep himself unspotted from the world.* Hermas''s command to visit widows and orphans and neglect them not is the very religion Ya''aqob (James) calls pure and undefiled (Hermas 18:1).'
  FROM cross_reference_threads t, cross_references x, _session253_herm18_lookup sv, _session253_herm18_lookup tv
 WHERE t.slug='hermas-18-buy-souls-visit-widows-orphans'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=18 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 19:17 — *He that hath pity upon the poor lendeth unto Yahuah (LORD); and that which he hath given will he pay him again.* The souls in trouble whom Hermas bids us buy with our riches are the poor whom Mishle (Proverbs) says we lend to Yahuah, repaid in our own city (Hermas 18:1).'
  FROM cross_reference_threads t, cross_references x, _session253_herm18_lookup sv, _session253_herm18_lookup tv
 WHERE t.slug='hermas-18-buy-souls-visit-widows-orphans'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=18 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=19 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_hermas_19.sql (session253 hermas 19) -----
-- Source anchor: lightfoot-apostolic-fathers/hermas ch19. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: herm19 (view _session253_herm19_lookup). Sort band base 71950, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_herm19_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: hermas-19-elm-and-vine-members-need-one-another
  ('lightfoot-apostolic-fathers', 'hermas', 19, 1, 'canon', '1-corinthians', 12, 21, 'free', E'1 Corinthians 12:21 — *And the eye cannot say unto the hand, I have no need of thee: nor again the head to the feet, I have no need of you.* The elm that needs the vine and the vine that needs the elm are Sha''ul''s members of one body, none able to say it has no need of the other (Hermas 19:1).'),
  ('lightfoot-apostolic-fathers', 'hermas', 19, 1, 'canon', '1-corinthians', 12, 22, 'free', E'1 Corinthians 12:22 — *Nay, much more those members of the body, which seem to be more feeble, are necessary:* the poor man, who seems the weaker like the fruitless-looking elm, is no less necessary — his intercession bears fruit the rich cannot bear alone (Hermas 19:1).'),
  ('lightfoot-apostolic-fathers', 'hermas', 19, 1, 'canon', '2-corinthians', 8, 13, 'free', E'2 Corinthians 8:13 — *For I mean not that other men be eased, and ye burdened:* the Shepherd''s pairing of rich and poor is no transfer that empties one to fill the other, but the mutual supply Sha''ul frames — neither eased at the other''s burden (Hermas 19:1).'),
  ('lightfoot-apostolic-fathers', 'hermas', 19, 1, 'canon', '2-corinthians', 8, 14, 'free', E'2 Corinthians 8:14 — *But by an equality, that now at this time your abundance may be a supply for their want, that their abundance also may be a supply for your want: that there may be equality:* the rich supplying the poor''s needs and the poor supplying the rich with intercession is exactly Sha''ul''s equality — each abundance a supply for the other''s want (Hermas 19:1).'),
  -- thread: hermas-19-pity-on-the-poor-lendeth-to-yahuah
  ('lightfoot-apostolic-fathers', 'hermas', 19, 1, 'canon', 'proverbs', 19, 17, 'free', E'Proverbs 19:17 — *He that hath pity upon the poor lendeth unto Yahuah (LORD); and that which he hath given will he pay him again.* The rich man who assists the poor and obtains a reward with Elohim is the man Mishle says lends to Yahuah, certain to be repaid — it ain''t new (Hermas 19:1).'),
  ('lightfoot-apostolic-fathers', 'hermas', 19, 1, 'canon', 'luke', 16, 9, 'free', E'Luke 16:9 — *And I say unto you, Make to yourselves friends of the mammon of unrighteousness; that, when ye fail, they may receive you into everlasting habitations.* The Shepherd''s rich man who works for the poor from the bounties of Yahuah and gains a reward above is doing just what the Master taught — turning riches into friends who receive him into the everlasting habitations (Hermas 19:1).'),
  -- thread: hermas-19-poor-rich-in-faith-and-intercession
  ('lightfoot-apostolic-fathers', 'hermas', 19, 1, 'canon', 'james', 2, 5, 'free', E'James 2:5 — *Hearken, my beloved brethren, Hath not Elohim (God) chosen the poor of this world rich in faith, and heirs of the kingdom which he hath promised to them that love him?* The Shepherd''s poor man, poor in goods but rich in intercession and acceptable before Elohim, is Ya''aqov''s poor chosen by Elohim, rich in faith and heirs of the kingdom (Hermas 19:1).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_herm19_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_herm19_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-19-elm-and-vine-members-need-one-another',
       E'The elm and the vine — the members cannot say, I have no need of thee',
       E'The Shepherd shows Hermas a type in the field: *‘This vine,’ saith he, ‘beareth fruit, but the elm is an unfruitful stock. Yet this vine, except it climb up the elm, cannot bear much fruit when it is spread on the ground; and such fruit as it beareth is rotten, because it is not suspended upon the elm. When then the vine is attached to the elm, it beareth fruit both from itself and from the elm.’* (Hermas 19:1) The rich and the poor are the elm and the vine — neither bears fully alone. It ain''t new: Sha''ul saw the same in the one body — *And the eye cannot say unto the hand, I have no need of thee: nor again the head to the feet, I have no need of you* (1 Corinthians 12:21), for *those members of the body, which seem to be more feeble, are necessary* (1 Corinthians 12:22). And the very leveling Hermas teaches — the rich supplying, the poor establishing — is Sha''ul''s equality: *that now at this time your abundance may be a supply for their want, that their abundance also may be a supply for your want: that there may be equality* (2 Corinthians 8:14). The elm bears in the vine, and the vine in the elm; the body has need of every member.',
       sv.verse_id, ev.verse_id, 'extras', 71950
  FROM _session253_herm19_lookup sv, _session253_herm19_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=19 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=19 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-19-pity-on-the-poor-lendeth-to-yahuah',
       E'He that giveth to the poor lendeth unto Yahuah',
       E'The Shepherd unfolds the type: *‘When then the rich man goeth up to the poor, and assisteth him in his needs, believing that for what he doth to the poor man he shall be able to obtain a reward with Elohim (God)... the rich man then supplieth all things to the poor man without wavering. But the poor man being supplied by the rich maketh intercession for him, thanking Elohim (God) for him that gave to him.’* (Hermas 19:1) The reward the rich man trusts to receive is the oldest promise in the Scriptures: *He that hath pity upon the poor lendeth unto Yahuah (LORD); and that which he hath given will he pay him again* (Proverbs 19:17). What the rich man lays out on the poor is not lost but lent to Yahuah Himself — and the Master sealed it: *Make to yourselves friends of the mammon of unrighteousness; that, when ye fail, they may receive you into everlasting habitations* (Luke 16:9). The wealth spent on the poor, joined to the poor man''s prayer, lays up a reward above. It ain''t new — pity on the poor was ever a loan to heaven.',
       sv.verse_id, ev.verse_id, 'extras', 71953
  FROM _session253_herm19_lookup sv, _session253_herm19_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=19 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=19 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-19-poor-rich-in-faith-and-intercession',
       E'The poor man rich before Elohim — chosen, rich in faith',
       E'The Shepherd lifts up the poor man, who seems to bear nothing: *‘because the poor man is rich in intercession [and confession], and his intercession hath great power with Elohim (God)... for he knoweth that the intercession of the poor man is acceptable and rich before Elohim (God).’* (Hermas 19:1) The world counts the poor empty as the fruitless elm, yet they are full toward heaven. It ain''t new — Ya''aqov says the very thing: *Hath not Elohim (God) chosen the poor of this world rich in faith, and heirs of the kingdom which he hath promised to them that love him?* (James 2:5) The poor man, lacking in goods, is rich in the one wealth that counts — faith and the prayer that prevails with Elohim; and so the elm that seems barren in the sight of men nurtures the vine and bears fruit twofold.',
       sv.verse_id, ev.verse_id, 'extras', 71956
  FROM _session253_herm19_lookup sv, _session253_herm19_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=19 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=19 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: hermas-19-elm-and-vine-members-need-one-another
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Corinthians 12:21 — *And the eye cannot say unto the hand, I have no need of thee: nor again the head to the feet, I have no need of you.* The elm that needs the vine and the vine that needs the elm are Sha''ul''s members of one body, none able to say it has no need of the other (Hermas 19:1).'
  FROM cross_reference_threads t, cross_references x, _session253_herm19_lookup sv, _session253_herm19_lookup tv
 WHERE t.slug='hermas-19-elm-and-vine-members-need-one-another'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=19 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=12 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Corinthians 12:22 — *Nay, much more those members of the body, which seem to be more feeble, are necessary:* the poor man, who seems the weaker like the fruitless-looking elm, is no less necessary — his intercession bears fruit the rich cannot bear alone (Hermas 19:1).'
  FROM cross_reference_threads t, cross_references x, _session253_herm19_lookup sv, _session253_herm19_lookup tv
 WHERE t.slug='hermas-19-elm-and-vine-members-need-one-another'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=19 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=12 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Corinthians 8:13 — *For I mean not that other men be eased, and ye burdened:* the Shepherd''s pairing of rich and poor is no transfer that empties one to fill the other, but the mutual supply Sha''ul frames — neither eased at the other''s burden (Hermas 19:1).'
  FROM cross_reference_threads t, cross_references x, _session253_herm19_lookup sv, _session253_herm19_lookup tv
 WHERE t.slug='hermas-19-elm-and-vine-members-need-one-another'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=19 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=8 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Corinthians 8:14 — *But by an equality, that now at this time your abundance may be a supply for their want, that their abundance also may be a supply for your want: that there may be equality:* the rich supplying the poor''s needs and the poor supplying the rich with intercession is exactly Sha''ul''s equality — each abundance a supply for the other''s want (Hermas 19:1).'
  FROM cross_reference_threads t, cross_references x, _session253_herm19_lookup sv, _session253_herm19_lookup tv
 WHERE t.slug='hermas-19-elm-and-vine-members-need-one-another'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=19 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=8 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-19-pity-on-the-poor-lendeth-to-yahuah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 19:17 — *He that hath pity upon the poor lendeth unto Yahuah (LORD); and that which he hath given will he pay him again.* The rich man who assists the poor and obtains a reward with Elohim is the man Mishle says lends to Yahuah, certain to be repaid — it ain''t new (Hermas 19:1).'
  FROM cross_reference_threads t, cross_references x, _session253_herm19_lookup sv, _session253_herm19_lookup tv
 WHERE t.slug='hermas-19-pity-on-the-poor-lendeth-to-yahuah'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=19 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=19 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 16:9 — *And I say unto you, Make to yourselves friends of the mammon of unrighteousness; that, when ye fail, they may receive you into everlasting habitations.* The Shepherd''s rich man who works for the poor from the bounties of Yahuah and gains a reward above is doing just what the Master taught — turning riches into friends who receive him into the everlasting habitations (Hermas 19:1).'
  FROM cross_reference_threads t, cross_references x, _session253_herm19_lookup sv, _session253_herm19_lookup tv
 WHERE t.slug='hermas-19-pity-on-the-poor-lendeth-to-yahuah'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=19 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=16 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-19-poor-rich-in-faith-and-intercession
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'James 2:5 — *Hearken, my beloved brethren, Hath not Elohim (God) chosen the poor of this world rich in faith, and heirs of the kingdom which he hath promised to them that love him?* The Shepherd''s poor man, poor in goods but rich in intercession and acceptable before Elohim, is Ya''aqov''s poor chosen by Elohim, rich in faith and heirs of the kingdom (Hermas 19:1).'
  FROM cross_reference_threads t, cross_references x, _session253_herm19_lookup sv, _session253_herm19_lookup tv
 WHERE t.slug='hermas-19-poor-rich-in-faith-and-intercession'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=19 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=2 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_hermas_20.sql (session253 hermas 20) -----
-- Source anchor: lightfoot-apostolic-fathers/hermas ch20. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: herm20 (view _session253_herm20_lookup). Sort band base 71975, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_herm20_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: hermas-20-wheat-and-tares-grow-together
  ('lightfoot-apostolic-fathers', 'hermas', 20, 1, 'canon', 'matthew', 13, 30, 'free', E'Matthew 13:30 — *Let both grow together until the harvest: and in the time of harvest I will say to the reapers, Gather ye together first the tares, and bind them in bundles to burn them: but gather the wheat into my barn.* The righteous and the sinners dwelling alike in this world, indistinguishable, are the wheat and the tares the Master leaves growing together until the harvest.'),
  ('lightfoot-apostolic-fathers', 'hermas', 20, 1, 'canon', 'matthew', 13, 38, 'free', E'Matthew 13:38 — *The field is the world; the good seed are the children of the kingdom; but the tares are the children of the wicked one;* Hermas''s trees are ''they that dwell in this world,'' the very field the Master names where the children of the kingdom and the children of the wicked one stand together.'),
  ('lightfoot-apostolic-fathers', 'hermas', 20, 1, 'canon', 'matthew', 13, 29, 'free', E'Matthew 13:29 — *But he said, Nay; lest while ye gather up the tares, ye root up also the wheat with them.* That the just and the sinners cannot now be distinguished is why the householder forbids the early uprooting — wheat and tare look alike in the winter of this world.'),
  -- thread: hermas-20-one-event-to-righteous-and-wicked
  ('lightfoot-apostolic-fathers', 'hermas', 20, 1, 'canon', 'ecclesiastes', 9, 2, 'free', E'Ecclesiastes 9:2 — *All things come alike to all: there is one event to the righteous, and to the wicked; to the good and to the clean, and to the unclean; to him that sacrificeth, and to him that sacrificeth not: as is the good, so is the sinner; and he that sweareth, as he that feareth an oath.* The Shepherd''s word that the just and the sinners are not distinguishable in this world is the Preacher''s one event that comes alike to all under the sun.'),
  ('lightfoot-apostolic-fathers', 'hermas', 20, 1, 'canon', 'ecclesiastes', 9, 1, 'free', E'Ecclesiastes 9:1 — *For all this I considered in my heart even to declare all this, that the righteous, and the wise, and their works, are in the hand of Elohim (God): no man knoweth either love or hatred by all that is before them.* That none can now tell the withered tree from the living mirrors Qoheleth''s word that no man knows, by all that is before him, who stands in love and who in hatred — it is hidden in the hand of Elohim.'),
  -- thread: hermas-20-then-shall-ye-discern
  ('lightfoot-apostolic-fathers', 'hermas', 20, 1, 'canon', 'malachi', 3, 18, 'free', E'Malachi 3:18 — *Then shall ye return, and discern between the righteous and the wicked, between him that serveth Elohim (God) and him that serveth him not.* The winter in which the just and the sinners cannot be told apart gives way to the very discerning Malachi promised — then, not now, shall the righteous be known from the wicked.'),
  ('lightfoot-apostolic-fathers', 'hermas', 20, 1, 'canon', 'malachi', 3, 16, 'free', E'Malachi 3:16 — *Then they that feared Yahuah (LORD) spake often one to another: and Yahuah (LORD) hearkened, and heard it, and a book of remembrance was written before him for them that feared Yahuah (LORD), and that thought upon his name.* Though the righteous wither indistinguishably among the sinners now, a book of remembrance is already written for them — the wintered faithful are not forgotten.'),
  ('lightfoot-apostolic-fathers', 'hermas', 20, 1, 'canon', 'matthew', 13, 43, 'free', E'Matthew 13:43 — *Then shall the righteous shine forth as the sun in the kingdom of their Father. Who hath ears to hear, let him hear.* The trees that look alike and withered in this world''s winter shall, at the harvest, be parted — and the righteous shall shine forth as the sun, no longer hidden among the tares.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_herm20_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_herm20_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-20-wheat-and-tares-grow-together',
       E'The trees in winter — wheat and tares grow together till the harvest',
       E'The Shepherd unfolds the third similitude: *He showed me many trees which had no leaves, but they seemed to me to be, as it were, withered ; for they were all alike... ‘These trees that thou seest are they that dwell in this world.’... ‘neither the righteous are distinguishable, nor the sinners in this world, but they are alike. For this world is winter to the righteous, and they are not distinguishable, as they dwell with the sinners.’* (Hermas 20:1) It ain''t new — the Master had already set the same picture in the field, the just and the lawless growing side by side until the reaping: *Let both grow together until the harvest: and in the time of harvest I will say to the reapers, Gather ye together first the tares, and bind them in bundles to burn them: but gather the wheat into my barn.* (Matthew 13:30) And He names the field as Hermas names the trees — *The field is the world; the good seed are the children of the kingdom; but the tares are the children of the wicked one* (Matthew 13:38). The wintered trees that none can tell apart are the wheat and the tares left standing together till the end of the age.',
       sv.verse_id, ev.verse_id, 'extras', 71975
  FROM _session253_herm20_lookup sv, _session253_herm20_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=20 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=20 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-20-one-event-to-righteous-and-wicked',
       E'One event to the righteous and the wicked — all alike under the sun',
       E'Why are the trees alike? *‘Because,’ saith he, ‘neither the righteous are distinguishable, nor the sinners in this world, but they are alike. For as in the winter the trees, having shed their leaves, are alike, and are not distinguishable, which are withered, and which alive, so also in this world neither the just nor the sinners are distinguishable, but they are all alike.’* (Hermas 20:1) It ain''t new — the Preacher saw the same riddle under the sun: *All things come alike to all: there is one event to the righteous, and to the wicked; to the good and to the clean, and to the unclean... as is the good, so is the sinner* (Ecclesiastes 9:2). Even the wise man''s works, said Qoheleth, *are in the hand of Elohim (God): no man knoweth either love or hatred by all that is before them* (Ecclesiastes 9:1). The wintering of the righteous among the sinners, where outward lot cannot tell the living tree from the withered, is the old wisdom of the ages — the verdict waits.',
       sv.verse_id, ev.verse_id, 'extras', 71978
  FROM _session253_herm20_lookup sv, _session253_herm20_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=20 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=20 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-20-then-shall-ye-discern',
       E'Then shall ye discern — winter passes and the righteous are known',
       E'The whole point of the wintering is that it will not last: *For this world is winter to the righteous, and they are not distinguishable, as they dwell with the sinners.* (Hermas 20:1) The winter is THIS world only; a discerning is coming. It ain''t new — Malachi closed the matter long before: *Then shall ye return, and discern between the righteous and the wicked, between him that serveth Elohim (God) and him that serveth him not.* (Malachi 3:18) And the book of remembrance is already written for the wintering faithful: *Then they that feared Yahuah (LORD) spake often one to another: and Yahuah (LORD) hearkened, and heard it, and a book of remembrance was written before him* (Malachi 3:16). When the harvest comes the Master''s word seals it — *Then shall the righteous shine forth as the sun in the kingdom of their Father* (Matthew 13:43). The trees indistinguishable in winter will be told apart in the day of jewels; the verdict only waits for the season.',
       sv.verse_id, ev.verse_id, 'extras', 71981
  FROM _session253_herm20_lookup sv, _session253_herm20_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=20 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=20 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: hermas-20-wheat-and-tares-grow-together
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 13:30 — *Let both grow together until the harvest: and in the time of harvest I will say to the reapers, Gather ye together first the tares, and bind them in bundles to burn them: but gather the wheat into my barn.* The righteous and the sinners dwelling alike in this world, indistinguishable, are the wheat and the tares the Master leaves growing together until the harvest.'
  FROM cross_reference_threads t, cross_references x, _session253_herm20_lookup sv, _session253_herm20_lookup tv
 WHERE t.slug='hermas-20-wheat-and-tares-grow-together'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=20 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=13 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 13:38 — *The field is the world; the good seed are the children of the kingdom; but the tares are the children of the wicked one;* Hermas''s trees are ''they that dwell in this world,'' the very field the Master names where the children of the kingdom and the children of the wicked one stand together.'
  FROM cross_reference_threads t, cross_references x, _session253_herm20_lookup sv, _session253_herm20_lookup tv
 WHERE t.slug='hermas-20-wheat-and-tares-grow-together'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=20 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=13 AND tv.verse_number=38
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 13:29 — *But he said, Nay; lest while ye gather up the tares, ye root up also the wheat with them.* That the just and the sinners cannot now be distinguished is why the householder forbids the early uprooting — wheat and tare look alike in the winter of this world.'
  FROM cross_reference_threads t, cross_references x, _session253_herm20_lookup sv, _session253_herm20_lookup tv
 WHERE t.slug='hermas-20-wheat-and-tares-grow-together'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=20 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=13 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-20-one-event-to-righteous-and-wicked
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ecclesiastes 9:2 — *All things come alike to all: there is one event to the righteous, and to the wicked; to the good and to the clean, and to the unclean; to him that sacrificeth, and to him that sacrificeth not: as is the good, so is the sinner; and he that sweareth, as he that feareth an oath.* The Shepherd''s word that the just and the sinners are not distinguishable in this world is the Preacher''s one event that comes alike to all under the sun.'
  FROM cross_reference_threads t, cross_references x, _session253_herm20_lookup sv, _session253_herm20_lookup tv
 WHERE t.slug='hermas-20-one-event-to-righteous-and-wicked'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=20 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=9 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ecclesiastes 9:1 — *For all this I considered in my heart even to declare all this, that the righteous, and the wise, and their works, are in the hand of Elohim (God): no man knoweth either love or hatred by all that is before them.* That none can now tell the withered tree from the living mirrors Qoheleth''s word that no man knows, by all that is before him, who stands in love and who in hatred — it is hidden in the hand of Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_herm20_lookup sv, _session253_herm20_lookup tv
 WHERE t.slug='hermas-20-one-event-to-righteous-and-wicked'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=20 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=9 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-20-then-shall-ye-discern
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Malachi 3:18 — *Then shall ye return, and discern between the righteous and the wicked, between him that serveth Elohim (God) and him that serveth him not.* The winter in which the just and the sinners cannot be told apart gives way to the very discerning Malachi promised — then, not now, shall the righteous be known from the wicked.'
  FROM cross_reference_threads t, cross_references x, _session253_herm20_lookup sv, _session253_herm20_lookup tv
 WHERE t.slug='hermas-20-then-shall-ye-discern'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=20 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Malachi 3:16 — *Then they that feared Yahuah (LORD) spake often one to another: and Yahuah (LORD) hearkened, and heard it, and a book of remembrance was written before him for them that feared Yahuah (LORD), and that thought upon his name.* Though the righteous wither indistinguishably among the sinners now, a book of remembrance is already written for them — the wintered faithful are not forgotten.'
  FROM cross_reference_threads t, cross_references x, _session253_herm20_lookup sv, _session253_herm20_lookup tv
 WHERE t.slug='hermas-20-then-shall-ye-discern'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=20 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 13:43 — *Then shall the righteous shine forth as the sun in the kingdom of their Father. Who hath ears to hear, let him hear.* The trees that look alike and withered in this world''s winter shall, at the harvest, be parted — and the righteous shall shine forth as the sun, no longer hidden among the tares.'
  FROM cross_reference_threads t, cross_references x, _session253_herm20_lookup sv, _session253_herm20_lookup tv
 WHERE t.slug='hermas-20-then-shall-ye-discern'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=20 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=13 AND tv.verse_number=43
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_hermas_21.sql (session253 hermas 21) -----
-- Source anchor: lightfoot-apostolic-fathers/hermas ch21. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: herm21 (view _session253_herm21_lookup). Sort band base 72000, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_herm21_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: hermas-21-summer-reveals-the-righteous
  ('lightfoot-apostolic-fathers', 'hermas', 21, 1, 'canon', 'matthew', 13, 43, 'free', E'Matthew 13:43 — *Then shall the righteous shine forth as the sun in the kingdom of their Father. Who hath ears to hear, let him hear.* Hermas''s summer that makes the fruits of the righteous manifest is the Master''s own harvest, where the righteous shine forth as the sun (Hermas 21:1).'),
  ('lightfoot-apostolic-fathers', 'hermas', 21, 1, 'canon', 'malachi', 3, 18, 'free', E'Malachi 3:18 — *Then shall ye return, and discern between the righteous and the wicked, between him that serveth Elohim (God) and him that serveth him not.* The summer that reveals who serves Elohim and who does not is Malachi''s promised day of discerning — it ain''t new (Hermas 21:1).'),
  -- thread: hermas-21-tree-by-water-versus-the-chaff
  ('lightfoot-apostolic-fathers', 'hermas', 21, 1, 'canon', 'psalms', 1, 3, 'free', E'Psalm 1:3 — *And he shall be like a tree planted by the rivers of water, that bringeth forth his fruit in his season; his leaf also shall not wither; and whatsoever he doeth shall prosper.* Hermas''s sprouting, fruit-bearing trees of the righteous are the Psalmist''s tree by the rivers of water whose leaf does not wither (Hermas 21:1).'),
  ('lightfoot-apostolic-fathers', 'hermas', 21, 1, 'canon', 'psalms', 1, 4, 'free', E'Psalm 1:4 — *The ungodly are not so: but are like the chaff which the wind driveth away.* The withered, unfruitful trees burnt up as fuel are the Psalmist''s chaff that the wind drives away — the same two ways, the same two ends (Hermas 21:1).'),
  -- thread: hermas-21-bear-fruit-burned-as-fuel
  ('lightfoot-apostolic-fathers', 'hermas', 21, 1, 'canon', 'matthew', 13, 30, 'free', E'Matthew 13:30 — *Let both grow together until the harvest: and in the time of harvest I will say to the reapers, Gather ye together first the tares, and bind them in bundles to burn them: but gather the wheat into my barn.* The withered burnt as fuel and the fruitful gathered unto the world to come are the Master''s tares bound to burn and wheat gathered into the barn (Hermas 21:1).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_herm21_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_herm21_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-21-summer-reveals-the-righteous',
       E'The summer to come — the righteous made manifest and shining forth',
       E'Where the third Similitude showed all trees alike withered in winter, the fourth turns to summer: *He showed me many trees again, some of them sprouting, and others withered... ‘These trees,’ saith he, ‘that are sprouting are the righteous, who shall dwell in the world to come; for the world to come is summer to the righteous, but winter to the sinners. When then the mercy of Yahuah (Lord) shall shine forth, then they that serve Elohim (God) shall be made manifest; yea, and all men shall be made manifest. For as in summer the fruits of each several tree are made manifest, and are recognised of what sort they are, so also the fruits of the righteous shall be manifest...’* (Hermas 21:1) It ain''t new — the Master closed His own parable of wheat and tares with the very summer Hermas saw: *Then shall the righteous shine forth as the sun in the kingdom of their Father. Who hath ears to hear, let him hear.* (Matthew 13:43) And the day that sorts the sprouting from the withered is Malachi''s day of discerning: *Then shall ye return, and discern between the righteous and the wicked, between him that serveth Elohim (God) and him that serveth him not.* (Malachi 3:18) The age to come does not change who a man is; it reveals it.',
       sv.verse_id, ev.verse_id, 'extras', 72000
  FROM _session253_herm21_lookup sv, _session253_herm21_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=21 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=21 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-21-tree-by-water-versus-the-chaff',
       E'The sprouting tree and the withered — the green by the water and the chaff',
       E'The Shepherd parts the orchard in two: the sprouting *are the righteous, who shall dwell in the world to come*, while *the Gentiles and the sinners, just as thou sawest the trees which were withered, even such shall they be found, withered and unfruitful in that world, and shall be burnt up as fuel... For the sinners shall be burned, because they sinned and repented not.* (Hermas 21:1) It ain''t new — the very first Psalm drew the same two trees. The righteous man: *And he shall be like a tree planted by the rivers of water, that bringeth forth his fruit in his season; his leaf also shall not wither; and whatsoever he doeth shall prosper.* (Psalm 1:3) And the wicked, the withered and rootless: *The ungodly are not so: but are like the chaff which the wind driveth away.* (Psalm 1:4) The fruit-bearing tree by the water and the chaff that is burned — the Shepherd is reading the orchard the Psalmist planted.',
       sv.verse_id, ev.verse_id, 'extras', 72003
  FROM _session253_herm21_lookup sv, _session253_herm21_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=21 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=21 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-21-bear-fruit-burned-as-fuel',
       E'Bear fruit for that summer — the fruitless burned, the wheat gathered in',
       E'The Shepherd turns the vision into a charge: the withered *shall be burnt up as fuel... For the sinners shall be burned, because they sinned and repented not... Do thou therefore bear fruit, that in that summer thy fruit may be known... If therefore thou doest these things, thou shalt be able to bear fruit unto the world to come.* (Hermas 21:1) It ain''t new — the Master''s harvest sorts the field exactly so: *Let both grow together until the harvest: and in the time of harvest I will say to the reapers, Gather ye together first the tares, and bind them in bundles to burn them: but gather the wheat into my barn.* (Matthew 13:30) The fruitless are bound and burned; the fruitful are gathered in. The whole call of the Shepherd of repentance is that you be found wheat in that summer, bearing fruit unto the world to come.',
       sv.verse_id, ev.verse_id, 'extras', 72006
  FROM _session253_herm21_lookup sv, _session253_herm21_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=21 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=21 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: hermas-21-summer-reveals-the-righteous
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 13:43 — *Then shall the righteous shine forth as the sun in the kingdom of their Father. Who hath ears to hear, let him hear.* Hermas''s summer that makes the fruits of the righteous manifest is the Master''s own harvest, where the righteous shine forth as the sun (Hermas 21:1).'
  FROM cross_reference_threads t, cross_references x, _session253_herm21_lookup sv, _session253_herm21_lookup tv
 WHERE t.slug='hermas-21-summer-reveals-the-righteous'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=21 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=13 AND tv.verse_number=43
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Malachi 3:18 — *Then shall ye return, and discern between the righteous and the wicked, between him that serveth Elohim (God) and him that serveth him not.* The summer that reveals who serves Elohim and who does not is Malachi''s promised day of discerning — it ain''t new (Hermas 21:1).'
  FROM cross_reference_threads t, cross_references x, _session253_herm21_lookup sv, _session253_herm21_lookup tv
 WHERE t.slug='hermas-21-summer-reveals-the-righteous'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=21 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-21-tree-by-water-versus-the-chaff
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 1:3 — *And he shall be like a tree planted by the rivers of water, that bringeth forth his fruit in his season; his leaf also shall not wither; and whatsoever he doeth shall prosper.* Hermas''s sprouting, fruit-bearing trees of the righteous are the Psalmist''s tree by the rivers of water whose leaf does not wither (Hermas 21:1).'
  FROM cross_reference_threads t, cross_references x, _session253_herm21_lookup sv, _session253_herm21_lookup tv
 WHERE t.slug='hermas-21-tree-by-water-versus-the-chaff'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=21 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 1:4 — *The ungodly are not so: but are like the chaff which the wind driveth away.* The withered, unfruitful trees burnt up as fuel are the Psalmist''s chaff that the wind drives away — the same two ways, the same two ends (Hermas 21:1).'
  FROM cross_reference_threads t, cross_references x, _session253_herm21_lookup sv, _session253_herm21_lookup tv
 WHERE t.slug='hermas-21-tree-by-water-versus-the-chaff'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=21 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=1 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-21-bear-fruit-burned-as-fuel
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 13:30 — *Let both grow together until the harvest: and in the time of harvest I will say to the reapers, Gather ye together first the tares, and bind them in bundles to burn them: but gather the wheat into my barn.* The withered burnt as fuel and the fruitful gathered unto the world to come are the Master''s tares bound to burn and wheat gathered into the barn (Hermas 21:1).'
  FROM cross_reference_threads t, cross_references x, _session253_herm21_lookup sv, _session253_herm21_lookup tv
 WHERE t.slug='hermas-21-bear-fruit-burned-as-fuel'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=21 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=13 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_hermas_22.sql (session253 hermas 22) -----
-- Source anchor: lightfoot-apostolic-fathers/hermas ch22. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: herm22 (view _session253_herm22_lookup). Sort band base 72025, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_herm22_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: hermas-22-the-true-fast
  ('lightfoot-apostolic-fathers', 'hermas', 22, 1, 'canon', 'isaiah', 58, 6, 'free', E'Isaiah 58:6 — *Is not this the fast that I have chosen? to loose the bands of wickedness, to undo the heavy burdens, and to let the oppressed go free, and that ye break every yoke?* The Shepherd''s ''do no wickedness, observe His commandments and walk in His ordinances'' is the prophet''s own fast that looses wickedness — the true fast was never mere abstinence.'),
  ('lightfoot-apostolic-fathers', 'hermas', 22, 1, 'canon', 'isaiah', 58, 7, 'free', E'Isaiah 58:7 — *Is it not to deal thy bread to the hungry, and that thou bring the poor that are cast out to thy house? when thou seest the naked, that thou cover him; and that thou hide not thyself from thine own flesh?* The fast Yahuah chooses pours out to the hungry and the cast-out, the very righteousness the Shepherd sets in place of the vain fast.'),
  -- thread: hermas-22-the-vineyard-fenced-and-digged
  ('lightfoot-apostolic-fathers', 'hermas', 22, 2, 'canon', 'matthew', 21, 33, 'free', E'Matthew 21:33 — *Hear another parable: There was a certain householder, which planted a vineyard, and hedged it round about, and digged a winepress in it, and built a tower, and let it out to husbandmen, and went into a far country:* The Shepherd''s master who planted a vineyard, set a fence about it, and travelled abroad is the Master''s own householder — the planted vineyard is the people, kept by the servant against the lord''s return.'),
  -- thread: hermas-22-the-son-the-formed-in-power
  ('lightfoot-apostolic-fathers', 'hermas', 22, 6, 'canon', 'romans', 8, 3, 'free', E'Romans 8:3 — *For what the law could not do, in that it was weak through the flesh, Elohim (God) sending his own Son in the likeness of sinful flesh, and for sin, condemned sin in the flesh:* The Son who cleansed His people''s sins by much labour, the Formed Son sent by His Father, is the very Son sent in the likeness of flesh to condemn sin in the flesh — power exercised in obedience to the One who sent Him.'),
  ('lightfoot-apostolic-fathers', 'hermas', 22, 6, 'canon', 'romans', 8, 4, 'free', E'Romans 8:4 — *That the righteousness of the law might be fulfilled in us, who walk not after the flesh, but after the Spirit.* The Son who ''showed them the paths of life, giving them the law which He received from His Father'' gives the law that its righteousness be fulfilled in the people — the Torah honoured and written within, never cast off.'),
  -- thread: hermas-22-keep-the-flesh-pure-temple-of-the-spirit
  ('lightfoot-apostolic-fathers', 'hermas', 22, 7, 'canon', '1-corinthians', 3, 16, 'free', E'1 Corinthians 3:16 — *Know ye not that ye are the temple of Elohim (God), and that the Spirit of Elohim (God) dwelleth in you?* The Shepherd''s flesh wherein the Ruach HaKodesh dwells is Sha''ul''s temple in which the Spirit of Elohim dwells — the body made the dwelling-place of the Spirit.'),
  ('lightfoot-apostolic-fathers', 'hermas', 22, 7, 'canon', '1-corinthians', 3, 17, 'free', E'1 Corinthians 3:17 — *If any man defile the temple of Elohim (God), him shall Elohim (God) destroy; for the temple of Elohim (God) is holy, which temple ye are.* The Shepherd''s warning that he who defiles his flesh defiles the Spirit and shall not live is Sha''ul''s own — defile the temple and Elohim will destroy, for the temple is holy.'),
  ('lightfoot-apostolic-fathers', 'hermas', 22, 7, 'canon', '1-corinthians', 6, 19, 'free', E'1 Corinthians 6:19 — *What? know ye not that your body is the temple of the Ruach HaKodesh (Holy Spirit) which is in you, which ye have of Elohim (God), and ye are not your own?* The charge to keep this flesh pure and undefiled because the Holy Spirit dwells in it is Sha''ul''s word that the body is the temple of the Ruach HaKodesh and is not our own.'),
  ('lightfoot-apostolic-fathers', 'hermas', 22, 7, 'canon', 'romans', 8, 16, 'free', E'Romans 8:16 — *The Spirit itself beareth witness with our spirit, that we are the children of Elohim (God):* The Shepherd''s promise that the Spirit dwelling in the kept flesh ''may bear witness to it, and thy flesh may be justified'' is Sha''ul''s witnessing Spirit, testifying with our spirit that we are children of Elohim.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_herm22_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_herm22_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-22-the-true-fast',
       E'The true fast — keep the commandments, do righteousness',
       E'When Hermas boasts of his accustomed fasting, the Shepherd cuts straight through the ritual to the heart: *‘Ye know not,’ saith he, ‘how to fast unto Yahuah (Lord), neither is this a fast, this unprofitable fast which ye make unto Him... Elohim (God) desireth not such a vain fast; for by so fasting unto Elohim (God) thou shalt do nothing for righteousness. But fast thou [unto Elohim (God)] such a fast as this; do no wickedness in thy life, and serve Yahuah (Lord) with a pure heart; observe His commandments and walk in His ordinances, and let no evil desire rise up in thy heart; but believe Elohim (God).’* (Hermas 22:1) It ain''t new — this is the prophet''s own word, the fast Yahuah Himself chooses: *Is not this the fast that I have chosen? to loose the bands of wickedness, to undo the heavy burdens, and to let the oppressed go free, and that ye break every yoke?* (Isaiah 58:6), and *Is it not to deal thy bread to the hungry, and that thou bring the poor that are cast out to thy house?* (Isaiah 58:7). The Shepherd does not abolish the fast; he restores it to what the prophet said it always was — keeping the commandments, walking in His ordinances, doing righteousness. The commandments stand at the centre of the acceptable fast.',
       sv.verse_id, ev.verse_id, 'extras', 72025
  FROM _session253_herm22_lookup sv, _session253_herm22_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=22 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=22 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-22-the-vineyard-fenced-and-digged',
       E'The faithful servant who fenced and digged the vineyard',
       E'The Shepherd tells the parable of fasting: a master *planted a vineyard*, and gave it over to a trusty servant — *‘Take this vineyard [which I have planted], and fence it [till I come]... Now keep this my commandment, and thou shalt be free in my house.’* The servant fenced it, then, seeing it choked with weeds, *‘took and digged the vineyard, and all the weeds that were in the vineyard he plucked up. And that vineyard became very neat and flourishing.’* (Hermas 22:2) It ain''t new — the Master Himself spoke the same picture: *Hear another parable: There was a certain householder, which planted a vineyard, and hedged it round about, and digged a winepress in it, and built a tower, and let it out to husbandmen, and went into a far country* (Matthew 21:33). And the labour that pleases the lord — the servant who not only kept the command but dug out the weeds — is the doing of righteousness beyond the bare letter, the good work that crowns obedience, the same the prophets called the chosen fast. The vineyard is the planted people; the keeping of the commandment is the servant''s freedom.',
       sv.verse_id, ev.verse_id, 'extras', 72028
  FROM _session253_herm22_lookup sv, _session253_herm22_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=22 AND sv.verse_number=2
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=22 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-22-the-son-the-formed-in-power',
       E'The Son revealed not as servant but in power and lordship — the Formed Son',
       E'When Hermas asks why the Son of Elohim is figured as a servant, the Shepherd corrects him: *‘the Son of Elohim (God) is not represented in the guise of a servant, but is represented in great power and lordship... Elohim (God) planted the vineyard, that is, He created the people, and delivered them over to His Son... Having Himself then cleansed the sins of His people, He showed them the paths of life, giving them the law which He received from His Father. Thou seest,’ saith he, ‘that He is Himself Yahuah (Lord) of the people, having received all power from His Father.’* (Hermas 22:6) Mark the order the Shepherd keeps: the Son receives the law from His Father, receives all power from His Father — the Formed Son who is Lord of the people, yet ever pointing back to the One who sent Him. It ain''t new — this is the Son sent in the likeness of flesh: *For what the law could not do, in that it was weak through the flesh, Elohim (God) sending his own Son in the likeness of sinful flesh, and for sin, condemned sin in the flesh* (Romans 8:3), *That the righteousness of the law might be fulfilled in us, who walk not after the flesh, but after the Spirit* (Romans 8:4). He cleanses the sins of the people and gives them the law He received — not abolishing the law but writing it in them, that its righteousness be fulfilled. The Son holds all power, and the power is given Him; the Lord of the people is Himself under His Father.',
       sv.verse_id, ev.verse_id, 'extras', 72031
  FROM _session253_herm22_lookup sv, _session253_herm22_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=22 AND sv.verse_number=6
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=22 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-22-keep-the-flesh-pure-temple-of-the-spirit',
       E'Keep the flesh pure that the Spirit dwelling in it may bear witness',
       E'The Shepherd''s charge at the close: *‘The Holy Pre-existent Spirit, Which created the whole creation, Elohim (God) made to dwell in flesh that He desired. This flesh, therefore, in which the Ruach HaKodesh (Holy Spirit) dwelt, was subject unto the Spirit, walking honourably in holiness and purity, without in any way defiling the Spirit... for all flesh, which is found undefiled and unspotted, wherein the Ruach HaKodesh (Holy Spirit) dwelt, shall receive a reward.’* (Hermas 22:6) And then to Hermas himself: *‘Keep this thy flesh pure and undefiled, that the Spirit which dwelleth in it may bear witness to it, and thy flesh may be justified... [For] if thou defile thy flesh, thou shalt defile the Ruach HaKodesh (Holy Spirit) also.’* (Hermas 22:7) It ain''t new — Sha''ul taught the same dwelling: *Know ye not that ye are the temple of Elohim (God), and that the Spirit of Elohim (God) dwelleth in you?* (1 Corinthians 3:16), and the warning is the same — *If any man defile the temple of Elohim (God), him shall Elohim (God) destroy; for the temple of Elohim (God) is holy, which temple ye are* (1 Corinthians 3:17). And again: *What? know ye not that your body is the temple of the Ruach HaKodesh (Holy Spirit) which is in you, which ye have of Elohim (God), and ye are not your own?* (1 Corinthians 6:19). The Spirit that bears witness with the man''s spirit is no new doctrine: *The Spirit itself beareth witness with our spirit, that we are the children of Elohim (God)* (Romans 8:16). Keep the flesh holy, that the indwelling Spirit may stand as witness for thee.',
       sv.verse_id, ev.verse_id, 'extras', 72034
  FROM _session253_herm22_lookup sv, _session253_herm22_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=22 AND sv.verse_number=7
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=22 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: hermas-22-the-true-fast
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 58:6 — *Is not this the fast that I have chosen? to loose the bands of wickedness, to undo the heavy burdens, and to let the oppressed go free, and that ye break every yoke?* The Shepherd''s ''do no wickedness, observe His commandments and walk in His ordinances'' is the prophet''s own fast that looses wickedness — the true fast was never mere abstinence.'
  FROM cross_reference_threads t, cross_references x, _session253_herm22_lookup sv, _session253_herm22_lookup tv
 WHERE t.slug='hermas-22-the-true-fast'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=22 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=58 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 58:7 — *Is it not to deal thy bread to the hungry, and that thou bring the poor that are cast out to thy house? when thou seest the naked, that thou cover him; and that thou hide not thyself from thine own flesh?* The fast Yahuah chooses pours out to the hungry and the cast-out, the very righteousness the Shepherd sets in place of the vain fast.'
  FROM cross_reference_threads t, cross_references x, _session253_herm22_lookup sv, _session253_herm22_lookup tv
 WHERE t.slug='hermas-22-the-true-fast'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=22 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=58 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-22-the-vineyard-fenced-and-digged
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 21:33 — *Hear another parable: There was a certain householder, which planted a vineyard, and hedged it round about, and digged a winepress in it, and built a tower, and let it out to husbandmen, and went into a far country:* The Shepherd''s master who planted a vineyard, set a fence about it, and travelled abroad is the Master''s own householder — the planted vineyard is the people, kept by the servant against the lord''s return.'
  FROM cross_reference_threads t, cross_references x, _session253_herm22_lookup sv, _session253_herm22_lookup tv
 WHERE t.slug='hermas-22-the-vineyard-fenced-and-digged'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=22 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=21 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-22-the-son-the-formed-in-power
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 8:3 — *For what the law could not do, in that it was weak through the flesh, Elohim (God) sending his own Son in the likeness of sinful flesh, and for sin, condemned sin in the flesh:* The Son who cleansed His people''s sins by much labour, the Formed Son sent by His Father, is the very Son sent in the likeness of flesh to condemn sin in the flesh — power exercised in obedience to the One who sent Him.'
  FROM cross_reference_threads t, cross_references x, _session253_herm22_lookup sv, _session253_herm22_lookup tv
 WHERE t.slug='hermas-22-the-son-the-formed-in-power'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=22 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 8:4 — *That the righteousness of the law might be fulfilled in us, who walk not after the flesh, but after the Spirit.* The Son who ''showed them the paths of life, giving them the law which He received from His Father'' gives the law that its righteousness be fulfilled in the people — the Torah honoured and written within, never cast off.'
  FROM cross_reference_threads t, cross_references x, _session253_herm22_lookup sv, _session253_herm22_lookup tv
 WHERE t.slug='hermas-22-the-son-the-formed-in-power'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=22 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-22-keep-the-flesh-pure-temple-of-the-spirit
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Corinthians 3:16 — *Know ye not that ye are the temple of Elohim (God), and that the Spirit of Elohim (God) dwelleth in you?* The Shepherd''s flesh wherein the Ruach HaKodesh dwells is Sha''ul''s temple in which the Spirit of Elohim dwells — the body made the dwelling-place of the Spirit.'
  FROM cross_reference_threads t, cross_references x, _session253_herm22_lookup sv, _session253_herm22_lookup tv
 WHERE t.slug='hermas-22-keep-the-flesh-pure-temple-of-the-spirit'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=22 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=3 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Corinthians 3:17 — *If any man defile the temple of Elohim (God), him shall Elohim (God) destroy; for the temple of Elohim (God) is holy, which temple ye are.* The Shepherd''s warning that he who defiles his flesh defiles the Spirit and shall not live is Sha''ul''s own — defile the temple and Elohim will destroy, for the temple is holy.'
  FROM cross_reference_threads t, cross_references x, _session253_herm22_lookup sv, _session253_herm22_lookup tv
 WHERE t.slug='hermas-22-keep-the-flesh-pure-temple-of-the-spirit'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=22 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=3 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Corinthians 6:19 — *What? know ye not that your body is the temple of the Ruach HaKodesh (Holy Spirit) which is in you, which ye have of Elohim (God), and ye are not your own?* The charge to keep this flesh pure and undefiled because the Holy Spirit dwells in it is Sha''ul''s word that the body is the temple of the Ruach HaKodesh and is not our own.'
  FROM cross_reference_threads t, cross_references x, _session253_herm22_lookup sv, _session253_herm22_lookup tv
 WHERE t.slug='hermas-22-keep-the-flesh-pure-temple-of-the-spirit'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=22 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=6 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 8:16 — *The Spirit itself beareth witness with our spirit, that we are the children of Elohim (God):* The Shepherd''s promise that the Spirit dwelling in the kept flesh ''may bear witness to it, and thy flesh may be justified'' is Sha''ul''s witnessing Spirit, testifying with our spirit that we are children of Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_herm22_lookup sv, _session253_herm22_lookup tv
 WHERE t.slug='hermas-22-keep-the-flesh-pure-temple-of-the-spirit'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=22 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_hermas_23.sql (session253 hermas 23) -----
-- Source anchor: lightfoot-apostolic-fathers/hermas ch23. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: herm23 (view _session253_herm23_lookup). Sort band base 72050, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_herm23_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: hermas-23-willow-all-called-by-the-name
  ('lightfoot-apostolic-fathers', 'hermas', 23, 2, 'canon', 'revelation', 2, 10, 'free', E'Revelation 2:10 — *Fear none of those things which thou shalt suffer: behold, the devil shall cast some of you into prison, that ye may be tried; and ye shall have tribulation ten days: be thou faithful unto death, and I will give thee a crown of life.* The palm-crowns the angel sets on those who suffered for the law are the Master''s own crown of life for the faithful unto death.'),
  ('lightfoot-apostolic-fathers', 'hermas', 23, 2, 'canon', 'revelation', 7, 9, 'free', E'Revelation 7:9 — *After this I beheld, and, lo, a great multitude, which no man could number, of all nations, and kindreds, and people, and tongues, stood before the throne, and before the Lamb, clothed with white robes, and palms in their hands;* the crowned of palm-branches sent into the tower in raiment white as snow are the white-robed, palm-bearing throng before the throne.'),
  ('lightfoot-apostolic-fathers', 'hermas', 23, 2, 'canon', 'matthew', 10, 22, 'free', E'Matthew 10:22 — *And ye shall be hated of all men for my name’s sake: but he that endureth to the end shall be saved.* They that suffered for the law and were crowned are the Master''s enduring ones, saved by holding fast for the Name''s sake.'),
  -- thread: hermas-23-the-tree-is-the-law-written-on-hearts
  ('lightfoot-apostolic-fathers', 'hermas', 23, 3, 'canon', 'jeremiah', 31, 33, 'free', E'Jeremiah 31:33 — *But this shall be the covenant that I will make with the house of Yashar''el (Israel); After those days, saith Yahuah (LORD), I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people.* Michael putting the law into the hearts of the believers is the new covenant the prophet named — the law internalized, never abolished.'),
  ('lightfoot-apostolic-fathers', 'hermas', 23, 3, 'canon', 'ezekiel', 36, 27, 'free', E'Ezekiel 36:27 — *And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them.* The law set into the heart by the glorious angel is the Spirit-wrought obedience the prophet promised; the Spirit and the Torah are not rivals but one work.'),
  ('lightfoot-apostolic-fathers', 'hermas', 23, 3, 'canon', 'deuteronomy', 30, 14, 'free', E'Deuteronomy 30:14 — *But the word is very nigh unto thee, in thy mouth, and in thy heart, that thou mayest do it.* The rods that are the law, placed into the hearts of the believers, are Moses'' own word — never far off, always meant for the heart and the doing.'),
  ('lightfoot-apostolic-fathers', 'hermas', 23, 3, 'canon', 'isaiah', 51, 4, 'free', E'Isaiah 51:4 — *Hearken unto me, my people; and give ear unto me, O my nation: for a law shall proceed from me, and I will make my judgment to rest for a light of the people.* The tree-law given to the whole world and preached to the ends of the earth is the prophet''s law proceeding from Yahuah as a light to the peoples.'),
  -- thread: hermas-23-repentance-brings-life
  ('lightfoot-apostolic-fathers', 'hermas', 23, 6, 'canon', 'ezekiel', 33, 11, 'free', E'Ezekiel 33:11 — *Say unto them, As I live, saith Adonai Yahuah (the Lord GOD), I have no pleasure in the death of the wicked; but that the wicked turn from his way and live: turn ye, turn ye from your evil ways; for why will ye die, O house of Yashar''el (Israel)?* The abundant compassion that revives the withered rods is the prophet''s own Yahuah, who desires the wicked to turn and live, not perish.'),
  ('lightfoot-apostolic-fathers', 'hermas', 23, 6, 'canon', '2-peter', 3, 9, 'free', E'2 Peter 3:9 — *Yahuah (Lord) is not slack concerning his promise, as some men count slackness; but is longsuffering to us-ward, not willing that any should perish, but that all should come to repentance.* That repentance bringeth life and the time still stands open is the Master''s longsuffering, unwilling that any should perish.'),
  ('lightfoot-apostolic-fathers', 'hermas', 23, 6, 'canon', 'luke', 15, 7, 'free', E'Luke 15:7 — *I say unto you, that likewise joy shall be in heaven over one sinner that repenteth, more than over ninety and nine just persons, which need no repentance.* The shepherd''s gladness over every withered rod that revives is heaven''s own joy over the one sinner who turns.'),
  -- thread: hermas-23-life-for-them-that-keep-the-commandments
  ('lightfoot-apostolic-fathers', 'hermas', 23, 7, 'canon', '1-john', 5, 3, 'free', E'1 John 5:3 — *For this is the love of Elohim (God), that we keep his commandments: and his commandments are not grievous.* The Shepherd''s ''life is for all those that keep the commandments'' is the apostle''s own measure of love — the commandments stand, and they are not grievous.'),
  ('lightfoot-apostolic-fathers', 'hermas', 23, 7, 'canon', 'john', 14, 15, 'free', E'John 14:15 — *If ye love me, keep my commandments.* The life of Yahuah dwelling in them that keep the commandments rests on the Master''s own binding of love to obedience.'),
  ('lightfoot-apostolic-fathers', 'hermas', 23, 7, 'canon', 'matthew', 7, 21, 'free', E'Matthew 7:21 — *Not every one that saith unto me, Yahuah (Lord), Yahuah (Lord), shall enter into the kingdom of heaven; but he that doeth the will of my Father which is in heaven.* The factious and lawless who say but do not keep are the Master''s own who cry Lord, Lord yet do not do the Father''s will — saying is not the doing.'),
  -- thread: hermas-23-go-tell-all-to-repent-and-be-healed
  ('lightfoot-apostolic-fathers', 'hermas', 23, 11, 'canon', 'ezekiel', 18, 21, 'free', E'Ezekiel 18:21 — *But if the wicked will turn from all his sins that he hath committed, and keep all my statutes, and do that which is lawful and right, he shall surely live, he shall not die.* Healing for former sins to the one who repents whole-heartedly and adds no more is the prophet''s own promise — turn, keep the statutes, and surely live.'),
  ('lightfoot-apostolic-fathers', 'hermas', 23, 11, 'canon', 'james', 5, 20, 'free', E'James 5:20 — *Let him know, that he which converteth the sinner from the error of his way shall save a soul from death, and shall hide a multitude of sins.* The charge to go tell all men to repent that they may live is the apostle''s own work of turning the erring back and saving a soul from death.'),
  ('lightfoot-apostolic-fathers', 'hermas', 23, 11, 'canon', '2-peter', 3, 9, 'free', E'2 Peter 3:9 — *Yahuah (Lord) is not slack concerning his promise, as some men count slackness; but is longsuffering to us-ward, not willing that any should perish, but that all should come to repentance.* That the long-suffering Yahuah willeth them called through His Son to be saved is Kepha''s longsuffering that wills all to come to repentance.'),
  -- thread: hermas-23-the-rock-and-gate-the-name-of-the-son
  ('lightfoot-apostolic-fathers', 'hermas', 23, 12, 'canon', 'john', 10, 9, 'free', E'John 10:9 — *I am the door: by me if any man enter in, he shall be saved, and shall go in and out, and find pasture.* The one gate of the rock through which alone the saved enter the kingdom is the Master''s own word that He is the door — by Him alone any man is saved.'),
  ('lightfoot-apostolic-fathers', 'hermas', 23, 12, 'canon', 'john', 14, 6, 'free', E'John 14:6 — *Yahusha (Jesus) saith unto him, I am the way, the truth, and the life: no man cometh unto the Father, but by me.* That no one enters the kingdom of Elohim except through the Son who is the gate is the Master''s own claim to be the sole way to the Father.'),
  ('lightfoot-apostolic-fathers', 'hermas', 23, 12, 'canon', 'acts', 4, 12, 'free', E'Acts 4:12 — *Neither is there salvation in any other: for there is none other name under heaven given among men, whereby we must be saved.* That none shall enter the kingdom except he receive the name of His Son is Kepha''s proclamation that there is no other saving Name under heaven.'),
  ('lightfoot-apostolic-fathers', 'hermas', 23, 12, 'canon', 'philippians', 2, 10, 'free', E'Philippians 2:10 — *That at the name of Yahusha (Jesus) every knee should bow, of things in heaven, and things in earth, and things under the earth;* the Name of the Son which alone admits to the kingdom is the exalted Name before which Sha''ul says every knee shall bow.'),
  -- thread: hermas-23-tower-is-the-church-living-stones
  ('lightfoot-apostolic-fathers', 'hermas', 23, 13, 'canon', '1-peter', 2, 5, 'free', E'1 Peter 2:5 — *Ye also, as lively stones, are built up a spiritual house, an holy priesthood, to offer up spiritual sacrifices, acceptable to Elohim (God) by Yahusha HaMashiach (Jesus Christ).* The tower the Shepherd names the Church is Kepha''s spiritual house built up of living stones.'),
  ('lightfoot-apostolic-fathers', 'hermas', 23, 13, 'canon', 'ephesians', 2, 20, 'free', E'Ephesians 2:20 — *And are built upon the foundation of the apostles and prophets, Yahusha HaMashiach (Jesus Christ) himself being the chief corner stone;* the tower-Church built upon the rock that is the Son is Sha''ul''s building founded on the apostles and prophets with Messiah the corner stone.'),
  ('lightfoot-apostolic-fathers', 'hermas', 23, 13, 'canon', 'ephesians', 2, 22, 'free', E'Ephesians 2:22 — *In whom ye also are builded together for an habitation of Elohim (God) through the Spirit.* The stones made one with the rock, one spirit and one body, are Sha''ul''s same household builded together for a habitation of Elohim through the Spirit.'),
  ('lightfoot-apostolic-fathers', 'hermas', 23, 16, 'canon', 'john', 3, 5, 'free', E'John 3:5 — *Yahusha (Jesus) answered, Verily, verily, I say unto thee, Except a man be born of water and of the Spirit, he cannot enter into the kingdom of Elohim (God).* The stones that must rise through water to be made alive, who go down dead and come up alive, are the Master''s own birth of water and Spirit, without which none enters the kingdom.'),
  -- thread: hermas-23-twelve-mountains-twelve-tribes-nations
  ('lightfoot-apostolic-fathers', 'hermas', 23, 17, 'canon', 'ezekiel', 37, 21, 'free', E'Ezekiel 37:21 — *And say unto them, Thus saith Adonai Yahuah (the Lord GOD); Behold, I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land:* the twelve mountains that are twelve tribes inhabiting the whole world, called into one house, are the prophet''s children of Yashar''el gathered from among the nations.'),
  ('lightfoot-apostolic-fathers', 'hermas', 23, 17, 'canon', 'ezekiel', 37, 22, 'free', E'Ezekiel 37:22 — *And I will make them one nation in the land upon the mountains of Yashar''el (Israel); and one king shall be king to them all: and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all:* the tribes that became one body, one mind, one faith, bright as the sun, are the prophet''s twelve made one nation under one king, no more divided.'),
  ('lightfoot-apostolic-fathers', 'hermas', 23, 17, 'canon', 'matthew', 28, 19, 'free', E'Matthew 28:19 — *Go ye therefore, and teach all nations, baptizing them in the name of the Father, and of the Son, and of the Ruach HaKodesh (Holy Spirit):* the Son of Elohim preached by the Apostles to the twelve tribes scattered through all nations is the Master''s own sending to teach all nations and seal them in the Name.'),
  ('lightfoot-apostolic-fathers', 'hermas', 23, 17, 'canon', 'isaiah', 49, 6, 'free', E'Isaiah 49:6 — *And he said, It is a light thing that thou shouldest be my servant to raise up the tribes of Jacob, and to restore the preserved of Yashar''el (Israel): I will also give thee for a light to the Gentiles, that thou mayest be my salvation unto the end of the earth.* The preaching that reaches the twelve tribes in all the world is the servant''s commission to raise up the tribes of Jacob and be salvation to the ends of the earth.'),
  -- thread: hermas-23-your-seed-shall-never-be-blotted-out
  ('lightfoot-apostolic-fathers', 'hermas', 23, 24, 'canon', 'isaiah', 65, 23, 'free', E'Isaiah 65:23 — *They shall not labour in vain, nor bring forth for trouble; for they are the seed of the blessed of Yahuah (LORD), and their offspring with them.* The promise that your seed shall never be blotted out and your whole seed shall dwell with the Son is the prophet''s word over the blessed seed of Yahuah and their offspring with them.'),
  ('lightfoot-apostolic-fathers', 'hermas', 23, 24, 'canon', 'psalms', 37, 28, 'free', E'Psalm 37:28 — *For Yahuah (LORD) loveth judgment, and forsaketh not his saints; they are preserved for ever: but the seed of the wicked shall be cut off.* The simple and guileless whose seed is never blotted out are the psalmist''s saints, preserved for ever and not forsaken.'),
  ('lightfoot-apostolic-fathers', 'hermas', 23, 24, 'canon', 'matthew', 10, 22, 'free', E'Matthew 10:22 — *And ye shall be hated of all men for my name’s sake: but he that endureth to the end shall be saved.* The charge to remain to the end such as ye are, enrolled among the proven, is the Master''s own promise that he who endures to the end is saved.'),
  -- thread: hermas-23-become-as-babes-the-white-mountain
  ('lightfoot-apostolic-fathers', 'hermas', 23, 29, 'canon', 'matthew', 18, 3, 'free', E'Matthew 18:3 — *And said, Verily I say unto you, Except ye be converted, and become as little children, ye shall not enter into the kingdom of heaven.* The babes without guile who dwell without doubt in the kingdom are the Master''s own little children, without whom-likeness none enters the kingdom.'),
  ('lightfoot-apostolic-fathers', 'hermas', 23, 29, 'canon', 'matthew', 19, 14, 'free', E'Matthew 19:14 — *But Yahusha (Jesus) said, Suffer little children, and forbid them not, to come unto me: for of such is the kingdom of heaven.* The infants who stand first in the sight of Elohim are the Master''s own little children, of whom is the kingdom of heaven.'),
  ('lightfoot-apostolic-fathers', 'hermas', 23, 29, 'canon', 'matthew', 5, 8, 'free', E'Matthew 5:8 — *Blessed are the pure in heart: for they shall see Elohim (God).* They into whose heart no guile entereth, who defiled the commandments in nothing, are the Master''s pure in heart who shall see Elohim.'),
  -- thread: hermas-23-restore-the-spirit-whole
  ('lightfoot-apostolic-fathers', 'hermas', 23, 32, 'canon', '1-thessalonians', 5, 23, 'free', E'1 Thessalonians 5:23 — *And the very Elohim (God) of peace sanctify you wholly; and I pray Elohim (God) your whole spirit and soul and body be preserved blameless unto the coming of our Lord Yahusha HaMashiach (Lord Jesus Christ).* The charge to restore the spirit whole as it was received is Sha''ul''s own prayer that the whole spirit and soul and body be preserved blameless.'),
  ('lightfoot-apostolic-fathers', 'hermas', 23, 32, 'canon', 'ephesians', 4, 30, 'free', E'Ephesians 4:30 — *And grieve not the holy Spirit of Elohim (God), whereby ye are sealed unto the day of redemption.* The warning against giving back the spirit torn, as a fuller rends a whole garment, is Sha''ul''s caution not to grieve the sealing Spirit.'),
  ('lightfoot-apostolic-fathers', 'hermas', 23, 32, 'canon', 'psalms', 51, 10, 'free', E'Psalm 51:10 — *Create in me a clean heart, O Elohim (God); and renew a right spirit within me.* The only mending for a spirit made useless is the psalmist''s cry that Elohim create a clean heart and renew a right spirit within.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_herm23_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_herm23_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-23-willow-all-called-by-the-name',
       E'The willow that shelters all called by the Name — crowned who suffered for the law',
       E'The great Similitude opens beneath one tree: *He showed me a [great] willow, overshadowing plains and mountains, and under the shadow of the willow all have come who are called by the name of Yahuah (Lord).* (Hermas 23:1) The angel lops rods — the law — and gives one to every soul; and when the rods are rendered back, those whose rods bore *shoots* and *fruit* are crowned: *And the angel of Yahuah (Lord) commanded crowns to be brought... made as it were of palm-branches; and he crowned the men that had given up the rods which had the shoots and some fruit, and sent them away into the tower... these are they that suffered for the law.* (Hermas 23:2) It ain''t new — the crown of palm is the Master''s own promise to the faithful unto death: *be thou faithful unto death, and I will give thee a crown of life* (Revelation 2:10); the palm-bearing multitude already stands before the throne in Yochanan''s vision: *a great multitude... clothed with white robes, and palms in their hands* (Revelation 7:9); and the enduring are the saved: *he that endureth to the end shall be saved* (Matthew 10:22).',
       sv.verse_id, ev.verse_id, 'extras', 72050
  FROM _session253_herm23_lookup sv, _session253_herm23_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=23 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-23-the-tree-is-the-law-written-on-hearts',
       E'The great tree is the law of Elohim — put into the hearts of the believers',
       E'When Hermas asks what the tree is, the Shepherd answers with the heart of the whole vision: *this great tree which overshadows plains and mountains and all the earth is the law of Elohim (God) which was given to the whole world; and this law is the Son of Elohim (God) preached unto the ends of the earth... but the great and glorious angel is Michael... for this is he that putteth the law into the hearts of the believers... the rods are the law.* (Hermas 23:3) Mark it well: the law is not the curse and not the cast-off — it is the very tree under which the saved are sheltered, and it is *written on the heart.* It ain''t new. This is the new covenant exactly as the prophet named it: *I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people* (Jeremiah 31:33); the Spirit that does the writing is the Spirit who keeps Torah alive in the believer: *And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them* (Ezekiel 36:27); the word was never far off but always meant for the heart: *But the word is very nigh unto thee, in thy mouth, and in thy heart, that thou mayest do it* (Deuteronomy 30:14); and the law going forth to all the earth is the prophet''s own promise: *for a law shall proceed from me, and I will make my judgment to rest for a light of the people* (Isaiah 51:4).',
       sv.verse_id, ev.verse_id, 'extras', 72053
  FROM _session253_herm23_lookup sv, _session253_herm23_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=3
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=23 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-23-repentance-brings-life',
       E'Repentance bringeth life — the abundant compassion of Yahuah',
       E'The Shepherd plants the withered rods and waters them, and many revive; then he names what Hermas is seeing: *that thou mayest see the abundant compassion of Yahuah (Lord), how great and glorious it is... Thou seest then that repentance from sins bringeth life, but not to repent bringeth death.* (Hermas 23:6) The door of the second repentance stands open while the tower yet builds. It ain''t new — this is the very heart of Yahuah the prophet revealed: *As I live, saith Adonai Yahuah (the Lord GOD), I have no pleasure in the death of the wicked; but that the wicked turn from his way and live* (Ezekiel 33:11); the Master''s longsuffering aims at nothing else: *not willing that any should perish, but that all should come to repentance* (2 Peter 3:9); and heaven itself rejoices over the one rod that revives: *joy shall be in heaven over one sinner that repenteth* (Luke 15:7).',
       sv.verse_id, ev.verse_id, 'extras', 72056
  FROM _session253_herm23_lookup sv, _session253_herm23_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=6
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=23 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-23-life-for-them-that-keep-the-commandments',
       E'Life is for all that keep the commandments — death for the lawless',
       E'The Shepherd''s verdict on the rods is the framework''s own filter: *Life is for all those that keep the commandments of Yahuah (Lord). But in the commandments there is nothing about first places, or about glory of any kind, but about long-suffering and humility in man. In such men, therefore, is the life of Yahuah (Lord), but in factious and lawless men is death.* (Hermas 23:7) Keeping the commandments is the life; lawlessness is the death — there is no third road. It ain''t new — the beloved disciple measures the same: *For this is the love of Elohim (God), that we keep his commandments: and his commandments are not grievous* (1 John 5:3); the Master binds love to obedience: *If ye love me, keep my commandments* (John 14:15); and warns that the saying is not the doing: *Not every one that saith unto me, Yahuah (Lord), Yahuah (Lord), shall enter into the kingdom of heaven; but he that doeth the will of my Father which is in heaven* (Matthew 7:21).',
       sv.verse_id, ev.verse_id, 'extras', 72059
  FROM _session253_herm23_lookup sv, _session253_herm23_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=7
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=23 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-23-go-tell-all-to-repent-and-be-healed',
       E'Go, tell all men to repent — healing for their former sins',
       E'The angel of repentance commissions Hermas: *Go, and tell all men to repent, and they shall live unto Elohim (God); for Yahuah (Lord) in His compassion sent me to give repentance to all... but being long-suffering Yahuah (Lord) willeth them that were called through His Son to be saved.* And the promise to the turning: *As many as shall repent from their whole heart and shall cleanse themselves from all the evil deeds afore-mentioned, and shall add nothing further to their sins, shall receive healing from Yahuah (Lord) for their former sins... and they shall live unto Elohim (God).* (Hermas 23:11) It ain''t new — the prophet set the same terms: *But if the wicked will turn from all his sins that he hath committed, and keep all my statutes, and do that which is lawful and right, he shall surely live, he shall not die* (Ezekiel 18:21); and the commission to turn the erring back is the apostle''s own: *he which converteth the sinner from the error of his way shall save a soul from death, and shall hide a multitude of sins* (James 5:20).',
       sv.verse_id, ev.verse_id, 'extras', 72062
  FROM _session253_herm23_lookup sv, _session253_herm23_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=11
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=23 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-23-the-rock-and-gate-the-name-of-the-son',
       E'The rock and the gate are the Son — none enter but by His Name',
       E'The Shepherd interprets the building: *This rock and gate is the Son of Elohim (God)... The Son of Elohim (God) is older than all His creation, so that He became the Father’s adviser in His creation. Therefore also He is ancient. But the gate... He was made manifest in the last days of the consummation; therefore the gate was made recent, that they which are to be saved may enter through it into the kingdom of Elohim (God)... no one shall enter into the kingdom of Elohim (God), except he receive the name of His Son.* (Hermas 23:12) The ancient Rock made a recent gate is the Formed Son — older than creation, manifest in the flesh in the last days. It ain''t new — the Master named Himself the one door: *I am the door: by me if any man enter in, he shall be saved* (John 10:9); and the one way: *I am the way, the truth, and the life: no man cometh unto the Father, but by me* (John 14:6); the Name is the only Name of salvation: *there is none other name under heaven given among men, whereby we must be saved* (Acts 4:12); and before that Name every knee bows: *That at the name of Yahusha (Jesus) every knee should bow, of things in heaven, and things in earth* (Philippians 2:10).',
       sv.verse_id, ev.verse_id, 'extras', 72065
  FROM _session253_herm23_lookup sv, _session253_herm23_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=12
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=23 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-23-tower-is-the-church-living-stones',
       E'The tower is the Church — living stones raised through the water',
       E'The Shepherd names the building plainly: *The tower, why, this is the Church.* (Hermas 23:13) And he tells why the stones must rise through the deep: *It was necessary for them to rise up through water, that they might be made alive; for otherwise they could not enter into the kingdom of Elohim (God)... For before a man has borne the name of Elohim (God), he is dead; but when he has received the seal, he layeth aside his deadness, and resumeth life. The seal then is the water: so they go down into the water dead, and they come up alive.* (Hermas 23:16) It ain''t new. Kepha named the same house: *Ye also, as lively stones, are built up a spiritual house, an holy priesthood* (1 Peter 2:5); Sha''ul laid its one foundation: *And are built upon the foundation of the apostles and prophets, Yahusha HaMashiach (Jesus Christ) himself being the chief corner stone* (Ephesians 2:20), the building *in whom ye also are builded together for an habitation of Elohim (God) through the Spirit* (Ephesians 2:22); and the Master named the water-birth as the door of life: *Except a man be born of water and of the Spirit, he cannot enter into the kingdom of Elohim (God)* (John 3:5).',
       sv.verse_id, ev.verse_id, 'extras', 72068
  FROM _session253_herm23_lookup sv, _session253_herm23_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=13
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=23 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-23-twelve-mountains-twelve-tribes-nations',
       E'The twelve mountains are the twelve tribes — gathered into one body',
       E'The Shepherd unfolds the mountains: *These twelve mountains are twelve tribes that inhabit the whole world. To these tribes then the Son of Elohim (God) was preached by the Apostles... all the nations that dwell under heaven, when they heard and believed, were called by the one name of Elohim (God). So having received the seal, they had one understanding and one mind, and one faith became theirs and one love... therefore the building of the tower became of one colour, even bright as the sun.* (Hermas 23:17) Twelve tribes scattered through the whole world, preached to by the apostles, gathered into one shining house — it ain''t new. This is the prophet''s promise of the gathering of all twelve: *Behold, I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land* (Ezekiel 37:21), made *one nation* and *no more two* (Ezekiel 37:22); the apostles were sent to the tribes among all nations: *Go ye therefore, and teach all nations* (Matthew 28:19); and the servant''s light reaches the scattered: *to raise up the tribes of Jacob, and to restore the preserved of Yashar''el (Israel)... a light to the Gentiles* (Isaiah 49:6).',
       sv.verse_id, ev.verse_id, 'extras', 72071
  FROM _session253_herm23_lookup sv, _session253_herm23_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=17
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=23 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-23-your-seed-shall-never-be-blotted-out',
       E'Your seed shall never be blotted out — the guileless dwell with the Son',
       E'Of the green-and-thriving mountain the angel of repentance pronounces a blessing on the simple and guileless: *remain to the end such as ye are, and your seed shall never be blotted out. For Yahuah (Lord) hath put you to the proof, and enrolled you among our number, and your whole seed shall dwell with the Son of Elohim (God); for of His Spirit did ye receive.* (Hermas 23:24) The seed kept, never blotted out, dwelling with the Son — it ain''t new. This is the prophet''s promise over the blessed seed: *They shall not labour in vain, nor bring forth for trouble; for they are the seed of the blessed of Yahuah (LORD), and their offspring with them* (Isaiah 65:23); and the psalmist''s word on the preserving of the righteous and their offspring: *For Yahuah (LORD) loveth judgment, and forsaketh not his saints; they are preserved for ever* (Psalm 37:28). The enduring to the end is the Master''s own: *he that endureth to the end shall be saved* (Matthew 10:22).',
       sv.verse_id, ev.verse_id, 'extras', 72074
  FROM _session253_herm23_lookup sv, _session253_herm23_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=24
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=23 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-23-become-as-babes-the-white-mountain',
       E'As babes without guile — chiefest in the kingdom of Elohim',
       E'From the white mountain come the guileless: *they are as very babes, into whose heart no guile entereth... Such as these then dwell without doubt in the kingdom of Elohim (God), because they defiled the commandments of Elohim (God) in nothing... for all infants are glorious in the sight of Elohim (God), and stand first in His sight. Blessed then are ye, as many as have put away wickedness from you, and have clothed yourselves in guilelessness: ye shall live unto Elohim (God) chiefest of all.* (Hermas 23:29) Note well — the babes are blessed not for keeping nothing but for *defiling the commandments in nothing.* It ain''t new. The Master set the same door: *Except ye be converted, and become as little children, ye shall not enter into the kingdom of heaven* (Matthew 18:3); *Suffer little children, and forbid them not, to come unto me: for of such is the kingdom of heaven* (Matthew 19:14); and the pure-hearted are the ones who see Elohim: *Blessed are the pure in heart: for they shall see Elohim (God)* (Matthew 5:8).',
       sv.verse_id, ev.verse_id, 'extras', 72077
  FROM _session253_herm23_lookup sv, _session253_herm23_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=29
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=23 AND ev.verse_number=29
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-23-restore-the-spirit-whole',
       E'Restore the spirit whole — Yahuah dwelleth in men that love peace',
       E'The closing charge turns on the spirit given and the spirit returned: *Yahuah (Lord) dwelleth in men that love peace; for to Him peace is dear; but from the contentious and them that are given up to wickedness He keepeth afar off. Restore therefore to Him your spirit whole as ye received it.* And the parable of the fuller: as a man gives a whole garment and demands it back whole, *what thinkest thou Yahuah (Lord) will do to thee, He, Who gave thee the spirit whole, and thou hast made it absolutely useless...?* (Hermas 23:32) It ain''t new. Sha''ul prays for the very keeping-whole the Shepherd commands: *the very Elohim (God) of peace sanctify you wholly; and I pray Elohim (God) your whole spirit and soul and body be preserved blameless* (1 Thessalonians 5:23); he warns against marring the sealed spirit: *And grieve not the holy Spirit of Elohim (God), whereby ye are sealed unto the day of redemption* (Ephesians 4:30); and the psalmist''s cry is the only repair for a torn spirit: *Create in me a clean heart, O Elohim (God); and renew a right spirit within me* (Psalm 51:10).',
       sv.verse_id, ev.verse_id, 'extras', 72080
  FROM _session253_herm23_lookup sv, _session253_herm23_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=32
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=23 AND ev.verse_number=32
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: hermas-23-willow-all-called-by-the-name
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 2:10 — *Fear none of those things which thou shalt suffer: behold, the devil shall cast some of you into prison, that ye may be tried; and ye shall have tribulation ten days: be thou faithful unto death, and I will give thee a crown of life.* The palm-crowns the angel sets on those who suffered for the law are the Master''s own crown of life for the faithful unto death.'
  FROM cross_reference_threads t, cross_references x, _session253_herm23_lookup sv, _session253_herm23_lookup tv
 WHERE t.slug='hermas-23-willow-all-called-by-the-name'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=2 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 7:9 — *After this I beheld, and, lo, a great multitude, which no man could number, of all nations, and kindreds, and people, and tongues, stood before the throne, and before the Lamb, clothed with white robes, and palms in their hands;* the crowned of palm-branches sent into the tower in raiment white as snow are the white-robed, palm-bearing throng before the throne.'
  FROM cross_reference_threads t, cross_references x, _session253_herm23_lookup sv, _session253_herm23_lookup tv
 WHERE t.slug='hermas-23-willow-all-called-by-the-name'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 10:22 — *And ye shall be hated of all men for my name’s sake: but he that endureth to the end shall be saved.* They that suffered for the law and were crowned are the Master''s enduring ones, saved by holding fast for the Name''s sake.'
  FROM cross_reference_threads t, cross_references x, _session253_herm23_lookup sv, _session253_herm23_lookup tv
 WHERE t.slug='hermas-23-willow-all-called-by-the-name'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=10 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-23-the-tree-is-the-law-written-on-hearts
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 31:33 — *But this shall be the covenant that I will make with the house of Yashar''el (Israel); After those days, saith Yahuah (LORD), I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people.* Michael putting the law into the hearts of the believers is the new covenant the prophet named — the law internalized, never abolished.'
  FROM cross_reference_threads t, cross_references x, _session253_herm23_lookup sv, _session253_herm23_lookup tv
 WHERE t.slug='hermas-23-the-tree-is-the-law-written-on-hearts'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 36:27 — *And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them.* The law set into the heart by the glorious angel is the Spirit-wrought obedience the prophet promised; the Spirit and the Torah are not rivals but one work.'
  FROM cross_reference_threads t, cross_references x, _session253_herm23_lookup sv, _session253_herm23_lookup tv
 WHERE t.slug='hermas-23-the-tree-is-the-law-written-on-hearts'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 30:14 — *But the word is very nigh unto thee, in thy mouth, and in thy heart, that thou mayest do it.* The rods that are the law, placed into the hearts of the believers, are Moses'' own word — never far off, always meant for the heart and the doing.'
  FROM cross_reference_threads t, cross_references x, _session253_herm23_lookup sv, _session253_herm23_lookup tv
 WHERE t.slug='hermas-23-the-tree-is-the-law-written-on-hearts'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 51:4 — *Hearken unto me, my people; and give ear unto me, O my nation: for a law shall proceed from me, and I will make my judgment to rest for a light of the people.* The tree-law given to the whole world and preached to the ends of the earth is the prophet''s law proceeding from Yahuah as a light to the peoples.'
  FROM cross_reference_threads t, cross_references x, _session253_herm23_lookup sv, _session253_herm23_lookup tv
 WHERE t.slug='hermas-23-the-tree-is-the-law-written-on-hearts'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=51 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-23-repentance-brings-life
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 33:11 — *Say unto them, As I live, saith Adonai Yahuah (the Lord GOD), I have no pleasure in the death of the wicked; but that the wicked turn from his way and live: turn ye, turn ye from your evil ways; for why will ye die, O house of Yashar''el (Israel)?* The abundant compassion that revives the withered rods is the prophet''s own Yahuah, who desires the wicked to turn and live, not perish.'
  FROM cross_reference_threads t, cross_references x, _session253_herm23_lookup sv, _session253_herm23_lookup tv
 WHERE t.slug='hermas-23-repentance-brings-life'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=33 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Peter 3:9 — *Yahuah (Lord) is not slack concerning his promise, as some men count slackness; but is longsuffering to us-ward, not willing that any should perish, but that all should come to repentance.* That repentance bringeth life and the time still stands open is the Master''s longsuffering, unwilling that any should perish.'
  FROM cross_reference_threads t, cross_references x, _session253_herm23_lookup sv, _session253_herm23_lookup tv
 WHERE t.slug='hermas-23-repentance-brings-life'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=3 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Luke 15:7 — *I say unto you, that likewise joy shall be in heaven over one sinner that repenteth, more than over ninety and nine just persons, which need no repentance.* The shepherd''s gladness over every withered rod that revives is heaven''s own joy over the one sinner who turns.'
  FROM cross_reference_threads t, cross_references x, _session253_herm23_lookup sv, _session253_herm23_lookup tv
 WHERE t.slug='hermas-23-repentance-brings-life'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=15 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-23-life-for-them-that-keep-the-commandments
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 John 5:3 — *For this is the love of Elohim (God), that we keep his commandments: and his commandments are not grievous.* The Shepherd''s ''life is for all those that keep the commandments'' is the apostle''s own measure of love — the commandments stand, and they are not grievous.'
  FROM cross_reference_threads t, cross_references x, _session253_herm23_lookup sv, _session253_herm23_lookup tv
 WHERE t.slug='hermas-23-life-for-them-that-keep-the-commandments'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=5 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 14:15 — *If ye love me, keep my commandments.* The life of Yahuah dwelling in them that keep the commandments rests on the Master''s own binding of love to obedience.'
  FROM cross_reference_threads t, cross_references x, _session253_herm23_lookup sv, _session253_herm23_lookup tv
 WHERE t.slug='hermas-23-life-for-them-that-keep-the-commandments'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=14 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 7:21 — *Not every one that saith unto me, Yahuah (Lord), Yahuah (Lord), shall enter into the kingdom of heaven; but he that doeth the will of my Father which is in heaven.* The factious and lawless who say but do not keep are the Master''s own who cry Lord, Lord yet do not do the Father''s will — saying is not the doing.'
  FROM cross_reference_threads t, cross_references x, _session253_herm23_lookup sv, _session253_herm23_lookup tv
 WHERE t.slug='hermas-23-life-for-them-that-keep-the-commandments'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-23-go-tell-all-to-repent-and-be-healed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 18:21 — *But if the wicked will turn from all his sins that he hath committed, and keep all my statutes, and do that which is lawful and right, he shall surely live, he shall not die.* Healing for former sins to the one who repents whole-heartedly and adds no more is the prophet''s own promise — turn, keep the statutes, and surely live.'
  FROM cross_reference_threads t, cross_references x, _session253_herm23_lookup sv, _session253_herm23_lookup tv
 WHERE t.slug='hermas-23-go-tell-all-to-repent-and-be-healed'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=18 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'James 5:20 — *Let him know, that he which converteth the sinner from the error of his way shall save a soul from death, and shall hide a multitude of sins.* The charge to go tell all men to repent that they may live is the apostle''s own work of turning the erring back and saving a soul from death.'
  FROM cross_reference_threads t, cross_references x, _session253_herm23_lookup sv, _session253_herm23_lookup tv
 WHERE t.slug='hermas-23-go-tell-all-to-repent-and-be-healed'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=5 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Peter 3:9 — *Yahuah (Lord) is not slack concerning his promise, as some men count slackness; but is longsuffering to us-ward, not willing that any should perish, but that all should come to repentance.* That the long-suffering Yahuah willeth them called through His Son to be saved is Kepha''s longsuffering that wills all to come to repentance.'
  FROM cross_reference_threads t, cross_references x, _session253_herm23_lookup sv, _session253_herm23_lookup tv
 WHERE t.slug='hermas-23-go-tell-all-to-repent-and-be-healed'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=3 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-23-the-rock-and-gate-the-name-of-the-son
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 10:9 — *I am the door: by me if any man enter in, he shall be saved, and shall go in and out, and find pasture.* The one gate of the rock through which alone the saved enter the kingdom is the Master''s own word that He is the door — by Him alone any man is saved.'
  FROM cross_reference_threads t, cross_references x, _session253_herm23_lookup sv, _session253_herm23_lookup tv
 WHERE t.slug='hermas-23-the-rock-and-gate-the-name-of-the-son'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=10 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 14:6 — *Yahusha (Jesus) saith unto him, I am the way, the truth, and the life: no man cometh unto the Father, but by me.* That no one enters the kingdom of Elohim except through the Son who is the gate is the Master''s own claim to be the sole way to the Father.'
  FROM cross_reference_threads t, cross_references x, _session253_herm23_lookup sv, _session253_herm23_lookup tv
 WHERE t.slug='hermas-23-the-rock-and-gate-the-name-of-the-son'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=14 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 4:12 — *Neither is there salvation in any other: for there is none other name under heaven given among men, whereby we must be saved.* That none shall enter the kingdom except he receive the name of His Son is Kepha''s proclamation that there is no other saving Name under heaven.'
  FROM cross_reference_threads t, cross_references x, _session253_herm23_lookup sv, _session253_herm23_lookup tv
 WHERE t.slug='hermas-23-the-rock-and-gate-the-name-of-the-son'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=4 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Philippians 2:10 — *That at the name of Yahusha (Jesus) every knee should bow, of things in heaven, and things in earth, and things under the earth;* the Name of the Son which alone admits to the kingdom is the exalted Name before which Sha''ul says every knee shall bow.'
  FROM cross_reference_threads t, cross_references x, _session253_herm23_lookup sv, _session253_herm23_lookup tv
 WHERE t.slug='hermas-23-the-rock-and-gate-the-name-of-the-son'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-23-tower-is-the-church-living-stones
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Peter 2:5 — *Ye also, as lively stones, are built up a spiritual house, an holy priesthood, to offer up spiritual sacrifices, acceptable to Elohim (God) by Yahusha HaMashiach (Jesus Christ).* The tower the Shepherd names the Church is Kepha''s spiritual house built up of living stones.'
  FROM cross_reference_threads t, cross_references x, _session253_herm23_lookup sv, _session253_herm23_lookup tv
 WHERE t.slug='hermas-23-tower-is-the-church-living-stones'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=2 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ephesians 2:20 — *And are built upon the foundation of the apostles and prophets, Yahusha HaMashiach (Jesus Christ) himself being the chief corner stone;* the tower-Church built upon the rock that is the Son is Sha''ul''s building founded on the apostles and prophets with Messiah the corner stone.'
  FROM cross_reference_threads t, cross_references x, _session253_herm23_lookup sv, _session253_herm23_lookup tv
 WHERE t.slug='hermas-23-tower-is-the-church-living-stones'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=2 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ephesians 2:22 — *In whom ye also are builded together for an habitation of Elohim (God) through the Spirit.* The stones made one with the rock, one spirit and one body, are Sha''ul''s same household builded together for a habitation of Elohim through the Spirit.'
  FROM cross_reference_threads t, cross_references x, _session253_herm23_lookup sv, _session253_herm23_lookup tv
 WHERE t.slug='hermas-23-tower-is-the-church-living-stones'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=2 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'John 3:5 — *Yahusha (Jesus) answered, Verily, verily, I say unto thee, Except a man be born of water and of the Spirit, he cannot enter into the kingdom of Elohim (God).* The stones that must rise through water to be made alive, who go down dead and come up alive, are the Master''s own birth of water and Spirit, without which none enters the kingdom.'
  FROM cross_reference_threads t, cross_references x, _session253_herm23_lookup sv, _session253_herm23_lookup tv
 WHERE t.slug='hermas-23-tower-is-the-church-living-stones'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=3 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-23-twelve-mountains-twelve-tribes-nations
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 37:21 — *And say unto them, Thus saith Adonai Yahuah (the Lord GOD); Behold, I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land:* the twelve mountains that are twelve tribes inhabiting the whole world, called into one house, are the prophet''s children of Yashar''el gathered from among the nations.'
  FROM cross_reference_threads t, cross_references x, _session253_herm23_lookup sv, _session253_herm23_lookup tv
 WHERE t.slug='hermas-23-twelve-mountains-twelve-tribes-nations'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 37:22 — *And I will make them one nation in the land upon the mountains of Yashar''el (Israel); and one king shall be king to them all: and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all:* the tribes that became one body, one mind, one faith, bright as the sun, are the prophet''s twelve made one nation under one king, no more divided.'
  FROM cross_reference_threads t, cross_references x, _session253_herm23_lookup sv, _session253_herm23_lookup tv
 WHERE t.slug='hermas-23-twelve-mountains-twelve-tribes-nations'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 28:19 — *Go ye therefore, and teach all nations, baptizing them in the name of the Father, and of the Son, and of the Ruach HaKodesh (Holy Spirit):* the Son of Elohim preached by the Apostles to the twelve tribes scattered through all nations is the Master''s own sending to teach all nations and seal them in the Name.'
  FROM cross_reference_threads t, cross_references x, _session253_herm23_lookup sv, _session253_herm23_lookup tv
 WHERE t.slug='hermas-23-twelve-mountains-twelve-tribes-nations'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=28 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 49:6 — *And he said, It is a light thing that thou shouldest be my servant to raise up the tribes of Jacob, and to restore the preserved of Yashar''el (Israel): I will also give thee for a light to the Gentiles, that thou mayest be my salvation unto the end of the earth.* The preaching that reaches the twelve tribes in all the world is the servant''s commission to raise up the tribes of Jacob and be salvation to the ends of the earth.'
  FROM cross_reference_threads t, cross_references x, _session253_herm23_lookup sv, _session253_herm23_lookup tv
 WHERE t.slug='hermas-23-twelve-mountains-twelve-tribes-nations'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=49 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-23-your-seed-shall-never-be-blotted-out
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 65:23 — *They shall not labour in vain, nor bring forth for trouble; for they are the seed of the blessed of Yahuah (LORD), and their offspring with them.* The promise that your seed shall never be blotted out and your whole seed shall dwell with the Son is the prophet''s word over the blessed seed of Yahuah and their offspring with them.'
  FROM cross_reference_threads t, cross_references x, _session253_herm23_lookup sv, _session253_herm23_lookup tv
 WHERE t.slug='hermas-23-your-seed-shall-never-be-blotted-out'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=65 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 37:28 — *For Yahuah (LORD) loveth judgment, and forsaketh not his saints; they are preserved for ever: but the seed of the wicked shall be cut off.* The simple and guileless whose seed is never blotted out are the psalmist''s saints, preserved for ever and not forsaken.'
  FROM cross_reference_threads t, cross_references x, _session253_herm23_lookup sv, _session253_herm23_lookup tv
 WHERE t.slug='hermas-23-your-seed-shall-never-be-blotted-out'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=37 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 10:22 — *And ye shall be hated of all men for my name’s sake: but he that endureth to the end shall be saved.* The charge to remain to the end such as ye are, enrolled among the proven, is the Master''s own promise that he who endures to the end is saved.'
  FROM cross_reference_threads t, cross_references x, _session253_herm23_lookup sv, _session253_herm23_lookup tv
 WHERE t.slug='hermas-23-your-seed-shall-never-be-blotted-out'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=10 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-23-become-as-babes-the-white-mountain
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 18:3 — *And said, Verily I say unto you, Except ye be converted, and become as little children, ye shall not enter into the kingdom of heaven.* The babes without guile who dwell without doubt in the kingdom are the Master''s own little children, without whom-likeness none enters the kingdom.'
  FROM cross_reference_threads t, cross_references x, _session253_herm23_lookup sv, _session253_herm23_lookup tv
 WHERE t.slug='hermas-23-become-as-babes-the-white-mountain'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=18 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 19:14 — *But Yahusha (Jesus) said, Suffer little children, and forbid them not, to come unto me: for of such is the kingdom of heaven.* The infants who stand first in the sight of Elohim are the Master''s own little children, of whom is the kingdom of heaven.'
  FROM cross_reference_threads t, cross_references x, _session253_herm23_lookup sv, _session253_herm23_lookup tv
 WHERE t.slug='hermas-23-become-as-babes-the-white-mountain'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=19 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 5:8 — *Blessed are the pure in heart: for they shall see Elohim (God).* They into whose heart no guile entereth, who defiled the commandments in nothing, are the Master''s pure in heart who shall see Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_herm23_lookup sv, _session253_herm23_lookup tv
 WHERE t.slug='hermas-23-become-as-babes-the-white-mountain'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-23-restore-the-spirit-whole
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Thessalonians 5:23 — *And the very Elohim (God) of peace sanctify you wholly; and I pray Elohim (God) your whole spirit and soul and body be preserved blameless unto the coming of our Lord Yahusha HaMashiach (Lord Jesus Christ).* The charge to restore the spirit whole as it was received is Sha''ul''s own prayer that the whole spirit and soul and body be preserved blameless.'
  FROM cross_reference_threads t, cross_references x, _session253_herm23_lookup sv, _session253_herm23_lookup tv
 WHERE t.slug='hermas-23-restore-the-spirit-whole'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='1-thessalonians' AND tv.chapter_number=5 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ephesians 4:30 — *And grieve not the holy Spirit of Elohim (God), whereby ye are sealed unto the day of redemption.* The warning against giving back the spirit torn, as a fuller rends a whole garment, is Sha''ul''s caution not to grieve the sealing Spirit.'
  FROM cross_reference_threads t, cross_references x, _session253_herm23_lookup sv, _session253_herm23_lookup tv
 WHERE t.slug='hermas-23-restore-the-spirit-whole'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=4 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 51:10 — *Create in me a clean heart, O Elohim (God); and renew a right spirit within me.* The only mending for a spirit made useless is the psalmist''s cry that Elohim create a clean heart and renew a right spirit within.'
  FROM cross_reference_threads t, cross_references x, _session253_herm23_lookup sv, _session253_herm23_lookup tv
 WHERE t.slug='hermas-23-restore-the-spirit-whole'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=51 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_hermas_24.sql (session253 hermas 24) -----
-- Source anchor: lightfoot-apostolic-fathers/hermas ch24. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: herm24 (view _session253_herm24_lookup). Sort band base 72075, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_herm24_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: hermas-24-declare-the-mighty-works
  ('lightfoot-apostolic-fathers', 'hermas', 24, 2, 'canon', 'psalms', 145, 4, 'free', E'Psalm 145:4 — *One generation shall praise thy works to another, and shall declare thy mighty acts.* The angel''s charge to Hermas to declare to every man the mighty works of Yahuah is the Psalter''s own generational handing-down of His mighty acts — it ain''t new.'),
  ('lightfoot-apostolic-fathers', 'hermas', 24, 4, 'canon', 'psalms', 145, 6, 'free', E'Psalm 145:6 — *And men shall speak of the might of thy terrible acts: and I will declare thy greatness.* Hermas''s parting commission to declare the mighty works of Yahuah to every man echoes David''s resolve that men shall speak of His might and His greatness be declared.'),
  -- thread: hermas-24-quit-you-like-a-man
  ('lightfoot-apostolic-fathers', 'hermas', 24, 4, 'canon', '1-corinthians', 16, 13, 'free', E'1 Corinthians 16:13 — *Watch ye, stand fast in the faith, quit you like men, be strong.* The angel''s ''Quit you like a man in this ministry'' is Sha''ul''s own closing charge to the Corinthians, the same call to stand fast and play the man in the faith.'),
  -- thread: hermas-24-walk-in-these-commandments-and-live
  ('lightfoot-apostolic-fathers', 'hermas', 24, 4, 'canon', 'deuteronomy', 30, 19, 'free', E'Deuteronomy 30:19 — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live:* Hermas''s closing verdict that whoso walks in the commandments shall live and whoso neglects them shall not is Moses'' own setting of life against death — choose life.'),
  ('lightfoot-apostolic-fathers', 'hermas', 24, 4, 'canon', 'deuteronomy', 30, 20, 'free', E'Deuteronomy 30:20 — *That thou mayest love Yahuah Elohayka (the LORD thy God), and that thou mayest obey his voice, and that thou mayest cleave unto him: for he is thy life, and the length of thy days: that thou mayest dwell in the land which Yahuah (LORD) sware unto thy fathers, to Abraham, to Isaac, and to Jacob, to give them.* The life Hermas is promised for walking in the commandments is Moses'' covenant life — obey His voice, cleave unto Him, for He is thy life and the length of thy days.'),
  ('lightfoot-apostolic-fathers', 'hermas', 24, 4, 'canon', 'revelation', 22, 14, 'free', E'Revelation 22:14 — *Blessed are they that do his commandments, that they may have right to the tree of life, and may enter in through the gates into the city.* The angel''s word that whoso walks in the commandments shall live is sealed at the canon''s end with the same blessing — the doers of the commandments have right to the tree of life and entrance into the city.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_herm24_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_herm24_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-24-declare-the-mighty-works',
       E'Declare to every man the mighty works of Yahuah',
       E'At the close of the whole book the angel sends Hermas out as a herald: *‘I too, Sir,’ I say, ‘declare to every man the mighty works of Yahuah (Lord); for I hope that all who have sinned in the past, if they hear these things, will gladly repent and recover life.’* (Hermas 24:2) And again as the parting charge: *declare to every man the mighty works of Yahuah (Lord), and thou shalt have favour in this ministry.* (Hermas 24:4) It ain''t new — this is the song David set in the mouth of the gathered: *One generation shall praise thy works to another, and shall declare thy mighty acts* (Psalm 145:4), and *men shall speak of the might of thy terrible acts: and I will declare thy greatness* (Psalm 145:6). The very commission the angel lays on Hermas is the old generational charge of the Psalter — that the mighty acts of Yahuah be told out from one age to the next so the sinner may hear, repent, and recover life.',
       sv.verse_id, ev.verse_id, 'extras', 72075
  FROM _session253_herm24_lookup sv, _session253_herm24_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=24 AND sv.verse_number=2
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=24 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-24-quit-you-like-a-man',
       E'Quit you like a man in this ministry',
       E'The angel''s last word steels Hermas for the work: *He said then to me, ‘Quit you like a man in this ministry; declare to every man the mighty works of Yahuah (Lord), and thou shalt have favour in this ministry.’* (Hermas 24:4) It ain''t new — Sha''ul closes his letter to the Corinthians with the very same charge, word for word in substance: *Watch ye, stand fast in the faith, quit you like men, be strong* (1 Corinthians 16:13). The summons to play the man, to stand firm and not faint in the ministry committed to him, is the apostle''s own benediction laid over the same calling — endurance unto the end, favour with Yahuah for the faithful servant.',
       sv.verse_id, ev.verse_id, 'extras', 72078
  FROM _session253_herm24_lookup sv, _session253_herm24_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=24 AND sv.verse_number=4
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=24 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-24-walk-in-these-commandments-and-live',
       E'Whosoever shall walk in these commandments shall live',
       E'The whole book lands on one hinge — life set against death, turning on the keeping of the commandments: *walk in his commandments, which I have given thee, and thou shalt be able to get the mastery over all wickedness* (Hermas 24:1), and the closing verdict, *Whosoever therefore shall walk in these commandments, shall live and be happy in his life; but whosoever shall neglect them, shall not live, and shall be unhappy in his life* (Hermas 24:4). It ain''t new. This is Moses'' own life-set-before-you: *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live* (Deuteronomy 30:19), the choosing *that thou mayest love Yahuah Elohayka (the LORD thy God), and that thou mayest obey his voice, and that thou mayest cleave unto him: for he is thy life, and the length of thy days* (Deuteronomy 30:20). And the same blessing crowns the whole counsel at its end: *Blessed are they that do his commandments, that they may have right to the tree of life, and may enter in through the gates into the city* (Revelation 22:14). The commandments stand from Sinai to the New Jerusalem; the angel''s last word to Hermas is the prophets'' first word — choose life, walk in them, and live.',
       sv.verse_id, ev.verse_id, 'extras', 72081
  FROM _session253_herm24_lookup sv, _session253_herm24_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=24 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=24 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: hermas-24-declare-the-mighty-works
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 145:4 — *One generation shall praise thy works to another, and shall declare thy mighty acts.* The angel''s charge to Hermas to declare to every man the mighty works of Yahuah is the Psalter''s own generational handing-down of His mighty acts — it ain''t new.'
  FROM cross_reference_threads t, cross_references x, _session253_herm24_lookup sv, _session253_herm24_lookup tv
 WHERE t.slug='hermas-24-declare-the-mighty-works'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=24 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=145 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 145:6 — *And men shall speak of the might of thy terrible acts: and I will declare thy greatness.* Hermas''s parting commission to declare the mighty works of Yahuah to every man echoes David''s resolve that men shall speak of His might and His greatness be declared.'
  FROM cross_reference_threads t, cross_references x, _session253_herm24_lookup sv, _session253_herm24_lookup tv
 WHERE t.slug='hermas-24-declare-the-mighty-works'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=24 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=145 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-24-quit-you-like-a-man
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Corinthians 16:13 — *Watch ye, stand fast in the faith, quit you like men, be strong.* The angel''s ''Quit you like a man in this ministry'' is Sha''ul''s own closing charge to the Corinthians, the same call to stand fast and play the man in the faith.'
  FROM cross_reference_threads t, cross_references x, _session253_herm24_lookup sv, _session253_herm24_lookup tv
 WHERE t.slug='hermas-24-quit-you-like-a-man'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=24 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=16 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-24-walk-in-these-commandments-and-live
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 30:19 — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live:* Hermas''s closing verdict that whoso walks in the commandments shall live and whoso neglects them shall not is Moses'' own setting of life against death — choose life.'
  FROM cross_reference_threads t, cross_references x, _session253_herm24_lookup sv, _session253_herm24_lookup tv
 WHERE t.slug='hermas-24-walk-in-these-commandments-and-live'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=24 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 30:20 — *That thou mayest love Yahuah Elohayka (the LORD thy God), and that thou mayest obey his voice, and that thou mayest cleave unto him: for he is thy life, and the length of thy days: that thou mayest dwell in the land which Yahuah (LORD) sware unto thy fathers, to Abraham, to Isaac, and to Jacob, to give them.* The life Hermas is promised for walking in the commandments is Moses'' covenant life — obey His voice, cleave unto Him, for He is thy life and the length of thy days.'
  FROM cross_reference_threads t, cross_references x, _session253_herm24_lookup sv, _session253_herm24_lookup tv
 WHERE t.slug='hermas-24-walk-in-these-commandments-and-live'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=24 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 22:14 — *Blessed are they that do his commandments, that they may have right to the tree of life, and may enter in through the gates into the city.* The angel''s word that whoso walks in the commandments shall live is sealed at the canon''s end with the same blessing — the doers of the commandments have right to the tree of life and entrance into the city.'
  FROM cross_reference_threads t, cross_references x, _session253_herm24_lookup sv, _session253_herm24_lookup tv
 WHERE t.slug='hermas-24-walk-in-these-commandments-and-live'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=24 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session253 — Shepherd of Hermas ch1 cross-references complete.'
