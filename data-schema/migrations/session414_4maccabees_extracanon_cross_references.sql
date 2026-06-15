-- =====================================================================
-- Session 414 — 4 Maccabees FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py ../data-schema/migrations/session414_4maccabees_extracanon_cross_references.sql
-- =====================================================================

\echo 'session414 — 4 Maccabees cross-references starting...'
BEGIN;

-- ----- fragment: minion_4maccabees_01.sql (session414 4-maccabees 1) -----
-- Source anchor: pseudepigrapha/4-maccabees ch1. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 4macc01 (view _session414_4macc01_lookup). Sort band base 91000, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session414_4macc01_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 4-maccabees-1-reason-under-the-law
  ('pseudepigrapha', '4-maccabees', 1, 16, 'canon', 'romans', 7, 12, 'free', E'Romans 7:12 — *Wherefore the law is holy, and the commandment holy, and just, and good.* The "culture acquired under the Law" that schools the reason is the very Torah Paul calls holy, just and good.'),
  ('pseudepigrapha', '4-maccabees', 1, 1, 'canon', 'romans', 7, 22, 'free', E'Romans 7:22 — *For I delight in the law of Elohim (God) after the inward man:* the inward delight in the Law is exactly the inner Reason 4 Maccabees sets over the passions.'),
  ('pseudepigrapha', '4-maccabees', 1, 3, 'canon', 'romans', 7, 23, 'free', E'Romans 7:23 — *But I see another law in my members, warring against the law of my mind, and bringing me into captivity to the law of sin which is in my members.* The mind''s law against the passions of the members is the same contest 4 Maccabees frames as Reason over the passions.'),
  ('pseudepigrapha', '4-maccabees', 1, 18, 'canon', 'romans', 7, 25, 'free', E'Romans 7:25 — *So then with the mind I myself serve the law of Elohim (God); but with the flesh the law of sin.* Self-control "asserts its authority over the passions" by serving the Law with the mind — Paul''s very division.'),
  ('pseudepigrapha', '4-maccabees', 1, 16, 'canon', 'psalms', 19, 7, 'free', E'Psalm 19:7 — *The law of Yahuah (LORD) is perfect, converting the soul: the testimony of Yahuah (LORD) is sure, making wise the simple.* The Law converting the soul IS the "culture acquired under the Law" that makes the simple wise.'),
  ('pseudepigrapha', '4-maccabees', 1, 17, 'canon', 'psalms', 19, 8, 'free', E'Psalm 19:8 — *The statutes of Yahuah (LORD) are right, rejoicing the heart: the commandment of Yahuah (LORD) is pure, enlightening the eyes.* Wisdom "manifested under the forms of judgement and justice" is the right, heart-rejoicing statute of Yahuah.'),
  ('pseudepigrapha', '4-maccabees', 1, 4, 'canon', 'proverbs', 16, 32, 'free', E'Proverbs 16:32 — *He that is slow to anger is better than the mighty; and he that ruleth his spirit than he that taketh a city.* Reason "lord over" rage and over the passions opposed to manliness is Solomon''s man who rules his spirit.'),
  ('pseudepigrapha', '4-maccabees', 1, 16, 'canon', 'deuteronomy', 30, 14, 'free', E'Deuteronomy 30:14 — *But the word is very nigh unto thee, in thy mouth, and in thy heart, that thou mayest do it.* The Law that disciplines the reason is no far-off counsel but the word already set in heart and mouth to do.'),
  -- thread: 4-maccabees-1-reason-the-master-gardener
  ('pseudepigrapha', '4-maccabees', 1, 30, 'canon', 'galatians', 5, 16, 'free', E'Galatians 5:16 — *This I say then, Walk in the Spirit, and ye shall not fulfil the lust of the flesh.* Reason as "guide of the virtues" and "master of the passions" is Paul''s walk in the Spirit not fulfilling the flesh''s lust.'),
  ('pseudepigrapha', '4-maccabees', 1, 19, 'canon', 'galatians', 5, 17, 'free', E'Galatians 5:17 — *For the flesh lusteth against the Spirit, and the Spirit against the flesh: and these are contrary the one to the other: so that ye cannot do the things that ye would.* The "two comprehensive sources, namely, pleasure and pain" warred against by Reason mirror Paul''s flesh contrary to the Spirit.'),
  ('pseudepigrapha', '4-maccabees', 1, 31, 'canon', 'galatians', 5, 23, 'free', E'Galatians 5:23 — *Meekness, temperance: against such there is no law.* The temperance through which "Reason becomes supreme over the passions" is named among the very fruit of the Spirit.'),
  ('pseudepigrapha', '4-maccabees', 1, 35, 'canon', 'galatians', 5, 24, 'free', E'Galatians 5:24 — *And they that are Messiah''s (Christ’s) have crucified the flesh with the affections and lusts.* The appetites "checked and inhibited by the temperate mind... bridle of Reason" are the affections and lusts Messiah''s people crucify.'),
  ('pseudepigrapha', '4-maccabees', 1, 30, 'canon', 'proverbs', 16, 32, 'free', E'Proverbs 16:32 — *He that is slow to anger is better than the mighty; and he that ruleth his spirit than he that taketh a city.* The reason that masters the passions is the spirit-ruler Solomon crowns above the conqueror.'),
  -- thread: 4-maccabees-1-forbidden-meats-under-the-law
  ('pseudepigrapha', '4-maccabees', 1, 33, 'canon', 'leviticus', 11, 7, 'free', E'Leviticus 11:7 — *And the swine, though he divide the hoof, and be clovenfooted, yet he cheweth not the cud; he is unclean to you.* The "forbidden meats" repressed by Reason are the swine the Lawgiver declared unclean.'),
  ('pseudepigrapha', '4-maccabees', 1, 34, 'canon', 'leviticus', 11, 8, 'free', E'Leviticus 11:8 — *Of their flesh shall ye not eat, and their carcase shall ye not touch; they are unclean to you.* To "abstain through the predominance of Reason" from meats "forbidden to us under the Law" is simply to keep this command.'),
  ('pseudepigrapha', '4-maccabees', 1, 34, 'canon', 'leviticus', 11, 44, 'free', E'Leviticus 11:44 — *For I am Yahuah Elohaychem (the LORD your God): ye shall therefore sanctify yourselves, and ye shall be holy; for I am holy: neither shall ye defile yourselves with any manner of creeping thing that creepeth upon the earth.* The dietary discipline is grounded in holiness unto Yahuah, the Creator-Lawgiver — the very ground the martyrs will plead.'),
  ('pseudepigrapha', '4-maccabees', 1, 33, 'canon', 'deuteronomy', 14, 3, 'free', E'Deuteronomy 14:3 — *Thou shalt not eat any abominable thing.* Moses'' plain charge underwrites the abstinence from "meats of every description forbidden to us under the Law."'),
  ('pseudepigrapha', '4-maccabees', 1, 34, 'canon', 'deuteronomy', 14, 8, 'free', E'Deuteronomy 14:8 — *And the swine, because it divideth the hoof, yet cheweth not the cud, it is unclean unto you: ye shall not eat of their flesh, nor touch their dead carcase.* The swine the brothers refuse is the swine Moses twice forbids — the clean/unclean law stands.'),
  ('pseudepigrapha', '4-maccabees', 1, 33, 'canon', 'daniel', 1, 8, 'free', E'Daniel 1:8 — *But Daniel purposed in his heart that he would not defile himself with the portion of the king’s meat, nor with the wine which he drank: therefore he requested of the prince of the eunuchs that he might not defile himself.* Daniel''s purposed refusal in the king''s court is the very pattern of Reason repressing the appetite "under the Law."')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session414_4macc01_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session414_4macc01_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '4-maccabees-1-reason-under-the-law',
       E'The Inspired Reason — the mind disciplined under the Law',
       E'The book opens its thesis: *whether the Inspired Reason is supreme ruler over the passions* (4 Maccabees 1:1). But this Reason is no Stoic autonomy standing apart from the Creator; the writer names its source plainly — *This I take to be the culture acquired under the Law, through which we learn with due reverence the things of Elohim (God)* (4 Maccabees 1:16). The mind that masters lust and rage and fear is the mind trained BY the Torah. It ain''t new: Paul says the same — *the law is holy, and the commandment holy, and just, and good* (Romans 7:12), and *I delight in the law of Elohim (God) after the inward man* (Romans 7:22), warring against *the law of sin which is in my members* (Romans 7:23). David sang it long before — *The law of Yahuah (LORD) is perfect, converting the soul* (Psalm 19:7) — and Solomon weighed self-mastery higher than conquest — *he that ruleth his spirit than he that taketh a city* (Proverbs 16:32). Moses set the whole charge near, not far off — *the word is very nigh unto thee, in thy mouth, and in thy heart, that thou mayest do it* (Deuteronomy 30:14). The Torah-trained reason is the oldest wisdom there is.',
       sv.verse_id, ev.verse_id, 'extras', 91000
  FROM _session414_4macc01_lookup sv, _session414_4macc01_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=1 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='4-maccabees' AND ev.chapter_number=1 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '4-maccabees-1-reason-the-master-gardener',
       E'Reason the master-gardener — ruling, not uprooting, the passions',
       E'4 Maccabees is careful: Reason does *not* extirpate the passions but enables us to resist them — *its action in their case is not to extirpate the passions, but to enable us to resist them successfully* (4 Maccabees 1:6). The picture is the disciplined garden: *each man''s Reason as master-gardener, weeding and pruning and binding up... brings the thicket of dispositions and passions under domestication* (4 Maccabees 1:29), *For while Reason is the guide of the virtues it is master of the passions* (4 Maccabees 1:30). It ain''t new: Paul names the same walk — not the killing of all desire but the Spirit''s mastery over the flesh — *Walk in the Spirit, and ye shall not fulfil the lust of the flesh* (Galatians 5:16), *the flesh lusteth against the Spirit, and the Spirit against the flesh* (Galatians 5:17), with its harvest of *love, joy, peace, longsuffering, gentleness, goodness, faith* (Galatians 5:22). And the man who rules himself is the proverb''s true conqueror — *he that ruleth his spirit than he that taketh a city* (Proverbs 16:32). The husbandry of the heart is an old craft.',
       sv.verse_id, ev.verse_id, 'extras', 91003
  FROM _session414_4macc01_lookup sv, _session414_4macc01_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=1 AND sv.verse_number=28
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='4-maccabees' AND ev.chapter_number=1 AND ev.verse_number=35
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '4-maccabees-1-forbidden-meats-under-the-law',
       E'The forbidden meats abstained from under the Law',
       E'The thesis lands at once on the dinner table: the first proof that Reason masters the body is the refusal of unclean food — *when we are tempted towards forbidden meats, how do we come to relinquish the pleasures to be derived from them? Is it not that Reason has power to repress the appetites?* (4 Maccabees 1:33), *Accordingly when we feel a desire to eat water-animals and birds and beasts and meats of every description forbidden to us under the Law, we abstain through the predominance of Reason* (4 Maccabees 1:34). The abstaining is *under the Law* — not a private scruple but the Creator''s command, the same line Eleazar and the seven brothers will die for. It ain''t new: the swine is named unclean from Sinai — *And the swine, though he divide the hoof, and be clovenfooted, yet he cheweth not the cud; he is unclean to you* (Leviticus 11:7), *Of their flesh shall ye not eat, and their carcase shall ye not touch; they are unclean to you* (Leviticus 11:8); Moses repeats it — *Thou shalt not eat any abominable thing* (Deuteronomy 14:3). And Daniel, in a tyrant''s court, set the pattern of the disciplined refusal — *Daniel purposed in his heart that he would not defile himself with the portion of the king’s meat* (Daniel 1:8). The martyrs'' table-faith is the oldest obedience there is — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 91006
  FROM _session414_4macc01_lookup sv, _session414_4macc01_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=1 AND sv.verse_number=33
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='4-maccabees' AND ev.chapter_number=1 AND ev.verse_number=35
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 4-maccabees-1-reason-under-the-law
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 7:12 — *Wherefore the law is holy, and the commandment holy, and just, and good.* The "culture acquired under the Law" that schools the reason is the very Torah Paul calls holy, just and good.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc01_lookup sv, _session414_4macc01_lookup tv
 WHERE t.slug='4-maccabees-1-reason-under-the-law'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=1 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=7 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 7:22 — *For I delight in the law of Elohim (God) after the inward man:* the inward delight in the Law is exactly the inner Reason 4 Maccabees sets over the passions.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc01_lookup sv, _session414_4macc01_lookup tv
 WHERE t.slug='4-maccabees-1-reason-under-the-law'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=1 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=7 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 7:23 — *But I see another law in my members, warring against the law of my mind, and bringing me into captivity to the law of sin which is in my members.* The mind''s law against the passions of the members is the same contest 4 Maccabees frames as Reason over the passions.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc01_lookup sv, _session414_4macc01_lookup tv
 WHERE t.slug='4-maccabees-1-reason-under-the-law'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=7 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 7:25 — *So then with the mind I myself serve the law of Elohim (God); but with the flesh the law of sin.* Self-control "asserts its authority over the passions" by serving the Law with the mind — Paul''s very division.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc01_lookup sv, _session414_4macc01_lookup tv
 WHERE t.slug='4-maccabees-1-reason-under-the-law'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=1 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=7 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Psalm 19:7 — *The law of Yahuah (LORD) is perfect, converting the soul: the testimony of Yahuah (LORD) is sure, making wise the simple.* The Law converting the soul IS the "culture acquired under the Law" that makes the simple wise.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc01_lookup sv, _session414_4macc01_lookup tv
 WHERE t.slug='4-maccabees-1-reason-under-the-law'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=1 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Psalm 19:8 — *The statutes of Yahuah (LORD) are right, rejoicing the heart: the commandment of Yahuah (LORD) is pure, enlightening the eyes.* Wisdom "manifested under the forms of judgement and justice" is the right, heart-rejoicing statute of Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc01_lookup sv, _session414_4macc01_lookup tv
 WHERE t.slug='4-maccabees-1-reason-under-the-law'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=1 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Proverbs 16:32 — *He that is slow to anger is better than the mighty; and he that ruleth his spirit than he that taketh a city.* Reason "lord over" rage and over the passions opposed to manliness is Solomon''s man who rules his spirit.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc01_lookup sv, _session414_4macc01_lookup tv
 WHERE t.slug='4-maccabees-1-reason-under-the-law'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=16 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'Deuteronomy 30:14 — *But the word is very nigh unto thee, in thy mouth, and in thy heart, that thou mayest do it.* The Law that disciplines the reason is no far-off counsel but the word already set in heart and mouth to do.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc01_lookup sv, _session414_4macc01_lookup tv
 WHERE t.slug='4-maccabees-1-reason-under-the-law'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=1 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 4-maccabees-1-reason-the-master-gardener
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Galatians 5:16 — *This I say then, Walk in the Spirit, and ye shall not fulfil the lust of the flesh.* Reason as "guide of the virtues" and "master of the passions" is Paul''s walk in the Spirit not fulfilling the flesh''s lust.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc01_lookup sv, _session414_4macc01_lookup tv
 WHERE t.slug='4-maccabees-1-reason-the-master-gardener'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=1 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=5 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Galatians 5:17 — *For the flesh lusteth against the Spirit, and the Spirit against the flesh: and these are contrary the one to the other: so that ye cannot do the things that ye would.* The "two comprehensive sources, namely, pleasure and pain" warred against by Reason mirror Paul''s flesh contrary to the Spirit.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc01_lookup sv, _session414_4macc01_lookup tv
 WHERE t.slug='4-maccabees-1-reason-the-master-gardener'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=1 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=5 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Galatians 5:23 — *Meekness, temperance: against such there is no law.* The temperance through which "Reason becomes supreme over the passions" is named among the very fruit of the Spirit.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc01_lookup sv, _session414_4macc01_lookup tv
 WHERE t.slug='4-maccabees-1-reason-the-master-gardener'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=1 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=5 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Galatians 5:24 — *And they that are Messiah''s (Christ’s) have crucified the flesh with the affections and lusts.* The appetites "checked and inhibited by the temperate mind... bridle of Reason" are the affections and lusts Messiah''s people crucify.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc01_lookup sv, _session414_4macc01_lookup tv
 WHERE t.slug='4-maccabees-1-reason-the-master-gardener'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=1 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=5 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Proverbs 16:32 — *He that is slow to anger is better than the mighty; and he that ruleth his spirit than he that taketh a city.* The reason that masters the passions is the spirit-ruler Solomon crowns above the conqueror.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc01_lookup sv, _session414_4macc01_lookup tv
 WHERE t.slug='4-maccabees-1-reason-the-master-gardener'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=1 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=16 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 4-maccabees-1-forbidden-meats-under-the-law
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 11:7 — *And the swine, though he divide the hoof, and be clovenfooted, yet he cheweth not the cud; he is unclean to you.* The "forbidden meats" repressed by Reason are the swine the Lawgiver declared unclean.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc01_lookup sv, _session414_4macc01_lookup tv
 WHERE t.slug='4-maccabees-1-forbidden-meats-under-the-law'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=1 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=11 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 11:8 — *Of their flesh shall ye not eat, and their carcase shall ye not touch; they are unclean to you.* To "abstain through the predominance of Reason" from meats "forbidden to us under the Law" is simply to keep this command.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc01_lookup sv, _session414_4macc01_lookup tv
 WHERE t.slug='4-maccabees-1-forbidden-meats-under-the-law'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=1 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=11 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 11:44 — *For I am Yahuah Elohaychem (the LORD your God): ye shall therefore sanctify yourselves, and ye shall be holy; for I am holy: neither shall ye defile yourselves with any manner of creeping thing that creepeth upon the earth.* The dietary discipline is grounded in holiness unto Yahuah, the Creator-Lawgiver — the very ground the martyrs will plead.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc01_lookup sv, _session414_4macc01_lookup tv
 WHERE t.slug='4-maccabees-1-forbidden-meats-under-the-law'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=1 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=11 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Deuteronomy 14:3 — *Thou shalt not eat any abominable thing.* Moses'' plain charge underwrites the abstinence from "meats of every description forbidden to us under the Law."'
  FROM cross_reference_threads t, cross_references x, _session414_4macc01_lookup sv, _session414_4macc01_lookup tv
 WHERE t.slug='4-maccabees-1-forbidden-meats-under-the-law'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=1 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=14 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Deuteronomy 14:8 — *And the swine, because it divideth the hoof, yet cheweth not the cud, it is unclean unto you: ye shall not eat of their flesh, nor touch their dead carcase.* The swine the brothers refuse is the swine Moses twice forbids — the clean/unclean law stands.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc01_lookup sv, _session414_4macc01_lookup tv
 WHERE t.slug='4-maccabees-1-forbidden-meats-under-the-law'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=1 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=14 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Daniel 1:8 — *But Daniel purposed in his heart that he would not defile himself with the portion of the king’s meat, nor with the wine which he drank: therefore he requested of the prince of the eunuchs that he might not defile himself.* Daniel''s purposed refusal in the king''s court is the very pattern of Reason repressing the appetite "under the Law."'
  FROM cross_reference_threads t, cross_references x, _session414_4macc01_lookup sv, _session414_4macc01_lookup tv
 WHERE t.slug='4-maccabees-1-forbidden-meats-under-the-law'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=1 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=1 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_4maccabees_02.sql (session414 4-maccabees 2) -----
