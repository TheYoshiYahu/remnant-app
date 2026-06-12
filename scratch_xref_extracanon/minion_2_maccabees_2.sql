-- ----- fragment: minion_2maccabees_02.sql (session253 2-maccabees 2) -----
-- Source anchor: apocrypha/2-maccabees ch2. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2mac2 (view _session253_2mac2_lookup). Sort band base 62025, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2mac2_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-maccabees-2-hidden-ark
  ('apocrypha', '2-maccabees', 2, 5, 'canon', 'revelation', 11, 19, 'free', E'Revelation 11:19 — *And the temple of Elohim (God) was opened in heaven, and there was seen in his temple the ark of his testament: and there were lightnings, and voices, and thunderings, and an earthquake, and great hail.* The ark Jeremy stopped in the cave is the very ark John sees revealed when the heavenly temple is opened at the end.'),
  ('apocrypha', '2-maccabees', 2, 4, 'canon', 'jeremiah', 3, 16, 'free', E'Jeremiah 3:16 — *And it shall come to pass, when ye be multiplied and increased in the land, in those days, saith Yahuah (LORD), they shall say no more, The ark of the covenant of Yahuah (LORD): neither shall it come to mind: neither shall they remember it; neither shall they visit it; neither shall that be done any more.* The same prophet who hid the ark had already foretold that one day the people would no longer cling to the box itself.'),
  -- thread: 2-maccabees-2-unknown-till-the-gathering
  ('apocrypha', '2-maccabees', 2, 7, 'canon', 'deuteronomy', 30, 3, 'free', E'Deuteronomy 30:3 — *That then Yahuah Elohayka (the LORD thy God) will turn thy captivity, and have compassion upon thee, and will return and gather thee from all the nations, whither Yahuah Elohayka (the LORD thy God) hath scattered thee.* The unknown cave waits for the very gathering-and-mercy Moses had sworn into the law.'),
  ('apocrypha', '2-maccabees', 2, 7, 'canon', 'isaiah', 11, 12, 'free', E'Isaiah 11:12 — *And he shall set up an ensign for the nations, and shall assemble the outcasts of Yashar''el (Israel), and gather together the dispersed of Yahudah (Judah) from the four corners of the earth.* Jeremy''s regathered people are the two scattered houses Yahuah re-gathers, not a replacement people.'),
  ('apocrypha', '2-maccabees', 2, 7, 'canon', 'jeremiah', 3, 18, 'free', E'Jeremiah 3:18 — *In those days the house of Yahudah (Judah) shall walk with the house of Yashar''el (Israel), and they shall come together out of the land of the north to the land that I have given for an inheritance unto your fathers.* The prophet who hid the ark names the gathering as Judah and Israel walking home together — the time the cave is opened.'),
  -- thread: 2-maccabees-2-glory-and-the-cloud
  ('apocrypha', '2-maccabees', 2, 8, 'canon', 'exodus', 40, 34, 'free', E'Exodus 40:34 — *Then a cloud covered the tent of the congregation, and the glory of Yahuah (LORD) filled the tabernacle.* The glory and the cloud Jeremy promises will reappear are exactly what fell on the tabernacle Moses reared up.'),
  ('apocrypha', '2-maccabees', 2, 8, 'canon', '2-chronicles', 5, 14, 'free', E'2 Chronicles 5:14 — *So that the priests could not stand to minister by reason of the cloud: for the glory of Yahuah (LORD) had filled the house of Elohim (God).* The same cloud-and-glory that Solomon saw when the place was sanctified is the sign Jeremy says shall appear at the gathering.'),
  ('apocrypha', '2-maccabees', 2, 8, 'canon', '1-kings', 8, 11, 'free', E'1 Kings 8:11 — *So that the priests could not stand to minister because of the cloud: for the glory of Yahuah (LORD) had filled the house of Yahuah (LORD).* Solomon''s dedication, named in the same breath by Jeremy, is sealed by the cloud-glory pledged to return.'),
  -- thread: 2-maccabees-2-fire-from-heaven-eight-days
  ('apocrypha', '2-maccabees', 2, 10, 'canon', '2-chronicles', 7, 1, 'free', E'2 Chronicles 7:1 — *Now when Solomon had made an end of praying, the fire came down from heaven, and consumed the burnt offering and the sacrifices; and the glory of Yahuah (LORD) filled the house.* This is the very fire-from-heaven Jeremy''s record says answered Solomon''s prayer.'),
  ('apocrypha', '2-maccabees', 2, 12, 'canon', 'john', 10, 22, 'free', E'John 10:22 — *And it was at Jerusalem the feast of the dedication, and it was winter.* Solomon''s eight-day dedication becomes the Feast of Dedication the Messiah kept in Jerusalem.'),
  ('apocrypha', '2-maccabees', 2, 12, 'apocrypha', '1-maccabees', 4, 56, 'extras', E'1 Maccabees 4:56 — *And so they kept the dedication of the altar eight days and offered burnt offerings with gladness, and sacrificed the sacrifice of deliverance and praise.* The Maccabees'' own eight-day rededication answers to Solomon''s eight days that Jeremy''s writing recorded.'),
  -- thread: 2-maccabees-2-gathered-out-of-every-land
  ('apocrypha', '2-maccabees', 2, 18, 'canon', 'deuteronomy', 30, 4, 'free', E'Deuteronomy 30:4 — *If any of thine be driven out unto the outmost parts of heaven, from thence will Yahuah Elohayka (the LORD thy God) gather thee, and from thence will he fetch thee.* The letter''s prayer to be gathered out of every land under heaven is Moses'' own promise of the regathering.'),
  ('apocrypha', '2-maccabees', 2, 18, 'canon', 'hebrews', 11, 35, 'free', E'Hebrews 11:35 — *Women received their dead raised to life again: and others were tortured, not accepting deliverance; that they might obtain a better resurrection.* The deliverance the writer hopes for opens onto the better resurrection of this very book''s tortured martyrs, who would not break covenant.'),
  ('apocrypha', '2-maccabees', 2, 18, 'canon', 'daniel', 12, 2, 'free', E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The hope that carries the covenant-keepers through Antiochus'' great troubles is the awakening of the dead to everlasting life.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2mac2_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2mac2_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-2-hidden-ark',
       E'Jeremy hides the tabernacle and the ark',
       E'When the people were carried away, *the prophet, being warned of Yahuah (God), commanded the tabernacle and the ark to go with him, as he went forth into the mountain, where Moses climbed up, and saw the heritage of Yahuah (God)* (2 Maccabees 2:4); *And when Jeremy came thither, he found an hollow cave, in which he laid the tabernacle, and the ark, and the altar of incense, and so stopped the door* (2 Maccabees 2:5). The earthly ark is taken from sight — and at the trumpet of the end it is shown again, but in heaven: *And the temple of Elohim (God) was opened in heaven, and there was seen in his temple the ark of his testament: and there were lightnings, and voices, and thunderings, and an earthquake, and great hail* (Revelation 11:19). Jeremy himself had foretold that men would cease to seek the box of acacia and gold: *they shall say no more, The ark of the covenant of Yahuah (LORD): neither shall it come to mind: neither shall they remember it; neither shall they visit it; neither shall that be done any more* (Jeremiah 3:16) — for Yahuah Himself becomes the throne. It ain''t new: the hidden ark waits for the day Yahuah opens His own temple.',
       sv.verse_id, ev.verse_id, 'extras', 62025
  FROM _session253_2mac2_lookup sv, _session253_2mac2_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=2 AND sv.verse_number=4
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=2 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-2-unknown-till-the-gathering',
       E'Unknown until He gather His people again',
       E'Jeremy blamed those who tried to mark the cave: *As for that place, it shall be unknown until the time that Yahuah (God) gather his people again together, and receive them to mercy* (2 Maccabees 2:7). The hiding is keyed to the regathering — the same promise Moses sealed into the Torah: *That then Yahuah Elohayka (the LORD thy God) will turn thy captivity, and have compassion upon thee, and will return and gather thee from all the nations, whither Yahuah Elohayka (the LORD thy God) hath scattered thee* (Deuteronomy 30:3). It is the two-house ingathering, not a church replacing the seed: *And he shall set up an ensign for the nations, and shall assemble the outcasts of Yashar''el (Israel), and gather together the dispersed of Yahudah (Judah) from the four corners of the earth* (Isaiah 11:12); *In those days the house of Yahudah (Judah) shall walk with the house of Yashar''el (Israel), and they shall come together out of the land of the north to the land that I have given for an inheritance unto your fathers* (Jeremiah 3:18). The covenant people are kept, and gathered to mercy.',
       sv.verse_id, ev.verse_id, 'extras', 62028
  FROM _session253_2mac2_lookup sv, _session253_2mac2_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=2 AND sv.verse_number=7
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=2 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-2-glory-and-the-cloud',
       E'The glory and the cloud shall appear',
       E'At that gathering the hidden things are restored with the visible Presence: *Then shall Yahuah (God) shew them these things, and the glory of Yahuah (God) shall appear, and the cloud also, as it was shewed under Moses, and as when Solomon desired that the place might be honourably sanctified* (2 Maccabees 2:8). This is the very sign that fell on the wilderness tent: *Then a cloud covered the tent of the congregation, and the glory of Yahuah (LORD) filled the tabernacle* (Exodus 40:34); and again on Solomon''s house: *So that the priests could not stand to minister by reason of the cloud: for the glory of Yahuah (LORD) had filled the house of Elohim (God)* (2 Chronicles 5:14). The same cloud-and-glory that twice marked Yahuah''s dwelling is pledged to return when His people are gathered to mercy.',
       sv.verse_id, ev.verse_id, 'extras', 62031
  FROM _session253_2mac2_lookup sv, _session253_2mac2_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=2 AND sv.verse_number=8
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=2 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-2-fire-from-heaven-eight-days',
       E'The fire from heaven and Solomon''s eight days',
       E'Jeremy''s writing recalls how dedication was sealed by fire: *And as when Moses prayed to Yahuah (God), the fire came down from heaven, and consumed the sacrifices: even so prayed Solomon also, and the fire came down from heaven, and consumed the burnt offerings* (2 Maccabees 2:10), and *So Solomon kept those eight days* (2 Maccabees 2:12). Scripture records that very fire: *Now when Solomon had made an end of praying, the fire came down from heaven, and consumed the burnt offering and the sacrifices; and the glory of Yahuah (LORD) filled the house* (2 Chronicles 7:1). The eight-day dedication becomes the pattern the Maccabees keep, and the feast the Messiah Himself walked in: *And it was at Jerusalem the feast of the dedication, and it was winter* (John 10:22); *And so they kept the dedication of the altar eight days and offered burnt offerings with gladness, and sacrificed the sacrifice of deliverance and praise* (1 Maccabees 4:56). It ain''t new: the fire, the glory, the eight days — one unbroken feast of dedication.',
       sv.verse_id, ev.verse_id, 'extras', 62034
  FROM _session253_2mac2_lookup sv, _session253_2mac2_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=2 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=2 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-2-gathered-out-of-every-land',
       E'Gathered out of every land; the better resurrection',
       E'The letter prays for the same mercy and gathering: *will shortly have mercy upon us, and gather us together out of every land under heaven into the holy place: for he has delivered us out of great troubles, and has purified the place* (2 Maccabees 2:18), as they call the brethren to keep the feast: *you shall do well, if you keep the same days* (2 Maccabees 2:16). This is Moses'' oath again: *If any of thine be driven out unto the outmost parts of heaven, from thence will Yahuah Elohayka (the LORD thy God) gather thee, and from thence will he fetch thee* (Deuteronomy 30:4). And the hope that holds the Torah-faithful through Antiochus'' troubles is bodily resurrection — the very hope this book''s seven brothers confess (2 Maccabees 7), to which Hebrews points back: *Women received their dead raised to life again: and others were tortured, not accepting deliverance; that they might obtain a better resurrection* (Hebrews 11:35); *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt* (Daniel 12:2). Delivered, purified, gathered — and raised.',
       sv.verse_id, ev.verse_id, 'extras', 62037
  FROM _session253_2mac2_lookup sv, _session253_2mac2_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=2 AND sv.verse_number=16
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=2 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-maccabees-2-hidden-ark
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 11:19 — *And the temple of Elohim (God) was opened in heaven, and there was seen in his temple the ark of his testament: and there were lightnings, and voices, and thunderings, and an earthquake, and great hail.* The ark Jeremy stopped in the cave is the very ark John sees revealed when the heavenly temple is opened at the end.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac2_lookup sv, _session253_2mac2_lookup tv
 WHERE t.slug='2-maccabees-2-hidden-ark'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=2 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=11 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 3:16 — *And it shall come to pass, when ye be multiplied and increased in the land, in those days, saith Yahuah (LORD), they shall say no more, The ark of the covenant of Yahuah (LORD): neither shall it come to mind: neither shall they remember it; neither shall they visit it; neither shall that be done any more.* The same prophet who hid the ark had already foretold that one day the people would no longer cling to the box itself.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac2_lookup sv, _session253_2mac2_lookup tv
 WHERE t.slug='2-maccabees-2-hidden-ark'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=3 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-2-unknown-till-the-gathering
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 30:3 — *That then Yahuah Elohayka (the LORD thy God) will turn thy captivity, and have compassion upon thee, and will return and gather thee from all the nations, whither Yahuah Elohayka (the LORD thy God) hath scattered thee.* The unknown cave waits for the very gathering-and-mercy Moses had sworn into the law.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac2_lookup sv, _session253_2mac2_lookup tv
 WHERE t.slug='2-maccabees-2-unknown-till-the-gathering'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=2 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 11:12 — *And he shall set up an ensign for the nations, and shall assemble the outcasts of Yashar''el (Israel), and gather together the dispersed of Yahudah (Judah) from the four corners of the earth.* Jeremy''s regathered people are the two scattered houses Yahuah re-gathers, not a replacement people.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac2_lookup sv, _session253_2mac2_lookup tv
 WHERE t.slug='2-maccabees-2-unknown-till-the-gathering'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=2 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 3:18 — *In those days the house of Yahudah (Judah) shall walk with the house of Yashar''el (Israel), and they shall come together out of the land of the north to the land that I have given for an inheritance unto your fathers.* The prophet who hid the ark names the gathering as Judah and Israel walking home together — the time the cave is opened.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac2_lookup sv, _session253_2mac2_lookup tv
 WHERE t.slug='2-maccabees-2-unknown-till-the-gathering'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=2 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=3 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-2-glory-and-the-cloud
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 40:34 — *Then a cloud covered the tent of the congregation, and the glory of Yahuah (LORD) filled the tabernacle.* The glory and the cloud Jeremy promises will reappear are exactly what fell on the tabernacle Moses reared up.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac2_lookup sv, _session253_2mac2_lookup tv
 WHERE t.slug='2-maccabees-2-glory-and-the-cloud'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=2 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=40 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Chronicles 5:14 — *So that the priests could not stand to minister by reason of the cloud: for the glory of Yahuah (LORD) had filled the house of Elohim (God).* The same cloud-and-glory that Solomon saw when the place was sanctified is the sign Jeremy says shall appear at the gathering.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac2_lookup sv, _session253_2mac2_lookup tv
 WHERE t.slug='2-maccabees-2-glory-and-the-cloud'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=2 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=5 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Kings 8:11 — *So that the priests could not stand to minister because of the cloud: for the glory of Yahuah (LORD) had filled the house of Yahuah (LORD).* Solomon''s dedication, named in the same breath by Jeremy, is sealed by the cloud-glory pledged to return.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac2_lookup sv, _session253_2mac2_lookup tv
 WHERE t.slug='2-maccabees-2-glory-and-the-cloud'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=2 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=8 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-2-fire-from-heaven-eight-days
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Chronicles 7:1 — *Now when Solomon had made an end of praying, the fire came down from heaven, and consumed the burnt offering and the sacrifices; and the glory of Yahuah (LORD) filled the house.* This is the very fire-from-heaven Jeremy''s record says answered Solomon''s prayer.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac2_lookup sv, _session253_2mac2_lookup tv
 WHERE t.slug='2-maccabees-2-fire-from-heaven-eight-days'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=2 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=7 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 10:22 — *And it was at Jerusalem the feast of the dedication, and it was winter.* Solomon''s eight-day dedication becomes the Feast of Dedication the Messiah kept in Jerusalem.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac2_lookup sv, _session253_2mac2_lookup tv
 WHERE t.slug='2-maccabees-2-fire-from-heaven-eight-days'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=2 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=10 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Maccabees 4:56 — *And so they kept the dedication of the altar eight days and offered burnt offerings with gladness, and sacrificed the sacrifice of deliverance and praise.* The Maccabees'' own eight-day rededication answers to Solomon''s eight days that Jeremy''s writing recorded.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac2_lookup sv, _session253_2mac2_lookup tv
 WHERE t.slug='2-maccabees-2-fire-from-heaven-eight-days'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=2 AND sv.verse_number=12
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=4 AND tv.verse_number=56
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-2-gathered-out-of-every-land
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 30:4 — *If any of thine be driven out unto the outmost parts of heaven, from thence will Yahuah Elohayka (the LORD thy God) gather thee, and from thence will he fetch thee.* The letter''s prayer to be gathered out of every land under heaven is Moses'' own promise of the regathering.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac2_lookup sv, _session253_2mac2_lookup tv
 WHERE t.slug='2-maccabees-2-gathered-out-of-every-land'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=2 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 11:35 — *Women received their dead raised to life again: and others were tortured, not accepting deliverance; that they might obtain a better resurrection.* The deliverance the writer hopes for opens onto the better resurrection of this very book''s tortured martyrs, who would not break covenant.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac2_lookup sv, _session253_2mac2_lookup tv
 WHERE t.slug='2-maccabees-2-gathered-out-of-every-land'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=2 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The hope that carries the covenant-keepers through Antiochus'' great troubles is the awakening of the dead to everlasting life.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac2_lookup sv, _session253_2mac2_lookup tv
 WHERE t.slug='2-maccabees-2-gathered-out-of-every-land'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=2 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

