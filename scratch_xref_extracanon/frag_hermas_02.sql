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

