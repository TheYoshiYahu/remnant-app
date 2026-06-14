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

