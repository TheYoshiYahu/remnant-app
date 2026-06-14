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

