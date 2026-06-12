-- ----- fragment: minion_2maccabees_11.sql (session253 2-maccabees 11) -----
-- Source anchor: apocrypha/2-maccabees ch11. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2mac11 (view _session253_2mac11_lookup). Sort band base 62250, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2mac11_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-maccabees-11-good-angel-deliver
  ('apocrypha', '2-maccabees', 11, 6, 'canon', 'exodus', 23, 20, 'free', E'Exodus 23:20 — *Behold, I send an Angel before thee, to keep thee in the way, and to bring thee into the place which I have prepared.* The good angel the Maccabees beg for in 2-maccabees 11:6 is the very Angel Yahuah pledged to send before His covenant people.'),
  ('apocrypha', '2-maccabees', 11, 6, 'canon', 'exodus', 23, 22, 'free', E'Exodus 23:22 — *But if thou shalt indeed obey his voice, and do all that I speak; then I will be an enemy unto thine enemies, and an adversary unto thine adversaries.* The condition of that heavenly help is covenant obedience — the very Torah-faithfulness for which the men of 2-maccabees 11:6 are fighting.'),
  -- thread: 2-maccabees-11-horseman-white-gold
  ('apocrypha', '2-maccabees', 11, 8, 'canon', 'joshua', 5, 13, 'free', E'Joshua 5:13 — *And it came to pass, when Joshua was by Jericho, that he lifted up his eyes and looked, and, behold, there stood a man over against him with his sword drawn in his hand: and Joshua went unto him, and said unto him, Art thou for us, or for our adversaries?* The same drawn-armed Figure that met Joshua at Jericho rides before the Maccabees at Jerusalem in 2-maccabees 11:8.'),
  ('apocrypha', '2-maccabees', 11, 8, 'canon', 'joshua', 5, 14, 'free', E'Joshua 5:14 — *And he said, Nay; but as captain of the host of Yahuah (LORD) am I now come. And Joshua fell on his face to the earth, and did worship, and said unto him, What saith my lord unto his servant?* The white-clad horseman of 2-maccabees 11:8 is that Captain of the host of Yahuah, come to lead Israel''s battle.'),
  ('apocrypha', '2-maccabees', 11, 8, 'apocrypha', '2-maccabees', 3, 25, 'extras', E'2 Maccabees 3:25 — *For there appeared to them an horse with a terrible rider upon him, and adorned with a very fair covering, and he ran fiercely, and struck at Heliodorus with his forefeet, and it seemed that he that sat upon the horse had complete harness of gold.* The golden-harnessed rider who smote Heliodorus at the temple is the same heavenly horseman who now leads Israel in 2-maccabees 11:8.'),
  ('apocrypha', '2-maccabees', 11, 8, 'canon', 'revelation', 19, 11, 'free', E'Revelation 19:11 — *And I saw heaven opened, and behold a white horse; and he that sat upon him was called Faithful and True, and in righteousness he doth judge and make war.* The white horseman shaking his golden armour in 2-maccabees 11:8 foreshadows the Rider Faithful and True who leads the armies of heaven.'),
  -- thread: 2-maccabees-11-helper-from-heaven
  ('apocrypha', '2-maccabees', 11, 10, 'canon', '2-kings', 6, 17, 'free', E'2 Kings 6:17 — *And Elisha prayed, and said, Yahuah (LORD), I pray thee, open his eyes, that he may see. And Yahuah (LORD) opened the eyes of the young man; and he saw: and, behold, the mountain was full of horses and chariots of fire round about Elisha.* The helper from heaven seen marching with Israel in 2-maccabees 11:10 is that same unseen host of fiery horses and chariots.'),
  ('apocrypha', '2-maccabees', 11, 13, 'canon', '2-kings', 6, 16, 'free', E'2 Kings 6:16 — *And he answered, Fear not: for they that be with us are more than they that be with them.* Lysias'' own conclusion in 2-maccabees 11:13 that the Hebrews could not be overcome is the enemy''s-eye proof of Elisha''s word — heaven''s host outnumbers every army of men.'),
  ('apocrypha', '2-maccabees', 11, 13, 'canon', 'revelation', 19, 14, 'free', E'Revelation 19:14 — *And the armies which were in heaven followed him upon white horses, clothed in fine linen, white and clean.* The Almighty who could not be resisted in 2-maccabees 11:13 is He whose heavenly armies ride behind Him in white at the last.'),
  -- thread: 2-maccabees-11-die-for-his-laws
  ('apocrypha', '2-maccabees', 11, 24, 'canon', 'psalms', 119, 44, 'free', E'Psalm 119:44 — *So shall I keep thy law continually for ever and ever.* The manner of living the Jews would not surrender in 2-maccabees 11:24 is exactly this enduring delight to keep Yahuah''s law for ever.'),
  ('apocrypha', '2-maccabees', 11, 24, 'apocrypha', '2-maccabees', 7, 9, 'extras', E'2 Maccabees 7:9 — *And when he was at the last gasp, he said, You like a fury takest us out of this present life, but the King of the world shall raise us up, who have died for his laws, to everlasting life.* The laws Antiochus is forced to restore in 2-maccabees 11:24 are the very laws the seven brothers died for, in the hope of resurrection.'),
  ('apocrypha', '2-maccabees', 11, 31, 'canon', 'hebrews', 11, 35, 'free', E'Hebrews 11:35 — *Women received their dead raised to life again: and others were tortured, not accepting deliverance; that they might obtain a better resurrection.* The Maccabean refusal to abandon their own meats and laws in 2-maccabees 11:31 is the very faith Hebrews crowns with the better resurrection.'),
  -- thread: 2-maccabees-11-restore-their-temple
  ('apocrypha', '2-maccabees', 11, 25, 'canon', 'ezra', 7, 25, 'free', E'Ezra 7:25 — *And thou, Ezra, after the wisdom of thy Elohim (God), that is in thine hand, set magistrates and judges, which may judge all the people that are beyond the river, all such as know the laws of thy Elohim (God); and teach ye them that know them not.* As Persia once decreed the restoration of Yahuah''s law over His people, so the king''s letter in 2-maccabees 11:25 is forced to restore the temple and the customs of the forefathers.'),
  ('apocrypha', '2-maccabees', 11, 25, 'canon', 'john', 10, 22, 'free', E'John 10:22 — *And it was at Jerusalem the feast of the dedication, and it was winter.* The temple restored to the Jews in 2-maccabees 11:25 is the house whose rededication became the very feast the Messiah Himself kept at Jerusalem.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2mac11_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2mac11_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-11-good-angel-deliver',
       E'Send a good angel to deliver Israel',
       E'Besieged by Lysias, Maccabeus and the covenant people do not first reach for the sword but for heaven: *Now when they that were with Maccabeus heard that he besieged the holds, they and all the people with lamentation and tears besought Yahuah (God) that he would send a good angel to deliver Yashar''el (Israel)* (2 Maccabees 11:6). It ain''t new — this is the deliverance Yahuah promised from the wilderness: *Behold, I send an Angel before thee, to keep thee in the way, and to bring thee into the place which I have prepared* (Exodus 23:20), the Angel in whom His Name dwells, who fights for the people that obey His voice: *But if thou shalt indeed obey his voice, and do all that I speak; then I will be an enemy unto thine enemies, and an adversary unto thine adversaries* (Exodus 23:22). The Torah-faithful Maccabees stand exactly where Israel stood at the Jordan, and the same Helper answers.',
       sv.verse_id, ev.verse_id, 'extras', 62250
  FROM _session253_2mac11_lookup sv, _session253_2mac11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=11 AND sv.verse_number=6
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=11 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-11-horseman-white-gold',
       E'The horseman in white, his armour of gold',
       E'Heaven sends not merely an angel but a captain: *And as they were at Jerusalem, there appeared before them on horseback one in white clothing, shaking his armour of gold* (2 Maccabees 11:8). When Joshua first entered the land he met the same Figure — *behold, there stood a man over against him with his sword drawn in his hand* (Joshua 5:13) — who declared, *Nay; but as captain of the host of Yahuah (LORD) am I now come* (Joshua 5:14). It is no new apparition even within this book: at the temple Heliodorus was struck down by *an horse with a terrible rider upon him... and it seemed that he that sat upon the horse had complete harness of gold* (2 Maccabees 3:25). And the same Rider opens the last book of all: *And I saw heaven opened, and behold a white horse; and he that sat upon him was called Faithful and True, and in righteousness he doth judge and make war* (Revelation 19:11) — the Captain of Yahuah''s host leading His armies still.',
       sv.verse_id, ev.verse_id, 'extras', 62253
  FROM _session253_2mac11_lookup sv, _session253_2mac11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=11 AND sv.verse_number=8
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=11 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-11-helper-from-heaven',
       E'Having an helper from heaven',
       E'The whole victory hangs on one confession: *Thus they marched forward in their armour, having an helper from heaven: for Yahuah (God) was merciful to them* (2 Maccabees 11:10), so that the very enemy concluded *that the Hebrews could not be overcome, because the Almighty Yahuah (God) helped them* (2 Maccabees 11:13). This is the open-eyes faith of Elisha''s servant at Dothan, who feared the encircling host until *Elisha prayed, and said, Yahuah (LORD), I pray thee, open his eyes, that he may see. And Yahuah (LORD) opened the eyes of the young man; and he saw: and, behold, the mountain was full of horses and chariots of fire round about Elisha* (2 Kings 6:17) — for the word stood, *Fear not: for they that be with us are more than they that be with them* (2 Kings 6:16). The heavenly cavalry the Maccabees saw is the same fiery host that always surrounds the covenant people.',
       sv.verse_id, ev.verse_id, 'extras', 62256
  FROM _session253_2mac11_lookup sv, _session253_2mac11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=11 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=11 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-11-die-for-his-laws',
       E'Liberty to live after their own laws',
       E'The peace letters confess what the whole war was for — not land but Torah: the Jews *would not consent to our father, for to be brought to the custom of the Gentiles, but had rather keep their own manner of living: for the which cause they require of us, that we should suffer them to live after their own laws* (2 Maccabees 11:24), and so the decree restores them: *the Yahudim (Jews) shall use their own kind of meats and laws, as before* (2 Maccabees 11:31). Even the kingdom of man is forced to grant what the covenant people would sooner die than surrender — the very hope of the brother who, dying for the commandments, cried, *the King of the world shall raise us up, who have died for his laws, to everlasting life* (2 Maccabees 7:9). This is no law-as-curse: it is the psalmist''s vow, *So shall I keep thy law continually for ever and ever* (Psalm 119:44), and the resurrection of the Torah-faithful that Hebrews itself looks back to: *others were tortured, not accepting deliverance; that they might obtain a better resurrection* (Hebrews 11:35).',
       sv.verse_id, ev.verse_id, 'extras', 62259
  FROM _session253_2mac11_lookup sv, _session253_2mac11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=11 AND sv.verse_number=24
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=11 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-11-restore-their-temple',
       E'We have determined to restore them their temple',
       E'Antiochus'' own letter is forced to undo the desolation he had wrought: *Wherefore our mind is, that this nation shall be in rest, and we have determined to restore them their temple, that they may live according to the customs of their forefathers* (2 Maccabees 11:25). The kingdom of man that profaned the sanctuary must now grant its restoration — as the Persian decree once charged Ezra to set Yahuah''s law again over the regathered people: *set magistrates and judges, which may judge all the people that are beyond the river, all such as know the laws of thy Elohim (God); and teach ye them that know them not* (Ezra 7:25). The temple given back here is the temple Judas will cleanse, the feast the Messiah Himself kept: *And it was at Jerusalem the feast of the dedication, and it was winter* (John 10:22). The covenant people and their house are not replaced but restored.',
       sv.verse_id, ev.verse_id, 'extras', 62262
  FROM _session253_2mac11_lookup sv, _session253_2mac11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=11 AND sv.verse_number=25
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=11 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-maccabees-11-good-angel-deliver
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 23:20 — *Behold, I send an Angel before thee, to keep thee in the way, and to bring thee into the place which I have prepared.* The good angel the Maccabees beg for in 2-maccabees 11:6 is the very Angel Yahuah pledged to send before His covenant people.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac11_lookup sv, _session253_2mac11_lookup tv
 WHERE t.slug='2-maccabees-11-good-angel-deliver'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=11 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=23 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 23:22 — *But if thou shalt indeed obey his voice, and do all that I speak; then I will be an enemy unto thine enemies, and an adversary unto thine adversaries.* The condition of that heavenly help is covenant obedience — the very Torah-faithfulness for which the men of 2-maccabees 11:6 are fighting.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac11_lookup sv, _session253_2mac11_lookup tv
 WHERE t.slug='2-maccabees-11-good-angel-deliver'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=11 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=23 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-11-horseman-white-gold
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 5:13 — *And it came to pass, when Joshua was by Jericho, that he lifted up his eyes and looked, and, behold, there stood a man over against him with his sword drawn in his hand: and Joshua went unto him, and said unto him, Art thou for us, or for our adversaries?* The same drawn-armed Figure that met Joshua at Jericho rides before the Maccabees at Jerusalem in 2-maccabees 11:8.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac11_lookup sv, _session253_2mac11_lookup tv
 WHERE t.slug='2-maccabees-11-horseman-white-gold'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=11 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=5 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joshua 5:14 — *And he said, Nay; but as captain of the host of Yahuah (LORD) am I now come. And Joshua fell on his face to the earth, and did worship, and said unto him, What saith my lord unto his servant?* The white-clad horseman of 2-maccabees 11:8 is that Captain of the host of Yahuah, come to lead Israel''s battle.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac11_lookup sv, _session253_2mac11_lookup tv
 WHERE t.slug='2-maccabees-11-horseman-white-gold'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=11 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=5 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Maccabees 3:25 — *For there appeared to them an horse with a terrible rider upon him, and adorned with a very fair covering, and he ran fiercely, and struck at Heliodorus with his forefeet, and it seemed that he that sat upon the horse had complete harness of gold.* The golden-harnessed rider who smote Heliodorus at the temple is the same heavenly horseman who now leads Israel in 2-maccabees 11:8.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac11_lookup sv, _session253_2mac11_lookup tv
 WHERE t.slug='2-maccabees-11-horseman-white-gold'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=11 AND sv.verse_number=8
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=3 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 19:11 — *And I saw heaven opened, and behold a white horse; and he that sat upon him was called Faithful and True, and in righteousness he doth judge and make war.* The white horseman shaking his golden armour in 2-maccabees 11:8 foreshadows the Rider Faithful and True who leads the armies of heaven.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac11_lookup sv, _session253_2mac11_lookup tv
 WHERE t.slug='2-maccabees-11-horseman-white-gold'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=11 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=19 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-11-helper-from-heaven
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Kings 6:17 — *And Elisha prayed, and said, Yahuah (LORD), I pray thee, open his eyes, that he may see. And Yahuah (LORD) opened the eyes of the young man; and he saw: and, behold, the mountain was full of horses and chariots of fire round about Elisha.* The helper from heaven seen marching with Israel in 2-maccabees 11:10 is that same unseen host of fiery horses and chariots.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac11_lookup sv, _session253_2mac11_lookup tv
 WHERE t.slug='2-maccabees-11-helper-from-heaven'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=11 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=6 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Kings 6:16 — *And he answered, Fear not: for they that be with us are more than they that be with them.* Lysias'' own conclusion in 2-maccabees 11:13 that the Hebrews could not be overcome is the enemy''s-eye proof of Elisha''s word — heaven''s host outnumbers every army of men.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac11_lookup sv, _session253_2mac11_lookup tv
 WHERE t.slug='2-maccabees-11-helper-from-heaven'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=11 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=6 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 19:14 — *And the armies which were in heaven followed him upon white horses, clothed in fine linen, white and clean.* The Almighty who could not be resisted in 2-maccabees 11:13 is He whose heavenly armies ride behind Him in white at the last.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac11_lookup sv, _session253_2mac11_lookup tv
 WHERE t.slug='2-maccabees-11-helper-from-heaven'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=11 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=19 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-11-die-for-his-laws
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 119:44 — *So shall I keep thy law continually for ever and ever.* The manner of living the Jews would not surrender in 2-maccabees 11:24 is exactly this enduring delight to keep Yahuah''s law for ever.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac11_lookup sv, _session253_2mac11_lookup tv
 WHERE t.slug='2-maccabees-11-die-for-his-laws'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=11 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=119 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Maccabees 7:9 — *And when he was at the last gasp, he said, You like a fury takest us out of this present life, but the King of the world shall raise us up, who have died for his laws, to everlasting life.* The laws Antiochus is forced to restore in 2-maccabees 11:24 are the very laws the seven brothers died for, in the hope of resurrection.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac11_lookup sv, _session253_2mac11_lookup tv
 WHERE t.slug='2-maccabees-11-die-for-his-laws'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=11 AND sv.verse_number=24
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 11:35 — *Women received their dead raised to life again: and others were tortured, not accepting deliverance; that they might obtain a better resurrection.* The Maccabean refusal to abandon their own meats and laws in 2-maccabees 11:31 is the very faith Hebrews crowns with the better resurrection.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac11_lookup sv, _session253_2mac11_lookup tv
 WHERE t.slug='2-maccabees-11-die-for-his-laws'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=11 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-11-restore-their-temple
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezra 7:25 — *And thou, Ezra, after the wisdom of thy Elohim (God), that is in thine hand, set magistrates and judges, which may judge all the people that are beyond the river, all such as know the laws of thy Elohim (God); and teach ye them that know them not.* As Persia once decreed the restoration of Yahuah''s law over His people, so the king''s letter in 2-maccabees 11:25 is forced to restore the temple and the customs of the forefathers.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac11_lookup sv, _session253_2mac11_lookup tv
 WHERE t.slug='2-maccabees-11-restore-their-temple'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=11 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=7 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 10:22 — *And it was at Jerusalem the feast of the dedication, and it was winter.* The temple restored to the Jews in 2-maccabees 11:25 is the house whose rededication became the very feast the Messiah Himself kept at Jerusalem.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac11_lookup sv, _session253_2mac11_lookup tv
 WHERE t.slug='2-maccabees-11-restore-their-temple'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=11 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=10 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