-- Source anchor: pseudepigrapha/4-maccabees ch2. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 4macc02 (view _session414_4macc02_lookup). Sort band base 91025, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session414_4macc02_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 4-maccabees-2-joseph-and-the-tenth-word
  ('pseudepigrapha', '4-maccabees', 2, 2, 'canon', 'genesis', 39, 7, 'free', E'Genesis 39:7 — *And it came to pass after these things, that his master''s wife cast her eyes upon Joseph; and she said, Lie with me.* This is the very temptation the "virtuous Joseph" checked by his Reason.'),
  ('pseudepigrapha', '4-maccabees', 2, 3, 'canon', 'genesis', 39, 9, 'free', E'Genesis 39:9 — *There is none greater in this house than I; neither hath he kept back any thing from me but thee, because thou art his wife: how then can I do this great wickedness, and sin against Elohim (God)?* Joseph''s refusal — "sin against Elohim" — is the carnal impulse quenched at the age "when physical desire is strong."'),
  ('pseudepigrapha', '4-maccabees', 2, 3, 'canon', 'genesis', 39, 12, 'free', E'Genesis 39:12 — *And she caught him by his garment, saying, Lie with me: and he left his garment in her hand, and fled, and got him out.* Joseph fleeing the temptation is the deed 4 Maccabees praises as Reason mastering the passion.'),
  ('pseudepigrapha', '4-maccabees', 2, 5, 'canon', 'exodus', 20, 17, 'free', E'Exodus 20:17 — *Thou shalt not covet thy neighbour''s house, thou shalt not covet thy neighbour''s wife, nor his manservant, nor his maidservant, nor his ox, nor his ass, nor any thing that is thy neighbour''s.* This is the Tenth Word the writer quotes verbatim as the Law that schools Reason to control covetous desire.'),
  ('pseudepigrapha', '4-maccabees', 2, 5, 'canon', 'deuteronomy', 5, 21, 'free', E'Deuteronomy 5:21 — *Neither shalt thou desire thy neighbour''s wife, neither shalt thou covet thy neighbour''s house, his field, or his manservant, or his maidservant, his ox, or his ass, or any thing that is thy neighbour''s.* Moses'' second giving of the Tenth Word is the same command 4 Maccabees cites — "when the Law orders us not to covet."'),
  -- thread: 4-maccabees-2-the-law-overrules-greed
  ('pseudepigrapha', '4-maccabees', 2, 8, 'canon', 'deuteronomy', 15, 1, 'free', E'Deuteronomy 15:1 — *At the end of every seven years thou shalt make a release.* The "seventh-year periods" at which a man "cancels the debt" is this very statute of release.'),
  ('pseudepigrapha', '4-maccabees', 2, 8, 'canon', 'deuteronomy', 15, 2, 'free', E'Deuteronomy 15:2 — *And this is the manner of the release: Every creditor that lendeth ought unto his neighbour shall release it; he shall not exact it of his neighbour, or of his brother; because it is called the LORD''S release.* The miser "overruled by the Law" to lend without interest and cancel the debt is keeping the Lord''s release.'),
  ('pseudepigrapha', '4-maccabees', 2, 9, 'canon', 'leviticus', 19, 9, 'free', E'Leviticus 19:9 — *And when ye reap the harvest of your land, thou shalt not wholly reap the corners of thy field, neither shalt thou gather the gleanings of thy harvest.* To "refrain from gleaning his stubbles" is to obey the law of the corners and the gleanings left for the poor.'),
  ('pseudepigrapha', '4-maccabees', 2, 9, 'canon', 'leviticus', 19, 10, 'free', E'Leviticus 19:10 — *And thou shalt not glean thy vineyard, neither shalt thou gather every grape of thy vineyard; thou shalt leave them for the poor and stranger: I am Yahuah Elohaychem (the LORD your God).* The parsimonious man who refrains from "picking the last grapes from his vineyards" is keeping this command for the poor and stranger.'),
  ('pseudepigrapha', '4-maccabees', 2, 9, 'canon', 'deuteronomy', 24, 19, 'free', E'Deuteronomy 24:19 — *When thou cuttest down thine harvest in thy field, and hast forgot a sheaf in the field, thou shalt not go again to fetch it: it shall be for the stranger, for the fatherless, and for the widow: that Yahuah Elohayka (the LORD thy God) may bless thee in all the work of thine hands.* Moses'' law of the forgotten sheaf is the same harvest-charity the Law presses on the grasping man through Reason.'),
  -- thread: 4-maccabees-2-the-law-governs-anger
  ('pseudepigrapha', '4-maccabees', 2, 17, 'canon', 'numbers', 16, 2, 'free', E'Numbers 16:2 — *And they rose up before Moses, with certain of the children of Yashar''el (Israel), two hundred and fifty princes of the assembly, famous in the congregation, men of renown.* This rising against Moses is the occasion at which he "governed his anger by his Reason" rather than giving free course to wrath.'),
  ('pseudepigrapha', '4-maccabees', 2, 17, 'canon', 'numbers', 16, 12, 'free', E'Numbers 16:12 — *And Moses sent to call Dathan and Abiram, the sons of Eliab: which said, We will not come up.* Their open defiance is precisely the provocation Moses met by governing his anger, not by surrendering to it.'),
  ('pseudepigrapha', '4-maccabees', 2, 19, 'canon', 'genesis', 49, 5, 'free', E'Genesis 49:5 — *Simeon and Levi are brethren; instruments of cruelty are in their habitations.* This is the censure 4 Maccabees recalls as Jacob blaming the houses of Simeon and Levi.'),
  ('pseudepigrapha', '4-maccabees', 2, 20, 'canon', 'genesis', 49, 7, 'free', E'Genesis 49:7 — *Cursed be their anger, for it was fierce; and their wrath, for it was cruel: I will divide them in Jacob, and scatter them in Yashar''el (Israel).* This is the very curse the writer quotes — "Accursed be their anger!" — proof that unreasoning rage is condemned by the Law.'),
  ('pseudepigrapha', '4-maccabees', 2, 19, 'canon', 'genesis', 34, 25, 'free', E'Genesis 34:25 — *And it came to pass on the third day, when they were sore, that two of the sons of Jacob, Simeon and Levi, Dinah''s brethren, took each man his sword, and came upon the city boldly, and slew all the males.* The "unreasoning slaughter of the tribe of the Shechemites" is this deed Jacob''s curse condemns.'),
  -- thread: 4-maccabees-2-passions-and-law-given-at-creation
  ('pseudepigrapha', '4-maccabees', 2, 21, 'canon', 'genesis', 2, 7, 'free', E'Genesis 2:7 — *And Yahuah Elohim (the LORD God) formed man of the dust of the ground, and breathed into his nostrils the breath of life; and man became a living soul.* "The day when Elohim created man" and "implanted in him his passions" is the very forming Moses records.'),
  ('pseudepigrapha', '4-maccabees', 2, 22, 'canon', 'genesis', 2, 8, 'free', E'Genesis 2:8 — *And Yahuah Elohim (the LORD God) planted a garden eastward in Eden; and there he put the man whom he had formed.* The Creator who "set the mind on a throne... to be his sacred guide" placed the man he formed under his charge in Eden.'),
  ('pseudepigrapha', '4-maccabees', 2, 23, 'canon', 'deuteronomy', 30, 19, 'free', E'Deuteronomy 30:19 — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live.* The Law "given to the mind" so a man may reign over a temperate and just kingdom is the choice of life Moses sets before Israel.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session414_4macc02_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session414_4macc02_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '4-maccabees-2-joseph-and-the-tenth-word',
       E'Joseph''s Reason and the Tenth Word — Thou shalt not covet',
       E'The first proof that Reason masters every passion is Joseph: *This, certainly, is why we praise the virtuous Joseph, because by his Reason, with a mental effort, he checked the carnal impulse* (4 Maccabees 2:2), *a young man at the age when physical desire is strong, by his Reason quenched the impulse of his passions* (4 Maccabees 2:3). And the writer grounds that mastery not in Stoic willpower but in the Torah itself, quoting the Decalogue: *For the Law says, ''Thou shalt not covet thy neighbour''s wife, nor anything that is thy neighbour''s''* (4 Maccabees 2:5). It ain''t new: Joseph fled the very temptation centuries before the philosophers wrote — *his master''s wife cast her eyes upon Joseph; and she said, Lie with me* (Genesis 39:7), and he answered, *how then can I do this great wickedness, and sin against Elohim (God)?* (Genesis 39:9), and *he left his garment in her hand, and fled* (Genesis 39:12). And the word the writer cites is the Tenth Word spoken at Sinai — *Thou shalt not covet thy neighbour''s house, thou shalt not covet thy neighbour''s wife* (Exodus 20:17), repeated by Moses — *Neither shalt thou desire thy neighbour''s wife* (Deuteronomy 5:21). The Torah is what trains the reason to flee — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 91025
  FROM _session414_4macc02_lookup sv, _session414_4macc02_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=2 AND sv.verse_number=2
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='4-maccabees' AND ev.chapter_number=2 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '4-maccabees-2-the-law-overrules-greed',
       E'The Law overrules greed — debt-release and gleaning for the poor',
       E'The Law does not merely restrain lust; it reaches into the purse. The writer argues that the Torah teaches even the miser and the grasping man to act against their nature: *as soon as a man orders his life according to the Law, if he is miserly he acts contrary to his nature, and lends money to the needy without interest, and at the seventh-year periods cancels the debt* (4 Maccabees 2:8), and *if he is parsimonious, he is overruled by the Law... and refrains from gleaning his stubbles or picking the last grapes from his vineyards* (4 Maccabees 2:9). It ain''t new: the seventh-year release is Moses'' own statute — *At the end of every seven years thou shalt make a release* (Deuteronomy 15:1), *Every creditor that lendeth ought unto his neighbour shall release it... because it is called the LORD''S release* (Deuteronomy 15:2). And the law of the corner and the gleanings is from Sinai — *thou shalt not wholly reap the corners of thy field, neither shalt thou gather the gleanings of thy harvest* (Leviticus 19:9), *thou shalt not glean thy vineyard, neither shalt thou gather every grape of thy vineyard; thou shalt leave them for the poor and stranger* (Leviticus 19:10), which Moses applies to the forgotten sheaf and the olive boughs — *it shall be for the stranger, for the fatherless, and for the widow* (Deuteronomy 24:19). The Torah''s mastery over greed is the oldest charity there is — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 91028
  FROM _session414_4macc02_lookup sv, _session414_4macc02_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=2 AND sv.verse_number=7
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='4-maccabees' AND ev.chapter_number=2 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '4-maccabees-2-the-law-governs-anger',
       E'The Law governs anger — Moses at Dathan and Abiram, Jacob over Simeon and Levi',
       E'Reason ruling through the Law masters even rage. The writer reaches for two examples from Moses'' own books: *Moses when he was angered against Dathan and Abiram did not give free course to his wrath, but governed his anger by his Reason* (4 Maccabees 2:17), and *our wise father Jacob blame[d] the houses of Simeon and Levi for their unreasoning slaughter of the tribe of the Shechemites, saying, ''Accursed be their anger!''* (4 Maccabees 2:19-20). It ain''t new: when Dathan and Abiram rose against him, Moses ruled his spirit — *And they rose up before Moses... two hundred and fifty princes of the assembly* (Numbers 16:2); the defiant *We will not come up* (Numbers 16:12) did not provoke unbridled wrath but a governed appeal to Yahuah. And Jacob''s curse on his sons'' fury is in his blessing — *Simeon and Levi are brethren; instruments of cruelty are in their habitations* (Genesis 49:5), *Cursed be their anger, for it was fierce; and their wrath, for it was cruel* (Genesis 49:7) — for *Simeon and Levi... slew all the males* of Shechem (Genesis 34:25). The Torah-trained reason that restrains rage is the patriarchs'' own discipline — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 91031
  FROM _session414_4macc02_lookup sv, _session414_4macc02_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=2 AND sv.verse_number=16
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='4-maccabees' AND ev.chapter_number=2 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '4-maccabees-2-passions-and-law-given-at-creation',
       E'Elohim implanted the passions and gave the Law at creation',
       E'The chapter closes at the root of the whole argument: the Creator who made the passions also gave the Law to govern them. *For in the day when Elohim (God) created man, he implanted in him his passions and inclinations* (4 Maccabees 2:21), *and also, at the very same time, set the mind on a throne amidst the senses to be his sacred guide in all things; and to the mind he gave the Law, by the which if a man order himself, he shall reign over a kingdom that is temperate, and just, and virtuous, and brave* (4 Maccabees 2:22-23). The passions are not evil to be killed but a trust to be ruled — by the Law given with them at creation. It ain''t new: man is the Creator''s own forming — *And Yahuah Elohim (the LORD God) formed man of the dust of the ground, and breathed into his nostrils the breath of life; and man became a living soul* (Genesis 2:7) — and set in the garden under command — *And Yahuah Elohim (the LORD God) planted a garden eastward in Eden; and there he put the man whom he had formed* (Genesis 2:8). The same Lawgiver who made the heart set life and death before it — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life* (Deuteronomy 30:19). The Law is the Creator''s gift to the creature he formed — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 91034
  FROM _session414_4macc02_lookup sv, _session414_4macc02_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=2 AND sv.verse_number=21
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='4-maccabees' AND ev.chapter_number=2 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 4-maccabees-2-joseph-and-the-tenth-word
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 39:7 — *And it came to pass after these things, that his master''s wife cast her eyes upon Joseph; and she said, Lie with me.* This is the very temptation the "virtuous Joseph" checked by his Reason.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc02_lookup sv, _session414_4macc02_lookup tv
 WHERE t.slug='4-maccabees-2-joseph-and-the-tenth-word'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=2 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=39 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 39:9 — *There is none greater in this house than I; neither hath he kept back any thing from me but thee, because thou art his wife: how then can I do this great wickedness, and sin against Elohim (God)?* Joseph''s refusal — "sin against Elohim" — is the carnal impulse quenched at the age "when physical desire is strong."'
  FROM cross_reference_threads t, cross_references x, _session414_4macc02_lookup sv, _session414_4macc02_lookup tv
 WHERE t.slug='4-maccabees-2-joseph-and-the-tenth-word'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=2 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=39 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 39:12 — *And she caught him by his garment, saying, Lie with me: and he left his garment in her hand, and fled, and got him out.* Joseph fleeing the temptation is the deed 4 Maccabees praises as Reason mastering the passion.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc02_lookup sv, _session414_4macc02_lookup tv
 WHERE t.slug='4-maccabees-2-joseph-and-the-tenth-word'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=2 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=39 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Exodus 20:17 — *Thou shalt not covet thy neighbour''s house, thou shalt not covet thy neighbour''s wife, nor his manservant, nor his maidservant, nor his ox, nor his ass, nor any thing that is thy neighbour''s.* This is the Tenth Word the writer quotes verbatim as the Law that schools Reason to control covetous desire.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc02_lookup sv, _session414_4macc02_lookup tv
 WHERE t.slug='4-maccabees-2-joseph-and-the-tenth-word'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=2 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Deuteronomy 5:21 — *Neither shalt thou desire thy neighbour''s wife, neither shalt thou covet thy neighbour''s house, his field, or his manservant, or his maidservant, his ox, or his ass, or any thing that is thy neighbour''s.* Moses'' second giving of the Tenth Word is the same command 4 Maccabees cites — "when the Law orders us not to covet."'
  FROM cross_reference_threads t, cross_references x, _session414_4macc02_lookup sv, _session414_4macc02_lookup tv
 WHERE t.slug='4-maccabees-2-joseph-and-the-tenth-word'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=2 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=5 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 4-maccabees-2-the-law-overrules-greed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 15:1 — *At the end of every seven years thou shalt make a release.* The "seventh-year periods" at which a man "cancels the debt" is this very statute of release.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc02_lookup sv, _session414_4macc02_lookup tv
 WHERE t.slug='4-maccabees-2-the-law-overrules-greed'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=2 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=15 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 15:2 — *And this is the manner of the release: Every creditor that lendeth ought unto his neighbour shall release it; he shall not exact it of his neighbour, or of his brother; because it is called the LORD''S release.* The miser "overruled by the Law" to lend without interest and cancel the debt is keeping the Lord''s release.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc02_lookup sv, _session414_4macc02_lookup tv
 WHERE t.slug='4-maccabees-2-the-law-overrules-greed'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=2 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=15 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 19:9 — *And when ye reap the harvest of your land, thou shalt not wholly reap the corners of thy field, neither shalt thou gather the gleanings of thy harvest.* To "refrain from gleaning his stubbles" is to obey the law of the corners and the gleanings left for the poor.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc02_lookup sv, _session414_4macc02_lookup tv
 WHERE t.slug='4-maccabees-2-the-law-overrules-greed'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=2 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Leviticus 19:10 — *And thou shalt not glean thy vineyard, neither shalt thou gather every grape of thy vineyard; thou shalt leave them for the poor and stranger: I am Yahuah Elohaychem (the LORD your God).* The parsimonious man who refrains from "picking the last grapes from his vineyards" is keeping this command for the poor and stranger.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc02_lookup sv, _session414_4macc02_lookup tv
 WHERE t.slug='4-maccabees-2-the-law-overrules-greed'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=2 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Deuteronomy 24:19 — *When thou cuttest down thine harvest in thy field, and hast forgot a sheaf in the field, thou shalt not go again to fetch it: it shall be for the stranger, for the fatherless, and for the widow: that Yahuah Elohayka (the LORD thy God) may bless thee in all the work of thine hands.* Moses'' law of the forgotten sheaf is the same harvest-charity the Law presses on the grasping man through Reason.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc02_lookup sv, _session414_4macc02_lookup tv
 WHERE t.slug='4-maccabees-2-the-law-overrules-greed'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=2 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=24 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 4-maccabees-2-the-law-governs-anger
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 16:2 — *And they rose up before Moses, with certain of the children of Yashar''el (Israel), two hundred and fifty princes of the assembly, famous in the congregation, men of renown.* This rising against Moses is the occasion at which he "governed his anger by his Reason" rather than giving free course to wrath.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc02_lookup sv, _session414_4macc02_lookup tv
 WHERE t.slug='4-maccabees-2-the-law-governs-anger'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=2 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=16 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 16:12 — *And Moses sent to call Dathan and Abiram, the sons of Eliab: which said, We will not come up.* Their open defiance is precisely the provocation Moses met by governing his anger, not by surrendering to it.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc02_lookup sv, _session414_4macc02_lookup tv
 WHERE t.slug='4-maccabees-2-the-law-governs-anger'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=2 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=16 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 49:5 — *Simeon and Levi are brethren; instruments of cruelty are in their habitations.* This is the censure 4 Maccabees recalls as Jacob blaming the houses of Simeon and Levi.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc02_lookup sv, _session414_4macc02_lookup tv
 WHERE t.slug='4-maccabees-2-the-law-governs-anger'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=2 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 49:7 — *Cursed be their anger, for it was fierce; and their wrath, for it was cruel: I will divide them in Jacob, and scatter them in Yashar''el (Israel).* This is the very curse the writer quotes — "Accursed be their anger!" — proof that unreasoning rage is condemned by the Law.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc02_lookup sv, _session414_4macc02_lookup tv
 WHERE t.slug='4-maccabees-2-the-law-governs-anger'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=2 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Genesis 34:25 — *And it came to pass on the third day, when they were sore, that two of the sons of Jacob, Simeon and Levi, Dinah''s brethren, took each man his sword, and came upon the city boldly, and slew all the males.* The "unreasoning slaughter of the tribe of the Shechemites" is this deed Jacob''s curse condemns.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc02_lookup sv, _session414_4macc02_lookup tv
 WHERE t.slug='4-maccabees-2-the-law-governs-anger'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=2 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=34 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 4-maccabees-2-passions-and-law-given-at-creation
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:7 — *And Yahuah Elohim (the LORD God) formed man of the dust of the ground, and breathed into his nostrils the breath of life; and man became a living soul.* "The day when Elohim created man" and "implanted in him his passions" is the very forming Moses records.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc02_lookup sv, _session414_4macc02_lookup tv
 WHERE t.slug='4-maccabees-2-passions-and-law-given-at-creation'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=2 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 2:8 — *And Yahuah Elohim (the LORD God) planted a garden eastward in Eden; and there he put the man whom he had formed.* The Creator who "set the mind on a throne... to be his sacred guide" placed the man he formed under his charge in Eden.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc02_lookup sv, _session414_4macc02_lookup tv
 WHERE t.slug='4-maccabees-2-passions-and-law-given-at-creation'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=2 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 30:19 — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live.* The Law "given to the mind" so a man may reign over a temperate and just kingdom is the choice of life Moses sets before Israel.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc02_lookup sv, _session414_4macc02_lookup tv
 WHERE t.slug='4-maccabees-2-passions-and-law-given-at-creation'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=2 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_4maccabees_03.sql (session414 4-maccabees 3) -----
-- Source anchor: pseudepigrapha/4-maccabees ch3. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 4macc03 (view _session414_4macc03_lookup). Sort band base 91050, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session414_4macc03_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 4-maccabees-3-davids-thirst-poured-out
  ('pseudepigrapha', '4-maccabees', 3, 12, 'canon', '2-samuel', 23, 16, 'free', E'2 Samuel 23:16 — *the three mighty men brake through the host of the Philistines, and drew water out of the well of Beth-lehem... and brought it to David: nevertheless he would not drink thereof, but poured it out unto Yahuah (LORD)* — the very deed the writer cites of the two warriors and the poured-out draught.'),
  ('pseudepigrapha', '4-maccabees', 3, 15, 'canon', '2-samuel', 23, 17, 'free', E'2 Samuel 23:17 — *is not this the blood of the men that went in jeopardy of their lives? therefore he would not drink it* — David reckoning the water as blood, the danger to his soul that bridled his desire.'),
  ('pseudepigrapha', '4-maccabees', 3, 10, 'canon', '2-samuel', 23, 15, 'free', E'2 Samuel 23:15 — *And David longed, and said, Oh that one would give me drink of the water of the well of Beth-lehem, which is by the gate!* — the intense thirst and irrational craving the king could not slake.'),
  ('pseudepigrapha', '4-maccabees', 3, 17, 'canon', '1-chronicles', 11, 18, 'free', E'1 Chronicles 11:18 — *David would not drink of it, but poured it out to Yahuah (LORD)* — the Chronicler''s parallel witness to the offering poured out rather than drunk.'),
  ('pseudepigrapha', '4-maccabees', 3, 15, 'canon', '1-chronicles', 11, 19, 'free', E'1 Chronicles 11:19 — *shall I drink the blood of these men that have put their lives in jeopardy?... Therefore he would not drink it* — the same reasoning that the temperate mind opposed to the burning desire.'),
  -- thread: 4-maccabees-3-reason-the-antagonist-of-the-passions
  ('pseudepigrapha', '4-maccabees', 3, 5, 'canon', 'proverbs', 16, 32, 'free', E'Proverbs 16:32 — *He that is slow to anger is better than the mighty; and he that ruleth his spirit than he that taketh a city* — Reason as the antagonist that masters anger and desire.'),
  ('pseudepigrapha', '4-maccabees', 3, 2, 'canon', 'psalms', 19, 7, 'free', E'Psalm 19:7 — *The law of Yahuah (LORD) is perfect, converting the soul: the testimony of Yahuah (LORD) is sure, making wise the simple* — the Law is the culture in which Reason becomes master over the passions of the body.'),
  ('pseudepigrapha', '4-maccabees', 3, 4, 'canon', 'psalms', 19, 11, 'free', E'Psalm 19:11 — *Moreover by them is thy servant warned: and in keeping of them there is great reward* — the Torah-disciplined mind that wrestles victoriously against the swaying of malevolence.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session414_4macc03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session414_4macc03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '4-maccabees-3-davids-thirst-poured-out',
       E'David''s thirst, and the water poured out as an offering',
       E'To show that Reason controls but does not extirpate desire, the writer sets forth *the case of the thirst of King David.* Burning with *an intense thirst,* David craved the water held by the enemy, and two mighty warriors *scaled the enemy''s ramparts* and *drew from it a draught for the king.* But David, judging the draught *reckoned as equivalent to blood* to be *a grievous danger to his soul,* and *opposing his Reason to his desire, he poured out the water as an offering to Elohim.* The Torah-trained mind masters the appetite without destroying it. It ain''t new — Samuel and the Chronicler record the very deed: the three mighty men broke through the host, and David *would not drink thereof, but poured it out unto Yahuah,* saying *is not this the blood of the men that went in jeopardy of their lives?*',
       sv.verse_id, ev.verse_id, 'extras', 91050
  FROM _session414_4macc03_lookup sv, _session414_4macc03_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=3 AND sv.verse_number=6
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='4-maccabees' AND ev.chapter_number=3 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '4-maccabees-3-reason-the-antagonist-of-the-passions',
       E'Reason rules the appetite — the antagonist of the passions',
       E'The writer grants that *none of you is able to extirpate our natural desire,* nor anger, nor a malevolent disposition — but *Reason is not the extirpator of the passions, but their antagonist,* able to *quench the fires of desire, and to wrestle victoriously with the pangs of our bodies.* This is the Torah-trained mind ruling the appetite, not Stoic autonomy. It ain''t new — Solomon weighed *he that ruleth his spirit* above *he that taketh a city,* and David sang that *the law of Yahuah is perfect, converting the soul.*',
       sv.verse_id, ev.verse_id, 'extras', 91053
  FROM _session414_4macc03_lookup sv, _session414_4macc03_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=3 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='4-maccabees' AND ev.chapter_number=3 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 4-maccabees-3-davids-thirst-poured-out
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Samuel 23:16 — *the three mighty men brake through the host of the Philistines, and drew water out of the well of Beth-lehem... and brought it to David: nevertheless he would not drink thereof, but poured it out unto Yahuah (LORD)* — the very deed the writer cites of the two warriors and the poured-out draught.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc03_lookup sv, _session414_4macc03_lookup tv
 WHERE t.slug='4-maccabees-3-davids-thirst-poured-out'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=3 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=23 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Samuel 23:17 — *is not this the blood of the men that went in jeopardy of their lives? therefore he would not drink it* — David reckoning the water as blood, the danger to his soul that bridled his desire.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc03_lookup sv, _session414_4macc03_lookup tv
 WHERE t.slug='4-maccabees-3-davids-thirst-poured-out'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=3 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=23 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Samuel 23:15 — *And David longed, and said, Oh that one would give me drink of the water of the well of Beth-lehem, which is by the gate!* — the intense thirst and irrational craving the king could not slake.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc03_lookup sv, _session414_4macc03_lookup tv
 WHERE t.slug='4-maccabees-3-davids-thirst-poured-out'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=3 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=23 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Chronicles 11:18 — *David would not drink of it, but poured it out to Yahuah (LORD)* — the Chronicler''s parallel witness to the offering poured out rather than drunk.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc03_lookup sv, _session414_4macc03_lookup tv
 WHERE t.slug='4-maccabees-3-davids-thirst-poured-out'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=3 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=11 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Chronicles 11:19 — *shall I drink the blood of these men that have put their lives in jeopardy?... Therefore he would not drink it* — the same reasoning that the temperate mind opposed to the burning desire.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc03_lookup sv, _session414_4macc03_lookup tv
 WHERE t.slug='4-maccabees-3-davids-thirst-poured-out'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=3 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=11 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 4-maccabees-3-reason-the-antagonist-of-the-passions
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 16:32 — *He that is slow to anger is better than the mighty; and he that ruleth his spirit than he that taketh a city* — Reason as the antagonist that masters anger and desire.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc03_lookup sv, _session414_4macc03_lookup tv
 WHERE t.slug='4-maccabees-3-reason-the-antagonist-of-the-passions'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=3 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=16 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 19:7 — *The law of Yahuah (LORD) is perfect, converting the soul: the testimony of Yahuah (LORD) is sure, making wise the simple* — the Law is the culture in which Reason becomes master over the passions of the body.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc03_lookup sv, _session414_4macc03_lookup tv
 WHERE t.slug='4-maccabees-3-reason-the-antagonist-of-the-passions'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=3 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 19:11 — *Moreover by them is thy servant warned: and in keeping of them there is great reward* — the Torah-disciplined mind that wrestles victoriously against the swaying of malevolence.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc03_lookup sv, _session414_4macc03_lookup tv
 WHERE t.slug='4-maccabees-3-reason-the-antagonist-of-the-passions'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=3 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_4maccabees_04.sql (session414 4-maccabees 4) -----
-- Source anchor: pseudepigrapha/4-maccabees ch4. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 4macc04 (view _session414_4macc04_lookup). Sort band base 91075, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session414_4macc04_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 4-maccabees-4-apollonius-and-the-temple-treasury
  ('pseudepigrapha', '4-maccabees', 4, 3, 'apocrypha', '2-maccabees', 3, 6, 'free', E'2 Maccabees 3:6 — *And told him that the treasury in Jerusalem was full of infinite sums of money, so that the multitude of their riches, which did not pertain to the account of the sacrifices, was innumerable, and that it was possible to bring all into the king''s hand.* The sibling book records the identical boast of the temple treasury that sets the raid in motion.'),
  ('pseudepigrapha', '4-maccabees', 4, 4, 'apocrypha', '2-maccabees', 3, 7, 'free', E'2 Maccabees 3:7 — *Now when Apollonius came to the king, and had shewed him of the money of which he was told, the king chose out Heliodorus his treasurer, and sent him with a commandment to bring him the foresaid money.* The same Apollonius carries word to the king and the royal agent is dispatched to seize the deposits.'),
  ('pseudepigrapha', '4-maccabees', 4, 9, 'apocrypha', '2-maccabees', 3, 15, 'free', E'2 Maccabees 3:15 — *But the priests, prostrating themselves before the altar in their priests'' vestments, called to heaven upon him that made a law concerning things given to be kept, that they should safely be preserved for such as had committed them to be kept.* As in 4 Maccabees the priests, women, and children besought Elohim, here the priests prostrate and cry to heaven over the same violated trust.'),
  ('pseudepigrapha', '4-maccabees', 4, 10, 'apocrypha', '2-maccabees', 3, 25, 'free', E'2 Maccabees 3:25 — *For there appeared to them an horse with a terrible rider upon him, and adorned with a very fair covering, and he ran fiercely, and struck at Heliodorus with his forefeet, and it seemed that he that sat upon the horse had complete harness of gold.* The heavenly horsemen flashing from heaven who terrify the raiders are the same apparition the sibling book describes striking the king''s man down.'),
  ('pseudepigrapha', '4-maccabees', 4, 11, 'apocrypha', '2-maccabees', 3, 29, 'free', E'2 Maccabees 3:29 — *For he by the hand of Yahuah (God) was cast down, and lay speechless without all hope of life.* Apollonius fallen half-dead with hands stretched to heaven matches the king''s agent cast down speechless by the hand of Elohim.'),
  ('pseudepigrapha', '4-maccabees', 4, 13, 'apocrypha', '2-maccabees', 3, 33, 'free', E'2 Maccabees 3:33 — *Now as the high priest was making an atonement, the same young men in the same clothing appeared and stood beside Heliodorus, saying, Give Onias the high priest great thanks, insomuch as for his sake Yahuah (God) has granted you life.* Onias the high priest interceding so the spoiler is granted his life is the same mercy the sibling book records at the same altar.'),
  -- thread: 4-maccabees-4-antiochus-the-vile-king
  ('pseudepigrapha', '4-maccabees', 4, 15, 'canon', 'daniel', 11, 21, 'free', E'Daniel 11:21 — *And in his estate shall stand up a vile person, to whom they shall not give the honour of the kingdom: but he shall come in peaceably, and obtain the kingdom by flatteries.* The overweening Antiochus who succeeds Seleucus is the vile person Daniel foresaw seizing the kingdom by flattery.'),
  ('pseudepigrapha', '4-maccabees', 4, 16, 'canon', 'daniel', 11, 22, 'free', E'Daniel 11:22 — *And with the arms of a flood shall they be overflown from before him, and shall be broken; yea, also the prince of the covenant.* Antiochus deposing Onias the high priest answers Daniel''s breaking of the prince of the covenant.'),
  ('pseudepigrapha', '4-maccabees', 4, 20, 'canon', 'daniel', 11, 31, 'free', E'Daniel 11:31 — *And arms shall stand on his part, and they shall pollute the sanctuary of strength, and shall take away the daily sacrifice, and they shall place the abomination that maketh desolate.* The king who abolishes the service of the temple is Daniel''s profaner of the sanctuary who takes away the daily sacrifice.'),
  ('pseudepigrapha', '4-maccabees', 4, 23, 'canon', 'daniel', 11, 32, 'free', E'Daniel 11:32 — *And such as do wickedly against the covenant shall he corrupt by flatteries: but the people that do know their Elohim (God) shall be strong, and do exploits.* The death-decree against living after the Law and the people''s constancy under it are Daniel''s covenant-breakers corrupted while the faithful stay strong.'),
  ('pseudepigrapha', '4-maccabees', 4, 23, 'canon', 'daniel', 11, 33, 'free', E'Daniel 11:33 — *And they that understand among the people shall instruct many: yet they shall fall by the sword, and by flame, by captivity, and by spoil, many days.* The martyrdoms this whole book will recount are the falling by sword and flame Daniel foretold of the wise under this king.'),
  -- thread: 4-maccabees-4-the-persecution-begins
  ('pseudepigrapha', '4-maccabees', 4, 22, 'apocrypha', '1-maccabees', 1, 20, 'free', E'1 Maccabees 1:20 — *And after that Antiochus had struck Egypt, he returned again in the hundred forty and third year, and went up against Yashar''el (Israel) and Jerusalem with a great multitude.* The same return from Egypt and march on Jerusalem that 4 Maccabees compresses into Antiochus marching back against the city.'),
  ('pseudepigrapha', '4-maccabees', 4, 23, 'apocrypha', '1-maccabees', 1, 50, 'free', E'1 Maccabees 1:50 — *And whoever would not do according to the commandment of the king, he said, he should die.* The death-penalty decree against living after the Law of the fathers is the king''s edict the sibling book records.'),
  ('pseudepigrapha', '4-maccabees', 4, 25, 'apocrypha', '1-maccabees', 1, 60, 'free', E'1 Maccabees 1:60 — *At which time according to the commandment they put to death certain women, that had caused their children to be circumcised.* The women flung from the rocks for circumcising their sons are the same mothers slain for the covenant in the sibling chronicle.'),
  ('pseudepigrapha', '4-maccabees', 4, 26, 'apocrypha', '1-maccabees', 1, 62, 'free', E'1 Maccabees 1:62 — *Howbeit many in Yashar''el (Israel) were fully resolved and confirmed in themselves not to eat any unclean thing.* The men tortured to eat unclean meats answer the many resolved not to eat any unclean thing — the dietary law of Leviticus standing under threat of death.'),
  ('pseudepigrapha', '4-maccabees', 4, 23, 'apocrypha', '2-maccabees', 5, 11, 'free', E'2 Maccabees 5:11 — *Now when this that was done came to the king''s ear, he thought that Judea had revolted: whereupon removing out of Egypt in a furious mind, he took the city by force of arms.* The plundering of the city before the decrees is the same furious return from Egypt and storming of Jerusalem the other sibling book records.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session414_4macc04_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session414_4macc04_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '4-maccabees-4-apollonius-and-the-temple-treasury',
       E'Apollonius at the treasury — angels guard the Holy Place',
       E'A traitorous Simon informs the governor Apollonius that the Jerusalem treasury holds *many thousands of private deposits, not belonging to the temple account, and rightfully the property of King Seleucus* (4 Maccabees 4:3); Apollonius marches in to seize the moneys, but *there appeared from heaven angels, riding upon horses, with lightning flashing from their arms, and cast great fear and trembling upon them* (4 Maccabees 4:10), and he falls down half-dead and entreats the Hebrews to intercede for him. This is the very episode the sibling book tells: Simon''s quarrel with the high priest, the boast of the treasury, the king''s man sent to take the money, the priests'' prayer, and the dread horseman from heaven who strikes him down. The deliverer-by-intercession even survives because the high priest pleads for him. It ain''t new — the same hand that *defendeth* the place and *beateth and destroys them that come to hurt it* (2 Maccabees 3:39) turned back the spoiler in both tellings.',
       sv.verse_id, ev.verse_id, 'extras', 91075
  FROM _session414_4macc04_lookup sv, _session414_4macc04_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=4 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='4-maccabees' AND ev.chapter_number=4 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '4-maccabees-4-antiochus-the-vile-king',
       E'Antiochus Epiphanes — the vile king who profanes the sanctuary',
       E'Seleucus dies and his successor is *his son Antiochus Epiphanes, an overweening terrible man* (4 Maccabees 4:15), who sells the high-priesthood, lays a gymnasium on the holy Mount, *abolished the service of the temple* (4 Maccabees 4:20), and *made a decree denouncing the penalty of death upon any who should be seen to live after the Law of our fathers* (4 Maccabees 4:23). Daniel had already drawn this king to the life: a *vile person* who comes in *by flatteries*, sets his heart *against the holy covenant*, pollutes the sanctuary, takes away the daily sacrifice, and corrupts the lawless *by flatteries* — yet the people who know their Elohim stay strong. It ain''t new — the persecutor of 4 Maccabees is the very horn Daniel saw rise to *speak marvellous things against the Elohim of gods* (Daniel 11:36) before he comes to his end.',
       sv.verse_id, ev.verse_id, 'extras', 91078
  FROM _session414_4macc04_lookup sv, _session414_4macc04_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=4 AND sv.verse_number=15
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='4-maccabees' AND ev.chapter_number=4 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '4-maccabees-4-the-persecution-begins',
       E'The persecution begins — circumcision, the Law, and unclean meats',
       E'Antiochus plunders the city and turns to break the people: women *for circumcising their sons... were flung, together with their offspring, headlong from the rocks* (4 Maccabees 4:25), and he *personally tried to force by tortures each man separately to eat unclean meats and thus abjure the Yahudi (Jewish) religion* (4 Maccabees 4:26). Both sibling books tell the same assault: he comes up against Jerusalem with a great multitude after striking Egypt, plunders the sanctuary, decrees that all leave the Law, slays the women who circumcised their children, and would compel them to *eat swine''s flesh, and unclean beasts*. The martyrs who fill the rest of 4 Maccabees die rather than defile themselves with forbidden food — the Creator''s dietary law standing firm. It ain''t new — the very crisis was already chronicled, and Israel *chose rather to die, that they might not be defiled with meats* (1 Maccabees 1:63).',
       sv.verse_id, ev.verse_id, 'extras', 91081
  FROM _session414_4macc04_lookup sv, _session414_4macc04_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=4 AND sv.verse_number=22
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='4-maccabees' AND ev.chapter_number=4 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 4-maccabees-4-apollonius-and-the-temple-treasury
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Maccabees 3:6 — *And told him that the treasury in Jerusalem was full of infinite sums of money, so that the multitude of their riches, which did not pertain to the account of the sacrifices, was innumerable, and that it was possible to bring all into the king''s hand.* The sibling book records the identical boast of the temple treasury that sets the raid in motion.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc04_lookup sv, _session414_4macc04_lookup tv
 WHERE t.slug='4-maccabees-4-apollonius-and-the-temple-treasury'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=4 AND sv.verse_number=3
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=3 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Maccabees 3:7 — *Now when Apollonius came to the king, and had shewed him of the money of which he was told, the king chose out Heliodorus his treasurer, and sent him with a commandment to bring him the foresaid money.* The same Apollonius carries word to the king and the royal agent is dispatched to seize the deposits.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc04_lookup sv, _session414_4macc04_lookup tv
 WHERE t.slug='4-maccabees-4-apollonius-and-the-temple-treasury'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=4 AND sv.verse_number=4
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=3 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Maccabees 3:15 — *But the priests, prostrating themselves before the altar in their priests'' vestments, called to heaven upon him that made a law concerning things given to be kept, that they should safely be preserved for such as had committed them to be kept.* As in 4 Maccabees the priests, women, and children besought Elohim, here the priests prostrate and cry to heaven over the same violated trust.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc04_lookup sv, _session414_4macc04_lookup tv
 WHERE t.slug='4-maccabees-4-apollonius-and-the-temple-treasury'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=4 AND sv.verse_number=9
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Maccabees 3:25 — *For there appeared to them an horse with a terrible rider upon him, and adorned with a very fair covering, and he ran fiercely, and struck at Heliodorus with his forefeet, and it seemed that he that sat upon the horse had complete harness of gold.* The heavenly horsemen flashing from heaven who terrify the raiders are the same apparition the sibling book describes striking the king''s man down.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc04_lookup sv, _session414_4macc04_lookup tv
 WHERE t.slug='4-maccabees-4-apollonius-and-the-temple-treasury'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=4 AND sv.verse_number=10
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=3 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'2 Maccabees 3:29 — *For he by the hand of Yahuah (God) was cast down, and lay speechless without all hope of life.* Apollonius fallen half-dead with hands stretched to heaven matches the king''s agent cast down speechless by the hand of Elohim.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc04_lookup sv, _session414_4macc04_lookup tv
 WHERE t.slug='4-maccabees-4-apollonius-and-the-temple-treasury'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=4 AND sv.verse_number=11
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=3 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'2 Maccabees 3:33 — *Now as the high priest was making an atonement, the same young men in the same clothing appeared and stood beside Heliodorus, saying, Give Onias the high priest great thanks, insomuch as for his sake Yahuah (God) has granted you life.* Onias the high priest interceding so the spoiler is granted his life is the same mercy the sibling book records at the same altar.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc04_lookup sv, _session414_4macc04_lookup tv
 WHERE t.slug='4-maccabees-4-apollonius-and-the-temple-treasury'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=4 AND sv.verse_number=13
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=3 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 4-maccabees-4-antiochus-the-vile-king
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 11:21 — *And in his estate shall stand up a vile person, to whom they shall not give the honour of the kingdom: but he shall come in peaceably, and obtain the kingdom by flatteries.* The overweening Antiochus who succeeds Seleucus is the vile person Daniel foresaw seizing the kingdom by flattery.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc04_lookup sv, _session414_4macc04_lookup tv
 WHERE t.slug='4-maccabees-4-antiochus-the-vile-king'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=4 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=11 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 11:22 — *And with the arms of a flood shall they be overflown from before him, and shall be broken; yea, also the prince of the covenant.* Antiochus deposing Onias the high priest answers Daniel''s breaking of the prince of the covenant.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc04_lookup sv, _session414_4macc04_lookup tv
 WHERE t.slug='4-maccabees-4-antiochus-the-vile-king'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=4 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=11 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 11:31 — *And arms shall stand on his part, and they shall pollute the sanctuary of strength, and shall take away the daily sacrifice, and they shall place the abomination that maketh desolate.* The king who abolishes the service of the temple is Daniel''s profaner of the sanctuary who takes away the daily sacrifice.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc04_lookup sv, _session414_4macc04_lookup tv
 WHERE t.slug='4-maccabees-4-antiochus-the-vile-king'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=4 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=11 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Daniel 11:32 — *And such as do wickedly against the covenant shall he corrupt by flatteries: but the people that do know their Elohim (God) shall be strong, and do exploits.* The death-decree against living after the Law and the people''s constancy under it are Daniel''s covenant-breakers corrupted while the faithful stay strong.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc04_lookup sv, _session414_4macc04_lookup tv
 WHERE t.slug='4-maccabees-4-antiochus-the-vile-king'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=4 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=11 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Daniel 11:33 — *And they that understand among the people shall instruct many: yet they shall fall by the sword, and by flame, by captivity, and by spoil, many days.* The martyrdoms this whole book will recount are the falling by sword and flame Daniel foretold of the wise under this king.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc04_lookup sv, _session414_4macc04_lookup tv
 WHERE t.slug='4-maccabees-4-antiochus-the-vile-king'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=4 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=11 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 4-maccabees-4-the-persecution-begins
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Maccabees 1:20 — *And after that Antiochus had struck Egypt, he returned again in the hundred forty and third year, and went up against Yashar''el (Israel) and Jerusalem with a great multitude.* The same return from Egypt and march on Jerusalem that 4 Maccabees compresses into Antiochus marching back against the city.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc04_lookup sv, _session414_4macc04_lookup tv
 WHERE t.slug='4-maccabees-4-the-persecution-begins'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=4 AND sv.verse_number=22
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=1 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Maccabees 1:50 — *And whoever would not do according to the commandment of the king, he said, he should die.* The death-penalty decree against living after the Law of the fathers is the king''s edict the sibling book records.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc04_lookup sv, _session414_4macc04_lookup tv
 WHERE t.slug='4-maccabees-4-the-persecution-begins'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=4 AND sv.verse_number=23
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=1 AND tv.verse_number=50
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Maccabees 1:60 — *At which time according to the commandment they put to death certain women, that had caused their children to be circumcised.* The women flung from the rocks for circumcising their sons are the same mothers slain for the covenant in the sibling chronicle.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc04_lookup sv, _session414_4macc04_lookup tv
 WHERE t.slug='4-maccabees-4-the-persecution-begins'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=4 AND sv.verse_number=25
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=1 AND tv.verse_number=60
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Maccabees 1:62 — *Howbeit many in Yashar''el (Israel) were fully resolved and confirmed in themselves not to eat any unclean thing.* The men tortured to eat unclean meats answer the many resolved not to eat any unclean thing — the dietary law of Leviticus standing under threat of death.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc04_lookup sv, _session414_4macc04_lookup tv
 WHERE t.slug='4-maccabees-4-the-persecution-begins'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=4 AND sv.verse_number=26
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=1 AND tv.verse_number=62
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'2 Maccabees 5:11 — *Now when this that was done came to the king''s ear, he thought that Judea had revolted: whereupon removing out of Egypt in a furious mind, he took the city by force of arms.* The plundering of the city before the decrees is the same furious return from Egypt and storming of Jerusalem the other sibling book records.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc04_lookup sv, _session414_4macc04_lookup tv
 WHERE t.slug='4-maccabees-4-the-persecution-begins'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=4 AND sv.verse_number=23
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=5 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_4maccabees_05.sql (session414 4-maccabees 5) -----
-- Source anchor: pseudepigrapha/4-maccabees ch5. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 4macc05 (view _session414_4macc05_lookup). Sort band base 91100, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session414_4macc05_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 4-maccabees-5-the-divine-law-the-law-of-our-country
  ('pseudepigrapha', '4-maccabees', 5, 16, 'canon', 'deuteronomy', 30, 11, 'free', E'Deuteronomy 30:11 — *For this commandment which I command thee this day, it is not hidden from thee, neither is it far off* — the Law made the Law of the people, the obedience Eleazar will not put off.'),
  ('pseudepigrapha', '4-maccabees', 5, 17, 'canon', 'deuteronomy', 30, 14, 'free', E'Deuteronomy 30:14 — *But the word is very nigh unto thee, in thy mouth, and in thy heart, that thou mayest do it* — the doable, owned Law that Eleazar deems it right never to transgress.'),
  ('pseudepigrapha', '4-maccabees', 5, 16, 'canon', 'deuteronomy', 30, 20, 'free', E'Deuteronomy 30:20 — *that thou mayest love Yahuah Elohayka (the LORD thy God)... for he is thy life, and the length of thy days* — the Law held as life itself, the necessity Eleazar owns above all.'),
  ('pseudepigrapha', '4-maccabees', 5, 21, 'canon', 'psalms', 19, 7, 'free', E'Psalm 19:7 — *The law of Yahuah (LORD) is perfect, converting the soul: the testimony of Yahuah (LORD) is sure, making wise the simple* — the perfect Law that may not be despised in small things or great.'),
  ('pseudepigrapha', '4-maccabees', 5, 20, 'canon', 'james', 2, 10, 'free', E'James 2:10 — *For whosoever shall keep the whole law, and yet offend in one point, he is guilty of all* — the apostle''s echo of Eleazar''s rule that transgression in small things or great is equally heinous.'),
  -- thread: 4-maccabees-5-the-law-teaches-self-control-justice-righteousness
  ('pseudepigrapha', '4-maccabees', 5, 24, 'canon', 'deuteronomy', 10, 12, 'free', E'Deuteronomy 10:12 — *what doth Yahuah Elohayka (the LORD thy God) require of thee, but to fear Yahuah Elohayka (the LORD thy God), to walk in all his ways, and to love him, and to serve Yahuah Elohayka (the LORD thy God) with all thy heart* — the Law''s own teaching of reverent worship of the only Elohim.'),
  ('pseudepigrapha', '4-maccabees', 5, 24, 'canon', 'exodus', 20, 3, 'free', E'Exodus 20:3 — *Thou shalt have no other gods before me* — the first word of the Law, the worship of the only Elohim that Eleazar says the Law teaches.'),
  ('pseudepigrapha', '4-maccabees', 5, 23, 'canon', 'proverbs', 16, 32, 'free', E'Proverbs 16:32 — *He that is slow to anger is better than the mighty; and he that ruleth his spirit than he that taketh a city* — the self-control and mastery over the passions which Eleazar attributes to the Law''s training.'),
  ('pseudepigrapha', '4-maccabees', 5, 22, 'canon', 'romans', 7, 12, 'free', E'Romans 7:12 — *Wherefore the law is holy, and the commandment holy, and just, and good* — Paul''s verdict on the very Law that teaches self-control, justice, and righteousness, against the charge that it is contrary to reason.'),
  -- thread: 4-maccabees-5-the-creator-lawgiver-gave-the-dietary-law
  ('pseudepigrapha', '4-maccabees', 5, 26, 'canon', 'leviticus', 11, 7, 'free', E'Leviticus 11:7 — *And the swine, though he divide the hoof, and be clovenfooted, yet he cheweth not the cud; he is unclean to you* — the Creator-Lawgiver''s own statute forbidding the very flesh Eleazar refuses.'),
  ('pseudepigrapha', '4-maccabees', 5, 26, 'canon', 'leviticus', 11, 8, 'free', E'Leviticus 11:8 — *Of their flesh shall ye not eat, and their carcase shall ye not touch; they are unclean to you* — the standing prohibition that makes swine''s flesh unclean meat to the martyr.'),
  ('pseudepigrapha', '4-maccabees', 5, 25, 'canon', 'leviticus', 11, 44, 'free', E'Leviticus 11:44 — *I am Yahuah Elohaychem (the LORD your God): ye shall therefore sanctify yourselves, and ye shall be holy; for I am holy: neither shall ye defile yourselves with any manner of creeping thing* — the holiness for which the dietary law is given, that none defile himself.'),
  ('pseudepigrapha', '4-maccabees', 5, 25, 'canon', 'leviticus', 11, 45, 'free', E'Leviticus 11:45 — *For I am Yahuah (LORD) that bringeth you up out of the land of Egypt, to be your Elohim (God): ye shall therefore be holy, for I am holy* — the Maker who redeemed the people and gave the law convenient for their souls.'),
  ('pseudepigrapha', '4-maccabees', 5, 26, 'canon', 'deuteronomy', 14, 3, 'free', E'Deuteronomy 14:3 — *Thou shalt not eat any abominable thing* — Moses'' summary of the dietary law, the abomination Eleazar will not touch.'),
  ('pseudepigrapha', '4-maccabees', 5, 26, 'canon', 'deuteronomy', 14, 8, 'free', E'Deuteronomy 14:8 — *And the swine, because it divideth the hoof, yet cheweth not the cud, it is unclean unto you: ye shall not eat of their flesh, nor touch their dead carcase* — the same swine-prohibition repeated, the contrary meat the Lawgiver forbids.'),
  ('pseudepigrapha', '4-maccabees', 5, 25, 'canon', 'daniel', 1, 8, 'free', E'Daniel 1:8 — *But Daniel purposed in his heart that he would not defile himself with the portion of the king''s meat... that he might not defile himself* — the same resolve under a pagan court, refusing the king''s defiling table.'),
  ('pseudepigrapha', '4-maccabees', 5, 25, 'apocrypha', '2-maccabees', 6, 18, 'free', E'2 Maccabees 6:18 — *Eleazar, one of the principal scribes, an aged man, and of a well favoured countenance, was constrained to open his mouth, and to eat swine''s flesh* — the same Eleazar, the same swine, the sibling martyrology (self-link).'),
  ('pseudepigrapha', '4-maccabees', 5, 26, 'apocrypha', '2-maccabees', 6, 19, 'free', E'2 Maccabees 6:19 — *he, choosing rather to die gloriously, than to live stained with such an abomination, spit it forth, and came of his own accord to the torment* — Eleazar refusing the unlawful meat unto death, the same event told twice (self-link).'),
  ('pseudepigrapha', '4-maccabees', 5, 26, 'apocrypha', '2-maccabees', 6, 20, 'free', E'2 Maccabees 6:20 — *As it behoved them to come, that are resolute to stand out against such things, as are not lawful for love of life to be tasted* — what is not lawful is not to be tasted even to save life, the martyr''s exact resolve (self-link).'),
  -- thread: 4-maccabees-5-no-things-offered-to-idols
  ('pseudepigrapha', '4-maccabees', 5, 2, 'canon', 'exodus', 20, 3, 'free', E'Exodus 20:3 — *Thou shalt have no other gods before me* — the first word of the Law that forbids the idol-meat Antiochus would force upon the Hebrews.'),
  ('pseudepigrapha', '4-maccabees', 5, 2, 'canon', 'exodus', 20, 4, 'free', E'Exodus 20:4 — *Thou shalt not make unto thee any graven image, or any likeness of any thing that is in heaven above, or that is in the earth beneath* — the prohibition of idols behind which stands the ban on things offered to them.'),
  ('pseudepigrapha', '4-maccabees', 5, 3, 'canon', 'exodus', 20, 5, 'free', E'Exodus 20:5 — *Thou shalt not bow down thyself to them, nor serve them: for I Yahuah Elohayka (the LORD thy God) am a jealous Elohim (God)* — the jealous Elohim whose worship leaves no room for the idol''s defiling table.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session414_4macc05_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session414_4macc05_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '4-maccabees-5-the-divine-law-the-law-of-our-country',
       E'★ The Divine Law accepted as the Law of our country',
       E'Dragged before Antiochus and urged to the *unlawful eating of unclean meat,* the aged priest Eleazar answers for his people: *We, O Antiochus, having accepted the Divine Law as the Law of our country, do not believe any stronger necessity is laid upon us than that of our obedience to the Law.* He counts no transgression small: *the transgression of the Law, be it in small things or in great, is equally heinous; for in either case equally the Law is despised.* This is the very opposite of the law-against-grace reading — the martyr will die rather than despise one statute. It ain''t new — *the law of Yahuah is perfect, converting the soul,* and Moses set it before the people as *thy life, and the length of thy days,* the word *very nigh unto thee... that thou mayest do it.*',
       sv.verse_id, ev.verse_id, 'extras', 91100
  FROM _session414_4macc05_lookup sv, _session414_4macc05_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=5 AND sv.verse_number=14
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='4-maccabees' AND ev.chapter_number=5 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '4-maccabees-5-the-law-teaches-self-control-justice-righteousness',
       E'The Law teaches self-control, justice, and to worship the only Elohim',
       E'To the tyrant''s scoff that the Yahudi philosophy is contrary to reason, Eleazar replies: *Not so, for the Law teaches us self-control, so that we are masters of all our pleasures and desires... and it teaches justice, so that with all our various dispositions we act fairly, and it teaches righteousness, so that with due reverence we worship only the Elohim (God) who is.* The Torah-trained mind is not Stoic autonomy but discipline grounded in the Law — self-control, justice, righteousness, and the worship of the one Elohim. It ain''t new — Moses taught *what doth Yahuah thy Elohim require of thee, but to fear* him *and to love him,* the Decalogue opens *Thou shalt have no other gods before me,* and Paul testifies *the law is holy, and the commandment holy, and just, and good.*',
       sv.verse_id, ev.verse_id, 'extras', 91103
  FROM _session414_4macc05_lookup sv, _session414_4macc05_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=5 AND sv.verse_number=22
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='4-maccabees' AND ev.chapter_number=5 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '4-maccabees-5-the-creator-lawgiver-gave-the-dietary-law',
       E'★★ The Creator-Lawgiver gave the dietary law — clean and unclean stands',
       E'Eleazar grounds the refusal of swine''s flesh not in custom but in creation: *Therefore do we eat no unclean meat; for believing our Law to be given by Elohim (God), we know also that the Creator of the world, as a Lawgiver, feels for us according to our nature. He has commanded us to eat the things that will be convenient for our souls, and he has forbidden us to eat meats that would be the contrary.* The clean/unclean distinction is the Maker''s own statute, given for the good of his people — the martyr dies FOR it, never against it. It ain''t new — *the swine... is unclean to you... of their flesh shall ye not eat,* Moses repeats *thou shalt not eat any abominable thing,* and Daniel before him *purposed in his heart that he would not defile himself.* Eleazar of 2 Maccabees, the same man, *spit it forth* rather than taste the unlawful.',
       sv.verse_id, ev.verse_id, 'extras', 91106
  FROM _session414_4macc05_lookup sv, _session414_4macc05_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=5 AND sv.verse_number=25
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='4-maccabees' AND ev.chapter_number=5 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '4-maccabees-5-no-things-offered-to-idols',
       E'Swine''s flesh and things offered to idols — no other gods',
       E'Antiochus'' decree is double: *compel them to eat swine''s flesh and things offered to idols,* and any who *refuse to defile themselves with the unclean things* were to be tortured and put to death. Eleazar''s refusal guards both the dietary law and the first command — for the worship of *only the Elohim (God) who is* allows no eating at the idol''s table. It ain''t new — the Law''s first words are *Thou shalt have no other gods before me* and *Thou shalt not make unto thee any graven image,* and Paul will warn the saints they *cannot be partakers of the Lord''s table, and of the table of devils.*',
       sv.verse_id, ev.verse_id, 'extras', 91109
  FROM _session414_4macc05_lookup sv, _session414_4macc05_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=5 AND sv.verse_number=2
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='4-maccabees' AND ev.chapter_number=5 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 4-maccabees-5-the-divine-law-the-law-of-our-country
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 30:11 — *For this commandment which I command thee this day, it is not hidden from thee, neither is it far off* — the Law made the Law of the people, the obedience Eleazar will not put off.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc05_lookup sv, _session414_4macc05_lookup tv
 WHERE t.slug='4-maccabees-5-the-divine-law-the-law-of-our-country'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=5 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 30:14 — *But the word is very nigh unto thee, in thy mouth, and in thy heart, that thou mayest do it* — the doable, owned Law that Eleazar deems it right never to transgress.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc05_lookup sv, _session414_4macc05_lookup tv
 WHERE t.slug='4-maccabees-5-the-divine-law-the-law-of-our-country'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=5 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 30:20 — *that thou mayest love Yahuah Elohayka (the LORD thy God)... for he is thy life, and the length of thy days* — the Law held as life itself, the necessity Eleazar owns above all.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc05_lookup sv, _session414_4macc05_lookup tv
 WHERE t.slug='4-maccabees-5-the-divine-law-the-law-of-our-country'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=5 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 19:7 — *The law of Yahuah (LORD) is perfect, converting the soul: the testimony of Yahuah (LORD) is sure, making wise the simple* — the perfect Law that may not be despised in small things or great.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc05_lookup sv, _session414_4macc05_lookup tv
 WHERE t.slug='4-maccabees-5-the-divine-law-the-law-of-our-country'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=5 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'James 2:10 — *For whosoever shall keep the whole law, and yet offend in one point, he is guilty of all* — the apostle''s echo of Eleazar''s rule that transgression in small things or great is equally heinous.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc05_lookup sv, _session414_4macc05_lookup tv
 WHERE t.slug='4-maccabees-5-the-divine-law-the-law-of-our-country'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=5 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=2 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 4-maccabees-5-the-law-teaches-self-control-justice-righteousness
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 10:12 — *what doth Yahuah Elohayka (the LORD thy God) require of thee, but to fear Yahuah Elohayka (the LORD thy God), to walk in all his ways, and to love him, and to serve Yahuah Elohayka (the LORD thy God) with all thy heart* — the Law''s own teaching of reverent worship of the only Elohim.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc05_lookup sv, _session414_4macc05_lookup tv
 WHERE t.slug='4-maccabees-5-the-law-teaches-self-control-justice-righteousness'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=5 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=10 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 20:3 — *Thou shalt have no other gods before me* — the first word of the Law, the worship of the only Elohim that Eleazar says the Law teaches.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc05_lookup sv, _session414_4macc05_lookup tv
 WHERE t.slug='4-maccabees-5-the-law-teaches-self-control-justice-righteousness'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=5 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 16:32 — *He that is slow to anger is better than the mighty; and he that ruleth his spirit than he that taketh a city* — the self-control and mastery over the passions which Eleazar attributes to the Law''s training.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc05_lookup sv, _session414_4macc05_lookup tv
 WHERE t.slug='4-maccabees-5-the-law-teaches-self-control-justice-righteousness'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=5 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=16 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 7:12 — *Wherefore the law is holy, and the commandment holy, and just, and good* — Paul''s verdict on the very Law that teaches self-control, justice, and righteousness, against the charge that it is contrary to reason.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc05_lookup sv, _session414_4macc05_lookup tv
 WHERE t.slug='4-maccabees-5-the-law-teaches-self-control-justice-righteousness'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=5 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=7 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 4-maccabees-5-the-creator-lawgiver-gave-the-dietary-law
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 11:7 — *And the swine, though he divide the hoof, and be clovenfooted, yet he cheweth not the cud; he is unclean to you* — the Creator-Lawgiver''s own statute forbidding the very flesh Eleazar refuses.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc05_lookup sv, _session414_4macc05_lookup tv
 WHERE t.slug='4-maccabees-5-the-creator-lawgiver-gave-the-dietary-law'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=5 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=11 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 11:8 — *Of their flesh shall ye not eat, and their carcase shall ye not touch; they are unclean to you* — the standing prohibition that makes swine''s flesh unclean meat to the martyr.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc05_lookup sv, _session414_4macc05_lookup tv
 WHERE t.slug='4-maccabees-5-the-creator-lawgiver-gave-the-dietary-law'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=5 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=11 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 11:44 — *I am Yahuah Elohaychem (the LORD your God): ye shall therefore sanctify yourselves, and ye shall be holy; for I am holy: neither shall ye defile yourselves with any manner of creeping thing* — the holiness for which the dietary law is given, that none defile himself.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc05_lookup sv, _session414_4macc05_lookup tv
 WHERE t.slug='4-maccabees-5-the-creator-lawgiver-gave-the-dietary-law'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=5 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=11 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Leviticus 11:45 — *For I am Yahuah (LORD) that bringeth you up out of the land of Egypt, to be your Elohim (God): ye shall therefore be holy, for I am holy* — the Maker who redeemed the people and gave the law convenient for their souls.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc05_lookup sv, _session414_4macc05_lookup tv
 WHERE t.slug='4-maccabees-5-the-creator-lawgiver-gave-the-dietary-law'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=5 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=11 AND tv.verse_number=45
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Deuteronomy 14:3 — *Thou shalt not eat any abominable thing* — Moses'' summary of the dietary law, the abomination Eleazar will not touch.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc05_lookup sv, _session414_4macc05_lookup tv
 WHERE t.slug='4-maccabees-5-the-creator-lawgiver-gave-the-dietary-law'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=5 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=14 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Deuteronomy 14:8 — *And the swine, because it divideth the hoof, yet cheweth not the cud, it is unclean unto you: ye shall not eat of their flesh, nor touch their dead carcase* — the same swine-prohibition repeated, the contrary meat the Lawgiver forbids.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc05_lookup sv, _session414_4macc05_lookup tv
 WHERE t.slug='4-maccabees-5-the-creator-lawgiver-gave-the-dietary-law'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=5 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=14 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Daniel 1:8 — *But Daniel purposed in his heart that he would not defile himself with the portion of the king''s meat... that he might not defile himself* — the same resolve under a pagan court, refusing the king''s defiling table.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc05_lookup sv, _session414_4macc05_lookup tv
 WHERE t.slug='4-maccabees-5-the-creator-lawgiver-gave-the-dietary-law'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=5 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=1 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'2 Maccabees 6:18 — *Eleazar, one of the principal scribes, an aged man, and of a well favoured countenance, was constrained to open his mouth, and to eat swine''s flesh* — the same Eleazar, the same swine, the sibling martyrology (self-link).'
  FROM cross_reference_threads t, cross_references x, _session414_4macc05_lookup sv, _session414_4macc05_lookup tv
 WHERE t.slug='4-maccabees-5-the-creator-lawgiver-gave-the-dietary-law'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=5 AND sv.verse_number=25
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=6 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 9, E'2 Maccabees 6:19 — *he, choosing rather to die gloriously, than to live stained with such an abomination, spit it forth, and came of his own accord to the torment* — Eleazar refusing the unlawful meat unto death, the same event told twice (self-link).'
  FROM cross_reference_threads t, cross_references x, _session414_4macc05_lookup sv, _session414_4macc05_lookup tv
 WHERE t.slug='4-maccabees-5-the-creator-lawgiver-gave-the-dietary-law'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=5 AND sv.verse_number=26
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=6 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 10, E'2 Maccabees 6:20 — *As it behoved them to come, that are resolute to stand out against such things, as are not lawful for love of life to be tasted* — what is not lawful is not to be tasted even to save life, the martyr''s exact resolve (self-link).'
  FROM cross_reference_threads t, cross_references x, _session414_4macc05_lookup sv, _session414_4macc05_lookup tv
 WHERE t.slug='4-maccabees-5-the-creator-lawgiver-gave-the-dietary-law'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=5 AND sv.verse_number=26
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=6 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 4-maccabees-5-no-things-offered-to-idols
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 20:3 — *Thou shalt have no other gods before me* — the first word of the Law that forbids the idol-meat Antiochus would force upon the Hebrews.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc05_lookup sv, _session414_4macc05_lookup tv
 WHERE t.slug='4-maccabees-5-no-things-offered-to-idols'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=5 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 20:4 — *Thou shalt not make unto thee any graven image, or any likeness of any thing that is in heaven above, or that is in the earth beneath* — the prohibition of idols behind which stands the ban on things offered to them.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc05_lookup sv, _session414_4macc05_lookup tv
 WHERE t.slug='4-maccabees-5-no-things-offered-to-idols'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=5 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 20:5 — *Thou shalt not bow down thyself to them, nor serve them: for I Yahuah Elohayka (the LORD thy God) am a jealous Elohim (God)* — the jealous Elohim whose worship leaves no room for the idol''s defiling table.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc05_lookup sv, _session414_4macc05_lookup tv
 WHERE t.slug='4-maccabees-5-no-things-offered-to-idols'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=5 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_4maccabees_06.sql (session414 4-maccabees 6) -----
-- Source anchor: pseudepigrapha/4-maccabees ch6. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 4macc06 (view _session414_4macc06_lookup). Sort band base 91125, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session414_4macc06_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 4-maccabees-6-sons-of-abraham-die-for-the-law
  ('pseudepigrapha', '4-maccabees', 6, 17, 'canon', 'genesis', 17, 7, 'free', E'Genesis 17:7 — *And I will establish my covenant between me and thee and thy seed after thee in their generations for an everlasting covenant, to be a Elohim (God) unto thee, and to thy seed after thee* — the everlasting covenant that makes Eleazar a son of Abraham unwilling to forfeit it.'),
  ('pseudepigrapha', '4-maccabees', 6, 22, 'canon', 'genesis', 17, 8, 'free', E'Genesis 17:8 — *I will give unto thee, and to thy seed after thee, the land... for an everlasting possession; and I will be their Elohim (God)* — the inheritance of Abraham''s seed, the patrimony the martyr will not betray.'),
  ('pseudepigrapha', '4-maccabees', 6, 17, 'canon', 'galatians', 3, 7, 'free', E'Galatians 3:7 — *Know ye therefore that they which are of faith, the same are the children of Abraham* — the sons of Abraham defined by the same faith that made Eleazar choose death over impiety.'),
  ('pseudepigrapha', '4-maccabees', 6, 23, 'canon', 'romans', 9, 7, 'free', E'Romans 9:7 — *Neither, because they are the seed of Abraham, are they all children: but, In Isaac shall thy seed be called* — the seed of promise, the line Eleazar bids die nobly for righteousness'' sake.'),
  ('pseudepigrapha', '4-maccabees', 6, 23, 'canon', 'romans', 9, 8, 'free', E'Romans 9:8 — *the children of the flesh, these are not the children of Elohim (God): but the children of the promise are counted for the seed* — sonship to Abraham reckoned by promise, the faith Eleazar would not counterfeit.'),
  -- thread: 4-maccabees-6-unclean-meat-refused-unto-death
  ('pseudepigrapha', '4-maccabees', 6, 15, 'canon', 'leviticus', 11, 7, 'free', E'Leviticus 11:7 — *And the swine, though he divide the hoof, and be clovenfooted, yet he cheweth not the cud; he is unclean to you* — the very flesh the courtiers urge Eleazar to feign eating, named unclean by the Lawgiver.'),
  ('pseudepigrapha', '4-maccabees', 6, 20, 'canon', 'leviticus', 11, 8, 'free', E'Leviticus 11:8 — *Of their flesh shall ye not eat, and their carcase shall ye not touch; they are unclean to you* — the standing command Eleazar will not break even to escape the fire.'),
  ('pseudepigrapha', '4-maccabees', 6, 18, 'canon', 'leviticus', 11, 44, 'free', E'Leviticus 11:44 — *I am Yahuah Elohaychem (the LORD your God): ye shall therefore sanctify yourselves, and ye shall be holy; for I am holy* — the holiness that forbids defilement, the truth Eleazar guarded in lawful guise unto old age.'),
  ('pseudepigrapha', '4-maccabees', 6, 20, 'canon', 'deuteronomy', 14, 8, 'free', E'Deuteronomy 14:8 — *the swine, because it divideth the hoof, yet cheweth not the cud, it is unclean unto you: ye shall not eat of their flesh, nor touch their dead carcase* — Moses'' repetition of the same prohibition the martyr keeps unto death.'),
  ('pseudepigrapha', '4-maccabees', 6, 15, 'canon', 'daniel', 1, 8, 'free', E'Daniel 1:8 — *But Daniel purposed in his heart that he would not defile himself with the portion of the king''s meat... that he might not defile himself* — the same resolve under a pagan court, refusing the king''s defiling table.'),
  ('pseudepigrapha', '4-maccabees', 6, 15, 'apocrypha', '2-maccabees', 7, 37, 'free', E'2 Maccabees 7:37 — *I, as my brothers, offer up my body and life for the laws of our fathers* — the sibling martyrology, the same Eleazar and brothers refusing the swine for the laws of their fathers (self-link).'),
  -- thread: 4-maccabees-6-blood-to-ransom-their-souls
  ('pseudepigrapha', '4-maccabees', 6, 29, 'canon', 'isaiah', 53, 5, 'free', E'Isaiah 53:5 — *he was wounded for our transgressions, he was bruised for our iniquities: the chastisement of our peace was upon him; and with his stripes we are healed* — the Suffering Servant whose pattern Eleazar''s blood-plea dimly reflects, the type awaiting its substance.'),
  ('pseudepigrapha', '4-maccabees', 6, 29, 'canon', 'isaiah', 53, 10, 'free', E'Isaiah 53:10 — *when thou shalt make his soul an offering for sin, he shall see his seed, he shall prolong his days* — the soul given as an offering for sin, the substance of which the martyr''s surrendered soul is only a shadow.'),
  ('pseudepigrapha', '4-maccabees', 6, 29, 'canon', 'isaiah', 53, 12, 'free', E'Isaiah 53:12 — *he hath poured out his soul unto death... and he bare the sin of many, and made intercession for the transgressors* — the righteous One bearing the many''s sin, the true ransom Eleazar''s prayer reaches toward but cannot supply.'),
  ('pseudepigrapha', '4-maccabees', 6, 28, 'canon', 'daniel', 9, 24, 'free', E'Daniel 9:24 — *to finish the transgression, and to make an end of sins, and to make reconciliation for iniquity, and to bring in everlasting righteousness* — the reconciliation appointed, which no martyr''s blood but only the Anointed accomplishes.'),
  ('pseudepigrapha', '4-maccabees', 6, 29, 'apocrypha', '2-maccabees', 7, 38, 'free', E'2 Maccabees 7:38 — *that in me and my brothers the wrath of the Almighty, which is justly brought upon our nation, may cease* — the sibling martyr''s identical plea that his death turn away wrath from the people (self-link).'),
  ('pseudepigrapha', '4-maccabees', 6, 29, 'canon', 'romans', 3, 25, 'free', E'Romans 3:25 — *Whom Elohim (God) hath set forth to be a propitiation through faith in his blood, to declare his righteousness for the remission of sins* — the true propitiation that fulfils the type; the martyr''s blood foreshadows, the Messiah''s effects.'),
  ('pseudepigrapha', '4-maccabees', 6, 29, 'canon', 'hebrews', 9, 14, 'free', E'Hebrews 9:14 — *the blood of Messiah (Christ), who through the eternal Spirit offered himself without spot to Elohim (God), purge your conscience from dead works* — the blood that truly purifies, the substance of which Eleazar''s *make my blood their purification* is the shadow.'),
  ('pseudepigrapha', '4-maccabees', 6, 29, 'canon', '1-peter', 1, 19, 'free', E'1 Peter 1:19 — *with the precious blood of Messiah (Christ), as of a lamb without blemish and without spot* — the ransom that redeems the people, fulfilling the type the dying martyr could only point toward.'),
  -- thread: 4-maccabees-6-inspired-reason-master-over-passions
  ('pseudepigrapha', '4-maccabees', 6, 30, 'canon', 'psalms', 19, 7, 'free', E'Psalm 19:7 — *The law of Yahuah (LORD) is perfect, converting the soul: the testimony of Yahuah (LORD) is sure, making wise the simple* — the Torah that trains the Reason which held Eleazar fast unto death.'),
  ('pseudepigrapha', '4-maccabees', 6, 33, 'canon', 'proverbs', 16, 32, 'free', E'Proverbs 16:32 — *He that is slow to anger is better than the mighty; and he that ruleth his spirit than he that taketh a city* — the Reason conquering the passions, the mastery the writer attributes to the Law-trained mind.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session414_4macc06_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session414_4macc06_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '4-maccabees-6-sons-of-abraham-die-for-the-law',
       E'Sons of Abraham — die nobly for righteousness'' sake',
       E'When the courtiers urge Eleazar to feign eating the swine''s flesh and so save himself, the old man cries out: *May we sons of Abraham never have so evil a thought as with faint heart to counterfeit a part unseemly to us.* He will not *change and become in our own persons a pattern to the young of impiety,* nor *fail to defend the Divine Law unto the death,* but charges, *O sons of Abraham, do ye die nobly for righteousness'' sake.* The identity is covenant-deep: the children of the promise made to Abraham, who are *of faith.* It ain''t new — Yahuah swore *an everlasting covenant* to Abraham''s seed, and *they which are of faith, the same are the children of Abraham.*',
       sv.verse_id, ev.verse_id, 'extras', 91125
  FROM _session414_4macc06_lookup sv, _session414_4macc06_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=6 AND sv.verse_number=16
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='4-maccabees' AND ev.chapter_number=6 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '4-maccabees-6-unclean-meat-refused-unto-death',
       E'Unclean meat refused — the Creator-Lawgiver''s command',
       E'The courtiers offer a way out: *do thou feign only to partake of the swine''s flesh, and so save thyself.* Eleazar refuses to *encourage them to eat unclean meat,* dying rather than touch what the Law forbids. The swine is named unclean by the Creator''s own statute, and the martyr counts the dietary law no light thing but the Divine Law to be defended *unto the death.* It ain''t new — *the swine... is unclean to you... of their flesh shall ye not eat,* and Daniel before him *purposed in his heart that he would not defile himself.*',
       sv.verse_id, ev.verse_id, 'extras', 91128
  FROM _session414_4macc06_lookup sv, _session414_4macc06_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=6 AND sv.verse_number=15
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='4-maccabees' AND ev.chapter_number=6 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '4-maccabees-6-blood-to-ransom-their-souls',
       E'★ Make my blood their purification — the ransom that is a type',
       E'With the fire reaching his bones, Eleazar lifts his eyes and prays: *Thou, O Elohim, knowest that though I might save myself I am dying by fiery torments for thy Law. Be merciful unto thy people, and let our punishment be a satisfaction in their behalf. Make my blood their purification, and take my soul to ransom their souls.* The righteous sufferer pleads his blood for the nation — yet this is a shadow, not the substance. The martyr''s death is a TYPE that points beyond itself to the Suffering Servant whose soul was made *an offering for sin,* and to the Formed Son in whom alone the type finds its fulfilment. It ain''t new — *he was wounded for our transgressions... he bare the sin of many,* and *to make reconciliation for iniquity* was foreseen long before; the martyr''s plea borrows the pattern that the Messiah''s own blood would at last complete.',
       sv.verse_id, ev.verse_id, 'extras', 91131
  FROM _session414_4macc06_lookup sv, _session414_4macc06_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=6 AND sv.verse_number=27
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='4-maccabees' AND ev.chapter_number=6 AND ev.verse_number=29
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '4-maccabees-6-inspired-reason-master-over-passions',
       E'The Inspired Reason, master over the passions',
       E'Eleazar *nobly yielded up his spirit under the torture, and for the sake of the Law held out by his Reason even against the torments unto death.* The writer concludes: *the Inspired Reason is master over the passions,* for *his Reason having conquered his passions, we properly attribute to it the power of commanding them.* This Reason is no Stoic autonomy but the mind disciplined by the Torah, holding fast *for the sake of the Law.* It ain''t new — *the law of Yahuah is perfect, converting the soul,* and *he that ruleth his spirit* is greater *than he that taketh a city.*',
       sv.verse_id, ev.verse_id, 'extras', 91134
  FROM _session414_4macc06_lookup sv, _session414_4macc06_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=6 AND sv.verse_number=30
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='4-maccabees' AND ev.chapter_number=6 AND ev.verse_number=33
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 4-maccabees-6-sons-of-abraham-die-for-the-law
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 17:7 — *And I will establish my covenant between me and thee and thy seed after thee in their generations for an everlasting covenant, to be a Elohim (God) unto thee, and to thy seed after thee* — the everlasting covenant that makes Eleazar a son of Abraham unwilling to forfeit it.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc06_lookup sv, _session414_4macc06_lookup tv
 WHERE t.slug='4-maccabees-6-sons-of-abraham-die-for-the-law'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=6 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 17:8 — *I will give unto thee, and to thy seed after thee, the land... for an everlasting possession; and I will be their Elohim (God)* — the inheritance of Abraham''s seed, the patrimony the martyr will not betray.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc06_lookup sv, _session414_4macc06_lookup tv
 WHERE t.slug='4-maccabees-6-sons-of-abraham-die-for-the-law'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=6 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Galatians 3:7 — *Know ye therefore that they which are of faith, the same are the children of Abraham* — the sons of Abraham defined by the same faith that made Eleazar choose death over impiety.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc06_lookup sv, _session414_4macc06_lookup tv
 WHERE t.slug='4-maccabees-6-sons-of-abraham-die-for-the-law'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=6 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=3 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 9:7 — *Neither, because they are the seed of Abraham, are they all children: but, In Isaac shall thy seed be called* — the seed of promise, the line Eleazar bids die nobly for righteousness'' sake.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc06_lookup sv, _session414_4macc06_lookup tv
 WHERE t.slug='4-maccabees-6-sons-of-abraham-die-for-the-law'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=6 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Romans 9:8 — *the children of the flesh, these are not the children of Elohim (God): but the children of the promise are counted for the seed* — sonship to Abraham reckoned by promise, the faith Eleazar would not counterfeit.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc06_lookup sv, _session414_4macc06_lookup tv
 WHERE t.slug='4-maccabees-6-sons-of-abraham-die-for-the-law'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=6 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 4-maccabees-6-unclean-meat-refused-unto-death
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 11:7 — *And the swine, though he divide the hoof, and be clovenfooted, yet he cheweth not the cud; he is unclean to you* — the very flesh the courtiers urge Eleazar to feign eating, named unclean by the Lawgiver.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc06_lookup sv, _session414_4macc06_lookup tv
 WHERE t.slug='4-maccabees-6-unclean-meat-refused-unto-death'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=6 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=11 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 11:8 — *Of their flesh shall ye not eat, and their carcase shall ye not touch; they are unclean to you* — the standing command Eleazar will not break even to escape the fire.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc06_lookup sv, _session414_4macc06_lookup tv
 WHERE t.slug='4-maccabees-6-unclean-meat-refused-unto-death'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=6 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=11 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 11:44 — *I am Yahuah Elohaychem (the LORD your God): ye shall therefore sanctify yourselves, and ye shall be holy; for I am holy* — the holiness that forbids defilement, the truth Eleazar guarded in lawful guise unto old age.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc06_lookup sv, _session414_4macc06_lookup tv
 WHERE t.slug='4-maccabees-6-unclean-meat-refused-unto-death'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=6 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=11 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Deuteronomy 14:8 — *the swine, because it divideth the hoof, yet cheweth not the cud, it is unclean unto you: ye shall not eat of their flesh, nor touch their dead carcase* — Moses'' repetition of the same prohibition the martyr keeps unto death.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc06_lookup sv, _session414_4macc06_lookup tv
 WHERE t.slug='4-maccabees-6-unclean-meat-refused-unto-death'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=6 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=14 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Daniel 1:8 — *But Daniel purposed in his heart that he would not defile himself with the portion of the king''s meat... that he might not defile himself* — the same resolve under a pagan court, refusing the king''s defiling table.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc06_lookup sv, _session414_4macc06_lookup tv
 WHERE t.slug='4-maccabees-6-unclean-meat-refused-unto-death'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=6 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=1 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'2 Maccabees 7:37 — *I, as my brothers, offer up my body and life for the laws of our fathers* — the sibling martyrology, the same Eleazar and brothers refusing the swine for the laws of their fathers (self-link).'
  FROM cross_reference_threads t, cross_references x, _session414_4macc06_lookup sv, _session414_4macc06_lookup tv
 WHERE t.slug='4-maccabees-6-unclean-meat-refused-unto-death'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=6 AND sv.verse_number=15
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=7 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 4-maccabees-6-blood-to-ransom-their-souls
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 53:5 — *he was wounded for our transgressions, he was bruised for our iniquities: the chastisement of our peace was upon him; and with his stripes we are healed* — the Suffering Servant whose pattern Eleazar''s blood-plea dimly reflects, the type awaiting its substance.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc06_lookup sv, _session414_4macc06_lookup tv
 WHERE t.slug='4-maccabees-6-blood-to-ransom-their-souls'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=6 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 53:10 — *when thou shalt make his soul an offering for sin, he shall see his seed, he shall prolong his days* — the soul given as an offering for sin, the substance of which the martyr''s surrendered soul is only a shadow.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc06_lookup sv, _session414_4macc06_lookup tv
 WHERE t.slug='4-maccabees-6-blood-to-ransom-their-souls'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=6 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 53:12 — *he hath poured out his soul unto death... and he bare the sin of many, and made intercession for the transgressors* — the righteous One bearing the many''s sin, the true ransom Eleazar''s prayer reaches toward but cannot supply.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc06_lookup sv, _session414_4macc06_lookup tv
 WHERE t.slug='4-maccabees-6-blood-to-ransom-their-souls'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=6 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Daniel 9:24 — *to finish the transgression, and to make an end of sins, and to make reconciliation for iniquity, and to bring in everlasting righteousness* — the reconciliation appointed, which no martyr''s blood but only the Anointed accomplishes.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc06_lookup sv, _session414_4macc06_lookup tv
 WHERE t.slug='4-maccabees-6-blood-to-ransom-their-souls'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=6 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=9 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'2 Maccabees 7:38 — *that in me and my brothers the wrath of the Almighty, which is justly brought upon our nation, may cease* — the sibling martyr''s identical plea that his death turn away wrath from the people (self-link).'
  FROM cross_reference_threads t, cross_references x, _session414_4macc06_lookup sv, _session414_4macc06_lookup tv
 WHERE t.slug='4-maccabees-6-blood-to-ransom-their-souls'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=6 AND sv.verse_number=29
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=7 AND tv.verse_number=38
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Romans 3:25 — *Whom Elohim (God) hath set forth to be a propitiation through faith in his blood, to declare his righteousness for the remission of sins* — the true propitiation that fulfils the type; the martyr''s blood foreshadows, the Messiah''s effects.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc06_lookup sv, _session414_4macc06_lookup tv
 WHERE t.slug='4-maccabees-6-blood-to-ransom-their-souls'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=6 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=3 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Hebrews 9:14 — *the blood of Messiah (Christ), who through the eternal Spirit offered himself without spot to Elohim (God), purge your conscience from dead works* — the blood that truly purifies, the substance of which Eleazar''s *make my blood their purification* is the shadow.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc06_lookup sv, _session414_4macc06_lookup tv
 WHERE t.slug='4-maccabees-6-blood-to-ransom-their-souls'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=6 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=9 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'1 Peter 1:19 — *with the precious blood of Messiah (Christ), as of a lamb without blemish and without spot* — the ransom that redeems the people, fulfilling the type the dying martyr could only point toward.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc06_lookup sv, _session414_4macc06_lookup tv
 WHERE t.slug='4-maccabees-6-blood-to-ransom-their-souls'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=6 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=1 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 4-maccabees-6-inspired-reason-master-over-passions
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 19:7 — *The law of Yahuah (LORD) is perfect, converting the soul: the testimony of Yahuah (LORD) is sure, making wise the simple* — the Torah that trains the Reason which held Eleazar fast unto death.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc06_lookup sv, _session414_4macc06_lookup tv
 WHERE t.slug='4-maccabees-6-inspired-reason-master-over-passions'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=6 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 16:32 — *He that is slow to anger is better than the mighty; and he that ruleth his spirit than he that taketh a city* — the Reason conquering the passions, the mastery the writer attributes to the Law-trained mind.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc06_lookup sv, _session414_4macc06_lookup tv
 WHERE t.slug='4-maccabees-6-inspired-reason-master-over-passions'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=6 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=16 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_4maccabees_07.sql (session414 4-maccabees 7) -----
-- Source anchor: pseudepigrapha/4-maccabees ch7. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 4macc07 (view _session414_4macc07_lookup). Sort band base 91150, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session414_4macc07_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 4-maccabees-7-undefiled-teeth-the-dietary-law-stands
  ('pseudepigrapha', '4-maccabees', 7, 7, 'canon', 'leviticus', 11, 7, 'free', E'Leviticus 11:7 — *And the swine, though he divide the hoof, and be clovenfooted, yet he cheweth not the cud; he is unclean to you* — the very unclean meat Eleazar would not befoul his belly with.'),
  ('pseudepigrapha', '4-maccabees', 7, 7, 'canon', 'leviticus', 11, 8, 'free', E'Leviticus 11:8 — *Of their flesh shall ye not eat, and their carcase shall ye not touch; they are unclean to you* — the Creator-Lawgiver''s command for which the martyr dies, not abolished but honoured unto death.'),
  ('pseudepigrapha', '4-maccabees', 7, 6, 'canon', 'leviticus', 11, 44, 'free', E'Leviticus 11:44 — *ye shall therefore sanctify yourselves, and ye shall be holy; for I am holy: neither shall ye defile yourselves with any manner of creeping thing* — the holiness Eleazar''s holy teeth would not defile.'),
  ('pseudepigrapha', '4-maccabees', 7, 7, 'canon', 'deuteronomy', 14, 8, 'free', E'Deuteronomy 14:8 — the swine *is unclean unto you: ye shall not eat of their flesh, nor touch their dead carcase* — Moses'' twin command behind the priest who kept piety and purity.'),
  ('pseudepigrapha', '4-maccabees', 7, 6, 'canon', 'daniel', 1, 8, 'free', E'Daniel 1:8 — *Daniel purposed in his heart that he would not defile himself with the portion of the king''s meat* — the same resolve not to be defiled, an age before Eleazar.'),
  ('pseudepigrapha', '4-maccabees', 7, 7, 'apocrypha', '2-maccabees', 6, 19, 'free', E'2 Maccabees 6:19 — Eleazar, *choosing rather to die gloriously, than to live stained with such an abomination, spit it forth, and came of his own accord to the torment* — the same aged Eleazar, the same refusal of swine, in the sister-book.'),
  -- thread: 4-maccabees-7-aaron-with-the-censer-against-the-fiery-angel
  ('pseudepigrapha', '4-maccabees', 7, 11, 'canon', 'numbers', 16, 46, 'free', E'Numbers 16:46 — *And Moses said unto Aaron, Take a censer, and put fire therein from off the altar, and put on incense, and go quickly unto the congregation, and make an atonement for them: for there is wrath gone out from Yahuah (LORD); the plague is begun* — the censer and the wrath the writer recalls.'),
  ('pseudepigrapha', '4-maccabees', 7, 11, 'canon', 'numbers', 16, 47, 'free', E'Numbers 16:47 — *And Aaron took as Moses commanded, and ran into the midst of the congregation; and, behold, the plague was begun among the people: and he put on incense, and made an atonement for the people* — Aaron running through the massed congregation, the very picture the writer paints.'),
  ('pseudepigrapha', '4-maccabees', 7, 12, 'canon', 'numbers', 16, 48, 'free', E'Numbers 16:48 — *And he stood between the dead and the living; and the plague was stayed* — Aaron overcoming the destroying wrath, the deed the son of Aaron, Eleazar, fulfils in the fire.'),
  -- thread: 4-maccabees-7-with-isaac-like-reason
  ('pseudepigrapha', '4-maccabees', 7, 14, 'canon', 'genesis', 22, 9, 'free', E'Genesis 22:9 — *Abraham built an altar there, and laid the wood in order, and bound Isaac his son, and laid him on the altar upon the wood* — the bound Isaac whose Reason the writer makes Eleazar''s model.'),
  ('pseudepigrapha', '4-maccabees', 7, 14, 'canon', 'genesis', 22, 10, 'free', E'Genesis 22:10 — *And Abraham stretched forth his hand, and took the knife to slay his son* — the readiness unto death that the Isaac-like Reason of Eleazar imitates.'),
  ('pseudepigrapha', '4-maccabees', 7, 13, 'canon', 'hebrews', 11, 17, 'free', E'Hebrews 11:17 — *By faith Abraham, when he was tried, offered up Isaac: and he that had received the promises offered up his only begotten son* — the apostle reading the Akedah as the trial Eleazar reenacts.'),
  ('pseudepigrapha', '4-maccabees', 7, 13, 'canon', 'hebrews', 11, 19, 'free', E'Hebrews 11:19 — *Accounting that Elohim (God) was able to raise him up, even from the dead; from whence also he received him in a figure* — the resurrection-faith in the Akedah that renews the old man''s strength in the fire.'),
  -- thread: 4-maccabees-7-the-patriarchs-live-unto-elohim
  ('pseudepigrapha', '4-maccabees', 7, 19, 'canon', 'matthew', 22, 32, 'free', E'Matthew 22:32 — *I am the Elohim (God) of Abraham, and the Elohim (God) of Isaac, and the Elohim (God) of Jacob? Elohim (God) is not the Elohim (God) of the dead, but of the living* — the Messiah grounding the resurrection in the same patriarchs who *live unto Elohim.*'),
  ('pseudepigrapha', '4-maccabees', 7, 19, 'canon', 'matthew', 22, 31, 'free', E'Matthew 22:31 — *as touching the resurrection of the dead, have ye not read that which was spoken unto you by Elohim (God), saying* — the very doctrine the writer confesses, the rising of the righteous.'),
  ('pseudepigrapha', '4-maccabees', 7, 19, 'canon', 'luke', 20, 38, 'free', E'Luke 20:38 — *he is not a Elohim (God) of the dead, but of the living: for all live unto him* — the same logic, word for word with the writer: the patriarchs *live unto Elohim.*'),
  ('pseudepigrapha', '4-maccabees', 7, 18, 'canon', 'deuteronomy', 6, 5, 'free', E'Deuteronomy 6:5 — *thou shalt love Yahuah Elohayka (the LORD thy God) with all thine heart, and with all thy soul, and with all thy might* — the whole heart that makes righteousness its first thought.'),
  ('pseudepigrapha', '4-maccabees', 7, 19, 'canon', 'hebrews', 11, 13, 'free', E'Hebrews 11:13 — *These all died in faith, not having received the promises, but having seen them afar off... and confessed that they were strangers and pilgrims on the earth* — the patriarchs who died yet live unto Elohim.'),
  ('pseudepigrapha', '4-maccabees', 7, 19, 'canon', 'hebrews', 11, 16, 'free', E'Hebrews 11:16 — *they desire a better country, that is, an heavenly: wherefore Elohim (God) is not ashamed to be called their Elohim (God)* — Abraham, Isaac, and Jacob to whom the living Elohim binds His name.'),
  ('pseudepigrapha', '4-maccabees', 7, 19, 'apocrypha', '2-maccabees', 7, 9, 'free', E'2 Maccabees 7:9 — *the King of the world shall raise us up, who have died for his laws, to everlasting life* — the sister-book''s seven brothers confessing the same resurrection of those who die unto Elohim.'),
  ('pseudepigrapha', '4-maccabees', 7, 18, 'apocrypha', '2-maccabees', 7, 23, 'free', E'2 Maccabees 7:23 — *the Creator of the world... will also of his own mercy give you breath and life again, as you now regard not your own selves for his laws'' sake* — life restored to those who give themselves up for the Law.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session414_4macc07_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session414_4macc07_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '4-maccabees-7-undefiled-teeth-the-dietary-law-stands',
       E'He defiled not his holy teeth — the dietary law stands',
       E'In the praise of Eleazar the writer cries, *O priest worthy of thy priesthood, thou didst not defile thy holy teeth, nor didst thou befoul with unclean meat thy belly that had room only for piety and purity.* The aged confessor died rather than taste swine''s flesh — not for a custom but because *Lev 11 / Deut 14 are the Creator-Lawgiver''s command.* It ain''t new — Moses wrote that *the swine... is unclean to you,* that *of their flesh shall ye not eat,* and bound the people to *sanctify yourselves, and... be holy; for I am holy* — the very holiness Eleazar would not befoul; Daniel before him *would not defile himself,* and his fellow Eleazar in the sister-book *spit forth* the abomination rather than eat.',
       sv.verse_id, ev.verse_id, 'extras', 91150
  FROM _session414_4macc07_lookup sv, _session414_4macc07_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=7 AND sv.verse_number=6
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='4-maccabees' AND ev.chapter_number=7 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '4-maccabees-7-aaron-with-the-censer-against-the-fiery-angel',
       E'Aaron with the censer ran against the fiery angel and overcame',
       E'To magnify Eleazar the writer reaches for his priestly ancestor: *as our father Aaron, armed with the censer, ran through the massed congregation against the fiery angel and overcame him, so the son of Aaron, Eleazar, being consumed by the melting heat of the fire, remained unshaken in his Reason.* The son of Aaron stands in the fire as Aaron once stood between the dead and the living. It ain''t new — Moses records the very deed: *Take a censer... and go quickly unto the congregation, and make an atonement for them: for there is wrath gone out from Yahuah,* and Aaron *ran into the midst of the congregation... and stood between the dead and the living; and the plague was stayed.*',
       sv.verse_id, ev.verse_id, 'extras', 91153
  FROM _session414_4macc07_lookup sv, _session414_4macc07_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=7 AND sv.verse_number=11
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='4-maccabees' AND ev.chapter_number=7 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '4-maccabees-7-with-isaac-like-reason',
       E'With Isaac-like Reason — the Akedah as the martyr''s charter',
       E'The aged Eleazar, his sinews unstrung, *grew a young man again in the spirit of his Reason and with Isaac-like Reason turned the hydra-headed torture to impotence.* The martyr''s pattern is Isaac, who lay bound upon the wood and did not shrink. It ain''t new — Moses tells how Abraham *bound Isaac his son, and laid him on the altar upon the wood,* and *stretched forth his hand, and took the knife to slay his son,* until the angel stayed him; and the apostle reads it as resurrection-faith, that Abraham offered Isaac *accounting that Elohim was able to raise him up, even from the dead* — the very hope that strengthened Eleazar in the flame.',
       sv.verse_id, ev.verse_id, 'extras', 91156
  FROM _session414_4macc07_lookup sv, _session414_4macc07_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=7 AND sv.verse_number=13
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='4-maccabees' AND ev.chapter_number=7 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '4-maccabees-7-the-patriarchs-live-unto-elohim',
       E'They die not, but live unto Elohim — the resurrection of the righteous',
       E'Here is the book''s beating heart. They who *with their whole heart make righteousness their first thought... alone are able to master the weakness of the flesh, believing that unto Elohim they die not, as our patriarchs, Abraham and Isaac and Jacob, died not, but that they live unto Elohim.* This is no Greek immortality but the resurrection hope of Moses and the Prophets. It ain''t new — the Messiah Himself answered the resurrection from this very ground: *I am the Elohim of Abraham, and the Elohim of Isaac, and the Elohim of Jacob? Elohim is not the Elohim of the dead, but of the living,* for *all live unto him*; the whole heart is Moses'' own command, *thou shalt love Yahuah Elohayka with all thine heart*; and the patriarchs *died in faith, not having received the promises,* yet sought *a better country, that is, an heavenly.*',
       sv.verse_id, ev.verse_id, 'extras', 91159
  FROM _session414_4macc07_lookup sv, _session414_4macc07_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=7 AND sv.verse_number=18
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='4-maccabees' AND ev.chapter_number=7 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 4-maccabees-7-undefiled-teeth-the-dietary-law-stands
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 11:7 — *And the swine, though he divide the hoof, and be clovenfooted, yet he cheweth not the cud; he is unclean to you* — the very unclean meat Eleazar would not befoul his belly with.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc07_lookup sv, _session414_4macc07_lookup tv
 WHERE t.slug='4-maccabees-7-undefiled-teeth-the-dietary-law-stands'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=7 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=11 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 11:8 — *Of their flesh shall ye not eat, and their carcase shall ye not touch; they are unclean to you* — the Creator-Lawgiver''s command for which the martyr dies, not abolished but honoured unto death.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc07_lookup sv, _session414_4macc07_lookup tv
 WHERE t.slug='4-maccabees-7-undefiled-teeth-the-dietary-law-stands'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=7 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=11 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 11:44 — *ye shall therefore sanctify yourselves, and ye shall be holy; for I am holy: neither shall ye defile yourselves with any manner of creeping thing* — the holiness Eleazar''s holy teeth would not defile.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc07_lookup sv, _session414_4macc07_lookup tv
 WHERE t.slug='4-maccabees-7-undefiled-teeth-the-dietary-law-stands'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=7 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=11 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Deuteronomy 14:8 — the swine *is unclean unto you: ye shall not eat of their flesh, nor touch their dead carcase* — Moses'' twin command behind the priest who kept piety and purity.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc07_lookup sv, _session414_4macc07_lookup tv
 WHERE t.slug='4-maccabees-7-undefiled-teeth-the-dietary-law-stands'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=7 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=14 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Daniel 1:8 — *Daniel purposed in his heart that he would not defile himself with the portion of the king''s meat* — the same resolve not to be defiled, an age before Eleazar.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc07_lookup sv, _session414_4macc07_lookup tv
 WHERE t.slug='4-maccabees-7-undefiled-teeth-the-dietary-law-stands'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=7 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=1 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'2 Maccabees 6:19 — Eleazar, *choosing rather to die gloriously, than to live stained with such an abomination, spit it forth, and came of his own accord to the torment* — the same aged Eleazar, the same refusal of swine, in the sister-book.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc07_lookup sv, _session414_4macc07_lookup tv
 WHERE t.slug='4-maccabees-7-undefiled-teeth-the-dietary-law-stands'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=7 AND sv.verse_number=7
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=6 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 4-maccabees-7-aaron-with-the-censer-against-the-fiery-angel
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 16:46 — *And Moses said unto Aaron, Take a censer, and put fire therein from off the altar, and put on incense, and go quickly unto the congregation, and make an atonement for them: for there is wrath gone out from Yahuah (LORD); the plague is begun* — the censer and the wrath the writer recalls.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc07_lookup sv, _session414_4macc07_lookup tv
 WHERE t.slug='4-maccabees-7-aaron-with-the-censer-against-the-fiery-angel'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=7 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=16 AND tv.verse_number=46
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 16:47 — *And Aaron took as Moses commanded, and ran into the midst of the congregation; and, behold, the plague was begun among the people: and he put on incense, and made an atonement for the people* — Aaron running through the massed congregation, the very picture the writer paints.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc07_lookup sv, _session414_4macc07_lookup tv
 WHERE t.slug='4-maccabees-7-aaron-with-the-censer-against-the-fiery-angel'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=7 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=16 AND tv.verse_number=47
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Numbers 16:48 — *And he stood between the dead and the living; and the plague was stayed* — Aaron overcoming the destroying wrath, the deed the son of Aaron, Eleazar, fulfils in the fire.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc07_lookup sv, _session414_4macc07_lookup tv
 WHERE t.slug='4-maccabees-7-aaron-with-the-censer-against-the-fiery-angel'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=7 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=16 AND tv.verse_number=48
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 4-maccabees-7-with-isaac-like-reason
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 22:9 — *Abraham built an altar there, and laid the wood in order, and bound Isaac his son, and laid him on the altar upon the wood* — the bound Isaac whose Reason the writer makes Eleazar''s model.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc07_lookup sv, _session414_4macc07_lookup tv
 WHERE t.slug='4-maccabees-7-with-isaac-like-reason'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=7 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 22:10 — *And Abraham stretched forth his hand, and took the knife to slay his son* — the readiness unto death that the Isaac-like Reason of Eleazar imitates.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc07_lookup sv, _session414_4macc07_lookup tv
 WHERE t.slug='4-maccabees-7-with-isaac-like-reason'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=7 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 11:17 — *By faith Abraham, when he was tried, offered up Isaac: and he that had received the promises offered up his only begotten son* — the apostle reading the Akedah as the trial Eleazar reenacts.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc07_lookup sv, _session414_4macc07_lookup tv
 WHERE t.slug='4-maccabees-7-with-isaac-like-reason'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=7 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hebrews 11:19 — *Accounting that Elohim (God) was able to raise him up, even from the dead; from whence also he received him in a figure* — the resurrection-faith in the Akedah that renews the old man''s strength in the fire.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc07_lookup sv, _session414_4macc07_lookup tv
 WHERE t.slug='4-maccabees-7-with-isaac-like-reason'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=7 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 4-maccabees-7-the-patriarchs-live-unto-elohim
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 22:32 — *I am the Elohim (God) of Abraham, and the Elohim (God) of Isaac, and the Elohim (God) of Jacob? Elohim (God) is not the Elohim (God) of the dead, but of the living* — the Messiah grounding the resurrection in the same patriarchs who *live unto Elohim.*'
  FROM cross_reference_threads t, cross_references x, _session414_4macc07_lookup sv, _session414_4macc07_lookup tv
 WHERE t.slug='4-maccabees-7-the-patriarchs-live-unto-elohim'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=7 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=22 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 22:31 — *as touching the resurrection of the dead, have ye not read that which was spoken unto you by Elohim (God), saying* — the very doctrine the writer confesses, the rising of the righteous.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc07_lookup sv, _session414_4macc07_lookup tv
 WHERE t.slug='4-maccabees-7-the-patriarchs-live-unto-elohim'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=7 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=22 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Luke 20:38 — *he is not a Elohim (God) of the dead, but of the living: for all live unto him* — the same logic, word for word with the writer: the patriarchs *live unto Elohim.*'
  FROM cross_reference_threads t, cross_references x, _session414_4macc07_lookup sv, _session414_4macc07_lookup tv
 WHERE t.slug='4-maccabees-7-the-patriarchs-live-unto-elohim'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=7 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=20 AND tv.verse_number=38
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Deuteronomy 6:5 — *thou shalt love Yahuah Elohayka (the LORD thy God) with all thine heart, and with all thy soul, and with all thy might* — the whole heart that makes righteousness its first thought.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc07_lookup sv, _session414_4macc07_lookup tv
 WHERE t.slug='4-maccabees-7-the-patriarchs-live-unto-elohim'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=7 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Hebrews 11:13 — *These all died in faith, not having received the promises, but having seen them afar off... and confessed that they were strangers and pilgrims on the earth* — the patriarchs who died yet live unto Elohim.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc07_lookup sv, _session414_4macc07_lookup tv
 WHERE t.slug='4-maccabees-7-the-patriarchs-live-unto-elohim'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=7 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Hebrews 11:16 — *they desire a better country, that is, an heavenly: wherefore Elohim (God) is not ashamed to be called their Elohim (God)* — Abraham, Isaac, and Jacob to whom the living Elohim binds His name.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc07_lookup sv, _session414_4macc07_lookup tv
 WHERE t.slug='4-maccabees-7-the-patriarchs-live-unto-elohim'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=7 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'2 Maccabees 7:9 — *the King of the world shall raise us up, who have died for his laws, to everlasting life* — the sister-book''s seven brothers confessing the same resurrection of those who die unto Elohim.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc07_lookup sv, _session414_4macc07_lookup tv
 WHERE t.slug='4-maccabees-7-the-patriarchs-live-unto-elohim'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=7 AND sv.verse_number=19
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'2 Maccabees 7:23 — *the Creator of the world... will also of his own mercy give you breath and life again, as you now regard not your own selves for his laws'' sake* — life restored to those who give themselves up for the Law.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc07_lookup sv, _session414_4macc07_lookup tv
 WHERE t.slug='4-maccabees-7-the-patriarchs-live-unto-elohim'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=7 AND sv.verse_number=18
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=7 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_4maccabees_08.sql (session414 4-maccabees 8) -----
-- Source anchor: pseudepigrapha/4-maccabees ch8. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 4macc08 (view _session414_4macc08_lookup). Sort band base 91175, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session414_4macc08_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 4-maccabees-8-seven-brothers-refuse-the-swine
  ('pseudepigrapha', '4-maccabees', 8, 2, 'canon', 'leviticus', 11, 7, 'free', E'Leviticus 11:7 — *And the swine, though he divide the hoof, and be clovenfooted, yet he cheweth not the cud; he is unclean to you.* The "unclean meat" the tyrant presses on the brothers is the swine the Lawgiver declared unclean.'),
  ('pseudepigrapha', '4-maccabees', 8, 1, 'canon', 'leviticus', 11, 8, 'free', E'Leviticus 11:8 — *Of their flesh shall ye not eat, and their carcase shall ye not touch; they are unclean to you.* To eat the meat Antiochus offers would break the plain command the martyrs hold inviolable.'),
  ('pseudepigrapha', '4-maccabees', 8, 2, 'canon', 'deuteronomy', 14, 8, 'free', E'Deuteronomy 14:8 — *And the swine, because it divideth the hoof, yet cheweth not the cud, it is unclean unto you: ye shall not eat of their flesh, nor touch their dead carcase.* Moses twice forbids the swine the brothers refuse — the clean/unclean law stands.'),
  ('pseudepigrapha', '4-maccabees', 8, 8, 'canon', 'leviticus', 11, 44, 'free', E'Leviticus 11:44 — *...ye shall therefore sanctify yourselves, and ye shall be holy; for I am holy: neither shall ye defile yourselves...* The "ancestral law" the tyrant bids them reject is the dietary holiness commanded for a people set apart unto Yahuah.'),
  ('pseudepigrapha', '4-maccabees', 8, 1, 'canon', 'daniel', 1, 8, 'free', E'Daniel 1:8 — *But Daniel purposed in his heart that he would not defile himself with the portion of the king’s meat, nor with the wine which he drank...* Daniel''s refusal in a king''s court is the very pattern the brothers follow before Antiochus.'),
  ('pseudepigrapha', '4-maccabees', 8, 3, 'apocrypha', '2-maccabees', 7, 1, 'free', E'2 Maccabees 7:1 — *...that seven brothers with their mother were taken, and compelled by the king against the law to taste swine’s flesh, and were tormented with scourges and whips.* The sibling account records the same seven brothers and mother compelled against the law to eat swine — the self-same event.'),
  -- thread: 4-maccabees-8-ready-to-die-rather-than-transgress
  ('pseudepigrapha', '4-maccabees', 8, 14, 'canon', 'matthew', 10, 28, 'free', E'Matthew 10:28 — *And fear not them which kill the body, but are not able to kill the soul: but rather fear him which is able to destroy both soul and body in hell.* Against the tyrant''s threat of torture the brothers fear not the killer of the body — the Messiah''s very charter for the martyr.'),
  ('pseudepigrapha', '4-maccabees', 8, 27, 'canon', 'deuteronomy', 30, 19, 'free', E'Deuteronomy 30:19 — *...I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live.* Refusing the coward''s plea, the brothers choose life with the Law over a life bought by transgression — Moses'' own choice.'),
  ('pseudepigrapha', '4-maccabees', 8, 28, 'canon', 'psalms', 119, 109, 'free', E'Psalm 119:109 — *My soul is continually in my hand: yet do I not forget thy law.* "Masters over pain," the brothers hold their lives in their hands and still keep the Torah — the psalmist''s resolve made flesh.'),
  ('pseudepigrapha', '4-maccabees', 8, 24, 'canon', 'psalms', 119, 110, 'free', E'Psalm 119:110 — *The wicked have laid a snare for me: yet I erred not from thy precepts.* The tyrant''s engines are the snare of the wicked; the brothers, unlike the imagined coward, err not from the precepts.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session414_4macc08_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session414_4macc08_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '4-maccabees-8-seven-brothers-refuse-the-swine',
       E'The seven brothers brought to eat unclean meat — the ancestral Law refused',
       E'The tyrant turns from Eleazar to the young — *he ordered the guards to bring others of the young men of the Hebrews, and if they would eat unclean meat to release them after eating it* (4 Maccabees 8:1-2). *Seven brethren together with their aged mother were brought prisoners before him* (4 Maccabees 8:3), and Antiochus, after his flattery fails, names the one demand that buys their lives — *positions of importance and authority in my service if you will reject the ancestral law of your polity* (4 Maccabees 8:8). The whole contest hangs on one point: eat the swine and live, or keep the Creator-Lawgiver''s command and die. It ain''t new: the swine is named unclean from Sinai — *And the swine, though he divide the hoof, and be clovenfooted, yet he cheweth not the cud; he is unclean to you* (Leviticus 11:7), *Of their flesh shall ye not eat, and their carcase shall ye not touch; they are unclean to you* (Leviticus 11:8); Moses repeats it — *the swine... it is unclean unto you: ye shall not eat of their flesh, nor touch their dead carcase* (Deuteronomy 14:8). Daniel set the pattern in another tyrant''s court — *Daniel purposed in his heart that he would not defile himself with the portion of the king’s meat* (Daniel 1:8). And this is the very scene 2 Maccabees records — *seven brothers with their mother were taken, and compelled by the king against the law to taste swine’s flesh* (2 Maccabees 7:1). The table-faith the brothers will die for is the oldest obedience there is — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 91175
  FROM _session414_4macc08_lookup sv, _session414_4macc08_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=8 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='4-maccabees' AND ev.chapter_number=8 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '4-maccabees-8-ready-to-die-rather-than-transgress',
       E'Choosing death over transgression — fear not them that kill the body',
       E'Antiochus arrays the engines of torture and adds a tempter''s gloss — *the Justice you worship will pardon your unwilling transgression* (4 Maccabees 8:14) — and the writer rehearses the speech a coward might have made: *if compelled by necessity we yield to the king in fear... Even the Law itself does not willingly condemn us to death* (4 Maccabees 8:21,24). But that is not the brothers'' mind — *no such words escaped these young men at the prospect of the torture... For they were despisers of the passions and masters over pain* (4 Maccabees 8:27-28). They will die before they transgress. It ain''t new: the choice is the one Moses set before Yashar''el — *I have set before you life and death, blessing and cursing: therefore choose life* (Deuteronomy 30:19); the psalmist held the Law through deadly peril — *My soul is continually in my hand: yet do I not forget thy law* (Psalm 119:109), *The wicked have laid a snare for me: yet I erred not from thy precepts* (Psalm 119:110). And the Messiah named the fear that frees a martyr — *fear not them which kill the body, but are not able to kill the soul: but rather fear him which is able to destroy both soul and body* (Matthew 10:28). To prize the commandment above life itself is no new courage — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 91178
  FROM _session414_4macc08_lookup sv, _session414_4macc08_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=8 AND sv.verse_number=14
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='4-maccabees' AND ev.chapter_number=8 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 4-maccabees-8-seven-brothers-refuse-the-swine
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 11:7 — *And the swine, though he divide the hoof, and be clovenfooted, yet he cheweth not the cud; he is unclean to you.* The "unclean meat" the tyrant presses on the brothers is the swine the Lawgiver declared unclean.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc08_lookup sv, _session414_4macc08_lookup tv
 WHERE t.slug='4-maccabees-8-seven-brothers-refuse-the-swine'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=8 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=11 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 11:8 — *Of their flesh shall ye not eat, and their carcase shall ye not touch; they are unclean to you.* To eat the meat Antiochus offers would break the plain command the martyrs hold inviolable.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc08_lookup sv, _session414_4macc08_lookup tv
 WHERE t.slug='4-maccabees-8-seven-brothers-refuse-the-swine'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=8 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=11 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 14:8 — *And the swine, because it divideth the hoof, yet cheweth not the cud, it is unclean unto you: ye shall not eat of their flesh, nor touch their dead carcase.* Moses twice forbids the swine the brothers refuse — the clean/unclean law stands.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc08_lookup sv, _session414_4macc08_lookup tv
 WHERE t.slug='4-maccabees-8-seven-brothers-refuse-the-swine'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=8 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=14 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Leviticus 11:44 — *...ye shall therefore sanctify yourselves, and ye shall be holy; for I am holy: neither shall ye defile yourselves...* The "ancestral law" the tyrant bids them reject is the dietary holiness commanded for a people set apart unto Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc08_lookup sv, _session414_4macc08_lookup tv
 WHERE t.slug='4-maccabees-8-seven-brothers-refuse-the-swine'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=8 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=11 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Daniel 1:8 — *But Daniel purposed in his heart that he would not defile himself with the portion of the king’s meat, nor with the wine which he drank...* Daniel''s refusal in a king''s court is the very pattern the brothers follow before Antiochus.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc08_lookup sv, _session414_4macc08_lookup tv
 WHERE t.slug='4-maccabees-8-seven-brothers-refuse-the-swine'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=8 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=1 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'2 Maccabees 7:1 — *...that seven brothers with their mother were taken, and compelled by the king against the law to taste swine’s flesh, and were tormented with scourges and whips.* The sibling account records the same seven brothers and mother compelled against the law to eat swine — the self-same event.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc08_lookup sv, _session414_4macc08_lookup tv
 WHERE t.slug='4-maccabees-8-seven-brothers-refuse-the-swine'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=8 AND sv.verse_number=3
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=7 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 4-maccabees-8-ready-to-die-rather-than-transgress
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 10:28 — *And fear not them which kill the body, but are not able to kill the soul: but rather fear him which is able to destroy both soul and body in hell.* Against the tyrant''s threat of torture the brothers fear not the killer of the body — the Messiah''s very charter for the martyr.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc08_lookup sv, _session414_4macc08_lookup tv
 WHERE t.slug='4-maccabees-8-ready-to-die-rather-than-transgress'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=8 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=10 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 30:19 — *...I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live.* Refusing the coward''s plea, the brothers choose life with the Law over a life bought by transgression — Moses'' own choice.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc08_lookup sv, _session414_4macc08_lookup tv
 WHERE t.slug='4-maccabees-8-ready-to-die-rather-than-transgress'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=8 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 119:109 — *My soul is continually in my hand: yet do I not forget thy law.* "Masters over pain," the brothers hold their lives in their hands and still keep the Torah — the psalmist''s resolve made flesh.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc08_lookup sv, _session414_4macc08_lookup tv
 WHERE t.slug='4-maccabees-8-ready-to-die-rather-than-transgress'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=8 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=119 AND tv.verse_number=109
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 119:110 — *The wicked have laid a snare for me: yet I erred not from thy precepts.* The tyrant''s engines are the snare of the wicked; the brothers, unlike the imagined coward, err not from the precepts.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc08_lookup sv, _session414_4macc08_lookup tv
 WHERE t.slug='4-maccabees-8-ready-to-die-rather-than-transgress'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=8 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=119 AND tv.verse_number=110
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_4maccabees_09.sql (session414 4-maccabees 9) -----
-- Source anchor: pseudepigrapha/4-maccabees ch9. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 4macc09 (view _session414_4macc09_lookup). Sort band base 91200, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session414_4macc09_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 4-maccabees-9-ready-to-die-rather-than-transgress
  ('pseudepigrapha', '4-maccabees', 9, 1, 'canon', 'deuteronomy', 30, 19, 'free', E'Deuteronomy 30:19 — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live.* The brothers'' readiness to die rather than transgress is the very choosing of life-through-obedience Moses set before the nation.'),
  ('pseudepigrapha', '4-maccabees', 9, 4, 'canon', 'deuteronomy', 30, 20, 'free', E'Deuteronomy 30:20 — *That thou mayest love Yahuah Elohayka (the LORD thy God), and that thou mayest obey his voice, and that thou mayest cleave unto him: for he is thy life, and the length of thy days.* To prize life bought by a breach of the Law as harder than death is to confess with Moses that obedience itself is their life and length of days.'),
  ('pseudepigrapha', '4-maccabees', 9, 2, 'canon', 'deuteronomy', 30, 16, 'free', E'Deuteronomy 30:16 — *I command thee this day to love Yahuah Elohayka (the LORD thy God), to walk in his ways, and to keep his commandments and his statutes and his judgments, that thou mayest live and multiply.* Their resolve to walk in obedience to the Law and take Moses as counsellor is the walking-in-his-ways that Moses commanded for life.'),
  ('pseudepigrapha', '4-maccabees', 9, 6, 'canon', 'leviticus', 11, 7, 'free', E'Leviticus 11:7 — *And the swine, though he divide the hoof, and be clovenfooted, yet he cheweth not the cud; he is unclean to you.* The unclean meat the young men die refusing, as their aged teacher Eleazar did, is forbidden by the Creator-Lawgiver''s own word.'),
  ('pseudepigrapha', '4-maccabees', 9, 6, 'canon', 'leviticus', 11, 44, 'free', E'Leviticus 11:44 — *For I am Yahuah Elohaychem (the LORD your God): ye shall therefore sanctify yourselves, and ye shall be holy; for I am holy: neither shall ye defile yourselves with any manner of creeping thing.* The holiness for which they endure the torments is the be-ye-holy command that seals the dietary law.'),
  ('pseudepigrapha', '4-maccabees', 9, 1, 'canon', 'deuteronomy', 14, 8, 'free', E'Deuteronomy 14:8 — *And the swine, because it divideth the hoof, yet cheweth not the cud, it is unclean unto you: ye shall not eat of their flesh, nor touch their dead carcase.* The commandment of their fathers they will not transgress is this very prohibition restated in Moses'' second giving of the Law.'),
  ('pseudepigrapha', '4-maccabees', 9, 7, 'canon', 'psalms', 119, 109, 'free', E'Psalms 119:109 — *My soul is continually in my hand: yet do I not forget thy law.* The youths bidding the tyrant make trial, holding their lives in their hands while clinging to the Law, are the psalmist''s soul ever in his hand yet never forgetting the Torah.'),
  ('pseudepigrapha', '4-maccabees', 9, 4, 'canon', 'psalms', 119, 110, 'free', E'Psalms 119:110 — *The wicked have laid a snare for me: yet I erred not from thy precepts.* The tyrant''s offer of life for a breach of the Law is the snare of the wicked; the brothers, like the psalmist, will not err from the precepts to escape it.'),
  -- thread: 4-maccabees-9-the-first-brother-fear-not-them-that-kill-the-body
  ('pseudepigrapha', '4-maccabees', 9, 17, 'canon', 'matthew', 10, 28, 'free', E'Matthew 10:28 — *And fear not them which kill the body, but are not able to kill the soul: but rather fear him which is able to destroy both soul and body in hell.* The brother whose Reason the torturers cannot lead captive embodies the Master''s word that they who kill the body cannot touch the soul.'),
  ('pseudepigrapha', '4-maccabees', 9, 15, 'canon', 'matthew', 10, 18, 'free', E'Matthew 10:18 — *And ye shall be brought before governors and kings for my sake, for a testimony against them and the Gentiles.* The youth confessing before the tyrant that he suffers for defending the Law of Elohim is the standing-before-kings-as-a-testimony the Messiah foretold.'),
  ('pseudepigrapha', '4-maccabees', 9, 9, 'canon', 'deuteronomy', 32, 36, 'free', E'Deuteronomy 32:36 — *For Yahuah (LORD) shall judge his people, and repent himself for his servants, when he seeth that their power is gone.* Their confidence that the tyrant will suffer at the hands of divine justice and that Providence will be merciful to his people is Moses'' song that Elohim judges his people and relents for his servants.'),
  ('pseudepigrapha', '4-maccabees', 9, 24, 'canon', 'psalms', 79, 10, 'free', E'Psalms 79:10 — *Wherefore should the heathen say, Where is their Elohim (God)? let him be known among the heathen in our sight by the revenging of the blood of thy servants which is shed.* The plea that the just Providence take vengeance on the accursed tyrant is the psalmist''s cry for the avenging of the shed blood of Elohim''s servants.'),
  ('pseudepigrapha', '4-maccabees', 9, 21, 'canon', 'daniel', 12, 2, 'free', E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The youth who endures as if suffering a change by fire to incorruption rests on Daniel''s promise that the righteous dead awake to everlasting life while their persecutors awake to everlasting contempt.'),
  ('pseudepigrapha', '4-maccabees', 9, 32, 'canon', 'daniel', 12, 2, 'free', E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The second brother''s warning that the tyrant shall not escape the penalties of the divine wrath is the same two-fold waking Daniel foretold, contempt for the persecutor and life for the faithful.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session414_4macc09_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session414_4macc09_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '4-maccabees-9-ready-to-die-rather-than-transgress',
       E'Ready to die rather than transgress — the Law is life',
       E'The seven brothers answer the tyrant with one voice: *We are ready to die rather than transgress the commandments of our fathers* (4 Maccabees 9:1), for they will not shame their ancestors by failing to *walk in obedience to the Law and take Moses as our counsellor* (4 Maccabees 9:2); they count it *a thing harder to bear than death itself* to be given their life *in return for a breach of the Law* (4 Maccabees 9:4). This is no Stoic boast of mere endurance — it is Moses'' own choice set before the people: life bound up with keeping the commandments, death with forsaking them. The dietary refusal that costs them their lives is the Creator-Lawgiver''s command in Leviticus and Deuteronomy, and the heart that would rather die than err from the precepts is the very heart of the psalmist. It ain''t new — *therefore choose life, that both thou and thy seed may live* (Deuteronomy 30:19) was the charter of these martyrs long before they were born.',
       sv.verse_id, ev.verse_id, 'extras', 91200
  FROM _session414_4macc09_lookup sv, _session414_4macc09_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=9 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='4-maccabees' AND ev.chapter_number=9 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '4-maccabees-9-the-first-brother-fear-not-them-that-kill-the-body',
       E'The first brother — fear not them that kill the body',
       E'Racked on the wheel till his bones are out of joint, the eldest brother denounces the tyrant as an *enemy of the justice of heaven* and dies declaring the guards'' tortures *not strong enough to lead captive my Reason* (4 Maccabees 9:15-17); he charges his brothers to *war a holy and honourable warfare on behalf of righteousness, through which may the just Providence... become merciful unto his people and take vengeance on the accursed tyrant* (4 Maccabees 9:24), and the second brother in turn warns that the tyrant cannot *escape... the penalties of the divine wrath* (4 Maccabees 9:32). This is the Master''s own teaching: fear not the man who can only kill the body but cannot touch the soul; and it is the patriarch''s and prophet''s confidence that Elohim will judge his people, raise the righteous who sleep, and avenge the blood of his servants. It ain''t new — *fear not them which kill the body, but are not able to kill the soul* (Matthew 10:28) was the courage Moses and the prophets had already breathed into Israel.',
       sv.verse_id, ev.verse_id, 'extras', 91203
  FROM _session414_4macc09_lookup sv, _session414_4macc09_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=9 AND sv.verse_number=15
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='4-maccabees' AND ev.chapter_number=9 AND ev.verse_number=32
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 4-maccabees-9-ready-to-die-rather-than-transgress
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 30:19 — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live.* The brothers'' readiness to die rather than transgress is the very choosing of life-through-obedience Moses set before the nation.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc09_lookup sv, _session414_4macc09_lookup tv
 WHERE t.slug='4-maccabees-9-ready-to-die-rather-than-transgress'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=9 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 30:20 — *That thou mayest love Yahuah Elohayka (the LORD thy God), and that thou mayest obey his voice, and that thou mayest cleave unto him: for he is thy life, and the length of thy days.* To prize life bought by a breach of the Law as harder than death is to confess with Moses that obedience itself is their life and length of days.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc09_lookup sv, _session414_4macc09_lookup tv
 WHERE t.slug='4-maccabees-9-ready-to-die-rather-than-transgress'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=9 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 30:16 — *I command thee this day to love Yahuah Elohayka (the LORD thy God), to walk in his ways, and to keep his commandments and his statutes and his judgments, that thou mayest live and multiply.* Their resolve to walk in obedience to the Law and take Moses as counsellor is the walking-in-his-ways that Moses commanded for life.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc09_lookup sv, _session414_4macc09_lookup tv
 WHERE t.slug='4-maccabees-9-ready-to-die-rather-than-transgress'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=9 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Leviticus 11:7 — *And the swine, though he divide the hoof, and be clovenfooted, yet he cheweth not the cud; he is unclean to you.* The unclean meat the young men die refusing, as their aged teacher Eleazar did, is forbidden by the Creator-Lawgiver''s own word.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc09_lookup sv, _session414_4macc09_lookup tv
 WHERE t.slug='4-maccabees-9-ready-to-die-rather-than-transgress'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=9 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=11 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Leviticus 11:44 — *For I am Yahuah Elohaychem (the LORD your God): ye shall therefore sanctify yourselves, and ye shall be holy; for I am holy: neither shall ye defile yourselves with any manner of creeping thing.* The holiness for which they endure the torments is the be-ye-holy command that seals the dietary law.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc09_lookup sv, _session414_4macc09_lookup tv
 WHERE t.slug='4-maccabees-9-ready-to-die-rather-than-transgress'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=9 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=11 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Deuteronomy 14:8 — *And the swine, because it divideth the hoof, yet cheweth not the cud, it is unclean unto you: ye shall not eat of their flesh, nor touch their dead carcase.* The commandment of their fathers they will not transgress is this very prohibition restated in Moses'' second giving of the Law.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc09_lookup sv, _session414_4macc09_lookup tv
 WHERE t.slug='4-maccabees-9-ready-to-die-rather-than-transgress'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=9 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=14 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Psalms 119:109 — *My soul is continually in my hand: yet do I not forget thy law.* The youths bidding the tyrant make trial, holding their lives in their hands while clinging to the Law, are the psalmist''s soul ever in his hand yet never forgetting the Torah.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc09_lookup sv, _session414_4macc09_lookup tv
 WHERE t.slug='4-maccabees-9-ready-to-die-rather-than-transgress'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=9 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=119 AND tv.verse_number=109
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'Psalms 119:110 — *The wicked have laid a snare for me: yet I erred not from thy precepts.* The tyrant''s offer of life for a breach of the Law is the snare of the wicked; the brothers, like the psalmist, will not err from the precepts to escape it.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc09_lookup sv, _session414_4macc09_lookup tv
 WHERE t.slug='4-maccabees-9-ready-to-die-rather-than-transgress'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=9 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=119 AND tv.verse_number=110
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 4-maccabees-9-the-first-brother-fear-not-them-that-kill-the-body
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 10:28 — *And fear not them which kill the body, but are not able to kill the soul: but rather fear him which is able to destroy both soul and body in hell.* The brother whose Reason the torturers cannot lead captive embodies the Master''s word that they who kill the body cannot touch the soul.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc09_lookup sv, _session414_4macc09_lookup tv
 WHERE t.slug='4-maccabees-9-the-first-brother-fear-not-them-that-kill-the-body'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=9 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=10 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 10:18 — *And ye shall be brought before governors and kings for my sake, for a testimony against them and the Gentiles.* The youth confessing before the tyrant that he suffers for defending the Law of Elohim is the standing-before-kings-as-a-testimony the Messiah foretold.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc09_lookup sv, _session414_4macc09_lookup tv
 WHERE t.slug='4-maccabees-9-the-first-brother-fear-not-them-that-kill-the-body'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=9 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=10 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 32:36 — *For Yahuah (LORD) shall judge his people, and repent himself for his servants, when he seeth that their power is gone.* Their confidence that the tyrant will suffer at the hands of divine justice and that Providence will be merciful to his people is Moses'' song that Elohim judges his people and relents for his servants.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc09_lookup sv, _session414_4macc09_lookup tv
 WHERE t.slug='4-maccabees-9-the-first-brother-fear-not-them-that-kill-the-body'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=9 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalms 79:10 — *Wherefore should the heathen say, Where is their Elohim (God)? let him be known among the heathen in our sight by the revenging of the blood of thy servants which is shed.* The plea that the just Providence take vengeance on the accursed tyrant is the psalmist''s cry for the avenging of the shed blood of Elohim''s servants.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc09_lookup sv, _session414_4macc09_lookup tv
 WHERE t.slug='4-maccabees-9-the-first-brother-fear-not-them-that-kill-the-body'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=9 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=79 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The youth who endures as if suffering a change by fire to incorruption rests on Daniel''s promise that the righteous dead awake to everlasting life while their persecutors awake to everlasting contempt.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc09_lookup sv, _session414_4macc09_lookup tv
 WHERE t.slug='4-maccabees-9-the-first-brother-fear-not-them-that-kill-the-body'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=9 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The second brother''s warning that the tyrant shall not escape the penalties of the divine wrath is the same two-fold waking Daniel foretold, contempt for the persecutor and life for the faithful.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc09_lookup sv, _session414_4macc09_lookup tv
 WHERE t.slug='4-maccabees-9-the-first-brother-fear-not-them-that-kill-the-body'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=9 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_4maccabees_10.sql (session414 4-maccabees 10) -----
-- Source anchor: pseudepigrapha/4-maccabees ch10. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 4macc10 (view _session414_4macc10_lookup). Sort band base 91225, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session414_4macc10_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 4-maccabees-10-the-noble-bond-of-brotherhood
  ('pseudepigrapha', '4-maccabees', 10, 2, 'apocrypha', '2-maccabees', 7, 2, 'free', E'2 Maccabees 7:2 — *we are ready to die, rather than to transgress the laws of our fathers* — the sibling martyrology, the same seven brothers refusing to forswear the bond bred under the Law (self-link).'),
  ('pseudepigrapha', '4-maccabees', 10, 4, 'canon', 'matthew', 10, 28, 'free', E'Matthew 10:28 — *fear not them which kill the body, but are not able to kill the soul* — the very confidence of the third son, that the torturer reaches the body but *my soul ye cannot reach.*'),
  ('pseudepigrapha', '4-maccabees', 10, 11, 'apocrypha', '2-maccabees', 7, 9, 'free', E'2 Maccabees 7:9 — *the King of the world shall raise us up, who have died for his laws, to everlasting life* — the resurrection hope held by the same brothers, the life beyond the tyrant''s reach (self-link).'),
  ('pseudepigrapha', '4-maccabees', 10, 11, 'canon', 'daniel', 12, 2, 'free', E'Daniel 12:2 — *many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt* — the two awakenings: life for the martyr, *torments without end* for the impious king.'),
  ('pseudepigrapha', '4-maccabees', 10, 11, 'canon', 'deuteronomy', 32, 36, 'free', E'Deuteronomy 32:36 — *Yahuah shall judge his people, and repent himself for his servants, when he seeth that their power is gone* — Elohim''s vindication of his suffering servants and the doom pronounced on their oppressor.'),
  -- thread: 4-maccabees-10-elohim-hears-the-speechless
  ('pseudepigrapha', '4-maccabees', 10, 16, 'apocrypha', '2-maccabees', 7, 4, 'free', E'2 Maccabees 7:4 — *he commanded to cut out the tongue of him that spoke first, and to cut off the utmost parts of his body* — the same tongue-severing torment in the sibling account of these brothers (self-link).'),
  ('pseudepigrapha', '4-maccabees', 10, 18, 'canon', 'matthew', 10, 20, 'free', E'Matthew 10:20 — *For it is not ye that speak, but the Spirit of your Father which speaketh in you* — the same truth the martyr confesses: with tongue cut out, *Elohim is a hearer also of the speechless.*'),
  ('pseudepigrapha', '4-maccabees', 10, 18, 'canon', 'matthew', 10, 18, 'free', E'Matthew 10:18 — *ye shall be brought before governors and kings for my sake, for a testimony against them* — the witness borne before the tyrant''s tribunal, the speechless confession still heard in heaven.'),
  ('pseudepigrapha', '4-maccabees', 10, 21, 'canon', 'psalms', 79, 10, 'free', E'Psalm 79:10 — *let him be known among the heathen in our sight by the revenging of the blood of thy servants which is shed* — the avenging the martyr foretells when he says *Elohim will speedily pursue after thee.*')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session414_4macc10_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session414_4macc10_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '4-maccabees-10-the-noble-bond-of-brotherhood',
       E'The noble bond of brotherhood — suffering for the upbringing of Elohim',
       E'The third son, urged to taste and save himself, answers that *the same father begat me and my brothers that are dead, and the same mother gave us birth, and in the same doctrines was I brought up,* and so *I do not forswear the noble bond of brotherhood.* He offers his body to the engines, for *my soul ye cannot reach,* and dying he tells the tyrant: *We... suffer thus for our upbringing and our virtue that are of Elohim; but thou for thy impiety and thy cruelty shalt endure torments without end.* The same seven brothers in the sibling book confess the same hope and the same sentence on the king. It ain''t new — *the King of the world shall raise us up, who have died for his laws, to everlasting life,* and *Yahuah shall judge his people, and repent himself for his servants.*',
       sv.verse_id, ev.verse_id, 'extras', 91225
  FROM _session414_4macc10_lookup sv, _session414_4macc10_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=10 AND sv.verse_number=2
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='4-maccabees' AND ev.chapter_number=10 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '4-maccabees-10-elohim-hears-the-speechless',
       E'Elohim is a hearer of the speechless — the tongue cut out',
       E'When the fourth son will not deny *my noble brotherhood,* Antiochus bids them cut out his tongue. The young man answers, *Even if thou dost remove my organ of speech, Elohim is a hearer also of the speechless,* and lays it out ready, *for thou shalt not thereby silence my Reason.* He gives his members *to be mutilated for the cause of Elohim,* and warns, *Elohim will speedily pursue after thee; for thou cuttest out the tongue that sang songs of praise unto him.* The same torment befell the eldest brother in the sibling book. It ain''t new — the Messiah told his own that when they are *brought before governors and kings,* it is *not ye that speak, but the Spirit of your Father which speaketh in you,* and the blood of his servants is *known among the heathen... by the revenging.*',
       sv.verse_id, ev.verse_id, 'extras', 91228
  FROM _session414_4macc10_lookup sv, _session414_4macc10_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=10 AND sv.verse_number=16
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='4-maccabees' AND ev.chapter_number=10 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 4-maccabees-10-the-noble-bond-of-brotherhood
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Maccabees 7:2 — *we are ready to die, rather than to transgress the laws of our fathers* — the sibling martyrology, the same seven brothers refusing to forswear the bond bred under the Law (self-link).'
  FROM cross_reference_threads t, cross_references x, _session414_4macc10_lookup sv, _session414_4macc10_lookup tv
 WHERE t.slug='4-maccabees-10-the-noble-bond-of-brotherhood'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=10 AND sv.verse_number=2
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=7 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 10:28 — *fear not them which kill the body, but are not able to kill the soul* — the very confidence of the third son, that the torturer reaches the body but *my soul ye cannot reach.*'
  FROM cross_reference_threads t, cross_references x, _session414_4macc10_lookup sv, _session414_4macc10_lookup tv
 WHERE t.slug='4-maccabees-10-the-noble-bond-of-brotherhood'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=10 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=10 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Maccabees 7:9 — *the King of the world shall raise us up, who have died for his laws, to everlasting life* — the resurrection hope held by the same brothers, the life beyond the tyrant''s reach (self-link).'
  FROM cross_reference_threads t, cross_references x, _session414_4macc10_lookup sv, _session414_4macc10_lookup tv
 WHERE t.slug='4-maccabees-10-the-noble-bond-of-brotherhood'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=10 AND sv.verse_number=11
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Daniel 12:2 — *many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt* — the two awakenings: life for the martyr, *torments without end* for the impious king.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc10_lookup sv, _session414_4macc10_lookup tv
 WHERE t.slug='4-maccabees-10-the-noble-bond-of-brotherhood'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=10 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Deuteronomy 32:36 — *Yahuah shall judge his people, and repent himself for his servants, when he seeth that their power is gone* — Elohim''s vindication of his suffering servants and the doom pronounced on their oppressor.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc10_lookup sv, _session414_4macc10_lookup tv
 WHERE t.slug='4-maccabees-10-the-noble-bond-of-brotherhood'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=10 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 4-maccabees-10-elohim-hears-the-speechless
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Maccabees 7:4 — *he commanded to cut out the tongue of him that spoke first, and to cut off the utmost parts of his body* — the same tongue-severing torment in the sibling account of these brothers (self-link).'
  FROM cross_reference_threads t, cross_references x, _session414_4macc10_lookup sv, _session414_4macc10_lookup tv
 WHERE t.slug='4-maccabees-10-elohim-hears-the-speechless'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=10 AND sv.verse_number=16
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=7 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 10:20 — *For it is not ye that speak, but the Spirit of your Father which speaketh in you* — the same truth the martyr confesses: with tongue cut out, *Elohim is a hearer also of the speechless.*'
  FROM cross_reference_threads t, cross_references x, _session414_4macc10_lookup sv, _session414_4macc10_lookup tv
 WHERE t.slug='4-maccabees-10-elohim-hears-the-speechless'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=10 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=10 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 10:18 — *ye shall be brought before governors and kings for my sake, for a testimony against them* — the witness borne before the tyrant''s tribunal, the speechless confession still heard in heaven.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc10_lookup sv, _session414_4macc10_lookup tv
 WHERE t.slug='4-maccabees-10-elohim-hears-the-speechless'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=10 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=10 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 79:10 — *let him be known among the heathen in our sight by the revenging of the blood of thy servants which is shed* — the avenging the martyr foretells when he says *Elohim will speedily pursue after thee.*'
  FROM cross_reference_threads t, cross_references x, _session414_4macc10_lookup sv, _session414_4macc10_lookup tv
 WHERE t.slug='4-maccabees-10-elohim-hears-the-speechless'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=10 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=79 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_4maccabees_11.sql (session414 4-maccabees 11) -----
-- Source anchor: pseudepigrapha/4-maccabees ch11. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 4macc11 (view _session414_4macc11_lookup). Sort band base 91250, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session414_4macc11_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 4-maccabees-11-we-worship-the-creator-and-live-by-his-law
  ('pseudepigrapha', '4-maccabees', 11, 5, 'canon', 'deuteronomy', 32, 39, 'free', E'Deuteronomy 32:39 — *See now that I, even I, am he, and there is no god with me: I kill, and I make alive* — the one Creator the martyr worships and lives by, over against the tyrant who *makest war on those that worship Elohim.*'),
  ('pseudepigrapha', '4-maccabees', 11, 8, 'apocrypha', '2-maccabees', 7, 17, 'free', E'2 Maccabees 7:17 — *abide a while, and behold his great power, how he will torment you and your seed* — the same warning the same brothers hurl at the king who makes war on the servants of Elohim (self-link).'),
  ('pseudepigrapha', '4-maccabees', 11, 3, 'canon', 'deuteronomy', 32, 36, 'free', E'Deuteronomy 32:36 — *Yahuah shall judge his people, and repent himself for his servants, when he seeth that their power is gone* — the justice of Heaven whose penalty the tyrant heaps up by *yet more misdeeds.*'),
  -- thread: 4-maccabees-11-unclean-meat-refused-the-reason-unconquered
  ('pseudepigrapha', '4-maccabees', 11, 16, 'canon', 'leviticus', 11, 7, 'free', E'Leviticus 11:7 — *And the swine, though he divide the hoof, and be clovenfooted, yet he cheweth not the cud; he is unclean to you* — the very flesh the boy will be tortured rather than eat, named unclean by the Lawgiver.'),
  ('pseudepigrapha', '4-maccabees', 11, 25, 'canon', 'leviticus', 11, 8, 'free', E'Leviticus 11:8 — *Of their flesh shall ye not eat, and their carcase shall ye not touch; they are unclean to you* — the standing command the king''s torments cannot break, his *impotence... to force us to eat unclean meat* the proof of his overthrow.'),
  ('pseudepigrapha', '4-maccabees', 11, 16, 'canon', 'deuteronomy', 14, 8, 'free', E'Deuteronomy 14:8 — *the swine, because it divideth the hoof, yet cheweth not the cud, it is unclean unto you: ye shall not eat of their flesh* — Moses'' repetition of the same prohibition the boy keeps under torture.'),
  ('pseudepigrapha', '4-maccabees', 11, 21, 'canon', 'matthew', 10, 28, 'free', E'Matthew 10:28 — *fear not them which kill the body, but are not able to kill the soul* — the unconquered Reason of the saints, who count the *contest worthy of saints* and are *not... conquered.*'),
  ('pseudepigrapha', '4-maccabees', 11, 14, 'apocrypha', '2-maccabees', 7, 1, 'free', E'2 Maccabees 7:1 — *seven brothers with their mother were taken, and compelled by the king against the law to taste swine''s flesh* — the sibling account of the same compulsion the boy refuses unto death (self-link).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session414_4macc11_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session414_4macc11_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '4-maccabees-11-we-worship-the-creator-and-live-by-his-law',
       E'We worship the Creator and live according to his virtuous Law',
       E'The fifth son springs forward and puts the charge to the tyrant: *Doth it seem evil to thee that we worship the Creator of all and live according to his virtuous Law?* For this they are *worthy of honours not of tortures.* He names what the king is: *now thou art Elohim''s enemy and makest war on those that worship Elohim.* The martyr''s whole crime is fidelity to the Lawgiver''s Law and the worship of the one Creator. It ain''t new — the same brothers in the sibling book warn the king *abide a while, and behold his great power, how he will torment you,* and Moses sang that *Yahuah shall judge his people, and repent himself for his servants.*',
       sv.verse_id, ev.verse_id, 'extras', 91250
  FROM _session414_4macc11_lookup sv, _session414_4macc11_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=11 AND sv.verse_number=2
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='4-maccabees' AND ev.chapter_number=11 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '4-maccabees-11-unclean-meat-refused-the-reason-unconquered',
       E'Torture for not eating unclean meat — the Reason unconquered',
       E'The sixth son, *a mere boy,* tells the tyrant he is *as old in mind* as his brethren: *so if thou chooseth to torture us for not eating unclean meat, torture.* In the midst of the fire he cries that the brothers *in the cause of righteousness... have not been conquered,* and that the king''s *impotence to alter our Reason or force us to eat unclean meat* is itself *an overthrow for thee.* The dietary refusal is no scruple but the Creator-Lawgiver''s standing command, kept *unto death.* It ain''t new — *the swine... is unclean to you... of their flesh shall ye not eat,* and the Messiah taught his own to *fear not them which kill the body.*',
       sv.verse_id, ev.verse_id, 'extras', 91253
  FROM _session414_4macc11_lookup sv, _session414_4macc11_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=11 AND sv.verse_number=14
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='4-maccabees' AND ev.chapter_number=11 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 4-maccabees-11-we-worship-the-creator-and-live-by-his-law
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 32:39 — *See now that I, even I, am he, and there is no god with me: I kill, and I make alive* — the one Creator the martyr worships and lives by, over against the tyrant who *makest war on those that worship Elohim.*'
  FROM cross_reference_threads t, cross_references x, _session414_4macc11_lookup sv, _session414_4macc11_lookup tv
 WHERE t.slug='4-maccabees-11-we-worship-the-creator-and-live-by-his-law'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=11 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=39
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Maccabees 7:17 — *abide a while, and behold his great power, how he will torment you and your seed* — the same warning the same brothers hurl at the king who makes war on the servants of Elohim (self-link).'
  FROM cross_reference_threads t, cross_references x, _session414_4macc11_lookup sv, _session414_4macc11_lookup tv
 WHERE t.slug='4-maccabees-11-we-worship-the-creator-and-live-by-his-law'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=11 AND sv.verse_number=8
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=7 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 32:36 — *Yahuah shall judge his people, and repent himself for his servants, when he seeth that their power is gone* — the justice of Heaven whose penalty the tyrant heaps up by *yet more misdeeds.*'
  FROM cross_reference_threads t, cross_references x, _session414_4macc11_lookup sv, _session414_4macc11_lookup tv
 WHERE t.slug='4-maccabees-11-we-worship-the-creator-and-live-by-his-law'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=11 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 4-maccabees-11-unclean-meat-refused-the-reason-unconquered
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 11:7 — *And the swine, though he divide the hoof, and be clovenfooted, yet he cheweth not the cud; he is unclean to you* — the very flesh the boy will be tortured rather than eat, named unclean by the Lawgiver.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc11_lookup sv, _session414_4macc11_lookup tv
 WHERE t.slug='4-maccabees-11-unclean-meat-refused-the-reason-unconquered'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=11 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=11 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 11:8 — *Of their flesh shall ye not eat, and their carcase shall ye not touch; they are unclean to you* — the standing command the king''s torments cannot break, his *impotence... to force us to eat unclean meat* the proof of his overthrow.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc11_lookup sv, _session414_4macc11_lookup tv
 WHERE t.slug='4-maccabees-11-unclean-meat-refused-the-reason-unconquered'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=11 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=11 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 14:8 — *the swine, because it divideth the hoof, yet cheweth not the cud, it is unclean unto you: ye shall not eat of their flesh* — Moses'' repetition of the same prohibition the boy keeps under torture.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc11_lookup sv, _session414_4macc11_lookup tv
 WHERE t.slug='4-maccabees-11-unclean-meat-refused-the-reason-unconquered'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=11 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=14 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 10:28 — *fear not them which kill the body, but are not able to kill the soul* — the unconquered Reason of the saints, who count the *contest worthy of saints* and are *not... conquered.*'
  FROM cross_reference_threads t, cross_references x, _session414_4macc11_lookup sv, _session414_4macc11_lookup tv
 WHERE t.slug='4-maccabees-11-unclean-meat-refused-the-reason-unconquered'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=11 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=10 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'2 Maccabees 7:1 — *seven brothers with their mother were taken, and compelled by the king against the law to taste swine''s flesh* — the sibling account of the same compulsion the boy refuses unto death (self-link).'
  FROM cross_reference_threads t, cross_references x, _session414_4macc11_lookup sv, _session414_4macc11_lookup tv
 WHERE t.slug='4-maccabees-11-unclean-meat-refused-the-reason-unconquered'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=11 AND sv.verse_number=14
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=7 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_4maccabees_12.sql (session414 4-maccabees 12) -----
-- Source anchor: pseudepigrapha/4-maccabees ch12. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 4macc12 (view _session414_4macc12_lookup). Sort band base 91275, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session414_4macc12_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 4-maccabees-12-the-divine-justice-delivers-thee-to-eternal-fire
  ('pseudepigrapha', '4-maccabees', 12, 12, 'canon', 'daniel', 12, 2, 'free', E'Daniel 12:2 — *many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt* — the two ends: the martyrs to life, the tyrant to *an eternal fire... to all eternity.*'),
  ('pseudepigrapha', '4-maccabees', 12, 12, 'apocrypha', '2-maccabees', 7, 17, 'free', E'2 Maccabees 7:17 — *behold his great power, how he will torment you and your seed* — the same divine justice against the king, pronounced by the same brothers (self-link).'),
  ('pseudepigrapha', '4-maccabees', 12, 15, 'canon', 'deuteronomy', 32, 36, 'free', E'Deuteronomy 32:36 — *Yahuah shall judge his people, and repent himself for his servants, when he seeth that their power is gone* — Elohim vindicating his servants who *have fulfilled their righteousness* and judging their oppressor.'),
  ('pseudepigrapha', '4-maccabees', 12, 15, 'canon', 'psalms', 79, 10, 'free', E'Psalm 79:10 — *let him be known among the heathen in our sight by the revenging of the blood of thy servants which is shed* — the avenging of the *champions of virtue* whom the tyrant unjustly slays.'),
  -- thread: 4-maccabees-12-elohim-of-my-fathers-be-merciful-to-my-nation
  ('pseudepigrapha', '4-maccabees', 12, 18, 'apocrypha', '2-maccabees', 7, 37, 'free', E'2 Maccabees 7:37 — *I, as my brothers, offer up my body and life for the laws of our fathers, beseeching Yahuah that he would speedily be merciful to our nation* — the same youngest brother''s identical prayer for mercy on the nation (self-link).'),
  ('pseudepigrapha', '4-maccabees', 12, 19, 'apocrypha', '2-maccabees', 7, 38, 'free', E'2 Maccabees 7:38 — *that in me and my brothers the wrath of the Almighty, which is justly brought upon our nation, may cease* — the same plea that the brothers'' deaths turn away wrath, and the king *will he punish* (self-link).'),
  ('pseudepigrapha', '4-maccabees', 12, 20, 'canon', 'matthew', 10, 28, 'free', E'Matthew 10:28 — *fear not them which kill the body, but are not able to kill the soul* — the courage of the boy who casts himself into the brazier, fearing not the fire but trusting the Elohim of his fathers.'),
  ('pseudepigrapha', '4-maccabees', 12, 18, 'canon', 'deuteronomy', 32, 36, 'free', E'Deuteronomy 32:36 — *Yahuah shall judge his people, and repent himself for his servants* — the mercy on the nation the dying boy invokes, the same compassion Moses sang of toward Elohim''s servants.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session414_4macc12_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session414_4macc12_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '4-maccabees-12-the-divine-justice-delivers-thee-to-eternal-fire',
       E'The divine justice delivers thee to an eternal fire',
       E'The youngest son, brought to the red-hot brazier, indicts the king who would *take thy blessings and thy kingship at the hands of Elohim, and... slay his servants and torture the followers of righteousness.* For this, *the divine justice delivers thee unto a more rapid and an eternal fire and torments which shall not leave hold on thee to all eternity.* While the martyrs *have fulfilled their righteousness towards Elohim in their noble deaths,* the tyrant shall *miserably cry ''Woe is me!''* The sentence on the king is the same the same brothers pronounce in the sibling book. It ain''t new — *many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt,* and *Yahuah... will torment you and your seed.*',
       sv.verse_id, ev.verse_id, 'extras', 91275
  FROM _session414_4macc12_lookup sv, _session414_4macc12_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=12 AND sv.verse_number=10
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='4-maccabees' AND ev.chapter_number=12 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '4-maccabees-12-elohim-of-my-fathers-be-merciful-to-my-nation',
       E'The Elohim of my fathers — be merciful unto my nation',
       E'Standing *on the brink of death,* the youngest declares, *I am no renegade to the witness borne by my brethren,* and prays: *I call upon the Elohim of my fathers to be merciful unto my nation. And thee will he punish both in this present life and after that thou art dead.* Then he *cast himself into the red-hot brazier, and so gave up the ghost.* The same youngest brother in the sibling book offers his body for the laws of his fathers, *beseeching Yahuah that he would speedily be merciful to our nation.* It ain''t new — the plea for the nation, the doom on the persecutor, the body given for the laws of the fathers; *fear not them which kill the body, but are not able to kill the soul.*',
       sv.verse_id, ev.verse_id, 'extras', 91278
  FROM _session414_4macc12_lookup sv, _session414_4macc12_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=12 AND sv.verse_number=17
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='4-maccabees' AND ev.chapter_number=12 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 4-maccabees-12-the-divine-justice-delivers-thee-to-eternal-fire
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 12:2 — *many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt* — the two ends: the martyrs to life, the tyrant to *an eternal fire... to all eternity.*'
  FROM cross_reference_threads t, cross_references x, _session414_4macc12_lookup sv, _session414_4macc12_lookup tv
 WHERE t.slug='4-maccabees-12-the-divine-justice-delivers-thee-to-eternal-fire'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=12 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Maccabees 7:17 — *behold his great power, how he will torment you and your seed* — the same divine justice against the king, pronounced by the same brothers (self-link).'
  FROM cross_reference_threads t, cross_references x, _session414_4macc12_lookup sv, _session414_4macc12_lookup tv
 WHERE t.slug='4-maccabees-12-the-divine-justice-delivers-thee-to-eternal-fire'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=12 AND sv.verse_number=12
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=7 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 32:36 — *Yahuah shall judge his people, and repent himself for his servants, when he seeth that their power is gone* — Elohim vindicating his servants who *have fulfilled their righteousness* and judging their oppressor.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc12_lookup sv, _session414_4macc12_lookup tv
 WHERE t.slug='4-maccabees-12-the-divine-justice-delivers-thee-to-eternal-fire'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=12 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 79:10 — *let him be known among the heathen in our sight by the revenging of the blood of thy servants which is shed* — the avenging of the *champions of virtue* whom the tyrant unjustly slays.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc12_lookup sv, _session414_4macc12_lookup tv
 WHERE t.slug='4-maccabees-12-the-divine-justice-delivers-thee-to-eternal-fire'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=12 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=79 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 4-maccabees-12-elohim-of-my-fathers-be-merciful-to-my-nation
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Maccabees 7:37 — *I, as my brothers, offer up my body and life for the laws of our fathers, beseeching Yahuah that he would speedily be merciful to our nation* — the same youngest brother''s identical prayer for mercy on the nation (self-link).'
  FROM cross_reference_threads t, cross_references x, _session414_4macc12_lookup sv, _session414_4macc12_lookup tv
 WHERE t.slug='4-maccabees-12-elohim-of-my-fathers-be-merciful-to-my-nation'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=12 AND sv.verse_number=18
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=7 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Maccabees 7:38 — *that in me and my brothers the wrath of the Almighty, which is justly brought upon our nation, may cease* — the same plea that the brothers'' deaths turn away wrath, and the king *will he punish* (self-link).'
  FROM cross_reference_threads t, cross_references x, _session414_4macc12_lookup sv, _session414_4macc12_lookup tv
 WHERE t.slug='4-maccabees-12-elohim-of-my-fathers-be-merciful-to-my-nation'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=12 AND sv.verse_number=19
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=7 AND tv.verse_number=38
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 10:28 — *fear not them which kill the body, but are not able to kill the soul* — the courage of the boy who casts himself into the brazier, fearing not the fire but trusting the Elohim of his fathers.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc12_lookup sv, _session414_4macc12_lookup tv
 WHERE t.slug='4-maccabees-12-elohim-of-my-fathers-be-merciful-to-my-nation'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=12 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=10 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Deuteronomy 32:36 — *Yahuah shall judge his people, and repent himself for his servants* — the mercy on the nation the dying boy invokes, the same compassion Moses sang of toward Elohim''s servants.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc12_lookup sv, _session414_4macc12_lookup tv
 WHERE t.slug='4-maccabees-12-elohim-of-my-fathers-be-merciful-to-my-nation'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=12 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_4maccabees_13.sql (session414 4-maccabees 13) -----
-- Source anchor: pseudepigrapha/4-maccabees ch13. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 4macc13 (view _session414_4macc13_lookup). Sort band base 91300, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session414_4macc13_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 4-maccabees-13-imitate-the-three-children-in-the-furnace
  ('pseudepigrapha', '4-maccabees', 13, 10, 'canon', 'daniel', 3, 16, 'free', E'Daniel 3:16 — *Shadrach, Meshach, and Abed-nego, answered and said to the king, O Nebuchadnezzar, we are not careful to answer thee in this matter* — the Three Children whose contempt of the furnace the seven brothers set themselves to imitate.'),
  ('pseudepigrapha', '4-maccabees', 13, 10, 'canon', 'daniel', 3, 17, 'free', E'Daniel 3:17 — *our Elohim (God) whom we serve is able to deliver us from the burning fiery furnace, and he will deliver us out of thine hand, O king* — the faith that despised the same ordeal of the furnace the youths now face.'),
  ('pseudepigrapha', '4-maccabees', 13, 10, 'canon', 'daniel', 3, 18, 'free', E'Daniel 3:18 — *But if not, be it known unto thee, O king, that we will not serve thy gods, nor worship the golden image which thou hast set up* — the refusal unto death, deliverance or none, that the brothers take as their charter.'),
  ('pseudepigrapha', '4-maccabees', 13, 11, 'canon', 'daniel', 3, 27, 'free', E'Daniel 3:27 — *upon whose bodies the fire had no power, nor was an hair of their head singed, neither were their coats changed, nor the smell of fire had passed on them* — the proof of righteousness the seven would not turn craven before, the furnace overcome.'),
  ('pseudepigrapha', '4-maccabees', 13, 11, 'canon', 'daniel', 3, 28, 'free', E'Daniel 3:28 — *Blessed be the Elohim (God) of Shadrach, Meshach, and Abed-nego, who hath sent his angel, and delivered his servants that trusted in him... and yielded their bodies, that they might not serve nor worship any god, except their own Elohim (God)* — bodies yielded rather than the idol served, the brothers'' own resolve foreshadowed.'),
  ('pseudepigrapha', '4-maccabees', 13, 10, 'apocrypha', 'the-song-of-the-three-holy-children', 1, 1, 'free', E'Song of the Three Holy Children 1:1 — *And they walked in the midst of the fire, praising Yahuah (God), and blessing Yahuah (God)* — the Three Children singing in the very flame the brothers vow to imitate (self-link).'),
  -- thread: 4-maccabees-13-isaac-yielded-and-the-fathers-receive-us
  ('pseudepigrapha', '4-maccabees', 13, 12, 'canon', 'genesis', 22, 9, 'free', E'Genesis 22:9 — *Abraham built an altar there, and laid the wood in order, and bound Isaac his son, and laid him on the altar upon the wood* — the fatherly hand at which Isaac for righteousness'' sake yielded himself, the martyrs'' charter.'),
  ('pseudepigrapha', '4-maccabees', 13, 12, 'canon', 'genesis', 22, 10, 'free', E'Genesis 22:10 — *And Abraham stretched forth his hand, and took the knife to slay his son* — Isaac unflinching beneath the lifted knife, the willing sacrifice the brothers remember as they face the fire.'),
  ('pseudepigrapha', '4-maccabees', 13, 12, 'canon', 'hebrews', 11, 17, 'free', E'Hebrews 11:17 — *By faith Abraham, when he was tried, offered up Isaac: and he that had received the promises offered up his only begotten son* — the same offering of Isaac the brothers invoke, the NT naming it the act of faith.'),
  ('pseudepigrapha', '4-maccabees', 13, 14, 'canon', 'matthew', 10, 28, 'free', E'Matthew 10:28 — *fear not them which kill the body, but are not able to kill the soul: but rather fear him which is able to destroy both soul and body in hell* — the Messiah''s own word, the brothers'' *let us not fear him who thinketh he kills* together with the eternal torment of the transgressor.'),
  ('pseudepigrapha', '4-maccabees', 13, 17, 'canon', 'matthew', 8, 11, 'free', E'Matthew 8:11 — *many shall come from the east and west, and shall sit down with Abraham, and Isaac, and Jacob, in the kingdom of heaven* — the fathers receiving the faithful, the very hope the brothers hold across the fire.'),
  ('pseudepigrapha', '4-maccabees', 13, 17, 'canon', 'luke', 16, 22, 'free', E'Luke 16:22 — *the beggar died, and was carried by the angels into Abraham''s bosom* — the patriarchs receiving the righteous at death, the welcome the brothers expect of Abraham, Isaac, and Jacob.'),
  -- thread: 4-maccabees-13-brotherly-love-bred-under-the-law
  ('pseudepigrapha', '4-maccabees', 13, 23, 'canon', 'psalms', 133, 1, 'free', E'Psalm 133:1 — *Behold, how good and how pleasant it is for brethren to dwell together in unity!* — the concord of brethren the seven embodied, made stronger by their common discipline under the Law.'),
  ('pseudepigrapha', '4-maccabees', 13, 25, 'canon', 'romans', 12, 10, 'free', E'Romans 12:10 — *Be kindly affectioned one to another with brotherly love; in honour preferring one another* — the apostolic charge that names the very love the brothers showed, trained in the same Law.'),
  ('pseudepigrapha', '4-maccabees', 13, 26, 'canon', '1-john', 3, 14, 'free', E'1 John 3:14 — *We know that we have passed from death unto life, because we love the brethren. He that loveth not his brother abideth in death* — the love of the brethren as the mark of life, the bond their piety made fervent.'),
  ('pseudepigrapha', '4-maccabees', 13, 26, 'canon', '1-john', 3, 16, 'free', E'1 John 3:16 — *Hereby perceive we the love of Elohim (God), because he laid down his life for us: and we ought to lay down our lives for the brethren* — the laying-down-of-life for one''s brethren the seven enacted to the death, brotherly love bred under the Law.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session414_4macc13_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session414_4macc13_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '4-maccabees-13-imitate-the-three-children-in-the-furnace',
       E'Let us imitate the Three Children who despised the furnace',
       E'As the seven cheer one another on, they reach for a remembered deliverance: *Let us imitate the Three Children at the Assyrian court who despised this same ordeal of the furnace. Let us not turn cravens before the proof of righteousness.* The pattern is fixed already in the Tanakh — Shadrach, Meshach, and Abed-nego who would not bow, who answered the king *we are not careful to answer thee in this matter,* and who walked unburnt in the flame because the El Elyon went down with them. It ain''t new — *if it be so, our Elohim whom we serve is able to deliver us from the burning fiery furnace... but if not, be it known unto thee, O king, that we will not serve thy gods;* the brothers do not invent their courage, they imitate it.',
       sv.verse_id, ev.verse_id, 'extras', 91300
  FROM _session414_4macc13_lookup sv, _session414_4macc13_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=13 AND sv.verse_number=9
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='4-maccabees' AND ev.chapter_number=13 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '4-maccabees-13-isaac-yielded-and-the-fathers-receive-us',
       E'Isaac yielded himself — fear not the killer, the fathers shall receive us',
       E'Each brother stiffens the next with the memory of the Akedah and the certainty beyond death: *Remember of what stock ye are, and at whose fatherly hand Isaac for righteousness'' sake yielded himself to be a sacrifice.* So they swear, *let us not fear him who thinketh he kills,* for *eternal torment awaits those who transgress the ordinance of Elohim,* and they look past the fire: *Abraham, Isaac, and Jacob shall receive us, and all our forefathers shall praise us.* The Akedah, the fear that is wrongly placed, the patriarchs who live to receive their sons — every clause is already written. It ain''t new — Abraham *bound Isaac his son, and laid him on the altar,* the Messiah would say *fear not them which kill the body,* and *many shall come from the east and west, and shall sit down with Abraham, and Isaac, and Jacob.*',
       sv.verse_id, ev.verse_id, 'extras', 91303
  FROM _session414_4macc13_lookup sv, _session414_4macc13_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=13 AND sv.verse_number=12
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='4-maccabees' AND ev.chapter_number=13 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '4-maccabees-13-brotherly-love-bred-under-the-law',
       E'Brotherly love made strong by discipline under the Law',
       E'The writer traces the seven''s fierce loyalty to its root: nature knit them at the breast, *nourished from the same blood,* *nursed together in arms,* but the bond was forged stronger still *through our discipline under the Law of Elohim.* *For trained in the same Law, and disciplined in the same virtues, and brought up together in the upright life, they loved one another the more abundantly.* The Law does not chill love — it is the very school that makes brotherly love fervent. It ain''t new — *how good and how pleasant it is for brethren to dwell together in unity,* *be kindly affectioned one to another with brotherly love,* and *we know that we have passed from death unto life, because we love the brethren.*',
       sv.verse_id, ev.verse_id, 'extras', 91306
  FROM _session414_4macc13_lookup sv, _session414_4macc13_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=13 AND sv.verse_number=19
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='4-maccabees' AND ev.chapter_number=13 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 4-maccabees-13-imitate-the-three-children-in-the-furnace
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 3:16 — *Shadrach, Meshach, and Abed-nego, answered and said to the king, O Nebuchadnezzar, we are not careful to answer thee in this matter* — the Three Children whose contempt of the furnace the seven brothers set themselves to imitate.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc13_lookup sv, _session414_4macc13_lookup tv
 WHERE t.slug='4-maccabees-13-imitate-the-three-children-in-the-furnace'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=13 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=3 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 3:17 — *our Elohim (God) whom we serve is able to deliver us from the burning fiery furnace, and he will deliver us out of thine hand, O king* — the faith that despised the same ordeal of the furnace the youths now face.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc13_lookup sv, _session414_4macc13_lookup tv
 WHERE t.slug='4-maccabees-13-imitate-the-three-children-in-the-furnace'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=13 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=3 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 3:18 — *But if not, be it known unto thee, O king, that we will not serve thy gods, nor worship the golden image which thou hast set up* — the refusal unto death, deliverance or none, that the brothers take as their charter.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc13_lookup sv, _session414_4macc13_lookup tv
 WHERE t.slug='4-maccabees-13-imitate-the-three-children-in-the-furnace'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=13 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=3 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Daniel 3:27 — *upon whose bodies the fire had no power, nor was an hair of their head singed, neither were their coats changed, nor the smell of fire had passed on them* — the proof of righteousness the seven would not turn craven before, the furnace overcome.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc13_lookup sv, _session414_4macc13_lookup tv
 WHERE t.slug='4-maccabees-13-imitate-the-three-children-in-the-furnace'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=13 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=3 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Daniel 3:28 — *Blessed be the Elohim (God) of Shadrach, Meshach, and Abed-nego, who hath sent his angel, and delivered his servants that trusted in him... and yielded their bodies, that they might not serve nor worship any god, except their own Elohim (God)* — bodies yielded rather than the idol served, the brothers'' own resolve foreshadowed.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc13_lookup sv, _session414_4macc13_lookup tv
 WHERE t.slug='4-maccabees-13-imitate-the-three-children-in-the-furnace'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=13 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=3 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Song of the Three Holy Children 1:1 — *And they walked in the midst of the fire, praising Yahuah (God), and blessing Yahuah (God)* — the Three Children singing in the very flame the brothers vow to imitate (self-link).'
  FROM cross_reference_threads t, cross_references x, _session414_4macc13_lookup sv, _session414_4macc13_lookup tv
 WHERE t.slug='4-maccabees-13-imitate-the-three-children-in-the-furnace'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=13 AND sv.verse_number=10
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-song-of-the-three-holy-children' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 4-maccabees-13-isaac-yielded-and-the-fathers-receive-us
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 22:9 — *Abraham built an altar there, and laid the wood in order, and bound Isaac his son, and laid him on the altar upon the wood* — the fatherly hand at which Isaac for righteousness'' sake yielded himself, the martyrs'' charter.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc13_lookup sv, _session414_4macc13_lookup tv
 WHERE t.slug='4-maccabees-13-isaac-yielded-and-the-fathers-receive-us'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=13 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 22:10 — *And Abraham stretched forth his hand, and took the knife to slay his son* — Isaac unflinching beneath the lifted knife, the willing sacrifice the brothers remember as they face the fire.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc13_lookup sv, _session414_4macc13_lookup tv
 WHERE t.slug='4-maccabees-13-isaac-yielded-and-the-fathers-receive-us'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=13 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 11:17 — *By faith Abraham, when he was tried, offered up Isaac: and he that had received the promises offered up his only begotten son* — the same offering of Isaac the brothers invoke, the NT naming it the act of faith.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc13_lookup sv, _session414_4macc13_lookup tv
 WHERE t.slug='4-maccabees-13-isaac-yielded-and-the-fathers-receive-us'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=13 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 10:28 — *fear not them which kill the body, but are not able to kill the soul: but rather fear him which is able to destroy both soul and body in hell* — the Messiah''s own word, the brothers'' *let us not fear him who thinketh he kills* together with the eternal torment of the transgressor.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc13_lookup sv, _session414_4macc13_lookup tv
 WHERE t.slug='4-maccabees-13-isaac-yielded-and-the-fathers-receive-us'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=13 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=10 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Matthew 8:11 — *many shall come from the east and west, and shall sit down with Abraham, and Isaac, and Jacob, in the kingdom of heaven* — the fathers receiving the faithful, the very hope the brothers hold across the fire.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc13_lookup sv, _session414_4macc13_lookup tv
 WHERE t.slug='4-maccabees-13-isaac-yielded-and-the-fathers-receive-us'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=13 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=8 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Luke 16:22 — *the beggar died, and was carried by the angels into Abraham''s bosom* — the patriarchs receiving the righteous at death, the welcome the brothers expect of Abraham, Isaac, and Jacob.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc13_lookup sv, _session414_4macc13_lookup tv
 WHERE t.slug='4-maccabees-13-isaac-yielded-and-the-fathers-receive-us'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=13 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=16 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 4-maccabees-13-brotherly-love-bred-under-the-law
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 133:1 — *Behold, how good and how pleasant it is for brethren to dwell together in unity!* — the concord of brethren the seven embodied, made stronger by their common discipline under the Law.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc13_lookup sv, _session414_4macc13_lookup tv
 WHERE t.slug='4-maccabees-13-brotherly-love-bred-under-the-law'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=13 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=133 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 12:10 — *Be kindly affectioned one to another with brotherly love; in honour preferring one another* — the apostolic charge that names the very love the brothers showed, trained in the same Law.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc13_lookup sv, _session414_4macc13_lookup tv
 WHERE t.slug='4-maccabees-13-brotherly-love-bred-under-the-law'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=13 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=12 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 John 3:14 — *We know that we have passed from death unto life, because we love the brethren. He that loveth not his brother abideth in death* — the love of the brethren as the mark of life, the bond their piety made fervent.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc13_lookup sv, _session414_4macc13_lookup tv
 WHERE t.slug='4-maccabees-13-brotherly-love-bred-under-the-law'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=13 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 John 3:16 — *Hereby perceive we the love of Elohim (God), because he laid down his life for us: and we ought to lay down our lives for the brethren* — the laying-down-of-life for one''s brethren the seven enacted to the death, brotherly love bred under the Law.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc13_lookup sv, _session414_4macc13_lookup tv
 WHERE t.slug='4-maccabees-13-brotherly-love-bred-under-the-law'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=13 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_4maccabees_14.sql (session414 4-maccabees 14) -----
-- Source anchor: pseudepigrapha/4-maccabees ch14. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 4macc14 (view _session414_4macc14_lookup). Sort band base 91325, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session414_4macc14_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 4-maccabees-14-a-soul-like-abraham
  ('pseudepigrapha', '4-maccabees', 14, 20, 'canon', 'genesis', 22, 10, 'free', E'Genesis 22:10 — *And Abraham stretched forth his hand, and took the knife to slay his son* — the readiness of Abraham, the soul the mother is said to share, unmoved by natural affection.'),
  ('pseudepigrapha', '4-maccabees', 14, 20, 'canon', 'genesis', 22, 12, 'free', E'Genesis 22:12 — *now I know that thou fearest Elohim (God), seeing thou hast not withheld thy son, thine only son from me* — the fear of Elohim above kin that the mother, *with a soul like Abraham,* proves over seven children.'),
  ('pseudepigrapha', '4-maccabees', 14, 12, 'canon', 'hebrews', 11, 35, 'free', E'Hebrews 11:35 — *and others were tortured, not accepting deliverance; that they might obtain a better resurrection* — the NT''s own allusion to this martyrdom, the mother and sons enduring the torments for the better resurrection.'),
  ('pseudepigrapha', '4-maccabees', 14, 20, 'canon', 'hebrews', 11, 17, 'free', E'Hebrews 11:17 — *By faith Abraham, when he was tried, offered up Isaac: and he that had received the promises offered up his only begotten son* — the offering the mother''s soul is likened to, faith that would not draw back from surrendering the child.'),
  ('pseudepigrapha', '4-maccabees', 14, 20, 'apocrypha', '2-maccabees', 7, 20, 'free', E'2 Maccabees 7:20 — *But the mother was marvellous above all, and worthy of honourable memory: for when she saw her seven sons slain within the space of one day, she bare it with a good courage* — the sibling martyrology''s praise of the same mother enduring all seven deaths (self-link).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session414_4macc14_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session414_4macc14_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '4-maccabees-14-a-soul-like-abraham',
       E'★ A soul like Abraham — the mother unmoved by mother-love',
       E'The writer turns from the seven sons to their mother, marvelling that *even a woman''s soul despised a yet greater diversity of pains; for the mother of the seven youths endured the torments inflicted on each several one of her children.* Though *the yearnings of a mother''s heart* make her *feeling for her offspring... the centre of her whole world,* she stood firm: *she, the mother of those young men, with a soul like Abraham, was not moved from her purpose by her affection for her children.* The pattern named is the Akedah — Abraham who *withheld not* his only son when Elohim tried him, accounting that the Lawgiver could raise him. It ain''t new — *thou hast not withheld thy son, thine only son from me,* and the writer of the Hebrews knew this very martyrdom: *others were tortured, not accepting deliverance; that they might obtain a better resurrection.*',
       sv.verse_id, ev.verse_id, 'extras', 91325
  FROM _session414_4macc14_lookup sv, _session414_4macc14_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=14 AND sv.verse_number=11
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='4-maccabees' AND ev.chapter_number=14 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 4-maccabees-14-a-soul-like-abraham
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 22:10 — *And Abraham stretched forth his hand, and took the knife to slay his son* — the readiness of Abraham, the soul the mother is said to share, unmoved by natural affection.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc14_lookup sv, _session414_4macc14_lookup tv
 WHERE t.slug='4-maccabees-14-a-soul-like-abraham'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=14 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 22:12 — *now I know that thou fearest Elohim (God), seeing thou hast not withheld thy son, thine only son from me* — the fear of Elohim above kin that the mother, *with a soul like Abraham,* proves over seven children.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc14_lookup sv, _session414_4macc14_lookup tv
 WHERE t.slug='4-maccabees-14-a-soul-like-abraham'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=14 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 11:35 — *and others were tortured, not accepting deliverance; that they might obtain a better resurrection* — the NT''s own allusion to this martyrdom, the mother and sons enduring the torments for the better resurrection.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc14_lookup sv, _session414_4macc14_lookup tv
 WHERE t.slug='4-maccabees-14-a-soul-like-abraham'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=14 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hebrews 11:17 — *By faith Abraham, when he was tried, offered up Isaac: and he that had received the promises offered up his only begotten son* — the offering the mother''s soul is likened to, faith that would not draw back from surrendering the child.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc14_lookup sv, _session414_4macc14_lookup tv
 WHERE t.slug='4-maccabees-14-a-soul-like-abraham'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=14 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'2 Maccabees 7:20 — *But the mother was marvellous above all, and worthy of honourable memory: for when she saw her seven sons slain within the space of one day, she bare it with a good courage* — the sibling martyrology''s praise of the same mother enduring all seven deaths (self-link).'
  FROM cross_reference_threads t, cross_references x, _session414_4macc14_lookup sv, _session414_4macc14_lookup tv
 WHERE t.slug='4-maccabees-14-a-soul-like-abraham'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=14 AND sv.verse_number=20
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=7 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_4maccabees_15.sql (session414 4-maccabees 15) -----
-- Source anchor: pseudepigrapha/4-maccabees ch15. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 4macc15 (view _session414_4macc15_lookup). Sort band base 91350, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session414_4macc15_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 4-maccabees-15-religion-dearer-than-her-children
  ('pseudepigrapha', '4-maccabees', 15, 3, 'canon', 'deuteronomy', 13, 6, 'free', E'Deuteronomy 13:6 — *If thy brother, the son of thy mother, or thy son, or thy daughter, or the wife of thy bosom, or thy friend, which is as thine own soul, entice thee secretly, saying, Let us go and serve other gods* — the nearest kin named, none of whom may be loved above Yahuah, the very test the mother passes.'),
  ('pseudepigrapha', '4-maccabees', 15, 8, 'canon', 'deuteronomy', 13, 8, 'free', E'Deuteronomy 13:8 — *Thou shalt not consent unto him, nor hearken unto him; neither shall thine eye pity him, neither shalt thou spare, neither shalt thou conceal him* — love of Elohim that does not yield even to a child, the resolve the mother held over her seven sons.'),
  ('pseudepigrapha', '4-maccabees', 15, 3, 'canon', 'deuteronomy', 13, 3, 'free', E'Deuteronomy 13:3 — *Yahuah Elohaychem (the LORD your God) proveth you, to know whether ye love Yahuah Elohaychem (the LORD your God) with all your heart and with all your soul* — the proving of love for Elohim above all, the trial the mother is brought through.'),
  ('pseudepigrapha', '4-maccabees', 15, 1, 'canon', 'matthew', 10, 37, 'free', E'Matthew 10:37 — *He that loveth father or mother more than me is not worthy of me: and he that loveth son or daughter more than me is not worthy of me* — the Master''s own word, the same ordering of love the mother chose in loving religion above her children.'),
  ('pseudepigrapha', '4-maccabees', 15, 2, 'canon', 'matthew', 10, 39, 'free', E'Matthew 10:39 — *He that findeth his life shall lose it: and he that loseth his life for my sake shall find it* — the saving unto eternal life the mother chose over the present saving alive of her sons.'),
  -- thread: 4-maccabees-15-true-daughter-of-abraham
  ('pseudepigrapha', '4-maccabees', 15, 28, 'canon', 'genesis', 22, 12, 'free', E'Genesis 22:12 — *now I know that thou fearest Elohim (God), seeing thou hast not withheld thy son, thine only son from me* — the Elohim-fearing courage of Abraham the mother calls to mind as his true daughter.'),
  ('pseudepigrapha', '4-maccabees', 15, 28, 'canon', 'genesis', 22, 18, 'free', E'Genesis 22:18 — *And in thy seed shall all the nations of the earth be blessed; because thou hast obeyed my voice* — the obedient seed of Abraham, the line the mother proves herself daughter of by her faith.'),
  ('pseudepigrapha', '4-maccabees', 15, 25, 'canon', 'hebrews', 11, 19, 'free', E'Hebrews 11:19 — *Accounting that Elohim (God) was able to raise him up, even from the dead; from whence also he received him in a figure* — the faith by which Abraham surrendered Isaac, the same by which the mother surrendered her sons through faith in Elohim.'),
  ('pseudepigrapha', '4-maccabees', 15, 31, 'canon', 'genesis', 7, 1, 'free', E'Genesis 7:1 — *Come thou and all thy house into the ark; for thee have I seen righteous before me in this generation* — Noah''s ark bearing the living world through the flood, the figure of the mother as keeper of the Law weathering the surging waves.'),
  ('pseudepigrapha', '4-maccabees', 15, 32, 'canon', 'genesis', 7, 17, 'free', E'Genesis 7:17 — *And the flood was forty days upon the earth; and the waters increased, and bare up the ark, and it was lift up above the earth* — the ark borne up above the world-whelming deluge, the mother likewise unsunk by the surging waves of the passions.'),
  ('pseudepigrapha', '4-maccabees', 15, 31, 'canon', 'hebrews', 11, 7, 'free', E'Hebrews 11:7 — *By faith Noah, being warned of Elohim (God) of things not seen as yet, moved with fear, prepared an ark to the saving of his house... and became heir of the righteousness which is by faith* — Noah''s faith that built the ark, the righteousness the Law-keeping mother shares as she weathers the storm.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session414_4macc15_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session414_4macc15_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '4-maccabees-15-religion-dearer-than-her-children',
       E'★ Religion dearer than her children — love of Elohim above kin',
       E'The writer cries out at the mother''s choice: *O Reason of the sons, lord over the passions! O religion, that wast dearer to the mother than her children!* Set between *religion and the present saving alive of her seven sons,* she *loved rather religion, which saveth unto eternal life according to Elohim.* This is no cold heart — *through the fear of Elohim she rejected the present safety of her children* — but the very order the Law commands: the love of Yahuah above brother, son, daughter, or the wife of one''s bosom. It ain''t new — Moses charged that not even *thy son, or thy daughter* may turn the heart from Yahuah, and the Master said the same: *he that loveth son or daughter more than me is not worthy of me.*',
       sv.verse_id, ev.verse_id, 'extras', 91350
  FROM _session414_4macc15_lookup sv, _session414_4macc15_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=15 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='4-maccabees' AND ev.chapter_number=15 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '4-maccabees-15-true-daughter-of-abraham',
       E'★ A true daughter of Abraham — and the Ark that weathered the Deluge',
       E'Seeing her seven children destroyed, *the noble mother willingly surrendered them through faith in Elohim,* and *as a true daughter of Abraham, called to mind his Elohim-fearing courage.* The writer hails her *O mother of the race, vindicator of our Law, defender of our religion,* and crowns the figure with Noah: *as the Ark of Noah, with the whole living world for her burden in the world-whelming Deluge, did withstand the mighty surges, so thou, the keeper of the Law... didst nobly weather the storms.* Her courage is Abraham''s at the Akedah, her steadfastness Noah''s ark riding the flood. It ain''t new — Abraham, tried, *withheld not* his only son, and Noah, *being warned of Elohim of things not seen as yet... prepared an ark to the saving of his house.*',
       sv.verse_id, ev.verse_id, 'extras', 91353
  FROM _session414_4macc15_lookup sv, _session414_4macc15_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=15 AND sv.verse_number=24
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='4-maccabees' AND ev.chapter_number=15 AND ev.verse_number=32
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 4-maccabees-15-religion-dearer-than-her-children
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 13:6 — *If thy brother, the son of thy mother, or thy son, or thy daughter, or the wife of thy bosom, or thy friend, which is as thine own soul, entice thee secretly, saying, Let us go and serve other gods* — the nearest kin named, none of whom may be loved above Yahuah, the very test the mother passes.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc15_lookup sv, _session414_4macc15_lookup tv
 WHERE t.slug='4-maccabees-15-religion-dearer-than-her-children'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=15 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=13 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 13:8 — *Thou shalt not consent unto him, nor hearken unto him; neither shall thine eye pity him, neither shalt thou spare, neither shalt thou conceal him* — love of Elohim that does not yield even to a child, the resolve the mother held over her seven sons.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc15_lookup sv, _session414_4macc15_lookup tv
 WHERE t.slug='4-maccabees-15-religion-dearer-than-her-children'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=15 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=13 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 13:3 — *Yahuah Elohaychem (the LORD your God) proveth you, to know whether ye love Yahuah Elohaychem (the LORD your God) with all your heart and with all your soul* — the proving of love for Elohim above all, the trial the mother is brought through.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc15_lookup sv, _session414_4macc15_lookup tv
 WHERE t.slug='4-maccabees-15-religion-dearer-than-her-children'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=15 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=13 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 10:37 — *He that loveth father or mother more than me is not worthy of me: and he that loveth son or daughter more than me is not worthy of me* — the Master''s own word, the same ordering of love the mother chose in loving religion above her children.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc15_lookup sv, _session414_4macc15_lookup tv
 WHERE t.slug='4-maccabees-15-religion-dearer-than-her-children'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=15 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=10 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Matthew 10:39 — *He that findeth his life shall lose it: and he that loseth his life for my sake shall find it* — the saving unto eternal life the mother chose over the present saving alive of her sons.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc15_lookup sv, _session414_4macc15_lookup tv
 WHERE t.slug='4-maccabees-15-religion-dearer-than-her-children'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=15 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=10 AND tv.verse_number=39
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 4-maccabees-15-true-daughter-of-abraham
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 22:12 — *now I know that thou fearest Elohim (God), seeing thou hast not withheld thy son, thine only son from me* — the Elohim-fearing courage of Abraham the mother calls to mind as his true daughter.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc15_lookup sv, _session414_4macc15_lookup tv
 WHERE t.slug='4-maccabees-15-true-daughter-of-abraham'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=15 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 22:18 — *And in thy seed shall all the nations of the earth be blessed; because thou hast obeyed my voice* — the obedient seed of Abraham, the line the mother proves herself daughter of by her faith.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc15_lookup sv, _session414_4macc15_lookup tv
 WHERE t.slug='4-maccabees-15-true-daughter-of-abraham'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=15 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 11:19 — *Accounting that Elohim (God) was able to raise him up, even from the dead; from whence also he received him in a figure* — the faith by which Abraham surrendered Isaac, the same by which the mother surrendered her sons through faith in Elohim.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc15_lookup sv, _session414_4macc15_lookup tv
 WHERE t.slug='4-maccabees-15-true-daughter-of-abraham'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=15 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 7:1 — *Come thou and all thy house into the ark; for thee have I seen righteous before me in this generation* — Noah''s ark bearing the living world through the flood, the figure of the mother as keeper of the Law weathering the surging waves.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc15_lookup sv, _session414_4macc15_lookup tv
 WHERE t.slug='4-maccabees-15-true-daughter-of-abraham'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=15 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=7 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Genesis 7:17 — *And the flood was forty days upon the earth; and the waters increased, and bare up the ark, and it was lift up above the earth* — the ark borne up above the world-whelming deluge, the mother likewise unsunk by the surging waves of the passions.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc15_lookup sv, _session414_4macc15_lookup tv
 WHERE t.slug='4-maccabees-15-true-daughter-of-abraham'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=15 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=7 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Hebrews 11:7 — *By faith Noah, being warned of Elohim (God) of things not seen as yet, moved with fear, prepared an ark to the saving of his house... and became heir of the righteousness which is by faith* — Noah''s faith that built the ark, the righteousness the Law-keeping mother shares as she weathers the storm.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc15_lookup sv, _session414_4macc15_lookup tv
 WHERE t.slug='4-maccabees-15-true-daughter-of-abraham'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=15 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_4maccabees_16.sql (session414 4-maccabees 16) -----
-- Source anchor: pseudepigrapha/4-maccabees ch16. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 4macc16 (view _session414_4macc16_lookup). Sort band base 91375, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session414_4macc16_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 4-maccabees-16-abraham-hastened-to-sacrifice-isaac
  ('pseudepigrapha', '4-maccabees', 16, 20, 'canon', 'genesis', 22, 9, 'free', E'Genesis 22:9 — *And they came to the place which Elohim (God) had told him of; and Abraham built an altar there, and laid the wood in order, and bound Isaac his son, and laid him on the altar upon the wood* — the binding the mother recalls, Abraham hastening to do the hard thing Elohim commanded.'),
  ('pseudepigrapha', '4-maccabees', 16, 20, 'canon', 'genesis', 22, 10, 'free', E'Genesis 22:10 — *And Abraham stretched forth his hand, and took the knife to slay his son* — the very knife of the mother''s words, the lifted hand at which Isaac *did not shrink.*'),
  ('pseudepigrapha', '4-maccabees', 16, 20, 'canon', 'genesis', 22, 12, 'free', E'Genesis 22:12 — *Lay not thine hand upon the lad... for now I know that thou fearest Elohim (God), seeing thou hast not withheld thy son, thine only son from me* — the tested fear of Elohim the martyr-mother holds up to her own seven sons.'),
  ('pseudepigrapha', '4-maccabees', 16, 20, 'canon', 'hebrews', 11, 17, 'free', E'Hebrews 11:17 — *By faith Abraham, when he was tried, offered up Isaac: and he that had received the promises offered up his only begotten son* — the same offering, the NT naming it the faith that does not withhold.'),
  ('pseudepigrapha', '4-maccabees', 16, 20, 'canon', 'hebrews', 11, 19, 'free', E'Hebrews 11:19 — *Accounting that Elohim (God) was able to raise him up, even from the dead; from whence also he received him in a figure* — the resurrection-confidence beneath the knife, the very hope that lets the mother''s sons not shrink.'),
  ('pseudepigrapha', '4-maccabees', 16, 20, 'canon', 'james', 2, 21, 'free', E'James 2:21 — *Was not Abraham our father justified by works, when he had offered Isaac his son upon the altar?* — the Akedah as living, obedient faith, the same deed the mother sets before her sons.'),
  -- thread: 4-maccabees-16-lions-of-daniel-furnace-of-mishael
  ('pseudepigrapha', '4-maccabees', 16, 21, 'canon', 'daniel', 6, 16, 'free', E'Daniel 6:16 — *Then the king commanded, and they brought Daniel, and cast him into the den of lions... Thy Elohim (God) whom thou servest continually, he will deliver thee* — Daniel the just man cast to the lions, the deliverance the mother holds before her sons.'),
  ('pseudepigrapha', '4-maccabees', 16, 3, 'canon', 'daniel', 6, 22, 'free', E'Daniel 6:22 — *My Elohim (God) hath sent his angel, and hath shut the lions'' mouths, that they have not hurt me: forasmuch as before him innocency was found in me* — the lions made not so fierce, the just man kept by the angel of Elohim.'),
  ('pseudepigrapha', '4-maccabees', 16, 3, 'canon', 'daniel', 6, 23, 'free', E'Daniel 6:23 — *So Daniel was taken up out of the den, and no manner of hurt was found upon him, because he believed in his Elohim (God)* — the unharmed deliverance behind the mother''s *not so fierce were the lions around Daniel.*'),
  ('pseudepigrapha', '4-maccabees', 16, 21, 'canon', 'daniel', 3, 21, 'free', E'Daniel 3:21 — *Then these men were bound... and were cast into the midst of the burning fiery furnace* — Ananias, Azarias, and Mishael flung into the furnace, the very scene the mother names.'),
  ('pseudepigrapha', '4-maccabees', 16, 3, 'canon', 'daniel', 3, 25, 'free', E'Daniel 3:25 — *Lo, I see four men loose, walking in the midst of the fire, and they have no hurt; and the form of the fourth is like the Son of Elohim (God)* — the furnace of Mishael, the three kept by a fourth in the flame.'),
  ('pseudepigrapha', '4-maccabees', 16, 21, 'canon', 'daniel', 3, 27, 'free', E'Daniel 3:27 — *upon whose bodies the fire had no power, nor was an hair of their head singed... nor the smell of fire had passed on them* — the burning fiery furnace overcome, those who *endured for Elohim''s sake.*'),
  -- thread: 4-maccabees-16-dying-for-elohim-live-unto-elohim
  ('pseudepigrapha', '4-maccabees', 16, 18, 'canon', 'romans', 12, 1, 'free', E'Romans 12:1 — *that ye present your bodies a living sacrifice, holy, acceptable unto Elohim (God), which is your reasonable service* — the debt the mother names, *ye owe it to Elohim to endure,* the body offered up for his sake.'),
  ('pseudepigrapha', '4-maccabees', 16, 25, 'canon', 'matthew', 22, 32, 'free', E'Matthew 22:32 — *I am the Elohim (God) of Abraham, and the Elohim (God) of Isaac, and the Elohim (God) of Jacob? Elohim (God) is not the Elohim (God) of the dead, but of the living* — the very logic the mother voices: the patriarchs live unto Elohim, the Messiah proving the resurrection from the same three names.'),
  ('pseudepigrapha', '4-maccabees', 16, 25, 'canon', 'luke', 20, 38, 'free', E'Luke 20:38 — *For he is not a Elohim (God) of the dead, but of the living: for all live unto him* — *all live unto him,* the exact hope the seven hold knowing *men dying for Elohim live unto Elohim.*'),
  ('pseudepigrapha', '4-maccabees', 16, 25, 'canon', 'daniel', 12, 2, 'free', E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt* — the resurrection of the just the martyrs trust, the awakening to everlasting life behind their *die rather than transgress.*')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session414_4macc16_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session414_4macc16_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '4-maccabees-16-abraham-hastened-to-sacrifice-isaac',
       E'★★ Abraham made haste to sacrifice Isaac — the Akedah, the martyrs'' charter',
       E'The mother, urging her sons to die rather than transgress, reaches for the oldest pattern of all: *for whom also our father Abraham made haste to sacrifice his son Isaac, the ancestor of our nation; and Isaac, seeing his father''s hand lifting the knife against him, did not shrink.* Father and son together upon Moriah — the one who offered and the one who yielded — become the model for these seven sons and their mother. The Akedah is no mere story to her; it is the charter of a faith that does not flinch at the knife, *accounting that Elohim was able to raise him up.* It ain''t new — *Abraham stretched forth his hand, and took the knife to slay his son,* and by that very work *was faith made perfect.*',
       sv.verse_id, ev.verse_id, 'extras', 91375
  FROM _session414_4macc16_lookup sv, _session414_4macc16_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=16 AND sv.verse_number=20
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='4-maccabees' AND ev.chapter_number=16 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '4-maccabees-16-lions-of-daniel-furnace-of-mishael',
       E'Not so fierce the lions, not so hot the furnace — Daniel and the Three Children',
       E'Twice the mother measures her own ordeal against the Tanakh''s great deliverances: *not so fierce were the lions around Daniel, not so hot was the burning fiery furnace of Mishael, as burned in her the instinct of motherhood.* And again she names them as proof to her sons: *And Daniel, the just man, was cast to the lions, and Ananias, Azarias, and Mishael were flung into the furnace of fire, and they endured for Elohim''s sake.* The just who would not bow nor break their devotion are her witnesses that Elohim guards those who endure for his sake. It ain''t new — *my Elohim hath sent his angel, and hath shut the lions'' mouths,* and the three came forth of the fire on whom *the fire had no power.*',
       sv.verse_id, ev.verse_id, 'extras', 91378
  FROM _session414_4macc16_lookup sv, _session414_4macc16_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=16 AND sv.verse_number=3
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='4-maccabees' AND ev.chapter_number=16 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '4-maccabees-16-dying-for-elohim-live-unto-elohim',
       E'★★ Men dying for Elohim live unto Elohim — as live Abraham, Isaac, and Jacob',
       E'The chapter closes on the book''s beating hope. The mother charges her sons to endure because *ye owe it to Elohim to endure all pain for his sake,* and the seven die *knowing well that men dying for Elohim live unto Elohim, as live Abraham, and Isaac, and Jacob, and all the patriarchs.* Death for the sake of Elohim is no end but a passage into the life of the living — the patriarchs are not in the grave but with Elohim. This is the precise logic the Messiah pressed against the Sadducees, and the awakening Daniel foresaw. It ain''t new — *Elohim is not the Elohim of the dead, but of the living,* and *many of them that sleep in the dust of the earth shall awake... to everlasting life.*',
       sv.verse_id, ev.verse_id, 'extras', 91381
  FROM _session414_4macc16_lookup sv, _session414_4macc16_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=16 AND sv.verse_number=18
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='4-maccabees' AND ev.chapter_number=16 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 4-maccabees-16-abraham-hastened-to-sacrifice-isaac
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 22:9 — *And they came to the place which Elohim (God) had told him of; and Abraham built an altar there, and laid the wood in order, and bound Isaac his son, and laid him on the altar upon the wood* — the binding the mother recalls, Abraham hastening to do the hard thing Elohim commanded.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc16_lookup sv, _session414_4macc16_lookup tv
 WHERE t.slug='4-maccabees-16-abraham-hastened-to-sacrifice-isaac'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=16 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 22:10 — *And Abraham stretched forth his hand, and took the knife to slay his son* — the very knife of the mother''s words, the lifted hand at which Isaac *did not shrink.*'
  FROM cross_reference_threads t, cross_references x, _session414_4macc16_lookup sv, _session414_4macc16_lookup tv
 WHERE t.slug='4-maccabees-16-abraham-hastened-to-sacrifice-isaac'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=16 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 22:12 — *Lay not thine hand upon the lad... for now I know that thou fearest Elohim (God), seeing thou hast not withheld thy son, thine only son from me* — the tested fear of Elohim the martyr-mother holds up to her own seven sons.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc16_lookup sv, _session414_4macc16_lookup tv
 WHERE t.slug='4-maccabees-16-abraham-hastened-to-sacrifice-isaac'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=16 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hebrews 11:17 — *By faith Abraham, when he was tried, offered up Isaac: and he that had received the promises offered up his only begotten son* — the same offering, the NT naming it the faith that does not withhold.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc16_lookup sv, _session414_4macc16_lookup tv
 WHERE t.slug='4-maccabees-16-abraham-hastened-to-sacrifice-isaac'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=16 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Hebrews 11:19 — *Accounting that Elohim (God) was able to raise him up, even from the dead; from whence also he received him in a figure* — the resurrection-confidence beneath the knife, the very hope that lets the mother''s sons not shrink.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc16_lookup sv, _session414_4macc16_lookup tv
 WHERE t.slug='4-maccabees-16-abraham-hastened-to-sacrifice-isaac'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=16 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'James 2:21 — *Was not Abraham our father justified by works, when he had offered Isaac his son upon the altar?* — the Akedah as living, obedient faith, the same deed the mother sets before her sons.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc16_lookup sv, _session414_4macc16_lookup tv
 WHERE t.slug='4-maccabees-16-abraham-hastened-to-sacrifice-isaac'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=16 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=2 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 4-maccabees-16-lions-of-daniel-furnace-of-mishael
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 6:16 — *Then the king commanded, and they brought Daniel, and cast him into the den of lions... Thy Elohim (God) whom thou servest continually, he will deliver thee* — Daniel the just man cast to the lions, the deliverance the mother holds before her sons.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc16_lookup sv, _session414_4macc16_lookup tv
 WHERE t.slug='4-maccabees-16-lions-of-daniel-furnace-of-mishael'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=16 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=6 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 6:22 — *My Elohim (God) hath sent his angel, and hath shut the lions'' mouths, that they have not hurt me: forasmuch as before him innocency was found in me* — the lions made not so fierce, the just man kept by the angel of Elohim.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc16_lookup sv, _session414_4macc16_lookup tv
 WHERE t.slug='4-maccabees-16-lions-of-daniel-furnace-of-mishael'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=16 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=6 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 6:23 — *So Daniel was taken up out of the den, and no manner of hurt was found upon him, because he believed in his Elohim (God)* — the unharmed deliverance behind the mother''s *not so fierce were the lions around Daniel.*'
  FROM cross_reference_threads t, cross_references x, _session414_4macc16_lookup sv, _session414_4macc16_lookup tv
 WHERE t.slug='4-maccabees-16-lions-of-daniel-furnace-of-mishael'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=16 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=6 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Daniel 3:21 — *Then these men were bound... and were cast into the midst of the burning fiery furnace* — Ananias, Azarias, and Mishael flung into the furnace, the very scene the mother names.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc16_lookup sv, _session414_4macc16_lookup tv
 WHERE t.slug='4-maccabees-16-lions-of-daniel-furnace-of-mishael'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=16 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=3 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Daniel 3:25 — *Lo, I see four men loose, walking in the midst of the fire, and they have no hurt; and the form of the fourth is like the Son of Elohim (God)* — the furnace of Mishael, the three kept by a fourth in the flame.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc16_lookup sv, _session414_4macc16_lookup tv
 WHERE t.slug='4-maccabees-16-lions-of-daniel-furnace-of-mishael'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=16 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=3 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Daniel 3:27 — *upon whose bodies the fire had no power, nor was an hair of their head singed... nor the smell of fire had passed on them* — the burning fiery furnace overcome, those who *endured for Elohim''s sake.*'
  FROM cross_reference_threads t, cross_references x, _session414_4macc16_lookup sv, _session414_4macc16_lookup tv
 WHERE t.slug='4-maccabees-16-lions-of-daniel-furnace-of-mishael'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=16 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=3 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 4-maccabees-16-dying-for-elohim-live-unto-elohim
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 12:1 — *that ye present your bodies a living sacrifice, holy, acceptable unto Elohim (God), which is your reasonable service* — the debt the mother names, *ye owe it to Elohim to endure,* the body offered up for his sake.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc16_lookup sv, _session414_4macc16_lookup tv
 WHERE t.slug='4-maccabees-16-dying-for-elohim-live-unto-elohim'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=16 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=12 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 22:32 — *I am the Elohim (God) of Abraham, and the Elohim (God) of Isaac, and the Elohim (God) of Jacob? Elohim (God) is not the Elohim (God) of the dead, but of the living* — the very logic the mother voices: the patriarchs live unto Elohim, the Messiah proving the resurrection from the same three names.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc16_lookup sv, _session414_4macc16_lookup tv
 WHERE t.slug='4-maccabees-16-dying-for-elohim-live-unto-elohim'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=16 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=22 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Luke 20:38 — *For he is not a Elohim (God) of the dead, but of the living: for all live unto him* — *all live unto him,* the exact hope the seven hold knowing *men dying for Elohim live unto Elohim.*'
  FROM cross_reference_threads t, cross_references x, _session414_4macc16_lookup sv, _session414_4macc16_lookup tv
 WHERE t.slug='4-maccabees-16-dying-for-elohim-live-unto-elohim'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=16 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=20 AND tv.verse_number=38
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt* — the resurrection of the just the martyrs trust, the awakening to everlasting life behind their *die rather than transgress.*'
  FROM cross_reference_threads t, cross_references x, _session414_4macc16_lookup sv, _session414_4macc16_lookup tv
 WHERE t.slug='4-maccabees-16-dying-for-elohim-live-unto-elohim'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=16 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_4maccabees_17.sql (session414 4-maccabees 17) -----
-- Source anchor: pseudepigrapha/4-maccabees ch17. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 4macc17 (view _session414_4macc17_lookup). Sort band base 91400, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session414_4macc17_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 4-maccabees-17-starlike-sons-shine-in-the-resurrection
  ('pseudepigrapha', '4-maccabees', 17, 5, 'canon', 'daniel', 12, 3, 'free', E'Daniel 12:3 — *And they that be wise shall shine as the brightness of the firmament; and they that turn many to righteousness as the stars for ever and ever* — the very figure of the *seven starlike sons* set in heaven, the wise shining like stars in the resurrection.'),
  ('pseudepigrapha', '4-maccabees', 17, 5, 'canon', 'matthew', 13, 43, 'free', E'Matthew 13:43 — *Then shall the righteous shine forth as the sun in the kingdom of their Father. Who hath ears to hear, let him hear* — the righteous shining in the Father''s kingdom, the same starlike glory of the martyred sons.'),
  ('pseudepigrapha', '4-maccabees', 17, 5, 'canon', 'philippians', 2, 15, 'free', E'Philippians 2:15 — *That ye may be blameless and harmless, the sons of Elohim, without rebuke, in the midst of a crooked and perverse nation, among whom ye shine as lights in the world* — the sons of Elohim shining as lights amid a perverse nation, as the mother lit the path of her sons unto righteousness.'),
  ('pseudepigrapha', '4-maccabees', 17, 12, 'canon', '1-corinthians', 15, 53, 'free', E'1 Corinthians 15:53 — *For this corruptible must put on incorruption, and this mortal must put on immortality* — the *incorruption in everlasting life* set before the martyrs as their prize of victory.'),
  ('pseudepigrapha', '4-maccabees', 17, 12, 'canon', '1-corinthians', 15, 54, 'free', E'1 Corinthians 15:54 — *So when this corruptible shall have put on incorruption... then shall be brought to pass the saying that is written, Death is swallowed up in victory* — the victory in incorruption the endurance of the martyrs won.'),
  ('pseudepigrapha', '4-maccabees', 17, 12, 'canon', 'daniel', 12, 2, 'free', E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt* — the awaking to *everlasting life,* the resurrection hope behind the martyrs'' prize.'),
  -- thread: 4-maccabees-17-the-crown-given-to-her-athletes
  ('pseudepigrapha', '4-maccabees', 17, 15, 'canon', '2-timothy', 4, 7, 'free', E'2 Timothy 4:7 — *I have fought a good fight, I have finished my course, I have kept the faith* — the same athlete''s contest finished in faithfulness, the race the martyrs ran unto death.'),
  ('pseudepigrapha', '4-maccabees', 17, 15, 'canon', '2-timothy', 4, 8, 'free', E'2 Timothy 4:8 — *Henceforth there is laid up for me a crown of righteousness, which Yahuah, the righteous judge, shall give me at that day* — the crown of righteousness given by the Judge, as righteousness *gave the crown to her athletes.*'),
  ('pseudepigrapha', '4-maccabees', 17, 15, 'canon', 'james', 1, 12, 'free', E'James 1:12 — *Blessed is the man that endureth temptation: for when he is tried, he shall receive the crown of life, which Yahuah hath promised to them that love him* — the crown of life for the tried and enduring, exactly the martyrs'' reward through endurance.'),
  ('pseudepigrapha', '4-maccabees', 17, 15, 'canon', 'revelation', 2, 10, 'free', E'Revelation 2:10 — *be thou faithful unto death, and I will give thee a crown of life* — faithfulness unto death crowned with life, the very wreath given to the athletes of the true Law.'),
  ('pseudepigrapha', '4-maccabees', 17, 16, 'canon', '1-corinthians', 9, 24, 'free', E'1 Corinthians 9:24 — *Know ye not that they which run in a race run all, but one receiveth the prize? So run, that ye may obtain* — the athletic figure Paul shares, the race the martyrs ran to obtain the prize.'),
  ('pseudepigrapha', '4-maccabees', 17, 16, 'canon', '1-corinthians', 9, 25, 'free', E'1 Corinthians 9:25 — *And every man that striveth for the mastery is temperate in all things. Now they do it to obtain a corruptible crown; but we an incorruptible* — the incorruptible crown of the true athletes, against the perishing wreath of the games.'),
  -- thread: 4-maccabees-17-they-stand-beside-the-throne
  ('pseudepigrapha', '4-maccabees', 17, 18, 'canon', 'revelation', 7, 9, 'free', E'Revelation 7:9 — *a great multitude, which no man could number... stood before the throne, and before the Lamb, clothed with white robes, and palms in their hands* — the throng standing before the throne, where the martyrs now *stand beside the throne of Elohim.*'),
  ('pseudepigrapha', '4-maccabees', 17, 18, 'canon', 'revelation', 7, 14, 'free', E'Revelation 7:14 — *These are they which came out of great tribulation, and have washed their robes, and made them white in the blood of the Lamb* — those brought through great tribulation to the throne, the company of the enduring martyrs.'),
  ('pseudepigrapha', '4-maccabees', 17, 18, 'canon', 'revelation', 7, 15, 'free', E'Revelation 7:15 — *Therefore are they before the throne of Elohim, and serve him day and night in his temple: and he that sitteth on the throne shall dwell among them* — the redeemed *before the throne of Elohim,* the very honour the martyrs receive.'),
  ('pseudepigrapha', '4-maccabees', 17, 18, 'canon', 'revelation', 20, 4, 'free', E'Revelation 20:4 — *I saw the souls of them that were beheaded for the witness... and they lived and reigned with Messiah a thousand years* — the souls of the slain witnesses who *live the blessed age,* reigning before the throne.'),
  ('pseudepigrapha', '4-maccabees', 17, 18, 'canon', 'daniel', 7, 9, 'free', E'Daniel 7:9 — *I beheld till the thrones were cast down, and the Ancient of days did sit... his throne was like the fiery flame* — the throne of glory beside which the sanctified now stand.'),
  ('pseudepigrapha', '4-maccabees', 17, 18, 'canon', 'daniel', 7, 10, 'free', E'Daniel 7:10 — *thousand thousands ministered unto him, and ten thousand times ten thousand stood before him: the judgment was set, and the books were opened* — the heavenly host standing before the throne, the court the martyrs are gathered into.'),
  ('pseudepigrapha', '4-maccabees', 17, 19, 'canon', 'deuteronomy', 33, 3, 'free', E'Deuteronomy 33:3 — *Yea, he loved the people; all his saints are in thy hand: and they sat down at thy feet; every one shall receive of thy words* — Moses'' word the writer cites, the sanctified ones *under thy hands.*'),
  -- thread: 4-maccabees-17-a-ransom-for-the-nation-the-type
  ('pseudepigrapha', '4-maccabees', 17, 22, 'canon', 'isaiah', 53, 5, 'free', E'Isaiah 53:5 — *But he was wounded for our transgressions, he was bruised for our iniquities: the chastisement of our peace was upon him; and with his stripes we are healed* — the Suffering Servant whose wounded blood truly delivers, the substance of which the martyrs'' death is only the shadow.'),
  ('pseudepigrapha', '4-maccabees', 17, 22, 'canon', 'isaiah', 53, 10, 'free', E'Isaiah 53:10 — *when thou shalt make his soul an offering for sin, he shall see his seed, he shall prolong his days* — the soul given as an offering for sin, the propitiation the martyrs'' death dimly figures but cannot accomplish.'),
  ('pseudepigrapha', '4-maccabees', 17, 22, 'canon', 'isaiah', 53, 11, 'free', E'Isaiah 53:11 — *by his knowledge shall my righteous servant justify many; for he shall bear their iniquities* — the righteous Servant bearing the iniquities of the many, the true ransom the type points toward.'),
  ('pseudepigrapha', '4-maccabees', 17, 22, 'canon', 'isaiah', 53, 12, 'free', E'Isaiah 53:12 — *he hath poured out his soul unto death... and he bare the sin of many, and made intercession for the transgressors* — the One who pours out his soul and bears the nation''s sin, the substance the martyrs'' blood foreshadows.'),
  ('pseudepigrapha', '4-maccabees', 17, 21, 'canon', 'daniel', 9, 24, 'free', E'Daniel 9:24 — *to finish the transgression, and to make an end of sins, and to make reconciliation for iniquity, and to bring in everlasting righteousness* — the reconciliation appointed, which no martyr''s blood but only the Anointed brings to pass.'),
  ('pseudepigrapha', '4-maccabees', 17, 22, 'canon', 'romans', 3, 25, 'free', E'Romans 3:25 — *Whom Elohim hath set forth to be a propitiation through faith in his blood, to declare his righteousness for the remission of sins* — the true propitiation that fulfils the type; the martyrs'' *propitiation of their death* foreshadows, the Messiah''s effects.'),
  ('pseudepigrapha', '4-maccabees', 17, 22, 'canon', 'hebrews', 9, 14, 'free', E'Hebrews 9:14 — *the blood of Messiah, who through the eternal Spirit offered himself without spot to Elohim, purge your conscience from dead works* — the blood that truly cleanses the people, the substance of which the martyrs'' blood is the shadow.'),
  ('pseudepigrapha', '4-maccabees', 17, 22, 'canon', 'hebrews', 11, 35, 'free', E'Hebrews 11:35 — *others were tortured, not accepting deliverance; that they might obtain a better resurrection* — the NT''s own allusion to this very martyrdom, the tortured who looked beyond death to the better resurrection.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session414_4macc17_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session414_4macc17_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '4-maccabees-17-starlike-sons-shine-in-the-resurrection',
       E'★ Starlike sons set in heaven — the resurrection of the righteous',
       E'The mother who watched all seven die is herself crowned in glory: *Not so majestic stands the moon amid the stars in heaven as thou, having lit the path of thy seven starlike sons unto righteousness, standest in honour with Elohim, and thou art set in heaven with them.* The prize they obtained through endurance was no earthly survival but *the prize of victory in incorruption in everlasting life.* This is the resurrection-of-the-just, the very hope the writer of Hebrews points back to. It ain''t new — *they that be wise shall shine as the brightness of the firmament... as the stars for ever and ever,* and *this corruptible must put on incorruption.*',
       sv.verse_id, ev.verse_id, 'extras', 91400
  FROM _session414_4macc17_lookup sv, _session414_4macc17_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=17 AND sv.verse_number=5
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='4-maccabees' AND ev.chapter_number=17 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '4-maccabees-17-the-crown-given-to-her-athletes',
       E'Righteousness gave the crown to her athletes',
       E'The contest is named: *And righteousness won the victory, and gave the crown to her athletes. Who but wondered at the athletes of the true Law?* The martyrs ran the holy course and finished it, and the wreath laid up for them is no perishing garland but the crown of life. It ain''t new — Paul *fought a good fight* and looked for *a crown of righteousness,* and the faithful *unto death* are promised *a crown of life.*',
       sv.verse_id, ev.verse_id, 'extras', 91403
  FROM _session414_4macc17_lookup sv, _session414_4macc17_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=17 AND sv.verse_number=15
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='4-maccabees' AND ev.chapter_number=17 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '4-maccabees-17-they-stand-beside-the-throne',
       E'They stand beside the throne of Elohim',
       E'The reward is no mere memory but a present standing in glory: *whereby they now do both stand beside the throne of Elohim and live the blessed age.* And the writer grounds it in Moses'' own word over the sanctified: *All also who have sanctified themselves are under thy hands.* The martyrs are gathered to the heavenly court, among the ranks that minister before the Ancient of days. It ain''t new — the great multitude *stood before the throne,* the souls of the slain *lived and reigned,* and *all his saints are in thy hand.*',
       sv.verse_id, ev.verse_id, 'extras', 91406
  FROM _session414_4macc17_lookup sv, _session414_4macc17_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=17 AND sv.verse_number=18
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='4-maccabees' AND ev.chapter_number=17 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '4-maccabees-17-a-ransom-for-the-nation-the-type',
       E'★★ A ransom for the nation — the type the Messiah fulfils',
       E'The book reaches its climax: the martyrs *having as it were become a ransom for our nation''s sin; and through the blood of these righteous men and the propitiation of their death, the divine Providence delivered Yashar''el that before was evil entreated.* Here the righteous-sufferer whose blood delivers the people stands forth — yet *as it were,* a shadow and not the substance. The martyrs'' death is a TYPE pointing forward to the Suffering Servant whose soul was made *an offering for sin* and who *bare the sin of many,* the propitiation the Formed Son alone supplies. The writer of Hebrews knew this very martyrdom and saw beyond it to *a better resurrection.* It ain''t new — *he was wounded for our transgressions... and with his stripes we are healed,* and to *make reconciliation for iniquity* was foreseen of old; the martyrs'' blood borrows the pattern the Messiah''s own blood at last completes.',
       sv.verse_id, ev.verse_id, 'extras', 91409
  FROM _session414_4macc17_lookup sv, _session414_4macc17_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=17 AND sv.verse_number=21
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='4-maccabees' AND ev.chapter_number=17 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 4-maccabees-17-starlike-sons-shine-in-the-resurrection
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 12:3 — *And they that be wise shall shine as the brightness of the firmament; and they that turn many to righteousness as the stars for ever and ever* — the very figure of the *seven starlike sons* set in heaven, the wise shining like stars in the resurrection.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc17_lookup sv, _session414_4macc17_lookup tv
 WHERE t.slug='4-maccabees-17-starlike-sons-shine-in-the-resurrection'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=17 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 13:43 — *Then shall the righteous shine forth as the sun in the kingdom of their Father. Who hath ears to hear, let him hear* — the righteous shining in the Father''s kingdom, the same starlike glory of the martyred sons.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc17_lookup sv, _session414_4macc17_lookup tv
 WHERE t.slug='4-maccabees-17-starlike-sons-shine-in-the-resurrection'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=17 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=13 AND tv.verse_number=43
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Philippians 2:15 — *That ye may be blameless and harmless, the sons of Elohim, without rebuke, in the midst of a crooked and perverse nation, among whom ye shine as lights in the world* — the sons of Elohim shining as lights amid a perverse nation, as the mother lit the path of her sons unto righteousness.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc17_lookup sv, _session414_4macc17_lookup tv
 WHERE t.slug='4-maccabees-17-starlike-sons-shine-in-the-resurrection'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=17 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Corinthians 15:53 — *For this corruptible must put on incorruption, and this mortal must put on immortality* — the *incorruption in everlasting life* set before the martyrs as their prize of victory.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc17_lookup sv, _session414_4macc17_lookup tv
 WHERE t.slug='4-maccabees-17-starlike-sons-shine-in-the-resurrection'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=17 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=53
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Corinthians 15:54 — *So when this corruptible shall have put on incorruption... then shall be brought to pass the saying that is written, Death is swallowed up in victory* — the victory in incorruption the endurance of the martyrs won.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc17_lookup sv, _session414_4macc17_lookup tv
 WHERE t.slug='4-maccabees-17-starlike-sons-shine-in-the-resurrection'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=17 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=54
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt* — the awaking to *everlasting life,* the resurrection hope behind the martyrs'' prize.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc17_lookup sv, _session414_4macc17_lookup tv
 WHERE t.slug='4-maccabees-17-starlike-sons-shine-in-the-resurrection'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=17 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 4-maccabees-17-the-crown-given-to-her-athletes
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Timothy 4:7 — *I have fought a good fight, I have finished my course, I have kept the faith* — the same athlete''s contest finished in faithfulness, the race the martyrs ran unto death.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc17_lookup sv, _session414_4macc17_lookup tv
 WHERE t.slug='4-maccabees-17-the-crown-given-to-her-athletes'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=17 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='2-timothy' AND tv.chapter_number=4 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Timothy 4:8 — *Henceforth there is laid up for me a crown of righteousness, which Yahuah, the righteous judge, shall give me at that day* — the crown of righteousness given by the Judge, as righteousness *gave the crown to her athletes.*'
  FROM cross_reference_threads t, cross_references x, _session414_4macc17_lookup sv, _session414_4macc17_lookup tv
 WHERE t.slug='4-maccabees-17-the-crown-given-to-her-athletes'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=17 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='2-timothy' AND tv.chapter_number=4 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'James 1:12 — *Blessed is the man that endureth temptation: for when he is tried, he shall receive the crown of life, which Yahuah hath promised to them that love him* — the crown of life for the tried and enduring, exactly the martyrs'' reward through endurance.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc17_lookup sv, _session414_4macc17_lookup tv
 WHERE t.slug='4-maccabees-17-the-crown-given-to-her-athletes'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=17 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 2:10 — *be thou faithful unto death, and I will give thee a crown of life* — faithfulness unto death crowned with life, the very wreath given to the athletes of the true Law.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc17_lookup sv, _session414_4macc17_lookup tv
 WHERE t.slug='4-maccabees-17-the-crown-given-to-her-athletes'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=17 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=2 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Corinthians 9:24 — *Know ye not that they which run in a race run all, but one receiveth the prize? So run, that ye may obtain* — the athletic figure Paul shares, the race the martyrs ran to obtain the prize.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc17_lookup sv, _session414_4macc17_lookup tv
 WHERE t.slug='4-maccabees-17-the-crown-given-to-her-athletes'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=17 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=9 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'1 Corinthians 9:25 — *And every man that striveth for the mastery is temperate in all things. Now they do it to obtain a corruptible crown; but we an incorruptible* — the incorruptible crown of the true athletes, against the perishing wreath of the games.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc17_lookup sv, _session414_4macc17_lookup tv
 WHERE t.slug='4-maccabees-17-the-crown-given-to-her-athletes'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=17 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=9 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 4-maccabees-17-they-stand-beside-the-throne
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 7:9 — *a great multitude, which no man could number... stood before the throne, and before the Lamb, clothed with white robes, and palms in their hands* — the throng standing before the throne, where the martyrs now *stand beside the throne of Elohim.*'
  FROM cross_reference_threads t, cross_references x, _session414_4macc17_lookup sv, _session414_4macc17_lookup tv
 WHERE t.slug='4-maccabees-17-they-stand-beside-the-throne'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=17 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 7:14 — *These are they which came out of great tribulation, and have washed their robes, and made them white in the blood of the Lamb* — those brought through great tribulation to the throne, the company of the enduring martyrs.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc17_lookup sv, _session414_4macc17_lookup tv
 WHERE t.slug='4-maccabees-17-they-stand-beside-the-throne'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=17 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 7:15 — *Therefore are they before the throne of Elohim, and serve him day and night in his temple: and he that sitteth on the throne shall dwell among them* — the redeemed *before the throne of Elohim,* the very honour the martyrs receive.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc17_lookup sv, _session414_4macc17_lookup tv
 WHERE t.slug='4-maccabees-17-they-stand-beside-the-throne'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=17 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=7 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 20:4 — *I saw the souls of them that were beheaded for the witness... and they lived and reigned with Messiah a thousand years* — the souls of the slain witnesses who *live the blessed age,* reigning before the throne.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc17_lookup sv, _session414_4macc17_lookup tv
 WHERE t.slug='4-maccabees-17-they-stand-beside-the-throne'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=17 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Daniel 7:9 — *I beheld till the thrones were cast down, and the Ancient of days did sit... his throne was like the fiery flame* — the throne of glory beside which the sanctified now stand.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc17_lookup sv, _session414_4macc17_lookup tv
 WHERE t.slug='4-maccabees-17-they-stand-beside-the-throne'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=17 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Daniel 7:10 — *thousand thousands ministered unto him, and ten thousand times ten thousand stood before him: the judgment was set, and the books were opened* — the heavenly host standing before the throne, the court the martyrs are gathered into.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc17_lookup sv, _session414_4macc17_lookup tv
 WHERE t.slug='4-maccabees-17-they-stand-beside-the-throne'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=17 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Deuteronomy 33:3 — *Yea, he loved the people; all his saints are in thy hand: and they sat down at thy feet; every one shall receive of thy words* — Moses'' word the writer cites, the sanctified ones *under thy hands.*'
  FROM cross_reference_threads t, cross_references x, _session414_4macc17_lookup sv, _session414_4macc17_lookup tv
 WHERE t.slug='4-maccabees-17-they-stand-beside-the-throne'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=17 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=33 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 4-maccabees-17-a-ransom-for-the-nation-the-type
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 53:5 — *But he was wounded for our transgressions, he was bruised for our iniquities: the chastisement of our peace was upon him; and with his stripes we are healed* — the Suffering Servant whose wounded blood truly delivers, the substance of which the martyrs'' death is only the shadow.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc17_lookup sv, _session414_4macc17_lookup tv
 WHERE t.slug='4-maccabees-17-a-ransom-for-the-nation-the-type'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=17 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 53:10 — *when thou shalt make his soul an offering for sin, he shall see his seed, he shall prolong his days* — the soul given as an offering for sin, the propitiation the martyrs'' death dimly figures but cannot accomplish.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc17_lookup sv, _session414_4macc17_lookup tv
 WHERE t.slug='4-maccabees-17-a-ransom-for-the-nation-the-type'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=17 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 53:11 — *by his knowledge shall my righteous servant justify many; for he shall bear their iniquities* — the righteous Servant bearing the iniquities of the many, the true ransom the type points toward.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc17_lookup sv, _session414_4macc17_lookup tv
 WHERE t.slug='4-maccabees-17-a-ransom-for-the-nation-the-type'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=17 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 53:12 — *he hath poured out his soul unto death... and he bare the sin of many, and made intercession for the transgressors* — the One who pours out his soul and bears the nation''s sin, the substance the martyrs'' blood foreshadows.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc17_lookup sv, _session414_4macc17_lookup tv
 WHERE t.slug='4-maccabees-17-a-ransom-for-the-nation-the-type'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=17 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Daniel 9:24 — *to finish the transgression, and to make an end of sins, and to make reconciliation for iniquity, and to bring in everlasting righteousness* — the reconciliation appointed, which no martyr''s blood but only the Anointed brings to pass.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc17_lookup sv, _session414_4macc17_lookup tv
 WHERE t.slug='4-maccabees-17-a-ransom-for-the-nation-the-type'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=17 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=9 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Romans 3:25 — *Whom Elohim hath set forth to be a propitiation through faith in his blood, to declare his righteousness for the remission of sins* — the true propitiation that fulfils the type; the martyrs'' *propitiation of their death* foreshadows, the Messiah''s effects.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc17_lookup sv, _session414_4macc17_lookup tv
 WHERE t.slug='4-maccabees-17-a-ransom-for-the-nation-the-type'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=17 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=3 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Hebrews 9:14 — *the blood of Messiah, who through the eternal Spirit offered himself without spot to Elohim, purge your conscience from dead works* — the blood that truly cleanses the people, the substance of which the martyrs'' blood is the shadow.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc17_lookup sv, _session414_4macc17_lookup tv
 WHERE t.slug='4-maccabees-17-a-ransom-for-the-nation-the-type'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=17 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=9 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'Hebrews 11:35 — *others were tortured, not accepting deliverance; that they might obtain a better resurrection* — the NT''s own allusion to this very martyrdom, the tortured who looked beyond death to the better resurrection.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc17_lookup sv, _session414_4macc17_lookup tv
 WHERE t.slug='4-maccabees-17-a-ransom-for-the-nation-the-type'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=17 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_4maccabees_18.sql (session414 4-maccabees 18) -----
-- Source anchor: pseudepigrapha/4-maccabees ch18. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 4macc18 (view _session414_4macc18_lookup). Sort band base 91425, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session414_4macc18_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 4-maccabees-18-the-mother-kept-the-rib-of-eve
  ('pseudepigrapha', '4-maccabees', 18, 7, 'canon', 'genesis', 2, 21, 'free', E'Genesis 2:21 — *And Yahuah Elohim (the LORD God) caused a deep sleep to fall upon Adam, and he slept: and he took one of his ribs, and closed up the flesh instead thereof* — the rib the mother says she kept guard over, the very building-block of woman.'),
  ('pseudepigrapha', '4-maccabees', 18, 7, 'canon', 'genesis', 2, 22, 'free', E'Genesis 2:22 — *And the rib, which Yahuah Elohim (the LORD God) had taken from man, made he a woman, and brought her unto the man* — the rib *builded into Eve,* the womanhood the mother guarded in purity.'),
  ('pseudepigrapha', '4-maccabees', 18, 7, 'canon', 'genesis', 2, 23, 'free', E'Genesis 2:23 — *This is now bone of my bones, and flesh of my flesh: she shall be called Woman, because she was taken out of Man* — the first marriage the mother honours, having lived with her husband all the days of her youth.'),
  ('pseudepigrapha', '4-maccabees', 18, 9, 'canon', 'genesis', 3, 1, 'free', E'Genesis 3:1 — *Now the serpent was more subtil than any beast of the field which Yahuah Elohim (the LORD God) had made* — the *false, beguiling Serpent* whose subtilty the mother says never sullied her maidenhood.'),
  ('pseudepigrapha', '4-maccabees', 18, 9, 'canon', 'genesis', 3, 4, 'free', E'Genesis 3:4 — *And the serpent said unto the woman, Ye shall not surely die* — the deceiver''s lie that beguiled the first Eve, which this daughter of Eve refused.'),
  ('pseudepigrapha', '4-maccabees', 18, 9, 'canon', 'genesis', 3, 6, 'free', E'Genesis 3:6 — *and when the woman saw that the tree was good for food... she took of the fruit thereof, and did eat, and gave also unto her husband* — the fall the mother did not repeat; the Serpent could not *sully the purity of my maidenhood.*'),
  -- thread: 4-maccabees-18-the-father-taught-the-law-and-the-prophets
  ('pseudepigrapha', '4-maccabees', 18, 11, 'canon', 'genesis', 4, 8, 'free', E'Genesis 4:8 — *and it came to pass, when they were in the field, that Cain rose up against Abel his brother, and slew him* — *Abel who was slain by Cain,* the first righteous martyr the father set before his sons.'),
  ('pseudepigrapha', '4-maccabees', 18, 11, 'canon', 'genesis', 22, 9, 'free', E'Genesis 22:9 — *and Abraham built an altar there, and laid the wood in order, and bound Isaac his son, and laid him on the altar upon the wood* — *Isaac who was offered as a burnt-offering,* the Akedah that is the martyrs'' own charter.'),
  ('pseudepigrapha', '4-maccabees', 18, 11, 'canon', 'genesis', 22, 13, 'free', E'Genesis 22:13 — *and Abraham went and took the ram, and offered him up for a burnt offering in the stead of his son* — the burnt-offering provided in Isaac''s stead, the binding the father read to his children.'),
  ('pseudepigrapha', '4-maccabees', 18, 11, 'canon', 'genesis', 39, 20, 'free', E'Genesis 39:20 — *And Joseph''s master took him, and put him into the prison, a place where the king''s prisoners were bound: and he was there in the prison* — *Joseph in the prison,* the righteous one wrongly chained yet kept by Yahuah.'),
  ('pseudepigrapha', '4-maccabees', 18, 12, 'canon', 'numbers', 25, 11, 'free', E'Numbers 25:11 — *Phinehas... hath turned my wrath away from the children of Yashar''el (Israel), while he was zealous for my sake among them* — *Phineas, the zealous priest,* whose zeal for the Law the father held up to his sons.'),
  ('pseudepigrapha', '4-maccabees', 18, 12, 'canon', 'numbers', 25, 13, 'free', E'Numbers 25:13 — *and he shall have it, and his seed after him, even the covenant of an everlasting priesthood; because he was zealous for his Elohim (God)* — the everlasting covenant given for zeal, the reward of the priest the father named.'),
  ('pseudepigrapha', '4-maccabees', 18, 12, 'canon', 'daniel', 3, 25, 'free', E'Daniel 3:25 — *Lo, I see four men loose, walking in the midst of the fire, and they have no hurt* — the song of *Ananias, Azarias, and Mishael in the fire,* the three children unhurt in the furnace.'),
  ('pseudepigrapha', '4-maccabees', 18, 12, 'canon', 'daniel', 3, 27, 'free', E'Daniel 3:27 — *upon whose bodies the fire had no power, nor was an hair of their head singed... nor the smell of fire had passed on them* — the deliverance the father taught, the fire that could not touch the faithful three.'),
  ('pseudepigrapha', '4-maccabees', 18, 12, 'apocrypha', 'the-song-of-the-three-holy-children', 1, 66, 'free', E'Song of the Three Holy Children 1:66 — *O Ananias, Azarias, and Misael, bless you Yahuah (God)... for he has delivered us... out of the midst of the fire* — the very song the father *taught you,* sung by the three in the furnace (self-link).'),
  ('pseudepigrapha', '4-maccabees', 18, 13, 'canon', 'daniel', 6, 22, 'free', E'Daniel 6:22 — *My Elohim (God) hath sent his angel, and hath shut the lions'' mouths, that they have not hurt me* — *Daniel in the den of lions,* whom the father *glorified... and blessed,* preserved among the beasts.'),
  ('pseudepigrapha', '4-maccabees', 18, 13, 'canon', 'daniel', 6, 23, 'free', E'Daniel 6:23 — *So Daniel was taken up out of the den, and no manner of hurt was found upon him, because he believed in his Elohim (God)* — Daniel delivered unhurt, the faith the father set before the seven sons.'),
  -- thread: 4-maccabees-18-the-prophets-words-of-fire-and-life
  ('pseudepigrapha', '4-maccabees', 18, 14, 'canon', 'isaiah', 43, 2, 'free', E'Isaiah 43:2 — *when thou walkest through the fire, thou shalt not be burned; neither shall the flame kindle upon thee* — the saying of Isaiah the father quoted, the promise the three children and the martyrs leaned upon.'),
  ('pseudepigrapha', '4-maccabees', 18, 15, 'canon', 'psalms', 34, 19, 'free', E'Psalm 34:19 — *Many are the afflictions of the righteous: but Yahuah (LORD) delivereth him out of them all* — the words of David the father sang, the just man afflicted yet always delivered.'),
  ('pseudepigrapha', '4-maccabees', 18, 16, 'canon', 'proverbs', 3, 18, 'free', E'Proverbs 3:18 — *She is a tree of life to them that lay hold upon her: and happy is every one that retaineth her* — the proverb of Solomon the father quoted, wisdom-and-Law the tree of life for them that do His will.'),
  ('pseudepigrapha', '4-maccabees', 18, 17, 'canon', 'ezekiel', 37, 3, 'free', E'Ezekiel 37:3 — *Son of Adam, can these bones live? And I answered, O Yahuah (Lord) GOD, thou knowest* — *Shall these dry bones live?* the resurrection-question the father confirmed, the hope of the whole house of Yashar''el.'),
  ('pseudepigrapha', '4-maccabees', 18, 18, 'canon', 'deuteronomy', 32, 39, 'free', E'Deuteronomy 32:39 — *I kill, and I make alive; I wound, and I heal: neither is there any that can deliver out of my hand* — the song of Moses the father remembered, *I will slay and I will make alive,* the Author of death and resurrection.'),
  ('pseudepigrapha', '4-maccabees', 18, 18, 'canon', 'deuteronomy', 30, 19, 'free', E'Deuteronomy 30:19 — *I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live* — the life Moses set before Yashar''el, *this is your life,* chosen by the sons in dying for the Law.'),
  ('pseudepigrapha', '4-maccabees', 18, 18, 'canon', 'deuteronomy', 30, 20, 'free', E'Deuteronomy 30:20 — *for he is thy life, and the length of thy days* — *this is your life and the blessedness of your days,* the very phrase the father drew from Moses'' song.'),
  -- thread: 4-maccabees-18-gathered-unto-the-place-of-their-ancestors
  ('pseudepigrapha', '4-maccabees', 18, 21, 'canon', 'hebrews', 11, 35, 'free', E'Hebrews 11:35 — *and others were tortured, not accepting deliverance; that they might obtain a better resurrection* — the NT''s own allusion to this very martyrdom; the sons gathered to their fathers awaited the better resurrection.'),
  ('pseudepigrapha', '4-maccabees', 18, 21, 'canon', 'hebrews', 11, 39, 'free', E'Hebrews 11:39 — *and these all, having obtained a good report through faith, received not the promise* — the cloud of witnesses, the sons of Abraham gathered to the place of their ancestors in hope.'),
  ('pseudepigrapha', '4-maccabees', 18, 21, 'canon', 'hebrews', 11, 40, 'free', E'Hebrews 11:40 — *Elohim (God) having provided some better thing for us, that they without us should not be made perfect* — the better thing reserved, the immortal souls the martyrs received from Elohim awaiting consummation.'),
  ('pseudepigrapha', '4-maccabees', 18, 21, 'canon', 'luke', 16, 22, 'free', E'Luke 16:22 — *and it came to pass, that the beggar died, and was carried by the angels into Abraham''s bosom* — *gathered together unto the place of their ancestors,* the faithful received to Abraham among the fathers.'),
  ('pseudepigrapha', '4-maccabees', 18, 21, 'canon', 'daniel', 12, 2, 'free', E'Daniel 12:2 — *and many of them that sleep in the dust of the earth shall awake, some to everlasting life* — the resurrection-of-the-just, the *pure and immortal souls* the sons of Abraham received from Elohim.'),
  ('pseudepigrapha', '4-maccabees', 18, 21, 'canon', 'daniel', 12, 3, 'free', E'Daniel 12:3 — *and they that be wise shall shine as the brightness of the firmament; and they that turn many to righteousness as the stars for ever and ever* — the starlike glory of the victorious mother and her sons, set among the everlasting righteous.'),
  ('pseudepigrapha', '4-maccabees', 18, 20, 'canon', 'daniel', 12, 1, 'free', E'Daniel 12:1 — *and at that time thy people shall be delivered, every one that shall be found written in the book* — the day of deliverance and judgement, when the wretch is pursued but the faithful are gathered.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session414_4macc18_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session414_4macc18_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '4-maccabees-18-the-mother-kept-the-rib-of-eve',
       E'I kept guard over the rib that was builded into Eve — and the Serpent could not corrupt',
       E'The mother testifies of her own purity before she tells of her sons: *I was a pure maiden, and I strayed not from my father''s house, and I kept guard over the rib that was builded into Eve.* No seducer, no deceiver, *nor did the false, beguiling Serpent sully the purity of my maidenhood.* She reaches straight back to the garden — the rib taken from Adam and made into a woman, and the subtil Serpent who beguiled her — and stands as the un-beguiled daughter of Eve. It ain''t new — *the rib, which Yahuah Elohim had taken from man, made he a woman,* and the *serpent beguiled me, and I did eat* is the deceit she alone resisted.',
       sv.verse_id, ev.verse_id, 'extras', 91425
  FROM _session414_4macc18_lookup sv, _session414_4macc18_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=18 AND sv.verse_number=7
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='4-maccabees' AND ev.chapter_number=18 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '4-maccabees-18-the-father-taught-the-law-and-the-prophets',
       E'He taught you the Law and the prophets — the roll-call of the righteous',
       E'The mother recalls how the father, *while he was yet with us, taught you the Law and the prophets,* and named the cloud of witnesses one after another: *Abel who was slain by Cain,* *Isaac who was offered as a burnt-offering,* *Joseph in the prison,* *Phineas, the zealous priest,* the song of *Ananias, Azarias, and Mishael in the fire,* and *Daniel in the den of lions.* This is the catalogue of the righteous who suffered and were upheld — the very pattern the seven sons would walk. It ain''t new — Abel''s blood, the Akedah, Joseph''s chains, Phineas'' zeal, the three children in the furnace, and Daniel among the lions are all written in Moses and the prophets, the charter the martyrs inherited.',
       sv.verse_id, ev.verse_id, 'extras', 91428
  FROM _session414_4macc18_lookup sv, _session414_4macc18_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=18 AND sv.verse_number=11
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='4-maccabees' AND ev.chapter_number=18 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '4-maccabees-18-the-prophets-words-of-fire-and-life',
       E'Isaiah, David, Solomon, Ezekiel, Moses — the words that promise fire shall not hurt and the dead shall live',
       E'The father did not stop at the patriarchs; he *called to your minds the saying of Isaiah, "Yea even though thou pass through the fire, the flame shall not hurt thee,"* sang *the words of David... "Many are the afflictions of the just,"* quoted *the proverb of Solomon, "He is a tree of life to all them that do his will,"* confirmed *the words of Ezekiel, "Shall these dry bones live?"* and remembered *the song that Moses taught... "I will slay and I will make alive. This is your life."* Each is a near-verbatim quotation of the prophets — fire that cannot burn, the afflicted-but-delivered just, the tree of life for the obedient, the resurrection of the dry bones, and the Author of life and death. It ain''t new — every line the father spoke is already written in Isaiah, the Psalms, the Proverbs, Ezekiel, and the song of Moses.',
       sv.verse_id, ev.verse_id, 'extras', 91431
  FROM _session414_4macc18_lookup sv, _session414_4macc18_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=18 AND sv.verse_number=14
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='4-maccabees' AND ev.chapter_number=18 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '4-maccabees-18-gathered-unto-the-place-of-their-ancestors',
       E'★ The sons of Abraham gathered to their fathers — a better resurrection',
       E'The tyrant''s judgement is sure — *the judgement of Elohim pursued, and shall pursue, the accursed wretch* — but the martyrs'' end is glory: *the sons of Abraham, with their victorious mother, are gathered together unto the place of their ancestors, having received pure and immortal souls from Elohim, to whom be glory for ever and ever.* They are gathered to Abraham, Isaac, and Jacob, awaiting the resurrection of the just. This is the very hope the writer of Hebrews names — those *tortured, not accepting deliverance,* that they might obtain *a better resurrection.* It ain''t new — the faithful are *carried by the angels into Abraham''s bosom,* and *many of them that sleep in the dust of the earth shall awake... to everlasting life.*',
       sv.verse_id, ev.verse_id, 'extras', 91434
  FROM _session414_4macc18_lookup sv, _session414_4macc18_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=18 AND sv.verse_number=20
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='4-maccabees' AND ev.chapter_number=18 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 4-maccabees-18-the-mother-kept-the-rib-of-eve
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:21 — *And Yahuah Elohim (the LORD God) caused a deep sleep to fall upon Adam, and he slept: and he took one of his ribs, and closed up the flesh instead thereof* — the rib the mother says she kept guard over, the very building-block of woman.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc18_lookup sv, _session414_4macc18_lookup tv
 WHERE t.slug='4-maccabees-18-the-mother-kept-the-rib-of-eve'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=18 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 2:22 — *And the rib, which Yahuah Elohim (the LORD God) had taken from man, made he a woman, and brought her unto the man* — the rib *builded into Eve,* the womanhood the mother guarded in purity.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc18_lookup sv, _session414_4macc18_lookup tv
 WHERE t.slug='4-maccabees-18-the-mother-kept-the-rib-of-eve'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=18 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 2:23 — *This is now bone of my bones, and flesh of my flesh: she shall be called Woman, because she was taken out of Man* — the first marriage the mother honours, having lived with her husband all the days of her youth.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc18_lookup sv, _session414_4macc18_lookup tv
 WHERE t.slug='4-maccabees-18-the-mother-kept-the-rib-of-eve'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=18 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 3:1 — *Now the serpent was more subtil than any beast of the field which Yahuah Elohim (the LORD God) had made* — the *false, beguiling Serpent* whose subtilty the mother says never sullied her maidenhood.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc18_lookup sv, _session414_4macc18_lookup tv
 WHERE t.slug='4-maccabees-18-the-mother-kept-the-rib-of-eve'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=18 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Genesis 3:4 — *And the serpent said unto the woman, Ye shall not surely die* — the deceiver''s lie that beguiled the first Eve, which this daughter of Eve refused.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc18_lookup sv, _session414_4macc18_lookup tv
 WHERE t.slug='4-maccabees-18-the-mother-kept-the-rib-of-eve'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=18 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Genesis 3:6 — *and when the woman saw that the tree was good for food... she took of the fruit thereof, and did eat, and gave also unto her husband* — the fall the mother did not repeat; the Serpent could not *sully the purity of my maidenhood.*'
  FROM cross_reference_threads t, cross_references x, _session414_4macc18_lookup sv, _session414_4macc18_lookup tv
 WHERE t.slug='4-maccabees-18-the-mother-kept-the-rib-of-eve'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=18 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 4-maccabees-18-the-father-taught-the-law-and-the-prophets
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:8 — *and it came to pass, when they were in the field, that Cain rose up against Abel his brother, and slew him* — *Abel who was slain by Cain,* the first righteous martyr the father set before his sons.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc18_lookup sv, _session414_4macc18_lookup tv
 WHERE t.slug='4-maccabees-18-the-father-taught-the-law-and-the-prophets'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=18 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 22:9 — *and Abraham built an altar there, and laid the wood in order, and bound Isaac his son, and laid him on the altar upon the wood* — *Isaac who was offered as a burnt-offering,* the Akedah that is the martyrs'' own charter.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc18_lookup sv, _session414_4macc18_lookup tv
 WHERE t.slug='4-maccabees-18-the-father-taught-the-law-and-the-prophets'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=18 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 22:13 — *and Abraham went and took the ram, and offered him up for a burnt offering in the stead of his son* — the burnt-offering provided in Isaac''s stead, the binding the father read to his children.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc18_lookup sv, _session414_4macc18_lookup tv
 WHERE t.slug='4-maccabees-18-the-father-taught-the-law-and-the-prophets'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=18 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 39:20 — *And Joseph''s master took him, and put him into the prison, a place where the king''s prisoners were bound: and he was there in the prison* — *Joseph in the prison,* the righteous one wrongly chained yet kept by Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc18_lookup sv, _session414_4macc18_lookup tv
 WHERE t.slug='4-maccabees-18-the-father-taught-the-law-and-the-prophets'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=18 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=39 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Numbers 25:11 — *Phinehas... hath turned my wrath away from the children of Yashar''el (Israel), while he was zealous for my sake among them* — *Phineas, the zealous priest,* whose zeal for the Law the father held up to his sons.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc18_lookup sv, _session414_4macc18_lookup tv
 WHERE t.slug='4-maccabees-18-the-father-taught-the-law-and-the-prophets'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=18 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=25 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Numbers 25:13 — *and he shall have it, and his seed after him, even the covenant of an everlasting priesthood; because he was zealous for his Elohim (God)* — the everlasting covenant given for zeal, the reward of the priest the father named.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc18_lookup sv, _session414_4macc18_lookup tv
 WHERE t.slug='4-maccabees-18-the-father-taught-the-law-and-the-prophets'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=18 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=25 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Daniel 3:25 — *Lo, I see four men loose, walking in the midst of the fire, and they have no hurt* — the song of *Ananias, Azarias, and Mishael in the fire,* the three children unhurt in the furnace.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc18_lookup sv, _session414_4macc18_lookup tv
 WHERE t.slug='4-maccabees-18-the-father-taught-the-law-and-the-prophets'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=18 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=3 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'Daniel 3:27 — *upon whose bodies the fire had no power, nor was an hair of their head singed... nor the smell of fire had passed on them* — the deliverance the father taught, the fire that could not touch the faithful three.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc18_lookup sv, _session414_4macc18_lookup tv
 WHERE t.slug='4-maccabees-18-the-father-taught-the-law-and-the-prophets'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=18 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=3 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 9, E'Song of the Three Holy Children 1:66 — *O Ananias, Azarias, and Misael, bless you Yahuah (God)... for he has delivered us... out of the midst of the fire* — the very song the father *taught you,* sung by the three in the furnace (self-link).'
  FROM cross_reference_threads t, cross_references x, _session414_4macc18_lookup sv, _session414_4macc18_lookup tv
 WHERE t.slug='4-maccabees-18-the-father-taught-the-law-and-the-prophets'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=18 AND sv.verse_number=12
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-song-of-the-three-holy-children' AND tv.chapter_number=1 AND tv.verse_number=66
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 10, E'Daniel 6:22 — *My Elohim (God) hath sent his angel, and hath shut the lions'' mouths, that they have not hurt me* — *Daniel in the den of lions,* whom the father *glorified... and blessed,* preserved among the beasts.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc18_lookup sv, _session414_4macc18_lookup tv
 WHERE t.slug='4-maccabees-18-the-father-taught-the-law-and-the-prophets'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=18 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=6 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 11, E'Daniel 6:23 — *So Daniel was taken up out of the den, and no manner of hurt was found upon him, because he believed in his Elohim (God)* — Daniel delivered unhurt, the faith the father set before the seven sons.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc18_lookup sv, _session414_4macc18_lookup tv
 WHERE t.slug='4-maccabees-18-the-father-taught-the-law-and-the-prophets'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=18 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=6 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 4-maccabees-18-the-prophets-words-of-fire-and-life
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 43:2 — *when thou walkest through the fire, thou shalt not be burned; neither shall the flame kindle upon thee* — the saying of Isaiah the father quoted, the promise the three children and the martyrs leaned upon.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc18_lookup sv, _session414_4macc18_lookup tv
 WHERE t.slug='4-maccabees-18-the-prophets-words-of-fire-and-life'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=18 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=43 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 34:19 — *Many are the afflictions of the righteous: but Yahuah (LORD) delivereth him out of them all* — the words of David the father sang, the just man afflicted yet always delivered.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc18_lookup sv, _session414_4macc18_lookup tv
 WHERE t.slug='4-maccabees-18-the-prophets-words-of-fire-and-life'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=18 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=34 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 3:18 — *She is a tree of life to them that lay hold upon her: and happy is every one that retaineth her* — the proverb of Solomon the father quoted, wisdom-and-Law the tree of life for them that do His will.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc18_lookup sv, _session414_4macc18_lookup tv
 WHERE t.slug='4-maccabees-18-the-prophets-words-of-fire-and-life'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=18 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ezekiel 37:3 — *Son of Adam, can these bones live? And I answered, O Yahuah (Lord) GOD, thou knowest* — *Shall these dry bones live?* the resurrection-question the father confirmed, the hope of the whole house of Yashar''el.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc18_lookup sv, _session414_4macc18_lookup tv
 WHERE t.slug='4-maccabees-18-the-prophets-words-of-fire-and-life'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=18 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Deuteronomy 32:39 — *I kill, and I make alive; I wound, and I heal: neither is there any that can deliver out of my hand* — the song of Moses the father remembered, *I will slay and I will make alive,* the Author of death and resurrection.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc18_lookup sv, _session414_4macc18_lookup tv
 WHERE t.slug='4-maccabees-18-the-prophets-words-of-fire-and-life'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=18 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=39
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Deuteronomy 30:19 — *I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live* — the life Moses set before Yashar''el, *this is your life,* chosen by the sons in dying for the Law.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc18_lookup sv, _session414_4macc18_lookup tv
 WHERE t.slug='4-maccabees-18-the-prophets-words-of-fire-and-life'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=18 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Deuteronomy 30:20 — *for he is thy life, and the length of thy days* — *this is your life and the blessedness of your days,* the very phrase the father drew from Moses'' song.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc18_lookup sv, _session414_4macc18_lookup tv
 WHERE t.slug='4-maccabees-18-the-prophets-words-of-fire-and-life'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=18 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 4-maccabees-18-gathered-unto-the-place-of-their-ancestors
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 11:35 — *and others were tortured, not accepting deliverance; that they might obtain a better resurrection* — the NT''s own allusion to this very martyrdom; the sons gathered to their fathers awaited the better resurrection.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc18_lookup sv, _session414_4macc18_lookup tv
 WHERE t.slug='4-maccabees-18-gathered-unto-the-place-of-their-ancestors'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=18 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 11:39 — *and these all, having obtained a good report through faith, received not the promise* — the cloud of witnesses, the sons of Abraham gathered to the place of their ancestors in hope.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc18_lookup sv, _session414_4macc18_lookup tv
 WHERE t.slug='4-maccabees-18-gathered-unto-the-place-of-their-ancestors'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=18 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=39
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 11:40 — *Elohim (God) having provided some better thing for us, that they without us should not be made perfect* — the better thing reserved, the immortal souls the martyrs received from Elohim awaiting consummation.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc18_lookup sv, _session414_4macc18_lookup tv
 WHERE t.slug='4-maccabees-18-gathered-unto-the-place-of-their-ancestors'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=18 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=40
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Luke 16:22 — *and it came to pass, that the beggar died, and was carried by the angels into Abraham''s bosom* — *gathered together unto the place of their ancestors,* the faithful received to Abraham among the fathers.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc18_lookup sv, _session414_4macc18_lookup tv
 WHERE t.slug='4-maccabees-18-gathered-unto-the-place-of-their-ancestors'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=18 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=16 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Daniel 12:2 — *and many of them that sleep in the dust of the earth shall awake, some to everlasting life* — the resurrection-of-the-just, the *pure and immortal souls* the sons of Abraham received from Elohim.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc18_lookup sv, _session414_4macc18_lookup tv
 WHERE t.slug='4-maccabees-18-gathered-unto-the-place-of-their-ancestors'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=18 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Daniel 12:3 — *and they that be wise shall shine as the brightness of the firmament; and they that turn many to righteousness as the stars for ever and ever* — the starlike glory of the victorious mother and her sons, set among the everlasting righteous.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc18_lookup sv, _session414_4macc18_lookup tv
 WHERE t.slug='4-maccabees-18-gathered-unto-the-place-of-their-ancestors'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=18 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Daniel 12:1 — *and at that time thy people shall be delivered, every one that shall be found written in the book* — the day of deliverance and judgement, when the wretch is pursued but the faithful are gathered.'
  FROM cross_reference_threads t, cross_references x, _session414_4macc18_lookup sv, _session414_4macc18_lookup tv
 WHERE t.slug='4-maccabees-18-gathered-unto-the-place-of-their-ancestors'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='4-maccabees' AND sv.chapter_number=18 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session414 — 4 Maccabees cross-references complete.'
