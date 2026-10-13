-- =====================================================================
-- Session 260 — Mark thins (depth) FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py /tmp/nt-depth-wt/data-schema/migrations/session260_mark2_depth_cross_references.sql
-- =====================================================================

\echo 'session260 — Mark thins (depth) cross-references starting...'
BEGIN;

-- ----- fragment: minion_mark_03.sql -----
-- Mark 3 — full-library Come-and-See cross-reference threads (NT DEPTH pass, THIN-ADD)
-- 4 NEW threads. DEDUP: 3:27 (binding-the-strong-man / Azazel / 1-Enoch / Jubilees) NOT re-anchored.
-- Band base 13060, step +3.

-- 3a. Temp view
CREATE TEMP VIEW _mk03_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1',
   'pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- 3b. cross_references rows
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- T1: 3:1-6 withered hand on the sabbath
  ('canon','mark',3,4,'canon','deuteronomy',22,4, 'free', E'*Thou shalt not see thy brother''s ass or his ox fall down by the way, and hide thyself from them: thou shalt surely help him to lift them up again.* (Deuteronomy 22:4). The Torah already commands the mercy Yahusha (Jesus) practices: a beast fallen on the sabbath you LIFT UP — you do not hide yourself. To restore a withered hand on the sabbath is that same lifting-up. Doing good is the sabbath rightly kept.'),
  ('canon','mark',3,4,'canon','leviticus',19,18, 'free', E'*Thou shalt not avenge, nor bear any grudge against the children of thy people, but thou shalt love thy neighbour as thyself: I am Yahuah (LORD).* (Leviticus 19:18). To save life and to do good IS love of neighbour — the very heart of the Torah. The rulers, plotting to destroy on the same day, break the commandment they accuse him of breaking.'),
  ('canon','mark',3,4,'canon','proverbs',12,10, 'free', E'*A righteous man regardeth the life of his beast: but the tender mercies of the wicked are cruel.* (Proverbs 12:10). If the righteous spare even a beast, how much more a man with a withered hand. The hardness of heart that would rather see him crippled than healed on the sabbath is the cruelty of the wicked, not the holiness of the day.'),
  ('canon','mark',3,4,'canon','isaiah',58,13, 'free', E'*If thou turn away thy foot from the sabbath, from doing thy pleasure on my holy day; and call the sabbath a delight, the holy of Yahuah (LORD), honourable; and shalt honour him, not doing thine own ways, nor finding thine own pleasure, nor speaking thine own words:* (Isaiah 58:13). The sabbath is a DELIGHT. Mercy and healing make it the delight it was given to be; the rulers'' deadly counsel is the doing of their own ways on the holy day.'),
  -- T2: 3:13-19 the Twelve ordained
  ('canon','mark',3,14,'canon','exodus',24,4, 'free', E'*And Moses wrote all the words of Yahuah (LORD), and rose up early in the morning, and builded an altar under the hill, and twelve pillars, according to the twelve tribes of Yashar''el (Israel).* (Exodus 24:4). Twelve pillars at Sinai for twelve tribes; now twelve ordained on the mountain. The number is covenantal — Yashar''el (Israel) re-gathered around the Son who chooses them.'),
  ('canon','mark',3,14,'canon','genesis',49,28, 'free', E'*All these are the twelve tribes of Yashar''el (Israel): and this is it that their father spake unto them, and blessed them; every one according to his blessing he blessed them.* (Genesis 49:28). The twelve tribes Jacob blessed are the pattern the twelve apostles answer to — the whole house, Judah and the scattered seed, named again in twelve.'),
  ('canon','mark',3,14,'canon','numbers',1,16, 'free', E'*These were the renowned of the congregation, princes of the tribes of their fathers, heads of thousands in Yashar''el (Israel).* (Numbers 1:16). One head per tribe stood for the congregation in the wilderness; twelve heads now stand to be sent forth and preach — the re-gathering of all Yashar''el (Israel) prefigured in the choosing.'),
  -- T3: 3:22-30 strong man bound / blasphemy against the Ruach HaKodesh
  ('canon','mark',3,27,'canon','isaiah',49,24, 'free', E'*Shall the prey be taken from the mighty, or the lawful captive delivered?* (Isaiah 49:24). The question the strong-man parable answers: yes — the prey IS taken from the mighty. The captives held by the unclean spirits are spoiled because the Stronger One has bound the strong man.'),
  ('canon','mark',3,27,'canon','isaiah',49,25, 'free', E'*But thus saith Yahuah (LORD), Even the captives of the mighty shall be taken away, and the prey of the terrible shall be delivered: for I will contend with him that contendeth with thee, and I will save thy children.* (Isaiah 49:25). Yahuah (LORD) himself contends and saves the children — and that contending is what is enacted when the Formed Son casts out devils. To call that work the prince of devils is to name the Father''s own deliverance unclean.'),
  ('canon','mark',3,29,'canon','1-samuel',2,25, 'free', E'*If one man sin against another, the judge shall judge him: but if a man sin against Yahuah (LORD), who shall intreat for him?* (1 Samuel 2:25). When sin is against Yahuah (LORD) himself there is none to intreat. The scribes, seeing the Spirit''s work and calling it the devil''s, sin against Yahuah (LORD) in just this way — there is no advocate for the deliberate naming of the holy as unclean.'),
  ('canon','mark',3,29,'canon','numbers',15,30, 'free', E'*But the soul that doeth ought presumptuously, whether he be born in the land, or a stranger, the same reproacheth Yahuah (LORD); and that soul shall be cut off from among his people.* (Numbers 15:30). The unforgivable blasphemy is not weakness or ignorance but the high-handed, presumptuous sin — eyes open, calling the Ruach HaKodesh (Holy Spirit) Beelzebub. That soul reproaches Yahuah (LORD) and is cut off.'),
  ('canon','mark',3,29,'canon','numbers',15,31, 'free', E'*Because he hath despised the word of Yahuah (LORD), and hath broken his commandment, that soul shall utterly be cut off; his iniquity shall be upon him.* (Numbers 15:31). To despise the word — to look on the manifest power of the Ruach HaKodesh (Holy Spirit) and despise it as devilry — leaves the iniquity standing on the head of the one who hardened himself; that is the never-forgiveness Yahusha (Jesus) names.'),
  ('canon','mark',3,29,'canon','matthew',12,32, 'free', E'*And whosoever speaketh a word against the Son of Adam, it shall be forgiven him: but whosoever speaketh against the Ruach HaKodesh (Holy Spirit), it shall not be forgiven him, neither in this world, neither in the world to come.* (Matthew 12:32). Matthew''s account draws the same line: the word against the Son of Adam may yet be forgiven, but the settled rejection of the Ruach HaKodesh (Holy Spirit) — naming the holy unclean — stands unforgiven in this world and the next.'),
  -- T4: 3:31-35 whosoever doeth the will of Elohim
  ('canon','mark',3,35,'canon','deuteronomy',33,9, 'free', E'*Who said unto his father and to his mother, I have not seen him; neither did he acknowledge his brethren, nor knew his own children: for they have observed thy word, and kept thy covenant.* (Deuteronomy 33:9). Levi''s blessing: loyalty to Yahuah (LORD) and his covenant set above even father, mother, and brethren. Yahusha (Jesus) names the same order — the family of Elohim (God) is reckoned by doing his will, not by blood alone.'),
  ('canon','mark',3,35,'canon','psalms',22,22, 'free', E'*I will declare thy name unto my brethren: in the midst of the congregation will I praise thee.* (Psalms 22:22). The Messiah of Psalm 22 claims a congregation as his brethren. Those who do the will of Elohim (God) are that congregation — brother and sister and mother to the Son who declares the Father''s name among them.'),
  ('canon','mark',3,35,'canon','matthew',12,50, 'free', E'*For whosoever shall do the will of my Father which is in heaven, the same is my brother, and sister, and mother.* (Matthew 12:50). Matthew makes the Father explicit: the will done is the FATHER''S will. The true kindred of the Formed Son are those who keep the will of the Father — the doing, not the claiming, is the seal of the family.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _mk03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _mk03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- 3c. Threads
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'mark-3-is-it-lawful-to-do-good-on-the-sabbath-the-withered-hand-deuteronomy-22-isaiah-58',
       E'Is it lawful to do good on the sabbath — the withered hand restored (Deuteronomy 22; Isaiah 58)',
       E'Yahusha (Jesus) enters the synagogue and finds a man with a withered hand, and the rulers watching to see *whether he would heal him on the sabbath day; that they might accuse him* (Mark 3:2). He sets the question plainly: *Is it lawful to do good on the sabbath days, or to do evil? to save life, or to kill?* (Mark 3:4). The Torah has already answered. *Thou shalt not see thy brother''s ass or his ox fall down by the way, and hide thyself from them: thou shalt surely help him to lift them up again.* (Deuteronomy 22:4) — the sabbath does not suspend mercy; to lift up what is fallen is commanded. *Thou shalt not avenge, nor bear any grudge against the children of thy people, but thou shalt love thy neighbour as thyself: I am Yahuah (LORD).* (Leviticus 19:18) — and saving life is love of neighbour, the heart of the Torah itself. *A righteous man regardeth the life of his beast: but the tender mercies of the wicked are cruel.* (Proverbs 12:10) — if the righteous spare a beast, how much more a man; the hardness that would rather see him crippled is the cruelty of the wicked, not the holiness of the day. And Isaiah names what the day is FOR: *If thou turn away thy foot from the sabbath... and call the sabbath a delight, the holy of Yahuah (LORD), honourable; and shalt honour him, not doing thine own ways, nor finding thine own pleasure...* (Isaiah 58:13). Healing makes the sabbath the delight it was given to be. It is the rulers — going forth to *take counsel with the Herodians against him, how they might destroy him* (Mark 3:6) — who do their own deadly pleasure on the holy day. The Son of man is Lord of the sabbath (Mark 2:28); he does not break it, he keeps it as it was meant to be kept and shows the rulers their hardness profaning it.',
       sv.verse_id, ev.verse_id, 'free', 13060
  FROM _mk03_lookup sv, _mk03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=3 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='mark' AND ev.chapter_number=3 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'mark-3-he-ordained-twelve-the-tribes-re-gathered-exodus-24-genesis-49',
       E'He ordained twelve — the tribes re-gathered (Exodus 24; Genesis 49)',
       E'On the mountain *he ordained twelve, that they should be with him, and that he might send them forth to preach* (Mark 3:14). The number is not incidental — it is covenant. At Sinai, *Moses wrote all the words of Yahuah (LORD), and rose up early in the morning, and builded an altar under the hill, and twelve pillars, according to the twelve tribes of Yashar''el (Israel).* (Exodus 24:4) — twelve pillars for twelve tribes, the whole house standing at the covenant. *All these are the twelve tribes of Yashar''el (Israel): and this is it that their father spake unto them, and blessed them; every one according to his blessing he blessed them.* (Genesis 49:28) — Jacob blessed twelve sons, and from them twelve tribes, Judah and the scattered seed together. *These were the renowned of the congregation, princes of the tribes of their fathers, heads of thousands in Yashar''el (Israel).* (Numbers 1:16) — one head per tribe stood for the congregation in the wilderness. Now twelve are chosen and sent: the house of Yashar''el (Israel) re-gathered around the Son who calls them, the firstfruits of the ingathering the prophets promised — not a new people replacing the old, but the twelve tribes named again in twelve men.',
       sv.verse_id, ev.verse_id, 'free', 13063
  FROM _mk03_lookup sv, _mk03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=3 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='mark' AND ev.chapter_number=3 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'mark-3-blasphemy-against-the-ruach-hakodesh-the-presumptuous-sin-isaiah-49-numbers-15',
       E'Blasphemy against the Ruach HaKodesh — the presumptuous sin that hath never forgiveness (Isaiah 49; Numbers 15)',
       E'The scribes from Jerusalem say *He hath Beelzebub, and by the prince of the devils casteth he out devils* (Mark 3:22), and Yahusha (Jesus) answers with the parable of the strong man — none can spoil the strong man''s house *except he will first bind the strong man* (Mark 3:27). Isaiah had already asked it: *Shall the prey be taken from the mighty, or the lawful captive delivered?* (Isaiah 49:24) — and answered, *Even the captives of the mighty shall be taken away, and the prey of the terrible shall be delivered: for I will contend with him that contendeth with thee, and I will save thy children.* (Isaiah 49:25). The deliverance is Yahuah''s (LORD''s) own contending, worked through the Formed Son. To call that work the devil''s is the unforgivable thing: *he that shall blaspheme against the Ruach HaKodesh (Holy Spirit) hath never forgiveness* (Mark 3:29). The Torah marks this sin precisely. *If one man sin against another, the judge shall judge him: but if a man sin against Yahuah (LORD), who shall intreat for him?* (1 Samuel 2:25) — when the sin is against Yahuah (LORD) himself, there is none to intreat. *But the soul that doeth ought presumptuously... the same reproacheth Yahuah (LORD); and that soul shall be cut off from among his people.* (Numbers 15:30) — the unforgivable sin is the high-handed one, eyes open. *Because he hath despised the word of Yahuah (LORD), and hath broken his commandment, that soul shall utterly be cut off; his iniquity shall be upon him.* (Numbers 15:31). And Matthew draws the same line in the Son''s own words: *whosoever speaketh a word against the Son of Adam, it shall be forgiven him: but whosoever speaketh against the Ruach HaKodesh (Holy Spirit), it shall not be forgiven him, neither in this world, neither in the world to come.* (Matthew 12:32). The line is not a moment of weakness but a settled hardening — looking on the manifest holiness of the Ruach HaKodesh (Holy Spirit) and naming it unclean.',
       sv.verse_id, ev.verse_id, 'free', 13066
  FROM _mk03_lookup sv, _mk03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=3 AND sv.verse_number=22
   AND ev.edition_slug='canon' AND ev.book_slug='mark' AND ev.chapter_number=3 AND ev.verse_number=30
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'mark-3-whosoever-shall-do-the-will-of-elohim-the-same-is-my-brother-deuteronomy-33-psalm-22',
       E'Whosoever shall do the will of Elohim, the same is my brother — the family by obedience (Deuteronomy 33; Psalm 22)',
       E'When his mother and brethren stand without and call for him, Yahusha (Jesus) looks round on those who sit at his feet and says, *Behold my mother and my brethren! For whosoever shall do the will of Elohim (God), the same is my brother, and my sister, and mother.* (Mark 3:34-35). The family of Elohim (God) is reckoned by the DOING of his will — the anti-antinomian seal of the whole chapter. This is Levi''s blessing exactly: *Who said unto his father and to his mother, I have not seen him; neither did he acknowledge his brethren... for they have observed thy word, and kept thy covenant.* (Deuteronomy 33:9) — covenant loyalty set above even kindred. The Messiah of Psalm 22 claims just such a kindred: *I will declare thy name unto my brethren: in the midst of the congregation will I praise thee.* (Psalms 22:22) — those who do the Father''s will are the congregation he names as brethren. And Matthew makes the Father explicit: *whosoever shall do the will of my Father which is in heaven, the same is my brother, and sister, and mother.* (Matthew 12:50). The will done is the Father''s will, and the Formed Son who does that will perfectly gathers as his own household all who keep it. Not the claiming, but the doing, is the seal of the family — grace never sets the will of Elohim (God) aside; it is the very mark of belonging.',
       sv.verse_id, ev.verse_id, 'free', 13069
  FROM _mk03_lookup sv, _mk03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=3 AND sv.verse_number=31
   AND ev.edition_slug='canon' AND ev.book_slug='mark' AND ev.chapter_number=3 AND ev.verse_number=35
ON CONFLICT (slug) DO NOTHING;

-- 3d. thread_members
-- T1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 22:4 — *Thou shalt not see thy brother''s ass or his ox fall down by the way, and hide thyself from them: thou shalt surely help him to lift them up again.* The Torah commands the sabbath-mercy Yahusha (Jesus) practices.'
  FROM cross_reference_threads t, cross_references x, _mk03_lookup sv, _mk03_lookup tv
 WHERE t.slug='mark-3-is-it-lawful-to-do-good-on-the-sabbath-the-withered-hand-deuteronomy-22-isaiah-58'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=3 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=22 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 19:18 — *thou shalt love thy neighbour as thyself: I am Yahuah (LORD).* To save life is love of neighbour, the heart of the Torah.'
  FROM cross_reference_threads t, cross_references x, _mk03_lookup sv, _mk03_lookup tv
 WHERE t.slug='mark-3-is-it-lawful-to-do-good-on-the-sabbath-the-withered-hand-deuteronomy-22-isaiah-58'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=3 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 12:10 — *A righteous man regardeth the life of his beast: but the tender mercies of the wicked are cruel.* If the righteous spare a beast, how much more a man; the rulers'' hardness is the cruelty of the wicked.'
  FROM cross_reference_threads t, cross_references x, _mk03_lookup sv, _mk03_lookup tv
 WHERE t.slug='mark-3-is-it-lawful-to-do-good-on-the-sabbath-the-withered-hand-deuteronomy-22-isaiah-58'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=3 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=12 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 58:13 — *call the sabbath a delight, the holy of Yahuah (LORD), honourable.* Healing makes the sabbath the delight it was given to be; the rulers do their own deadly pleasure on the holy day.'
  FROM cross_reference_threads t, cross_references x, _mk03_lookup sv, _mk03_lookup tv
 WHERE t.slug='mark-3-is-it-lawful-to-do-good-on-the-sabbath-the-withered-hand-deuteronomy-22-isaiah-58'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=3 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=58 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- T2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 24:4 — *twelve pillars, according to the twelve tribes of Yashar''el (Israel).* Twelve pillars at Sinai for twelve tribes; now twelve ordained on the mountain.'
  FROM cross_reference_threads t, cross_references x, _mk03_lookup sv, _mk03_lookup tv
 WHERE t.slug='mark-3-he-ordained-twelve-the-tribes-re-gathered-exodus-24-genesis-49'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=3 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=24 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 49:28 — *All these are the twelve tribes of Yashar''el (Israel)... every one according to his blessing he blessed them.* The twelve Jacob blessed are the pattern the twelve apostles answer to.'
  FROM cross_reference_threads t, cross_references x, _mk03_lookup sv, _mk03_lookup tv
 WHERE t.slug='mark-3-he-ordained-twelve-the-tribes-re-gathered-exodus-24-genesis-49'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=3 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Numbers 1:16 — *princes of the tribes of their fathers, heads of thousands in Yashar''el (Israel).* One head per tribe stood for the congregation in the wilderness; twelve heads now stand to be sent forth.'
  FROM cross_reference_threads t, cross_references x, _mk03_lookup sv, _mk03_lookup tv
 WHERE t.slug='mark-3-he-ordained-twelve-the-tribes-re-gathered-exodus-24-genesis-49'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=3 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=1 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- T3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 49:24 — *Shall the prey be taken from the mighty, or the lawful captive delivered?* The question the strong-man parable answers.'
  FROM cross_reference_threads t, cross_references x, _mk03_lookup sv, _mk03_lookup tv
 WHERE t.slug='mark-3-blasphemy-against-the-ruach-hakodesh-the-presumptuous-sin-isaiah-49-numbers-15'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=3 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=49 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 49:25 — *the captives of the mighty shall be taken away... I will contend with him that contendeth with thee, and I will save thy children.* The deliverance is Yahuah''s (LORD''s) own contending, worked through the Formed Son.'
  FROM cross_reference_threads t, cross_references x, _mk03_lookup sv, _mk03_lookup tv
 WHERE t.slug='mark-3-blasphemy-against-the-ruach-hakodesh-the-presumptuous-sin-isaiah-49-numbers-15'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=3 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=49 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Samuel 2:25 — *if a man sin against Yahuah (LORD), who shall intreat for him?* When sin is against Yahuah (LORD) himself there is none to intreat.'
  FROM cross_reference_threads t, cross_references x, _mk03_lookup sv, _mk03_lookup tv
 WHERE t.slug='mark-3-blasphemy-against-the-ruach-hakodesh-the-presumptuous-sin-isaiah-49-numbers-15'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=3 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=2 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Numbers 15:30 — *the soul that doeth ought presumptuously... the same reproacheth Yahuah (LORD); and that soul shall be cut off.* The unforgivable sin is the high-handed one, eyes open.'
  FROM cross_reference_threads t, cross_references x, _mk03_lookup sv, _mk03_lookup tv
 WHERE t.slug='mark-3-blasphemy-against-the-ruach-hakodesh-the-presumptuous-sin-isaiah-49-numbers-15'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=3 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=15 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Numbers 15:31 — *Because he hath despised the word of Yahuah (LORD)... that soul shall utterly be cut off; his iniquity shall be upon him.* To despise the word leaves the iniquity standing on the one who hardened himself.'
  FROM cross_reference_threads t, cross_references x, _mk03_lookup sv, _mk03_lookup tv
 WHERE t.slug='mark-3-blasphemy-against-the-ruach-hakodesh-the-presumptuous-sin-isaiah-49-numbers-15'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=3 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=15 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Matthew 12:32 — *whosoever speaketh a word against the Son of Adam, it shall be forgiven him: but whosoever speaketh against the Ruach HaKodesh (Holy Spirit), it shall not be forgiven him.* Matthew draws the same line in the Son''s own words.'
  FROM cross_reference_threads t, cross_references x, _mk03_lookup sv, _mk03_lookup tv
 WHERE t.slug='mark-3-blasphemy-against-the-ruach-hakodesh-the-presumptuous-sin-isaiah-49-numbers-15'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=3 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=12 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- T4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 33:9 — *for they have observed thy word, and kept thy covenant.* Levi''s blessing: covenant loyalty set above even father, mother, and brethren — the order Yahusha (Jesus) names.'
  FROM cross_reference_threads t, cross_references x, _mk03_lookup sv, _mk03_lookup tv
 WHERE t.slug='mark-3-whosoever-shall-do-the-will-of-elohim-the-same-is-my-brother-deuteronomy-33-psalm-22'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=3 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=33 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 22:22 — *I will declare thy name unto my brethren: in the midst of the congregation will I praise thee.* The Messiah of Psalm 22 claims a congregation as his brethren.'
  FROM cross_reference_threads t, cross_references x, _mk03_lookup sv, _mk03_lookup tv
 WHERE t.slug='mark-3-whosoever-shall-do-the-will-of-elohim-the-same-is-my-brother-deuteronomy-33-psalm-22'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=3 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=22 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 12:50 — *whosoever shall do the will of my Father which is in heaven, the same is my brother, and sister, and mother.* Matthew makes the Father explicit: the will done is the Father''s will.'
  FROM cross_reference_threads t, cross_references x, _mk03_lookup sv, _mk03_lookup tv
 WHERE t.slug='mark-3-whosoever-shall-do-the-will-of-elohim-the-same-is-my-brother-deuteronomy-33-psalm-22'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=3 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=12 AND tv.verse_number=50
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_mark_04.sql -----
-- minion_mark_04.sql — Mark 4 cross-reference threads (NT DEPTH pass, THIN-ADD)
-- DEDUP: existing anchors 4:14 (seed-sown/2-esdras) and 4:26 (sleeping-and-rising) — NOT touched here.
-- 4 NEW threads on 4:1-12, 4:21-25, 4:30-32, 4:35-41. Band base 13090, step +3.

CREATE TEMP VIEW _mk04_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1',
   'pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================================================
-- 3b. cross_references rows
-- ============================================================
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- THREAD 1: the sower / seeing they see not (anchor 4:11-12)
  ('canon','mark',4,11,'canon','isaiah',6,9, 'free', E'*And he said, Go, and tell this people, Hear ye indeed, but understand not; and see ye indeed, but perceive not.* (Isaiah 6:9) — the very words Yahusha (Jesus) lifts up. He did not invent the parable-veil; he read it off Isaiah''s commission.'),
  ('canon','mark',4,11,'canon','isaiah',6,10, 'free', E'*Make the heart of this people fat, and make their ears heavy, and shut their eyes; lest they see with their eyes, and hear with their ears, and understand with their heart, and convert, and be healed.* (Isaiah 6:10) — *lest at any time they should be converted, and their sins should be forgiven them* (Mark 4:12) is Isaiah''s own clause, restored.'),
  ('canon','mark',4,11,'canon','isaiah',55,10, 'free', E'*For as the rain cometh down, and the snow from heaven, and returneth not thither, but watereth the earth, and maketh it bring forth and bud, that it may give seed to the sower, and bread to the eater* (Isaiah 55:10) — the word IS the seed, and the ground is the heart that receives or refuses it.'),
  ('canon','mark',4,11,'canon','isaiah',55,11, 'free', E'*So shall my word be that goeth forth out of my mouth: it shall not return unto me void, but it shall accomplish that which I please, and it shall prosper in the thing whereto I sent it.* (Isaiah 55:11) — the sower''s word does not fail; the failure is in the soil.'),
  ('canon','mark',4,11,'canon','jeremiah',4,3, 'free', E'*For thus saith Yahuah (LORD) to the men of Yahudah (Judah) and Jerusalem, Break up your fallow ground, and sow not among thorns.* (Jeremiah 4:3) — the thorny ground of Mark 4:7 was already named by Jeremiah; the heart must be broken up before it bears.'),
  ('canon','mark',4,11,'canon','john',12,40, 'free', E'*He hath blinded their eyes, and hardened their heart; that they should not see with their eyes, nor understand with their heart, and be converted, and I should heal them.* (John 12:40) — John quotes the same Isaiah 6 over the same rejection, so the library reads itself with one voice.'),
  ('canon','mark',4,11,'canon','matthew',13,15, 'free', E'*For this people''s heart is waxed gross, and their ears are dull of hearing, and their eyes they have closed; lest at any time they should see with their eyes, and hear with their ears, and should understand with their heart, and should be converted, and I should heal them.* (Matthew 13:15) — Matthew names it outright: *in them is fulfilled the prophecy of Esaias.*'),

  -- THREAD 2: the candle not under a bushel (anchor 4:21-25)
  ('canon','mark',4,21,'canon','psalms',119,105, 'free', E'*Thy word is a lamp unto my feet, and a light unto my path.* (Psalm 119:105) — the candle Yahusha (Jesus) will not hide under a bushel is the word itself, the lamp the Torah already named.'),
  ('canon','mark',4,21,'canon','proverbs',4,18, 'free', E'*But the path of the just is as the shining light, that shineth more and more unto the perfect day.* (Proverbs 4:18) — the light is set on the candlestick to grow, not to be smothered.'),
  ('canon','mark',4,21,'canon','ecclesiastes',12,14, 'free', E'*For Elohim (God) shall bring every work into judgment, with every secret thing, whether it be good, or whether it be evil.* (Ecclesiastes 12:14) — *there is nothing hid, which shall not be manifested* (Mark 4:22) is the Preacher''s verdict in the Son''s mouth.'),
  ('canon','mark',4,21,'canon','matthew',5,15, 'free', E'*Neither do men light a candle, and put it under a bushel, but on a candlestick; and it giveth light unto all that are in the house.* (Matthew 5:15) — the same lamp-saying that opens the Sermon on the Mount.'),
  ('canon','mark',4,21,'canon','luke',8,17, 'free', E'*For nothing is secret, that shall not be made manifest; neither any thing hid, that shall not be known and come abroad.* (Luke 8:17) — Luke carries the candle-and-measure word together, as Mark does.'),

  -- THREAD 3: the grain of mustard seed (anchor 4:30-32)
  ('canon','mark',4,30,'canon','ezekiel',17,23, 'free', E'*In the mountain of the height of Yashar''el (Israel) will I plant it: and it shall bring forth boughs, and bear fruit, and be a goodly cedar: and under it shall dwell all fowl of every wing; in the shadow of the branches thereof shall they dwell.* (Ezekiel 17:23) — the tender twig planted by Yahuah (LORD) becomes the tree where every bird lodges; the kingdom''s growth in prophetic picture.'),
  ('canon','mark',4,30,'canon','daniel',4,12, 'free', E'*The leaves thereof were fair, and the fruit thereof much, and in it was meat for all: the beasts of the field had shadow under it, and the fowls of the heaven dwelt in the boughs thereof, and all flesh was fed of it.* (Daniel 4:12) — the great tree sheltering all; *the fowls of the air may lodge under the shadow of it* (Mark 4:32) speaks the same image.'),
  ('canon','mark',4,30,'canon','psalms',104,12, 'free', E'*By them shall the fowls of the heaven have their habitation, which sing among the branches.* (Psalm 104:12) — the birds in the branches, a creation-song the parable gathers up.'),
  ('canon','mark',4,30,'canon','matthew',13,32, 'free', E'*Which indeed is the least of all seeds: but when it is grown, it is the greatest among herbs, and becometh a tree, so that the birds of the air come and lodge in the branches thereof.* (Matthew 13:32) — Matthew''s telling makes the Ezekiel-and-Daniel tree explicit: the birds come and lodge.'),

  -- THREAD 4: stilling the storm (anchor 4:35-41)
  ('canon','mark',4,39,'canon','psalms',107,29, 'free', E'*He maketh the storm a calm, so that the waves thereof are still.* (Psalm 107:29) — what the sailors cried to Yahuah (LORD) to do, Yahusha (Jesus) does with a word: *Peace, be still.*'),
  ('canon','mark',4,39,'canon','psalms',107,28, 'free', E'*Then they cry unto Yahuah (LORD) in their trouble, and he bringeth them out of their distresses.* (Psalm 107:28) — the disciples'' cry *Master, carest thou not that we perish?* is this very cry of the storm-tossed to their Deliverer.'),
  ('canon','mark',4,39,'canon','psalms',89,9, 'free', E'*Thou rulest the raging of the sea: when the waves thereof arise, thou stillest them.* (Psalm 89:9) — the ruling of the sea is Yahuah''s (LORD''s) own prerogative, exercised here in the Formed Son.'),
  ('canon','mark',4,39,'canon','job',38,11, 'free', E'*And said, Hitherto shalt thou come, but no further: and here shall thy proud waves be stayed?* (Job 38:11) — the One who set the sea its bound at creation speaks again from the hinder part of the ship.'),
  ('canon','mark',4,39,'canon','psalms',46,10, 'free', E'*Be still, and know that I am Elohim (God): I will be exalted among the heathen, I will be exalted in the earth.* (Psalm 46:10) — *Peace, be still* is the Creator''s own word; the disciples'' question *What manner of man is this?* is answered in the verse.'),
  ('canon','mark',4,39,'canon','jonah',1,15, 'free', E'*So they took up Jonah, and cast him forth into the sea: and the sea ceased from her raging.* (Jonah 1:15) — Jonah slept in the storm and the sea raged till a man went over; here the One asleep in the storm needs only to wake and rebuke it.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _mk04_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _mk04_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================================================
-- 3c. threads
-- ============================================================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'mark-4-the-sower-and-seeing-they-see-not-isaiah-6-and-55',
       E'The sower went forth — seeing they see not (Isaiah 6; Isaiah 55)',
       E'When Yahusha (Jesus) tells the twelve why he speaks in parables — *That seeing they may see, and not perceive; and hearing they may hear, and not understand; lest at any time they should be converted, and their sins should be forgiven them* (Mark 4:12) — he is not inventing a riddle. He is quoting Isaiah''s commission word for word. *And he said, Go, and tell this people, Hear ye indeed, but understand not; and see ye indeed, but perceive not* (Isaiah 6:9); *Make the heart of this people fat, and make their ears heavy, and shut their eyes; lest they see with their eyes, and hear with their ears, and understand with their heart, and convert, and be healed* (Isaiah 6:10). The veil is the same veil. And the seed itself is Isaiah''s figure too: *For as the rain cometh down, and the snow from heaven, and returneth not thither, but watereth the earth, and maketh it bring forth and bud, that it may give seed to the sower, and bread to the eater* (Isaiah 55:10) — *So shall my word be that goeth forth out of my mouth: it shall not return unto me void, but it shall accomplish that which I please, and it shall prosper in the thing whereto I sent it* (Isaiah 55:11). The word does not fail; the soil receives or refuses. The thorny ground was named long before: *Break up your fallow ground, and sow not among thorns* (Jeremiah 4:3). And the library reads itself with one voice — John quotes the same Isaiah over the same rejection: *He hath blinded their eyes, and hardened their heart; that they should not see with their eyes, nor understand with their heart, and be converted, and I should heal them* (John 12:40); and Matthew names it outright: *For this people''s heart is waxed gross, and their ears are dull of hearing, and their eyes they have closed; lest at any time they should see with their eyes, and hear with their ears, and should understand with their heart, and should be converted, and I should heal them* (Matthew 13:15). The sheep hear the Shepherd''s voice and turn; the word reveals what the heart already was.',
       sv.verse_id, ev.verse_id, 'free', 13090
  FROM _mk04_lookup sv, _mk04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=4 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='mark' AND ev.chapter_number=4 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'mark-4-the-candle-not-under-a-bushel-psalm-119-and-ecclesiastes-12',
       E'Is a candle brought to be put under a bushel? (Psalm 119; Ecclesiastes 12)',
       E'*Is a candle brought to be put under a bushel, or under a bed? and not to be set on a candlestick?* (Mark 4:21). The candle is the word, and the word was always a lamp: *Thy word is a lamp unto my feet, and a light unto my path* (Psalm 119:105). It is set on the candlestick to grow, not to be smothered — *But the path of the just is as the shining light, that shineth more and more unto the perfect day* (Proverbs 4:18). And nothing stays hidden: *For there is nothing hid, which shall not be manifested; neither was any thing kept secret, but that it should come abroad* (Mark 4:22) is the Preacher''s own verdict carried forward — *For Elohim (God) shall bring every work into judgment, with every secret thing, whether it be good, or whether it be evil* (Ecclesiastes 12:14). The same lamp-saying opens the Sermon on the Mount: *Neither do men light a candle, and put it under a bushel, but on a candlestick; and it giveth light unto all that are in the house* (Matthew 5:15); and Luke carries it together with the measure: *For nothing is secret, that shall not be made manifest; neither any thing hid, that shall not be known and come abroad* (Luke 8:17). The light kindled in the heart that hears is not given to be hidden but to shine.',
       sv.verse_id, ev.verse_id, 'free', 13093
  FROM _mk04_lookup sv, _mk04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=4 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='mark' AND ev.chapter_number=4 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'mark-4-the-grain-of-mustard-seed-the-fowls-lodge-ezekiel-17-and-daniel-4',
       E'The grain of mustard seed — the fowls lodge in its shadow (Ezekiel 17; Daniel 4)',
       E'*It is like a grain of mustard seed, which, when it is sown in the earth, is less than all the seeds that be in the earth: But when it is sown, it groweth up, and becometh greater than all herbs, and shooteth out great branches; so that the fowls of the air may lodge under the shadow of it* (Mark 4:31-32). The least seed becoming the greatest tree where the birds shelter is a prophetic picture already drawn. Yahuah (LORD) plants a tender twig that becomes a great tree: *In the mountain of the height of Yashar''el (Israel) will I plant it: and it shall bring forth boughs, and bear fruit, and be a goodly cedar: and under it shall dwell all fowl of every wing; in the shadow of the branches thereof shall they dwell* (Ezekiel 17:23). Daniel saw the same: *The leaves thereof were fair, and the fruit thereof much, and in it was meat for all: the beasts of the field had shadow under it, and the fowls of the heaven dwelt in the boughs thereof, and all flesh was fed of it* (Daniel 4:12). It is a creation-song too: *By them shall the fowls of the heaven have their habitation, which sing among the branches* (Psalm 104:12). Matthew makes the lodging explicit: *Which indeed is the least of all seeds: but when it is grown, it is the greatest among herbs, and becometh a tree, so that the birds of the air come and lodge in the branches thereof* (Matthew 13:32). The kingdom of Elohim (God) starts hidden and small and grows into the tree that shelters the gathering.',
       sv.verse_id, ev.verse_id, 'free', 13096
  FROM _mk04_lookup sv, _mk04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=4 AND sv.verse_number=30
   AND ev.edition_slug='canon' AND ev.book_slug='mark' AND ev.chapter_number=4 AND ev.verse_number=32
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'mark-4-peace-be-still-the-creators-authority-over-the-sea-psalm-107-and-job-38',
       E'Peace, be still — the Creator''s authority over the sea (Psalm 107; Job 38)',
       E'*And he arose, and rebuked the wind, and said unto the sea, Peace, be still. And the wind ceased, and there was a great calm* (Mark 4:39). The disciples ask *What manner of man is this, that even the wind and the sea obey him?* (Mark 4:41) — and the Tanakh answers. Stilling the sea is Yahuah''s (LORD''s) own work: *Then they cry unto Yahuah (LORD) in their trouble, and he bringeth them out of their distresses* (Psalm 107:28); *He maketh the storm a calm, so that the waves thereof are still* (Psalm 107:29). It is his prerogative alone: *Thou rulest the raging of the sea: when the waves thereof arise, thou stillest them* (Psalm 89:9). The One who set the sea its bound at creation speaks again from the hinder part of the ship: *And said, Hitherto shalt thou come, but no further: and here shall thy proud waves be stayed?* (Job 38:11). And *Peace, be still* is the Creator''s own word: *Be still, and know that I am Elohim (God): I will be exalted among the heathen, I will be exalted in the earth* (Psalm 46:10). Where Jonah slept in the storm and the sea raged until a man went over the side — *So they took up Jonah, and cast him forth into the sea: and the sea ceased from her raging* (Jonah 1:15) — here the One asleep on the pillow needs only to wake and rebuke it. The Formed Son does what only Yahuah (LORD) does, because the One who walked the deep at creation is the One in the boat.',
       sv.verse_id, ev.verse_id, 'free', 13099
  FROM _mk04_lookup sv, _mk04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=4 AND sv.verse_number=35
   AND ev.edition_slug='canon' AND ev.book_slug='mark' AND ev.chapter_number=4 AND ev.verse_number=41
ON CONFLICT (slug) DO NOTHING;

-- ============================================================
-- 3d. thread_members
-- ============================================================
-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 6:9 — *Hear ye indeed, but understand not; and see ye indeed, but perceive not* — the commission Yahusha (Jesus) quotes.'
  FROM cross_reference_threads t, cross_references x, _mk04_lookup sv, _mk04_lookup tv
 WHERE t.slug='mark-4-the-sower-and-seeing-they-see-not-isaiah-6-and-55'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=4 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=6 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 6:10 — *lest they see... and convert, and be healed* — Mark 4:12''s closing clause restored.'
  FROM cross_reference_threads t, cross_references x, _mk04_lookup sv, _mk04_lookup tv
 WHERE t.slug='mark-4-the-sower-and-seeing-they-see-not-isaiah-6-and-55'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=4 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=6 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 55:10 — the rain gives *seed to the sower* — the word IS the seed.'
  FROM cross_reference_threads t, cross_references x, _mk04_lookup sv, _mk04_lookup tv
 WHERE t.slug='mark-4-the-sower-and-seeing-they-see-not-isaiah-6-and-55'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=4 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=55 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 55:11 — *my word... shall not return unto me void* — the word does not fail; the soil refuses.'
  FROM cross_reference_threads t, cross_references x, _mk04_lookup sv, _mk04_lookup tv
 WHERE t.slug='mark-4-the-sower-and-seeing-they-see-not-isaiah-6-and-55'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=4 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=55 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jeremiah 4:3 — *sow not among thorns* — the thorny ground named long before the parable.'
  FROM cross_reference_threads t, cross_references x, _mk04_lookup sv, _mk04_lookup tv
 WHERE t.slug='mark-4-the-sower-and-seeing-they-see-not-isaiah-6-and-55'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=4 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=4 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'John 12:40 — John quotes the same Isaiah 6 over the same rejection.'
  FROM cross_reference_threads t, cross_references x, _mk04_lookup sv, _mk04_lookup tv
 WHERE t.slug='mark-4-the-sower-and-seeing-they-see-not-isaiah-6-and-55'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=4 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=12 AND tv.verse_number=40
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Matthew 13:15 — *in them is fulfilled the prophecy of Esaias* — named outright.'
  FROM cross_reference_threads t, cross_references x, _mk04_lookup sv, _mk04_lookup tv
 WHERE t.slug='mark-4-the-sower-and-seeing-they-see-not-isaiah-6-and-55'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=4 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=13 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 119:105 — *Thy word is a lamp unto my feet* — the candle is the word.'
  FROM cross_reference_threads t, cross_references x, _mk04_lookup sv, _mk04_lookup tv
 WHERE t.slug='mark-4-the-candle-not-under-a-bushel-psalm-119-and-ecclesiastes-12'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=4 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=119 AND tv.verse_number=105
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 4:18 — the just path *shineth more and more* — set up to grow, not be hidden.'
  FROM cross_reference_threads t, cross_references x, _mk04_lookup sv, _mk04_lookup tv
 WHERE t.slug='mark-4-the-candle-not-under-a-bushel-psalm-119-and-ecclesiastes-12'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=4 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=4 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ecclesiastes 12:14 — *every secret thing* brought into judgment — Mark 4:22''s nothing-hid.'
  FROM cross_reference_threads t, cross_references x, _mk04_lookup sv, _mk04_lookup tv
 WHERE t.slug='mark-4-the-candle-not-under-a-bushel-psalm-119-and-ecclesiastes-12'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=4 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=12 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 5:15 — the same lamp-saying opening the Sermon on the Mount.'
  FROM cross_reference_threads t, cross_references x, _mk04_lookup sv, _mk04_lookup tv
 WHERE t.slug='mark-4-the-candle-not-under-a-bushel-psalm-119-and-ecclesiastes-12'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=4 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Luke 8:17 — Luke carries the candle-and-measure word together as Mark does.'
  FROM cross_reference_threads t, cross_references x, _mk04_lookup sv, _mk04_lookup tv
 WHERE t.slug='mark-4-the-candle-not-under-a-bushel-psalm-119-and-ecclesiastes-12'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=4 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=8 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 17:23 — the tender twig becomes a goodly cedar where *all fowl of every wing* dwell.'
  FROM cross_reference_threads t, cross_references x, _mk04_lookup sv, _mk04_lookup tv
 WHERE t.slug='mark-4-the-grain-of-mustard-seed-the-fowls-lodge-ezekiel-17-and-daniel-4'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=4 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=17 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 4:12 — the great tree, *the fowls of the heaven dwelt in the boughs thereof.*'
  FROM cross_reference_threads t, cross_references x, _mk04_lookup sv, _mk04_lookup tv
 WHERE t.slug='mark-4-the-grain-of-mustard-seed-the-fowls-lodge-ezekiel-17-and-daniel-4'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=4 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=4 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 104:12 — the birds *sing among the branches* — the creation-song the parable gathers.'
  FROM cross_reference_threads t, cross_references x, _mk04_lookup sv, _mk04_lookup tv
 WHERE t.slug='mark-4-the-grain-of-mustard-seed-the-fowls-lodge-ezekiel-17-and-daniel-4'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=4 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=104 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 13:32 — Matthew makes the lodging explicit: *the birds of the air come and lodge.*'
  FROM cross_reference_threads t, cross_references x, _mk04_lookup sv, _mk04_lookup tv
 WHERE t.slug='mark-4-the-grain-of-mustard-seed-the-fowls-lodge-ezekiel-17-and-daniel-4'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=4 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=13 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 107:29 — *He maketh the storm a calm* — what Yahusha (Jesus) does with a word.'
  FROM cross_reference_threads t, cross_references x, _mk04_lookup sv, _mk04_lookup tv
 WHERE t.slug='mark-4-peace-be-still-the-creators-authority-over-the-sea-psalm-107-and-job-38'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=4 AND sv.verse_number=39
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=107 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 107:28 — the storm-tossed cry to their Deliverer — the disciples'' cry.'
  FROM cross_reference_threads t, cross_references x, _mk04_lookup sv, _mk04_lookup tv
 WHERE t.slug='mark-4-peace-be-still-the-creators-authority-over-the-sea-psalm-107-and-job-38'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=4 AND sv.verse_number=39
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=107 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 89:9 — *Thou rulest the raging of the sea* — Yahuah''s (LORD''s) own prerogative.'
  FROM cross_reference_threads t, cross_references x, _mk04_lookup sv, _mk04_lookup tv
 WHERE t.slug='mark-4-peace-be-still-the-creators-authority-over-the-sea-psalm-107-and-job-38'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=4 AND sv.verse_number=39
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=89 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Job 38:11 — *Hitherto shalt thou come, but no further* — the One who set the sea its bound.'
  FROM cross_reference_threads t, cross_references x, _mk04_lookup sv, _mk04_lookup tv
 WHERE t.slug='mark-4-peace-be-still-the-creators-authority-over-the-sea-psalm-107-and-job-38'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=4 AND sv.verse_number=39
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=38 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Psalm 46:10 — *Be still, and know that I am Elohim (God)* — the Creator''s own word.'
  FROM cross_reference_threads t, cross_references x, _mk04_lookup sv, _mk04_lookup tv
 WHERE t.slug='mark-4-peace-be-still-the-creators-authority-over-the-sea-psalm-107-and-job-38'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=4 AND sv.verse_number=39
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=46 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Jonah 1:15 — Jonah cast over and *the sea ceased from her raging* — here the sleeper wakes and rebukes it.'
  FROM cross_reference_threads t, cross_references x, _mk04_lookup sv, _mk04_lookup tv
 WHERE t.slug='mark-4-peace-be-still-the-creators-authority-over-the-sea-psalm-107-and-job-38'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=4 AND sv.verse_number=39
   AND tv.edition_slug='canon' AND tv.book_slug='jonah' AND tv.chapter_number=1 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_mark_08.sql -----
-- ============================================================================
-- minion_mark_08.sql  —  Mark 8 (THIN-ADD; DEDUP 8:1 + 8:15 untouched)
-- 3 NEW threads: 8:22-26 blind man of Bethsaida; 8:27-30 Peter's confession;
-- 8:31-38 the Son of Adam must suffer then come in glory.
-- sort_order band base 13210, step +3.
-- ============================================================================

-- 3a. Temp view -------------------------------------------------------------
CREATE TEMP VIEW _mk08_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1',
   'pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- 3b. cross_references rows -------------------------------------------------
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- ===== Thread 1: 8:22-26 blind man of Bethsaida, healed in stages =====
  ('canon','mark',8,22,'canon','isaiah',35,5, 'free', E'*Then the eyes of the blind shall be opened, and the ears of the deaf shall be unstopped.* (Isaiah 35:5). The sign Yahusha (Jesus) gives at Bethsaida is the very sign Isaiah hung over the coming of Elohim (God): when he comes, the blind see. The healing IS the credential.'),
  ('canon','mark',8,23,'canon','isaiah',42,16, 'free', E'*And I will bring the blind by a way that they knew not; I will lead them in paths that they have not known: I will make darkness light before them, and crooked things straight.* (Isaiah 42:16). He takes the blind man *by the hand* and leads him *out of the town* — the Servant of Isaiah 42 leading the blind by a way they knew not, step by step.'),
  ('canon','mark',8,24,'canon','isaiah',42,18, 'free', E'*Hear, ye deaf; and look, ye blind, that ye may see.* (Isaiah 42:18). *I see men as trees, walking* — sight half-given, the way only begun. Isaiah''s call to the half-seeing is the same call: look, that ye may see — fully.'),
  ('canon','mark',8,25,'canon','isaiah',35,10, 'free', E'*And the ransomed of Yahuah (LORD) shall return... they shall obtain joy and gladness, and sorrow and sighing shall flee away.* (Isaiah 35:10). The second touch finishes it: *he was restored, and saw every man clearly.* The opening of the eyes belongs to the great return — the ransomed seeing clearly at last.'),

  -- ===== Thread 2: 8:27-30 Peter's confession — Thou art the Messiah =====
  ('canon','mark',8,29,'canon','psalms',2,2, 'free', E'*The kings of the earth set themselves, and the rulers take counsel together, against Yahuah (LORD), and against his anointed* (Psalm 2:2). *Thou art the Messiah* — the Anointed One. Peter names what Psalm 2 named long before: Yahuah''s anointed King set against a raging world.'),
  ('canon','mark',8,29,'canon','psalms',2,7, 'free', E'*I will declare the decree: Yahuah (LORD) hath said unto me, Thou art my Son; this day have I begotten thee.* (Psalm 2:7). The Messiah is the begotten Son — the Formed Son who HAS a Father. The Father declares; the Son is begotten. The confession is true because the Father is its source.'),
  ('canon','mark',8,29,'canon','daniel',7,13, 'free', E'*I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days* (Daniel 7:13). The *kaph* stands — *one LIKE the Son of Adam* — he comes in the likeness, having taken flesh, yet remains the cloud-rider. Peter''s *Messiah* is Daniel''s cloud-borne One.'),
  ('canon','mark',8,29,'enoch','1-enoch',46,3, 'extras', E'*This is the Son of Adam who hath righteousness... because Yahuah (God) of Spirits hath chosen him, and whose lot hath the pre-eminence before Yahuah (God) of Spirits* (1 Enoch 46:3). The watchers'' own book names him: the Son of Adam beside the Head of Days, chosen and pre-eminent. Not a co-equal — the chosen One of the Father of Spirits.'),
  ('canon','mark',8,29,'enoch','1-enoch',48,2, 'extras', E'*And at that hour that Son of Adam was named In the presence of Yahuah (God) of Spirits, And his name before the Head of Days.* (1 Enoch 48:2). Named before the sun was made (48:3) — the Formed Son, begotten before the world, now confessed by Peter at Caesarea Philippi.'),

  -- ===== Thread 3: 8:31-38 the Son of Adam must suffer, then come in glory =====
  ('canon','mark',8,31,'canon','isaiah',53,3, 'free', E'*He is despised and rejected of men; a man of sorrows, and acquainted with grief* (Isaiah 53:3). *The Son of Adam must suffer many things, and be rejected of the elders* — the *must* is Isaiah''s. The rejection was written into the servant-song centuries before.'),
  ('canon','mark',8,31,'canon','isaiah',53,5, 'free', E'*But he was wounded for our transgressions, he was bruised for our iniquities: the chastisement of our peace was upon him; and with his stripes we are healed.* (Isaiah 53:5). The suffering Peter rebukes is the wounding by which we are healed. *Get thee behind me, Satan* — to refuse the cross is to refuse the healing.'),
  ('canon','mark',8,37,'canon','psalms',49,7, 'free', E'*None of them can by any means redeem his brother, nor give to Elohim (God) a ransom for him* (Psalm 49:7). *What shall a man give in exchange for his soul?* No man can — Psalm 49 already closed that door. Only the Son of Adam, poured out, can pay what no brother can.'),
  ('canon','mark',8,38,'canon','daniel',7,13, 'free', E'*one like the Son of Adam came with the clouds of heaven... and there was given him dominion, and glory, and a kingdom* (Daniel 7:13-14). *When he cometh in the glory of his Father* — the *kaph* preserved: he comes in the likeness, and the glory is GIVEN him by the Father. Suffering first (53), then the cloud-borne glory (Daniel 7).'),
  ('canon','mark',8,38,'canon','zechariah',14,5, 'free', E'*and Yahuah Elohai (the LORD my God) shall come, and all the saints with thee.* (Zechariah 14:5). *He cometh in the glory of his Father with the holy angels* — Zechariah''s day of Yahuah, the King coming with all his holy ones. The shame-or-glory hinge of v.38 turns on that coming.'),
  ('canon','mark',8,38,'enoch','1-enoch',48,2, 'extras', E'*at that hour that Son of Adam was named In the presence of Yahuah (God) of Spirits* (1 Enoch 48:2). The One who suffers is the One named before creation and revealed in glory — the same Son of Adam, the watchers'' book and Daniel and Isaiah converging on the one Formed Son.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _mk08_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _mk08_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- 3c. Threads ---------------------------------------------------------------
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'mark-8-the-blind-man-of-bethsaida-healed-in-stages-isaiah-35-isaiah-42',
       E'The blind man of Bethsaida, healed in stages — I see men as trees, walking (Isaiah 35; Isaiah 42)',
       E'At Bethsaida they bring a blind man and beg Yahusha (Jesus) to touch him. He does not heal at a distance — he takes the man *by the hand, and led him out of the town,* spits on his eyes, lays hands on him, and asks if he sees aught. The first answer is half-light: *I see men as trees, walking.* Then a second touch, and *he was restored, and saw every man clearly* (Mark 8:22-26). This is the only healing in the gospels given in two stages, and Isaiah had already written its meaning.\n\nIsaiah hung this very sign over the coming of Elohim (God): *Then the eyes of the blind shall be opened, and the ears of the deaf shall be unstopped.* (Isaiah 35:5). The opened eye is the credential of the One who comes to save — *behold, your Elohim (God) will come with vengeance... he will come and save you* (35:4). The healing is not a wonder for its own sake; it is the seal of the Servant''s arrival.\n\nAnd the manner of it — leading the blind man out by the hand, step before step — is Isaiah''s Servant to the letter: *And I will bring the blind by a way that they knew not; I will lead them in paths that they have not known: I will make darkness light before them, and crooked things straight.* (Isaiah 42:16). The Servant does not abandon the half-seeing; *I see men as trees, walking* is met not with rebuke but with a second touch. Isaiah''s own word to the half-blind stands over it: *Hear, ye deaf; and look, ye blind, that ye may see.* (Isaiah 42:18). Look — that ye may see fully.\n\nThe finishing is the homecoming. *And the ransomed of Yahuah (LORD) shall return, and come to Zion with songs and everlasting joy upon their heads... and sorrow and sighing shall flee away.* (Isaiah 35:10). Clear sight belongs to the great return of the ransomed. The man who saw men as trees and then saw clearly is the scattered eye of Yashar''el (Israel) brought home to see — the Servant leading the blind by a way they knew not, all the way to clear sight.',
       sv.verse_id, ev.verse_id, 'free', 13210
  FROM _mk08_lookup sv, _mk08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=8 AND sv.verse_number=22
   AND ev.edition_slug='canon' AND ev.book_slug='mark' AND ev.chapter_number=8 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'mark-8-thou-art-the-messiah-peters-confession-psalm-2-daniel-7-1-enoch-46-48',
       E'Whom say ye that I am? Thou art the Messiah — the Formed Son confessed (Psalm 2; Daniel 7; 1 Enoch 46, 48)',
       E'By the way to Caesarea Philippi he asks the question the whole library has been pressing toward: *But whom say ye that I am? And Peter answereth and saith unto him, Thou art the Messiah (Christ).* (Mark 8:29). Matthew preserves the fuller confession and its source: *Thou art the Messiah (Christ), the Son of the living Elohim (God). And Yahusha (Jesus) answered... flesh and blood hath not revealed it unto thee, but my Father which is in heaven* (Matthew 16:16-17). The confession is true, and the Father is the one who reveals it. That is the shape of everything: the Father is the source; the Son is the One the Father makes known.\n\nPsalm 2 had already drawn the Anointed: *The kings of the earth set themselves, and the rulers take counsel together, against Yahuah (LORD), and against his anointed* (Psalm 2:2). *Messiah* means exactly that — the Anointed of Yahuah, set against a raging world. And the same Psalm names him Son: *I will declare the decree: Yahuah (LORD) hath said unto me, Thou art my Son; this day have I begotten thee.* (Psalm 2:7). The Messiah is the begotten Son — the Formed Son who HAS a Father. He is not a second co-equal person, and he is not a made creature. The Father declares; the Son is begotten; the Son reveals the Father.\n\nDaniel saw him borne on the clouds: *behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days* (Daniel 7:13). The *kaph* stands — *one LIKE the Son of Adam* — he comes in the likeness of a son of Adam, having taken flesh, yet he is the cloud-rider, and to him *was given... dominion, and glory, and a kingdom* (7:14). Peter''s *Messiah* is Daniel''s cloud-borne One.\n\nEven the watchers'' book had named him. *This is the Son of Adam who hath righteousness... because Yahuah (God) of Spirits hath chosen him, and whose lot hath the pre-eminence before Yahuah (God) of Spirits* (1 Enoch 46:3) — the Son of Adam standing beside the Head of Days, chosen, pre-eminent, not co-equal but the Chosen of the Father of Spirits. And his naming runs before the world itself: *at that hour that Son of Adam was named In the presence of Yahuah (God) of Spirits, And his name before the Head of Days* (1 Enoch 48:2) — *before the sun and the signs were created* (48:3). The Son Peter confesses at Caesarea Philippi is the Son named before the foundation of the world. The whole library answers the one question with one voice.',
       sv.verse_id, ev.verse_id, 'extras', 13213
  FROM _mk08_lookup sv, _mk08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=8 AND sv.verse_number=27
   AND ev.edition_slug='canon' AND ev.book_slug='mark' AND ev.chapter_number=8 AND ev.verse_number=30
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'mark-8-the-son-of-adam-must-suffer-then-come-in-glory-isaiah-53-psalm-49-daniel-7-zechariah-14',
       E'The Son of Adam must suffer — then come in the glory of his Father (Isaiah 53; Psalm 49; Daniel 7; Zechariah 14)',
       E'The moment Peter confesses him, Yahusha (Jesus) tells them what the Messiah''s road is: *the Son of Adam must suffer many things, and be rejected of the elders, and of the chief priests, and scribes, and be killed, and after three days rise again* (Mark 8:31). Peter rebukes him for it, and is answered hard: *Get thee behind me, Satan: for thou savourest not the things that be of Elohim (God), but the things that be of men* (8:33). The *must* is not Peter''s to overturn. It was written.\n\nIt was written in Isaiah. *He is despised and rejected of men; a man of sorrows, and acquainted with grief* (Isaiah 53:3) — the rejection by elders and priests is the servant-song unfolding. And the suffering has a purpose Peter cannot yet see: *But he was wounded for our transgressions, he was bruised for our iniquities: the chastisement of our peace was upon him; and with his stripes we are healed.* (Isaiah 53:5). To refuse the cross is to refuse the healing.\n\nThen he turns to the crowd: *whosoever will save his life shall lose it... For what shall it profit a man, if he shall gain the whole world, and lose his own soul? Or what shall a man give in exchange for his soul?* (Mark 8:35-37). Psalm 49 had already shut that account: *None of them can by any means redeem his brother, nor give to Elohim (God) a ransom for him: (For the redemption of their soul is precious, and it ceaseth for ever:)* (Psalm 49:7-8). No man can buy back a soul. Only the Son of Adam, poured out, pays what no brother can.\n\nAnd suffering is not the end of him. *Whosoever therefore shall be ashamed of me and of my words... of him also shall the Son of Adam be ashamed, when he cometh in the glory of his Father with the holy angels* (Mark 8:38). Daniel saw that glory given: *one like the Son of Adam came with the clouds of heaven... and there was given him dominion, and glory, and a kingdom* (Daniel 7:13-14) — the *kaph* preserved, he comes in the likeness, and the glory is GIVEN him by the Father. Zechariah saw the coming itself: *and Yahuah Elohai (the LORD my God) shall come, and all the saints with thee.* (Zechariah 14:5) — the day of Yahuah, the King with all his holy ones. The One named before creation is the One who suffers and the One who comes in glory: *at that hour that Son of Adam was named In the presence of Yahuah (God) of Spirits* (1 Enoch 48:2). First the stripes of Isaiah 53, then the clouds of Daniel 7 — one Formed Son, one road, suffering then glory.',
       sv.verse_id, ev.verse_id, 'extras', 13216
  FROM _mk08_lookup sv, _mk08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=8 AND sv.verse_number=31
   AND ev.edition_slug='canon' AND ev.book_slug='mark' AND ev.chapter_number=8 AND ev.verse_number=38
ON CONFLICT (slug) DO NOTHING;

-- 3d. Thread members --------------------------------------------------------
-- Thread 1: blind man of Bethsaida
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 35:5 — *Then the eyes of the blind shall be opened* — the sign of Elohim (God) come to save.'
  FROM cross_reference_threads t, cross_references x, _mk08_lookup sv, _mk08_lookup tv
 WHERE t.slug='mark-8-the-blind-man-of-bethsaida-healed-in-stages-isaiah-35-isaiah-42'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=8 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=35 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 42:16 — *I will bring the blind by a way that they knew not* — led by the hand, step by step.'
  FROM cross_reference_threads t, cross_references x, _mk08_lookup sv, _mk08_lookup tv
 WHERE t.slug='mark-8-the-blind-man-of-bethsaida-healed-in-stages-isaiah-35-isaiah-42'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=8 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=42 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 42:18 — *look, ye blind, that ye may see* — the half-seeing called to see fully.'
  FROM cross_reference_threads t, cross_references x, _mk08_lookup sv, _mk08_lookup tv
 WHERE t.slug='mark-8-the-blind-man-of-bethsaida-healed-in-stages-isaiah-35-isaiah-42'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=8 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=42 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 35:10 — *the ransomed of Yahuah (LORD) shall return* — clear sight belongs to the great homecoming.'
  FROM cross_reference_threads t, cross_references x, _mk08_lookup sv, _mk08_lookup tv
 WHERE t.slug='mark-8-the-blind-man-of-bethsaida-healed-in-stages-isaiah-35-isaiah-42'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=8 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=35 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2: Peter's confession
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 2:2 — *against his anointed* — Messiah = the Anointed of Yahuah set against a raging world.'
  FROM cross_reference_threads t, cross_references x, _mk08_lookup sv, _mk08_lookup tv
 WHERE t.slug='mark-8-thou-art-the-messiah-peters-confession-psalm-2-daniel-7-1-enoch-46-48'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=8 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 2:7 — *Thou art my Son; this day have I begotten thee* — the begotten Formed Son who HAS a Father.'
  FROM cross_reference_threads t, cross_references x, _mk08_lookup sv, _mk08_lookup tv
 WHERE t.slug='mark-8-thou-art-the-messiah-peters-confession-psalm-2-daniel-7-1-enoch-46-48'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=8 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 7:13 — *one like the Son of Adam came with the clouds* — the kaph preserved; Peter''s Messiah is the cloud-rider.'
  FROM cross_reference_threads t, cross_references x, _mk08_lookup sv, _mk08_lookup tv
 WHERE t.slug='mark-8-thou-art-the-messiah-peters-confession-psalm-2-daniel-7-1-enoch-46-48'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=8 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 46:3 — *This is the Son of Adam who hath righteousness... chosen* — named beside the Head of Days, chosen not co-equal.'
  FROM cross_reference_threads t, cross_references x, _mk08_lookup sv, _mk08_lookup tv
 WHERE t.slug='mark-8-thou-art-the-messiah-peters-confession-psalm-2-daniel-7-1-enoch-46-48'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=8 AND sv.verse_number=29
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=46 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Enoch 48:2 — *that Son of Adam was named... before the Head of Days* — named before the world; the begotten Son confessed.'
  FROM cross_reference_threads t, cross_references x, _mk08_lookup sv, _mk08_lookup tv
 WHERE t.slug='mark-8-thou-art-the-messiah-peters-confession-psalm-2-daniel-7-1-enoch-46-48'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=8 AND sv.verse_number=29
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=48 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3: must suffer then come in glory
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 53:3 — *despised and rejected of men* — the rejection by elders and priests is the servant-song unfolding.'
  FROM cross_reference_threads t, cross_references x, _mk08_lookup sv, _mk08_lookup tv
 WHERE t.slug='mark-8-the-son-of-adam-must-suffer-then-come-in-glory-isaiah-53-psalm-49-daniel-7-zechariah-14'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=8 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 53:5 — *with his stripes we are healed* — to refuse the cross is to refuse the healing.'
  FROM cross_reference_threads t, cross_references x, _mk08_lookup sv, _mk08_lookup tv
 WHERE t.slug='mark-8-the-son-of-adam-must-suffer-then-come-in-glory-isaiah-53-psalm-49-daniel-7-zechariah-14'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=8 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 49:7 — *None... can... redeem his brother, nor give to Elohim (God) a ransom for him* — no man buys back a soul.'
  FROM cross_reference_threads t, cross_references x, _mk08_lookup sv, _mk08_lookup tv
 WHERE t.slug='mark-8-the-son-of-adam-must-suffer-then-come-in-glory-isaiah-53-psalm-49-daniel-7-zechariah-14'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=8 AND sv.verse_number=37
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=49 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Daniel 7:13 — *one like the Son of Adam came with the clouds* — the kaph preserved; the glory is GIVEN him by the Father.'
  FROM cross_reference_threads t, cross_references x, _mk08_lookup sv, _mk08_lookup tv
 WHERE t.slug='mark-8-the-son-of-adam-must-suffer-then-come-in-glory-isaiah-53-psalm-49-daniel-7-zechariah-14'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=8 AND sv.verse_number=38
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Zechariah 14:5 — *Yahuah Elohai (the LORD my God) shall come, and all the saints with thee* — the day of Yahuah, the King with all his holy ones.'
  FROM cross_reference_threads t, cross_references x, _mk08_lookup sv, _mk08_lookup tv
 WHERE t.slug='mark-8-the-son-of-adam-must-suffer-then-come-in-glory-isaiah-53-psalm-49-daniel-7-zechariah-14'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=8 AND sv.verse_number=38
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=14 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'1 Enoch 48:2 — *that Son of Adam was named... before the Head of Days* — the One who suffers is the One named before creation.'
  FROM cross_reference_threads t, cross_references x, _mk08_lookup sv, _mk08_lookup tv
 WHERE t.slug='mark-8-the-son-of-adam-must-suffer-then-come-in-glory-isaiah-53-psalm-49-daniel-7-zechariah-14'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=8 AND sv.verse_number=38
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=48 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_mark_10.sql -----
-- ============================================================================
-- minion_mark_10.sql  —  Mark 10 (THIN-ADD) full-library Come-and-See threads
-- 4 NEW threads. DEDUP: 10:18 and 10:21 are EXISTING — NOT re-anchored here.
-- Band base 13270, step +3.  All targets canon → tier 'free'.
-- ============================================================================

-- 3a. Temp view
CREATE TEMP VIEW _mk10_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1',
   'pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================================================================
-- 3b. cross_references rows
-- ============================================================================
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- Thread 1: 10:2-12 divorce / from the beginning male and female
  ('canon','mark',10,6,'canon','genesis',1,27, 'free', E'*So Elohim (God) created man in his own image, in the image of Elohim (God) created he him; male and female created he them.* (Genesis 1:27). Yahusha (Jesus) reaches past Moses'' bill of divorcement all the way back to the sixth day — male and female is the Maker''s own design, not a later concession.'),
  ('canon','mark',10,7,'canon','genesis',2,24, 'free', E'*Therefore shall a man leave his father and his mother, and shall cleave unto his wife: and they shall be one flesh.* (Genesis 2:24). He QUOTES the creation Torah word for word; the one-flesh joining is the ordinance he is upholding.'),
  ('canon','mark',10,4,'canon','deuteronomy',24,1, 'free', E'*When a man hath taken a wife, and married her... then let him write her a bill of divorcement, and give it in her hand, and send her out of his house.* (Deuteronomy 24:1). This is the precept the Pharisees lean on — given, Yahusha (Jesus) says, for the hardness of their heart, regulating a brokenness, never blessing it.'),
  ('canon','mark',10,5,'canon','deuteronomy',24,4, 'free', E'*Her former husband, which sent her away, may not take her again to be his wife, after that she is defiled; for that is abomination before Yahuah (LORD)...* (Deuteronomy 24:4). The Torah''s own divorce statute closes with abomination and a defiled land — Moses fenced the hardness in, he did not commend it.'),
  ('canon','mark',10,9,'canon','malachi',2,16, 'free', E'*For Yahuah (LORD), the Elohim (God) of Yashar''el (Israel), saith that he hateth putting away...* (Malachi 2:16). The last prophet says plainly what Yahusha (Jesus) seals: the Father HATES the tearing-apart of what he joined.'),

  -- Thread 2: 10:13-16 suffer the little children
  ('canon','mark',10,14,'canon','psalms',8,2, 'free', E'*Out of the mouth of babes and sucklings hast thou ordained strength because of thine enemies, that thou mightest still the enemy and the avenger.* (Psalm 8:2). The lowly child is where the Father lodges his strength — the disciples rebuke them; the King calls them his kingdom''s pattern.'),
  ('canon','mark',10,14,'canon','deuteronomy',1,39, 'free', E'*Moreover your little ones... and your children, which in that day had no knowledge between good and evil, they shall go in thither, and unto them will I give it...* (Deuteronomy 1:39). The little ones the unbelieving generation despised are the very ones given the inheritance — *of such is the kingdom of Elohim (God).*'),
  ('canon','mark',10,16,'canon','joel',2,16, 'free', E'*Gather the people, sanctify the congregation, assemble the elders, gather the children, and those that suck the breasts...* (Joel 2:16). When the Father gathers his people home, the nursing children are gathered with them — none too small for the assembly.'),

  -- Thread 3: 10:32-45 the cup / ransom for many
  ('canon','mark',10,45,'canon','isaiah',53,11, 'free', E'*He shall see of the travail of his soul, and shall be satisfied: by his knowledge shall my righteous servant justify many; for he shall bear their iniquities.* (Isaiah 53:11). The Son of Adam who came *to give his life a ransom for many* is Isaiah''s servant who bears the iniquities of the many — the same many, the same bearing.'),
  ('canon','mark',10,45,'canon','isaiah',53,12, 'free', E'*...because he hath poured out his soul unto death... and he bare the sin of many, and made intercession for the transgressors.* (Isaiah 53:12). *A ransom for many* is this verse breathing — the poured-out soul, the sin of the many borne.'),
  ('canon','mark',10,38,'canon','isaiah',51,17, 'free', E'*Awake, awake, stand up, O Jerusalem, which hast drunk at the hand of Yahuah (LORD) the cup of his fury; thou hast drunken the dregs of the cup of trembling...* (Isaiah 51:17). The cup James and John so readily ask to share is the cup of trembling — he drinks the dregs Jerusalem could not bear.'),
  ('canon','mark',10,38,'canon','isaiah',51,22, 'free', E'*...Behold, I have taken out of thine hand the cup of trembling, even the dregs of the cup of my fury; thou shalt no more drink it again.* (Isaiah 51:22). The Father takes the cup OUT of his people''s hand — and the Son takes it into his own. That is the ministry that makes him great.'),
  ('canon','mark',10,33,'canon','daniel',7,13, 'free', E'*I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days...* (Daniel 7:13). The *kaph* stands — *one like* the Son of Adam. The same figure given dominion is the one who first goes up to Jerusalem to be delivered, condemned, and to rise the third day.'),

  -- Thread 4: 10:46-52 blind Bartimaeus / thou Son of David
  ('canon','mark',10,51,'canon','isaiah',35,5, 'free', E'*Then the eyes of the blind shall be opened, and the ears of the deaf shall be unstopped.* (Isaiah 35:5). Bartimaeus receiving his sight is Isaiah''s sign of the age of restoration breaking in — the blind see when the Saviour passes by.'),
  ('canon','mark',10,52,'canon','psalms',146,8, 'free', E'*Yahuah (LORD) openeth the eyes of the blind: Yahuah (LORD) raiseth them that are bowed down: Yahuah (LORD) loveth the righteous.* (Psalm 146:8). What the psalm names as Yahuah''s own work — opening blind eyes — is done by the Formed Son in the road out of Jericho.'),
  ('canon','mark',10,47,'canon','2-samuel',7,12, 'free', E'*And when thy days be fulfilled... I will set up thy seed after thee, which shall proceed out of thy bowels, and I will establish his kingdom.* (2 Samuel 7:12). The blind man''s cry — *thou Son of David* — names the promised seed of David''s covenant; faith sees the King the crowd is hushing.'),
  ('canon','mark',10,47,'canon','2-samuel',7,13, 'free', E'*He shall build an house for my name, and I will stablish the throne of his kingdom for ever.* (2 Samuel 7:13). The everlasting throne promised to David''s seed is the One Bartimaeus calls upon by name — and his faith makes him whole.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _mk10_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _mk10_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================================================================
-- 3c. Threads
-- ============================================================================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'mark-10-from-the-beginning-male-and-female-divorce-and-the-creation-torah-genesis-1-2-deuteronomy-24-malachi-2',
       E'From the beginning, male and female — divorce and the creation Torah (Genesis 1-2; Deuteronomy 24; Malachi 2)',
       E'The Pharisees come tempting: *Is it lawful for a man to put away his wife?* (Mark 10:2). They expect a fight about Moses. Yahusha (Jesus) does not abolish the Torah — he reads it back to its foundation. *And he answered and said unto them, What did Moses command you? And they said, Moses suffered to write a bill of divorcement, and to put her away. And Yahusha (Jesus) answered and said unto them, For the hardness of your heart he wrote you this precept.* (Mark 10:3-5). The bill of divorcement was a concession to brokenness — *When a man hath taken a wife, and married her... then let him write her a bill of divorcement, and give it in her hand, and send her out of his house.* (Deuteronomy 24:1) — and even that statute closes in warning: *Her former husband, which sent her away, may not take her again to be his wife, after that she is defiled; for that is abomination before Yahuah (LORD): and thou shalt not cause the land to sin...* (Deuteronomy 24:4). Moses fenced the hardness in; he never blessed it.\n\nThen Yahusha (Jesus) reaches past Moses all the way to the sixth day: *But from the beginning of the creation Elohim (God) made them male and female.* (Mark 10:6) — *So Elohim (God) created man in his own image, in the image of Elohim (God) created he him; male and female created he them.* (Genesis 1:27). And he quotes the creation ordinance word for word: *For this cause shall a man leave his father and mother, and cleave to his wife; And they twain shall be one flesh...* (Mark 10:7-8) — *Therefore shall a man leave his father and his mother, and shall cleave unto his wife: and they shall be one flesh.* (Genesis 2:24). Marriage is not a Mosaic ordinance to be negotiated; it is the Maker''s own design, written into mankind before there was a tablet of stone.\n\nSo the seal: *What therefore Elohim (God) hath joined together, let not man put asunder.* (Mark 10:9). The last of the prophets had already said it plainly: *For Yahuah (LORD), the Elohim (God) of Yashar''el (Israel), saith that he hateth putting away...* (Malachi 2:16). The Father hates the tearing-apart of the one flesh he joined. Far from loosening the Torah, Yahusha (Jesus) tightens it back to its root: the permission was for hardness of heart, but the creation order stands.',
       sv.verse_id, ev.verse_id, 'free', 13270
  FROM _mk10_lookup sv, _mk10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=10 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='mark' AND ev.chapter_number=10 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'mark-10-suffer-the-little-children-of-such-is-the-kingdom-psalm-8-deuteronomy-1-joel-2',
       E'Suffer the little children — of such is the kingdom (Psalm 8; Deuteronomy 1; Joel 2)',
       E'*And they brought young children to him, that he should touch them: and his disciples rebuked those that brought them.* (Mark 10:13). The disciples count the children as an interruption. The King counts them as the pattern: *But when Yahusha (Jesus) saw it, he was much displeased, and said unto them, Suffer the little children to come unto me, and forbid them not: for of such is the kingdom of Elohim (God).* (Mark 10:14).\n\nThis is the Father''s long habit. *Out of the mouth of babes and sucklings hast thou ordained strength because of thine enemies, that thou mightest still the enemy and the avenger.* (Psalm 8:2) — it is in the smallest and weakest that he lodges his strength and silences the proud. When the unbelieving generation despised their own little ones as a prey lost in the wilderness, the Father answered: *Moreover your little ones... and your children, which in that day had no knowledge between good and evil, they shall go in thither, and unto them will I give it, and they shall possess it.* (Deuteronomy 1:39). The very ones written off inherit the land.\n\nAnd when the prophet calls all Yashar''el (Israel) home, the children are gathered with them — none too small for the assembly: *Gather the people, sanctify the congregation, assemble the elders, gather the children, and those that suck the breasts...* (Joel 2:16). So the Son takes them up: *And he took them up in his arms, put his hands upon them, and blessed them.* (Mark 10:16). *Whosoever shall not receive the kingdom of Elohim (God) as a little child, he shall not enter therein.* (Mark 10:15) — the kingdom is received, not earned; come empty-handed and small, as a child comes.',
       sv.verse_id, ev.verse_id, 'free', 13273
  FROM _mk10_lookup sv, _mk10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=10 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='mark' AND ev.chapter_number=10 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'mark-10-the-cup-and-the-ransom-for-many-the-suffering-servant-isaiah-53-isaiah-51-daniel-7',
       E'The cup and the ransom for many — the suffering servant (Isaiah 53; Isaiah 51; Daniel 7)',
       E'On the road up to Jerusalem the Son of Adam tells the twelve plainly what awaits: *Behold, we go up to Jerusalem; and the Son of Adam shall be delivered unto the chief priests, and unto the scribes; and they shall condemn him to death... and the third day he shall rise again.* (Mark 10:33-34). This is Daniel''s figure walking toward his cross — *I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days...* (Daniel 7:13). The *kaph* stands: *one like* the Son of Adam. The same one who receives the everlasting dominion is the one who first goes down into death.\n\nJames and John ask for the thrones at his right and left. He answers with a cup: *can ye drink of the cup that I drink of?* (Mark 10:38). It is the cup of trembling — *Awake, awake, stand up, O Jerusalem, which hast drunk at the hand of Yahuah (LORD) the cup of his fury; thou hast drunken the dregs of the cup of trembling...* (Isaiah 51:17). And the mercy of it: *Behold, I have taken out of thine hand the cup of trembling, even the dregs of the cup of my fury; thou shalt no more drink it again.* (Isaiah 51:22). The Father takes the cup out of his people''s hand — and the Son takes it into his own.\n\nSo greatness is turned upside down: *whosoever will be great among you, shall be your minister... For even the Son of Adam came not to be ministered unto, but to minister, and to give his life a ransom for many.* (Mark 10:43-45). That ransom is Isaiah''s servant breathing: *by his knowledge shall my righteous servant justify many; for he shall bear their iniquities.* (Isaiah 53:11) — *because he hath poured out his soul unto death... and he bare the sin of many, and made intercession for the transgressors.* (Isaiah 53:12). *A ransom for many* is not a new idea; it is the suffering servant of Isaiah 53, the poured-out soul bearing the sin of the many, come at last to drink the cup.',
       sv.verse_id, ev.verse_id, 'free', 13276
  FROM _mk10_lookup sv, _mk10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=10 AND sv.verse_number=32
   AND ev.edition_slug='canon' AND ev.book_slug='mark' AND ev.chapter_number=10 AND ev.verse_number=45
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'mark-10-blind-bartimaeus-thou-son-of-david-have-mercy-isaiah-35-psalm-146-2-samuel-7',
       E'Blind Bartimaeus — thou Son of David, have mercy (Isaiah 35; Psalm 146; 2 Samuel 7)',
       E'A blind beggar sits by the highway out of Jericho, and when he hears who is passing he will not be hushed: *Thou Son of David, have mercy on me.* (Mark 10:47-48). The crowd charges him to hold his peace; faith cries the louder. He names the One the crowd cannot silence — *Son of David* — the promised seed of the covenant: *I will set up thy seed after thee, which shall proceed out of thy bowels, and I will establish his kingdom.* (2 Samuel 7:12) — *He shall build an house for my name, and I will stablish the throne of his kingdom for ever.* (2 Samuel 7:13). The everlasting throne promised to David is the very One standing still in the road for a beggar.\n\nAnd the sight he begs for is the sign of the age of restoration breaking in: *Then the eyes of the blind shall be opened, and the ears of the deaf shall be unstopped.* (Isaiah 35:5). What Isaiah set as the mark of the coming kingdom is done in a moment when the Son passes by. More than that — it is Yahuah''s own work, now wrought by the Formed Son: *Yahuah (LORD) openeth the eyes of the blind: Yahuah (LORD) raiseth them that are bowed down: Yahuah (LORD) loveth the righteous.* (Psalm 146:8).\n\nSo the word that heals him: *Go thy way; thy faith hath made thee whole. And immediately he received his sight, and followed Yahusha (Jesus) in the way.* (Mark 10:52). The blind man saw the King before the crowd did — and once his eyes were opened, he followed.',
       sv.verse_id, ev.verse_id, 'free', 13279
  FROM _mk10_lookup sv, _mk10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=10 AND sv.verse_number=46
   AND ev.edition_slug='canon' AND ev.book_slug='mark' AND ev.chapter_number=10 AND ev.verse_number=52
ON CONFLICT (slug) DO NOTHING;

-- ============================================================================
-- 3d. Thread members
-- ============================================================================
-- Thread 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:27 — *male and female created he them* — the creation design Yahusha (Jesus) appeals back to.'
  FROM cross_reference_threads t, cross_references x, _mk10_lookup sv, _mk10_lookup tv
 WHERE t.slug='mark-10-from-the-beginning-male-and-female-divorce-and-the-creation-torah-genesis-1-2-deuteronomy-24-malachi-2'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=10 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 2:24 — *they shall be one flesh* — quoted word for word; the one-flesh ordinance upheld.'
  FROM cross_reference_threads t, cross_references x, _mk10_lookup sv, _mk10_lookup tv
 WHERE t.slug='mark-10-from-the-beginning-male-and-female-divorce-and-the-creation-torah-genesis-1-2-deuteronomy-24-malachi-2'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=10 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 24:1 — the bill of divorcement, the precept given for hardness of heart.'
  FROM cross_reference_threads t, cross_references x, _mk10_lookup sv, _mk10_lookup tv
 WHERE t.slug='mark-10-from-the-beginning-male-and-female-divorce-and-the-creation-torah-genesis-1-2-deuteronomy-24-malachi-2'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=10 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=24 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Deuteronomy 24:4 — the statute closes in abomination; Moses fenced the hardness in, never blessed it.'
  FROM cross_reference_threads t, cross_references x, _mk10_lookup sv, _mk10_lookup tv
 WHERE t.slug='mark-10-from-the-beginning-male-and-female-divorce-and-the-creation-torah-genesis-1-2-deuteronomy-24-malachi-2'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=10 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=24 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Malachi 2:16 — *he hateth putting away* — the prophet says what Yahusha (Jesus) seals.'
  FROM cross_reference_threads t, cross_references x, _mk10_lookup sv, _mk10_lookup tv
 WHERE t.slug='mark-10-from-the-beginning-male-and-female-divorce-and-the-creation-torah-genesis-1-2-deuteronomy-24-malachi-2'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=10 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=2 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 8:2 — *out of the mouth of babes... ordained strength* — the Father lodges strength in the small.'
  FROM cross_reference_threads t, cross_references x, _mk10_lookup sv, _mk10_lookup tv
 WHERE t.slug='mark-10-suffer-the-little-children-of-such-is-the-kingdom-psalm-8-deuteronomy-1-joel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=10 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=8 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 1:39 — the little ones the generation despised inherit the land.'
  FROM cross_reference_threads t, cross_references x, _mk10_lookup sv, _mk10_lookup tv
 WHERE t.slug='mark-10-suffer-the-little-children-of-such-is-the-kingdom-psalm-8-deuteronomy-1-joel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=10 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=1 AND tv.verse_number=39
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Joel 2:16 — when Yashar''el (Israel) is gathered home, the nursing children are gathered too.'
  FROM cross_reference_threads t, cross_references x, _mk10_lookup sv, _mk10_lookup tv
 WHERE t.slug='mark-10-suffer-the-little-children-of-such-is-the-kingdom-psalm-8-deuteronomy-1-joel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=10 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 53:11 — *by his knowledge shall my righteous servant justify many; for he shall bear their iniquities.*'
  FROM cross_reference_threads t, cross_references x, _mk10_lookup sv, _mk10_lookup tv
 WHERE t.slug='mark-10-the-cup-and-the-ransom-for-many-the-suffering-servant-isaiah-53-isaiah-51-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=10 AND sv.verse_number=45
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 53:12 — *he bare the sin of many* — the ransom-for-many is this servant breathing.'
  FROM cross_reference_threads t, cross_references x, _mk10_lookup sv, _mk10_lookup tv
 WHERE t.slug='mark-10-the-cup-and-the-ransom-for-many-the-suffering-servant-isaiah-53-isaiah-51-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=10 AND sv.verse_number=45
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 51:17 — the cup of trembling Jerusalem drank; the cup the Son asks if they can share.'
  FROM cross_reference_threads t, cross_references x, _mk10_lookup sv, _mk10_lookup tv
 WHERE t.slug='mark-10-the-cup-and-the-ransom-for-many-the-suffering-servant-isaiah-53-isaiah-51-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=10 AND sv.verse_number=38
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=51 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 51:22 — the Father takes the cup of trembling out of his people''s hand; the Son takes it into his own.'
  FROM cross_reference_threads t, cross_references x, _mk10_lookup sv, _mk10_lookup tv
 WHERE t.slug='mark-10-the-cup-and-the-ransom-for-many-the-suffering-servant-isaiah-53-isaiah-51-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=10 AND sv.verse_number=38
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=51 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Daniel 7:13 — *one like the Son of Adam* (kaph preserved) — the dominion-figure walking first toward death.'
  FROM cross_reference_threads t, cross_references x, _mk10_lookup sv, _mk10_lookup tv
 WHERE t.slug='mark-10-the-cup-and-the-ransom-for-many-the-suffering-servant-isaiah-53-isaiah-51-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=10 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 35:5 — *the eyes of the blind shall be opened* — the restoration sign done in the road.'
  FROM cross_reference_threads t, cross_references x, _mk10_lookup sv, _mk10_lookup tv
 WHERE t.slug='mark-10-blind-bartimaeus-thou-son-of-david-have-mercy-isaiah-35-psalm-146-2-samuel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=10 AND sv.verse_number=51
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=35 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 146:8 — *Yahuah openeth the eyes of the blind* — Yahuah''s own work wrought by the Formed Son.'
  FROM cross_reference_threads t, cross_references x, _mk10_lookup sv, _mk10_lookup tv
 WHERE t.slug='mark-10-blind-bartimaeus-thou-son-of-david-have-mercy-isaiah-35-psalm-146-2-samuel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=10 AND sv.verse_number=52
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=146 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Samuel 7:12 — *I will set up thy seed after thee* — the Son of David Bartimaeus calls upon.'
  FROM cross_reference_threads t, cross_references x, _mk10_lookup sv, _mk10_lookup tv
 WHERE t.slug='mark-10-blind-bartimaeus-thou-son-of-david-have-mercy-isaiah-35-psalm-146-2-samuel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=10 AND sv.verse_number=47
   AND tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Samuel 7:13 — *the throne of his kingdom for ever* — the everlasting throne of David''s seed.'
  FROM cross_reference_threads t, cross_references x, _mk10_lookup sv, _mk10_lookup tv
 WHERE t.slug='mark-10-blind-bartimaeus-thou-son-of-david-have-mercy-isaiah-35-psalm-146-2-samuel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=10 AND sv.verse_number=47
   AND tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_mark_15.sql -----
-- ============================================================================
-- minion_mark_15.sql  —  Mark 15 (the crucifixion) — NT DEPTH pass, THIN-ADD
-- 4 NEW threads. DEDUP: 15:6 (Barabbas) and 15:35 (Eloi/Elijah) NOT re-anchored.
-- All targets are canon (Tanakh + NT) → every member tier 'free'; threads 'free'.
-- sort_order band base 13420, step +3.
-- ============================================================================

-- 3a. Temp lookup view ------------------------------------------------------
CREATE TEMP VIEW _mk15_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1',
   'pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- 3b. cross_references rows -------------------------------------------------
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- Thread 1: 15:16-20 crown of thorns / spitting / smiting (anchor 15:17)
  ('canon','mark',15,17,'canon','isaiah',50,6, 'free', E'*I gave my back to the smiters, and my cheeks to them that plucked off the hair: I hid not my face from shame and spitting.* (Isaiah 50:6). The servant of Yahuah (LORD) foretold the very scene — the smiting, the shame, the spitting — centuries before the soldiers platted the crown.'),
  ('canon','mark',15,17,'canon','isaiah',53,3, 'free', E'*He is despised and rejected of men; a man of sorrows, and acquainted with grief: and we hid as it were our faces from him; he was despised, and we esteemed him not.* (Isaiah 53:3). The mock-coronation in the Praetorium is the despising Isaiah saw.'),
  ('canon','mark',15,17,'canon','psalms',22,6, 'free', E'*But I am a worm, and no man; a reproach of men, and despised of the people. All they that see me laugh me to scorn: they shoot out the lip, they shake the head, saying,* (Psalm 22:6-7). The reproach and the scorn of the psalm are enacted as the band bows in mockery.'),
  ('canon','mark',15,17,'canon','genesis',3,18, 'free', E'*Thorns also and thistles shall it bring forth to thee; and thou shalt eat the herb of the field;* (Genesis 3:18). The thorn is the sign of the curse that came on the ground for Adam''s sake; the Formed Son wears the curse of the sons of Adam upon his own head.'),

  -- Thread 2: 15:21-32 parted garments / cast lots / mocked (anchor 15:24)
  ('canon','mark',15,24,'canon','psalms',22,18, 'free', E'*They part my garments among them, and cast lots upon my vesture.* (Psalm 22:18). The soldiers do not know they are reading from the psalm; the lot falls exactly where David wrote it would.'),
  ('canon','mark',15,24,'canon','psalms',22,7, 'free', E'*All they that see me laugh me to scorn: they shoot out the lip, they shake the head, saying, He trusted on Yahuah (LORD) that he would deliver him: let him deliver him, seeing he delighted in him.* (Psalm 22:7-8). The chief priests'' taunt — *He saved others; himself he cannot save* — is the psalm''s mocking quoted back at the cross.'),
  ('canon','mark',15,24,'canon','isaiah',53,12, 'free', E'*Therefore will I divide him a portion with the great, and he shall divide the spoil with the strong; because he hath poured out his soul unto death: and he was numbered with the transgressors; and he bare the sin of many, and made intercession for the transgressors.* (Isaiah 53:12). Crucified between two thieves, he is *numbered with the transgressors* exactly as the servant-song said.'),
  ('canon','mark',15,24,'canon','lamentations',1,12, 'free', E'*Is it nothing to you, all ye that pass by? behold, and see if there be any sorrow like unto my sorrow, which is done unto me, wherewith Yahuah (LORD) hath afflicted me in the day of his fierce anger.* (Lamentations 1:12). They that passed by railed on him, wagging their heads — the mourning of the city''s sorrow gathered up into the suffering of the One.'),

  -- Thread 3: 15:33-39 darkness / veil rent / centurion (anchor 15:33-39 span -> 15:38)
  ('canon','mark',15,38,'canon','amos',8,9, 'free', E'*And it shall come to pass in that day, saith Adonai Yahuah (the Lord GOD), that I will cause the sun to go down at noon, and I will darken the earth in the clear day:* (Amos 8:9). At the sixth hour darkness covers the whole land until the ninth — the noonday darkness of Yahuah''s (LORD) judgment-day fell on the day the Son was lifted up.'),
  ('canon','mark',15,38,'canon','exodus',26,33, 'free', E'*And thou shalt hang up the vail under the taches, that thou mayest bring in thither within the vail the ark of the testimony: and the vail shall divide unto you between the holy place and the most holy.* (Exodus 26:33). The veil that *divided* between the holy and the most holy is the very veil rent in twain from the top to the bottom.'),
  ('canon','mark',15,38,'canon','hebrews',10,20, 'free', E'*By a new and living way, which he hath consecrated for us, through the veil, that is to say, his flesh;* (Hebrews 10:20). The rending of the veil is the opening of the new and living way — the veil is his flesh, torn so the way into the holiest stands open.'),
  ('canon','mark',15,38,'canon','psalms',22,1, 'free', E'*My Elohim (God), my Elohim (God), why hast thou forsaken me? why art thou so far from helping me, and from the words of my roaring?* (Psalm 22:1). The cry that opened the psalm is the cry he uttered in the darkness; and the centurion, hearing him so cry out and give up the ghost, confessed *Truly this man was the Son of Elohim (God)* — the Formed Son, who reveals the invisible Father, owned at the cross by a stranger of the nations.'),

  -- Thread 4: 15:42-47 honourable burial (anchor 15:46)
  ('canon','mark',15,46,'canon','isaiah',53,9, 'free', E'*And he made his grave with the wicked, and with the rich in his death; because he had done no violence, neither was any deceit in his mouth.* (Isaiah 53:9). Joseph of Arimathaea, an honourable counsellor, lays him in his own new tomb — *with the rich in his death* — precisely as Isaiah foretold of the One who had done no violence.'),
  ('canon','mark',15,46,'canon','deuteronomy',21,23, 'free', E'*His body shall not remain all night upon the tree, but thou shalt in any wise bury him that day; (for he that is hanged is accursed of Elohim (God);) that thy land be not defiled, which Yahuah Elohayka (the LORD thy God) giveth thee for an inheritance.* (Deuteronomy 21:23). The body is taken down and buried that same day, as the Torah commands — and *he that is hanged is accursed* names the curse he bore for his people.'),
  ('canon','mark',15,46,'canon','psalms',22,15, 'free', E'*My strength is dried up like a potsherd; and my tongue cleaveth to my jaws; and thou hast brought me into the dust of death.* (Psalm 22:15). *Thou hast brought me into the dust of death* — the psalm follows him down into the sepulchre hewn out of the rock.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _mk15_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _mk15_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- 3c. Threads ---------------------------------------------------------------
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'mark-15-crown-of-thorns-and-the-spitting-the-smitten-servant-isaiah-50-psalm-22',
       E'The crown of thorns and the spitting — the smitten servant (Isaiah 50; Psalm 22; Genesis 3)',
       E'They clothed him with purple, platted a crown of thorns, smote him on the head with a reed, and did spit upon him. *And they clothed him with purple, and platted a crown of thorns, and put it about his head, ... And they smote him on the head with a reed, and did spit upon him, and bowing their knees worshipped him.* (Mark 15:17-19). Read this beside the servant of Yahuah (LORD): *I gave my back to the smiters, and my cheeks to them that plucked off the hair: I hid not my face from shame and spitting.* (Isaiah 50:6). The smiting, the shame, the spitting — Isaiah wrote the scene centuries before the soldiers acted it. And he is the One *despised and rejected of men; a man of sorrows, and acquainted with grief... he was despised, and we esteemed him not.* (Isaiah 53:3). The psalm of the cross had already put the words in the mockers'' mouths: *But I am a worm, and no man; a reproach of men, and despised of the people. All they that see me laugh me to scorn: they shoot out the lip, they shake the head* (Psalm 22:6-7). And the very crown is a sermon: *Thorns also and thistles shall it bring forth to thee* (Genesis 3:18) — the thorn is the sign of the curse that came on the ground for Adam''s sake, and the Formed Son, the Son of Adam, wears the curse of the sons of Adam pressed down upon his own head. The library is one, and it ain''t new: the suffering servant mocked, the curse borne, all written long before.',
       sv.verse_id, ev.verse_id, 'free', 13420
  FROM _mk15_lookup sv, _mk15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=15 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='mark' AND ev.chapter_number=15 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'mark-15-they-parted-his-garments-and-cast-lots-psalm-22-enacted-at-the-cross',
       E'They parted his garments, casting lots — Psalm 22 enacted at the cross (Psalm 22; Isaiah 53; Lamentations 1)',
       E'*And when they had crucified him, they parted his garments, casting lots upon them, what every man should take.* (Mark 15:24). The soldiers gambling at the foot of the cross have no idea they are reading aloud from a thousand-year-old psalm: *They part my garments among them, and cast lots upon my vesture.* (Psalm 22:18). The lot falls exactly where David wrote it would. The same psalm scripts the taunt of the rulers — *He saved others; himself he cannot save* — for David had already written it: *All they that see me laugh me to scorn: they shoot out the lip, they shake the head, saying, He trusted on Yahuah (LORD) that he would deliver him: let him deliver him, seeing he delighted in him.* (Psalm 22:7-8). Crucified between two thieves, he is reckoned among the lawless, as Isaiah said of the servant: *he was numbered with the transgressors; and he bare the sin of many, and made intercession for the transgressors.* (Isaiah 53:12). And the mourning cry of the desolate city is gathered up into the sorrow of the One they that passed by railed on, wagging their heads: *Is it nothing to you, all ye that pass by? behold, and see if there be any sorrow like unto my sorrow* (Lamentations 1:12). Psalm 22 is not predicting a far-off thing; it is being lived out, verse by verse, at Golgotha.',
       sv.verse_id, ev.verse_id, 'free', 13423
  FROM _mk15_lookup sv, _mk15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=15 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='mark' AND ev.chapter_number=15 AND ev.verse_number=32
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'mark-15-darkness-at-noon-the-veil-rent-and-the-centurions-confession-amos-8-exodus-26',
       E'Darkness at noon, the veil rent, and the centurion''s confession (Amos 8; Exodus 26; Hebrews 10; Psalm 22)',
       E'*And when the sixth hour was come, there was darkness over the whole land until the ninth hour.* ... *And the veil of the temple was rent in twain from the top to the bottom.* (Mark 15:33,38). The noonday darkness is the judgment-day Amos saw: *And it shall come to pass in that day, saith Adonai Yahuah (the Lord GOD), that I will cause the sun to go down at noon, and I will darken the earth in the clear day* (Amos 8:9). The veil that tore was no ordinary curtain — it was the one the Torah set to *divide unto you between the holy place and the most holy*: *And thou shalt hang up the vail under the taches, that thou mayest bring in thither within the vail the ark of the testimony: and the vail shall divide unto you between the holy place and the most holy.* (Exodus 26:33). Its rending opens the new and living way: *By a new and living way, which he hath consecrated for us, through the veil, that is to say, his flesh* (Hebrews 10:20) — the veil is his flesh, torn so the way into the holiest stands open. And in the darkness he cries the opening words of the psalm of the cross, *My Elohim (God), my Elohim (God), why hast thou forsaken me?* (Psalm 22:1); hearing him so cry out and give up the ghost, a Roman centurion — a stranger of the nations — confessed, *Truly this man was the Son of Elohim (God)* (Mark 15:39). This is the Formed Son owned at the cross: not a co-equal second person of a trinity, but the begotten Son who reveals the invisible Father and does his will, declared to be the Father''s own by the mouth of a Gentile soldier the moment the veil came down.',
       sv.verse_id, ev.verse_id, 'free', 13426
  FROM _mk15_lookup sv, _mk15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=15 AND sv.verse_number=33
   AND ev.edition_slug='canon' AND ev.book_slug='mark' AND ev.chapter_number=15 AND ev.verse_number=39
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'mark-15-the-honourable-burial-with-the-rich-in-his-death-isaiah-53-deuteronomy-21',
       E'The honourable burial — with the rich in his death (Isaiah 53; Deuteronomy 21; Psalm 22)',
       E'*And he bought fine linen, and took him down, and wrapped him in the linen, and laid him in a sepulchre which was hewn out of a rock, and rolled a stone unto the door of the sepulchre.* (Mark 15:46). Joseph of Arimathaea, *an honourable counsellor, which also waited for the kingdom of Elohim (God)*, begs the body and lays it in his own new tomb — and Isaiah had already named both the wicked of his death and the rich of his grave: *And he made his grave with the wicked, and with the rich in his death; because he had done no violence, neither was any deceit in his mouth.* (Isaiah 53:9). The Torah itself required the burial that same day: *His body shall not remain all night upon the tree, but thou shalt in any wise bury him that day; (for he that is hanged is accursed of Elohim (God);) that thy land be not defiled* (Deuteronomy 21:23) — and that very accursedness names the curse the sinless One bore in his people''s place. The psalm of the cross follows him all the way down: *thou hast brought me into the dust of death* (Psalm 22:15). He is laid honourably in the rock, the prophets satisfied to the last detail — the library is one, and the grave is not the end of the song, for the same psalm rises to *All the ends of the world shall remember and turn unto Yahuah (LORD)* (Psalm 22:27).',
       sv.verse_id, ev.verse_id, 'free', 13429
  FROM _mk15_lookup sv, _mk15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=15 AND sv.verse_number=42
   AND ev.edition_slug='canon' AND ev.book_slug='mark' AND ev.chapter_number=15 AND ev.verse_number=47
ON CONFLICT (slug) DO NOTHING;

-- 3d. Thread members --------------------------------------------------------
-- Thread 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 50:6 — *I gave my back to the smiters... I hid not my face from shame and spitting* — the servant''s scene, written before it happened.'
  FROM cross_reference_threads t, cross_references x, _mk15_lookup sv, _mk15_lookup tv
 WHERE t.slug='mark-15-crown-of-thorns-and-the-spitting-the-smitten-servant-isaiah-50-psalm-22'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=15 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=50 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 53:3 — *despised and rejected of men; a man of sorrows* — the despising in the Praetorium.'
  FROM cross_reference_threads t, cross_references x, _mk15_lookup sv, _mk15_lookup tv
 WHERE t.slug='mark-15-crown-of-thorns-and-the-spitting-the-smitten-servant-isaiah-50-psalm-22'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=15 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 22:6-7 — *a reproach of men... they shoot out the lip, they shake the head* — the mock-coronation foretold.'
  FROM cross_reference_threads t, cross_references x, _mk15_lookup sv, _mk15_lookup tv
 WHERE t.slug='mark-15-crown-of-thorns-and-the-spitting-the-smitten-servant-isaiah-50-psalm-22'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=15 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=22 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 3:18 — *Thorns also and thistles shall it bring forth* — the curse of the ground worn on the head of the Son of Adam.'
  FROM cross_reference_threads t, cross_references x, _mk15_lookup sv, _mk15_lookup tv
 WHERE t.slug='mark-15-crown-of-thorns-and-the-spitting-the-smitten-servant-isaiah-50-psalm-22'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=15 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 22:18 — *They part my garments among them, and cast lots upon my vesture* — the lot falls where David wrote it.'
  FROM cross_reference_threads t, cross_references x, _mk15_lookup sv, _mk15_lookup tv
 WHERE t.slug='mark-15-they-parted-his-garments-and-cast-lots-psalm-22-enacted-at-the-cross'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=15 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=22 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 22:7-8 — *let him deliver him, seeing he delighted in him* — the rulers'' taunt quoted from the psalm.'
  FROM cross_reference_threads t, cross_references x, _mk15_lookup sv, _mk15_lookup tv
 WHERE t.slug='mark-15-they-parted-his-garments-and-cast-lots-psalm-22-enacted-at-the-cross'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=15 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=22 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 53:12 — *he was numbered with the transgressors* — crucified between two thieves.'
  FROM cross_reference_threads t, cross_references x, _mk15_lookup sv, _mk15_lookup tv
 WHERE t.slug='mark-15-they-parted-his-garments-and-cast-lots-psalm-22-enacted-at-the-cross'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=15 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Lamentations 1:12 — *Is it nothing to you, all ye that pass by?* — the city''s sorrow gathered into the One''s suffering.'
  FROM cross_reference_threads t, cross_references x, _mk15_lookup sv, _mk15_lookup tv
 WHERE t.slug='mark-15-they-parted-his-garments-and-cast-lots-psalm-22-enacted-at-the-cross'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=15 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=1 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Amos 8:9 — *I will cause the sun to go down at noon* — the noonday darkness of the judgment-day.'
  FROM cross_reference_threads t, cross_references x, _mk15_lookup sv, _mk15_lookup tv
 WHERE t.slug='mark-15-darkness-at-noon-the-veil-rent-and-the-centurions-confession-amos-8-exodus-26'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=15 AND sv.verse_number=38
   AND tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=8 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 26:33 — *the vail shall divide unto you between the holy place and the most holy* — the very veil that was rent.'
  FROM cross_reference_threads t, cross_references x, _mk15_lookup sv, _mk15_lookup tv
 WHERE t.slug='mark-15-darkness-at-noon-the-veil-rent-and-the-centurions-confession-amos-8-exodus-26'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=15 AND sv.verse_number=38
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=26 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 10:20 — *through the veil, that is to say, his flesh* — the rent veil opens the new and living way.'
  FROM cross_reference_threads t, cross_references x, _mk15_lookup sv, _mk15_lookup tv
 WHERE t.slug='mark-15-darkness-at-noon-the-veil-rent-and-the-centurions-confession-amos-8-exodus-26'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=15 AND sv.verse_number=38
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=10 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 22:1 — *My Elohim (God), my Elohim (God), why hast thou forsaken me?* — the cry in the darkness, and the centurion confesses the Formed Son.'
  FROM cross_reference_threads t, cross_references x, _mk15_lookup sv, _mk15_lookup tv
 WHERE t.slug='mark-15-darkness-at-noon-the-veil-rent-and-the-centurions-confession-amos-8-exodus-26'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=15 AND sv.verse_number=38
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=22 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 53:9 — *with the rich in his death* — the honourable tomb of Joseph foretold.'
  FROM cross_reference_threads t, cross_references x, _mk15_lookup sv, _mk15_lookup tv
 WHERE t.slug='mark-15-the-honourable-burial-with-the-rich-in-his-death-isaiah-53-deuteronomy-21'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=15 AND sv.verse_number=46
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 21:23 — *thou shalt in any wise bury him that day; (for he that is hanged is accursed of Elohim (God))* — the Torah burial-law, and the curse he bore.'
  FROM cross_reference_threads t, cross_references x, _mk15_lookup sv, _mk15_lookup tv
 WHERE t.slug='mark-15-the-honourable-burial-with-the-rich-in-his-death-isaiah-53-deuteronomy-21'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=15 AND sv.verse_number=46
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=21 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 22:15 — *thou hast brought me into the dust of death* — the psalm follows him into the rock-hewn sepulchre.'
  FROM cross_reference_threads t, cross_references x, _mk15_lookup sv, _mk15_lookup tv
 WHERE t.slug='mark-15-the-honourable-burial-with-the-rich-in-his-death-isaiah-53-deuteronomy-21'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=15 AND sv.verse_number=46
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=22 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session260 — Mark thins (depth) cross-references complete.'
