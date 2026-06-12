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

