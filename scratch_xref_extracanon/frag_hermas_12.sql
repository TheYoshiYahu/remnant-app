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

