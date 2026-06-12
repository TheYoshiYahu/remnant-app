-- =====================================================================
-- Session 403 — Ascension of Isaiah FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py ../data-schema/migrations/session403_ascension_isaiah_extracanon_cross_references.sql
-- =====================================================================

\echo 'session403 — Ascension of Isaiah cross-references starting...'
BEGIN;

-- ----- fragment: minion_ascensionisaiah_01.sql (session403 ascension-isaiah 1) -----
-- Source anchor: ascension-isaiah/ascension-isaiah ch1. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: asci1 (view _session403_asci1_lookup). Sort band base 67500, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session403_asci1_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ascension-isaiah-1-words-of-the-beloved
  ('ascension-isaiah', 'ascension-isaiah', 1, 4, 'canon', 'matthew', 3, 17, 'free', E'Matthew 3:17 — *And lo a voice from heaven, saying, This is my beloved Son, in whom I am well pleased.* The same title Isaiah carries — "the Beloved" — the Father speaks aloud over Yahusha at the Jordan in Ascension of Isaiah 1:4.'),
  ('ascension-isaiah', 'ascension-isaiah', 1, 4, 'canon', 'john', 1, 14, 'free', E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The faith of the Beloved that Isaiah "had seen" (Ascension of Isaiah 1:4) is the incarnation John witnessed.'),
  ('ascension-isaiah', 'ascension-isaiah', 1, 5, 'canon', 'colossians', 1, 13, 'free', E'Colossians 1:13 — *Who hath delivered us from the power of darkness, and hath translated us into the kingdom of his dear Son.* The "dear Son" of Paul is the very Beloved whose persecution and ascension Isaiah stored up in writing (Ascension of Isaiah 1:5).'),
  -- thread: ascension-isaiah-1-prince-of-this-world
  ('ascension-isaiah', 'ascension-isaiah', 1, 3, 'canon', 'john', 12, 31, 'free', E'John 12:31 — *Now is the judgment of this world: now shall the prince of this world be cast out.* Yahusha names the same "prince of this world" whose judgment Isaiah recorded in Ascension of Isaiah 1:3.'),
  ('ascension-isaiah', 'ascension-isaiah', 1, 3, 'canon', 'john', 16, 11, 'free', E'John 16:11 — *Of judgment, because the prince of this world is judged.* The "eternal judgments" against the prince of this world (Ascension of Isaiah 1:3) are pronounced final by Yahusha.'),
  ('ascension-isaiah', 'ascension-isaiah', 1, 3, 'canon', 'ephesians', 6, 12, 'free', E'Ephesians 6:12 — *For we wrestle not against flesh and blood, but against principalities, against powers, against the rulers of the darkness of this world, against spiritual wickedness in high places.* Paul names the same "angels, and authorities, and powers" Isaiah saw under the prince of this world in Ascension of Isaiah 1:3.'),
  -- thread: ascension-isaiah-1-beliar-sammael
  ('ascension-isaiah', 'ascension-isaiah', 1, 8, 'canon', '2-corinthians', 6, 15, 'free', E'2 Corinthians 6:15 — *And what concord hath Messiah (Christ) with Belial? or what part hath he that believeth with an infidel?* Paul''s "Belial" is the very Beliar Isaiah says Manasseh will follow in Ascension of Isaiah 1:8.'),
  ('ascension-isaiah', 'ascension-isaiah', 1, 9, 'canon', 'john', 8, 44, 'free', E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The murderer who dwells in Manasseh to saw Isaiah asunder (Ascension of Isaiah 1:9) is the same liar Yahusha names.'),
  ('ascension-isaiah', 'ascension-isaiah', 1, 9, 'canon', '2-thessalonians', 2, 3, 'free', E'2 Thessalonians 2:3 — *Let no man deceive you by any means: for that day shall not come, except there come a falling away first, and that man of sin be revealed, the son of perdition.* The mass apostasy Beliar works through Manasseh (Ascension of Isaiah 1:9) is the same falling-away Paul foretells.'),
  ('ascension-isaiah', 'ascension-isaiah', 1, 9, 'canon', '2-thessalonians', 2, 9, 'free', E'2 Thessalonians 2:9 — *Even him, whose coming is after the working of Satan with all power and signs and lying wonders.* The adversary indwelling a man to deceive (Ascension of Isaiah 1:9) is the same working of Satan Paul describes.'),
  -- thread: ascension-isaiah-1-sawn-asunder
  ('ascension-isaiah', 'ascension-isaiah', 1, 9, 'canon', 'hebrews', 11, 37, 'free', E'Hebrews 11:37 — *They were stoned, they were sawn asunder, were tempted, were slain with the sword: they wandered about in sheepskins and goatskins; being destitute, afflicted, tormented.* "Sawn asunder" is the direct reference to Isaiah''s martyrdom foretold in Ascension of Isaiah 1:9.'),
  ('ascension-isaiah', 'ascension-isaiah', 1, 9, 'canon', 'matthew', 23, 35, 'free', E'Matthew 23:35 — *That upon you may come all the righteous blood shed upon the earth, from the blood of righteous Abel unto the blood of Zacharias son of Barachias, whom ye slew between the temple and the altar.* Yahusha reckons the slain prophets'' blood — Isaiah''s among it (Ascension of Isaiah 1:9) — against Jerusalem.'),
  ('ascension-isaiah', 'ascension-isaiah', 1, 9, 'canon', 'matthew', 23, 37, 'free', E'Matthew 23:37 — *O Jerusalem, Jerusalem, thou that killest the prophets, and stonest them which are sent unto thee, how often would I have gathered thy children together, even as a hen gathereth her chickens under her wings, and ye would not!* The city that kills its prophets is the city that sawed Isaiah asunder in Ascension of Isaiah 1:9.'),
  ('ascension-isaiah', 'ascension-isaiah', 1, 9, 'canon', '2-kings', 21, 16, 'free', E'2 Kings 21:16 — *Moreover Manasseh shed innocent blood very much, till he had filled Jerusalem from one end to another; beside his sin wherewith he made Yahudah (Judah) to sin, in doing that which was evil in the sight of Yahuah (LORD).* The innocent blood Manasseh shed includes the prophet sawn by his hands in Ascension of Isaiah 1:9.'),
  -- thread: ascension-isaiah-1-depart-inherit-heritage
  ('ascension-isaiah', 'ascension-isaiah', 1, 13, 'canon', '2-timothy', 4, 6, 'free', E'2 Timothy 4:6 — *For I am now ready to be offered, and the time of my departure is at hand.* Paul names his death "departure" as Isaiah names his — "I shall depart" — embracing it as appointed (Ascension of Isaiah 1:13).'),
  ('ascension-isaiah', 'ascension-isaiah', 1, 13, 'canon', '2-timothy', 4, 8, 'free', E'2 Timothy 4:8 — *Henceforth there is laid up for me a crown of righteousness, which Yahuah (Lord), the righteous judge, shall give me at that day: and not to me only, but unto all them also that love his appearing.* The "heritage of the Beloved" Isaiah expects to inherit (Ascension of Isaiah 1:13) is this laid-up reward.'),
  ('ascension-isaiah', 'ascension-isaiah', 1, 7, 'canon', 'hebrews', 11, 35, 'free', E'Hebrews 11:35 — *Women received their dead raised to life again: and others were tortured, not accepting deliverance; that they might obtain a better resurrection.* Isaiah, foreknowing he shall depart "mid the torture of my body" (Ascension of Isaiah 1:7), refuses deliverance for the better resurrection.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session403_asci1_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session403_asci1_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-1-words-of-the-beloved',
       E'The words of the faith of the Beloved which he had seen',
       E'Isaiah delivers to Manasseh not bare prophecy but *the words of the faith of the Beloved which he himself had seen* — a vision of one already beheld, already named the Beloved, before ever he came in flesh. It ain''t new. The voice from heaven names the same one at the Jordan: *And lo a voice from heaven, saying, This is my beloved Son, in whom I am well pleased* (Matthew 3:17). What Isaiah stored up against the day, John saw fulfilled: *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth* (John 1:14). And the Father *hath delivered us from the power of darkness, and hath translated us into the kingdom of his dear Son* (Colossians 1:13) — the Beloved Isaiah confessed centuries before.',
       sv.verse_id, ev.verse_id, 'extras', 67500
  FROM _session403_asci1_lookup sv, _session403_asci1_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=1 AND sv.verse_number=4
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=1 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-1-prince-of-this-world',
       E'The prince of this world and his angels and his powers',
       E'Isaiah sets down *the eternal judgments and torments of Gehenna, and of the prince of this world, and of his angels, and his authorities and his powers* — the adversary already named ruler over the present age, already under sentence. It ain''t new. Yahusha names him with the same title and the same doom: *Now is the judgment of this world: now shall the prince of this world be cast out* (John 12:31), *the prince of this world is judged* (John 16:11). Paul knows the war is against those same ranks: *we wrestle not against flesh and blood, but against principalities, against powers, against the rulers of the darkness of this world, against spiritual wickedness in high places* (Ephesians 6:12). The judgment Isaiah foresaw stands written from of old.',
       sv.verse_id, ev.verse_id, 'extras', 67503
  FROM _session403_asci1_lookup sv, _session403_asci1_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=1 AND sv.verse_number=3
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=1 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-1-beliar-sammael',
       E'Sammael, Beliar, dwelling in Manasseh',
       E'Isaiah foretells the turning: *Sammael Malchira will serve Manasseh... and he will become a follower of Beliar rather than of me*, and *Beliar will dwell in Manasseh, and by his hands I shall be sawn asunder*. The adversary works through a man to make many *abandon the true faith*. It ain''t new. Paul sets the same name against the Messiah: *And what concord hath Messiah (Christ) with Belial? or what part hath he that believeth with an infidel?* (2 Corinthians 6:15). Yahusha unmasks the father of the lie: *Ye are of your father the devil... He was a murderer from the beginning, and abode not in the truth... for he is a liar, and the father of it* (John 8:44). And the falling-away that Manasseh begins is the very pattern Paul names at the end: *that man of sin be revealed, the son of perdition* (2 Thessalonians 2:3), *whose coming is after the working of Satan with all power and signs and lying wonders* (2 Thessalonians 2:9).',
       sv.verse_id, ev.verse_id, 'extras', 67506
  FROM _session403_asci1_lookup sv, _session403_asci1_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=1 AND sv.verse_number=8
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=1 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-1-sawn-asunder',
       E'By his hands I shall be sawn asunder',
       E'Here is the martyrdom foretold in Isaiah''s own mouth: *by his hands I shall be sawn asunder* — the prophet''s death by the wood-saw, worked through Manasseh''s hand. It ain''t new. The roll of the faithful in Hebrews preserves the very word: *They were stoned, they were sawn asunder, were tempted, were slain with the sword* (Hebrews 11:37) — the direct echo of Isaiah''s end. Yahusha lays the blood of the slain prophets on Jerusalem: *O Jerusalem, Jerusalem, thou that killest the prophets, and stonest them which are sent unto thee* (Matthew 23:37), *from the blood of righteous Abel unto the blood of Zacharias* (Matthew 23:35). And the Kings record names the hand: *Moreover Manasseh shed innocent blood very much, till he had filled Jerusalem from one end to another* (2 Kings 21:16) — the innocent blood that includes the prophet sawn in two.',
       sv.verse_id, ev.verse_id, 'extras', 67509
  FROM _session403_asci1_lookup sv, _session403_asci1_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=1 AND sv.verse_number=9
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=1 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-1-depart-inherit-heritage',
       E'I shall depart, and inherit the heritage of the Beloved',
       E'Isaiah does not flee his end; he names it as a calling: *through the agency of his hands I shall depart mid the torture of my body*, and *with this calling have I been called and I shall inherit the heritage of the Beloved*. The martyr''s death is the martyr''s portion. It ain''t new. Paul faces his own offering in the same key: *For I am now ready to be offered, and the time of my departure is at hand* (2 Timothy 4:6), *Henceforth there is laid up for me a crown of righteousness, which Yahuah (Lord), the righteous judge, shall give me at that day* (2 Timothy 4:8). And those who suffered the saw obtained the better portion: *and others were tortured, not accepting deliverance; that they might obtain a better resurrection* (Hebrews 11:35) — the heritage of the Beloved Isaiah was content to inherit.',
       sv.verse_id, ev.verse_id, 'extras', 67512
  FROM _session403_asci1_lookup sv, _session403_asci1_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=1 AND sv.verse_number=7
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=1 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ascension-isaiah-1-words-of-the-beloved
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 3:17 — *And lo a voice from heaven, saying, This is my beloved Son, in whom I am well pleased.* The same title Isaiah carries — "the Beloved" — the Father speaks aloud over Yahusha at the Jordan in Ascension of Isaiah 1:4.'
  FROM cross_reference_threads t, cross_references x, _session403_asci1_lookup sv, _session403_asci1_lookup tv
 WHERE t.slug='ascension-isaiah-1-words-of-the-beloved'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=3 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The faith of the Beloved that Isaiah "had seen" (Ascension of Isaiah 1:4) is the incarnation John witnessed.'
  FROM cross_reference_threads t, cross_references x, _session403_asci1_lookup sv, _session403_asci1_lookup tv
 WHERE t.slug='ascension-isaiah-1-words-of-the-beloved'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Colossians 1:13 — *Who hath delivered us from the power of darkness, and hath translated us into the kingdom of his dear Son.* The "dear Son" of Paul is the very Beloved whose persecution and ascension Isaiah stored up in writing (Ascension of Isaiah 1:5).'
  FROM cross_reference_threads t, cross_references x, _session403_asci1_lookup sv, _session403_asci1_lookup tv
 WHERE t.slug='ascension-isaiah-1-words-of-the-beloved'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=1 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=1 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-1-prince-of-this-world
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 12:31 — *Now is the judgment of this world: now shall the prince of this world be cast out.* Yahusha names the same "prince of this world" whose judgment Isaiah recorded in Ascension of Isaiah 1:3.'
  FROM cross_reference_threads t, cross_references x, _session403_asci1_lookup sv, _session403_asci1_lookup tv
 WHERE t.slug='ascension-isaiah-1-prince-of-this-world'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=12 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 16:11 — *Of judgment, because the prince of this world is judged.* The "eternal judgments" against the prince of this world (Ascension of Isaiah 1:3) are pronounced final by Yahusha.'
  FROM cross_reference_threads t, cross_references x, _session403_asci1_lookup sv, _session403_asci1_lookup tv
 WHERE t.slug='ascension-isaiah-1-prince-of-this-world'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=16 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ephesians 6:12 — *For we wrestle not against flesh and blood, but against principalities, against powers, against the rulers of the darkness of this world, against spiritual wickedness in high places.* Paul names the same "angels, and authorities, and powers" Isaiah saw under the prince of this world in Ascension of Isaiah 1:3.'
  FROM cross_reference_threads t, cross_references x, _session403_asci1_lookup sv, _session403_asci1_lookup tv
 WHERE t.slug='ascension-isaiah-1-prince-of-this-world'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=6 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-1-beliar-sammael
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Corinthians 6:15 — *And what concord hath Messiah (Christ) with Belial? or what part hath he that believeth with an infidel?* Paul''s "Belial" is the very Beliar Isaiah says Manasseh will follow in Ascension of Isaiah 1:8.'
  FROM cross_reference_threads t, cross_references x, _session403_asci1_lookup sv, _session403_asci1_lookup tv
 WHERE t.slug='ascension-isaiah-1-beliar-sammael'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=6 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The murderer who dwells in Manasseh to saw Isaiah asunder (Ascension of Isaiah 1:9) is the same liar Yahusha names.'
  FROM cross_reference_threads t, cross_references x, _session403_asci1_lookup sv, _session403_asci1_lookup tv
 WHERE t.slug='ascension-isaiah-1-beliar-sammael'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=1 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Thessalonians 2:3 — *Let no man deceive you by any means: for that day shall not come, except there come a falling away first, and that man of sin be revealed, the son of perdition.* The mass apostasy Beliar works through Manasseh (Ascension of Isaiah 1:9) is the same falling-away Paul foretells.'
  FROM cross_reference_threads t, cross_references x, _session403_asci1_lookup sv, _session403_asci1_lookup tv
 WHERE t.slug='ascension-isaiah-1-beliar-sammael'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=1 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='2-thessalonians' AND tv.chapter_number=2 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Thessalonians 2:9 — *Even him, whose coming is after the working of Satan with all power and signs and lying wonders.* The adversary indwelling a man to deceive (Ascension of Isaiah 1:9) is the same working of Satan Paul describes.'
  FROM cross_reference_threads t, cross_references x, _session403_asci1_lookup sv, _session403_asci1_lookup tv
 WHERE t.slug='ascension-isaiah-1-beliar-sammael'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=1 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='2-thessalonians' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-1-sawn-asunder
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 11:37 — *They were stoned, they were sawn asunder, were tempted, were slain with the sword: they wandered about in sheepskins and goatskins; being destitute, afflicted, tormented.* "Sawn asunder" is the direct reference to Isaiah''s martyrdom foretold in Ascension of Isaiah 1:9.'
  FROM cross_reference_threads t, cross_references x, _session403_asci1_lookup sv, _session403_asci1_lookup tv
 WHERE t.slug='ascension-isaiah-1-sawn-asunder'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=1 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 23:35 — *That upon you may come all the righteous blood shed upon the earth, from the blood of righteous Abel unto the blood of Zacharias son of Barachias, whom ye slew between the temple and the altar.* Yahusha reckons the slain prophets'' blood — Isaiah''s among it (Ascension of Isaiah 1:9) — against Jerusalem.'
  FROM cross_reference_threads t, cross_references x, _session403_asci1_lookup sv, _session403_asci1_lookup tv
 WHERE t.slug='ascension-isaiah-1-sawn-asunder'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=1 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=23 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 23:37 — *O Jerusalem, Jerusalem, thou that killest the prophets, and stonest them which are sent unto thee, how often would I have gathered thy children together, even as a hen gathereth her chickens under her wings, and ye would not!* The city that kills its prophets is the city that sawed Isaiah asunder in Ascension of Isaiah 1:9.'
  FROM cross_reference_threads t, cross_references x, _session403_asci1_lookup sv, _session403_asci1_lookup tv
 WHERE t.slug='ascension-isaiah-1-sawn-asunder'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=1 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=23 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Kings 21:16 — *Moreover Manasseh shed innocent blood very much, till he had filled Jerusalem from one end to another; beside his sin wherewith he made Yahudah (Judah) to sin, in doing that which was evil in the sight of Yahuah (LORD).* The innocent blood Manasseh shed includes the prophet sawn by his hands in Ascension of Isaiah 1:9.'
  FROM cross_reference_threads t, cross_references x, _session403_asci1_lookup sv, _session403_asci1_lookup tv
 WHERE t.slug='ascension-isaiah-1-sawn-asunder'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=1 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=21 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-1-depart-inherit-heritage
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Timothy 4:6 — *For I am now ready to be offered, and the time of my departure is at hand.* Paul names his death "departure" as Isaiah names his — "I shall depart" — embracing it as appointed (Ascension of Isaiah 1:13).'
  FROM cross_reference_threads t, cross_references x, _session403_asci1_lookup sv, _session403_asci1_lookup tv
 WHERE t.slug='ascension-isaiah-1-depart-inherit-heritage'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=1 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='2-timothy' AND tv.chapter_number=4 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Timothy 4:8 — *Henceforth there is laid up for me a crown of righteousness, which Yahuah (Lord), the righteous judge, shall give me at that day: and not to me only, but unto all them also that love his appearing.* The "heritage of the Beloved" Isaiah expects to inherit (Ascension of Isaiah 1:13) is this laid-up reward.'
  FROM cross_reference_threads t, cross_references x, _session403_asci1_lookup sv, _session403_asci1_lookup tv
 WHERE t.slug='ascension-isaiah-1-depart-inherit-heritage'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=1 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='2-timothy' AND tv.chapter_number=4 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 11:35 — *Women received their dead raised to life again: and others were tortured, not accepting deliverance; that they might obtain a better resurrection.* Isaiah, foreknowing he shall depart "mid the torture of my body" (Ascension of Isaiah 1:7), refuses deliverance for the better resurrection.'
  FROM cross_reference_threads t, cross_references x, _session403_asci1_lookup sv, _session403_asci1_lookup tv
 WHERE t.slug='ascension-isaiah-1-depart-inherit-heritage'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=1 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ascensionisaiah_02.sql (session403 ascension-isaiah 2) -----
-- Source anchor: ascension-isaiah/ascension-isaiah ch2. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: asci2 (view _session403_asci2_lookup). Sort band base 67525, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session403_asci2_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ascension-isaiah-2-sammael-in-manasseh
  ('ascension-isaiah', 'ascension-isaiah', 2, 1, 'canon', '2-chronicles', 33, 6, 'free', E'2 Chronicles 33:6 — *And he caused his children to pass through the fire in the valley of the son of Hinnom: also he observed times, and used enchantments, and used witchcraft, and dealt with a familiar spirit, and with wizards: he wrought much evil in the sight of Yahuah (LORD), to provoke him to anger.* The canon confirms the sorcery the Ascension ties to Sammael''s dwelling in Manasseh at 2:1.'),
  ('ascension-isaiah', 'ascension-isaiah', 2, 1, 'canon', '2-chronicles', 33, 9, 'free', E'2 Chronicles 33:9 — *So Manasseh made Yahudah (Judah) and the inhabitants of Jerusalem to err, and to do worse than the heathen, whom Yahuah (LORD) had destroyed before the children of Yashar''el (Israel).* The king who forgat his father''s commands led the whole land astray, exactly as Ascension-Isaiah 2:1 reports.'),
  ('ascension-isaiah', 'ascension-isaiah', 2, 2, 'canon', 'john', 8, 44, 'free', E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The Satan whom Manasseh served at 2:2 is the murderer and liar from the beginning.'),
  -- thread: ascension-isaiah-2-beliar-the-ruler-of-this-world
  ('ascension-isaiah', 'ascension-isaiah', 2, 4, 'canon', '2-corinthians', 6, 15, 'free', E'2 Corinthians 6:15 — *And what concord hath Messiah (Christ) with Belial? or what part hath he that believeth with an infidel?* Paul names the same Beliar/Belial whom Manasseh served at 2:4 — no concord with the angel of lawlessness.'),
  ('ascension-isaiah', 'ascension-isaiah', 2, 4, 'canon', '2-thessalonians', 2, 3, 'free', E'2 Thessalonians 2:3 — *Let no man deceive you by any means: for that day shall not come, except there come a falling away first, and that man of sin be revealed, the son of perdition;* The apostasy Beliar spread in Jerusalem at 2:4 is the very pattern of the falling-away and the man of sin.'),
  ('ascension-isaiah', 'ascension-isaiah', 2, 4, 'canon', '2-thessalonians', 2, 4, 'free', E'2 Thessalonians 2:4 — *Who opposeth and exalteth himself above all that is called Elohim (God), or that is worshipped; so that he as Elohim (God) sitteth in the temple of Elohim (God), shewing himself that he is Elohim (God).* Beliar''s delight in Jerusalem and his enthroned lawlessness at 2:4 foreshadows the one who seats himself in the temple.'),
  -- thread: ascension-isaiah-2-persecution-of-the-righteous
  ('ascension-isaiah', 'ascension-isaiah', 2, 5, 'canon', '2-kings', 21, 16, 'free', E'2 Kings 21:16 — *Moreover Manasseh shed innocent blood very much, till he had filled Jerusalem from one end to another; beside his sin wherewith he made Yahudah (Judah) to sin, in doing that which was evil in the sight of Yahuah (LORD).* The canon names the innocent blood behind the Ascension''s persecution of the righteous at 2:5.'),
  ('ascension-isaiah', 'ascension-isaiah', 2, 5, 'canon', 'matthew', 23, 35, 'free', E'Matthew 23:35 — *That upon you may come all the righteous blood shed upon the earth, from the blood of righteous Abel unto the blood of Zacharias son of Barachias, whom ye slew between the temple and the altar.* The Messiah reckons all the persecuted-righteous blood — including Manasseh''s victims of 2:5 — into one account.'),
  ('ascension-isaiah', 'ascension-isaiah', 2, 5, 'canon', '2-timothy', 3, 12, 'free', E'2 Timothy 3:12 — *Yea, and all that will live godly in HaMashiach Yahusha (Christ Jesus) shall suffer persecution.* The persecution of the righteous at 2:5 is the standing lot of the godly Paul affirms.'),
  -- thread: ascension-isaiah-2-the-faithful-withdraw-to-the-wilderness
  ('ascension-isaiah', 'ascension-isaiah', 2, 9, 'canon', 'hebrews', 11, 37, 'free', E'Hebrews 11:37 — *They were stoned, they were sawn asunder, were tempted, were slain with the sword: they wandered about in sheepskins and goatskins; being destitute, afflicted, tormented;* The sheepskin-clad prophets withdrawing at 2:9-10 are Hebrews'' very roll of the afflicted faithful — and the sawn-asunder names Isaiah''s own coming death.'),
  ('ascension-isaiah', 'ascension-isaiah', 2, 10, 'canon', 'hebrews', 11, 38, 'free', E'Hebrews 11:38 — *(Of whom the world was not worthy:) they wandered in deserts, and in mountains, and in dens and caves of the earth.* The faithful naked on the desert mountain at 2:10 are precisely those of whom the world was not worthy.'),
  ('ascension-isaiah', 'ascension-isaiah', 2, 7, 'canon', '1-kings', 19, 10, 'free', E'1 Kings 19:10 — *And he said, I have been very jealous for Yahuah Elohim (the LORD God) of hosts: for the children of Yashar''el (Israel) have forsaken thy covenant, thrown down thine altars, and slain thy prophets with the sword; and I, even I only, am left; and they seek my life, to take it away.* Isaiah''s withdrawal from a Satan-worshipping Jerusalem at 2:7 echoes Elijah''s wilderness flight from the same apostasy.'),
  -- thread: ascension-isaiah-2-elijah-micaiah-the-true-prophets
  ('ascension-isaiah', 'ascension-isaiah', 2, 13, 'canon', '1-kings', 22, 8, 'free', E'1 Kings 22:8 — *And the king of Yashar''el (Israel) said unto Jehoshaphat, There is yet one man, Micaiah the son of Imlah, by whom we may enquire of Yahuah (LORD): but I hate him; for he doth not prophesy good concerning me, but evil. And Jehoshaphat said, Let not the king say so.* This is the very Micaiah whom Ahab imprisoned and the Ascension recalls at 2:13 — hated for prophesying truth.'),
  ('ascension-isaiah', 'ascension-isaiah', 2, 14, 'canon', '2-kings', 1, 16, 'free', E'2 Kings 1:16 — *And he said unto him, Thus saith Yahuah (LORD), Forasmuch as thou hast sent messengers to enquire of Baal-zebub the god of Ekron, is it not because there is no Elohim (God) in Yashar''el (Israel) to enquire of his word? therefore thou shalt not come down off that bed on which thou art gone up, but shalt surely die.* The canon gives the exact deathbed prophecy against Ahaziah that the Ascension summarizes at 2:14.'),
  ('ascension-isaiah', 'ascension-isaiah', 2, 14, 'canon', '1-kings', 17, 1, 'free', E'1 Kings 17:1 — *And Elijah the Tishbite, who was of the inhabitants of Gilead, said unto Ahab, As Yahuah Elohim (the LORD God) of Yashar''el (Israel) liveth, before whom I stand, there shall not be dew nor rain these years, but according to my word.* Elijah of Gilead, named at 2:14, is the same Tishbite of Gilead who confronted Ahab — the true prophet against Baal.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session403_asci2_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session403_asci2_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-2-sammael-in-manasseh',
       E'Sammael abode in Manasseh — the adversary in the apostate king',
       E'*AND it came to pass after that Hezekiah died and Manasseh became king, that he did not remember the commands of Hezekiah his father, but forgat them, and Sammael abode in Manasseh and clung fast to him.* The Ascension names what Kings records: the moment Manasseh forsook the covenant, the adversary took up his dwelling in him. Scripture testifies to the same king''s witchcraft: *And he caused his children to pass through the fire in the valley of the son of Hinnom: also he observed times, and used enchantments, and used witchcraft, and dealt with a familiar spirit, and with wizards: he wrought much evil in the sight of Yahuah (LORD), to provoke him to anger.* (2 Chronicles 33:6); *So Manasseh made Yahudah (Judah) and the inhabitants of Jerusalem to err, and to do worse than the heathen, whom Yahuah (LORD) had destroyed before the children of Yashar''el (Israel).* (2 Chronicles 33:9). The Beloved later names the source of such a will: *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* (John 8:44). It ain''t new — the adversary who clung to Manasseh is the murderer from the beginning.',
       sv.verse_id, ev.verse_id, 'extras', 67525
  FROM _session403_asci2_lookup sv, _session403_asci2_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=2 AND sv.verse_number=1
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=2 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-2-beliar-the-ruler-of-this-world',
       E'Beliar, the angel of lawlessness, the ruler of this world',
       E'*And Manasseh turned aside his heart to serve Beliar; for the angel of lawlessness, who is the ruler of this world, is Beliar, whose name is Mantanbuchus. and he delighted in Jerusalem because of Manasseh, and he made him strong in apostatizing (Israel) and in the lawlessness which were spread abroad in Jerusalem.* The Ascension names BELIAR — and Paul uses the very same name when he forbids the covenant people any concord with him: *And what concord hath Messiah (Christ) with Belial? or what part hath he that believeth with an infidel?* (2 Corinthians 6:15). The angel of lawlessness who made Manasseh strong in apostasy is the pattern of the coming man of sin: *Let no man deceive you by any means: for that day shall not come, except there come a falling away first, and that man of sin be revealed, the son of perdition;* (2 Thessalonians 2:3); *Who opposeth and exalteth himself above all that is called Elohim (God), or that is worshipped; so that he as Elohim (God) sitteth in the temple of Elohim (God), shewing himself that he is Elohim (God).* (2 Thessalonians 2:4). It ain''t new — the lawless one who seats himself in Jerusalem is no novelty of the end; he is the old Beliar.',
       sv.verse_id, ev.verse_id, 'extras', 67528
  FROM _session403_asci2_lookup sv, _session403_asci2_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=2 AND sv.verse_number=4
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=2 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-2-persecution-of-the-righteous',
       E'The persecution of the righteous by Manasseh',
       E'*And witchcraft and magic increased and divination and auguration, and fornication, and adultery, and the persecution of the righteous by Manasseh and Belachira, and Tobia the Canaanite, and John of Anathoth, and by Zadok the chief of the works.* The Ascension says plainly that Manasseh persecuted the righteous — and Kings measures the blood: *Moreover Manasseh shed innocent blood very much, till he had filled Jerusalem from one end to another; beside his sin wherewith he made Yahudah (Judah) to sin, in doing that which was evil in the sight of Yahuah (LORD).* (2 Kings 21:16). The Beloved gathers all such shed righteous blood into one reckoning: *That upon you may come all the righteous blood shed upon the earth, from the blood of righteous Abel unto the blood of Zacharias son of Barachias, whom ye slew between the temple and the altar.* (Matthew 23:35). And the apostle states the rule the prophets lived: *Yea, and all that will live godly in HaMashiach Yahusha (Christ Jesus) shall suffer persecution.* (2 Timothy 3:12). It ain''t new — the righteous have always been hunted by the lawless.',
       sv.verse_id, ev.verse_id, 'extras', 67531
  FROM _session403_asci2_lookup sv, _session403_asci2_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=2 AND sv.verse_number=5
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=2 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-2-the-faithful-withdraw-to-the-wilderness',
       E'Isaiah and the faithful withdraw to the mountain in the desert',
       E'*And, when Isaiah, the son of Amoz, saw the lawlessness which was being perpetrated in Jerusalem and the worship of Satan and his wantonness, he withdrew from Jerusalem and settled in Bethlehem of Yahudah (Judah).* The prophet and his company flee the apostate city: *And Micaiah the prophet, and the aged Ananias, and Joel and Habakkuk, and his son Josab, and many of the faithful who believed in the ascension into heaven, withdrew and settled on the mountain.* *They were all clothed with garments of hair, and they were all prophets. And they had nothing with them but were naked, and they all lamented with a great lamentation because of the going astray of Yashar''el (Israel).* This is the very portrait the Letter to the Hebrews draws of the persecuted faithful: *They were stoned, they were sawn asunder, were tempted, were slain with the sword: they wandered about in sheepskins and goatskins; being destitute, afflicted, tormented;* (Hebrews 11:37); *(Of whom the world was not worthy:) they wandered in deserts, and in mountains, and in dens and caves of the earth.* (Hebrews 11:38). Elijah before them grieved the same apostasy in the same wilderness: *I have been very jealous for Yahuah Elohim (the LORD God) of hosts: for the children of Yashar''el (Israel) have forsaken thy covenant, thrown down thine altars, and slain thy prophets with the sword; and I, even I only, am left; and they seek my life, to take it away.* (1 Kings 19:10). It ain''t new — the faithful remnant has always withdrawn to the mountains while Israel went astray.',
       sv.verse_id, ev.verse_id, 'extras', 67534
  FROM _session403_asci2_lookup sv, _session403_asci2_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=2 AND sv.verse_number=7
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=2 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-2-elijah-micaiah-the-true-prophets',
       E'Elijah and Micaiah — the true prophets against the prophets of Baal',
       E'The Ascension recalls the old contest between the true prophet and the king''s flatterers: *And he, Micaiah, had been reproved by Ahab and cast into prison.* and *And Elijah the prophet of Tebon of Gilead was reproving Ahaziah and Samaria, and prophesied regarding Ahaziah that he should die on his bed of sickness, and that Samaria should be delivered into the hand of Leba Nasr because he had slain the prophets of Elohim (God).* Kings preserves the very Micaiah Ahab hated: *And the king of Yashar''el (Israel) said unto Jehoshaphat, There is yet one man, Micaiah the son of Imlah, by whom we may enquire of Yahuah (LORD): but I hate him; for he doth not prophesy good concerning me, but evil. And Jehoshaphat said, Let not the king say so.* (1 Kings 22:8). And the very word Elijah spoke against Ahaziah''s deathbed: *And he said unto him, Thus saith Yahuah (LORD), Forasmuch as thou hast sent messengers to enquire of Baal-zebub the god of Ekron, is it not because there is no Elohim (God) in Yashar''el (Israel) to enquire of his word? therefore thou shalt not come down off that bed on which thou art gone up, but shalt surely die.* (2 Kings 1:16). Elijah''s stand began here: *And Elijah the Tishbite, who was of the inhabitants of Gilead, said unto Ahab, As Yahuah Elohim (the LORD God) of Yashar''el (Israel) liveth, before whom I stand, there shall not be dew nor rain these years, but according to my word.* (1 Kings 17:1). It ain''t new — the false prophet who accuses Isaiah descends from the old line that hated Micaiah and slew the prophets of Yahuah.',
       sv.verse_id, ev.verse_id, 'extras', 67537
  FROM _session403_asci2_lookup sv, _session403_asci2_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=2 AND sv.verse_number=13
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=2 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ascension-isaiah-2-sammael-in-manasseh
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Chronicles 33:6 — *And he caused his children to pass through the fire in the valley of the son of Hinnom: also he observed times, and used enchantments, and used witchcraft, and dealt with a familiar spirit, and with wizards: he wrought much evil in the sight of Yahuah (LORD), to provoke him to anger.* The canon confirms the sorcery the Ascension ties to Sammael''s dwelling in Manasseh at 2:1.'
  FROM cross_reference_threads t, cross_references x, _session403_asci2_lookup sv, _session403_asci2_lookup tv
 WHERE t.slug='ascension-isaiah-2-sammael-in-manasseh'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=2 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=33 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Chronicles 33:9 — *So Manasseh made Yahudah (Judah) and the inhabitants of Jerusalem to err, and to do worse than the heathen, whom Yahuah (LORD) had destroyed before the children of Yashar''el (Israel).* The king who forgat his father''s commands led the whole land astray, exactly as Ascension-Isaiah 2:1 reports.'
  FROM cross_reference_threads t, cross_references x, _session403_asci2_lookup sv, _session403_asci2_lookup tv
 WHERE t.slug='ascension-isaiah-2-sammael-in-manasseh'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=2 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=33 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The Satan whom Manasseh served at 2:2 is the murderer and liar from the beginning.'
  FROM cross_reference_threads t, cross_references x, _session403_asci2_lookup sv, _session403_asci2_lookup tv
 WHERE t.slug='ascension-isaiah-2-sammael-in-manasseh'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=2 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-2-beliar-the-ruler-of-this-world
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Corinthians 6:15 — *And what concord hath Messiah (Christ) with Belial? or what part hath he that believeth with an infidel?* Paul names the same Beliar/Belial whom Manasseh served at 2:4 — no concord with the angel of lawlessness.'
  FROM cross_reference_threads t, cross_references x, _session403_asci2_lookup sv, _session403_asci2_lookup tv
 WHERE t.slug='ascension-isaiah-2-beliar-the-ruler-of-this-world'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=6 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Thessalonians 2:3 — *Let no man deceive you by any means: for that day shall not come, except there come a falling away first, and that man of sin be revealed, the son of perdition;* The apostasy Beliar spread in Jerusalem at 2:4 is the very pattern of the falling-away and the man of sin.'
  FROM cross_reference_threads t, cross_references x, _session403_asci2_lookup sv, _session403_asci2_lookup tv
 WHERE t.slug='ascension-isaiah-2-beliar-the-ruler-of-this-world'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='2-thessalonians' AND tv.chapter_number=2 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Thessalonians 2:4 — *Who opposeth and exalteth himself above all that is called Elohim (God), or that is worshipped; so that he as Elohim (God) sitteth in the temple of Elohim (God), shewing himself that he is Elohim (God).* Beliar''s delight in Jerusalem and his enthroned lawlessness at 2:4 foreshadows the one who seats himself in the temple.'
  FROM cross_reference_threads t, cross_references x, _session403_asci2_lookup sv, _session403_asci2_lookup tv
 WHERE t.slug='ascension-isaiah-2-beliar-the-ruler-of-this-world'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='2-thessalonians' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-2-persecution-of-the-righteous
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Kings 21:16 — *Moreover Manasseh shed innocent blood very much, till he had filled Jerusalem from one end to another; beside his sin wherewith he made Yahudah (Judah) to sin, in doing that which was evil in the sight of Yahuah (LORD).* The canon names the innocent blood behind the Ascension''s persecution of the righteous at 2:5.'
  FROM cross_reference_threads t, cross_references x, _session403_asci2_lookup sv, _session403_asci2_lookup tv
 WHERE t.slug='ascension-isaiah-2-persecution-of-the-righteous'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=2 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=21 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 23:35 — *That upon you may come all the righteous blood shed upon the earth, from the blood of righteous Abel unto the blood of Zacharias son of Barachias, whom ye slew between the temple and the altar.* The Messiah reckons all the persecuted-righteous blood — including Manasseh''s victims of 2:5 — into one account.'
  FROM cross_reference_threads t, cross_references x, _session403_asci2_lookup sv, _session403_asci2_lookup tv
 WHERE t.slug='ascension-isaiah-2-persecution-of-the-righteous'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=2 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=23 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Timothy 3:12 — *Yea, and all that will live godly in HaMashiach Yahusha (Christ Jesus) shall suffer persecution.* The persecution of the righteous at 2:5 is the standing lot of the godly Paul affirms.'
  FROM cross_reference_threads t, cross_references x, _session403_asci2_lookup sv, _session403_asci2_lookup tv
 WHERE t.slug='ascension-isaiah-2-persecution-of-the-righteous'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=2 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='2-timothy' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-2-the-faithful-withdraw-to-the-wilderness
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 11:37 — *They were stoned, they were sawn asunder, were tempted, were slain with the sword: they wandered about in sheepskins and goatskins; being destitute, afflicted, tormented;* The sheepskin-clad prophets withdrawing at 2:9-10 are Hebrews'' very roll of the afflicted faithful — and the sawn-asunder names Isaiah''s own coming death.'
  FROM cross_reference_threads t, cross_references x, _session403_asci2_lookup sv, _session403_asci2_lookup tv
 WHERE t.slug='ascension-isaiah-2-the-faithful-withdraw-to-the-wilderness'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=2 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 11:38 — *(Of whom the world was not worthy:) they wandered in deserts, and in mountains, and in dens and caves of the earth.* The faithful naked on the desert mountain at 2:10 are precisely those of whom the world was not worthy.'
  FROM cross_reference_threads t, cross_references x, _session403_asci2_lookup sv, _session403_asci2_lookup tv
 WHERE t.slug='ascension-isaiah-2-the-faithful-withdraw-to-the-wilderness'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=2 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=38
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Kings 19:10 — *And he said, I have been very jealous for Yahuah Elohim (the LORD God) of hosts: for the children of Yashar''el (Israel) have forsaken thy covenant, thrown down thine altars, and slain thy prophets with the sword; and I, even I only, am left; and they seek my life, to take it away.* Isaiah''s withdrawal from a Satan-worshipping Jerusalem at 2:7 echoes Elijah''s wilderness flight from the same apostasy.'
  FROM cross_reference_threads t, cross_references x, _session403_asci2_lookup sv, _session403_asci2_lookup tv
 WHERE t.slug='ascension-isaiah-2-the-faithful-withdraw-to-the-wilderness'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=2 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=19 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-2-elijah-micaiah-the-true-prophets
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Kings 22:8 — *And the king of Yashar''el (Israel) said unto Jehoshaphat, There is yet one man, Micaiah the son of Imlah, by whom we may enquire of Yahuah (LORD): but I hate him; for he doth not prophesy good concerning me, but evil. And Jehoshaphat said, Let not the king say so.* This is the very Micaiah whom Ahab imprisoned and the Ascension recalls at 2:13 — hated for prophesying truth.'
  FROM cross_reference_threads t, cross_references x, _session403_asci2_lookup sv, _session403_asci2_lookup tv
 WHERE t.slug='ascension-isaiah-2-elijah-micaiah-the-true-prophets'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=2 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=22 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Kings 1:16 — *And he said unto him, Thus saith Yahuah (LORD), Forasmuch as thou hast sent messengers to enquire of Baal-zebub the god of Ekron, is it not because there is no Elohim (God) in Yashar''el (Israel) to enquire of his word? therefore thou shalt not come down off that bed on which thou art gone up, but shalt surely die.* The canon gives the exact deathbed prophecy against Ahaziah that the Ascension summarizes at 2:14.'
  FROM cross_reference_threads t, cross_references x, _session403_asci2_lookup sv, _session403_asci2_lookup tv
 WHERE t.slug='ascension-isaiah-2-elijah-micaiah-the-true-prophets'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=2 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=1 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Kings 17:1 — *And Elijah the Tishbite, who was of the inhabitants of Gilead, said unto Ahab, As Yahuah Elohim (the LORD God) of Yashar''el (Israel) liveth, before whom I stand, there shall not be dew nor rain these years, but according to my word.* Elijah of Gilead, named at 2:14, is the same Tishbite of Gilead who confronted Ahab — the true prophet against Baal.'
  FROM cross_reference_threads t, cross_references x, _session403_asci2_lookup sv, _session403_asci2_lookup tv
 WHERE t.slug='ascension-isaiah-2-elijah-micaiah-the-true-prophets'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=2 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=17 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ascensionisaiah_03.sql (session403 ascension-isaiah 3) -----
-- Source anchor: ascension-isaiah/ascension-isaiah ch3. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: asci3 (view _session403_asci3_lookup). Sort band base 67550, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session403_asci3_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ascension-isaiah-3-false-prophet-accuses
  ('ascension-isaiah', 'ascension-isaiah', 3, 6, 'canon', 'matthew', 23, 37, 'free', E'Matthew 23:37 — *O Jerusalem, Jerusalem, thou that killest the prophets, and stonest them which are sent unto thee, how often would I have gathered thy children together, even as a hen gathereth her chickens under her wings, and ye would not!* The Beloved names the city by the very crime Belchira here sets in motion against Isaiah in Ascension of Isaiah 3:6.'),
  ('ascension-isaiah', 'ascension-isaiah', 3, 10, 'canon', 'matthew', 23, 35, 'free', E'Matthew 23:35 — *That upon you may come all the righteous blood shed upon the earth, from the blood of righteous Abel unto the blood of Zacharias son of Barachias, whom ye slew between the temple and the altar.* The slain Isaiah of Ascension of Isaiah 3:10, falsely charged with calling Jerusalem Sodom, belongs to this same righteous blood the city must answer for.'),
  ('ascension-isaiah', 'ascension-isaiah', 3, 10, 'canon', '2-kings', 21, 16, 'free', E'2 Kings 21:16 — *Moreover Manasseh shed innocent blood very much, till he had filled Jerusalem from one end to another; beside his sin wherewith he made Yahudah (Judah) to sin, in doing that which was evil in the sight of Yahuah (LORD).* The canon''s brief notice of Manasseh''s bloodshed is the very deed Ascension of Isaiah 3:10 enlarges, as Belchira brings his accusations before Manasseh.'),
  -- thread: ascension-isaiah-3-beliar-in-manasseh
  ('ascension-isaiah', 'ascension-isaiah', 3, 11, 'canon', '2-corinthians', 6, 15, 'free', E'2 Corinthians 6:15 — *And what concord hath Messiah (Christ) with Belial? or what part hath he that believeth with an infidel?* The Beliar who dwells in Manasseh''s heart in Ascension of Isaiah 3:11 is the same Belial Paul sets in flat opposition to the Messiah.'),
  ('ascension-isaiah', 'ascension-isaiah', 3, 11, 'canon', 'john', 8, 44, 'free', E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The murderer-and-liar the Beloved names is the very Beliar driving the false accusation and the king''s wrath in Ascension of Isaiah 3:11.'),
  ('ascension-isaiah', 'ascension-isaiah', 3, 13, 'canon', '2-thessalonians', 2, 9, 'free', E'2 Thessalonians 2:9 — *Even him, whose coming is after the working of Satan with all power and signs and lying wonders,* The lying prophecy and great wrath of Beliar in Ascension of Isaiah 3:13 is the same deceiving power Paul says works through Satan.'),
  -- thread: ascension-isaiah-3-beloved-descends
  ('ascension-isaiah', 'ascension-isaiah', 3, 13, 'canon', 'philippians', 2, 7, 'free', E'Philippians 2:7 — *But made himself of no reputation, and took upon him the form of a servant, and was made in the likeness of men:* The very transformation into *the likeness of man* foreseen in Ascension of Isaiah 3:13 is Paul''s confession of the Beloved emptying Himself into the form of a servant.'),
  ('ascension-isaiah', 'ascension-isaiah', 3, 13, 'canon', 'philippians', 2, 8, 'free', E'Philippians 2:8 — *And being found in fashion as a man, he humbled himself, and became obedient unto death, even the death of the cross.* The descent that ends with the Beloved *crucified upon the tree* in Ascension of Isaiah 3:13 is here the obedience unto the death of the cross.'),
  ('ascension-isaiah', 'ascension-isaiah', 3, 13, 'canon', '1-timothy', 3, 16, 'free', E'1 Timothy 3:16 — *And without controversy great is the mystery of godliness: Elohim (God) was manifest in the flesh, justified in the Spirit, seen of angels, preached unto the Gentiles, believed on in the world, received up into glory.* The whole arc of Ascension of Isaiah 3:13 — God in the likeness of man, persecuted, then ascended — is Paul''s six-fold mystery of godliness.'),
  ('ascension-isaiah', 'ascension-isaiah', 3, 13, 'canon', 'isaiah', 53, 9, 'free', E'Isaiah 53:9 — *And he made his grave with the wicked, and with the rich in his death; because he had done no violence, neither was any deceit in his mouth.* The Beloved *crucified together with wicked men* and *buried in the sepulchre* in Ascension of Isaiah 3:13 is the same Servant who makes His grave with the wicked.'),
  -- thread: ascension-isaiah-3-third-day-rising
  ('ascension-isaiah', 'ascension-isaiah', 3, 16, 'canon', '1-corinthians', 15, 4, 'free', E'1 Corinthians 15:4 — *And that he was buried, and that he rose again the third day according to the scriptures:* The sepulchre opened *on the third day* in Ascension of Isaiah 3:16 is the very third-day rising Paul names the heart of the gospel.'),
  ('ascension-isaiah', 'ascension-isaiah', 3, 16, 'canon', 'psalms', 16, 10, 'free', E'Psalm 16:10 — *For thou wilt not leave my soul in hell; neither wilt thou suffer thine Holy One to see corruption.* The Holy One who will not be left to corruption is the Beloved who comes forth from the opened sepulchre in Ascension of Isaiah 3:16.'),
  ('ascension-isaiah', 'ascension-isaiah', 3, 17, 'canon', '1-peter', 3, 18, 'free', E'1 Peter 3:18 — *For Messiah (Christ) also hath once suffered for sins, the just for the unjust, that he might bring us to Elohim (God), being put to death in the flesh, but quickened by the Spirit:* The Beloved who comes forth and sends out His twelve in Ascension of Isaiah 3:17 is the one put to death in the flesh and quickened in the Spirit.'),
  ('ascension-isaiah', 'ascension-isaiah', 3, 17, 'canon', '1-peter', 3, 19, 'free', E'1 Peter 3:19 — *By which also he went and preached unto the spirits in prison;* The descent the prophet saw before the third-day coming-forth of Ascension of Isaiah 3:17 is Peter''s witness to the Beloved preaching to the spirits in prison.'),
  -- thread: ascension-isaiah-3-ascension-and-witness
  ('ascension-isaiah', 'ascension-isaiah', 3, 18, 'canon', 'ephesians', 4, 10, 'free', E'Ephesians 4:10 — *He that descended is the same also that ascended up far above all heavens, that he might fill all things.* The Beloved''s *ascension into the seventh heaven whence He came* in Ascension of Isaiah 3:18 is Paul''s One who descended and ascended far above all heavens.'),
  ('ascension-isaiah', 'ascension-isaiah', 3, 18, 'canon', 'john', 3, 13, 'free', E'John 3:13 — *And no man hath ascended up to heaven, but he that came down from heaven, even the Son of Adam which is in heaven.* The single descent-and-ascent of the Beloved in Ascension of Isaiah 3:18 is the Son of Adam''s unique coming down and going up.'),
  ('ascension-isaiah', 'ascension-isaiah', 3, 18, 'canon', 'philippians', 2, 9, 'free', E'Philippians 2:9 — *Wherefore Elohim (God) also hath highly exalted him, and given him a name which is above every name:* The Beloved who ascends to the seventh heaven in Ascension of Isaiah 3:18 is the humbled One whom God highly exalts.'),
  ('ascension-isaiah', 'ascension-isaiah', 3, 18, 'canon', 'philippians', 2, 11, 'free', E'Philippians 2:11 — *And that every tongue should confess that Yahusha HaMashiach (Jesus Christ) is Lord, to the glory of Elohim (God) the Father.* The disciples teaching *every tongue* of the risen Beloved in Ascension of Isaiah 3:18 is the every-tongue confession Paul says crowns His exaltation.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session403_asci3_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session403_asci3_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-3-false-prophet-accuses',
       E'Belchira the false accuser and the prophet condemned',
       E'The false prophet rises against the true. *And Belchira accused Isaiah and the prophets who were with him, saying: `Isaiah and those who are with him prophesy against Jerusalem and against the cities of Yahudah (Judah) that they shall be laid waste...* (Ascension of Isaiah 3:6), and *Jerusalem also he hath called Sodom, and the princes of Yahudah (Judah) and Jerusalem he hath declared to be the people of Gomorrah* (3:10) — the accusation that will end in Isaiah being sawn asunder. It ain''t new: the Messiah Himself names the city by this same long roll of murdered prophets, *O Jerusalem, Jerusalem, thou that killest the prophets, and stonest them which are sent unto thee* (Matthew 23:37), and gathers *all the righteous blood shed upon the earth, from the blood of righteous Abel* (Matthew 23:35). The blood of Isaiah is part of that very reckoning under Manasseh, *Moreover Manasseh shed innocent blood very much, till he had filled Jerusalem from one end to another* (2 Kings 21:16).',
       sv.verse_id, ev.verse_id, 'extras', 67550
  FROM _session403_asci3_lookup sv, _session403_asci3_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=3 AND sv.verse_number=6
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=3 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-3-beliar-in-manasseh',
       E'Beliar dwelling in the heart of the king',
       E'The adversary works from within the throne. *But Beliar dwelt in the heart of Manasseh and in the heart of the princes of Yahudah (Judah) and Benjamin* (Ascension of Isaiah 3:11), and *For Beliar was in great wrath against Isaiah by reason of the vision, and because of the exposure wherewith he had exposed Sammael* (3:13). It ain''t new: Paul names this same dark prince by this same name, *And what concord hath Messiah (Christ) with Belial? or what part hath he that believeth with an infidel?* (2 Corinthians 6:15). The Beloved unmasks him as the murderer and liar from the first, *He was a murderer from the beginning, and abode not in the truth, because there is no truth in him* (John 8:44) — the very spirit who set the false prophet''s lying words in the king''s heart against Isaiah, and who works *after the working of Satan with all power and signs and lying wonders* (2 Thessalonians 2:9).',
       sv.verse_id, ev.verse_id, 'extras', 67553
  FROM _session403_asci3_lookup sv, _session403_asci3_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=3 AND sv.verse_number=11
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=3 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-3-beloved-descends',
       E'The Beloved''s descent and the likeness of man foreseen',
       E'Here is the pre-Christian wonder: the incarnation read out by a prophet before Hezekiah''s grandson. Isaiah''s vision had made known *the going forth of the Beloved from the seventh heaven... and His transformation and His descent and the likeness into which He should be transformed (that is) the likeness of man, and the persecution wherewith he should be persecuted... and that He should before the sabbath be crucified upon the tree, and should be crucified together with wicked men, and that He should be buried in the sepulchre* (Ascension of Isaiah 3:13). It ain''t new: this is the hymn of Philippi, *Who, being in the form of Elohim (God), thought it not robbery to be equal with Elohim (God): But made himself of no reputation, and took upon him the form of a servant, and was made in the likeness of men* (Philippians 2:6-7), *he humbled himself, and became obedient unto death, even the death of the cross* (Philippians 2:8). The mystery that *Elohim (God) was manifest in the flesh, justified in the Spirit, seen of angels* (1 Timothy 3:16) was sung over the wood-saw centuries before Bethlehem. He who came down crucified with the wicked was buried in the sepulchre, *And he made his grave with the wicked, and with the rich in his death* (Isaiah 53:9).',
       sv.verse_id, ev.verse_id, 'extras', 67556
  FROM _session403_asci3_lookup sv, _session403_asci3_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=3 AND sv.verse_number=13
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=3 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-3-third-day-rising',
       E'The third day, the open sepulchre, and the risen Beloved',
       E'The vision runs on past the grave to the empty tomb. *And that (Gabriel) the angel of the Ruach HaKodesh (Holy Spirit), and Michael, the chief of the holy angels, on the third day will open the sepulchre: And the Beloved sitting on their shoulders will come forth and send out His twelve disciples* (Ascension of Isaiah 3:16-17). It ain''t new: this is the gospel Paul says he received and delivered first of all, *And that he was buried, and that he rose again the third day according to the scriptures* (1 Corinthians 15:4). The third day was sworn in the psalm long before, *For thou wilt not leave my soul in hell; neither wilt thou suffer thine Holy One to see corruption* (Psalm 16:10). And in the days between cross and tomb the Beloved did not lie idle, *being put to death in the flesh, but quickened by the Spirit: By which also he went and preached unto the spirits in prison* (1 Peter 3:18-19) — the descent and the rising the prophet saw whole.',
       sv.verse_id, ev.verse_id, 'extras', 67559
  FROM _session403_asci3_lookup sv, _session403_asci3_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=3 AND sv.verse_number=16
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=3 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-3-ascension-and-witness',
       E'The ascension into the seventh heaven and the gospel of the nations',
       E'The vision ends where it began — the Beloved returns to the heaven He left. The disciples *will teach all the nations and every tongue of the resurrection of the Beloved, and those who believe in His cross will be saved, and in His ascension into the seventh heaven whence He came* (Ascension of Isaiah 3:18). It ain''t new: this is the descent-and-ascent Paul preaches, *Now that he ascended, what is it but that he also descended first into the lower parts of the earth?* (Ephesians 4:9), *He that descended is the same also that ascended up far above all heavens, that he might fill all things* (Ephesians 4:10). The Son of Adam alone makes this round trip, *And no man hath ascended up to heaven, but he that came down from heaven, even the Son of Adam which is in heaven* (John 3:13). And the end of His humbling is His exaltation over all tongues — *Wherefore Elohim (God) also hath highly exalted him, and given him a name which is above every name* (Philippians 2:9), *And that every tongue should confess that Yahusha HaMashiach (Jesus Christ) is Lord, to the glory of Elohim (God) the Father* (Philippians 2:11).',
       sv.verse_id, ev.verse_id, 'extras', 67562
  FROM _session403_asci3_lookup sv, _session403_asci3_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=3 AND sv.verse_number=18
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=3 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ascension-isaiah-3-false-prophet-accuses
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 23:37 — *O Jerusalem, Jerusalem, thou that killest the prophets, and stonest them which are sent unto thee, how often would I have gathered thy children together, even as a hen gathereth her chickens under her wings, and ye would not!* The Beloved names the city by the very crime Belchira here sets in motion against Isaiah in Ascension of Isaiah 3:6.'
  FROM cross_reference_threads t, cross_references x, _session403_asci3_lookup sv, _session403_asci3_lookup tv
 WHERE t.slug='ascension-isaiah-3-false-prophet-accuses'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=3 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=23 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 23:35 — *That upon you may come all the righteous blood shed upon the earth, from the blood of righteous Abel unto the blood of Zacharias son of Barachias, whom ye slew between the temple and the altar.* The slain Isaiah of Ascension of Isaiah 3:10, falsely charged with calling Jerusalem Sodom, belongs to this same righteous blood the city must answer for.'
  FROM cross_reference_threads t, cross_references x, _session403_asci3_lookup sv, _session403_asci3_lookup tv
 WHERE t.slug='ascension-isaiah-3-false-prophet-accuses'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=3 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=23 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Kings 21:16 — *Moreover Manasseh shed innocent blood very much, till he had filled Jerusalem from one end to another; beside his sin wherewith he made Yahudah (Judah) to sin, in doing that which was evil in the sight of Yahuah (LORD).* The canon''s brief notice of Manasseh''s bloodshed is the very deed Ascension of Isaiah 3:10 enlarges, as Belchira brings his accusations before Manasseh.'
  FROM cross_reference_threads t, cross_references x, _session403_asci3_lookup sv, _session403_asci3_lookup tv
 WHERE t.slug='ascension-isaiah-3-false-prophet-accuses'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=3 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=21 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-3-beliar-in-manasseh
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Corinthians 6:15 — *And what concord hath Messiah (Christ) with Belial? or what part hath he that believeth with an infidel?* The Beliar who dwells in Manasseh''s heart in Ascension of Isaiah 3:11 is the same Belial Paul sets in flat opposition to the Messiah.'
  FROM cross_reference_threads t, cross_references x, _session403_asci3_lookup sv, _session403_asci3_lookup tv
 WHERE t.slug='ascension-isaiah-3-beliar-in-manasseh'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=3 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=6 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The murderer-and-liar the Beloved names is the very Beliar driving the false accusation and the king''s wrath in Ascension of Isaiah 3:11.'
  FROM cross_reference_threads t, cross_references x, _session403_asci3_lookup sv, _session403_asci3_lookup tv
 WHERE t.slug='ascension-isaiah-3-beliar-in-manasseh'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=3 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Thessalonians 2:9 — *Even him, whose coming is after the working of Satan with all power and signs and lying wonders,* The lying prophecy and great wrath of Beliar in Ascension of Isaiah 3:13 is the same deceiving power Paul says works through Satan.'
  FROM cross_reference_threads t, cross_references x, _session403_asci3_lookup sv, _session403_asci3_lookup tv
 WHERE t.slug='ascension-isaiah-3-beliar-in-manasseh'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=3 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='2-thessalonians' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-3-beloved-descends
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Philippians 2:7 — *But made himself of no reputation, and took upon him the form of a servant, and was made in the likeness of men:* The very transformation into *the likeness of man* foreseen in Ascension of Isaiah 3:13 is Paul''s confession of the Beloved emptying Himself into the form of a servant.'
  FROM cross_reference_threads t, cross_references x, _session403_asci3_lookup sv, _session403_asci3_lookup tv
 WHERE t.slug='ascension-isaiah-3-beloved-descends'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=3 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Philippians 2:8 — *And being found in fashion as a man, he humbled himself, and became obedient unto death, even the death of the cross.* The descent that ends with the Beloved *crucified upon the tree* in Ascension of Isaiah 3:13 is here the obedience unto the death of the cross.'
  FROM cross_reference_threads t, cross_references x, _session403_asci3_lookup sv, _session403_asci3_lookup tv
 WHERE t.slug='ascension-isaiah-3-beloved-descends'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=3 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Timothy 3:16 — *And without controversy great is the mystery of godliness: Elohim (God) was manifest in the flesh, justified in the Spirit, seen of angels, preached unto the Gentiles, believed on in the world, received up into glory.* The whole arc of Ascension of Isaiah 3:13 — God in the likeness of man, persecuted, then ascended — is Paul''s six-fold mystery of godliness.'
  FROM cross_reference_threads t, cross_references x, _session403_asci3_lookup sv, _session403_asci3_lookup tv
 WHERE t.slug='ascension-isaiah-3-beloved-descends'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=3 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='1-timothy' AND tv.chapter_number=3 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 53:9 — *And he made his grave with the wicked, and with the rich in his death; because he had done no violence, neither was any deceit in his mouth.* The Beloved *crucified together with wicked men* and *buried in the sepulchre* in Ascension of Isaiah 3:13 is the same Servant who makes His grave with the wicked.'
  FROM cross_reference_threads t, cross_references x, _session403_asci3_lookup sv, _session403_asci3_lookup tv
 WHERE t.slug='ascension-isaiah-3-beloved-descends'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=3 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-3-third-day-rising
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Corinthians 15:4 — *And that he was buried, and that he rose again the third day according to the scriptures:* The sepulchre opened *on the third day* in Ascension of Isaiah 3:16 is the very third-day rising Paul names the heart of the gospel.'
  FROM cross_reference_threads t, cross_references x, _session403_asci3_lookup sv, _session403_asci3_lookup tv
 WHERE t.slug='ascension-isaiah-3-third-day-rising'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=3 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 16:10 — *For thou wilt not leave my soul in hell; neither wilt thou suffer thine Holy One to see corruption.* The Holy One who will not be left to corruption is the Beloved who comes forth from the opened sepulchre in Ascension of Isaiah 3:16.'
  FROM cross_reference_threads t, cross_references x, _session403_asci3_lookup sv, _session403_asci3_lookup tv
 WHERE t.slug='ascension-isaiah-3-third-day-rising'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=3 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=16 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Peter 3:18 — *For Messiah (Christ) also hath once suffered for sins, the just for the unjust, that he might bring us to Elohim (God), being put to death in the flesh, but quickened by the Spirit:* The Beloved who comes forth and sends out His twelve in Ascension of Isaiah 3:17 is the one put to death in the flesh and quickened in the Spirit.'
  FROM cross_reference_threads t, cross_references x, _session403_asci3_lookup sv, _session403_asci3_lookup tv
 WHERE t.slug='ascension-isaiah-3-third-day-rising'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=3 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=3 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Peter 3:19 — *By which also he went and preached unto the spirits in prison;* The descent the prophet saw before the third-day coming-forth of Ascension of Isaiah 3:17 is Peter''s witness to the Beloved preaching to the spirits in prison.'
  FROM cross_reference_threads t, cross_references x, _session403_asci3_lookup sv, _session403_asci3_lookup tv
 WHERE t.slug='ascension-isaiah-3-third-day-rising'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=3 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=3 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-3-ascension-and-witness
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ephesians 4:10 — *He that descended is the same also that ascended up far above all heavens, that he might fill all things.* The Beloved''s *ascension into the seventh heaven whence He came* in Ascension of Isaiah 3:18 is Paul''s One who descended and ascended far above all heavens.'
  FROM cross_reference_threads t, cross_references x, _session403_asci3_lookup sv, _session403_asci3_lookup tv
 WHERE t.slug='ascension-isaiah-3-ascension-and-witness'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=3 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=4 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 3:13 — *And no man hath ascended up to heaven, but he that came down from heaven, even the Son of Adam which is in heaven.* The single descent-and-ascent of the Beloved in Ascension of Isaiah 3:18 is the Son of Adam''s unique coming down and going up.'
  FROM cross_reference_threads t, cross_references x, _session403_asci3_lookup sv, _session403_asci3_lookup tv
 WHERE t.slug='ascension-isaiah-3-ascension-and-witness'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=3 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=3 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Philippians 2:9 — *Wherefore Elohim (God) also hath highly exalted him, and given him a name which is above every name:* The Beloved who ascends to the seventh heaven in Ascension of Isaiah 3:18 is the humbled One whom God highly exalts.'
  FROM cross_reference_threads t, cross_references x, _session403_asci3_lookup sv, _session403_asci3_lookup tv
 WHERE t.slug='ascension-isaiah-3-ascension-and-witness'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=3 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Philippians 2:11 — *And that every tongue should confess that Yahusha HaMashiach (Jesus Christ) is Lord, to the glory of Elohim (God) the Father.* The disciples teaching *every tongue* of the risen Beloved in Ascension of Isaiah 3:18 is the every-tongue confession Paul says crowns His exaltation.'
  FROM cross_reference_threads t, cross_references x, _session403_asci3_lookup sv, _session403_asci3_lookup tv
 WHERE t.slug='ascension-isaiah-3-ascension-and-witness'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=3 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ascensionisaiah_04.sql (session403 ascension-isaiah 4) -----
-- Source anchor: ascension-isaiah/ascension-isaiah ch4. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: asci4 (view _session403_asci4_lookup). Sort band base 67575, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session403_asci4_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ascension-isaiah-4-beliar-lawless-king
  ('ascension-isaiah', 'ascension-isaiah', 4, 2, 'canon', '2-thessalonians', 2, 3, 'free', E'2 Thessalonians 2:3 — *Let no man deceive you by any means: for that day shall not come, except there come a falling away first, and that man of sin be revealed, the son of perdition;* Paul''s lawless man of sin is the very Beliar Isaiah sees descending in the likeness of a man in Ascension of Isaiah 4:2.'),
  ('ascension-isaiah', 'ascension-isaiah', 4, 2, 'canon', '1-john', 2, 18, 'free', E'1 John 2:18 — *Little children, it is the last time: and as ye have heard that antichrist shall come, even now are there many antichrists; whereby we know that it is the last time.* The expected antichrist John names is the king of this world whose descent Isaiah foresees in Ascension of Isaiah 4:2.'),
  ('ascension-isaiah', 'ascension-isaiah', 4, 2, 'canon', 'revelation', 13, 1, 'free', E'Revelation 13:1 — *And I stood upon the sand of the sea, and saw a beast rise up out of the sea, having seven heads and ten horns, and upon his horns ten crowns, and upon his heads the name of blasphemy.* John''s blaspheming beast is the same world-ruler Isaiah watches descend as a lawless king in Ascension of Isaiah 4:2.'),
  ('ascension-isaiah', 'ascension-isaiah', 4, 2, 'canon', 'matthew', 24, 4, 'free', E'Matthew 24:4 — *And Yahusha (Jesus) answered and said unto them, Take heed that no man deceive you.* Yahusha''s warning against the deceiver answers the descent of Beliar in the likeness of a man in Ascension of Isaiah 4:2.'),
  -- thread: ascension-isaiah-4-i-am-god
  ('ascension-isaiah', 'ascension-isaiah', 4, 6, 'canon', '2-thessalonians', 2, 4, 'free', E'2 Thessalonians 2:4 — *Who opposeth and exalteth himself above all that is called Elohim (God), or that is worshipped; so that he as Elohim (God) sitteth in the temple of Elohim (God), shewing himself that he is Elohim (God).* Paul''s self-deifying man of sin speaks the very boast Beliar makes — ''I am Elohim'' — in Ascension of Isaiah 4:6.'),
  ('ascension-isaiah', 'ascension-isaiah', 4, 7, 'canon', 'revelation', 13, 4, 'free', E'Revelation 13:4 — *And they worshipped the dragon which gave power unto the beast: and they worshipped the beast, saying, Who is like unto the beast? who is able to make war with him?* John''s whole-world worship of the beast is the universal belief Isaiah foresees in Ascension of Isaiah 4:7.'),
  ('ascension-isaiah', 'ascension-isaiah', 4, 8, 'canon', 'matthew', 24, 24, 'free', E'Matthew 24:24 — *For there shall arise false Christs, and false prophets, and shall shew great signs and wonders; insomuch that, if it were possible, they shall deceive the very elect.* Yahusha''s false christs who counterfeit signs match the one who speaks like the Beloved and is served as God in Ascension of Isaiah 4:8.'),
  -- thread: ascension-isaiah-4-lying-wonders-image
  ('ascension-isaiah', 'ascension-isaiah', 4, 10, 'canon', '2-thessalonians', 2, 9, 'free', E'2 Thessalonians 2:9 — *Even him, whose coming is after the working of Satan with all power and signs and lying wonders,* Paul''s lying wonders are the miracles in every city that Isaiah foresees in Ascension of Isaiah 4:10.'),
  ('ascension-isaiah', 'ascension-isaiah', 4, 11, 'canon', 'revelation', 13, 14, 'free', E'Revelation 13:14 — *And deceiveth them that dwell on the earth by the means of those miracles which he had power to do in the sight of the beast; saying to them that dwell on the earth, that they should make an image to the beast, which had the wound by a sword, and did live.* The image men are made to worship is the very image Beliar sets up in every city in Ascension of Isaiah 4:11.'),
  ('ascension-isaiah', 'ascension-isaiah', 4, 5, 'canon', 'revelation', 13, 13, 'free', E'Revelation 13:13 — *And he doeth great wonders, so that he maketh fire come down from heaven on the earth in the sight of men,* the cosmic forgeries — fire from heaven — match Beliar making the sun rise at night and the moon appear at noon in Ascension of Isaiah 4:5.'),
  -- thread: ascension-isaiah-4-saints-flee-desert
  ('ascension-isaiah', 'ascension-isaiah', 4, 13, 'canon', 'matthew', 24, 16, 'free', E'Matthew 24:16 — *Then let them which be in Judaea flee into the mountains:* Yahusha''s command to flee is the very flight ''from desert to desert'' of the remnant awaiting the Beloved in Ascension of Isaiah 4:13.'),
  ('ascension-isaiah', 'ascension-isaiah', 4, 13, 'canon', 'matthew', 24, 22, 'free', E'Matthew 24:22 — *And except those days should be shortened, there should no flesh be saved: but for the elect''s sake those days shall be shortened.* The shortening for the elect''s sake matches the few servants Isaiah says are left as they flee in Ascension of Isaiah 4:13.'),
  ('ascension-isaiah', 'ascension-isaiah', 4, 12, 'canon', 'revelation', 13, 5, 'free', E'Revelation 13:5 — *And there was given unto him a mouth speaking great things and blasphemies; and power was given unto him to continue forty and two months.* The beast''s fixed forty-two-month tyranny matches the measured reign Beliar bears in Ascension of Isaiah 4:12.'),
  -- thread: ascension-isaiah-4-Lord-comes-beliar-gehenna
  ('ascension-isaiah', 'ascension-isaiah', 4, 14, 'canon', 'revelation', 19, 20, 'free', E'Revelation 19:20 — *And the beast was taken, and with him the false prophet that wrought miracles before him, with which he deceived them that had received the mark of the beast, and them that worshipped his image. These both were cast alive into a lake of fire burning with brimstone.* John''s casting of the beast into the fiery lake is the Lord dragging Beliar into Gehenna in Ascension of Isaiah 4:14.'),
  ('ascension-isaiah', 'ascension-isaiah', 4, 14, 'canon', '2-thessalonians', 2, 8, 'free', E'2 Thessalonians 2:8 — *And then shall that Wicked be revealed, whom Yahuah (Lord) shall consume with the spirit of his mouth, and shall destroy with the brightness of his coming:* Paul''s destruction of the Wicked by the Lord''s coming is the same drag of Beliar into Gehenna in Ascension of Isaiah 4:14.'),
  ('ascension-isaiah', 'ascension-isaiah', 4, 14, 'canon', 'jude', 1, 14, 'free', E'Jude 1:14 — *And Enoch also, the seventh from Adam, prophesied of these, saying, Behold, Yahuah (Lord) cometh with ten thousands of his saints,* Jude''s citation of Enoch''s coming-with-saints matches the Lord coming with the armies of the holy ones in Ascension of Isaiah 4:14.'),
  ('ascension-isaiah', 'ascension-isaiah', 4, 14, 'canon', 'revelation', 19, 14, 'free', E'Revelation 19:14 — *And the armies which were in heaven followed him upon white horses, clothed in fine linen, white and clean.* The heavenly armies following the Word are the armies of the holy ones who come from the seventh heaven in Ascension of Isaiah 4:14.'),
  -- thread: ascension-isaiah-4-saints-descend-garments
  ('ascension-isaiah', 'ascension-isaiah', 4, 16, 'canon', '1-thessalonians', 4, 16, 'free', E'1 Thessalonians 4:16 — *For Yahuah (Lord) himself shall descend from heaven with a shout, with the voice of the archangel, and with the trump of Elohim (God): and the dead in Messiah (Christ) shall rise first:* Paul''s descent of the Lord with the dead rising is the saints coming with Yahuah from the seventh heaven in Ascension of Isaiah 4:16.'),
  ('ascension-isaiah', 'ascension-isaiah', 4, 17, 'canon', '1-thessalonians', 4, 17, 'free', E'1 Thessalonians 4:17 — *Then we which are alive and remain shall be caught up together with them in the clouds, to meet Yahuah (Lord) in the air: and so shall we ever be with Yahuah (Lord).* The catching-up to meet the Lord is the saints turning themselves upward in their garments in Ascension of Isaiah 4:17.'),
  ('ascension-isaiah', 'ascension-isaiah', 4, 16, 'canon', 'revelation', 19, 8, 'free', E'Revelation 19:8 — *And to her was granted that she should be arrayed in fine linen, clean and white: for the fine linen is the righteousness of saints.* John''s white linen of the saints is the garments stored up on high that Isaiah''s saints come clothed in, in Ascension of Isaiah 4:16.'),
  -- thread: ascension-isaiah-4-resurrection-judgment-fire
  ('ascension-isaiah', 'ascension-isaiah', 4, 18, 'canon', 'daniel', 12, 2, 'free', E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* Daniel''s awakening of the sleepers to life or contempt is the resurrection and judgment Isaiah foresees in Ascension of Isaiah 4:18.'),
  ('ascension-isaiah', 'ascension-isaiah', 4, 18, 'canon', 'revelation', 20, 9, 'free', E'Revelation 20:9 — *And they went up on the breadth of the earth, and compassed the camp of the saints about, and the beloved city: and fire came down from Elohim (God) out of heaven, and devoured them.* The fire from heaven that devours the wicked is the fire the Beloved causes to go forth and consume the godless in Ascension of Isaiah 4:18.'),
  ('ascension-isaiah', 'ascension-isaiah', 4, 18, 'canon', 'revelation', 20, 12, 'free', E'Revelation 20:12 — *And I saw the dead, small and great, stand before Elohim (God); and the books were opened: and another book was opened, which is the book of life: and the dead were judged out of those things which were written in the books, according to their works.* John''s throne-judgment of the dead is the judgment in their midst Isaiah sees in Ascension of Isaiah 4:18.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session403_asci4_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session403_asci4_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-4-beliar-lawless-king',
       E'Beliar descends — the lawless king, the son of perdition',
       E'*Beliar the great ruler, the king of this world, will descend, who hath ruled it since it came into being; yea, he will descent from his firmament in the likeness of a man, a lawless king, the slayer of his mother* (Ascension of Isaiah 4:2). Centuries before Paul, Isaiah sees the adversary clothing himself in a man and ruling as a *lawless king* — it ain''t new. Paul calls him *that man of sin... the son of perdition* (2 Thessalonians 2:3), and John, *as ye have heard that antichrist shall come, even now are there many antichrists* (1 John 2:18). Yahusha forewarned the deceit: *Take heed that no man deceive you* (Matthew 24:4), and the beast that rises *out of the sea* with *the name of blasphemy* upon him (Revelation 13:1) is the same lawless one wearing flesh.',
       sv.verse_id, ev.verse_id, 'extras', 67575
  FROM _session403_asci4_lookup sv, _session403_asci4_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=4 AND sv.verse_number=2
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=4 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-4-i-am-god',
       E'He says ''I am God'' — the false christ exalted in the temple',
       E'The lawless one *will do and speak like the Beloved and he will say: "I am Elohim (God) and before me there has been none"* (Ascension of Isaiah 4:6), and *all the people in the world will believe in him* (4:7), serving him: *"This is Elohim (God) and beside him there is no other"* (4:8). This is the self-deifying blasphemy Paul names exactly: he *exalteth himself above all that is called Elohim (God)... so that he as Elohim (God) sitteth in the temple of Elohim (God)* (2 Thessalonians 2:4). The whole earth wonders and *worshipped the beast* (Revelation 13:4), and false christs *shew great signs and wonders; insomuch that, if it were possible, they shall deceive the very elect* (Matthew 24:24). The counterfeit aping of the Beloved is no new thing under the sun.',
       sv.verse_id, ev.verse_id, 'extras', 67578
  FROM _session403_asci4_lookup sv, _session403_asci4_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=4 AND sv.verse_number=6
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=4 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-4-lying-wonders-image',
       E'Lying wonders and the image set up in every city',
       E'*At his word the sun will rise at night and he will make the moon to appear at the sixth hour* (Ascension of Isaiah 4:5); *there will be the power of his miracles in every city and region* (4:10), and *he will set up his image before him in every city* (4:11). The forged signs and the demanded image are exactly the second beast''s work: *he doeth great wonders, so that he maketh fire come down from heaven on the earth in the sight of men* (Revelation 13:13), and he commands *that they should make an image to the beast* (Revelation 13:14). Paul calls it a coming *after the working of Satan with all power and signs and lying wonders* (2 Thessalonians 2:9) — the counterfeit was foreseen long before.',
       sv.verse_id, ev.verse_id, 'extras', 67581
  FROM _session403_asci4_lookup sv, _session403_asci4_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=4 AND sv.verse_number=5
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=4 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-4-saints-flee-desert',
       E'The faithful few flee desert to desert, awaiting the Beloved',
       E'Of the believers in the crucified one — *Yahusha (Jesus) Yahuah (Lord) Messiah (Christ)* — *few in those days will be left as His servants, while they flee from desert to desert, awaiting the coming of the Beloved* (Ascension of Isaiah 4:13), under his reign of *three years and seven months and twenty-seven days* (4:12). This is the persecuted, fleeing remnant Yahusha foretold: *Then let them which be in Judaea flee into the mountains* (Matthew 24:16), and *except those days should be shortened, there should no flesh be saved: but for the elect''s sake those days shall be shortened* (Matthew 24:22). The beast is given *power... to continue forty and two months* (Revelation 13:5) — the same hemmed-in season of the saints'' patience.',
       sv.verse_id, ev.verse_id, 'extras', 67584
  FROM _session403_asci4_lookup sv, _session403_asci4_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=4 AND sv.verse_number=12
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=4 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-4-Lord-comes-beliar-gehenna',
       E'The Lord comes with His armies and drags Beliar into Gehenna',
       E'*Yahuah (Lord) will come with His angels and with the armies of the holy ones from the seventh heaven with the glory of the seventh heaven, and He will drag Beliar into Gehenna and also his armies* (Ascension of Isaiah 4:14). This is the descent of the Word with His hosts to destroy the lawless one: *the armies which were in heaven followed him upon white horses* (Revelation 19:14), and the beast and false prophet *were cast alive into a lake of fire burning with brimstone* (Revelation 19:20). Paul: *that Wicked... whom Yahuah (Lord) shall consume with the spirit of his mouth, and shall destroy with the brightness of his coming* (2 Thessalonians 2:8). Enoch the seventh from Adam said the same — *Behold, Yahuah (Lord) cometh with ten thousands of his saints* (Jude 14). It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 67587
  FROM _session403_asci4_lookup sv, _session403_asci4_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=4 AND sv.verse_number=14
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=4 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-4-saints-descend-garments',
       E'The saints descend in their garments — the gathering and the rest',
       E'*The saints will come with Yahuah (Lord) with their garments which are (now) stored up on high in the seventh heaven... they will descend and be present in the world... and Yahuah (Lord) will minister to those who have kept watch in this world* (Ascension of Isaiah 4:16), and *afterwards they will turn themselves upward in their garments* (4:17). Paul tells the same mystery: *Yahuah (Lord) himself shall descend from heaven with a shout... and the dead in Messiah (Christ) shall rise first* (1 Thessalonians 4:16), and *we which are alive and remain shall be caught up together with them in the clouds, to meet Yahuah (Lord) in the air* (1 Thessalonians 4:17). The garments of white are *the righteousness of saints* (Revelation 19:8) — the watch-keepers'' reward is no new doctrine.',
       sv.verse_id, ev.verse_id, 'extras', 67590
  FROM _session403_asci4_lookup sv, _session403_asci4_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=4 AND sv.verse_number=16
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=4 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-4-resurrection-judgment-fire',
       E'Resurrection, judgment, and the fire that consumes the godless',
       E'*There will be a resurrection and a judgment in their midst in those days, and the Beloved will cause fire to go forth from Him, and it will consume all the godless, and they will be as though they had not been created* (Ascension of Isaiah 4:18). Daniel saw the awakening: *many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt* (Daniel 12:2). John saw the throne and the books: *the dead were judged out of those things which were written in the books, according to their works* (Revelation 20:12), and the consuming fire: *fire came down from Elohim (God) out of heaven, and devoured them* (Revelation 20:9). The resurrection-judgment by fire is older than the gospel that proclaims it.',
       sv.verse_id, ev.verse_id, 'extras', 67593
  FROM _session403_asci4_lookup sv, _session403_asci4_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=4 AND sv.verse_number=18
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=4 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ascension-isaiah-4-beliar-lawless-king
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Thessalonians 2:3 — *Let no man deceive you by any means: for that day shall not come, except there come a falling away first, and that man of sin be revealed, the son of perdition;* Paul''s lawless man of sin is the very Beliar Isaiah sees descending in the likeness of a man in Ascension of Isaiah 4:2.'
  FROM cross_reference_threads t, cross_references x, _session403_asci4_lookup sv, _session403_asci4_lookup tv
 WHERE t.slug='ascension-isaiah-4-beliar-lawless-king'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=4 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='2-thessalonians' AND tv.chapter_number=2 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 John 2:18 — *Little children, it is the last time: and as ye have heard that antichrist shall come, even now are there many antichrists; whereby we know that it is the last time.* The expected antichrist John names is the king of this world whose descent Isaiah foresees in Ascension of Isaiah 4:2.'
  FROM cross_reference_threads t, cross_references x, _session403_asci4_lookup sv, _session403_asci4_lookup tv
 WHERE t.slug='ascension-isaiah-4-beliar-lawless-king'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=4 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=2 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 13:1 — *And I stood upon the sand of the sea, and saw a beast rise up out of the sea, having seven heads and ten horns, and upon his horns ten crowns, and upon his heads the name of blasphemy.* John''s blaspheming beast is the same world-ruler Isaiah watches descend as a lawless king in Ascension of Isaiah 4:2.'
  FROM cross_reference_threads t, cross_references x, _session403_asci4_lookup sv, _session403_asci4_lookup tv
 WHERE t.slug='ascension-isaiah-4-beliar-lawless-king'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=4 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=13 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 24:4 — *And Yahusha (Jesus) answered and said unto them, Take heed that no man deceive you.* Yahusha''s warning against the deceiver answers the descent of Beliar in the likeness of a man in Ascension of Isaiah 4:2.'
  FROM cross_reference_threads t, cross_references x, _session403_asci4_lookup sv, _session403_asci4_lookup tv
 WHERE t.slug='ascension-isaiah-4-beliar-lawless-king'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=4 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-4-i-am-god
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Thessalonians 2:4 — *Who opposeth and exalteth himself above all that is called Elohim (God), or that is worshipped; so that he as Elohim (God) sitteth in the temple of Elohim (God), shewing himself that he is Elohim (God).* Paul''s self-deifying man of sin speaks the very boast Beliar makes — ''I am Elohim'' — in Ascension of Isaiah 4:6.'
  FROM cross_reference_threads t, cross_references x, _session403_asci4_lookup sv, _session403_asci4_lookup tv
 WHERE t.slug='ascension-isaiah-4-i-am-god'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=4 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='2-thessalonians' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 13:4 — *And they worshipped the dragon which gave power unto the beast: and they worshipped the beast, saying, Who is like unto the beast? who is able to make war with him?* John''s whole-world worship of the beast is the universal belief Isaiah foresees in Ascension of Isaiah 4:7.'
  FROM cross_reference_threads t, cross_references x, _session403_asci4_lookup sv, _session403_asci4_lookup tv
 WHERE t.slug='ascension-isaiah-4-i-am-god'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=4 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=13 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 24:24 — *For there shall arise false Christs, and false prophets, and shall shew great signs and wonders; insomuch that, if it were possible, they shall deceive the very elect.* Yahusha''s false christs who counterfeit signs match the one who speaks like the Beloved and is served as God in Ascension of Isaiah 4:8.'
  FROM cross_reference_threads t, cross_references x, _session403_asci4_lookup sv, _session403_asci4_lookup tv
 WHERE t.slug='ascension-isaiah-4-i-am-god'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=4 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-4-lying-wonders-image
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Thessalonians 2:9 — *Even him, whose coming is after the working of Satan with all power and signs and lying wonders,* Paul''s lying wonders are the miracles in every city that Isaiah foresees in Ascension of Isaiah 4:10.'
  FROM cross_reference_threads t, cross_references x, _session403_asci4_lookup sv, _session403_asci4_lookup tv
 WHERE t.slug='ascension-isaiah-4-lying-wonders-image'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=4 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='2-thessalonians' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 13:14 — *And deceiveth them that dwell on the earth by the means of those miracles which he had power to do in the sight of the beast; saying to them that dwell on the earth, that they should make an image to the beast, which had the wound by a sword, and did live.* The image men are made to worship is the very image Beliar sets up in every city in Ascension of Isaiah 4:11.'
  FROM cross_reference_threads t, cross_references x, _session403_asci4_lookup sv, _session403_asci4_lookup tv
 WHERE t.slug='ascension-isaiah-4-lying-wonders-image'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=4 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=13 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 13:13 — *And he doeth great wonders, so that he maketh fire come down from heaven on the earth in the sight of men,* the cosmic forgeries — fire from heaven — match Beliar making the sun rise at night and the moon appear at noon in Ascension of Isaiah 4:5.'
  FROM cross_reference_threads t, cross_references x, _session403_asci4_lookup sv, _session403_asci4_lookup tv
 WHERE t.slug='ascension-isaiah-4-lying-wonders-image'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=4 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=13 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-4-saints-flee-desert
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 24:16 — *Then let them which be in Judaea flee into the mountains:* Yahusha''s command to flee is the very flight ''from desert to desert'' of the remnant awaiting the Beloved in Ascension of Isaiah 4:13.'
  FROM cross_reference_threads t, cross_references x, _session403_asci4_lookup sv, _session403_asci4_lookup tv
 WHERE t.slug='ascension-isaiah-4-saints-flee-desert'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=4 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 24:22 — *And except those days should be shortened, there should no flesh be saved: but for the elect''s sake those days shall be shortened.* The shortening for the elect''s sake matches the few servants Isaiah says are left as they flee in Ascension of Isaiah 4:13.'
  FROM cross_reference_threads t, cross_references x, _session403_asci4_lookup sv, _session403_asci4_lookup tv
 WHERE t.slug='ascension-isaiah-4-saints-flee-desert'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=4 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 13:5 — *And there was given unto him a mouth speaking great things and blasphemies; and power was given unto him to continue forty and two months.* The beast''s fixed forty-two-month tyranny matches the measured reign Beliar bears in Ascension of Isaiah 4:12.'
  FROM cross_reference_threads t, cross_references x, _session403_asci4_lookup sv, _session403_asci4_lookup tv
 WHERE t.slug='ascension-isaiah-4-saints-flee-desert'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=4 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=13 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-4-Lord-comes-beliar-gehenna
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 19:20 — *And the beast was taken, and with him the false prophet that wrought miracles before him, with which he deceived them that had received the mark of the beast, and them that worshipped his image. These both were cast alive into a lake of fire burning with brimstone.* John''s casting of the beast into the fiery lake is the Lord dragging Beliar into Gehenna in Ascension of Isaiah 4:14.'
  FROM cross_reference_threads t, cross_references x, _session403_asci4_lookup sv, _session403_asci4_lookup tv
 WHERE t.slug='ascension-isaiah-4-Lord-comes-beliar-gehenna'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=4 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=19 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Thessalonians 2:8 — *And then shall that Wicked be revealed, whom Yahuah (Lord) shall consume with the spirit of his mouth, and shall destroy with the brightness of his coming:* Paul''s destruction of the Wicked by the Lord''s coming is the same drag of Beliar into Gehenna in Ascension of Isaiah 4:14.'
  FROM cross_reference_threads t, cross_references x, _session403_asci4_lookup sv, _session403_asci4_lookup tv
 WHERE t.slug='ascension-isaiah-4-Lord-comes-beliar-gehenna'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=4 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='2-thessalonians' AND tv.chapter_number=2 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jude 1:14 — *And Enoch also, the seventh from Adam, prophesied of these, saying, Behold, Yahuah (Lord) cometh with ten thousands of his saints,* Jude''s citation of Enoch''s coming-with-saints matches the Lord coming with the armies of the holy ones in Ascension of Isaiah 4:14.'
  FROM cross_reference_threads t, cross_references x, _session403_asci4_lookup sv, _session403_asci4_lookup tv
 WHERE t.slug='ascension-isaiah-4-Lord-comes-beliar-gehenna'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=4 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 19:14 — *And the armies which were in heaven followed him upon white horses, clothed in fine linen, white and clean.* The heavenly armies following the Word are the armies of the holy ones who come from the seventh heaven in Ascension of Isaiah 4:14.'
  FROM cross_reference_threads t, cross_references x, _session403_asci4_lookup sv, _session403_asci4_lookup tv
 WHERE t.slug='ascension-isaiah-4-Lord-comes-beliar-gehenna'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=4 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=19 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-4-saints-descend-garments
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Thessalonians 4:16 — *For Yahuah (Lord) himself shall descend from heaven with a shout, with the voice of the archangel, and with the trump of Elohim (God): and the dead in Messiah (Christ) shall rise first:* Paul''s descent of the Lord with the dead rising is the saints coming with Yahuah from the seventh heaven in Ascension of Isaiah 4:16.'
  FROM cross_reference_threads t, cross_references x, _session403_asci4_lookup sv, _session403_asci4_lookup tv
 WHERE t.slug='ascension-isaiah-4-saints-descend-garments'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=4 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='1-thessalonians' AND tv.chapter_number=4 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Thessalonians 4:17 — *Then we which are alive and remain shall be caught up together with them in the clouds, to meet Yahuah (Lord) in the air: and so shall we ever be with Yahuah (Lord).* The catching-up to meet the Lord is the saints turning themselves upward in their garments in Ascension of Isaiah 4:17.'
  FROM cross_reference_threads t, cross_references x, _session403_asci4_lookup sv, _session403_asci4_lookup tv
 WHERE t.slug='ascension-isaiah-4-saints-descend-garments'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=4 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='1-thessalonians' AND tv.chapter_number=4 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 19:8 — *And to her was granted that she should be arrayed in fine linen, clean and white: for the fine linen is the righteousness of saints.* John''s white linen of the saints is the garments stored up on high that Isaiah''s saints come clothed in, in Ascension of Isaiah 4:16.'
  FROM cross_reference_threads t, cross_references x, _session403_asci4_lookup sv, _session403_asci4_lookup tv
 WHERE t.slug='ascension-isaiah-4-saints-descend-garments'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=4 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=19 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-4-resurrection-judgment-fire
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* Daniel''s awakening of the sleepers to life or contempt is the resurrection and judgment Isaiah foresees in Ascension of Isaiah 4:18.'
  FROM cross_reference_threads t, cross_references x, _session403_asci4_lookup sv, _session403_asci4_lookup tv
 WHERE t.slug='ascension-isaiah-4-resurrection-judgment-fire'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=4 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 20:9 — *And they went up on the breadth of the earth, and compassed the camp of the saints about, and the beloved city: and fire came down from Elohim (God) out of heaven, and devoured them.* The fire from heaven that devours the wicked is the fire the Beloved causes to go forth and consume the godless in Ascension of Isaiah 4:18.'
  FROM cross_reference_threads t, cross_references x, _session403_asci4_lookup sv, _session403_asci4_lookup tv
 WHERE t.slug='ascension-isaiah-4-resurrection-judgment-fire'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=4 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 20:12 — *And I saw the dead, small and great, stand before Elohim (God); and the books were opened: and another book was opened, which is the book of life: and the dead were judged out of those things which were written in the books, according to their works.* John''s throne-judgment of the dead is the judgment in their midst Isaiah sees in Ascension of Isaiah 4:18.'
  FROM cross_reference_threads t, cross_references x, _session403_asci4_lookup sv, _session403_asci4_lookup tv
 WHERE t.slug='ascension-isaiah-4-resurrection-judgment-fire'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=4 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ascensionisaiah_05.sql (session403 ascension-isaiah 5) -----
-- Source anchor: ascension-isaiah/ascension-isaiah ch5. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: asci5 (view _session403_asci5_lookup). Sort band base 67600, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session403_asci5_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ascension-isaiah-5-sawn-asunder
  ('ascension-isaiah', 'ascension-isaiah', 5, 11, 'canon', 'hebrews', 11, 37, 'free', E'Hebrews 11:37 — *They were stoned, they were sawn asunder, were tempted, were slain with the sword: they wandered about in sheepskins and goatskins; being destitute, afflicted, tormented;* The lone canon witness to the wood-saw martyrdom records exactly Isaiah''s death in 5:11.'),
  ('ascension-isaiah', 'ascension-isaiah', 5, 2, 'canon', 'matthew', 23, 31, 'free', E'Matthew 23:31 — *Wherefore ye be witnesses unto yourselves, that ye are the children of them which killed the prophets.* The false prophets laughing and rejoicing at Isaiah''s death (5:2) are the same lineage the Beloved indicts.'),
  ('ascension-isaiah', 'ascension-isaiah', 5, 12, 'canon', 'acts', 7, 52, 'free', E'Acts 7:52 — *Which of the prophets have not your fathers persecuted? and they have slain them which shewed before of the coming of the Just One; of whom ye have been now the betrayers and murderers:* Manasseh, the princes, and all the people looking on (5:12) stand in the company Stephen names before the council.'),
  ('ascension-isaiah', 'ascension-isaiah', 5, 14, 'canon', 'revelation', 6, 9, 'free', E'Revelation 6:9 — *And when he had opened the fifth seal, I saw under the altar the souls of them that were slain for the word of Elohim (God), and for the testimony which they held:* Isaiah''s lips speaking by the Ruach until the end (5:14) place him among the slain who keep the testimony.'),
  -- thread: ascension-isaiah-5-beliar-sammael-seed-war
  ('ascension-isaiah', 'ascension-isaiah', 5, 1, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Beliar dwelling in Manasseh''s heart to saw Isaiah (5:1) is the serpent''s enmity against the woman''s seed working in history.'),
  ('ascension-isaiah', 'ascension-isaiah', 5, 15, 'canon', '2-thessalonians', 2, 3, 'free', E'2 Thessalonians 2:3 — *Let no man deceive you by any means: for that day shall not come, except there come a falling away first, and that man of sin be revealed, the son of perdition;* The apostasy under Manasseh that Sammael drives (5:15) is the falling away whose pattern the man of sin fulfills.'),
  ('ascension-isaiah', 'ascension-isaiah', 5, 16, 'canon', '2-thessalonians', 2, 9, 'free', E'2 Thessalonians 2:9 — *Even him, whose coming is after the working of Satan with all power and signs and lying wonders,* Isaiah doing nothing and Beliar doing all ''according to the will of Satan'' (5:16) names the very engine Paul names.'),
  ('ascension-isaiah', 'ascension-isaiah', 5, 15, 'canon', 'revelation', 13, 7, 'free', E'Revelation 13:7 — *And it was given unto him to make war with the saints, and to overcome them: and power was given him over all kindreds, and tongues, and nations.* Sammael''s wrath against the saint who beheld the Beloved (5:15) is the beast''s war on the saints in seed-form.'),
  -- thread: ascension-isaiah-5-prophets-flee-remnant
  ('ascension-isaiah', 'ascension-isaiah', 5, 13, 'canon', '1-kings', 19, 18, 'free', E'1 Kings 19:18 — *Yet I have left me seven thousand in Yashar''el (Israel), all the knees which have not bowed unto Baal, and every mouth which hath not kissed him.* The prophets sent to Tyre and Sidon (5:13) are the preserved remnant who never bowed, as in Elijah''s day.'),
  ('ascension-isaiah', 'ascension-isaiah', 5, 13, 'canon', 'revelation', 12, 6, 'free', E'Revelation 12:6 — *And the woman fled into the wilderness, where she hath a place prepared of Elohim (God), that they should feed her there a thousand two hundred and threescore days.* The faithful fleeing the murderous city (5:13) is the woman fleeing to the place Elohim prepares.'),
  ('ascension-isaiah', 'ascension-isaiah', 5, 13, 'canon', 'hebrews', 11, 38, 'free', E'Hebrews 11:38 — *(Of whom the world was not worthy:) they wandered in deserts, and in mountains, and in dens and caves of the earth.* The scattered prophets of 5:13 are these wanderers the world was not worthy of, kin to the sawn-asunder of the next verse.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session403_asci5_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session403_asci5_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-5-sawn-asunder',
       E'They sawed him in sunder — the martyr-prophet',
       E'*And when Isaiah was being sawn in sunder, he neither cried aloud nor wept, but his lips spake with the Ruach HaKodesh (Holy Spirit) until he was sawn in twain.* (Ascension of Isaiah 5:14). It ain''t new: the roll of the faithful in Hebrews names this very death — *They were stoned, they were sawn asunder, were tempted, were slain with the sword: they wandered about in sheepskins and goatskins; being destitute, afflicted, tormented;* (Hebrews 11:37). The Beloved Himself names the slaying of the prophets as the city''s inheritance — *Wherefore ye be witnesses unto yourselves, that ye are the children of them which killed the prophets.* (Matthew 23:31). Stephen lays the same charge: *Which of the prophets have not your fathers persecuted? and they have slain them which shewed before of the coming of the Just One; of whom ye have been now the betrayers and murderers:* (Acts 7:52). And the souls under the altar still cry — *And when he had opened the fifth seal, I saw under the altar the souls of them that were slain for the word of Elohim (God), and for the testimony which they held:* (Revelation 6:9). Isaiah is one of these, foretelling the suffering Righteous One he would one day be joined to.',
       sv.verse_id, ev.verse_id, 'extras', 67600
  FROM _session403_asci5_lookup sv, _session403_asci5_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=5 AND sv.verse_number=11
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=5 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-5-beliar-sammael-seed-war',
       E'Beliar in the heart of Manasseh — the seed-war',
       E'*This, Beliar did to Isaiah through Belchira and Manasseh; for Sammael was very wrathful against Isaiah from the days of Hezekiah, king of Yahudah (Judah), on account of the things which he had seen regarding the Beloved.* (Ascension of Isaiah 5:15). The wrath of Sammael against the prophet who had seen the Beloved is the old enmity, decreed in the garden — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* (Genesis 3:15). The adversary dwelling in the heart of an apostate king and working through a false prophet is the pattern Paul calls the man of sin — *Let no man deceive you by any means: for that day shall not come, except there come a falling away first, and that man of sin be revealed, the son of perdition;* (2 Thessalonians 2:3) — *Even him, whose coming is after the working of Satan with all power and signs and lying wonders,* (2 Thessalonians 2:9). And John sees the same spirit given a mouth and a war — *And it was given unto him to make war with the saints, and to overcome them: and power was given him over all kindreds, and tongues, and nations.* (Revelation 13:7). Beliar/Sammael is ha-satan; the saw is one strike in the war on the seed.',
       sv.verse_id, ev.verse_id, 'extras', 67603
  FROM _session403_asci5_lookup sv, _session403_asci5_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=5 AND sv.verse_number=1
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=5 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-5-prophets-flee-remnant',
       E'Go ye to Tyre and Sidon — the remnant scattered',
       E'*And to the prophets who were with him he said before he had been sawn in sunder: "Go ye to the region of Tyre and Sidon; for for me only hath Elohim (God) mingled the cup."* (Ascension of Isaiah 5:13). The faithful prophets are sent away to live while the city kills its seer — the remnant that does not bow. It ain''t new: when Elijah thought himself alone, the answer was a hidden remnant — *Yet I have left me seven thousand in Yashar''el (Israel), all the knees which have not bowed unto Baal, and every mouth which hath not kissed him.* (1 Kings 19:18). The faithful flee the apostate city into the wilderness — *And the woman fled into the wilderness, where she hath a place prepared of Elohim (God), that they should feed her there a thousand two hundred and threescore days.* (Revelation 12:6) — the same of whom Hebrews says — *(Of whom the world was not worthy:) they wandered in deserts, and in mountains, and in dens and caves of the earth.* (Hebrews 11:38). Isaiah drinks the cup alone so the remnant may be preserved.',
       sv.verse_id, ev.verse_id, 'extras', 67606
  FROM _session403_asci5_lookup sv, _session403_asci5_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=5 AND sv.verse_number=13
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=5 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ascension-isaiah-5-sawn-asunder
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 11:37 — *They were stoned, they were sawn asunder, were tempted, were slain with the sword: they wandered about in sheepskins and goatskins; being destitute, afflicted, tormented;* The lone canon witness to the wood-saw martyrdom records exactly Isaiah''s death in 5:11.'
  FROM cross_reference_threads t, cross_references x, _session403_asci5_lookup sv, _session403_asci5_lookup tv
 WHERE t.slug='ascension-isaiah-5-sawn-asunder'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=5 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 23:31 — *Wherefore ye be witnesses unto yourselves, that ye are the children of them which killed the prophets.* The false prophets laughing and rejoicing at Isaiah''s death (5:2) are the same lineage the Beloved indicts.'
  FROM cross_reference_threads t, cross_references x, _session403_asci5_lookup sv, _session403_asci5_lookup tv
 WHERE t.slug='ascension-isaiah-5-sawn-asunder'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=5 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=23 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 7:52 — *Which of the prophets have not your fathers persecuted? and they have slain them which shewed before of the coming of the Just One; of whom ye have been now the betrayers and murderers:* Manasseh, the princes, and all the people looking on (5:12) stand in the company Stephen names before the council.'
  FROM cross_reference_threads t, cross_references x, _session403_asci5_lookup sv, _session403_asci5_lookup tv
 WHERE t.slug='ascension-isaiah-5-sawn-asunder'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=5 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=52
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 6:9 — *And when he had opened the fifth seal, I saw under the altar the souls of them that were slain for the word of Elohim (God), and for the testimony which they held:* Isaiah''s lips speaking by the Ruach until the end (5:14) place him among the slain who keep the testimony.'
  FROM cross_reference_threads t, cross_references x, _session403_asci5_lookup sv, _session403_asci5_lookup tv
 WHERE t.slug='ascension-isaiah-5-sawn-asunder'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=5 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=6 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-5-beliar-sammael-seed-war
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Beliar dwelling in Manasseh''s heart to saw Isaiah (5:1) is the serpent''s enmity against the woman''s seed working in history.'
  FROM cross_reference_threads t, cross_references x, _session403_asci5_lookup sv, _session403_asci5_lookup tv
 WHERE t.slug='ascension-isaiah-5-beliar-sammael-seed-war'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Thessalonians 2:3 — *Let no man deceive you by any means: for that day shall not come, except there come a falling away first, and that man of sin be revealed, the son of perdition;* The apostasy under Manasseh that Sammael drives (5:15) is the falling away whose pattern the man of sin fulfills.'
  FROM cross_reference_threads t, cross_references x, _session403_asci5_lookup sv, _session403_asci5_lookup tv
 WHERE t.slug='ascension-isaiah-5-beliar-sammael-seed-war'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=5 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='2-thessalonians' AND tv.chapter_number=2 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Thessalonians 2:9 — *Even him, whose coming is after the working of Satan with all power and signs and lying wonders,* Isaiah doing nothing and Beliar doing all ''according to the will of Satan'' (5:16) names the very engine Paul names.'
  FROM cross_reference_threads t, cross_references x, _session403_asci5_lookup sv, _session403_asci5_lookup tv
 WHERE t.slug='ascension-isaiah-5-beliar-sammael-seed-war'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=5 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='2-thessalonians' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 13:7 — *And it was given unto him to make war with the saints, and to overcome them: and power was given him over all kindreds, and tongues, and nations.* Sammael''s wrath against the saint who beheld the Beloved (5:15) is the beast''s war on the saints in seed-form.'
  FROM cross_reference_threads t, cross_references x, _session403_asci5_lookup sv, _session403_asci5_lookup tv
 WHERE t.slug='ascension-isaiah-5-beliar-sammael-seed-war'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=5 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=13 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-5-prophets-flee-remnant
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Kings 19:18 — *Yet I have left me seven thousand in Yashar''el (Israel), all the knees which have not bowed unto Baal, and every mouth which hath not kissed him.* The prophets sent to Tyre and Sidon (5:13) are the preserved remnant who never bowed, as in Elijah''s day.'
  FROM cross_reference_threads t, cross_references x, _session403_asci5_lookup sv, _session403_asci5_lookup tv
 WHERE t.slug='ascension-isaiah-5-prophets-flee-remnant'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=5 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=19 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 12:6 — *And the woman fled into the wilderness, where she hath a place prepared of Elohim (God), that they should feed her there a thousand two hundred and threescore days.* The faithful fleeing the murderous city (5:13) is the woman fleeing to the place Elohim prepares.'
  FROM cross_reference_threads t, cross_references x, _session403_asci5_lookup sv, _session403_asci5_lookup tv
 WHERE t.slug='ascension-isaiah-5-prophets-flee-remnant'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=5 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 11:38 — *(Of whom the world was not worthy:) they wandered in deserts, and in mountains, and in dens and caves of the earth.* The scattered prophets of 5:13 are these wanderers the world was not worthy of, kin to the sawn-asunder of the next verse.'
  FROM cross_reference_threads t, cross_references x, _session403_asci5_lookup sv, _session403_asci5_lookup tv
 WHERE t.slug='ascension-isaiah-5-prophets-flee-remnant'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=5 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=38
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ascensionisaiah_06.sql (session403 ascension-isaiah 6) -----
-- Source anchor: ascension-isaiah/ascension-isaiah ch6. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: asci6 (view _session403_asci6_lookup). Sort band base 67625, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session403_asci6_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ascension-isaiah-6-a-door-opened-in-heaven
  ('ascension-isaiah', 'ascension-isaiah', 6, 6, 'canon', 'revelation', 4, 1, 'free', E'Revelation 4:1 — *After this I looked, and, behold, a door was opened in heaven: and the first voice which I heard was as it were of a trumpet talking with me; which said, Come up hither, and I will shew thee things which must be hereafter.* The same opened door of heaven and the same summoning voice that Isaiah''s hearers heard at 6:6.'),
  ('ascension-isaiah', 'ascension-isaiah', 6, 6, 'canon', '2-corinthians', 12, 2, 'free', E'2 Corinthians 12:2 — *I knew a man in Messiah (Christ) above fourteen years ago, (whether in the body, I cannot tell; or whether out of the body, I cannot tell: Elohim (God) knoweth;) such an one caught up to the third heaven.* Paul, like Isaiah, is carried through the opened door into the heavens — body or no body, the Most High knoweth.'),
  ('ascension-isaiah', 'ascension-isaiah', 6, 8, 'canon', 'revelation', 4, 8, 'free', E'Revelation 4:8 — *And the four beasts had each of them six wings about him; and they were full of eyes within: and they rest not day and night, saying, Holy, holy, holy, Yahuah Elohim (Lord God) Almighty, which was, and is, and is to come.* The worship the prophets render the Most High at 6:8 is the unceasing worship of heaven before the throne.'),
  -- thread: ascension-isaiah-6-mind-taken-up-the-vision-trance
  ('ascension-isaiah', 'ascension-isaiah', 6, 10, 'canon', '2-corinthians', 12, 3, 'free', E'2 Corinthians 12:3 — *And I knew such a man, (whether in the body, or out of the body, I cannot tell: Elohim (God) knoweth;)* Paul''s not-knowing whether body or spirit matches Isaiah''s mind being taken up while his breath remained (6:10, 6:12).'),
  ('ascension-isaiah', 'ascension-isaiah', 6, 12, 'canon', '2-corinthians', 12, 4, 'free', E'2 Corinthians 12:4 — *How that he was caught up into paradise, and heard unspeakable words, which it is not lawful for a man to utter.* The vision Isaiah saw, hidden from the flesh (6:15), is the same caught-up sight of things unspeakable.'),
  ('ascension-isaiah', 'ascension-isaiah', 6, 15, 'canon', 'numbers', 12, 6, 'free', E'Numbers 12:6 — *And he said, Hear now my words: If there be a prophet among you, I Yahuah (LORD) will make myself known unto him in a vision, and will speak unto him in a dream.* The vision not from this world but hidden from the flesh (6:15) is Yahuah''s own appointed way of making Himself known to a true prophet.'),
  -- thread: ascension-isaiah-6-the-angel-from-the-seventh-heaven
  ('ascension-isaiah', 'ascension-isaiah', 6, 13, 'canon', 'daniel', 7, 9, 'free', E'Daniel 7:9 — *I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame, and his wheels as burning fire.* The seventh-heaven realm the angel comes from (6:13) is the throne-realm of the Ancient of days, the Father most high.'),
  ('ascension-isaiah', 'ascension-isaiah', 6, 13, 'enoch', '1-enoch', 14, 15, 'extras', E'1 Enoch 14:15 — *But the middle one reached to heaven, like the throne of Yahuah (God), of stibium, and the top of the throne was of sapphire.* Enoch''s ascent to the throne reaching to heaven is the elder pattern of Isaiah''s angel from the seventh heaven (6:13) — it ain''t new.'),
  ('ascension-isaiah', 'ascension-isaiah', 6, 13, 'canon', 'revelation', 4, 2, 'free', E'Revelation 4:2 — *And immediately I was in the spirit: and, behold, a throne was set in heaven, and one sat on the throne.* John''s heavenly guide and throne mirror the seventh-heaven angel who makes Isaiah see (6:13).'),
  -- thread: ascension-isaiah-6-the-prophet-band-and-the-spirit
  ('ascension-isaiah', 'ascension-isaiah', 6, 5, 'canon', '1-samuel', 10, 6, 'free', E'1 Samuel 10:6 — *And the Spirit of Yahuah (LORD) will come upon thee, and thou shalt prophesy with them, and shalt be turned into another man.* The prophet-band prophesying under Isaiah''s hand (6:5) is the same Spirit-borne company Saul met.'),
  ('ascension-isaiah', 'ascension-isaiah', 6, 6, 'canon', 'acts', 2, 17, 'free', E'Acts 2:17 — *And it shall come to pass in the last days, saith Elohim (God), I will pour out of my Spirit upon all flesh: and your sons and your daughters shall prophesy, and your young men shall see visions, and your old men shall dream dreams.* The voice of the Ruach HaKodesh through the opened door (6:6) is the outpoured Spirit that makes sons and daughters prophesy.'),
  ('ascension-isaiah', 'ascension-isaiah', 6, 9, 'canon', 'amos', 3, 7, 'free', E'Amos 3:7 — *Surely Adonai Yahuah (the Lord GOD) will do nothing, but he revealeth his secret unto his servants the prophets.* The door bestowed in an alien world upon a man (6:9) is the secret Yahuah opens only to His servant-prophets.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session403_asci6_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session403_asci6_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-6-a-door-opened-in-heaven',
       E'A door opened, and the voice of the Spirit',
       E'As Isaiah speaks truth before Hezekiah, *they all heard a door which one had opened and the voice of the Ruach HaKodesh (Holy Spirit)* (Ascension of Isaiah 6:6). It ain''t new — the opened door of heaven is the same threshold John is called through: *After this I looked, and, behold, a door was opened in heaven: and the first voice which I heard was as it were of a trumpet talking with me; which said, Come up hither, and I will shew thee things which must be hereafter* (Revelation 4:1). Paul knew that door too, *caught up to the third heaven* (2 Corinthians 12:2). It opens not by a man''s will but by the Father''s, *the Most High who is in the upper world* (Ascension of Isaiah 6:8) — and the seer''s only posture is worship, as Yahudah''s prophets *worshipped on their knees, and glorified the Elohim (God) of truth* before the One on high.',
       sv.verse_id, ev.verse_id, 'extras', 67625
  FROM _session403_asci6_lookup sv, _session403_asci6_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=6 AND sv.verse_number=6
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=6 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-6-mind-taken-up-the-vision-trance',
       E'His mind taken up — the body left behind',
       E'When the Spirit fell, *he became silent and his mind was taken up from him and he saw not the men that stood before him* (Ascension of Isaiah 6:10), yet *his breath was in him; for he was seeing a vision* (Ascension of Isaiah 6:12). It ain''t new: the seer''s flesh is left behind while the inner man is carried, exactly Paul''s uncertainty — *whether in the body, or out of the body, I cannot tell: Elohim (God) knoweth* (2 Corinthians 12:3). This vision *was not from this world but from the world which is hidden from the flesh* (Ascension of Isaiah 6:15), for what is shown belongs to the realm Yahuah reserves for His prophets: *If there be a prophet among you, I Yahuah (LORD) will make myself known unto him in a vision* (Numbers 12:6).',
       sv.verse_id, ev.verse_id, 'extras', 67628
  FROM _session403_asci6_lookup sv, _session403_asci6_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=6 AND sv.verse_number=10
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=6 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-6-the-angel-from-the-seventh-heaven',
       E'The angel guide from the seventh heaven',
       E'The one who comes to lead Isaiah up is no earthly messenger: *the angel who was sent to make him see was not of this firmament, nor was he of the angels of glory of this world, but he had come from the seventh heaven* (Ascension of Isaiah 6:13). It ain''t new — the seer is always given a guide who descends from the throne-realm. Daniel beheld the heights where *the Ancient of days did sit, whose garment was white as snow* (Daniel 7:9), and Enoch before him was carried where *the middle one reached to heaven, like the throne of Yahuah (God), of stibium, and the top of the throne was of sapphire* (1 Enoch 14:15). The guide who carries the prophet through the heavens is the same office that escorts John through the opened door — and the throne he climbs toward is the Father''s, the Great Glory whom none can behold, the Most High under whom the Formed Son is ordered.',
       sv.verse_id, ev.verse_id, 'extras', 67631
  FROM _session403_asci6_lookup sv, _session403_asci6_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=6 AND sv.verse_number=13
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=6 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-6-the-prophet-band-and-the-spirit',
       E'The prophets gathered, the Spirit poured out',
       E'Forty prophets and sons of the prophets gather, *that he might place his hands upon them, and that they might prophesy* (Ascension of Isaiah 6:5). It ain''t new — this is the company Samuel knew, where *the Spirit of Yahuah (LORD) will come upon thee, and thou shalt prophesy with them, and shalt be turned into another man* (1 Samuel 10:6). And the door opened in Isaiah''s hearing is the same Spirit foretold by Joel and poured out at Pentecost: *I will pour out of my Spirit upon all flesh: and your sons and your daughters shall prophesy, and your young men shall see visions* (Acts 2:17). The Most High *revealeth his secret unto his servants the prophets* (Amos 3:7) — and so He bestowed *a door in an alien world* upon a man (Ascension of Isaiah 6:9).',
       sv.verse_id, ev.verse_id, 'extras', 67634
  FROM _session403_asci6_lookup sv, _session403_asci6_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=6 AND sv.verse_number=3
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=6 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ascension-isaiah-6-a-door-opened-in-heaven
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 4:1 — *After this I looked, and, behold, a door was opened in heaven: and the first voice which I heard was as it were of a trumpet talking with me; which said, Come up hither, and I will shew thee things which must be hereafter.* The same opened door of heaven and the same summoning voice that Isaiah''s hearers heard at 6:6.'
  FROM cross_reference_threads t, cross_references x, _session403_asci6_lookup sv, _session403_asci6_lookup tv
 WHERE t.slug='ascension-isaiah-6-a-door-opened-in-heaven'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=6 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=4 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Corinthians 12:2 — *I knew a man in Messiah (Christ) above fourteen years ago, (whether in the body, I cannot tell; or whether out of the body, I cannot tell: Elohim (God) knoweth;) such an one caught up to the third heaven.* Paul, like Isaiah, is carried through the opened door into the heavens — body or no body, the Most High knoweth.'
  FROM cross_reference_threads t, cross_references x, _session403_asci6_lookup sv, _session403_asci6_lookup tv
 WHERE t.slug='ascension-isaiah-6-a-door-opened-in-heaven'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=6 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 4:8 — *And the four beasts had each of them six wings about him; and they were full of eyes within: and they rest not day and night, saying, Holy, holy, holy, Yahuah Elohim (Lord God) Almighty, which was, and is, and is to come.* The worship the prophets render the Most High at 6:8 is the unceasing worship of heaven before the throne.'
  FROM cross_reference_threads t, cross_references x, _session403_asci6_lookup sv, _session403_asci6_lookup tv
 WHERE t.slug='ascension-isaiah-6-a-door-opened-in-heaven'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=6 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=4 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-6-mind-taken-up-the-vision-trance
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Corinthians 12:3 — *And I knew such a man, (whether in the body, or out of the body, I cannot tell: Elohim (God) knoweth;)* Paul''s not-knowing whether body or spirit matches Isaiah''s mind being taken up while his breath remained (6:10, 6:12).'
  FROM cross_reference_threads t, cross_references x, _session403_asci6_lookup sv, _session403_asci6_lookup tv
 WHERE t.slug='ascension-isaiah-6-mind-taken-up-the-vision-trance'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=6 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=12 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Corinthians 12:4 — *How that he was caught up into paradise, and heard unspeakable words, which it is not lawful for a man to utter.* The vision Isaiah saw, hidden from the flesh (6:15), is the same caught-up sight of things unspeakable.'
  FROM cross_reference_threads t, cross_references x, _session403_asci6_lookup sv, _session403_asci6_lookup tv
 WHERE t.slug='ascension-isaiah-6-mind-taken-up-the-vision-trance'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=6 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=12 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Numbers 12:6 — *And he said, Hear now my words: If there be a prophet among you, I Yahuah (LORD) will make myself known unto him in a vision, and will speak unto him in a dream.* The vision not from this world but hidden from the flesh (6:15) is Yahuah''s own appointed way of making Himself known to a true prophet.'
  FROM cross_reference_threads t, cross_references x, _session403_asci6_lookup sv, _session403_asci6_lookup tv
 WHERE t.slug='ascension-isaiah-6-mind-taken-up-the-vision-trance'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=6 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=12 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-6-the-angel-from-the-seventh-heaven
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:9 — *I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame, and his wheels as burning fire.* The seventh-heaven realm the angel comes from (6:13) is the throne-realm of the Ancient of days, the Father most high.'
  FROM cross_reference_threads t, cross_references x, _session403_asci6_lookup sv, _session403_asci6_lookup tv
 WHERE t.slug='ascension-isaiah-6-the-angel-from-the-seventh-heaven'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=6 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 14:15 — *But the middle one reached to heaven, like the throne of Yahuah (God), of stibium, and the top of the throne was of sapphire.* Enoch''s ascent to the throne reaching to heaven is the elder pattern of Isaiah''s angel from the seventh heaven (6:13) — it ain''t new.'
  FROM cross_reference_threads t, cross_references x, _session403_asci6_lookup sv, _session403_asci6_lookup tv
 WHERE t.slug='ascension-isaiah-6-the-angel-from-the-seventh-heaven'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=6 AND sv.verse_number=13
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=14 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 4:2 — *And immediately I was in the spirit: and, behold, a throne was set in heaven, and one sat on the throne.* John''s heavenly guide and throne mirror the seventh-heaven angel who makes Isaiah see (6:13).'
  FROM cross_reference_threads t, cross_references x, _session403_asci6_lookup sv, _session403_asci6_lookup tv
 WHERE t.slug='ascension-isaiah-6-the-angel-from-the-seventh-heaven'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=6 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=4 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-6-the-prophet-band-and-the-spirit
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Samuel 10:6 — *And the Spirit of Yahuah (LORD) will come upon thee, and thou shalt prophesy with them, and shalt be turned into another man.* The prophet-band prophesying under Isaiah''s hand (6:5) is the same Spirit-borne company Saul met.'
  FROM cross_reference_threads t, cross_references x, _session403_asci6_lookup sv, _session403_asci6_lookup tv
 WHERE t.slug='ascension-isaiah-6-the-prophet-band-and-the-spirit'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=6 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=10 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Acts 2:17 — *And it shall come to pass in the last days, saith Elohim (God), I will pour out of my Spirit upon all flesh: and your sons and your daughters shall prophesy, and your young men shall see visions, and your old men shall dream dreams.* The voice of the Ruach HaKodesh through the opened door (6:6) is the outpoured Spirit that makes sons and daughters prophesy.'
  FROM cross_reference_threads t, cross_references x, _session403_asci6_lookup sv, _session403_asci6_lookup tv
 WHERE t.slug='ascension-isaiah-6-the-prophet-band-and-the-spirit'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=6 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=2 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Amos 3:7 — *Surely Adonai Yahuah (the Lord GOD) will do nothing, but he revealeth his secret unto his servants the prophets.* The door bestowed in an alien world upon a man (6:9) is the secret Yahuah opens only to His servant-prophets.'
  FROM cross_reference_threads t, cross_references x, _session403_asci6_lookup sv, _session403_asci6_lookup tv
 WHERE t.slug='ascension-isaiah-6-the-prophet-band-and-the-spirit'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=6 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=3 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ascensionisaiah_07.sql (session403 ascension-isaiah 7) -----
-- Source anchor: ascension-isaiah/ascension-isaiah ch7. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: asci7 (view _session403_asci7_lookup). Sort band base 67650, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session403_asci7_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ascension-isaiah-7-sent-from-the-seventh-heaven
  ('ascension-isaiah', 'ascension-isaiah', 7, 8, 'canon', 'ephesians', 4, 10, 'free', E'Ephesians 4:10 — *He that descended is the same also that ascended up far above all heavens, that he might fill all things.)* The one sent down from the seventh heaven is the same one who ascends back above all the heavens — the descent-and-ascent of Ascension of Isaiah 7:8.'),
  ('ascension-isaiah', 'ascension-isaiah', 7, 8, 'canon', 'philippians', 2, 9, 'free', E'Philippians 2:9 — *Wherefore Elohim (God) also hath highly exalted him, and given him a name which is above every name:* The Beloved is exalted BY the Father who is greater — exaltation given, not seized, matching the sent-and-subordinate order of Ascension of Isaiah 7:8.'),
  ('ascension-isaiah', 'ascension-isaiah', 7, 8, 'canon', 'john', 17, 5, 'free', E'John 17:5 — *And now, O Father, glorify thou me with thine own self with the glory which I had with thee before the world was.* The Son addresses a Father greater than Himself and names a glory held WITH Him before the world — the very frame of "His Father also who is greater" in Ascension of Isaiah 7:8.'),
  -- thread: ascension-isaiah-7-the-beloved-and-the-one-on-the-throne
  ('ascension-isaiah', 'ascension-isaiah', 7, 17, 'canon', 'hebrews', 1, 6, 'free', E'Hebrews 1:6 — *And again, when he bringeth in the firstbegotten into the world, he saith, And let all the angels of Elohim (God) worship him.* The Beloved who receives the heavens'' praise in Ascension of Isaiah 7:17 is the firstbegotten the Father commands the angels to worship.'),
  ('ascension-isaiah', 'ascension-isaiah', 7, 17, 'canon', 'revelation', 5, 13, 'free', E'Revelation 5:13 — *And every creature which is in heaven, and on the earth, and under the earth, and such as are in the sea, and all that are in them, heard I saying, Blessing, and honour, and glory, and power, be unto him that sitteth upon the throne, and unto the Lamb for ever and ever.* The same two-fold honour — to Him on the throne AND to the Lamb/Beloved — that the angel describes in Ascension of Isaiah 7:17.'),
  ('ascension-isaiah', 'ascension-isaiah', 7, 17, 'canon', 'philippians', 2, 11, 'free', E'Philippians 2:11 — *And that every tongue should confess that Yahusha HaMashiach (Jesus Christ) is Lord, to the glory of Elohim (God) the Father.* Confession of the Beloved as Lord redounds TO the Father''s glory — the ordered honour of Ascension of Isaiah 7:17, never collapsed into one person.'),
  -- thread: ascension-isaiah-7-caught-up-through-the-heavens
  ('ascension-isaiah', 'ascension-isaiah', 7, 3, 'canon', '2-corinthians', 12, 2, 'free', E'2 Corinthians 12:2 — *I knew a man in Messiah (Christ) above fourteen years ago, (whether in the body, I cannot tell; or whether out of the body, I cannot tell: Elohim (God) knoweth;) such an one caught up to the third heaven.* Paul''s ascent through the heavens — caught up bodily yet uncertain of the body — is the same kind of vision Isaiah is seized into in Ascension of Isaiah 7:3.'),
  ('ascension-isaiah', 'ascension-isaiah', 7, 5, 'canon', '2-corinthians', 12, 4, 'free', E'2 Corinthians 12:4 — *How that he was caught up into paradise, and heard unspeakable words, which it is not lawful for a man to utter.* The unspeakable things heard above, with a return to the body, match Isaiah''s promised return in Ascension of Isaiah 7:5.'),
  -- thread: ascension-isaiah-7-thrones-crowns-laid-up
  ('ascension-isaiah', 'ascension-isaiah', 7, 22, 'canon', 'revelation', 4, 4, 'free', E'Revelation 4:4 — *And round about the throne were four and twenty seats: and upon the seats I saw four and twenty elders sitting, clothed in white raiment; and they had on their heads crowns of gold.* The throne, white garment and crown laid up above the heavens in Ascension of Isaiah 7:22 are the very seats, raiment and crowns John sees about the throne.'),
  ('ascension-isaiah', 'ascension-isaiah', 7, 22, 'canon', 'revelation', 3, 5, 'free', E'Revelation 3:5 — *He that overcometh, the same shall be clothed in white raiment; and I will not blot out his name out of the book of life, but I will confess his name before my Father, and before his angels.* The garments reserved above for the overcomer answer the garments shown to Isaiah in Ascension of Isaiah 7:22.'),
  ('ascension-isaiah', 'ascension-isaiah', 7, 23, 'canon', '2-timothy', 4, 8, 'free', E'2 Timothy 4:8 — *Henceforth there is laid up for me a crown of righteousness, which Yahuah (Lord), the righteous judge, shall give me at that day: and not to me only, but unto all them also that love his appearing.* The crown laid up for them that love His appearing matches the reward for those who love the Most High and His Beloved in Ascension of Isaiah 7:23.'),
  -- thread: ascension-isaiah-7-sammael-and-the-seed-war
  ('ascension-isaiah', 'ascension-isaiah', 7, 12, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The war till the Beloved comes and destroys him in Ascension of Isaiah 7:12 is the head-bruising promised at the start — it ain''t new.'),
  ('ascension-isaiah', 'ascension-isaiah', 7, 9, 'jubilees', 'jubilees', 10, 8, 'extras', E'Jubilees 10:8 — *And the chief of the spirits, Mastêmâ, came and said: “Yahuah (God), Creator, let some of them remain before me, and let them hearken to my voice, and do all that I shall say to them; for if some of them are not left to me, I shall not be able to execute the power of my will on the sons of men; for these are for corruption and leading astray before my judgment, for great is the wickedness of the sons of men.” And He said: “Let the tenth part of them remain before him, and let nine parts descend into the place of condemnation.”* The chief-of-spirits left to rule is the same Sammael with his hosts envying in the firmament in Ascension of Isaiah 7:9.'),
  ('ascension-isaiah', 'ascension-isaiah', 7, 9, 'jubilees', 'jubilees', 10, 11, 'extras', E'Jubilees 10:11 — *And we did according to all His words: all the malignant evil ones we bound in the place of condemnation, and a tenth part of them we left that they might be subject before Satan on the earth.* The remnant of evil spirits left subject to Satan is the host of Sammael at war in Ascension of Isaiah 7:9.'),
  -- thread: ascension-isaiah-7-the-only-begotten-none-can-name
  ('ascension-isaiah', 'ascension-isaiah', 7, 37, 'canon', 'john', 1, 18, 'free', E'John 1:18 — *No man hath seen Elohim (God) at any time; the only begotten Son, which is in the bosom of the Father, he hath declared him.* The unseen Father and the distinct Only-begotten of Ascension of Isaiah 7:37 are John''s unseen Elohim and the only begotten Son in His bosom.'),
  ('ascension-isaiah', 'ascension-isaiah', 7, 37, 'canon', 'exodus', 33, 20, 'free', E'Exodus 33:20 — *And he said, Thou canst not see my face: for there shall no man see me, and live.* The One "whose name is not known to any flesh" in Ascension of Isaiah 7:37 is the same Most High whose face no man may see and live.'),
  ('ascension-isaiah', 'ascension-isaiah', 7, 37, 'canon', 'proverbs', 30, 4, 'free', E'Proverbs 30:4 — *Who hath ascended up into heaven, or descended? who hath gathered the wind in his fists? who hath bound the waters in a garment? who hath established all the ends of the earth? what is his name, and what is his son’s name, if thou canst tell?* Agur''s riddle of the Father''s name and His son''s name is answered in the unnamed One and the Only-begotten of Ascension of Isaiah 7:37 — it ain''t new.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session403_asci7_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session403_asci7_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-7-sent-from-the-seventh-heaven',
       E'Sent from the seventh heaven — the Father who is greater',
       E'The guiding angel keeps the order of heaven exactly as Yoshi reads it: *And His Father also who is greater thou wilt see; for for this purpose have I been sent from the seventh heaven in order to explain all these things unto thee.* (Ascension of Isaiah 7:8). The one who descends is **sent** and has a **Father who is greater** — the Formed Son ordered under the Most High, not a co-equal person and not the Father Himself. It ain''t new: the Word was *with* Elohim and made flesh by the Father''s purpose — *He that descended is the same also that ascended up far above all heavens, that he might fill all things.* (Ephesians 4:10); *Wherefore Elohim (God) also hath highly exalted him, and given him a name which is above every name:* (Philippians 2:9); and the Son Himself names the glory He had *with* the Father before the descent — *And now, O Father, glorify thou me with thine own self with the glory which I had with thee before the world was.* (John 17:5).',
       sv.verse_id, ev.verse_id, 'extras', 67650
  FROM _session403_asci7_lookup sv, _session403_asci7_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=7 AND sv.verse_number=8
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=7 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-7-the-beloved-and-the-one-on-the-throne',
       E'Praise sent to Him who sitteth in the seventh heaven, and to His Beloved',
       E'The angel names the destination of all the heavens'' praise — and holds the order: *It is sent to the praise of Him who sitteth in the seventh heaven: to Him who rests in the holy world, and to His Beloved, whence I have been sent to thee. Thither is it sent.* (Ascension of Isaiah 7:17). The One on the throne is the Father; **His Beloved** is distinct from Him and beside Him — not a second God and not the same person, but the Son the Father loves. It ain''t new: the firstbegotten brought into the world is worshipped at the Father''s word — *And again, when he bringeth in the firstbegotten into the world, he saith, And let all the angels of Elohim (God) worship him.* (Hebrews 1:6); and Revelation keeps the same two-fold honour — *And every creature which is in heaven, and on the earth, and under the earth, and such as are in the sea, and all that are in them, heard I saying, Blessing, and honour, and glory, and power, be unto him that sitteth upon the throne, and unto the Lamb for ever and ever.* (Revelation 5:13). Every tongue confesses the Beloved as Lord *to the glory of Elohim (God) the Father* — *And that every tongue should confess that Yahusha HaMashiach (Jesus Christ) is Lord, to the glory of Elohim (God) the Father.* (Philippians 2:11).',
       sv.verse_id, ev.verse_id, 'extras', 67653
  FROM _session403_asci7_lookup sv, _session403_asci7_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=7 AND sv.verse_number=17
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=7 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-7-caught-up-through-the-heavens',
       E'Raised on high through the degrees — caught up to the heavens',
       E'Isaiah is seized by the hand and lifted: *And having seized me by my hand he raised me on high, and I said unto him: "Who art thou, and what is thy name, and whither art thou raising me on high? for strength was given me to speak with him."* (Ascension of Isaiah 7:3), and the angel promises a return to the body: *Because thou wilt return into this thy body, but whither I am raising thee on high, thou wilt see; for for this purpose have I been sent.* (Ascension of Isaiah 7:5). It ain''t new — Paul is caught up the same way and cannot tell body from spirit: *I knew a man in Messiah (Christ) above fourteen years ago, (whether in the body, I cannot tell; or whether out of the body, I cannot tell: Elohim (God) knoweth;) such an one caught up to the third heaven.* (2 Corinthians 12:2); *How that he was caught up into paradise, and heard unspeakable words, which it is not lawful for a man to utter.* (2 Corinthians 12:4).',
       sv.verse_id, ev.verse_id, 'extras', 67656
  FROM _session403_asci7_lookup sv, _session403_asci7_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=7 AND sv.verse_number=3
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=7 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-7-thrones-crowns-laid-up',
       E'Thrones, garments and crowns laid up above the heavens',
       E'The angel forbids worship of any throne or angel of the six heavens, then reveals what is kept for the righteous: *For above all the heavens and their angels has thy throne been placed, and thy garments and thy crown which thou shalt see.* (Ascension of Isaiah 7:22); and the ascent belongs to those who love the Most High and His Beloved: *And I rejoiced with great joy, that those who love the Most High and His Beloved will afterwards ascend thither by the angel of the Ruach HaKodesh (Holy Spirit).* (Ascension of Isaiah 7:23). It ain''t new — the throne, the white robe and the crown are already laid up: *And round about the throne were four and twenty seats: and upon the seats I saw four and twenty elders sitting, clothed in white raiment; and they had on their heads crowns of gold.* (Revelation 4:4); *He that overcometh, the same shall be clothed in white raiment; and I will not blot out his name out of the book of life, but I will confess his name before my Father, and before his angels.* (Revelation 3:5); *Henceforth there is laid up for me a crown of righteousness, which Yahuah (Lord), the righteous judge, shall give me at that day: and not to me only, but unto all them also that love his appearing.* (2 Timothy 4:8).',
       sv.verse_id, ev.verse_id, 'extras', 67659
  FROM _session403_asci7_lookup sv, _session403_asci7_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=7 AND sv.verse_number=22
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=7 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-7-sammael-and-the-seed-war',
       E'Sammael in the firmament — the war that ends when He comes',
       E'Rising to the firmament, Isaiah sees the adversary''s host at war: *And we ascended to the firmament, I and he, and there I saw Sammael and his hosts, and there was great fighting therein and the angels of Satan were envying one another.* (Ascension of Isaiah 7:9); and the angel sets its end: *And he said unto me: "So has it been since this world was made until now, and this war (will continue) till He, whom thou shalt see will come and destroy him."* (Ascension of Isaiah 7:12). It ain''t new — the war is the seed-war declared in the garden: *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* (Genesis 3:15); and Sammael/ha-satan is the very chief of spirits left to rule, as the restored books record — *And the chief of the spirits, Mastêmâ, came and said... let some of them remain before me...* (Jubilees 10:8); *And we did according to all His words: all the malignant evil ones we bound in the place of condemnation, and a tenth part of them we left that they might be subject before Satan on the earth.* (Jubilees 10:11).',
       sv.verse_id, ev.verse_id, 'extras', 67662
  FROM _session403_asci7_lookup sv, _session403_asci7_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=7 AND sv.verse_number=9
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=7 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-7-the-only-begotten-none-can-name',
       E'The Only-begotten and Him who is not named — none can behold',
       E'At the fifth heaven Isaiah''s praise rises past every throne to the unnameable One and His Son: *And I praised Him, who is not named and the Only-begotten who dwelleth in the heavens, whose name is not known to any flesh, who has bestowed such glory on the several heavens, and who makes great the glory of the angels, and more excellent the glory of Him who sitteth on the throne.* (Ascension of Isaiah 7:37). The Father is unseen and unnamed; the **Only-begotten** is distinct and dwells in the heavens — the Formed Son, not the Father, not a creature. It ain''t new: *No man hath seen Elohim (God) at any time; the only begotten Son, which is in the bosom of the Father, he hath declared him.* (John 1:18); *And he said, Thou canst not see my face: for there shall no man see me, and live.* (Exodus 33:20); and Agur already asked the Father-and-Son riddle — *Who hath ascended up into heaven, or descended?... what is his name, and what is his son’s name, if thou canst tell?* (Proverbs 30:4).',
       sv.verse_id, ev.verse_id, 'extras', 67665
  FROM _session403_asci7_lookup sv, _session403_asci7_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=7 AND sv.verse_number=37
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=7 AND ev.verse_number=37
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ascension-isaiah-7-sent-from-the-seventh-heaven
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ephesians 4:10 — *He that descended is the same also that ascended up far above all heavens, that he might fill all things.)* The one sent down from the seventh heaven is the same one who ascends back above all the heavens — the descent-and-ascent of Ascension of Isaiah 7:8.'
  FROM cross_reference_threads t, cross_references x, _session403_asci7_lookup sv, _session403_asci7_lookup tv
 WHERE t.slug='ascension-isaiah-7-sent-from-the-seventh-heaven'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=7 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=4 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Philippians 2:9 — *Wherefore Elohim (God) also hath highly exalted him, and given him a name which is above every name:* The Beloved is exalted BY the Father who is greater — exaltation given, not seized, matching the sent-and-subordinate order of Ascension of Isaiah 7:8.'
  FROM cross_reference_threads t, cross_references x, _session403_asci7_lookup sv, _session403_asci7_lookup tv
 WHERE t.slug='ascension-isaiah-7-sent-from-the-seventh-heaven'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=7 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 17:5 — *And now, O Father, glorify thou me with thine own self with the glory which I had with thee before the world was.* The Son addresses a Father greater than Himself and names a glory held WITH Him before the world — the very frame of "His Father also who is greater" in Ascension of Isaiah 7:8.'
  FROM cross_reference_threads t, cross_references x, _session403_asci7_lookup sv, _session403_asci7_lookup tv
 WHERE t.slug='ascension-isaiah-7-sent-from-the-seventh-heaven'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=7 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=17 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-7-the-beloved-and-the-one-on-the-throne
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 1:6 — *And again, when he bringeth in the firstbegotten into the world, he saith, And let all the angels of Elohim (God) worship him.* The Beloved who receives the heavens'' praise in Ascension of Isaiah 7:17 is the firstbegotten the Father commands the angels to worship.'
  FROM cross_reference_threads t, cross_references x, _session403_asci7_lookup sv, _session403_asci7_lookup tv
 WHERE t.slug='ascension-isaiah-7-the-beloved-and-the-one-on-the-throne'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=7 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 5:13 — *And every creature which is in heaven, and on the earth, and under the earth, and such as are in the sea, and all that are in them, heard I saying, Blessing, and honour, and glory, and power, be unto him that sitteth upon the throne, and unto the Lamb for ever and ever.* The same two-fold honour — to Him on the throne AND to the Lamb/Beloved — that the angel describes in Ascension of Isaiah 7:17.'
  FROM cross_reference_threads t, cross_references x, _session403_asci7_lookup sv, _session403_asci7_lookup tv
 WHERE t.slug='ascension-isaiah-7-the-beloved-and-the-one-on-the-throne'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=7 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=5 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Philippians 2:11 — *And that every tongue should confess that Yahusha HaMashiach (Jesus Christ) is Lord, to the glory of Elohim (God) the Father.* Confession of the Beloved as Lord redounds TO the Father''s glory — the ordered honour of Ascension of Isaiah 7:17, never collapsed into one person.'
  FROM cross_reference_threads t, cross_references x, _session403_asci7_lookup sv, _session403_asci7_lookup tv
 WHERE t.slug='ascension-isaiah-7-the-beloved-and-the-one-on-the-throne'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=7 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-7-caught-up-through-the-heavens
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Corinthians 12:2 — *I knew a man in Messiah (Christ) above fourteen years ago, (whether in the body, I cannot tell; or whether out of the body, I cannot tell: Elohim (God) knoweth;) such an one caught up to the third heaven.* Paul''s ascent through the heavens — caught up bodily yet uncertain of the body — is the same kind of vision Isaiah is seized into in Ascension of Isaiah 7:3.'
  FROM cross_reference_threads t, cross_references x, _session403_asci7_lookup sv, _session403_asci7_lookup tv
 WHERE t.slug='ascension-isaiah-7-caught-up-through-the-heavens'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=7 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Corinthians 12:4 — *How that he was caught up into paradise, and heard unspeakable words, which it is not lawful for a man to utter.* The unspeakable things heard above, with a return to the body, match Isaiah''s promised return in Ascension of Isaiah 7:5.'
  FROM cross_reference_threads t, cross_references x, _session403_asci7_lookup sv, _session403_asci7_lookup tv
 WHERE t.slug='ascension-isaiah-7-caught-up-through-the-heavens'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=7 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=12 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-7-thrones-crowns-laid-up
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 4:4 — *And round about the throne were four and twenty seats: and upon the seats I saw four and twenty elders sitting, clothed in white raiment; and they had on their heads crowns of gold.* The throne, white garment and crown laid up above the heavens in Ascension of Isaiah 7:22 are the very seats, raiment and crowns John sees about the throne.'
  FROM cross_reference_threads t, cross_references x, _session403_asci7_lookup sv, _session403_asci7_lookup tv
 WHERE t.slug='ascension-isaiah-7-thrones-crowns-laid-up'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=7 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 3:5 — *He that overcometh, the same shall be clothed in white raiment; and I will not blot out his name out of the book of life, but I will confess his name before my Father, and before his angels.* The garments reserved above for the overcomer answer the garments shown to Isaiah in Ascension of Isaiah 7:22.'
  FROM cross_reference_threads t, cross_references x, _session403_asci7_lookup sv, _session403_asci7_lookup tv
 WHERE t.slug='ascension-isaiah-7-thrones-crowns-laid-up'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=7 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=3 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Timothy 4:8 — *Henceforth there is laid up for me a crown of righteousness, which Yahuah (Lord), the righteous judge, shall give me at that day: and not to me only, but unto all them also that love his appearing.* The crown laid up for them that love His appearing matches the reward for those who love the Most High and His Beloved in Ascension of Isaiah 7:23.'
  FROM cross_reference_threads t, cross_references x, _session403_asci7_lookup sv, _session403_asci7_lookup tv
 WHERE t.slug='ascension-isaiah-7-thrones-crowns-laid-up'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=7 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='2-timothy' AND tv.chapter_number=4 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-7-sammael-and-the-seed-war
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The war till the Beloved comes and destroys him in Ascension of Isaiah 7:12 is the head-bruising promised at the start — it ain''t new.'
  FROM cross_reference_threads t, cross_references x, _session403_asci7_lookup sv, _session403_asci7_lookup tv
 WHERE t.slug='ascension-isaiah-7-sammael-and-the-seed-war'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=7 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 10:8 — *And the chief of the spirits, Mastêmâ, came and said: “Yahuah (God), Creator, let some of them remain before me, and let them hearken to my voice, and do all that I shall say to them; for if some of them are not left to me, I shall not be able to execute the power of my will on the sons of men; for these are for corruption and leading astray before my judgment, for great is the wickedness of the sons of men.” And He said: “Let the tenth part of them remain before him, and let nine parts descend into the place of condemnation.”* The chief-of-spirits left to rule is the same Sammael with his hosts envying in the firmament in Ascension of Isaiah 7:9.'
  FROM cross_reference_threads t, cross_references x, _session403_asci7_lookup sv, _session403_asci7_lookup tv
 WHERE t.slug='ascension-isaiah-7-sammael-and-the-seed-war'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=7 AND sv.verse_number=9
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=10 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 10:11 — *And we did according to all His words: all the malignant evil ones we bound in the place of condemnation, and a tenth part of them we left that they might be subject before Satan on the earth.* The remnant of evil spirits left subject to Satan is the host of Sammael at war in Ascension of Isaiah 7:9.'
  FROM cross_reference_threads t, cross_references x, _session403_asci7_lookup sv, _session403_asci7_lookup tv
 WHERE t.slug='ascension-isaiah-7-sammael-and-the-seed-war'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=7 AND sv.verse_number=9
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=10 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-7-the-only-begotten-none-can-name
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:18 — *No man hath seen Elohim (God) at any time; the only begotten Son, which is in the bosom of the Father, he hath declared him.* The unseen Father and the distinct Only-begotten of Ascension of Isaiah 7:37 are John''s unseen Elohim and the only begotten Son in His bosom.'
  FROM cross_reference_threads t, cross_references x, _session403_asci7_lookup sv, _session403_asci7_lookup tv
 WHERE t.slug='ascension-isaiah-7-the-only-begotten-none-can-name'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=7 AND sv.verse_number=37
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 33:20 — *And he said, Thou canst not see my face: for there shall no man see me, and live.* The One "whose name is not known to any flesh" in Ascension of Isaiah 7:37 is the same Most High whose face no man may see and live.'
  FROM cross_reference_threads t, cross_references x, _session403_asci7_lookup sv, _session403_asci7_lookup tv
 WHERE t.slug='ascension-isaiah-7-the-only-begotten-none-can-name'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=7 AND sv.verse_number=37
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=33 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 30:4 — *Who hath ascended up into heaven, or descended? who hath gathered the wind in his fists? who hath bound the waters in a garment? who hath established all the ends of the earth? what is his name, and what is his son’s name, if thou canst tell?* Agur''s riddle of the Father''s name and His son''s name is answered in the unnamed One and the Only-begotten of Ascension of Isaiah 7:37 — it ain''t new.'
  FROM cross_reference_threads t, cross_references x, _session403_asci7_lookup sv, _session403_asci7_lookup tv
 WHERE t.slug='ascension-isaiah-7-the-only-begotten-none-can-name'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=7 AND sv.verse_number=37
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=30 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ascensionisaiah_08.sql (session403 ascension-isaiah 8) -----
-- Source anchor: ascension-isaiah/ascension-isaiah ch8. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: asci8 (view _session403_asci8_lookup). Sort band base 67675, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session403_asci8_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ascension-isaiah-8-sixth-heaven-ascent
  ('ascension-isaiah', 'ascension-isaiah', 8, 1, 'canon', '2-corinthians', 12, 2, 'free', E'2 Corinthians 12:2 — *I knew a man in Messiah (Christ) above fourteen years ago, (whether in the body, I cannot tell; or whether out of the body, I cannot tell: Elohim (God) knoweth;) such an one caught up to the third heaven.* Paul is caught up through the heavens just as Isaiah is raised into the air of the sixth heaven (8:1).'),
  ('ascension-isaiah', 'ascension-isaiah', 8, 1, 'canon', '2-corinthians', 12, 4, 'free', E'2 Corinthians 12:4 — *How that he was caught up into paradise, and heard unspeakable words, which it is not lawful for a man to utter.* The unspeakable glory Paul cannot utter is the same glory Isaiah says surpasses all the lower heavens (8:1).'),
  ('ascension-isaiah', 'ascension-isaiah', 8, 1, 'canon', 'revelation', 4, 1, 'free', E'Revelation 4:1 — *After this I looked, and, behold, a door was opened in heaven: and the first voice which I heard was as it were of a trumpet talking with me; which said, Come up hither, and I will shew thee things which must be hereafter.* John is called up into heaven to be shown things to come, as Isaiah is raised to see what no returning man has seen (8:1).'),
  -- thread: ascension-isaiah-8-fellow-servant
  ('ascension-isaiah', 'ascension-isaiah', 8, 5, 'canon', 'revelation', 19, 10, 'free', E'Revelation 19:10 — *And I fell at his feet to worship him. And he said unto me, See thou do it not: I am thy fellowservant, and of thy brethren that have the testimony of Yahusha (Jesus): worship Elohim (God): for the testimony of Yahusha (Jesus) is the spirit of prophecy.* The angel forbids worship and calls himself a fellowservant, exactly as Isaiah''s guide says ''I am not thy lord, but thy fellow servant'' (8:5).'),
  ('ascension-isaiah', 'ascension-isaiah', 8, 5, 'canon', 'luke', 1, 19, 'free', E'Luke 1:19 — *And the angel answering said unto him, I am Gabriel, that stand in the presence of Elohim (God); and am sent to speak unto thee, and to shew thee these glad tidings.* Gabriel is a sent servant standing before Elohim, as Isaiah''s guide is empowered and sent to raise him (8:5, 8:8).'),
  -- thread: ascension-isaiah-8-hidden-name-throne
  ('ascension-isaiah', 'ascension-isaiah', 8, 7, 'canon', 'isaiah', 6, 1, 'free', E'Isaiah 6:1 — *In the year that king Uzziah died I saw also Yahuah (Lord) sitting upon a throne, high and lifted up, and his train filled the temple.* The prophet''s earlier throne-vision shows the Enthroned One whose seat in the seventh heaven Isaiah now ascends toward (8:7).'),
  ('ascension-isaiah', 'ascension-isaiah', 8, 7, 'canon', 'isaiah', 6, 3, 'free', E'Isaiah 6:3 — *And one cried unto another, and said, Holy, holy, holy, is Yahuah Tseva''ot (LORD of hosts): the whole earth is full of his glory.* The seraphim hallow the unnamed Holy One whose name none of the heavens can learn (8:7).'),
  ('ascension-isaiah', 'ascension-isaiah', 8, 8, 'canon', 'revelation', 5, 12, 'free', E'Revelation 5:12 — *Saying with a loud voice, Worthy is the Lamb that was slain to receive power, and riches, and wisdom, and strength, and honour, and glory, and blessing.* The whole heavenly host answer with one voice, as in Isaiah''s vision He alone is the One to whose voice all the heavens and thrones give answer (8:8).'),
  -- thread: ascension-isaiah-8-beloved-descends-in-your-form
  ('ascension-isaiah', 'ascension-isaiah', 8, 10, 'canon', 'philippians', 2, 7, 'free', E'Philippians 2:7 — *But made himself of no reputation, and took upon him the form of a servant, and was made in the likeness of men.* The Beloved undergoes transformation until He resembles your form and likeness (8:10), exactly the self-emptying into man''s likeness Paul names.'),
  ('ascension-isaiah', 'ascension-isaiah', 8, 26, 'canon', 'philippians', 2, 6, 'free', E'Philippians 2:6 — *Who, being in the form of Elohim (God), thought it not robbery to be equal with Elohim (God).* The One in the form of Elohim is the Yahuah who will descend in your form (8:26).'),
  ('ascension-isaiah', 'ascension-isaiah', 8, 10, 'canon', 'john', 1, 14, 'free', E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The Beloved''s transformation into your form and likeness (8:10) is the Word made flesh.'),
  ('ascension-isaiah', 'ascension-isaiah', 8, 26, 'canon', 'john', 3, 13, 'free', E'John 3:13 — *And no man hath ascended up to heaven, but he that came down from heaven, even the Son of Adam which is in heaven.* The One who came down from heaven is the Yahuah Isaiah is told will descend in your form (8:26).'),
  ('ascension-isaiah', 'ascension-isaiah', 8, 26, 'canon', '1-timothy', 3, 16, 'free', E'1 Timothy 3:16 — *And without controversy great is the mystery of godliness: Elohim (God) was manifest in the flesh, justified in the Spirit, seen of angels, preached unto the Gentiles, believed on in the world, received up into glory.* The mystery of Elohim manifest in the flesh is the descent in your form Isaiah is shown beforehand (8:26).'),
  -- thread: ascension-isaiah-8-father-beloved-spirit
  ('ascension-isaiah', 'ascension-isaiah', 8, 18, 'canon', 'philippians', 2, 10, 'free', E'Philippians 2:10 — *That at the name of Yahusha (Jesus) every knee should bow, of things in heaven, and things in earth, and things under the earth.* The Beloved named and worshipped with one voice in the sixth heaven (8:18) is the One before whose name every knee bows.'),
  ('ascension-isaiah', 'ascension-isaiah', 8, 18, 'canon', 'philippians', 2, 11, 'free', E'Philippians 2:11 — *And that every tongue should confess that Yahusha HaMashiach (Jesus Christ) is Lord, to the glory of Elohim (God) the Father.* Every tongue confessing the Messiah to the glory of the Father matches the angels naming the Father and His Beloved with one voice (8:18).'),
  ('ascension-isaiah', 'ascension-isaiah', 8, 18, 'canon', 'hebrews', 1, 3, 'free', E'Hebrews 1:3 — *Who being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power, when he had by himself purged our sins, sat down on the right hand of the Majesty on high.* The Beloved hymned beside the primal Father (8:18) is the brightness of His glory who sits at His right hand.'),
  -- thread: ascension-isaiah-8-garments-laid-up-righteous
  ('ascension-isaiah', 'ascension-isaiah', 8, 26, 'canon', 'revelation', 19, 8, 'free', E'Revelation 19:8 — *And to her was granted that she should be arrayed in fine linen, clean and white: for the fine linen is the righteousness of saints.* The garments laid up for the righteous (8:26) are the white raiment of the saints'' righteousness.'),
  ('ascension-isaiah', 'ascension-isaiah', 8, 14, 'canon', '2-timothy', 4, 8, 'free', E'2 Timothy 4:8 — *Henceforth there is laid up for me a crown of righteousness, which Yahuah (Lord), the righteous judge, shall give me at that day: and not to me only, but unto all them also that love his appearing.* The numbered garments and crowns laid up for the faithful (8:14, 8:26) are Paul''s same laid-up crown of righteousness.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session403_asci8_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session403_asci8_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-8-sixth-heaven-ascent',
       E'Raised into the sixth heaven',
       E'Isaiah is carried higher still: *AND again he raised me into the air of the sixth heaven, and I saw such glory as I had not seen in the five heavens* (Ascension of Isaiah 8:1), so that *when I was in the sixth heaven I thought the light which I had seen in the five heavens to be but darkness* (Ascension of Isaiah 8:21). It ain''t new — Paul testifies to the same caught-up ascent through the heavens: *I knew a man in Messiah (Christ) above fourteen years ago, (whether in the body, I cannot tell; or whether out of the body, I cannot tell: Elohim (God) knoweth;) such an one caught up to the third heaven* (2 Corinthians 12:2), *How that he was caught up into paradise, and heard unspeakable words, which it is not lawful for a man to utter* (2 Corinthians 12:4). John too is summoned upward to the throne: *After this I looked, and, behold, a door was opened in heaven: and the first voice which I heard was as it were of a trumpet talking with me; which said, Come up hither, and I will shew thee things which must be hereafter* (Revelation 4:1).',
       sv.verse_id, ev.verse_id, 'extras', 67675
  FROM _session403_asci8_lookup sv, _session403_asci8_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=8 AND sv.verse_number=1
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=8 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-8-fellow-servant',
       E'I am not thy lord, but thy fellow servant',
       E'When Isaiah addresses his guide as ''my Lord,'' the angel refuses the honour: *And he said: ''I am not thy lord, but thy fellow servant''* (Ascension of Isaiah 8:5). It ain''t new — the angels of the Revelation refuse worship in the very same words: *And I fell at his feet to worship him. And he said unto me, See thou do it not: I am thy fellowservant, and of thy brethren that have the testimony of Yahusha (Jesus): worship Elohim (God)* (Revelation 19:10). So Gabriel names himself a servant who stands and is sent: *And the angel answering said unto him, I am Gabriel, that stand in the presence of Elohim (God); and am sent to speak unto thee, and to shew thee these glad tidings* (Luke 1:19).',
       sv.verse_id, ev.verse_id, 'extras', 67678
  FROM _session403_asci8_lookup sv, _session403_asci8_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=8 AND sv.verse_number=5
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=8 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-8-hidden-name-throne',
       E'He that is not named and the Elect One',
       E'Above the sixth heaven dwells the One whose name is unsearchable: *they are directed by the power of the seventh heaven, where dwelleth He that is not named and the Elect One, whose name has not been made known, and none of the heavens can learn His name* (Ascension of Isaiah 8:7), *For it is He alone to whose voice all the heavens and thrones give answer* (Ascension of Isaiah 8:8). It ain''t new — Isaiah''s own throne-vision shows the Holy One enthroned and worshipped: *In the year that king Uzziah died I saw also Yahuah (Lord) sitting upon a throne, high and lifted up, and his train filled the temple* (Isaiah 6:1), *And one cried unto another, and said, Holy, holy, holy, is Yahuah Tseva''ot (LORD of hosts): the whole earth is full of his glory* (Isaiah 6:3). And the heavenly host answer His voice as the elders and angels cry: *Saying with a loud voice, Worthy is the Lamb that was slain to receive power, and riches, and wisdom, and strength, and honour, and glory, and blessing* (Revelation 5:12).',
       sv.verse_id, ev.verse_id, 'extras', 67681
  FROM _session403_asci8_lookup sv, _session403_asci8_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=8 AND sv.verse_number=7
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=8 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-8-beloved-descends-in-your-form',
       E'Yahuah who will descend in your form',
       E'Here is the stunning pre-Christian witness to the incarnation. Isaiah is told he shall see *Yahuah (Lord) of all those heavens and these thrones* (Ascension of Isaiah 8:9), the Beloved *Undergoing successive transformation until He resembles your form and likeness* (Ascension of Isaiah 8:10), *who will descend in your form* (Ascension of Isaiah 8:26). It ain''t new — this is the mind of Messiah Paul preached: *Who, being in the form of Elohim (God), thought it not robbery to be equal with Elohim (God)* (Philippians 2:6), *But made himself of no reputation, and took upon him the form of a servant, and was made in the likeness of men* (Philippians 2:7). The Word descends and is made flesh: *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth* (John 1:14), *And no man hath ascended up to heaven, but he that came down from heaven, even the Son of Adam which is in heaven* (John 3:13). This is the great mystery foretold: *And without controversy great is the mystery of godliness: Elohim (God) was manifest in the flesh, justified in the Spirit, seen of angels, preached unto the Gentiles, believed on in the world, received up into glory* (1 Timothy 3:16).',
       sv.verse_id, ev.verse_id, 'extras', 67684
  FROM _session403_asci8_lookup sv, _session403_asci8_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=8 AND sv.verse_number=9
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=8 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-8-father-beloved-spirit',
       E'The primal Father, His Beloved, and the Ruach HaKodesh',
       E'In the sixth heaven the worship rises to the threefold Name with one voice: *And there they all named the primal Father and His Beloved, the Messiah (Christ), and the Ruach HaKodesh (Holy Spirit), all with one voice* (Ascension of Isaiah 8:18). It ain''t new — the Beloved is exalted that every tongue confess Him: *That at the name of Yahusha (Jesus) every knee should bow, of things in heaven, and things in earth, and things under the earth* (Philippians 2:10), *And that every tongue should confess that Yahusha HaMashiach (Jesus Christ) is Lord, to the glory of Elohim (God) the Father* (Philippians 2:11). And the Beloved is the brightness of the Father''s glory set above the angels: *Who being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power, when he had by himself purged our sins, sat down on the right hand of the Majesty on high* (Hebrews 1:3), *Being made so much better than the angels, as he hath by inheritance obtained a more excellent name than they* (Hebrews 1:4).',
       sv.verse_id, ev.verse_id, 'extras', 67687
  FROM _session403_asci8_lookup sv, _session403_asci8_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=8 AND sv.verse_number=18
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=8 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-8-garments-laid-up-righteous',
       E'The garments and crowns laid up for the righteous',
       E'Isaiah is promised the reward kept above for the faithful: *then thou wilt receive the garment which thou seest, and likewise other numbered garments laid up there thou wilt see* (Ascension of Isaiah 8:14), *the garments, and the thrones, and the crowns which are laid up for the righteous, for those who trust in that Yahuah (Lord) who will descend in your form* (Ascension of Isaiah 8:26). It ain''t new — the overcomers are clothed in white and crowned: *And to her was granted that she should be arrayed in fine linen, clean and white: for the fine linen is the righteousness of saints* (Revelation 19:8), and the laid-up reward is the believer''s hope: *Henceforth there is laid up for me a crown of righteousness, which Yahuah (Lord), the righteous judge, shall give me at that day: and not to me only, but unto all them also that love his appearing* (2 Timothy 4:8).',
       sv.verse_id, ev.verse_id, 'extras', 67690
  FROM _session403_asci8_lookup sv, _session403_asci8_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=8 AND sv.verse_number=14
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=8 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ascension-isaiah-8-sixth-heaven-ascent
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Corinthians 12:2 — *I knew a man in Messiah (Christ) above fourteen years ago, (whether in the body, I cannot tell; or whether out of the body, I cannot tell: Elohim (God) knoweth;) such an one caught up to the third heaven.* Paul is caught up through the heavens just as Isaiah is raised into the air of the sixth heaven (8:1).'
  FROM cross_reference_threads t, cross_references x, _session403_asci8_lookup sv, _session403_asci8_lookup tv
 WHERE t.slug='ascension-isaiah-8-sixth-heaven-ascent'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=8 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Corinthians 12:4 — *How that he was caught up into paradise, and heard unspeakable words, which it is not lawful for a man to utter.* The unspeakable glory Paul cannot utter is the same glory Isaiah says surpasses all the lower heavens (8:1).'
  FROM cross_reference_threads t, cross_references x, _session403_asci8_lookup sv, _session403_asci8_lookup tv
 WHERE t.slug='ascension-isaiah-8-sixth-heaven-ascent'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=8 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=12 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 4:1 — *After this I looked, and, behold, a door was opened in heaven: and the first voice which I heard was as it were of a trumpet talking with me; which said, Come up hither, and I will shew thee things which must be hereafter.* John is called up into heaven to be shown things to come, as Isaiah is raised to see what no returning man has seen (8:1).'
  FROM cross_reference_threads t, cross_references x, _session403_asci8_lookup sv, _session403_asci8_lookup tv
 WHERE t.slug='ascension-isaiah-8-sixth-heaven-ascent'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=8 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=4 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-8-fellow-servant
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 19:10 — *And I fell at his feet to worship him. And he said unto me, See thou do it not: I am thy fellowservant, and of thy brethren that have the testimony of Yahusha (Jesus): worship Elohim (God): for the testimony of Yahusha (Jesus) is the spirit of prophecy.* The angel forbids worship and calls himself a fellowservant, exactly as Isaiah''s guide says ''I am not thy lord, but thy fellow servant'' (8:5).'
  FROM cross_reference_threads t, cross_references x, _session403_asci8_lookup sv, _session403_asci8_lookup tv
 WHERE t.slug='ascension-isaiah-8-fellow-servant'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=8 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=19 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 1:19 — *And the angel answering said unto him, I am Gabriel, that stand in the presence of Elohim (God); and am sent to speak unto thee, and to shew thee these glad tidings.* Gabriel is a sent servant standing before Elohim, as Isaiah''s guide is empowered and sent to raise him (8:5, 8:8).'
  FROM cross_reference_threads t, cross_references x, _session403_asci8_lookup sv, _session403_asci8_lookup tv
 WHERE t.slug='ascension-isaiah-8-fellow-servant'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=8 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-8-hidden-name-throne
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 6:1 — *In the year that king Uzziah died I saw also Yahuah (Lord) sitting upon a throne, high and lifted up, and his train filled the temple.* The prophet''s earlier throne-vision shows the Enthroned One whose seat in the seventh heaven Isaiah now ascends toward (8:7).'
  FROM cross_reference_threads t, cross_references x, _session403_asci8_lookup sv, _session403_asci8_lookup tv
 WHERE t.slug='ascension-isaiah-8-hidden-name-throne'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=8 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=6 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 6:3 — *And one cried unto another, and said, Holy, holy, holy, is Yahuah Tseva''ot (LORD of hosts): the whole earth is full of his glory.* The seraphim hallow the unnamed Holy One whose name none of the heavens can learn (8:7).'
  FROM cross_reference_threads t, cross_references x, _session403_asci8_lookup sv, _session403_asci8_lookup tv
 WHERE t.slug='ascension-isaiah-8-hidden-name-throne'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=8 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=6 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 5:12 — *Saying with a loud voice, Worthy is the Lamb that was slain to receive power, and riches, and wisdom, and strength, and honour, and glory, and blessing.* The whole heavenly host answer with one voice, as in Isaiah''s vision He alone is the One to whose voice all the heavens and thrones give answer (8:8).'
  FROM cross_reference_threads t, cross_references x, _session403_asci8_lookup sv, _session403_asci8_lookup tv
 WHERE t.slug='ascension-isaiah-8-hidden-name-throne'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=8 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=5 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-8-beloved-descends-in-your-form
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Philippians 2:7 — *But made himself of no reputation, and took upon him the form of a servant, and was made in the likeness of men.* The Beloved undergoes transformation until He resembles your form and likeness (8:10), exactly the self-emptying into man''s likeness Paul names.'
  FROM cross_reference_threads t, cross_references x, _session403_asci8_lookup sv, _session403_asci8_lookup tv
 WHERE t.slug='ascension-isaiah-8-beloved-descends-in-your-form'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=8 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Philippians 2:6 — *Who, being in the form of Elohim (God), thought it not robbery to be equal with Elohim (God).* The One in the form of Elohim is the Yahuah who will descend in your form (8:26).'
  FROM cross_reference_threads t, cross_references x, _session403_asci8_lookup sv, _session403_asci8_lookup tv
 WHERE t.slug='ascension-isaiah-8-beloved-descends-in-your-form'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=8 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The Beloved''s transformation into your form and likeness (8:10) is the Word made flesh.'
  FROM cross_reference_threads t, cross_references x, _session403_asci8_lookup sv, _session403_asci8_lookup tv
 WHERE t.slug='ascension-isaiah-8-beloved-descends-in-your-form'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=8 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'John 3:13 — *And no man hath ascended up to heaven, but he that came down from heaven, even the Son of Adam which is in heaven.* The One who came down from heaven is the Yahuah Isaiah is told will descend in your form (8:26).'
  FROM cross_reference_threads t, cross_references x, _session403_asci8_lookup sv, _session403_asci8_lookup tv
 WHERE t.slug='ascension-isaiah-8-beloved-descends-in-your-form'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=8 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=3 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Timothy 3:16 — *And without controversy great is the mystery of godliness: Elohim (God) was manifest in the flesh, justified in the Spirit, seen of angels, preached unto the Gentiles, believed on in the world, received up into glory.* The mystery of Elohim manifest in the flesh is the descent in your form Isaiah is shown beforehand (8:26).'
  FROM cross_reference_threads t, cross_references x, _session403_asci8_lookup sv, _session403_asci8_lookup tv
 WHERE t.slug='ascension-isaiah-8-beloved-descends-in-your-form'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=8 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='1-timothy' AND tv.chapter_number=3 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-8-father-beloved-spirit
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Philippians 2:10 — *That at the name of Yahusha (Jesus) every knee should bow, of things in heaven, and things in earth, and things under the earth.* The Beloved named and worshipped with one voice in the sixth heaven (8:18) is the One before whose name every knee bows.'
  FROM cross_reference_threads t, cross_references x, _session403_asci8_lookup sv, _session403_asci8_lookup tv
 WHERE t.slug='ascension-isaiah-8-father-beloved-spirit'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=8 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Philippians 2:11 — *And that every tongue should confess that Yahusha HaMashiach (Jesus Christ) is Lord, to the glory of Elohim (God) the Father.* Every tongue confessing the Messiah to the glory of the Father matches the angels naming the Father and His Beloved with one voice (8:18).'
  FROM cross_reference_threads t, cross_references x, _session403_asci8_lookup sv, _session403_asci8_lookup tv
 WHERE t.slug='ascension-isaiah-8-father-beloved-spirit'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=8 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 1:3 — *Who being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power, when he had by himself purged our sins, sat down on the right hand of the Majesty on high.* The Beloved hymned beside the primal Father (8:18) is the brightness of His glory who sits at His right hand.'
  FROM cross_reference_threads t, cross_references x, _session403_asci8_lookup sv, _session403_asci8_lookup tv
 WHERE t.slug='ascension-isaiah-8-father-beloved-spirit'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=8 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-8-garments-laid-up-righteous
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 19:8 — *And to her was granted that she should be arrayed in fine linen, clean and white: for the fine linen is the righteousness of saints.* The garments laid up for the righteous (8:26) are the white raiment of the saints'' righteousness.'
  FROM cross_reference_threads t, cross_references x, _session403_asci8_lookup sv, _session403_asci8_lookup tv
 WHERE t.slug='ascension-isaiah-8-garments-laid-up-righteous'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=8 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=19 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Timothy 4:8 — *Henceforth there is laid up for me a crown of righteousness, which Yahuah (Lord), the righteous judge, shall give me at that day: and not to me only, but unto all them also that love his appearing.* The numbered garments and crowns laid up for the faithful (8:14, 8:26) are Paul''s same laid-up crown of righteousness.'
  FROM cross_reference_threads t, cross_references x, _session403_asci8_lookup sv, _session403_asci8_lookup tv
 WHERE t.slug='ascension-isaiah-8-garments-laid-up-righteous'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=8 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='2-timothy' AND tv.chapter_number=4 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ascensionisaiah_09.sql (session403 ascension-isaiah 9) -----
-- Source anchor: ascension-isaiah/ascension-isaiah ch9. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: asci9 (view _session403_asci9_lookup). Sort band base 67700, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session403_asci9_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ascension-isaiah-9-permitted-by-the-father
  ('ascension-isaiah', 'ascension-isaiah', 9, 5, 'canon', 'john', 1, 1, 'free', E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Beloved who permits Isaiah''s ascent is the Word who was WITH the Father — distinct in order, yet not a made thing, exactly as Ascension 9:5 names Him ''Yahuah Messiah'' before He is ''Jesus'' in the world.'),
  ('ascension-isaiah', 'ascension-isaiah', 9, 5, 'canon', 'hebrews', 1, 2, 'free', E'Hebrews 1:2 — *Hath in these last days spoken unto us by his Son, whom he hath appointed heir of all things, by whom also he made the worlds;* The ''Lord Christ'' of 9:5 is the Son the Father speaks through and appoints — begotten and heir, ordered under the One who appointed Him.'),
  ('ascension-isaiah', 'ascension-isaiah', 9, 5, 'canon', 'john', 17, 5, 'free', E'John 17:5 — *And now, O Father, glorify thou me with thine own self with the glory which I had with thee before the world was.* The hidden name Isaiah ''cannot hear till he has ascended'' is the glory the Son had with the Father before the world — the Formed Son asking the Father for what was already His.'),
  -- thread: ascension-isaiah-9-descent-hidden-from-the-heavens
  ('ascension-isaiah', 'ascension-isaiah', 9, 14, 'canon', '1-corinthians', 2, 8, 'free', E'1 Corinthians 2:8 — *Which none of the princes of this world knew: for had they known it, they would not have crucified Yahuah (Lord) of glory.* Paul says exactly what 9:14 foretells: they ''slay Him not knowing who He is'' — the Lord of glory crucified by a world blind to His descent.'),
  ('ascension-isaiah', 'ascension-isaiah', 9, 14, 'canon', 'philippians', 2, 7, 'free', E'Philippians 2:7 — *But made himself of no reputation, and took upon him the form of a servant, and was made in the likeness of men:* The Son''s likeness is veiled through the heavens (9:15) just as the Formed Son empties Himself into the form of a servant — hidden, not diminished.'),
  ('ascension-isaiah', 'ascension-isaiah', 9, 15, 'canon', 'isaiah', 53, 2, 'free', E'Isaiah 53:2 — *For he shall grow up before him as a tender plant, and as a root out of a dry ground: he hath no form nor comeliness; and when we shall see him, there is no beauty that we should desire him.* The descent ''hidden even from the heavens'' lands as Isaiah''s own no-form-nor-comeliness — the prophet himself foretold the disguised coming.'),
  ('ascension-isaiah', 'ascension-isaiah', 9, 15, 'canon', 'ephesians', 4, 10, 'free', E'Ephesians 4:9-10 — *(Now that he ascended, what is it but that he also descended first into the lower parts of the earth? He that descended is the same also that ascended up far above all heavens, that he might fill all things.)* The hidden descender of 9:15 is the same One who ascends ''far above all heavens'' — one Person veiled in coming, exalted in returning.'),
  -- thread: ascension-isaiah-9-third-day-and-the-ascent
  ('ascension-isaiah', 'ascension-isaiah', 9, 16, 'canon', 'philippians', 2, 9, 'free', E'Philippians 2:9 — *Wherefore Elohim (God) also hath highly exalted him, and given him a name which is above every name:* The ascent of 9:16 is the Father''s exaltation of the Son who first descended and died — the Formed Son raised by the One above Him, not raising Himself as a co-equal.'),
  ('ascension-isaiah', 'ascension-isaiah', 9, 16, 'canon', 'hebrews', 2, 9, 'free', E'Hebrews 2:9 — *But we see Yahusha (Jesus), who was made a little lower than the angels for the suffering of death, crowned with glory and honour; that he by the grace of Elohim (God) should taste death for every man.* Plundering the angel of death (9:16) is the Son who tasted death now crowned — lowered, then crowned, in that order.'),
  ('ascension-isaiah', 'ascension-isaiah', 9, 18, 'canon', '1-timothy', 3, 16, 'free', E'1 Timothy 3:16 — *And without controversy great is the mystery of godliness: Elohim (God) was manifest in the flesh, justified in the Spirit, seen of angels, preached unto the Gentiles, believed on in the world, received up into glory.* The Son ''received up into glory'' is exactly His ascent into the seventh heaven in 9:18 — manifest in flesh below, received in glory above.'),
  -- thread: ascension-isaiah-9-garments-thrones-crowns-laid-up
  ('ascension-isaiah', 'ascension-isaiah', 9, 8, 'canon', 'hebrews', 11, 5, 'free', E'Hebrews 11:5 — *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God).* The very Enoch Isaiah sees ''in garments of the upper world'' (9:8) is the Enoch Scripture says was translated for pleasing Elohim — it ain''t new.'),
  ('ascension-isaiah', 'ascension-isaiah', 9, 10, 'canon', 'revelation', 6, 11, 'free', E'Revelation 6:11 — *And white robes were given unto every one of them; and it was said unto them, that they should rest yet for a little season, until their fellowservants also and their brethren, that should be killed as they were, should be fulfilled.* The righteous robed but not yet throned (9:10) match John''s souls given white robes and told to wait until the number is fulfilled.'),
  ('ascension-isaiah', 'ascension-isaiah', 9, 24, 'canon', 'revelation', 3, 5, 'free', E'Revelation 3:5 — *He that overcometh, the same shall be clothed in white raiment; and I will not blot out his name out of the book of life, but I will confess his name before my Father, and before his angels.* The garments and crowns ''laid up'' in 9:24 are promised to the overcomer — white raiment kept for those who believe, exactly as 9:26 explains.'),
  ('ascension-isaiah', 'ascension-isaiah', 9, 24, 'canon', 'colossians', 1, 5, 'free', E'Colossians 1:5 — *For the hope which is laid up for you in heaven, whereof ye heard before in the word of the truth of the gospel;* Paul uses Isaiah''s own image — the hope ''laid up in heaven'' is the garments, thrones, and crowns Isaiah literally sees laid up in 9:24.'),
  -- thread: ascension-isaiah-9-ordered-worship-father-beloved-spirit
  ('ascension-isaiah', 'ascension-isaiah', 9, 31, 'canon', 'hebrews', 1, 6, 'free', E'Hebrews 1:6 — *And again, when he bringeth in the firstbegotten into the world, he saith, And let all the angels of Elohim (God) worship him.* Isaiah is told ''Worship this One'' (9:31) by the Father''s command — the same command Hebrews records: the Father bids the angels worship the firstbegotten Son.'),
  ('ascension-isaiah', 'ascension-isaiah', 9, 40, 'canon', 'philippians', 2, 11, 'free', E'Philippians 2:11 — *And that every tongue should confess that Yahusha HaMashiach (Jesus Christ) is Lord, to the glory of Elohim (God) the Father.* The Beloved and the Spirit praising Elohim together (9:40) is the very order Paul guards — the Son confessed Lord but TO the glory of the Father, never co-equal collapse.'),
  ('ascension-isaiah', 'ascension-isaiah', 9, 40, 'canon', 'revelation', 5, 13, 'free', E'Revelation 5:13 — *And every creature which is in heaven, and on the earth, and under the earth, and such as are in the sea, and all that are in them, heard I saying, Blessing, and honour, and glory, and power, be unto him that sitteth upon the throne, and unto the Lamb for ever and ever.* John keeps the same ordered two-fold praise — to Him on the throne AND to the Lamb — that Isaiah sees when the Beloved Himself worships the Great Glory in 9:40.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session403_asci9_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session403_asci9_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-9-permitted-by-the-father',
       E'The Beloved who permits the ascent has a Father — the Formed Son, ordered under the One',
       E'Isaiah is forbidden by one and permitted by Another: *And He who permitted thee, this is thy Yahuah Elohim (LORD God), Yahuah (Lord) Messiah (Christ), who will be called ''Jesus'' in the world, but His name thou canst not hear till thou hast ascended out of thy body.* (Ascension of Isaiah 9:5). The Vision names the Beloved outright — He IS the Messiah, Yahusha the Formed Son — yet the whole movement of this chapter keeps Him *ordered under* the Great Glory: He is the One who grants the ascent, but He Himself worships the Most High (9:40). It ain''t new. John opens the same way: the Word who was WITH the Father — distinct, not the Father Himself — and yet not a created thing, *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* (John 1:1). He is the begotten Son the Father speaks through, *Hath in these last days spoken unto us by his Son, whom he hath appointed heir of all things, by whom also he made the worlds;* (Hebrews 1:2), and the glory He re-takes is the glory He had before the world, when He prays *And now, O Father, glorify thou me with thine own self with the glory which I had with thee before the world was.* (John 17:5). Not co-equal modalism, not a mere angel — the Formed Son, sent and named.',
       sv.verse_id, ev.verse_id, 'extras', 67700
  FROM _session403_asci9_lookup sv, _session403_asci9_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=9 AND sv.verse_number=5
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=9 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-9-descent-hidden-from-the-heavens',
       E'The descent hidden from the heavens — they crucified Him not knowing who He is',
       E'The angel foretells the Beloved''s descent in disguise: *And the god of that world will stretch forth his hand against the Son, and they will crucify Him on a tree, and will slay Him not knowing who He is.* (Ascension of Isaiah 9:14), *And thus His descent, as you will see, will be hidden even from the heavens, so that it will not be known who He is.* (Ascension of Isaiah 9:15). It ain''t new — Paul says the very same: the rulers were blind to the Lord of glory, *Which none of the princes of this world knew: for had they known it, they would not have crucified Yahuah (Lord) of glory.* (1 Corinthians 2:8). The Formed Son emptied His likeness through every heaven so the powers would not know Him — *But made himself of no reputation, and took upon him the form of a servant, and was made in the likeness of men:* (Philippians 2:7) — and so He came with *no form nor comeliness* (Isaiah 53:2). This is descent, not demotion: the One who came down is the One who fills all heavens, *(Now that he ascended, what is it but that he also descended first into the lower parts of the earth? He that descended is the same also that ascended up far above all heavens, that he might fill all things.)* (Ephesians 4:9-10).',
       sv.verse_id, ev.verse_id, 'extras', 67703
  FROM _session403_asci9_lookup sv, _session403_asci9_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=9 AND sv.verse_number=14
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=9 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-9-third-day-and-the-ascent',
       E'He plunders death, rises the third day, and ascends to the seventh heaven',
       E'After the cross the angel shows the rising and return: *And when He hath plundered the angel of death, He will ascend on the third day, and he will remain in that world five hundred and forty-five days.* (Ascension of Isaiah 9:16), and the righteous ascend WITH Him: *And then many of the righteous will ascend with Him, whose spirits do not receive their garments till Yahuah (Lord) Messiah (Christ) ascend and they ascend with Him.* (Ascension of Isaiah 9:17). It ain''t new. Because the Formed Son became obedient unto death, the Father exalts Him — *Wherefore Elohim (God) also hath highly exalted him, and given him a name which is above every name:* (Philippians 2:9) — the same Son made a little lower than the angels and now crowned, *But we see Yahusha (Jesus), who was made a little lower than the angels for the suffering of death, crowned with glory and honour; that he by the grace of Elohim (God) should taste death for every man.* (Hebrews 2:9). The mystery the angels see at last is the gospel itself: *And without controversy great is the mystery of godliness: Elohim (God) was manifest in the flesh, justified in the Spirit, seen of angels, preached unto the Gentiles, believed on in the world, received up into glory.* (1 Timothy 3:16).',
       sv.verse_id, ev.verse_id, 'extras', 67706
  FROM _session403_asci9_lookup sv, _session403_asci9_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=9 AND sv.verse_number=16
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=9 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-9-garments-thrones-crowns-laid-up',
       E'Garments, thrones, and crowns laid up — Enoch and the righteous in the seventh heaven',
       E'In the seventh heaven Isaiah sees the righteous already clothed but waiting: *And there I saw Enoch and all who were with him, stript of the garments of the flesh, and I saw them in their garments of the upper world, and they were like angels, standing there in great glory.* (Ascension of Isaiah 9:8), *But they sat not on their thrones, nor were their crowns of glory on them.* (Ascension of Isaiah 9:10), and the laid-up rewards: *And I saw there many garments laid up, and many thrones and many crowns.* (Ascension of Isaiah 9:24). It ain''t new. The Enoch Isaiah names is the Enoch translated by faith, *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God).* (Hebrews 11:5). The white robes and the wait are John''s vision too — *And white robes were given unto every one of them; and it was said unto them, that they should rest yet for a little season, until their fellowservants also and their brethren, that should be killed as they were, should be fulfilled.* (Revelation 6:11) — and the crowns laid up are the overcomer''s, *He that overcometh, the same shall be clothed in white raiment; and I will not blot out his name out of the book of life, but I will confess his name before my Father, and before his angels.* (Revelation 3:5). The hope is literally ''laid up,'' *For the hope which is laid up for you in heaven, whereof ye heard before in the word of the truth of the gospel;* (Colossians 1:5).',
       sv.verse_id, ev.verse_id, 'extras', 67709
  FROM _session403_asci9_lookup sv, _session403_asci9_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=9 AND sv.verse_number=8
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=9 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-9-ordered-worship-father-beloved-spirit',
       E'The ordered worship — the Beloved and the Spirit worship the Great Glory',
       E'The climax guards the order of worship. First the Beloved is worshipped at the Father''s command: *And thereupon the angel who conducted me said to me: "Worship this One," and I worshipped and praised.* (Ascension of Isaiah 9:31). Then the angel of the Spirit on the left (9:36). But above both stands the Great Glory whom none can behold (9:37) — and the Beloved Himself worships Him: *And I saw how my Lord and the angel of the Spirit worshipped, and they both together praised Elohim (God).* (Ascension of Isaiah 9:40). This is Yoshi''s Formed-Son order exactly: the Son is worshipped at the Father''s word, yet the Son worships the Father. It ain''t new. The Father commands the heavens to bow to the firstbegotten, *And again, when he bringeth in the firstbegotten into the world, he saith, And let all the angels of Elohim (God) worship him.* (Hebrews 1:6); every knee bows at His name *to the glory of Elohim (God) the Father* — *And that every tongue should confess that Yahusha HaMashiach (Jesus Christ) is Lord, to the glory of Elohim (God) the Father.* (Philippians 2:11). John''s throne-room keeps the same two-fold order, blessing to Him on the throne AND to the Lamb, *And every creature which is in heaven, and on the earth, and under the earth, and such as are in the sea, and all that are in them, heard I saying, Blessing, and honour, and glory, and power, be unto him that sitteth upon the throne, and unto the Lamb for ever and ever.* (Revelation 5:13). Not flattened to co-equality, not denied His exaltation — the Beloved exalted by, and bowing to, the One.',
       sv.verse_id, ev.verse_id, 'extras', 67712
  FROM _session403_asci9_lookup sv, _session403_asci9_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=9 AND sv.verse_number=31
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=9 AND ev.verse_number=40
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ascension-isaiah-9-permitted-by-the-father
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Beloved who permits Isaiah''s ascent is the Word who was WITH the Father — distinct in order, yet not a made thing, exactly as Ascension 9:5 names Him ''Yahuah Messiah'' before He is ''Jesus'' in the world.'
  FROM cross_reference_threads t, cross_references x, _session403_asci9_lookup sv, _session403_asci9_lookup tv
 WHERE t.slug='ascension-isaiah-9-permitted-by-the-father'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=9 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 1:2 — *Hath in these last days spoken unto us by his Son, whom he hath appointed heir of all things, by whom also he made the worlds;* The ''Lord Christ'' of 9:5 is the Son the Father speaks through and appoints — begotten and heir, ordered under the One who appointed Him.'
  FROM cross_reference_threads t, cross_references x, _session403_asci9_lookup sv, _session403_asci9_lookup tv
 WHERE t.slug='ascension-isaiah-9-permitted-by-the-father'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=9 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 17:5 — *And now, O Father, glorify thou me with thine own self with the glory which I had with thee before the world was.* The hidden name Isaiah ''cannot hear till he has ascended'' is the glory the Son had with the Father before the world — the Formed Son asking the Father for what was already His.'
  FROM cross_reference_threads t, cross_references x, _session403_asci9_lookup sv, _session403_asci9_lookup tv
 WHERE t.slug='ascension-isaiah-9-permitted-by-the-father'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=9 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=17 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-9-descent-hidden-from-the-heavens
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Corinthians 2:8 — *Which none of the princes of this world knew: for had they known it, they would not have crucified Yahuah (Lord) of glory.* Paul says exactly what 9:14 foretells: they ''slay Him not knowing who He is'' — the Lord of glory crucified by a world blind to His descent.'
  FROM cross_reference_threads t, cross_references x, _session403_asci9_lookup sv, _session403_asci9_lookup tv
 WHERE t.slug='ascension-isaiah-9-descent-hidden-from-the-heavens'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=9 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=2 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Philippians 2:7 — *But made himself of no reputation, and took upon him the form of a servant, and was made in the likeness of men:* The Son''s likeness is veiled through the heavens (9:15) just as the Formed Son empties Himself into the form of a servant — hidden, not diminished.'
  FROM cross_reference_threads t, cross_references x, _session403_asci9_lookup sv, _session403_asci9_lookup tv
 WHERE t.slug='ascension-isaiah-9-descent-hidden-from-the-heavens'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=9 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 53:2 — *For he shall grow up before him as a tender plant, and as a root out of a dry ground: he hath no form nor comeliness; and when we shall see him, there is no beauty that we should desire him.* The descent ''hidden even from the heavens'' lands as Isaiah''s own no-form-nor-comeliness — the prophet himself foretold the disguised coming.'
  FROM cross_reference_threads t, cross_references x, _session403_asci9_lookup sv, _session403_asci9_lookup tv
 WHERE t.slug='ascension-isaiah-9-descent-hidden-from-the-heavens'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=9 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ephesians 4:9-10 — *(Now that he ascended, what is it but that he also descended first into the lower parts of the earth? He that descended is the same also that ascended up far above all heavens, that he might fill all things.)* The hidden descender of 9:15 is the same One who ascends ''far above all heavens'' — one Person veiled in coming, exalted in returning.'
  FROM cross_reference_threads t, cross_references x, _session403_asci9_lookup sv, _session403_asci9_lookup tv
 WHERE t.slug='ascension-isaiah-9-descent-hidden-from-the-heavens'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=9 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=4 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-9-third-day-and-the-ascent
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Philippians 2:9 — *Wherefore Elohim (God) also hath highly exalted him, and given him a name which is above every name:* The ascent of 9:16 is the Father''s exaltation of the Son who first descended and died — the Formed Son raised by the One above Him, not raising Himself as a co-equal.'
  FROM cross_reference_threads t, cross_references x, _session403_asci9_lookup sv, _session403_asci9_lookup tv
 WHERE t.slug='ascension-isaiah-9-third-day-and-the-ascent'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=9 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 2:9 — *But we see Yahusha (Jesus), who was made a little lower than the angels for the suffering of death, crowned with glory and honour; that he by the grace of Elohim (God) should taste death for every man.* Plundering the angel of death (9:16) is the Son who tasted death now crowned — lowered, then crowned, in that order.'
  FROM cross_reference_threads t, cross_references x, _session403_asci9_lookup sv, _session403_asci9_lookup tv
 WHERE t.slug='ascension-isaiah-9-third-day-and-the-ascent'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=9 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Timothy 3:16 — *And without controversy great is the mystery of godliness: Elohim (God) was manifest in the flesh, justified in the Spirit, seen of angels, preached unto the Gentiles, believed on in the world, received up into glory.* The Son ''received up into glory'' is exactly His ascent into the seventh heaven in 9:18 — manifest in flesh below, received in glory above.'
  FROM cross_reference_threads t, cross_references x, _session403_asci9_lookup sv, _session403_asci9_lookup tv
 WHERE t.slug='ascension-isaiah-9-third-day-and-the-ascent'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=9 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='1-timothy' AND tv.chapter_number=3 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-9-garments-thrones-crowns-laid-up
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 11:5 — *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God).* The very Enoch Isaiah sees ''in garments of the upper world'' (9:8) is the Enoch Scripture says was translated for pleasing Elohim — it ain''t new.'
  FROM cross_reference_threads t, cross_references x, _session403_asci9_lookup sv, _session403_asci9_lookup tv
 WHERE t.slug='ascension-isaiah-9-garments-thrones-crowns-laid-up'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=9 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 6:11 — *And white robes were given unto every one of them; and it was said unto them, that they should rest yet for a little season, until their fellowservants also and their brethren, that should be killed as they were, should be fulfilled.* The righteous robed but not yet throned (9:10) match John''s souls given white robes and told to wait until the number is fulfilled.'
  FROM cross_reference_threads t, cross_references x, _session403_asci9_lookup sv, _session403_asci9_lookup tv
 WHERE t.slug='ascension-isaiah-9-garments-thrones-crowns-laid-up'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=9 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=6 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 3:5 — *He that overcometh, the same shall be clothed in white raiment; and I will not blot out his name out of the book of life, but I will confess his name before my Father, and before his angels.* The garments and crowns ''laid up'' in 9:24 are promised to the overcomer — white raiment kept for those who believe, exactly as 9:26 explains.'
  FROM cross_reference_threads t, cross_references x, _session403_asci9_lookup sv, _session403_asci9_lookup tv
 WHERE t.slug='ascension-isaiah-9-garments-thrones-crowns-laid-up'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=9 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=3 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Colossians 1:5 — *For the hope which is laid up for you in heaven, whereof ye heard before in the word of the truth of the gospel;* Paul uses Isaiah''s own image — the hope ''laid up in heaven'' is the garments, thrones, and crowns Isaiah literally sees laid up in 9:24.'
  FROM cross_reference_threads t, cross_references x, _session403_asci9_lookup sv, _session403_asci9_lookup tv
 WHERE t.slug='ascension-isaiah-9-garments-thrones-crowns-laid-up'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=9 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=1 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-9-ordered-worship-father-beloved-spirit
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 1:6 — *And again, when he bringeth in the firstbegotten into the world, he saith, And let all the angels of Elohim (God) worship him.* Isaiah is told ''Worship this One'' (9:31) by the Father''s command — the same command Hebrews records: the Father bids the angels worship the firstbegotten Son.'
  FROM cross_reference_threads t, cross_references x, _session403_asci9_lookup sv, _session403_asci9_lookup tv
 WHERE t.slug='ascension-isaiah-9-ordered-worship-father-beloved-spirit'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=9 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Philippians 2:11 — *And that every tongue should confess that Yahusha HaMashiach (Jesus Christ) is Lord, to the glory of Elohim (God) the Father.* The Beloved and the Spirit praising Elohim together (9:40) is the very order Paul guards — the Son confessed Lord but TO the glory of the Father, never co-equal collapse.'
  FROM cross_reference_threads t, cross_references x, _session403_asci9_lookup sv, _session403_asci9_lookup tv
 WHERE t.slug='ascension-isaiah-9-ordered-worship-father-beloved-spirit'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=9 AND sv.verse_number=40
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 5:13 — *And every creature which is in heaven, and on the earth, and under the earth, and such as are in the sea, and all that are in them, heard I saying, Blessing, and honour, and glory, and power, be unto him that sitteth upon the throne, and unto the Lamb for ever and ever.* John keeps the same ordered two-fold praise — to Him on the throne AND to the Lamb — that Isaiah sees when the Beloved Himself worships the Great Glory in 9:40.'
  FROM cross_reference_threads t, cross_references x, _session403_asci9_lookup sv, _session403_asci9_lookup tv
 WHERE t.slug='ascension-isaiah-9-ordered-worship-father-beloved-spirit'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=9 AND sv.verse_number=40
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=5 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ascensionisaiah_10.sql (session403 ascension-isaiah 10) -----
-- Source anchor: ascension-isaiah/ascension-isaiah ch10. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: asci10 (view _session403_asci10_lookup). Sort band base 67725, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session403_asci10_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ascension-isaiah-10-the-father-of-my-lord
  ('ascension-isaiah', 'ascension-isaiah', 10, 7, 'canon', 'philippians', 2, 6, 'free', E'Philippians 2:6 — *Who, being in the form of Elohim (God), thought it not robbery to be equal with Elohim (God):* The Most High speaking TO the Beloved (10:7) shows the order Paul guards — the Son in the Father''s form yet sent, not grasping co-equality.'),
  ('ascension-isaiah', 'ascension-isaiah', 10, 7, 'canon', 'hebrews', 1, 5, 'free', E'Hebrews 1:5 — *For unto which of the angels said he at any time, Thou art my Son, this day have I begotten thee? And again, I will be to him a Father, and he shall be to me a Son?* The "Father of my Lord" (10:7) is the begetting Father — the Beloved is the begotten Son, not one of the angels He outranks.'),
  ('ascension-isaiah', 'ascension-isaiah', 10, 6, 'canon', 'john', 17, 5, 'free', E'John 17:5 — *And now, O Father, glorify thou me with thine own self with the glory which I had with thee before the world was.* The glory the Most High holds (10:6) is the glory the Son shared before His descent and asks back after it.'),
  ('ascension-isaiah', 'ascension-isaiah', 10, 8, 'canon', 'proverbs', 30, 4, 'free', E'Proverbs 30:4 — *Who hath ascended up into heaven, or descended? who hath gathered the wind in his fists? who hath bound the waters in a garment? who hath established all the ends of the earth? what is his name, and what is his son''s name, if thou canst tell?* The descent commanded in 10:8 answers Agur''s ancient riddle: the Most High has a Son who descends.'),
  -- thread: ascension-isaiah-10-transformed-unknown
  ('ascension-isaiah', 'ascension-isaiah', 10, 11, 'canon', '1-corinthians', 2, 8, 'free', E'1 Corinthians 2:8 — *Which none of the princes of this world knew: for had they known it, they would not have crucified Yahuah (Lord) of glory.* Exactly the Ascension''s logic: the Beloved was so transformed (10:11) that the rulers did not know Him — had they known, they would not have crucified Him.'),
  ('ascension-isaiah', 'ascension-isaiah', 10, 9, 'canon', 'philippians', 2, 7, 'free', E'Philippians 2:7 — *But made himself of no reputation, and took upon him the form of a servant, and was made in the likeness of men:* The command to become "like unto the likeness" of each rank (10:9) is the self-emptying Paul preaches — the Formed Son took the servant''s form.'),
  ('ascension-isaiah', 'ascension-isaiah', 10, 10, 'canon', 'isaiah', 53, 2, 'free', E'Isaiah 53:2 — *For he shall grow up before him as a tender plant, and as a root out of a dry ground: he hath no form nor comeliness; and when we shall see him, there is no beauty that we should desire him.* The veiled "form" through the heavens (10:10) is the same hidden comeliness the prophet foresaw on earth.'),
  ('ascension-isaiah', 'ascension-isaiah', 10, 11, 'canon', 'john', 1, 14, 'free', E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The One unknown to the angels (10:11) is the Word veiled in flesh, His glory beheld only by those given eyes.'),
  -- thread: ascension-isaiah-10-none-beside-us
  ('ascension-isaiah', 'ascension-isaiah', 10, 13, 'canon', 'isaiah', 45, 5, 'free', E'Isaiah 45:5 — *I am Yahuah (LORD), and there is none else, there is no Elohim (God) beside me: I girded thee, though thou hast not known me:* The boast of the rebel powers (10:13) is a theft of Yahuah''s own exclusive confession — His alone to make, blasphemy in their mouths.'),
  ('ascension-isaiah', 'ascension-isaiah', 10, 13, 'canon', 'isaiah', 45, 21, 'free', E'Isaiah 45:21 — *Tell ye, and bring them near; yea, let them take counsel together: who hath declared this from ancient time? who hath told it from that time? have not I Yahuah (LORD)? and there is no Elohim (God) else beside me; a just Elohim (God) and a Saviour; there is none beside me.* The gods who say "there is none beside us" (10:13) counterfeit the Saviour''s own word — and so are marked for the judgment the Beloved is sent to bring.'),
  -- thread: ascension-isaiah-10-exalted-right-hand
  ('ascension-isaiah', 'ascension-isaiah', 10, 14, 'canon', 'philippians', 2, 9, 'free', E'Philippians 2:9 — *Wherefore Elohim (God) also hath highly exalted him, and given him a name which is above every name:* The ascent "in glory" to sit at the right hand (10:14) is the exaltation Paul names — granted BY the Father after the descent, the Formed-Son order intact.'),
  ('ascension-isaiah', 'ascension-isaiah', 10, 15, 'canon', 'philippians', 2, 10, 'free', E'Philippians 2:10 — *That at the name of Yahusha (Jesus) every knee should bow, of things in heaven, and things in earth, and things under the earth;* The princes and powers worshipping the returned Beloved (10:15) are the knees in heaven, earth, and under the earth that bow at His exalted name.'),
  ('ascension-isaiah', 'ascension-isaiah', 10, 14, 'canon', 'hebrews', 1, 3, 'free', E'Hebrews 1:3 — *Who being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power, when he had by himself purged our sins, sat down on the right hand of the Majesty on high;* The seating "on My right hand" (10:14) is the same right hand of the Majesty — the Son enthroned beside, not over, the Father.'),
  ('ascension-isaiah', 'ascension-isaiah', 10, 15, 'canon', 'hebrews', 1, 6, 'free', E'Hebrews 1:6 — *And again, when he bringeth in the firstbegotten into the world, he saith, And let all the angels of Elohim (God) worship him.* The powers'' worship (10:15) is by the Father''s word — the firstbegotten is worshipped at the Most High''s command, never by self-seizure.'),
  -- thread: ascension-isaiah-10-descent-through-seven-heavens
  ('ascension-isaiah', 'ascension-isaiah', 10, 17, 'canon', 'ephesians', 4, 9, 'free', E'Ephesians 4:9 — *(Now that he ascended, what is it but that he also descended first into the lower parts of the earth?* The Lord going forth from the seventh heaven downward (10:17) is the descent "first into the lower parts" Paul declares of the one Lord.'),
  ('ascension-isaiah', 'ascension-isaiah', 10, 18, 'canon', 'ephesians', 4, 10, 'free', E'Ephesians 4:10 — *He that descended is the same also that ascended up far above all heavens, that he might fill all things.)* The Descender of 10:18 IS the Ascender — one Lord through all the heavens, exactly as the Vision shows.'),
  ('ascension-isaiah', 'ascension-isaiah', 10, 24, 'canon', '1-timothy', 3, 16, 'free', E'1 Timothy 3:16 — *And without controversy great is the mystery of godliness: Elohim (God) was manifest in the flesh, justified in the Spirit, seen of angels, preached unto the Gentiles, believed on in the world, received up into glory.* The veiled passage past the gates so as not to be recognized (10:24) is the mystery of godliness — manifested, seen of angels, received up into glory.'),
  ('ascension-isaiah', 'ascension-isaiah', 10, 17, 'canon', '2-corinthians', 12, 2, 'free', E'2 Corinthians 12:2 — *I knew a man in Messiah (Christ) above fourteen years ago, (whether in the body, I cannot tell; or whether out of the body, I cannot tell: Elohim (God) knoweth;) such an one caught up to the third heaven.* Isaiah''s heaven-by-heaven sight of his Lord (10:17) is the same order of ascent-vision Paul was granted, caught up through the heavens.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session403_asci10_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session403_asci10_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-10-the-father-of-my-lord',
       E'The Most High, the Father of my Lord — the Beloved sent forth',
       E'Isaiah hears the commissioning: *"This is the Most High of the high ones, dwelling in the holy world, and resting in His holy ones, who will be called by the Ruach HaKodesh (Holy Spirit) through the lips of the righteous the Father of Yahuah (Lord)."* (Ascension of Isaiah 10:6) — and then *And I heard the voice of the Most High, the Father of my Lord, saying to my Yahuah (Lord) Messiah (Christ) who will be called Yahusha (Jesus):* (Ascension of Isaiah 10:7) — *"Go forth and descend through all the heavens, and thou wilt descend to the firmament and that world..."* (Ascension of Isaiah 10:8). It ain''t new: this is the Formed Son ordered under His Father — one who HAS a Father and is sent by Him, not a co-equal abstraction nor a created angel. *Who, being in the form of Elohim (God), thought it not robbery to be equal with Elohim (God):* (Philippians 2:6). The Son is begotten and given a Father''s word: *Thou art my Son, this day have I begotten thee? And again, I will be to him a Father, and he shall be to me a Son?* (Hebrews 1:5). His glory with the Father preceded the sending: *And now, O Father, glorify thou me with thine own self with the glory which I had with thee before the world was.* (John 17:5). The riddle Agur set is here answered — the One who descends has a Father AND a name: *Who hath ascended up into heaven, or descended?... what is his name, and what is his son''s name, if thou canst tell?* (Proverbs 30:4).',
       sv.verse_id, ev.verse_id, 'extras', 67725
  FROM _session403_asci10_lookup sv, _session403_asci10_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=10 AND sv.verse_number=6
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=10 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-10-transformed-unknown',
       E'Transformed through the heavens — that none should know Him',
       E'The Father orders the Beloved to veil His glory: *And thou wilt become like unto the likeness of all who are in the five heavens.* (Ascension of Isaiah 10:9), *And thou wilt be careful to become like the form of the angels of the firmament and the angels also who are in Sheol.* (Ascension of Isaiah 10:10), *And none of the angels of that world shall know that Thou art with Me of the seven heavens and of their angels.* (Ascension of Isaiah 10:11). It ain''t new — this is the hidden glory Paul names: *But we speak the wisdom of Elohim (God) in a mystery, even the hidden wisdom, which Elohim (God) ordained before the world unto our glory:* (1 Corinthians 2:7) — *Which none of the princes of this world knew: for had they known it, they would not have crucified Yahuah (Lord) of glory.* (1 Corinthians 2:8). The veiling is the self-emptying: *But made himself of no reputation, and took upon him the form of a servant, and was made in the likeness of men:* (Philippians 2:7). Isaiah had already foretold the unrecognized form: *For he shall grow up before him as a tender plant, and as a root out of a dry ground: he hath no form nor comeliness; and when we shall see him, there is no beauty that we should desire him.* (Isaiah 53:2). And the Word so veiled was yet the Word made flesh, His glory seen only by faith: *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* (John 1:14).',
       sv.verse_id, ev.verse_id, 'extras', 67728
  FROM _session403_asci10_lookup sv, _session403_asci10_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=10 AND sv.verse_number=9
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=10 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-10-none-beside-us',
       E'We alone are, and there is none beside us — the gods judged',
       E'The Father gives the Beloved authority to judge the usurping powers: *And they shall not know that Thou art with Me, till with a loud voice I have called to the heavens, and their angels and their lights, even unto the sixth heaven, in order that you mayest judge and destroy the princes and angels and gods of that world, and the world that is dominated by them:* (Ascension of Isaiah 10:12), *For they have denied Me and said: ''We alone are and there is none beside us.''* (Ascension of Isaiah 10:13). It ain''t new — that boast is the counterfeit of Yahuah''s own true word, stolen and turned to rebellion. The Most High alone may say it: *I am Yahuah (LORD), and there is none else, there is no Elohim (God) beside me: I girded thee, though thou hast not known me:* (Isaiah 45:5). The princes of that world parrot the Creator''s confession to deny Him: *Tell ye, and bring them near; yea, let them take counsel together: who hath declared this from ancient time? who hath told it from that time? have not I Yahuah (LORD)? and there is no Elohim (God) else beside me; a just Elohim (God) and a Saviour; there is none beside me.* (Isaiah 45:21). The Beloved descends as the Father''s appointed judge over these pretenders — the order holds: the Son executes the Father''s sentence on the gods who denied Him.',
       sv.verse_id, ev.verse_id, 'extras', 67731
  FROM _session403_asci10_lookup sv, _session403_asci10_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=10 AND sv.verse_number=12
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=10 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-10-exalted-right-hand',
       E'Ascend in glory and sit on My right hand — every power shall worship',
       E'After the descent the Father promises the Beloved''s untransformed return and exaltation: *And afterwards from the angels of death Thou wilt ascend to Thy place. And Thou wilt not be transformed in each heaven, but in glory wilt Thou ascend and sit on My right hand.* (Ascension of Isaiah 10:14), *And thereupon the princes and powers of that world will worship Thee.* (Ascension of Isaiah 10:15). It ain''t new — this is the wherefore of Philippians: because He humbled Himself, *Wherefore Elohim (God) also hath highly exalted him, and given him a name which is above every name:* (Philippians 2:9), *That at the name of Yahusha (Jesus) every knee should bow, of things in heaven, and things in earth, and things under the earth;* (Philippians 2:10). The seating at the right hand is the order kept — the Son exalted BY the Father: *Who being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power, when he had by himself purged our sins, sat down on the right hand of the Majesty on high;* (Hebrews 1:3). And the worship of the powers (10:15) is the Father''s command, not the Son''s seizure: *And again, when he bringeth in the firstbegotten into the world, he saith, And let all the angels of Elohim (God) worship him.* (Hebrews 1:6).',
       sv.verse_id, ev.verse_id, 'extras', 67734
  FROM _session403_asci10_lookup sv, _session403_asci10_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=10 AND sv.verse_number=14
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=10 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-10-descent-through-seven-heavens',
       E'He descended far above all heavens — the seven-heaven descent',
       E'Isaiah watches the Lord go down rank by rank: *And so I saw my Lord go forth from the seventh heaven into the sixth heaven.* (Ascension of Isaiah 10:17), and the guide says *And the angel who conducted me from this world was with me and said unto me: "Understand, Isaiah, and see the transformation and descent of Yahuah (Lord) will appear."* (Ascension of Isaiah 10:18) — passing each gate giving the password, *And those who kept the gate of the third heaven demanded the password, and Yahuah (Lord) gave it to them in order that He should not be recognized. And when they saw Him, they did not praise or laud Him; for His form was like unto their form.* (Ascension of Isaiah 10:24). It ain''t new — Paul preaches the same one Descender-Ascender: *(Now that he ascended, what is it but that he also descended first into the lower parts of the earth?* (Ephesians 4:9), *He that descended is the same also that ascended up far above all heavens, that he might fill all things.)* (Ephesians 4:10). The whole mystery is the manifestation seen by angels and received back up: *And without controversy great is the mystery of godliness: Elohim (God) was manifest in the flesh, justified in the Spirit, seen of angels, preached unto the Gentiles, believed on in the world, received up into glory.* (1 Timothy 3:16). And Isaiah''s own caught-up vision is the same the apostle was given: *I knew a man in Messiah (Christ) above fourteen years ago, (whether in the body, I cannot tell; or whether out of the body, I cannot tell: Elohim (God) knoweth;) such an one caught up to the third heaven.* (2 Corinthians 12:2).',
       sv.verse_id, ev.verse_id, 'extras', 67737
  FROM _session403_asci10_lookup sv, _session403_asci10_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=10 AND sv.verse_number=17
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=10 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ascension-isaiah-10-the-father-of-my-lord
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Philippians 2:6 — *Who, being in the form of Elohim (God), thought it not robbery to be equal with Elohim (God):* The Most High speaking TO the Beloved (10:7) shows the order Paul guards — the Son in the Father''s form yet sent, not grasping co-equality.'
  FROM cross_reference_threads t, cross_references x, _session403_asci10_lookup sv, _session403_asci10_lookup tv
 WHERE t.slug='ascension-isaiah-10-the-father-of-my-lord'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=10 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 1:5 — *For unto which of the angels said he at any time, Thou art my Son, this day have I begotten thee? And again, I will be to him a Father, and he shall be to me a Son?* The "Father of my Lord" (10:7) is the begetting Father — the Beloved is the begotten Son, not one of the angels He outranks.'
  FROM cross_reference_threads t, cross_references x, _session403_asci10_lookup sv, _session403_asci10_lookup tv
 WHERE t.slug='ascension-isaiah-10-the-father-of-my-lord'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=10 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 17:5 — *And now, O Father, glorify thou me with thine own self with the glory which I had with thee before the world was.* The glory the Most High holds (10:6) is the glory the Son shared before His descent and asks back after it.'
  FROM cross_reference_threads t, cross_references x, _session403_asci10_lookup sv, _session403_asci10_lookup tv
 WHERE t.slug='ascension-isaiah-10-the-father-of-my-lord'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=10 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=17 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 30:4 — *Who hath ascended up into heaven, or descended? who hath gathered the wind in his fists? who hath bound the waters in a garment? who hath established all the ends of the earth? what is his name, and what is his son''s name, if thou canst tell?* The descent commanded in 10:8 answers Agur''s ancient riddle: the Most High has a Son who descends.'
  FROM cross_reference_threads t, cross_references x, _session403_asci10_lookup sv, _session403_asci10_lookup tv
 WHERE t.slug='ascension-isaiah-10-the-father-of-my-lord'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=10 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=30 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-10-transformed-unknown
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Corinthians 2:8 — *Which none of the princes of this world knew: for had they known it, they would not have crucified Yahuah (Lord) of glory.* Exactly the Ascension''s logic: the Beloved was so transformed (10:11) that the rulers did not know Him — had they known, they would not have crucified Him.'
  FROM cross_reference_threads t, cross_references x, _session403_asci10_lookup sv, _session403_asci10_lookup tv
 WHERE t.slug='ascension-isaiah-10-transformed-unknown'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=10 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=2 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Philippians 2:7 — *But made himself of no reputation, and took upon him the form of a servant, and was made in the likeness of men:* The command to become "like unto the likeness" of each rank (10:9) is the self-emptying Paul preaches — the Formed Son took the servant''s form.'
  FROM cross_reference_threads t, cross_references x, _session403_asci10_lookup sv, _session403_asci10_lookup tv
 WHERE t.slug='ascension-isaiah-10-transformed-unknown'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=10 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 53:2 — *For he shall grow up before him as a tender plant, and as a root out of a dry ground: he hath no form nor comeliness; and when we shall see him, there is no beauty that we should desire him.* The veiled "form" through the heavens (10:10) is the same hidden comeliness the prophet foresaw on earth.'
  FROM cross_reference_threads t, cross_references x, _session403_asci10_lookup sv, _session403_asci10_lookup tv
 WHERE t.slug='ascension-isaiah-10-transformed-unknown'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=10 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The One unknown to the angels (10:11) is the Word veiled in flesh, His glory beheld only by those given eyes.'
  FROM cross_reference_threads t, cross_references x, _session403_asci10_lookup sv, _session403_asci10_lookup tv
 WHERE t.slug='ascension-isaiah-10-transformed-unknown'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=10 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-10-none-beside-us
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 45:5 — *I am Yahuah (LORD), and there is none else, there is no Elohim (God) beside me: I girded thee, though thou hast not known me:* The boast of the rebel powers (10:13) is a theft of Yahuah''s own exclusive confession — His alone to make, blasphemy in their mouths.'
  FROM cross_reference_threads t, cross_references x, _session403_asci10_lookup sv, _session403_asci10_lookup tv
 WHERE t.slug='ascension-isaiah-10-none-beside-us'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=10 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=45 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 45:21 — *Tell ye, and bring them near; yea, let them take counsel together: who hath declared this from ancient time? who hath told it from that time? have not I Yahuah (LORD)? and there is no Elohim (God) else beside me; a just Elohim (God) and a Saviour; there is none beside me.* The gods who say "there is none beside us" (10:13) counterfeit the Saviour''s own word — and so are marked for the judgment the Beloved is sent to bring.'
  FROM cross_reference_threads t, cross_references x, _session403_asci10_lookup sv, _session403_asci10_lookup tv
 WHERE t.slug='ascension-isaiah-10-none-beside-us'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=10 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=45 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-10-exalted-right-hand
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Philippians 2:9 — *Wherefore Elohim (God) also hath highly exalted him, and given him a name which is above every name:* The ascent "in glory" to sit at the right hand (10:14) is the exaltation Paul names — granted BY the Father after the descent, the Formed-Son order intact.'
  FROM cross_reference_threads t, cross_references x, _session403_asci10_lookup sv, _session403_asci10_lookup tv
 WHERE t.slug='ascension-isaiah-10-exalted-right-hand'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=10 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Philippians 2:10 — *That at the name of Yahusha (Jesus) every knee should bow, of things in heaven, and things in earth, and things under the earth;* The princes and powers worshipping the returned Beloved (10:15) are the knees in heaven, earth, and under the earth that bow at His exalted name.'
  FROM cross_reference_threads t, cross_references x, _session403_asci10_lookup sv, _session403_asci10_lookup tv
 WHERE t.slug='ascension-isaiah-10-exalted-right-hand'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=10 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 1:3 — *Who being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power, when he had by himself purged our sins, sat down on the right hand of the Majesty on high;* The seating "on My right hand" (10:14) is the same right hand of the Majesty — the Son enthroned beside, not over, the Father.'
  FROM cross_reference_threads t, cross_references x, _session403_asci10_lookup sv, _session403_asci10_lookup tv
 WHERE t.slug='ascension-isaiah-10-exalted-right-hand'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=10 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hebrews 1:6 — *And again, when he bringeth in the firstbegotten into the world, he saith, And let all the angels of Elohim (God) worship him.* The powers'' worship (10:15) is by the Father''s word — the firstbegotten is worshipped at the Most High''s command, never by self-seizure.'
  FROM cross_reference_threads t, cross_references x, _session403_asci10_lookup sv, _session403_asci10_lookup tv
 WHERE t.slug='ascension-isaiah-10-exalted-right-hand'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=10 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-10-descent-through-seven-heavens
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ephesians 4:9 — *(Now that he ascended, what is it but that he also descended first into the lower parts of the earth?* The Lord going forth from the seventh heaven downward (10:17) is the descent "first into the lower parts" Paul declares of the one Lord.'
  FROM cross_reference_threads t, cross_references x, _session403_asci10_lookup sv, _session403_asci10_lookup tv
 WHERE t.slug='ascension-isaiah-10-descent-through-seven-heavens'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=10 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=4 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ephesians 4:10 — *He that descended is the same also that ascended up far above all heavens, that he might fill all things.)* The Descender of 10:18 IS the Ascender — one Lord through all the heavens, exactly as the Vision shows.'
  FROM cross_reference_threads t, cross_references x, _session403_asci10_lookup sv, _session403_asci10_lookup tv
 WHERE t.slug='ascension-isaiah-10-descent-through-seven-heavens'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=10 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=4 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Timothy 3:16 — *And without controversy great is the mystery of godliness: Elohim (God) was manifest in the flesh, justified in the Spirit, seen of angels, preached unto the Gentiles, believed on in the world, received up into glory.* The veiled passage past the gates so as not to be recognized (10:24) is the mystery of godliness — manifested, seen of angels, received up into glory.'
  FROM cross_reference_threads t, cross_references x, _session403_asci10_lookup sv, _session403_asci10_lookup tv
 WHERE t.slug='ascension-isaiah-10-descent-through-seven-heavens'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=10 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='1-timothy' AND tv.chapter_number=3 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Corinthians 12:2 — *I knew a man in Messiah (Christ) above fourteen years ago, (whether in the body, I cannot tell; or whether out of the body, I cannot tell: Elohim (God) knoweth;) such an one caught up to the third heaven.* Isaiah''s heaven-by-heaven sight of his Lord (10:17) is the same order of ascent-vision Paul was granted, caught up through the heavens.'
  FROM cross_reference_threads t, cross_references x, _session403_asci10_lookup sv, _session403_asci10_lookup tv
 WHERE t.slug='ascension-isaiah-10-descent-through-seven-heavens'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=10 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ascensionisaiah_11.sql (session403 ascension-isaiah 11) -----
-- Source anchor: ascension-isaiah/ascension-isaiah ch11. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: asci11 (view _session403_asci11_lookup). Sort band base 67750, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session403_asci11_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ascension-isaiah-11-virgin-bethlehem
  ('ascension-isaiah', 'ascension-isaiah', 11, 2, 'canon', 'isaiah', 7, 14, 'free', E'Isaiah 7:14 — *Therefore Yahuah (Lord) himself shall give you a sign; Behold, a virgin shall conceive, and bear a son, and shall call his name Immanuel.* The virgin Mary Isaiah beholds is the sign Isaiah himself had already spoken.'),
  ('ascension-isaiah', 'ascension-isaiah', 11, 2, 'canon', 'micah', 5, 2, 'free', E'Micah 5:2 — *But thou, Beth-lehem Ephratah, though thou be little among the thousands of Yahudah (Judah), yet out of thee shall he come forth unto me that is to be ruler in Yashar''el (Israel); whose goings forth have been from of old, from everlasting.* The Bethlehem of Judah named in the vision is the Bethlehem of the prophecy.'),
  ('ascension-isaiah', 'ascension-isaiah', 11, 2, 'canon', 'matthew', 1, 18, 'free', E'Matthew 1:18 — *Now the birth of Yahusha HaMashiach (Jesus Christ) was on this wise: When as his mother Mary was espoused to Joseph, before they came together, she was found with child of the Ruach HaKodesh (Holy Spirit).* The same Mary, espoused to Joseph and found with child, that Isaiah saw centuries before.'),
  ('ascension-isaiah', 'ascension-isaiah', 11, 3, 'canon', 'matthew', 1, 23, 'free', E'Matthew 1:23 — *Behold, a virgin shall be with child, and shall bring forth a son, and they shall call his name Emmanuel, which being interpreted is, Elohim (God) with us.* Joseph''s hesitation to put her away ends where Isaiah''s own Immanuel sign begins.'),
  -- thread: ascension-isaiah-11-elohim-into-his-portion
  ('ascension-isaiah', 'ascension-isaiah', 11, 10, 'canon', 'john', 1, 14, 'free', E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The infant in Joseph''s portion is the only begotten of the Father made flesh.'),
  ('ascension-isaiah', 'ascension-isaiah', 11, 10, 'canon', '1-timothy', 3, 16, 'free', E'1 Timothy 3:16 — *And without controversy great is the mystery of godliness: Elohim (God) was manifest in the flesh, justified in the Spirit, seen of angels, preached unto the Gentiles, believed on in the world, received up into glory.* Joseph praising because Elohim had come into his portion is the mystery of godliness manifest in the flesh.'),
  ('ascension-isaiah', 'ascension-isaiah', 11, 8, 'canon', 'luke', 2, 7, 'free', E'Luke 2:7 — *And she brought forth her firstborn son, and wrapped him in swaddling clothes, and laid him in a manger; because there was no room for them in the inn.* The small babe Mary suddenly beheld is the firstborn son of Luke''s nativity.'),
  ('ascension-isaiah', 'ascension-isaiah', 11, 9, 'canon', 'isaiah', 9, 6, 'free', E'Isaiah 9:6 — *For unto us a child is born, unto us a son is given: and the government shall be upon his shoulder: and his name shall be called Wonderful, Counsellor, El Gibbor (The mighty God), Avi-ad (The everlasting Father), Sar Shalom (The Prince of Peace).* The child appearing where the womb was found whole is the child born, the son given, of Isaiah''s own word.'),
  -- thread: ascension-isaiah-11-hidden-from-the-princes
  ('ascension-isaiah', 'ascension-isaiah', 11, 16, 'canon', '1-corinthians', 2, 8, 'free', E'1 Corinthians 2:8 — *Which none of the princes of this world knew: for had they known it, they would not have crucified Yahuah (Lord) of glory.* The descent that escaped all the princes of this world is why they crucified the Lord of glory unknowing.'),
  ('ascension-isaiah', 'ascension-isaiah', 11, 17, 'canon', 'philippians', 2, 7, 'free', E'Philippians 2:7 — *But made himself of no reputation, and took upon him the form of a servant, and was made in the likeness of men:* Sucking the breast as a babe that He might not be recognized is the self-emptying of the Formed Son into the likeness of men.'),
  ('ascension-isaiah', 'ascension-isaiah', 11, 14, 'canon', 'isaiah', 53, 2, 'free', E'Isaiah 53:2 — *For he shall grow up before him as a tender plant, and as a root out of a dry ground: he hath no form nor comeliness; and when we shall see him, there is no beauty that we should desire him.* That they knew not whence He was is the no-form, no-comeliness Isaiah foretold.'),
  -- thread: ascension-isaiah-11-crucified-risen-the-third-day
  ('ascension-isaiah', 'ascension-isaiah', 11, 19, 'canon', 'ephesians', 4, 9, 'free', E'Ephesians 4:9 — *(Now that he ascended, what is it but that he also descended first into the lower parts of the earth?* His descent to the angel of Sheol is the descent into the lower parts of the earth Paul preaches.'),
  ('ascension-isaiah', 'ascension-isaiah', 11, 21, 'canon', 'ephesians', 4, 10, 'free', E'Ephesians 4:10 — *He that descended is the same also that ascended up far above all heavens, that he might fill all things.)* The one who rose the third day is the same who ascends far above all heavens through the seven that follow.'),
  ('ascension-isaiah', 'ascension-isaiah', 11, 19, 'canon', 'hebrews', 1, 3, 'free', E'Hebrews 1:3 — *Who being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power, when he had by himself purged our sins, sat down on the right hand of the Majesty on high;* The Beloved delivered up and crucified is the express image of the Father who purged sins and sat down.'),
  -- thread: ascension-isaiah-11-ascent-the-angels-worshipped
  ('ascension-isaiah', 'ascension-isaiah', 11, 23, 'canon', 'philippians', 2, 9, 'free', E'Philippians 2:9 — *Wherefore Elohim (God) also hath highly exalted him, and given him a name which is above every name:* The angels worshipping as He ascends are answering the name the Father gave Him above every name.'),
  ('ascension-isaiah', 'ascension-isaiah', 11, 23, 'canon', 'philippians', 2, 10, 'free', E'Philippians 2:10 — *That at the name of Yahusha (Jesus) every knee should bow, of things in heaven, and things in earth, and things under the earth;* The worship at each ascending heaven is every knee in heaven bowing to that name.'),
  ('ascension-isaiah', 'ascension-isaiah', 11, 23, 'canon', 'hebrews', 1, 6, 'free', E'Hebrews 1:6 — *And again, when he bringeth in the firstbegotten into the world, he saith, And let all the angels of Elohim (God) worship him.* The angels of the firmament worshipping is the Father''s own command over the firstbegotten.'),
  ('ascension-isaiah', 'ascension-isaiah', 11, 26, 'canon', 'revelation', 5, 12, 'free', E'Revelation 5:12 — *Saying with a loud voice, Worthy is the Lamb that was slain to receive power, and riches, and wisdom, and strength, and honour, and glory, and blessing.* The praise that increased in volume through the heavens is the heavenly worthy-is-the-Lamb of John''s throne-room.'),
  -- thread: ascension-isaiah-11-right-hand-of-the-great-glory
  ('ascension-isaiah', 'ascension-isaiah', 11, 32, 'canon', 'hebrews', 1, 3, 'free', E'Hebrews 1:3 — *Who being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power, when he had by himself purged our sins, sat down on the right hand of the Majesty on high;* Sitting on the right hand of the Great Glory is the right hand of the Majesty on high — the Son seated, the Father glorified.'),
  ('ascension-isaiah', 'ascension-isaiah', 11, 32, 'canon', 'daniel', 7, 9, 'free', E'Daniel 7:9 — *I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame, and his wheels as burning fire.* The Great Glory whose glory Isaiah could not behold is the Ancient of days enthroned in Daniel''s vision.'),
  ('ascension-isaiah', 'ascension-isaiah', 11, 32, 'canon', 'daniel', 7, 14, 'free', E'Daniel 7:14 — *And there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him: his dominion is an everlasting dominion, which shall not pass away, and his kingdom that which shall not be destroyed.* The Beloved seated at the right hand receives the everlasting dominion the Ancient of days gives the Son of man.'),
  ('ascension-isaiah', 'ascension-isaiah', 11, 32, 'enoch', '1-enoch', 14, 15, 'extras', E'1 Enoch 14:15 — *But the middle one reached to heaven, like the throne of Yahuah (God), of stibium, and the top of the throne was of sapphire.* Enoch too was brought before the throne reaching to heaven whose Glory none of flesh could behold — it ain''t new.'),
  -- thread: ascension-isaiah-11-robes-thrones-crowns-laid-up
  ('ascension-isaiah', 'ascension-isaiah', 11, 40, 'canon', '2-timothy', 4, 8, 'free', E'2 Timothy 4:8 — *Henceforth there is laid up for me a crown of righteousness, which Yahuah (Lord), the righteous judge, shall give me at that day: and not to me only, but unto all them also that love his appearing.* The crowns of glory laid up in the seventh heaven are Paul''s crown of righteousness laid up for them that love His appearing.'),
  ('ascension-isaiah', 'ascension-isaiah', 11, 40, 'canon', 'revelation', 3, 5, 'free', E'Revelation 3:5 — *He that overcometh, the same shall be clothed in white raiment; and I will not blot out his name out of the book of life, but I will confess his name before my Father, and before his angels.* The garments laid up for those who watch are the white raiment promised the overcomer.'),
  ('ascension-isaiah', 'ascension-isaiah', 11, 40, 'canon', 'revelation', 4, 4, 'free', E'Revelation 4:4 — *And round about the throne were four and twenty seats: and upon the seats I saw four and twenty elders sitting, clothed in white raiment; and they had on their heads crowns of gold.* The thrones and crowns laid up in the seventh heaven are the elders'' seats and golden crowns about the throne.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session403_asci11_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session403_asci11_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-11-virgin-bethlehem',
       E'The virgin of David''s line — it ain''t new',
       E'Isaiah is shown the very thing Moses and the Prophets foretold: *And I indeed saw a woman of the family of David the prophet, named Mary, and Virgin, and she was espoused to a man named Joseph, a carpenter, and he also was of the seed and family of the righteous David of Bethlehem Yahudah (Judah).* (Ascension of Isaiah 11:2). The sign was given of old: *Therefore Yahuah (Lord) himself shall give you a sign; Behold, a virgin shall conceive, and bear a son, and shall call his name Immanuel.* (Isaiah 7:14), and the place named: *But thou, Beth-lehem Ephratah, though thou be little among the thousands of Yahudah (Judah), yet out of thee shall he come forth unto me that is to be ruler in Yashar''el (Israel); whose goings forth have been from of old, from everlasting.* (Micah 5:2). Matthew records the same espousal and the same conceiving: *Now the birth of Yahusha HaMashiach (Jesus Christ) was on this wise: When as his mother Mary was espoused to Joseph, before they came together, she was found with child of the Ruach HaKodesh (Holy Spirit).* (Matthew 1:18). The Beloved is the Formed Son sent into David''s line — not a stranger to the promise but its fulfilment.',
       sv.verse_id, ev.verse_id, 'extras', 67750
  FROM _session403_asci11_lookup sv, _session403_asci11_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=11 AND sv.verse_number=2
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=11 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-11-elohim-into-his-portion',
       E'Elohim come into his portion — the child appears',
       E'The birth in the vision is sudden and wondrous, the womb found whole as before: *It came to pass that when they were alone that Mary straightway looked with her eyes and saw a small babe, and she was astonished.* (Ascension of Isaiah 11:8). And Joseph''s eyes are opened to who the infant is: *And when her husband Joseph said unto her: "What has astonished thee?" his eyes were opened and he saw the infant and praised Elohim (God), because into his portion Elohim (God) had come.* (Ascension of Isaiah 11:10). This is the Word made flesh — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* (John 1:14) — the only begotten Son who HAS a Father, manifest in the flesh: *And without controversy great is the mystery of godliness: Elohim (God) was manifest in the flesh, justified in the Spirit, seen of angels, preached unto the Gentiles, believed on in the world, received up into glory.* (1 Timothy 3:16). Luke records the firstborn laid as a babe: *And she brought forth her firstborn son, and wrapped him in swaddling clothes, and laid him in a manger; because there was no room for them in the inn.* (Luke 2:7).',
       sv.verse_id, ev.verse_id, 'extras', 67753
  FROM _session403_asci11_lookup sv, _session403_asci11_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=11 AND sv.verse_number=8
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=11 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-11-hidden-from-the-princes',
       E'Hidden from the princes — they knew not whence He was',
       E'The Beloved came down veiled, unrecognised even at His birth: *And many said: "She has not borne a child, nor has a midwife gone up to her, nor have we heard the cries of labour pains." And they were all blinded respecting Him and they all knew regarding Him, though they knew not whence He was.* (Ascension of Isaiah 11:14). The descent itself escaped the heavens and the rulers: *And I saw, O Hezekiah and Josab my son, and I declare to the other prophets also who are standing by, that this hath escaped all the heavens and all the princes and all the gods of this world.* (Ascension of Isaiah 11:16). And in Nazareth He concealed His glory: *And I saw: In Nazareth He sucked the breast as a babe and as is customary in order that He might not be recognized.* (Ascension of Isaiah 11:17). Paul declares the very same hiddenness as the reason for the cross: *Which none of the princes of this world knew: for had they known it, they would not have crucified Yahuah (Lord) of glory.* (1 Corinthians 2:8). He made Himself of no reputation and took the form of a servant: *But made himself of no reputation, and took upon him the form of a servant, and was made in the likeness of men:* (Philippians 2:7) — the Formed Son ordered under the Father, emptied that the rulers should not perceive Him. It ain''t new: of old He had no comeliness that we should desire Him.',
       sv.verse_id, ev.verse_id, 'extras', 67756
  FROM _session403_asci11_lookup sv, _session403_asci11_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=11 AND sv.verse_number=14
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=11 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-11-crucified-risen-the-third-day',
       E'Crucified on a tree, risen the third day',
       E'Isaiah sees the whole work of the Beloved at the end of the vision: *In Jerusalem indeed I saw Him being crucified on a tree:* (Ascension of Isaiah 11:20), and the resurrection: *And likewise after the third day rise again and remain days.* (Ascension of Isaiah 11:21). The adversary, not knowing who He was, stirred up the people: *And after this the adversary envied Him and roused the children of Yashar''el (Israel) against Him, not knowing who He was, and they delivered Him to the king, and crucified Him, and He descended to the angel of Sheol.* (Ascension of Isaiah 11:19). This is the descent and ascent of Ephesians: *(Now that he ascended, what is it but that he also descended first into the lower parts of the earth?* (Ephesians 4:9) — *He that descended is the same also that ascended up far above all heavens, that he might fill all things.)* (Ephesians 4:10). And the crucified one is the same who had by Himself purged sins and sat down: *Who being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power, when he had by himself purged our sins, sat down on the right hand of the Majesty on high;* (Hebrews 1:3). The Formed Son descends to Sheol and rises — sent, obedient, exalted.',
       sv.verse_id, ev.verse_id, 'extras', 67759
  FROM _session403_asci11_lookup sv, _session403_asci11_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=11 AND sv.verse_number=19
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=11 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-11-ascent-the-angels-worshipped',
       E'The ascent — every knee, in all the heavens',
       E'Risen, the Beloved ascends back through the firmament and the heavens, and the angels who had not perceived His descent now worship: *And I saw Him, and He was in the firmament, but He had not changed Himself into their form, and all the angels of the firmament and the Satans saw Him and they worshipped.* (Ascension of Isaiah 11:23). This is the exaltation Paul orders under the Father: *Wherefore Elohim (God) also hath highly exalted him, and given him a name which is above every name:* (Philippians 2:9) — *That at the name of Yahusha (Jesus) every knee should bow, of things in heaven, and things in earth, and things under the earth;* (Philippians 2:10). The Father commands the angels to worship the firstbegotten: *And again, when he bringeth in the firstbegotten into the world, he saith, And let all the angels of Elohim (God) worship him.* (Hebrews 1:6). And John saw the same numberless host worshipping the Lamb: *And I beheld, and I heard the voice of many angels round about the throne and the beasts and the elders: and the number of them was ten thousand times ten thousand, and thousands of thousands;* (Revelation 5:11) — *Saying with a loud voice, Worthy is the Lamb that was slain to receive power, and riches, and wisdom, and strength, and honour, and glory, and blessing.* (Revelation 5:12). The order is kept: He is exalted and worshipped at the Father''s command, the Formed Son highly exalted.',
       sv.verse_id, ev.verse_id, 'extras', 67762
  FROM _session403_asci11_lookup sv, _session403_asci11_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=11 AND sv.verse_number=23
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=11 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-11-right-hand-of-the-great-glory',
       E'Seated at the right hand of the Great Glory',
       E'At the seventh heaven the ascent ends with the Beloved enthroned beside the Father, and the angel of the Spirit set in order: *And I saw how He ascended into the seventh heaven, and all the righteous and all the angels praised Him. And then I saw Him sit down on the right hand of that Great Glory whose glory I told you that I could not behold.* (Ascension of Isaiah 11:32), *And also the angel of the Ruach HaKodesh (Holy Spirit) I saw sitting on the left hand.* (Ascension of Isaiah 11:33). This is the right-hand seat Hebrews names: *Who being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power, when he had by himself purged our sins, sat down on the right hand of the Majesty on high;* (Hebrews 1:3). The Great Glory none can behold is the Ancient of days of Daniel''s throne, who gives the Son dominion: *I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame, and his wheels as burning fire.* (Daniel 7:9) — *And there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him: his dominion is an everlasting dominion, which shall not pass away, and his kingdom that which shall not be destroyed.* (Daniel 7:14). It ain''t new: Enoch too was carried before that throne reaching to heaven: *But the middle one reached to heaven, like the throne of Yahuah (God), of stibium, and the top of the throne was of sapphire.* (1 Enoch 14:15). The Father is the Great Glory; the Son is seated at His right; the order is never flattened.',
       sv.verse_id, ev.verse_id, 'extras', 67765
  FROM _session403_asci11_lookup sv, _session403_asci11_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=11 AND sv.verse_number=32
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=11 AND ev.verse_number=33
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-11-robes-thrones-crowns-laid-up',
       E'Garments, thrones and crowns laid up in the seventh heaven',
       E'Isaiah is sent back to the flesh with a charge for the readers of the vision: *And thou wilt return into thy garment of the flesh until thy days are completed. Then thou wilt come hither.* (Ascension of Isaiah 11:35), and: *Such things ye will read. And watch ye in the Ruach HaKodesh (Holy Spirit) in order that ye may receive your garments and thrones and crowns of glory which are laid up in the seventh heaven.* (Ascension of Isaiah 11:40). The crown laid up is the same Paul awaited: *Henceforth there is laid up for me a crown of righteousness, which Yahuah (Lord), the righteous judge, shall give me at that day: and not to me only, but unto all them also that love his appearing.* (2 Timothy 4:8). The white robe is promised to the overcomer: *He that overcometh, the same shall be clothed in white raiment; and I will not blot out his name out of the book of life, but I will confess his name before my Father, and before his angels.* (Revelation 3:5), and the thrones are the elders'' seats about the throne: *And round about the throne were four and twenty seats: and upon the seats I saw four and twenty elders sitting, clothed in white raiment; and they had on their heads crowns of gold.* (Revelation 4:4). It ain''t new — the reward of the righteous is laid up in heaven and held for the faithful remnant.',
       sv.verse_id, ev.verse_id, 'extras', 67768
  FROM _session403_asci11_lookup sv, _session403_asci11_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=11 AND sv.verse_number=35
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=11 AND ev.verse_number=40
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ascension-isaiah-11-virgin-bethlehem
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 7:14 — *Therefore Yahuah (Lord) himself shall give you a sign; Behold, a virgin shall conceive, and bear a son, and shall call his name Immanuel.* The virgin Mary Isaiah beholds is the sign Isaiah himself had already spoken.'
  FROM cross_reference_threads t, cross_references x, _session403_asci11_lookup sv, _session403_asci11_lookup tv
 WHERE t.slug='ascension-isaiah-11-virgin-bethlehem'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=11 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Micah 5:2 — *But thou, Beth-lehem Ephratah, though thou be little among the thousands of Yahudah (Judah), yet out of thee shall he come forth unto me that is to be ruler in Yashar''el (Israel); whose goings forth have been from of old, from everlasting.* The Bethlehem of Judah named in the vision is the Bethlehem of the prophecy.'
  FROM cross_reference_threads t, cross_references x, _session403_asci11_lookup sv, _session403_asci11_lookup tv
 WHERE t.slug='ascension-isaiah-11-virgin-bethlehem'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=11 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=5 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 1:18 — *Now the birth of Yahusha HaMashiach (Jesus Christ) was on this wise: When as his mother Mary was espoused to Joseph, before they came together, she was found with child of the Ruach HaKodesh (Holy Spirit).* The same Mary, espoused to Joseph and found with child, that Isaiah saw centuries before.'
  FROM cross_reference_threads t, cross_references x, _session403_asci11_lookup sv, _session403_asci11_lookup tv
 WHERE t.slug='ascension-isaiah-11-virgin-bethlehem'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=11 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=1 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 1:23 — *Behold, a virgin shall be with child, and shall bring forth a son, and they shall call his name Emmanuel, which being interpreted is, Elohim (God) with us.* Joseph''s hesitation to put her away ends where Isaiah''s own Immanuel sign begins.'
  FROM cross_reference_threads t, cross_references x, _session403_asci11_lookup sv, _session403_asci11_lookup tv
 WHERE t.slug='ascension-isaiah-11-virgin-bethlehem'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=11 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=1 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-11-elohim-into-his-portion
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The infant in Joseph''s portion is the only begotten of the Father made flesh.'
  FROM cross_reference_threads t, cross_references x, _session403_asci11_lookup sv, _session403_asci11_lookup tv
 WHERE t.slug='ascension-isaiah-11-elohim-into-his-portion'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=11 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Timothy 3:16 — *And without controversy great is the mystery of godliness: Elohim (God) was manifest in the flesh, justified in the Spirit, seen of angels, preached unto the Gentiles, believed on in the world, received up into glory.* Joseph praising because Elohim had come into his portion is the mystery of godliness manifest in the flesh.'
  FROM cross_reference_threads t, cross_references x, _session403_asci11_lookup sv, _session403_asci11_lookup tv
 WHERE t.slug='ascension-isaiah-11-elohim-into-his-portion'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=11 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='1-timothy' AND tv.chapter_number=3 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Luke 2:7 — *And she brought forth her firstborn son, and wrapped him in swaddling clothes, and laid him in a manger; because there was no room for them in the inn.* The small babe Mary suddenly beheld is the firstborn son of Luke''s nativity.'
  FROM cross_reference_threads t, cross_references x, _session403_asci11_lookup sv, _session403_asci11_lookup tv
 WHERE t.slug='ascension-isaiah-11-elohim-into-his-portion'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=11 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 9:6 — *For unto us a child is born, unto us a son is given: and the government shall be upon his shoulder: and his name shall be called Wonderful, Counsellor, El Gibbor (The mighty God), Avi-ad (The everlasting Father), Sar Shalom (The Prince of Peace).* The child appearing where the womb was found whole is the child born, the son given, of Isaiah''s own word.'
  FROM cross_reference_threads t, cross_references x, _session403_asci11_lookup sv, _session403_asci11_lookup tv
 WHERE t.slug='ascension-isaiah-11-elohim-into-his-portion'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=11 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=9 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-11-hidden-from-the-princes
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Corinthians 2:8 — *Which none of the princes of this world knew: for had they known it, they would not have crucified Yahuah (Lord) of glory.* The descent that escaped all the princes of this world is why they crucified the Lord of glory unknowing.'
  FROM cross_reference_threads t, cross_references x, _session403_asci11_lookup sv, _session403_asci11_lookup tv
 WHERE t.slug='ascension-isaiah-11-hidden-from-the-princes'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=11 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=2 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Philippians 2:7 — *But made himself of no reputation, and took upon him the form of a servant, and was made in the likeness of men:* Sucking the breast as a babe that He might not be recognized is the self-emptying of the Formed Son into the likeness of men.'
  FROM cross_reference_threads t, cross_references x, _session403_asci11_lookup sv, _session403_asci11_lookup tv
 WHERE t.slug='ascension-isaiah-11-hidden-from-the-princes'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=11 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 53:2 — *For he shall grow up before him as a tender plant, and as a root out of a dry ground: he hath no form nor comeliness; and when we shall see him, there is no beauty that we should desire him.* That they knew not whence He was is the no-form, no-comeliness Isaiah foretold.'
  FROM cross_reference_threads t, cross_references x, _session403_asci11_lookup sv, _session403_asci11_lookup tv
 WHERE t.slug='ascension-isaiah-11-hidden-from-the-princes'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=11 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-11-crucified-risen-the-third-day
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ephesians 4:9 — *(Now that he ascended, what is it but that he also descended first into the lower parts of the earth?* His descent to the angel of Sheol is the descent into the lower parts of the earth Paul preaches.'
  FROM cross_reference_threads t, cross_references x, _session403_asci11_lookup sv, _session403_asci11_lookup tv
 WHERE t.slug='ascension-isaiah-11-crucified-risen-the-third-day'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=11 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=4 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ephesians 4:10 — *He that descended is the same also that ascended up far above all heavens, that he might fill all things.)* The one who rose the third day is the same who ascends far above all heavens through the seven that follow.'
  FROM cross_reference_threads t, cross_references x, _session403_asci11_lookup sv, _session403_asci11_lookup tv
 WHERE t.slug='ascension-isaiah-11-crucified-risen-the-third-day'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=11 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=4 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 1:3 — *Who being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power, when he had by himself purged our sins, sat down on the right hand of the Majesty on high;* The Beloved delivered up and crucified is the express image of the Father who purged sins and sat down.'
  FROM cross_reference_threads t, cross_references x, _session403_asci11_lookup sv, _session403_asci11_lookup tv
 WHERE t.slug='ascension-isaiah-11-crucified-risen-the-third-day'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=11 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-11-ascent-the-angels-worshipped
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Philippians 2:9 — *Wherefore Elohim (God) also hath highly exalted him, and given him a name which is above every name:* The angels worshipping as He ascends are answering the name the Father gave Him above every name.'
  FROM cross_reference_threads t, cross_references x, _session403_asci11_lookup sv, _session403_asci11_lookup tv
 WHERE t.slug='ascension-isaiah-11-ascent-the-angels-worshipped'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=11 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Philippians 2:10 — *That at the name of Yahusha (Jesus) every knee should bow, of things in heaven, and things in earth, and things under the earth;* The worship at each ascending heaven is every knee in heaven bowing to that name.'
  FROM cross_reference_threads t, cross_references x, _session403_asci11_lookup sv, _session403_asci11_lookup tv
 WHERE t.slug='ascension-isaiah-11-ascent-the-angels-worshipped'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=11 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 1:6 — *And again, when he bringeth in the firstbegotten into the world, he saith, And let all the angels of Elohim (God) worship him.* The angels of the firmament worshipping is the Father''s own command over the firstbegotten.'
  FROM cross_reference_threads t, cross_references x, _session403_asci11_lookup sv, _session403_asci11_lookup tv
 WHERE t.slug='ascension-isaiah-11-ascent-the-angels-worshipped'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=11 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 5:12 — *Saying with a loud voice, Worthy is the Lamb that was slain to receive power, and riches, and wisdom, and strength, and honour, and glory, and blessing.* The praise that increased in volume through the heavens is the heavenly worthy-is-the-Lamb of John''s throne-room.'
  FROM cross_reference_threads t, cross_references x, _session403_asci11_lookup sv, _session403_asci11_lookup tv
 WHERE t.slug='ascension-isaiah-11-ascent-the-angels-worshipped'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=11 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=5 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-11-right-hand-of-the-great-glory
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 1:3 — *Who being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power, when he had by himself purged our sins, sat down on the right hand of the Majesty on high;* Sitting on the right hand of the Great Glory is the right hand of the Majesty on high — the Son seated, the Father glorified.'
  FROM cross_reference_threads t, cross_references x, _session403_asci11_lookup sv, _session403_asci11_lookup tv
 WHERE t.slug='ascension-isaiah-11-right-hand-of-the-great-glory'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=11 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:9 — *I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame, and his wheels as burning fire.* The Great Glory whose glory Isaiah could not behold is the Ancient of days enthroned in Daniel''s vision.'
  FROM cross_reference_threads t, cross_references x, _session403_asci11_lookup sv, _session403_asci11_lookup tv
 WHERE t.slug='ascension-isaiah-11-right-hand-of-the-great-glory'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=11 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 7:14 — *And there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him: his dominion is an everlasting dominion, which shall not pass away, and his kingdom that which shall not be destroyed.* The Beloved seated at the right hand receives the everlasting dominion the Ancient of days gives the Son of man.'
  FROM cross_reference_threads t, cross_references x, _session403_asci11_lookup sv, _session403_asci11_lookup tv
 WHERE t.slug='ascension-isaiah-11-right-hand-of-the-great-glory'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=11 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 14:15 — *But the middle one reached to heaven, like the throne of Yahuah (God), of stibium, and the top of the throne was of sapphire.* Enoch too was brought before the throne reaching to heaven whose Glory none of flesh could behold — it ain''t new.'
  FROM cross_reference_threads t, cross_references x, _session403_asci11_lookup sv, _session403_asci11_lookup tv
 WHERE t.slug='ascension-isaiah-11-right-hand-of-the-great-glory'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=11 AND sv.verse_number=32
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=14 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-11-robes-thrones-crowns-laid-up
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Timothy 4:8 — *Henceforth there is laid up for me a crown of righteousness, which Yahuah (Lord), the righteous judge, shall give me at that day: and not to me only, but unto all them also that love his appearing.* The crowns of glory laid up in the seventh heaven are Paul''s crown of righteousness laid up for them that love His appearing.'
  FROM cross_reference_threads t, cross_references x, _session403_asci11_lookup sv, _session403_asci11_lookup tv
 WHERE t.slug='ascension-isaiah-11-robes-thrones-crowns-laid-up'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=11 AND sv.verse_number=40
   AND tv.edition_slug='canon' AND tv.book_slug='2-timothy' AND tv.chapter_number=4 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 3:5 — *He that overcometh, the same shall be clothed in white raiment; and I will not blot out his name out of the book of life, but I will confess his name before my Father, and before his angels.* The garments laid up for those who watch are the white raiment promised the overcomer.'
  FROM cross_reference_threads t, cross_references x, _session403_asci11_lookup sv, _session403_asci11_lookup tv
 WHERE t.slug='ascension-isaiah-11-robes-thrones-crowns-laid-up'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=11 AND sv.verse_number=40
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=3 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 4:4 — *And round about the throne were four and twenty seats: and upon the seats I saw four and twenty elders sitting, clothed in white raiment; and they had on their heads crowns of gold.* The thrones and crowns laid up in the seventh heaven are the elders'' seats and golden crowns about the throne.'
  FROM cross_reference_threads t, cross_references x, _session403_asci11_lookup sv, _session403_asci11_lookup tv
 WHERE t.slug='ascension-isaiah-11-robes-thrones-crowns-laid-up'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=11 AND sv.verse_number=40
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session403 — Ascension of Isaiah cross-references complete.'
