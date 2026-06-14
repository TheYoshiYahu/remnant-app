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

