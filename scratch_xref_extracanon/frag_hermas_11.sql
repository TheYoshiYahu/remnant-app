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

