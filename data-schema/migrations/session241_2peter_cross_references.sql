-- =====================================================================
-- Session 241 — 2 Peter FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py data-schema/migrations/session241_2peter_cross_references.sql
-- =====================================================================

\echo 'session241 — 2 Peter cross-references starting...'
BEGIN;

-- ----- fragment: minion_2peter_01.sql (S241 2 Peter 1) -----
-- =====================================================================
-- S241 minion — 2 PETER 1 (Kepha Bet) FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 2 PETER 1 (21 verses).
-- Tag: p241c1 (temp view _s241_p241c1_lookup).
-- Sort band: floor 9760, step 3 (9760, 9763, 9766, 9769 used; under 9790).
-- Source is ALWAYS the canon 2 Peter verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (2 Peter = the dying apostle's charge to the elect: grow in the knowledge, hold
-- the more sure word of prophecy moved by the Ruach HaKodesh, beware the scoffers; same Yahuah, same
-- Torah, same covenant story). Chapter 1: ★ the partakers of the divine nature (1:4) = restored
-- holiness and the image of Elohim, the corruption escaped — NOT apotheosis, NOT men becoming gods;
-- the ladder of virtues (1:5-7) climbing the wisdom-books' path; the holy mount and the Father's
-- voice declaring the beloved Son (1:16-18, Psalm 2:7, the Father declaring the Son, no co-equal
-- grammar); ★★ the more sure word of prophecy / holy men moved by the Ruach HaKodesh (1:19-21) = the
-- Tanakh is the inspired, sure prophetic word, NOT superseded — the twin of 2 Timothy 3:16.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-3   servant and apostle; grace through the knowledge; called to glory and virtue
--           Tanakh: none warranted (the knowledge/virtue weight carried at the ladder thread, 1:5-7)
--           Extras: none warranted   NT: none warranted
--   v.4     ★ partakers of the divine nature, having escaped the corruption [restored holiness]
--           Tanakh: Genesis 1:26-27 (man in the image of Elohim), Leviticus 11:44 (be ye holy; for
--                   I am holy), Ezekiel 36:26-27 (a new heart, walk in my statutes)
--           Extras: none warranted (the divine-nature thread held soberly in canon roots)
--           NT: none warranted (Christology of 1:1-2 carried in prose)
--   v.5-7   ★ add to your faith virtue, knowledge, temperance, patience, godliness, charity
--           Tanakh: Proverbs 2:1-6 (seek wisdom and knowledge, find the fear of Yahuah)
--           Extras: Wisdom of Solomon 8:7 (wisdom teaches temperance, prudence, justice, fortitude)
--           NT: none warranted
--   v.8-15  fruitful in the knowledge; calling and election sure; this tabernacle put off
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted
--   v.16-18 the holy mount; the excellent glory; This is my beloved Son [the Father declares the Son]
--           Tanakh: Psalm 2:7 (Thou art my Son; this day have I begotten thee), Deuteronomy 18:15
--                   (a Prophet like unto me; unto him ye shall hearken)
--           Extras: none warranted   NT: Matthew 17:5 (the voice out of the cloud, This is my
--                   beloved Son... hear ye him — the Transfiguration)
--   v.19-21 ★★ the more sure word of prophecy; holy men moved by the Ruach HaKodesh [the Tanakh inspired]
--           Tanakh: Psalm 119:105 (thy word a lamp unto my feet), Psalm 119:89 (thy word settled in
--                   heaven), Proverbs 30:5 (every word of Elohim is pure)
--           Extras: none warranted   NT: 2 Timothy 3:16 (all scripture given by inspiration)
--
-- THREADS (slug -> target libraries):
--   9760 2-peter-1-partakers-of-the-divine-nature-the-image-restored-genesis-1-leviticus-11  (Tanakh)
--   9763 2-peter-1-the-ladder-of-virtues-added-to-faith-proverbs-2-wisdom-of-solomon-8        (Tanakh + Extras)
--   9766 2-peter-1-the-holy-mount-and-the-fathers-voice-this-is-my-beloved-son-psalm-2        (Tanakh + NT)
--   9769 2-peter-1-the-more-sure-word-of-prophecy-holy-men-moved-by-the-ruach-hakodesh-psalm-119  (Tanakh + NT)  [BLESSING]
-- =====================================================================

CREATE TEMP VIEW _s241_p241c1_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-peter-1-partakers-of-the-divine-nature-the-image-restored-genesis-1-leviticus-11
  ('canon', '2-peter', 1, 4, 'canon', 'genesis', 1, 26, 'free', E'*And Elohim (God) said, Let us make man in our image, after our likeness: and let them have dominion over the fish of the sea, and over the fowl of the air, and over the cattle, and over all the earth, and over every creeping thing that creepeth upon the earth.* (Genesis 1:26). Man was made *in our image, after our likeness* — and that is the ground of Peter''s promise that *by these ye might be partakers of the divine nature, having escaped the corruption that is in the world through lust* (2 Peter 1:4). To be partaker of the *divine nature* is to be restored to the image in which man was first formed, the holiness and incorruption that were marred in the fall — not to become a god, but to be remade after the likeness of the One who made him.'),
  ('canon', '2-peter', 1, 4, 'canon', 'genesis', 1, 27, 'free', E'*So Elohim (God) created man in his own image, in the image of Elohim (God) created he him; male and female created he them.* (Genesis 1:27). *In the image of Elohim (God) created he him* — the original pattern of man, three times the image named. Peter''s *partakers of the divine nature* (2 Peter 1:4) is this image renewed: the *exceeding great and precious promises* restore the man whom corruption defaced to the holy likeness of his Maker. The sharing is of Elohim''s (God''s) holy character, not of His being; the creature is brought back to the image, not lifted into deity.'),
  ('canon', '2-peter', 1, 4, 'canon', 'leviticus', 11, 44, 'free', E'*For I am Yahuah Elohaychem (the LORD your God): ye shall therefore sanctify yourselves, and ye shall be holy; for I am holy: neither shall ye defile yourselves with any manner of creeping thing that creepeth upon the earth.* (Leviticus 11:44). *Ye shall be holy; for I am holy* — this is the very nature Peter says the promises make us partakers of. The *divine nature* shared (2 Peter 1:4) is Yahuah''s (the LORD''s) holiness, the call to *sanctify yourselves* and *escape the corruption that is in the world.* Partaking of His nature is being made holy as He is holy, the Torah''s own command fulfilled in the renewed heart — not apotheosis but sanctification.'),
  ('canon', '2-peter', 1, 4, 'canon', 'ezekiel', 36, 26, 'free', E'*A new heart also will I give you, and a new spirit will I put within you: and I will take away the stony heart out of your flesh, and I will give you an heart of flesh.* (Ezekiel 36:26). The promise of the *new heart* and *new spirit* is how the divine nature is shared: Yahuah (LORD) puts His own Spirit within and writes His holiness upon the heart. Peter''s *partakers of the divine nature, having escaped the corruption* (2 Peter 1:4) is this new heart given — the stony heart taken away, the corrupt nature exchanged for one that walks in His statutes. The share is in His Spirit and His holiness, restoring the image, not erasing the line between Creator and creature.'),
  ('canon', '2-peter', 1, 4, 'canon', 'ezekiel', 36, 27, 'free', E'*And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them.* (Ezekiel 36:27). The new heart of the foregoing verse bears its fruit here: *I will put my spirit within you, and cause you to walk in my statutes.* To partake of the *divine nature* (2 Peter 1:4) is to receive that Spirit and so be made to *walk in my statutes* and *keep my judgments* — the holiness of Elohim (God) become the holiness of the man. Partaking of His nature is Torah-keeping from a renewed heart, the corruption escaped and the image restored, never a man made into a god.'),
  -- thread: 2-peter-1-the-ladder-of-virtues-added-to-faith-proverbs-2-wisdom-of-solomon-8
  ('canon', '2-peter', 1, 5, 'canon', 'proverbs', 2, 5, 'free', E'*Then shalt thou understand the fear of Yahuah (LORD), and find the knowledge of Elohim (God).* (Proverbs 2:5). The wisdom-book teaches the same climb Peter sets out: seek wisdom *as silver,* and *then shalt thou... find the knowledge of Elohim (God).* Peter charges, *add to your faith virtue; and to virtue knowledge* (2 Peter 1:5) — the knowledge of Elohim (God) that Proverbs promises to the one who seeks. The ladder of virtues is the path of wisdom the Tanakh already laid, faith reaching upward toward the fear of Yahuah (LORD) and the knowledge of Him.'),
  ('canon', '2-peter', 1, 5, 'canon', 'proverbs', 2, 6, 'free', E'*For Yahuah (LORD) giveth wisdom: out of his mouth cometh knowledge and understanding.* (Proverbs 2:6). *Yahuah (LORD) giveth wisdom: out of his mouth cometh knowledge and understanding* — the source of the very things Peter bids the elect add. To *add to your faith virtue; and to virtue knowledge* (2 Peter 1:5) is to grow in what Yahuah (LORD) Himself gives out of His mouth. The diligence Peter calls for is the seeking of Proverbs 2; the knowledge climbed toward is the knowledge Yahuah (LORD) bestows.'),
  ('canon', '2-peter', 1, 6, 'apocrypha', 'the-wisdom-of-solomon', 8, 7, 'extras', E'*And if a man love righteousness her labours are virtues: for she teaches temperance and prudence, justice and fortitude: which are such things, as men can have nothing more profitable in their life.* (Wisdom of Solomon 8:7). The Hebrew wisdom-library already names the rungs of Peter''s ladder: wisdom *teaches temperance and prudence, justice and fortitude.* Peter bids the elect add *temperance... patience... godliness* (2 Peter 1:6) — the same virtues the library calls *such things, as men can have nothing more profitable in their life.* The chain of graces Peter sets out is the labour of wisdom the restored books had long taught; the apostle''s exhortation is no new ethic but the ancient path of her who teaches the virtues.'),
  -- thread: 2-peter-1-the-holy-mount-and-the-fathers-voice-this-is-my-beloved-son-psalm-2
  ('canon', '2-peter', 1, 17, 'canon', 'psalms', 2, 7, 'free', E'*I will declare the decree: Yahuah (LORD) hath said unto me, Thou art my Son; this day have I begotten thee.* (Psalm 2:7). The decree of the Psalm is the word the Father speaks on the holy mount: *Thou art my Son.* Peter testifies, *he received from Elohim (God) the Father honour and glory, when there came such a voice to him from the excellent glory, This is my beloved Son, in whom I am well pleased* (2 Peter 1:17). It is the Father who declares the Son — the One enthroned upon the holy hill of Zion in the Psalm, the beloved Son honoured by the Father''s own voice. The Father is the source who declares; the Son the beloved declared.'),
  ('canon', '2-peter', 1, 18, 'canon', 'deuteronomy', 18, 15, 'free', E'*Yahuah Elohayka (The LORD thy God) will raise up unto thee a Prophet from the midst of thee, of thy brethren, like unto me; unto him ye shall hearken;* (Deuteronomy 18:15). Moses promised the Prophet like unto himself, and charged Yashar''el (Israel), *unto him ye shall hearken.* On the holy mount the Father''s own voice confirms the One to be heard: *this voice which came from heaven we heard, when we were with him in the holy mount* (2 Peter 1:18) — the voice that on that mountain said *hear ye him.* The Prophet whom Moses bade Yashar''el (Israel) hearken to is the beloved Son the Father bids the world hear.'),
  ('canon', '2-peter', 1, 17, 'canon', 'matthew', 17, 5, 'free', E'*While he yet spake, behold, a bright cloud overshadowed them: and behold a voice out of the cloud, which said, This is my beloved Son, in whom I am well pleased; hear ye him.* (Matthew 17:5). The gospel records the moment Peter remembers: the *voice out of the cloud* on the high mountain, *This is my beloved Son, in whom I am well pleased; hear ye him.* Peter, who stood there, writes *there came such a voice to him from the excellent glory, This is my beloved Son... when we were with him in the holy mount* (2 Peter 1:17-18). The Transfiguration is the eyewitness ground of the apostle''s testimony — the Father declaring the beloved Son, the disciples charged to hear Him.'),
  -- thread: 2-peter-1-the-more-sure-word-of-prophecy-holy-men-moved-by-the-ruach-hakodesh-psalm-119
  ('canon', '2-peter', 1, 19, 'canon', 'psalms', 119, 105, 'free', E'*Thy word is a lamp unto my feet, and a light unto my path.* (Psalm 119:105). The psalmist calls the word *a lamp unto my feet, and a light unto my path* — and Peter calls the more sure word of prophecy *a light that shineth in a dark place* (2 Peter 1:19). The light to take heed unto, *until the day dawn, and the day star arise in your hearts,* is the very word of the Tanakh the psalm exalts: the lamp for the feet, the light for the path. The more sure word is the Scripture already given, the shining lamp the faithful have always walked by.'),
  ('canon', '2-peter', 1, 21, 'canon', 'psalms', 119, 89, 'free', E'*For ever, O Yahuah (LORD), thy word is settled in heaven.* (Psalm 119:89). *For ever, O Yahuah (LORD), thy word is settled in heaven* — the word is no word of man but Yahuah''s (the LORD''s) own, fixed and enduring. Peter affirms the same: *the prophecy came not in old time by the will of man: but holy men of Elohim (God) spake as they were moved by the Ruach HaKodesh (Holy Spirit)* (2 Peter 1:21). The Scripture is not of private interpretation nor of human will; it is the word settled in heaven, spoken by holy men as the Ruach HaKodesh (Holy Spirit) moved them.'),
  ('canon', '2-peter', 1, 21, 'canon', 'proverbs', 30, 5, 'free', E'*Every word of Elohim (God) is pure: he is a shield unto them that put their trust in him.* (Proverbs 30:5). *Every word of Elohim (God) is pure* — the prophetic word is His, unmixed with the will of man. Peter says, *no prophecy of the scripture is of any private interpretation. For the prophecy came not in old time by the will of man: but holy men of Elohim (God) spake as they were moved by the Ruach HaKodesh (Holy Spirit)* (2 Peter 1:20-21). The purity of every word of Elohim (God) is its source: holy men moved by the Ruach HaKodesh (Holy Spirit), the Scripture the sure word to be trusted.'),
  ('canon', '2-peter', 1, 21, 'canon', '2-timothy', 3, 16, 'free', E'*All scripture is given by inspiration of Elohim (God), and is profitable for doctrine, for reproof, for correction, for instruction in righteousness:* (2 Timothy 3:16). Paul and Peter speak the one truth: *all scripture is given by inspiration of Elohim (God).* Peter''s words are the twin — *holy men of Elohim (God) spake as they were moved by the Ruach HaKodesh (Holy Spirit)* (2 Peter 1:21). The Scripture breathed out by Elohim (God) in Paul is the Scripture spoken by holy men as the Ruach HaKodesh (Holy Spirit) moved them in Peter: both naming the Tanakh, the Law and the Prophets, as the inspired and sure word — not superseded, but established as the more sure word of prophecy.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s241_p241c1_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s241_p241c1_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-peter-1-partakers-of-the-divine-nature-the-image-restored-genesis-1-leviticus-11',
       E'Partakers of the divine nature — the image of Elohim restored (Genesis 1, Leviticus 11, Ezekiel 36)',
       E'Peter writes that *by these ye might be partakers of the divine nature, having escaped the corruption that is in the world through lust* (2 Peter 1:4). Read soberly through the covenant story, this is no promise that men become gods — it is the restoration of the image in which man was first made and the holiness to which Yahuah (LORD) calls His people. Man was formed *in our image, after our likeness* (Genesis 1:26), and again, *in the image of Elohim (God) created he him* (Genesis 1:27); the image marred by the fall is the image the precious promises renew. The *divine nature* shared is Yahuah''s (the LORD''s) own holiness: *ye shall be holy; for I am holy* (Leviticus 11:44) — the very command of the Torah, fulfilled in the renewed man who has *escaped the corruption that is in the world.* And the means is the new covenant promise: *A new heart also will I give you, and a new spirit will I put within you: and I will take away the stony heart out of your flesh* (Ezekiel 36:26), with His own Spirit put within to *cause you to walk in my statutes* (Ezekiel 36:27). To partake of the divine nature is to receive that Spirit, to be made holy as He is holy, to be restored to the image of the Maker and so to keep His judgments from a heart of flesh. The share is in His holy character, not in His being; the creature is brought back to the likeness in which it was made, never lifted across the line into deity. This is sanctification, the corruption escaped and the image restored — not apotheosis.',
       sv.verse_id, ev.verse_id, 'free', 9760
  FROM _s241_p241c1_lookup sv, _s241_p241c1_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=1 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='2-peter' AND ev.chapter_number=1 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-peter-1-the-ladder-of-virtues-added-to-faith-proverbs-2-wisdom-of-solomon-8',
       E'The ladder of virtues added to faith — the path of wisdom (Proverbs 2, Wisdom of Solomon 8)',
       E'Peter charges the elect to a chain of graces: *add to your faith virtue; and to virtue knowledge; And to knowledge temperance; and to temperance patience; and to patience godliness; And to godliness brotherly kindness; and to brotherly kindness charity* (2 Peter 1:5-7). This ladder is no new ethic but the path of wisdom the Hebrew books had long laid down. Proverbs sets out the same climb: seek wisdom as silver and *then shalt thou understand the fear of Yahuah (LORD), and find the knowledge of Elohim (God)* (Proverbs 2:5), *for Yahuah (LORD) giveth wisdom: out of his mouth cometh knowledge and understanding* (Proverbs 2:6) — the knowledge Peter bids be added to faith. And the wisdom-library names the very rungs: wisdom *teaches temperance and prudence, justice and fortitude: which are such things, as men can have nothing more profitable in their life* (Wisdom of Solomon 8:7) — Peter''s temperance, patience, and godliness, the labour of wisdom herself. The diligence Peter calls for is the seeking of Proverbs 2; the virtues climbed are the virtues wisdom teaches. It ain''t new: the apostle exhorts to the ancient path the restored books already walked.',
       sv.verse_id, ev.verse_id, 'extras', 9763
  FROM _s241_p241c1_lookup sv, _s241_p241c1_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=1 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='2-peter' AND ev.chapter_number=1 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-peter-1-the-holy-mount-and-the-fathers-voice-this-is-my-beloved-son-psalm-2',
       E'The holy mount and the Father''s voice — This is my beloved Son (Psalm 2, Deuteronomy 18, Matthew 17)',
       E'Peter was an eyewitness of the majesty: *we have not followed cunningly devised fables... but were eyewitnesses of his majesty. For he received from Elohim (God) the Father honour and glory, when there came such a voice to him from the excellent glory, This is my beloved Son, in whom I am well pleased. And this voice which came from heaven we heard, when we were with him in the holy mount* (2 Peter 1:16-18). The voice on the mount speaks the decree of the Psalm: *Yahuah (LORD) hath said unto me, Thou art my Son; this day have I begotten thee* (Psalm 2:7) — it is the Father who declares the Son, the One enthroned upon the holy hill of Zion. And the charge that voice gave, *hear ye him,* is the charge Moses laid on Yashar''el (Israel) concerning the Prophet to come: *Yahuah Elohayka (The LORD thy God) will raise up unto thee a Prophet from the midst of thee, of thy brethren, like unto me; unto him ye shall hearken* (Deuteronomy 18:15). The gospel records the moment Peter remembers: *a voice out of the cloud, which said, This is my beloved Son, in whom I am well pleased; hear ye him* (Matthew 17:5). The Transfiguration is the eyewitness ground of the apostle''s sure testimony. Mark the Christology: it is *Elohim (God) the Father* who gives the Son *honour and glory* and declares Him — the Father the source who declares and sends, the Son the beloved declared. No co-equal-persons grammar, no collapse of the two; the Prophet whom Moses bade Yashar''el (Israel) hearken to is the beloved Son the Father bids the world hear.',
       sv.verse_id, ev.verse_id, 'free', 9766
  FROM _s241_p241c1_lookup sv, _s241_p241c1_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=1 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='2-peter' AND ev.chapter_number=1 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-peter-1-the-more-sure-word-of-prophecy-holy-men-moved-by-the-ruach-hakodesh-psalm-119',
       E'The more sure word of prophecy — holy men moved by the Ruach HaKodesh (Psalm 119, Proverbs 30, 2 Timothy 3)',
       E'After the witness of the holy mount, Peter points the elect to a yet surer ground: *We have also a more sure word of prophecy; whereunto ye do well that ye take heed, as unto a light that shineth in a dark place, until the day dawn, and the day star arise in your hearts: Knowing this first, that no prophecy of the scripture is of any private interpretation. For the prophecy came not in old time by the will of man: but holy men of Elohim (God) spake as they were moved by the Ruach HaKodesh (Holy Spirit)* (2 Peter 1:19-21). The *more sure word of prophecy* is the Tanakh — the Law and the Prophets, the Scripture *holy men of Elohim (God) spake* as the Ruach HaKodesh (Holy Spirit) moved them. It is the lamp the faithful have always walked by: *Thy word is a lamp unto my feet, and a light unto my path* (Psalm 119:105), the *light that shineth in a dark place* until the day dawns. It is no word of man but Yahuah''s (the LORD''s) own, fixed and enduring: *For ever, O Yahuah (LORD), thy word is settled in heaven* (Psalm 119:89). It is pure, unmixed with human will: *Every word of Elohim (God) is pure: he is a shield unto them that put their trust in him* (Proverbs 30:5). And it is the very affirmation Paul makes — the twin of this passage: *All scripture is given by inspiration of Elohim (God), and is profitable for doctrine, for reproof, for correction, for instruction in righteousness* (2 Timothy 3:16). What Paul calls inspired by Elohim (God), Peter calls spoken by holy men as the Ruach HaKodesh (Holy Spirit) moved them: both name the Tanakh as the inspired and sure prophetic word. Peter does not set a new word over the old; he establishes the old as the more sure word — the Scripture settled in heaven, the lamp shining in the dark place, the prophecy that came not by the will of man. The Tanakh is not superseded; it is the sure word to which the elect do well to take heed until the day star arises.',
       sv.verse_id, ev.verse_id, 'free', 9769
  FROM _s241_p241c1_lookup sv, _s241_p241c1_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=1 AND sv.verse_number=19
   AND ev.edition_slug='canon' AND ev.book_slug='2-peter' AND ev.chapter_number=1 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-peter-1-partakers-of-the-divine-nature-the-image-restored-genesis-1-leviticus-11
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:26 — *Let us make man in our image, after our likeness* the image in which man was first formed; *partakers of the divine nature* is that image restored, not deity attained (2 Peter 1:4).'
  FROM cross_reference_threads t, cross_references x, _s241_p241c1_lookup sv, _s241_p241c1_lookup tv
 WHERE t.slug='2-peter-1-partakers-of-the-divine-nature-the-image-restored-genesis-1-leviticus-11'
   AND sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 1:27 — *in the image of Elohim (God) created he him* the original pattern of man; the *divine nature* shared is this image renewed, the holiness of the Maker (2 Peter 1:4).'
  FROM cross_reference_threads t, cross_references x, _s241_p241c1_lookup sv, _s241_p241c1_lookup tv
 WHERE t.slug='2-peter-1-partakers-of-the-divine-nature-the-image-restored-genesis-1-leviticus-11'
   AND sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 11:44 — *ye shall be holy; for I am holy* the very nature partaken of; the Torah''s own call to sanctification, not apotheosis (2 Peter 1:4).'
  FROM cross_reference_threads t, cross_references x, _s241_p241c1_lookup sv, _s241_p241c1_lookup tv
 WHERE t.slug='2-peter-1-partakers-of-the-divine-nature-the-image-restored-genesis-1-leviticus-11'
   AND sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=11 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ezekiel 36:26 — *A new heart also will I give you, and a new spirit will I put within you* the new-covenant means of sharing the divine nature; the stony heart taken away (2 Peter 1:4).'
  FROM cross_reference_threads t, cross_references x, _s241_p241c1_lookup sv, _s241_p241c1_lookup tv
 WHERE t.slug='2-peter-1-partakers-of-the-divine-nature-the-image-restored-genesis-1-leviticus-11'
   AND sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Ezekiel 36:27 — *I will put my spirit within you, and cause you to walk in my statutes* the Spirit given to make the man holy; partaking of the divine nature is Torah-keeping from a renewed heart (2 Peter 1:4).'
  FROM cross_reference_threads t, cross_references x, _s241_p241c1_lookup sv, _s241_p241c1_lookup tv
 WHERE t.slug='2-peter-1-partakers-of-the-divine-nature-the-image-restored-genesis-1-leviticus-11'
   AND sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-peter-1-the-ladder-of-virtues-added-to-faith-proverbs-2-wisdom-of-solomon-8
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 2:5 — *then shalt thou understand the fear of Yahuah (LORD), and find the knowledge of Elohim (God)* the knowledge Peter bids be added to faith, found on the path of wisdom (2 Peter 1:5).'
  FROM cross_reference_threads t, cross_references x, _s241_p241c1_lookup sv, _s241_p241c1_lookup tv
 WHERE t.slug='2-peter-1-the-ladder-of-virtues-added-to-faith-proverbs-2-wisdom-of-solomon-8'
   AND sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=1 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=2 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 2:6 — *Yahuah (LORD) giveth wisdom: out of his mouth cometh knowledge and understanding* the source of the graces Peter bids be added; the diligence is the seeking of Proverbs 2 (2 Peter 1:5).'
  FROM cross_reference_threads t, cross_references x, _s241_p241c1_lookup sv, _s241_p241c1_lookup tv
 WHERE t.slug='2-peter-1-the-ladder-of-virtues-added-to-faith-proverbs-2-wisdom-of-solomon-8'
   AND sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=1 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=2 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Wisdom of Solomon 8:7 — *she teaches temperance and prudence, justice and fortitude* the very rungs of Peter''s ladder named by the wisdom-library; *temperance... patience... godliness* (2 Peter 1:6).'
  FROM cross_reference_threads t, cross_references x, _s241_p241c1_lookup sv, _s241_p241c1_lookup tv
 WHERE t.slug='2-peter-1-the-ladder-of-virtues-added-to-faith-proverbs-2-wisdom-of-solomon-8'
   AND sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=1 AND sv.verse_number=6
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=8 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-peter-1-the-holy-mount-and-the-fathers-voice-this-is-my-beloved-son-psalm-2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 2:7 — *Yahuah (LORD) hath said unto me, Thou art my Son; this day have I begotten thee* the Father''s decree spoken on the mount; *This is my beloved Son, in whom I am well pleased* (2 Peter 1:17).'
  FROM cross_reference_threads t, cross_references x, _s241_p241c1_lookup sv, _s241_p241c1_lookup tv
 WHERE t.slug='2-peter-1-the-holy-mount-and-the-fathers-voice-this-is-my-beloved-son-psalm-2'
   AND sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=1 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 18:15 — *a Prophet... like unto me; unto him ye shall hearken* the One Moses bade Yashar''el (Israel) hear; the voice on the mount said *hear ye him* of the same beloved Son (2 Peter 1:18).'
  FROM cross_reference_threads t, cross_references x, _s241_p241c1_lookup sv, _s241_p241c1_lookup tv
 WHERE t.slug='2-peter-1-the-holy-mount-and-the-fathers-voice-this-is-my-beloved-son-psalm-2'
   AND sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=1 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 17:5 — *a voice out of the cloud, which said, This is my beloved Son, in whom I am well pleased; hear ye him* the Transfiguration Peter witnessed, the eyewitness ground of his testimony (2 Peter 1:17-18).'
  FROM cross_reference_threads t, cross_references x, _s241_p241c1_lookup sv, _s241_p241c1_lookup tv
 WHERE t.slug='2-peter-1-the-holy-mount-and-the-fathers-voice-this-is-my-beloved-son-psalm-2'
   AND sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=1 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=17 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-peter-1-the-more-sure-word-of-prophecy-holy-men-moved-by-the-ruach-hakodesh-psalm-119
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 119:105 — *Thy word is a lamp unto my feet, and a light unto my path* the lamp the faithful walk by; the more sure word *a light that shineth in a dark place* (2 Peter 1:19).'
  FROM cross_reference_threads t, cross_references x, _s241_p241c1_lookup sv, _s241_p241c1_lookup tv
 WHERE t.slug='2-peter-1-the-more-sure-word-of-prophecy-holy-men-moved-by-the-ruach-hakodesh-psalm-119'
   AND sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=1 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=119 AND tv.verse_number=105
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 119:89 — *For ever, O Yahuah (LORD), thy word is settled in heaven* the word no word of man but Yahuah''s (the LORD''s) own; *the prophecy came not... by the will of man* (2 Peter 1:21).'
  FROM cross_reference_threads t, cross_references x, _s241_p241c1_lookup sv, _s241_p241c1_lookup tv
 WHERE t.slug='2-peter-1-the-more-sure-word-of-prophecy-holy-men-moved-by-the-ruach-hakodesh-psalm-119'
   AND sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=1 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=119 AND tv.verse_number=89
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 30:5 — *Every word of Elohim (God) is pure: he is a shield unto them that put their trust in him* the purity of the prophetic word, spoken by holy men as the Ruach HaKodesh (Holy Spirit) moved them (2 Peter 1:20-21).'
  FROM cross_reference_threads t, cross_references x, _s241_p241c1_lookup sv, _s241_p241c1_lookup tv
 WHERE t.slug='2-peter-1-the-more-sure-word-of-prophecy-holy-men-moved-by-the-ruach-hakodesh-psalm-119'
   AND sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=1 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=30 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Timothy 3:16 — *All scripture is given by inspiration of Elohim (God)* the twin of Peter''s word; what Paul calls inspired, Peter calls spoken by holy men moved by the Ruach HaKodesh (Holy Spirit) — both naming the Tanakh as the sure word, NOT superseded (2 Peter 1:21).'
  FROM cross_reference_threads t, cross_references x, _s241_p241c1_lookup sv, _s241_p241c1_lookup tv
 WHERE t.slug='2-peter-1-the-more-sure-word-of-prophecy-holy-men-moved-by-the-ruach-hakodesh-psalm-119'
   AND sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=1 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='2-timothy' AND tv.chapter_number=3 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2peter_02.sql (S241 2 Peter 2) -----
-- =====================================================================
-- S241 minion — 2 PETER 2 (Kepha Bet 2) FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 2 PETER 2 (22 verses) — THE HIGHEST-WEIGHT CHAPTER. The angels that
-- sinned / the Watchers / Noah / Sodom / Lot / Balaam — the "it ain't new"
-- judgment-history the restored library narrates in full.
-- Tag: p241c2 (temp view _s241_p241c2_lookup).
-- Sort band: floor 9790, step 3 (9790, 9793, 9796, 9799, 9802 used; under 9820).
-- Source is ALWAYS the canon 2 Peter verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (2 Peter = the letter of the sure prophetic word against the scoffers; the
-- dying apostle's charge to the elect). Chapter 2 turns to the false teachers who deny the
-- Master, and proves their certain judgment by the library's own record: ★★★ the angels that
-- sinned cast into chains of darkness (the Watchers of Genesis 6, bound exactly as 1 Enoch 10
-- and 21 and Jubilees 5 narrate — the SAME Watchers thread already live from 1 Peter 3:19-20 and
-- Jude 6); the old world drowned and Noah the eighth saved; Sodom turned to ashes and just Lot
-- delivered. Then ★ the way of Balaam the son of Bosor, the dumb ass rebuking the prophet; and
-- the dog returned to his vomit. No replacement theology, no law-vs-grace antithesis: the
-- judgment-history belongs to the one covenant story, and v.21's *holy commandment delivered unto
-- them* is the Torah-rooted way of righteousness, not a new law. Christology held in the prose:
-- the false teachers deny *Yahuah (Lord) that bought them* (2:1) and the knowledge of *Yahuah
-- (Lord) and Saviour Yahusha HaMashiach (Jesus Christ)* (2:20) — preserved exactly as the pull
-- gives each. The angels-that-sinned thread SELF-LINKS the live 1 Enoch + Jubilees Watchers
-- record and is the showcase weave; carry it with full weight.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-3   false teachers who privily bring in heresies, denying Yahuah (Lord) that bought them
--           Tanakh: Deuteronomy 13:1-5 (the false prophet who turns you away, put to death)
--           Extras: none warranted (the judgment weight lands at v.4-9)
--           NT: Jude 4 (certain men crept in unawares... denying the only Yahuah Elohim (Lord God))
--   v.4-9   ★★★ the angels that sinned in chains of darkness / Noah the eighth / Sodom to ashes / Lot
--           Tanakh: Genesis 6:1-4 (the sons of Elohim, the giants), Genesis 6:8-9 (Noah just and
--                   perfect), Genesis 7:23 (the Flood, Noah only remained), Genesis 19:24-25
--                   (Sodom and Gomorrah, brimstone and fire), Genesis 19:16 (Lot delivered)
--           Extras: 1 Enoch 10:4 (Bind Azazel), 1 Enoch 10:12 (bind Semjaza fast till the day of
--                   their judgement), 1 Enoch 21:10 (the prison of the angels, imprisoned for ever),
--                   Jubilees 5:6 (bound in the depths of the earth), Jubilees 5:10 (bound till the
--                   day of the great condemnation), Wisdom 10:4 (Noah and the flood-wood), Wisdom
--                   10:6 (Lot delivered from the fire on the five cities), Sirach 16:7-8 (the old
--                   giants, the place of Lot not spared), Sirach 44:17 (Noah found perfect)
--           NT: Jude 6 (angels in everlasting chains), Jude 7 (Sodom an example), 1 Peter 3:19-20
--               (the spirits in prison, eight souls saved — self-link), Matthew 24:37-39 (the days of Noah)
--   v.11    angels greater in power bring not railing accusation before Yahuah (Lord)
--           Tanakh: none warranted (no single root verse)
--           Extras: none warranted   NT: Jude 9 (Michael durst not bring a railing accusation)
--   v.15-16 ★ following the way of Balaam the son of Bosor / the dumb ass speaking with man's voice
--           Tanakh: Numbers 22:28 (Yahuah opened the mouth of the ass), Numbers 22:31 (Balaam saw
--                   the angel), Numbers 31:16 (the counsel of Balaam, the matter of Peor),
--                   Deuteronomy 23:4-5 (they hired Balaam to curse thee)
--           Extras: none warranted (Balaam carried in canon + Jude)
--           NT: Jude 11 (ran greedily after the error of Balaam for reward)
--   v.22    the dog is turned to his own vomit again
--           Tanakh: Proverbs 26:11 (As a dog returneth to his vomit, so a fool to his folly)
--           Extras: none warranted   NT: none warranted
--   v.10,12-14,17-21  the walk after the flesh, brute beasts, wells without water, the holy
--           commandment delivered unto them
--           Tanakh/Extras/NT: none warranted as standalone threads (the holy commandment = the
--           Torah-rooted way of righteousness, carried in the prose of v.4-9 + v.15-16; v.10-14
--           and 17-21 are the apostle's own description, not quotation of a root verse)
--
-- THREADS (slug -> target libraries):
--   9790 2-peter-2-false-teachers-who-deny-the-master-the-false-prophet-deuteronomy-13   (Tanakh + NT)
--   9793 2-peter-2-the-angels-that-sinned-noah-and-sodom-the-watchers-genesis-6-enoch-jubilees  (Tanakh + Extras + NT) [KEYSTONE, self-links live Watchers]
--   9796 2-peter-2-angels-bring-not-a-railing-accusation-jude-9   (NT)
--   9799 2-peter-2-the-way-of-balaam-the-son-of-bosor-and-the-dumb-ass-numbers-22   (Tanakh + NT)
--   9802 2-peter-2-the-dog-is-turned-to-his-own-vomit-again-proverbs-26   (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s241_p241c2_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-peter-2-false-teachers-who-deny-the-master-the-false-prophet-deuteronomy-13
  ('canon', '2-peter', 2, 1, 'canon', 'deuteronomy', 13, 5, 'free', E'*And that prophet, or that dreamer of dreams, shall be put to death; because he hath spoken to turn you away from Yahuah Elohaychem (the LORD your God), which brought you out of the land of Egypt, and redeemed you out of the house of bondage, to thrust thee out of the way which Yahuah Elohayka (the LORD thy God) commanded thee to walk in.* (Deuteronomy 13:5). The Torah already named the danger Kepha (Peter) warns of: the false prophet who *speaks to turn you away* and *thrust thee out of the way.* So Kepha writes *there were false prophets also among the people, even as there shall be false teachers among you, who privily shall bring in damnable heresies, even denying Yahuah (Lord) that bought them* (2 Peter 2:1). It ain''t new — the false teacher who denies the Master is the false prophet of Deuteronomy 13, who turns the elect from *the way which Yahuah (LORD) commanded thee to walk in.*'),
  ('canon', '2-peter', 2, 1, 'canon', 'deuteronomy', 13, 1, 'free', E'*If there arise among you a prophet, or a dreamer of dreams, and giveth thee a sign or a wonder,* (Deuteronomy 13:1). Moses warned that a prophet might *arise among you* with persuasive signs, yet teach you to *go after other gods.* Kepha (Peter) sees the same threat *among you*: *there shall be false teachers among you, who privily shall bring in damnable heresies* (2 Peter 2:1). The test is unchanged: not the wonder but the doctrine — whether he leads you to keep the way Yahuah (LORD) commanded or turns you from it.'),
  ('canon', '2-peter', 2, 1, 'canon', 'jude', 1, 4, 'free', E'*For there are certain men crept in unawares, who were before of old ordained to this condemnation, ungodly men, turning the grace of our Elohim (God) into lasciviousness, and denying the only Yahuah Elohim (Lord God), and our Lord Yahusha HaMashiach (Lord Jesus Christ).* (Jude 4). Jude describes the very men Kepha (Peter) describes: they *crept in unawares* as the false teachers *privily shall bring in damnable heresies,* and they are *denying the only Yahuah Elohim (Lord God)* as the false teachers are *denying Yahuah (Lord) that bought them* (2 Peter 2:1). The twin letters speak with one voice against the deniers of the Master who pervert grace into license.'),
  -- thread: 2-peter-2-the-angels-that-sinned-noah-and-sodom-the-watchers-genesis-6-enoch-jubilees  [KEYSTONE]
  ('canon', '2-peter', 2, 4, 'canon', 'genesis', 6, 4, 'free', E'*There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* (Genesis 6:4). The *angels that sinned* whom Elohim (God) *cast down to hell, and delivered into chains of darkness* (2 Peter 2:4) are the *sons of Elohim (God)* of Genesis 6 — the Watchers who *came in unto the daughters of men* and begat the giants. Kepha (Peter) is not coining a myth; he is reading Torah''s own record of the fall that brought the Flood. The angels who left their station are bound for the judgment.'),
  ('canon', '2-peter', 2, 4, 'enoch', '1-enoch', 10, 4, 'extras', E'*And again Yahuah (God) said to Raphael: ''Bind Azâzêl hand and foot, and cast him into the darkness: and make an opening in the desert, which is in Dûdâêl, and cast him therein.* (1 Enoch 10:4). Here is the binding Kepha (Peter) names — *the angels that sinned... delivered into chains of darkness, to be reserved unto judgment* (2 Peter 2:4). The library tells exactly how: Azâzêl bound hand and foot, *cast into the darkness,* covered with rough rocks. This is the live 1 Enoch Watchers record the apparatus already carries from 1 Peter 3 and Jude 6; the chains of darkness are the chains of this very chapter.'),
  ('canon', '2-peter', 2, 4, 'enoch', '1-enoch', 10, 12, 'extras', E'*And when their sons have slain one another, and they have seen the destruction of their beloved ones, bind them fast for seventy generations in the valleys of the earth, till the day of their judgement and of their consummation, till the judgement that is for ever and ever is consummated.* (1 Enoch 10:12). Semjâzâ and his associates are bound *till the day of their judgement* — the precise note Kepha (Peter) sounds: the angels *delivered into chains of darkness, to be reserved unto judgment* (2 Peter 2:4). The Watchers are not destroyed but reserved; the library and the apostle agree to the word, *bound fast... till the day of their judgement.*'),
  ('canon', '2-peter', 2, 4, 'enoch', '1-enoch', 21, 10, 'extras', E'*Then Uriel, one of the holy angels who was with me, answered and said unto me: ''Enoch, why hast thou such fear and affright?'' And I answered: ''Because of this fearful place, and because of the spectacle of the pain.''* (1 Enoch 21:10). Enoch is shown *the prison of the angels,* where *they will be imprisoned for ever* (1 Enoch 21:11) — a place of fire and abyss beyond measure. This is the *hell* and the *chains of darkness* into which the angels that sinned were cast (2 Peter 2:4); the apostle points to the very prison the library showed Enoch, the fearful place reserved for the Watchers unto judgment.'),
  ('canon', '2-peter', 2, 4, 'jubilees', 'jubilees', 5, 6, 'extras', E'*And against the angels whom He had sent upon the earth, He was exceedingly wroth, and He gave commandment to root them out of all their dominion, and He bade us to bind them in the depths of the earth, and behold they are bound in the midst of them, and are (kept) separate.* (Jubilees 5:6). Jubilees tells the same binding Kepha (Peter) names: the angels *bound in the depths of the earth,* held *separate.* This is *the angels that sinned... cast down to hell, and delivered into chains of darkness* (2 Peter 2:4) — the depths of the earth are the chains of darkness, the Watchers reserved against the day of judgment.'),
  ('canon', '2-peter', 2, 4, 'jubilees', 'jubilees', 5, 10, 'extras', E'*And their fathers were witnesses (of their destruction), and after this they were bound in the depths of the earth for ever, until the day of the great condemnation when judgment is executed on all those who have corrupted their ways and their works before Yahuah (God).* (Jubilees 5:10). The Watchers are *bound in the depths of the earth for ever, until the day of the great condemnation* — Kepha''s (Peter''s) *reserved unto judgment* (2 Peter 2:4) said in the library''s own words. Bound now, judged then: the same two-stage sentence on the angels that sinned.'),
  ('canon', '2-peter', 2, 5, 'canon', 'genesis', 7, 23, 'free', E'*And every living substance was destroyed which was upon the face of the ground, both man, and cattle, and the creeping things, and the fowl of the heaven; and they were destroyed from the earth: and Noah only remained alive, and they that were with him in the ark.* (Genesis 7:23). The Flood Kepha (Peter) recalls — *spared not the old world, but saved Noah the eighth person... bringing in the flood upon the world of the ungodly* (2 Peter 2:5) — is Genesis 7''s deluge in which *Noah only remained alive,* he and the few with him in the ark. The old world perished; the preacher of righteousness and his house were saved through water.'),
  ('canon', '2-peter', 2, 5, 'canon', 'genesis', 6, 9, 'free', E'*These are the generations of Noah: Noah was a just man and perfect in his generations, and Noah walked with Elohim (God).* (Genesis 6:9). Noah, whom Kepha (Peter) calls *a preacher of righteousness* (2 Peter 2:5), is named in Torah *a just man and perfect in his generations,* who *walked with Elohim (God).* The eighth person saved from the Flood was the righteous man in an ungodly world — the pattern Kepha sets against the false teachers, that Yahuah (Lord) *knoweth how to deliver the godly out of temptations* (2 Peter 2:9).'),
  ('canon', '2-peter', 2, 6, 'canon', 'genesis', 19, 24, 'free', E'*Then Yahuah (LORD) rained upon Sodom and upon Gomorrah brimstone and fire from Yahuah (LORD) out of heaven;* (Genesis 19:24). The cities Kepha (Peter) names — *turning the cities of Sodom and Gomorrha into ashes condemned them with an overthrow, making them an ensample* (2 Peter 2:6) — are the cities Yahuah (LORD) burned with *brimstone and fire... out of heaven.* The ashes are the ensample; the overthrow of Sodom stands as the warning to *those that after should live ungodly.*'),
  ('canon', '2-peter', 2, 6, 'canon', 'genesis', 19, 25, 'free', E'*And he overthrew those cities, and all the plain, and all the inhabitants of the cities, and that which grew upon the ground.* (Genesis 19:25). Genesis names the overthrow Kepha (Peter) names: Yahuah (LORD) *overthrew those cities, and all the plain.* So the apostle: the cities of Sodom and Gomorrah *condemned... with an overthrow* (2 Peter 2:6). The total ruin of the plain is the ensample set before the ungodly of every age.'),
  ('canon', '2-peter', 2, 7, 'canon', 'genesis', 19, 16, 'free', E'*And while he lingered, the men laid hold upon his hand, and upon the hand of his wife, and upon the hand of his two daughters; Yahuah (LORD) being merciful unto him: and they brought him forth, and set him without the city.* (Genesis 19:16). When Kepha (Peter) says Elohim (God) *delivered just Lot, vexed with the filthy conversation of the wicked* (2 Peter 2:7), he points to this rescue: the angels *laid hold upon his hand,* *Yahuah (LORD) being merciful unto him,* and brought him out before the fire fell. The same God who reserves the unjust unto judgment *knoweth how to deliver the godly out of temptations* (2 Peter 2:9).'),
  ('canon', '2-peter', 2, 5, 'apocrypha', 'the-wisdom-of-solomon', 10, 4, 'extras', E'*For whose cause the earth being drowned with the flood, wisdom again preserved it, and directed the course of the righteous in a piece of wood of small value.* (Wisdom of Solomon 10:4). The Hebrew library tells the same Flood-deliverance Kepha (Peter) tells: the earth *drowned with the flood,* and the righteous (Noah) *directed... in a piece of wood* — the ark. So the apostle: Elohim (God) *spared not the old world, but saved Noah the eighth person* (2 Peter 2:5). The world of the ungodly perished; the righteous one was carried through.'),
  ('canon', '2-peter', 2, 7, 'apocrypha', 'the-wisdom-of-solomon', 10, 6, 'extras', E'*When the ungodly perished, she delivered the righteous man, who fled from the fire which fell down upon the five cities.* (Wisdom of Solomon 10:6). The library names the deliverance of Lot exactly as Kepha (Peter) does: *the righteous man, who fled from the fire which fell down upon the five cities.* So the apostle: Elohim (God) *delivered just Lot* (2 Peter 2:7) when he turned Sodom to ashes. The fire on the cities and the rescue of the one righteous man are the library''s standing testimony.'),
  ('canon', '2-peter', 2, 4, 'apocrypha', 'ecclesiasticus', 16, 7, 'extras', E'*He was not pacified toward the old giants, who fell away in the strength of their foolishness.* (Sirach 16:7). Ben Sira sets the same three judgments in the same order Kepha (Peter) does: *the old giants* (2 Peter 2:4, the angels that sinned and their offspring), then *the place where Lot sojourned* not spared (Sirach 16:8 / 2 Peter 2:6-7), then *the people of perdition* (Sirach 16:9). The giants who *fell away* are the fruit of the Watchers'' sin; the library catalogues this judgment-history just as the apostle does — it ain''t new.'),
  ('canon', '2-peter', 2, 5, 'apocrypha', 'ecclesiasticus', 44, 17, 'extras', E'*Noah was found perfect and righteous; in the time of wrath he was taken in exchange for the world; therefore was he left as a remnant to the earth, when the flood came.* (Sirach 44:17). The library names Noah *perfect and righteous,* *left as a remnant to the earth, when the flood came* — Kepha''s (Peter''s) *Noah the eighth person, a preacher of righteousness* (2 Peter 2:5). The one righteous remnant carried through the wrath is the pattern of the godly whom Yahuah (Lord) knows how to deliver.'),
  ('canon', '2-peter', 2, 4, 'canon', 'jude', 1, 6, 'free', E'*And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* (Jude 6). Jude is 2 Peter 2''s twin to the word: *the angels which kept not their first estate... reserved in everlasting chains under darkness unto the judgment* — Kepha''s (Peter''s) *angels that sinned... delivered into chains of darkness, to be reserved unto judgment* (2 Peter 2:4). Both apostles read the Watchers of Genesis 6 through the same library record; the chains of darkness are the everlasting chains of Jude.'),
  ('canon', '2-peter', 2, 6, 'canon', 'jude', 1, 7, 'free', E'*Even as Sodom and Gomorrha, and the cities about them in like manner, giving themselves over to fornication, and going after strange flesh, are set forth for an example, suffering the vengeance of eternal fire.* (Jude 7). Jude names Sodom as Kepha (Peter) does: *set forth for an example, suffering the vengeance of eternal fire* — the apostle''s *cities of Sodom and Gomorrha into ashes... making them an ensample* (2 Peter 2:6). The twin letters set the burned cities before the ungodly as the standing warning of the judgment to come.'),
  ('canon', '2-peter', 2, 5, 'canon', '1-peter', 3, 20, 'free', E'*Which sometime were disobedient, when once the longsuffering of Elohim (God) waited in the days of Noah, while the ark was a preparing, wherein few, that is, eight souls were saved by water.* (1 Peter 3:20). Kepha''s (Peter''s) first letter already joined the spirits in prison to the Flood: *eight souls were saved by water* in *the days of Noah.* Here the second letter sounds the same note — *saved Noah the eighth person* (2 Peter 2:5). The eighth soul, the few saved through water, the longsuffering of Elohim (God): the same Watchers-and-Flood frame runs through both epistles, a self-link to the live spirits-in-prison thread.'),
  ('canon', '2-peter', 2, 5, 'canon', 'matthew', 24, 37, 'free', E'*But as the days of Noe were, so shall also the coming of the Son of Adam be.* (Matthew 24:37). Yahusha (Jesus) made the days of Noah the type of his coming, *eating and drinking, marrying and giving in marriage, until the day that Noe entered into the ark* (Matthew 24:38). Kepha (Peter) recalls the same Flood — *saved Noah the eighth person... bringing in the flood upon the world of the ungodly* (2 Peter 2:5) — as the proof that judgment surely comes upon the ungodly. The days of Noah are the warning the Master himself gave.'),
  -- thread: 2-peter-2-angels-bring-not-a-railing-accusation-jude-9
  ('canon', '2-peter', 2, 11, 'canon', 'jude', 1, 9, 'free', E'*Yet Michael the archangel, when contending with the devil he disputed about the body of Moses, durst not bring against him a railing accusation, but said, Yahuah (Lord) rebuke thee.* (Jude 9). Kepha (Peter) writes that *angels, which are greater in power and might, bring not railing accusation against them before Yahuah (Lord)* (2 Peter 2:11); Jude gives the case in point — *Michael the archangel... durst not bring against him a railing accusation.* If the mightiest angel withholds the railing word and leaves the rebuke to Yahuah (Lord), how presumptuous are the false teachers who *are not afraid to speak evil of dignities* (2 Peter 2:10).'),
  -- thread: 2-peter-2-the-way-of-balaam-the-son-of-bosor-and-the-dumb-ass-numbers-22
  ('canon', '2-peter', 2, 16, 'canon', 'numbers', 22, 28, 'free', E'*And Yahuah (LORD) opened the mouth of the ass, and she said unto Balaam, What have I done unto thee, that thou hast smitten me these three times?* (Numbers 22:28). This is the very scene Kepha (Peter) recalls: *the dumb ass speaking with man''s voice forbad the madness of the prophet* (2 Peter 2:16). Yahuah (LORD) *opened the mouth of the ass,* and the beast rebuked the seer who could not see the angel his ass had seen. The dumb beast saw clearer than the prophet greedy for reward.'),
  ('canon', '2-peter', 2, 16, 'canon', 'numbers', 22, 31, 'free', E'*Then Yahuah (LORD) opened the eyes of Balaam, and he saw the angel of Yahuah (LORD) standing in the way, and his sword drawn in his hand: and he bowed down his head, and fell flat on his face.* (Numbers 22:31). Only after the ass spoke did Yahuah (LORD) *open the eyes of Balaam,* and he saw *the angel of Yahuah (LORD)... his sword drawn.* Kepha (Peter) calls it *the madness of the prophet* (2 Peter 2:16) — the blindness of the man who *loved the wages of unrighteousness* (2 Peter 2:15) until a dumb ass and a drawn sword brought him to his face.'),
  ('canon', '2-peter', 2, 15, 'canon', 'numbers', 31, 16, 'free', E'*Behold, these caused the children of Yashar''el (Israel), through the counsel of Balaam, to commit trespass against Yahuah (LORD) in the matter of Peor, and there was a plague among the congregation of Yahuah (LORD).* (Numbers 31:16). *The way of Balaam the son of Bosor, who loved the wages of unrighteousness* (2 Peter 2:15) is the way of *the counsel of Balaam* — the hireling prophet who, unable to curse, taught Moab to seduce Yashar''el (Israel) into trespass *in the matter of Peor.* The false teachers walk that same way, selling the people into sin for reward.'),
  ('canon', '2-peter', 2, 15, 'canon', 'deuteronomy', 23, 4, 'free', E'*Because they met you not with bread and with water in the way, when ye came forth out of Egypt; and because they hired against thee Balaam the son of Beor of Pethor of Mesopotamia, to curse thee.* (Deuteronomy 23:4). Torah remembers Balaam as the prophet *hired... to curse* Yashar''el (Israel) — the hireling Kepha (Peter) names, who *loved the wages of unrighteousness* (2 Peter 2:15). Yet *Yahuah Elohayka (the LORD thy God) would not hearken unto Balaam; but... turned the curse into a blessing* (Deuteronomy 23:5): the way of Balaam is the way of the prophet for hire, and it cannot prevail against the people Yahuah (LORD) loves.'),
  ('canon', '2-peter', 2, 15, 'canon', 'jude', 1, 11, 'free', E'*Woe unto them! for they have gone in the way of Cain, and ran greedily after the error of Balaam for reward, and perished in the gainsaying of Core.* (Jude 11). Jude names the way of Balaam as Kepha (Peter) does: they *ran greedily after the error of Balaam for reward* — the apostle''s *following the way of Balaam the son of Bosor, who loved the wages of unrighteousness* (2 Peter 2:15). The twin letters mark the false teachers by their love of reward, the very sin of the hireling prophet.'),
  -- thread: 2-peter-2-the-dog-is-turned-to-his-own-vomit-again-proverbs-26
  ('canon', '2-peter', 2, 22, 'canon', 'proverbs', 26, 11, 'free', E'*As a dog returneth to his vomit, so a fool returneth to his folly.* (Proverbs 26:11). Kepha (Peter) quotes the proverb by name: *it is happened unto them according to the true proverb, The dog is turned to his own vomit again* (2 Peter 2:22). The false teachers who *escaped the pollutions of the world* and are *again entangled therein* (2 Peter 2:20) are the fool of the proverb, returning to the very corruption they had left — the washed sow to her mire, the dog to his vomit.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s241_p241c2_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s241_p241c2_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-peter-2-false-teachers-who-deny-the-master-the-false-prophet-deuteronomy-13',
       E'False teachers who privily deny the Master — the false prophet (Deuteronomy 13, Jude 4)',
       E'Kepha (Peter) turns to the false teachers and roots the warning in Torah: *there were false prophets also among the people, even as there shall be false teachers among you, who privily shall bring in damnable heresies, even denying Yahuah (Lord) that bought them, and bring upon themselves swift destruction* (2 Peter 2:1). It ain''t new. Moses had already named the danger: *If there arise among you a prophet, or a dreamer of dreams, and giveth thee a sign or a wonder* (Deuteronomy 13:1) — and even if the wonder comes to pass, *that prophet... shall be put to death; because he hath spoken to turn you away from Yahuah Elohaychem (the LORD your God)... to thrust thee out of the way which Yahuah Elohayka (the LORD thy God) commanded thee to walk in* (Deuteronomy 13:5). The test was never the sign but the doctrine — whether he leads you to keep the way Yahuah (LORD) commanded or turns you from it. Jude describes the very same men: *certain men crept in unawares... ungodly men, turning the grace of our Elohim (God) into lasciviousness, and denying the only Yahuah Elohim (Lord God), and our Lord Yahusha HaMashiach (Lord Jesus Christ)* (Jude 4). The false teacher who denies the Master is the false prophet of Deuteronomy 13, and his end is swift destruction.',
       sv.verse_id, ev.verse_id, 'free', 9790
  FROM _s241_p241c2_lookup sv, _s241_p241c2_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=2 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='2-peter' AND ev.chapter_number=2 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-peter-2-the-angels-that-sinned-noah-and-sodom-the-watchers-genesis-6-enoch-jubilees',
       E'The angels that sinned in chains of darkness, Noah, and Sodom — the Watchers (Genesis 6, 1 Enoch, Jubilees, Jude)',
       E'To prove the certain judgment of the false teachers, Kepha (Peter) lays down three judgments the library records — and the first is the keystone of the whole "it ain''t new" apparatus: *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment; And spared not the old world, but saved Noah the eighth person, a preacher of righteousness, bringing in the flood upon the world of the ungodly; And turning the cities of Sodom and Gomorrha into ashes condemned them with an overthrow, making them an ensample... And delivered just Lot* (2 Peter 2:4-7). The *angels that sinned* are the Watchers — the *sons of Elohim (God)* who *came in unto the daughters of men, and they bare children to them... men of renown* (Genesis 6:4). Kepha is not coining a myth; he is reading Torah''s own account of the fall that brought the Flood, and the library tells exactly how those angels were bound. Yahuah (God) commanded, *Bind Azâzêl hand and foot, and cast him into the darkness* (1 Enoch 10:4), and of Semjâzâ, *bind them fast for seventy generations in the valleys of the earth, till the day of their judgement* (1 Enoch 10:12) — the very *chains of darkness, to be reserved unto judgment.* Enoch was shown the place itself: *this place is the prison of the angels, and here they will be imprisoned for ever* (1 Enoch 21:11). Jubilees agrees to the word: Elohim (God) *bade us to bind them in the depths of the earth, and behold they are bound* (Jubilees 5:6), *bound in the depths of the earth for ever, until the day of the great condemnation* (Jubilees 5:10). This is the same Watchers record already live in the apparatus from 1 Peter 3:19-20 and Jude 6 — *the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day* (Jude 6). Then the Flood: *Noah only remained alive, and they that were with him in the ark* (Genesis 7:23), *Noah was a just man and perfect in his generations* (Genesis 6:9) — *Noah the eighth person,* the few *saved by water* (1 Peter 3:20), the days of Noah the Master made the type of his coming (Matthew 24:37). Then Sodom: *Yahuah (LORD) rained upon Sodom and upon Gomorrah brimstone and fire... and he overthrew those cities* (Genesis 19:24-25), *set forth for an example, suffering the vengeance of eternal fire* (Jude 7); and just Lot delivered when *they brought him forth, and set him without the city* (Genesis 19:16). The Hebrew library catalogues every one of these: *the earth being drowned with the flood, wisdom again preserved it... in a piece of wood* (Wisdom 10:4), *she delivered the righteous man, who fled from the fire which fell down upon the five cities* (Wisdom 10:6), and in the same order Kepha keeps — *the old giants, who fell away* (Sirach 16:7), the place of Lot not spared (Sirach 16:8), Noah *left as a remnant to the earth, when the flood came* (Sirach 44:17). The lesson is one: *Yahuah (Lord) knoweth how to deliver the godly out of temptations, and to reserve the unjust unto the day of judgment to be punished* (2 Peter 2:9). The angels that sinned, the old world, the cities of the plain — the judgment-history the whole library records, and the false teachers stand in its line.',
       sv.verse_id, ev.verse_id, 'extras', 9793
  FROM _s241_p241c2_lookup sv, _s241_p241c2_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=2 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='2-peter' AND ev.chapter_number=2 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-peter-2-angels-bring-not-a-railing-accusation-jude-9',
       E'Angels greater in power bring not a railing accusation (Jude 9)',
       E'Kepha (Peter) marks the presumption of the false teachers, who *are not afraid to speak evil of dignities* (2 Peter 2:10), by contrast with the holy angels: *Whereas angels, which are greater in power and might, bring not railing accusation against them before Yahuah (Lord)* (2 Peter 2:11). Jude gives the very case in point: *Yet Michael the archangel, when contending with the devil he disputed about the body of Moses, durst not bring against him a railing accusation, but said, Yahuah (Lord) rebuke thee* (Jude 9). If the mightiest angel withholds the railing word and leaves the rebuke to Yahuah (Lord) himself, how reckless are the brute men who speak evil of the things they do not understand. The twin letters teach the same restraint — judgment belongs to Yahuah (Lord), not to the railing tongue.',
       sv.verse_id, ev.verse_id, 'free', 9796
  FROM _s241_p241c2_lookup sv, _s241_p241c2_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=2 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='2-peter' AND ev.chapter_number=2 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-peter-2-the-way-of-balaam-the-son-of-bosor-and-the-dumb-ass-numbers-22',
       E'The way of Balaam the son of Bosor and the dumb ass (Numbers 22, 31, Deuteronomy 23, Jude 11)',
       E'Kepha (Peter) names the false teachers by an old example: they *have forsaken the right way, and are gone astray, following the way of Balaam the son of Bosor, who loved the wages of unrighteousness; But was rebuked for his iniquity: the dumb ass speaking with man''s voice forbad the madness of the prophet* (2 Peter 2:15-16). The scene is Numbers 22: when the seer could not see the angel his beast had seen, *Yahuah (LORD) opened the mouth of the ass, and she said unto Balaam, What have I done unto thee, that thou hast smitten me these three times?* (Numbers 22:28); and only then *Yahuah (LORD) opened the eyes of Balaam, and he saw the angel of Yahuah (LORD) standing in the way, and his sword drawn in his hand* (Numbers 22:31). The dumb beast saw clearer than the prophet greedy for reward — *the madness of the prophet* forbidden by an ass. And the way of Balaam is not merely the curse-for-hire but the counsel that followed: *these caused the children of Yashar''el (Israel), through the counsel of Balaam, to commit trespass against Yahuah (LORD) in the matter of Peor* (Numbers 31:16) — the hireling who, unable to curse, taught Moab to seduce the people into sin. Torah remembers him as the prophet *hired... to curse* (Deuteronomy 23:4), yet *Yahuah Elohayka (the LORD thy God) would not hearken unto Balaam; but... turned the curse into a blessing* (Deuteronomy 23:5). Jude marks the same way: they *ran greedily after the error of Balaam for reward* (Jude 11). The way of Balaam is the way of the prophet for hire — and it ends, as Balaam ended, under the drawn sword.',
       sv.verse_id, ev.verse_id, 'free', 9799
  FROM _s241_p241c2_lookup sv, _s241_p241c2_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=2 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='2-peter' AND ev.chapter_number=2 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-peter-2-the-dog-is-turned-to-his-own-vomit-again-proverbs-26',
       E'The dog is turned to his own vomit again (Proverbs 26)',
       E'Kepha (Peter) closes the chapter with a proverb named outright. The false teachers who *escaped the pollutions of the world through the knowledge of Yahuah (Lord) and Saviour Yahusha HaMashiach (Jesus Christ)* and are *again entangled therein, and overcome* (2 Peter 2:20) have proved the wisdom of the fathers: *it is happened unto them according to the true proverb, The dog is turned to his own vomit again; and the sow that was washed to her wallowing in the mire* (2 Peter 2:22). The proverb is Solomon''s: *As a dog returneth to his vomit, so a fool returneth to his folly* (Proverbs 26:11). The one who turns *from the holy commandment delivered unto them* (2 Peter 2:21) — the Torah-rooted way of righteousness — returns to the very corruption he had left, the washed sow to her mire, the dog to his vomit. Better never to have known the way than, knowing it, to turn back.',
       sv.verse_id, ev.verse_id, 'free', 9802
  FROM _s241_p241c2_lookup sv, _s241_p241c2_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=2 AND sv.verse_number=22
   AND ev.edition_slug='canon' AND ev.book_slug='2-peter' AND ev.chapter_number=2 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-peter-2-false-teachers-who-deny-the-master-the-false-prophet-deuteronomy-13
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 13:5 — *that prophet... shall be put to death; because he hath spoken to turn you away from Yahuah Elohaychem (the LORD your God)* the false prophet who thrusts you from the way; *false teachers among you... denying Yahuah (Lord) that bought them* (2 Peter 2:1).'
  FROM cross_reference_threads t, cross_references x, _s241_p241c2_lookup sv, _s241_p241c2_lookup tv
 WHERE t.slug='2-peter-2-false-teachers-who-deny-the-master-the-false-prophet-deuteronomy-13'
   AND sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=2 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=13 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 13:1 — *If there arise among you a prophet, or a dreamer of dreams, and giveth thee a sign or a wonder* the danger named in Torah; *there shall be false teachers among you* (2 Peter 2:1).'
  FROM cross_reference_threads t, cross_references x, _s241_p241c2_lookup sv, _s241_p241c2_lookup tv
 WHERE t.slug='2-peter-2-false-teachers-who-deny-the-master-the-false-prophet-deuteronomy-13'
   AND sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=2 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=13 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jude 4 — *certain men crept in unawares... denying the only Yahuah Elohim (Lord God), and our Lord Yahusha HaMashiach (Lord Jesus Christ)* the twin letter''s deniers of the Master; *privily shall bring in damnable heresies, even denying Yahuah (Lord) that bought them* (2 Peter 2:1).'
  FROM cross_reference_threads t, cross_references x, _s241_p241c2_lookup sv, _s241_p241c2_lookup tv
 WHERE t.slug='2-peter-2-false-teachers-who-deny-the-master-the-false-prophet-deuteronomy-13'
   AND sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=2 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-peter-2-the-angels-that-sinned-noah-and-sodom-the-watchers-genesis-6-enoch-jubilees
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:4 — *the sons of Elohim (God) came in unto the daughters of men, and they bare children to them... men of renown* the Watchers of Torah; *the angels that sinned... delivered into chains of darkness* (2 Peter 2:4).'
  FROM cross_reference_threads t, cross_references x, _s241_p241c2_lookup sv, _s241_p241c2_lookup tv
 WHERE t.slug='2-peter-2-the-angels-that-sinned-noah-and-sodom-the-watchers-genesis-6-enoch-jubilees'
   AND sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 10:4 — *Bind Azâzêl hand and foot, and cast him into the darkness* the binding of the Watchers; *cast them down to hell, and delivered them into chains of darkness* (2 Peter 2:4). Self-link to the live 1 Enoch Watchers record.'
  FROM cross_reference_threads t, cross_references x, _s241_p241c2_lookup sv, _s241_p241c2_lookup tv
 WHERE t.slug='2-peter-2-the-angels-that-sinned-noah-and-sodom-the-watchers-genesis-6-enoch-jubilees'
   AND sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 10:12 — *bind them fast for seventy generations in the valleys of the earth, till the day of their judgement* Semjâzâ bound; *to be reserved unto judgment* (2 Peter 2:4).'
  FROM cross_reference_threads t, cross_references x, _s241_p241c2_lookup sv, _s241_p241c2_lookup tv
 WHERE t.slug='2-peter-2-the-angels-that-sinned-noah-and-sodom-the-watchers-genesis-6-enoch-jubilees'
   AND sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 21:10-11 — *this place is the prison of the angels, and here they will be imprisoned for ever* the prison Enoch was shown; *cast them down to hell* (2 Peter 2:4). Self-link to the live 1 Enoch Watchers record.'
  FROM cross_reference_threads t, cross_references x, _s241_p241c2_lookup sv, _s241_p241c2_lookup tv
 WHERE t.slug='2-peter-2-the-angels-that-sinned-noah-and-sodom-the-watchers-genesis-6-enoch-jubilees'
   AND sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=21 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 5:6 — *He bade us to bind them in the depths of the earth, and behold they are bound* the Watchers bound; *delivered them into chains of darkness* (2 Peter 2:4). Self-link to the live Jubilees Watchers record.'
  FROM cross_reference_threads t, cross_references x, _s241_p241c2_lookup sv, _s241_p241c2_lookup tv
 WHERE t.slug='2-peter-2-the-angels-that-sinned-noah-and-sodom-the-watchers-genesis-6-enoch-jubilees'
   AND sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Jubilees 5:10 — *bound in the depths of the earth for ever, until the day of the great condemnation* the two-stage sentence; *to be reserved unto judgment* (2 Peter 2:4).'
  FROM cross_reference_threads t, cross_references x, _s241_p241c2_lookup sv, _s241_p241c2_lookup tv
 WHERE t.slug='2-peter-2-the-angels-that-sinned-noah-and-sodom-the-watchers-genesis-6-enoch-jubilees'
   AND sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Sirach 16:7 — *He was not pacified toward the old giants, who fell away in the strength of their foolishness* the giants, fruit of the Watchers'' sin, in the same judgment-sequence; *the angels that sinned* (2 Peter 2:4).'
  FROM cross_reference_threads t, cross_references x, _s241_p241c2_lookup sv, _s241_p241c2_lookup tv
 WHERE t.slug='2-peter-2-the-angels-that-sinned-noah-and-sodom-the-watchers-genesis-6-enoch-jubilees'
   AND sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=16 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'Jude 6 — *the angels which kept not their first estate... reserved in everlasting chains under darkness unto the judgment of the great day* the twin letter''s Watchers; *delivered them into chains of darkness, to be reserved unto judgment* (2 Peter 2:4).'
  FROM cross_reference_threads t, cross_references x, _s241_p241c2_lookup sv, _s241_p241c2_lookup tv
 WHERE t.slug='2-peter-2-the-angels-that-sinned-noah-and-sodom-the-watchers-genesis-6-enoch-jubilees'
   AND sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 9, E'Genesis 7:23 — *Noah only remained alive, and they that were with him in the ark* the Flood; *saved Noah the eighth person... bringing in the flood upon the world of the ungodly* (2 Peter 2:5).'
  FROM cross_reference_threads t, cross_references x, _s241_p241c2_lookup sv, _s241_p241c2_lookup tv
 WHERE t.slug='2-peter-2-the-angels-that-sinned-noah-and-sodom-the-watchers-genesis-6-enoch-jubilees'
   AND sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=2 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=7 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 10, E'Genesis 6:9 — *Noah was a just man and perfect in his generations, and Noah walked with Elohim (God)* the preacher of righteousness; *Noah... a preacher of righteousness* (2 Peter 2:5).'
  FROM cross_reference_threads t, cross_references x, _s241_p241c2_lookup sv, _s241_p241c2_lookup tv
 WHERE t.slug='2-peter-2-the-angels-that-sinned-noah-and-sodom-the-watchers-genesis-6-enoch-jubilees'
   AND sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=2 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 11, E'Wisdom 10:4 — *the earth being drowned with the flood, wisdom again preserved it... in a piece of wood of small value* Noah and the ark; *saved Noah the eighth person* (2 Peter 2:5).'
  FROM cross_reference_threads t, cross_references x, _s241_p241c2_lookup sv, _s241_p241c2_lookup tv
 WHERE t.slug='2-peter-2-the-angels-that-sinned-noah-and-sodom-the-watchers-genesis-6-enoch-jubilees'
   AND sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=2 AND sv.verse_number=5
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=10 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 12, E'Sirach 44:17 — *Noah was found perfect and righteous... left as a remnant to the earth, when the flood came* the righteous remnant; *Noah... a preacher of righteousness* (2 Peter 2:5).'
  FROM cross_reference_threads t, cross_references x, _s241_p241c2_lookup sv, _s241_p241c2_lookup tv
 WHERE t.slug='2-peter-2-the-angels-that-sinned-noah-and-sodom-the-watchers-genesis-6-enoch-jubilees'
   AND sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=2 AND sv.verse_number=5
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=44 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 13, E'1 Peter 3:20 — *the longsuffering of Elohim (God) waited in the days of Noah... eight souls were saved by water* the self-link to the spirits-in-prison thread; *saved Noah the eighth person* (2 Peter 2:5).'
  FROM cross_reference_threads t, cross_references x, _s241_p241c2_lookup sv, _s241_p241c2_lookup tv
 WHERE t.slug='2-peter-2-the-angels-that-sinned-noah-and-sodom-the-watchers-genesis-6-enoch-jubilees'
   AND sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=2 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=3 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 14, E'Matthew 24:37 — *as the days of Noe were, so shall also the coming of the Son of Adam be* the Master''s own Noah-type; *saved Noah the eighth person... the flood upon the world of the ungodly* (2 Peter 2:5).'
  FROM cross_reference_threads t, cross_references x, _s241_p241c2_lookup sv, _s241_p241c2_lookup tv
 WHERE t.slug='2-peter-2-the-angels-that-sinned-noah-and-sodom-the-watchers-genesis-6-enoch-jubilees'
   AND sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=2 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 15, E'Genesis 19:24 — *Yahuah (LORD) rained upon Sodom and upon Gomorrah brimstone and fire... out of heaven* the burning of the cities; *turning the cities of Sodom and Gomorrha into ashes* (2 Peter 2:6).'
  FROM cross_reference_threads t, cross_references x, _s241_p241c2_lookup sv, _s241_p241c2_lookup tv
 WHERE t.slug='2-peter-2-the-angels-that-sinned-noah-and-sodom-the-watchers-genesis-6-enoch-jubilees'
   AND sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=2 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=19 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 16, E'Genesis 19:25 — *he overthrew those cities, and all the plain, and all the inhabitants of the cities* the overthrow; *condemned them with an overthrow, making them an ensample* (2 Peter 2:6).'
  FROM cross_reference_threads t, cross_references x, _s241_p241c2_lookup sv, _s241_p241c2_lookup tv
 WHERE t.slug='2-peter-2-the-angels-that-sinned-noah-and-sodom-the-watchers-genesis-6-enoch-jubilees'
   AND sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=2 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=19 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 17, E'Jude 7 — *Sodom and Gomorrha... are set forth for an example, suffering the vengeance of eternal fire* the twin letter''s Sodom; *making them an ensample unto those that after should live ungodly* (2 Peter 2:6).'
  FROM cross_reference_threads t, cross_references x, _s241_p241c2_lookup sv, _s241_p241c2_lookup tv
 WHERE t.slug='2-peter-2-the-angels-that-sinned-noah-and-sodom-the-watchers-genesis-6-enoch-jubilees'
   AND sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=2 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 18, E'Genesis 19:16 — *the men laid hold upon his hand... Yahuah (LORD) being merciful unto him: and they brought him forth* Lot delivered; *And delivered just Lot, vexed with the filthy conversation of the wicked* (2 Peter 2:7).'
  FROM cross_reference_threads t, cross_references x, _s241_p241c2_lookup sv, _s241_p241c2_lookup tv
 WHERE t.slug='2-peter-2-the-angels-that-sinned-noah-and-sodom-the-watchers-genesis-6-enoch-jubilees'
   AND sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=2 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=19 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 19, E'Wisdom 10:6 — *she delivered the righteous man, who fled from the fire which fell down upon the five cities* Lot delivered; *And delivered just Lot* (2 Peter 2:7).'
  FROM cross_reference_threads t, cross_references x, _s241_p241c2_lookup sv, _s241_p241c2_lookup tv
 WHERE t.slug='2-peter-2-the-angels-that-sinned-noah-and-sodom-the-watchers-genesis-6-enoch-jubilees'
   AND sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=2 AND sv.verse_number=7
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=10 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-peter-2-angels-bring-not-a-railing-accusation-jude-9
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jude 9 — *Michael the archangel... durst not bring against him a railing accusation, but said, Yahuah (Lord) rebuke thee* the case in point; *angels, which are greater in power and might, bring not railing accusation* (2 Peter 2:11).'
  FROM cross_reference_threads t, cross_references x, _s241_p241c2_lookup sv, _s241_p241c2_lookup tv
 WHERE t.slug='2-peter-2-angels-bring-not-a-railing-accusation-jude-9'
   AND sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=2 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-peter-2-the-way-of-balaam-the-son-of-bosor-and-the-dumb-ass-numbers-22
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 22:28 — *Yahuah (LORD) opened the mouth of the ass, and she said unto Balaam, What have I done unto thee* the dumb ass speaking; *the dumb ass speaking with man''s voice forbad the madness of the prophet* (2 Peter 2:16).'
  FROM cross_reference_threads t, cross_references x, _s241_p241c2_lookup sv, _s241_p241c2_lookup tv
 WHERE t.slug='2-peter-2-the-way-of-balaam-the-son-of-bosor-and-the-dumb-ass-numbers-22'
   AND sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=2 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=22 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 22:31 — *Yahuah (LORD) opened the eyes of Balaam, and he saw the angel of Yahuah (LORD)... his sword drawn* the seer''s blindness; *the madness of the prophet* (2 Peter 2:16).'
  FROM cross_reference_threads t, cross_references x, _s241_p241c2_lookup sv, _s241_p241c2_lookup tv
 WHERE t.slug='2-peter-2-the-way-of-balaam-the-son-of-bosor-and-the-dumb-ass-numbers-22'
   AND sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=2 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=22 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Numbers 31:16 — *these caused the children of Yashar''el (Israel), through the counsel of Balaam, to commit trespass against Yahuah (LORD) in the matter of Peor* the counsel of the hireling; *following the way of Balaam the son of Bosor, who loved the wages of unrighteousness* (2 Peter 2:15).'
  FROM cross_reference_threads t, cross_references x, _s241_p241c2_lookup sv, _s241_p241c2_lookup tv
 WHERE t.slug='2-peter-2-the-way-of-balaam-the-son-of-bosor-and-the-dumb-ass-numbers-22'
   AND sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=2 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=31 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Deuteronomy 23:4 — *they hired against thee Balaam the son of Beor of Pethor of Mesopotamia, to curse thee* the prophet for hire; *who loved the wages of unrighteousness* (2 Peter 2:15).'
  FROM cross_reference_threads t, cross_references x, _s241_p241c2_lookup sv, _s241_p241c2_lookup tv
 WHERE t.slug='2-peter-2-the-way-of-balaam-the-son-of-bosor-and-the-dumb-ass-numbers-22'
   AND sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=2 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=23 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jude 11 — *ran greedily after the error of Balaam for reward* the twin letter''s way of Balaam; *following the way of Balaam the son of Bosor* (2 Peter 2:15).'
  FROM cross_reference_threads t, cross_references x, _s241_p241c2_lookup sv, _s241_p241c2_lookup tv
 WHERE t.slug='2-peter-2-the-way-of-balaam-the-son-of-bosor-and-the-dumb-ass-numbers-22'
   AND sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=2 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-peter-2-the-dog-is-turned-to-his-own-vomit-again-proverbs-26
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 26:11 — *As a dog returneth to his vomit, so a fool returneth to his folly* the proverb named outright; *The dog is turned to his own vomit again* (2 Peter 2:22).'
  FROM cross_reference_threads t, cross_references x, _s241_p241c2_lookup sv, _s241_p241c2_lookup tv
 WHERE t.slug='2-peter-2-the-dog-is-turned-to-his-own-vomit-again-proverbs-26'
   AND sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=2 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=26 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2peter_03.sql (S241 2 Peter 3) -----
-- =====================================================================
-- S241 minion — 2 PETER 3 (Kepha Bet) FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 2 PETER 3 (18 verses) — THE SURE PROPHETIC WORD AGAINST THE SCOFFERS,
-- the day of Yahuah, and the new heavens and a new earth.
-- Tag: p241c3 (temp view _s241_p241c3_lookup).
-- Sort band: floor 9820, step 3 (9820, 9823, 9826, 9829, 9832, 9835 used; under 9850).
-- Source is ALWAYS the canon 2 Peter verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (2 Peter 3 = the dying apostle stirring up the elect to remember *the words which
-- were spoken before by the holy prophets* (3:2) — the Tanakh — against the scoffers of the last days
-- who deny the promise of his coming. The judgment-history of the library is the answer: the heavens
-- were made *by the word of Elohim* (Genesis 1, Psalm 33:6), the old world *perished* in the Flood
-- (Genesis 7), and the same word keeps the present heavens *reserved unto fire.* *One day is with
-- Yahuah (Lord) as a thousand years* (Psalm 90:4) — his longsuffering is salvation, not slackness. The
-- *day of Yahuah* comes *as a thief,* the day of the prophets (Isaiah 13, Joel 2, Malachi 4) — and
-- beyond it *new heavens and a new earth, wherein dwelleth righteousness* (Isaiah 65:17, 66:22). NO
-- replacement theology, no two-covenant split: the sure prophetic word, the day of Yahuah, and the
-- new heavens and earth all belong to the one covenant story. Christology: *our Lord and Saviour
-- Yahusha HaMashiach* (3:18) — preserve the pull's rendering of Lord at each place; 3:8,10 the day of
-- *Yahuah (Lord)* echoes the Tanakh YHWH-text and is rendered Yahuah; 3:15,18 *our Lord* is Yahusha
-- titular and rendered Lord. Preserve exactly what the pull gives in each place.)
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-2   stir up your pure minds; the words spoken before by the holy prophets
--           Tanakh: none warranted (the more-sure-word weight carried in ch1's 1:19-21 thread; v.2
--                   is the apostolic charge to remember, not a quotation)
--           Extras: none warranted   NT: none warranted
--   v.3-4   scoffers in the last days, Where is the promise of his coming?
--           Tanakh: Isaiah 5:19 (let him make speed... that we may see it), Malachi 2:17 (Where is
--                   the Elohim of judgment?), Ezekiel 12:22 (the days are prolonged, every vision faileth)
--           Extras: none warranted   NT: none warranted
--   v.5     by the word of Elohim the heavens were of old, the earth out of the water
--           Tanakh: Genesis 1:6 (a firmament in the midst of the waters), Genesis 1:9 (the waters
--                   gathered, the dry land appear), Psalm 33:6 (by the word of Yahuah were the heavens made)
--           Extras: none warranted   NT: none warranted
--   v.6     the world that then was, overflowed with water, perished
--           Tanakh: Genesis 7:11 (the fountains of the great deep, the windows of heaven), Genesis
--                   7:23 (every living substance destroyed; Noah only remained)
--           Extras: Jubilees 5:23 (the flood-gates of heaven, the fountains of the great deep) SELF-LINK;
--                   Wisdom of Solomon 14:6 (the proud giants perished; the hope escaped in a weak vessel)
--           NT: none warranted (the days-of-Noah carried at the Flood root)
--   v.7     the heavens and the earth now, reserved unto fire against the day of judgment
--           Tanakh: carried in the day-of-Yahuah thread (Malachi 4:1 the day that burns as an oven)
--           Extras: none warranted   NT: none warranted
--   v.8     one day is with Yahuah as a thousand years, and a thousand years as one day
--           Tanakh: Psalm 90:4 (a thousand years in thy sight are but as yesterday)
--           Extras: none warranted   NT: none warranted
--   v.9     longsuffering, not willing that any should perish
--           Tanakh: none warranted (carried in prose of the thousand-years thread)
--           Extras: none warranted   NT: none warranted
--   v.10,12 the day of Yahuah as a thief; the elements melt with fervent heat
--           Tanakh: Isaiah 13:6 (the day of Yahuah is at hand), Isaiah 13:9 (the day of Yahuah cometh
--                   cruel with wrath), Isaiah 13:13 (I will shake the heavens), Joel 2:1 (the day of
--                   Yahuah cometh, for it is nigh), Malachi 4:1 (the day that shall burn as an oven)
--           Extras: none warranted   NT: 1 Thessalonians 5:2 (the day of Yahuah so cometh as a thief)
--   v.13    new heavens and a new earth, wherein dwelleth righteousness
--           Tanakh: Isaiah 65:17 (I create new heavens and a new earth), Isaiah 66:22 (the new heavens
--                   and the new earth which I will make shall remain)
--           Extras: none warranted   NT: Revelation 21:1 (a new heaven and a new earth)
--   v.14-18 be found in peace; the longsuffering is salvation; Paul's epistles; grow in grace
--           Tanakh: none warranted (the exhortation gathers up the threads already woven)
--           Extras: none warranted   NT: none warranted
--
-- THREADS (slug -> target libraries):
--   9820 2-peter-3-scoffers-in-the-last-days-where-is-the-promise-of-his-coming-isaiah-5-malachi-2   (Tanakh)
--   9823 2-peter-3-by-the-word-of-elohim-the-heavens-were-of-old-genesis-1-psalm-33                 (Tanakh)
--   9826 2-peter-3-the-world-that-then-was-overflowed-with-water-perished-genesis-7-jubilees-5      (Tanakh + Extras)  [FLOOD SELF-LINK]
--   9829 2-peter-3-one-day-is-with-yahuah-as-a-thousand-years-psalm-90                              (Tanakh)
--   9832 2-peter-3-the-day-of-yahuah-as-a-thief-the-elements-melt-with-fervent-heat-isaiah-13-joel-2-malachi-4  (Tanakh + NT)
--   9835 2-peter-3-new-heavens-and-a-new-earth-wherein-dwelleth-righteousness-isaiah-65-66          (Tanakh + NT)  [BLESSING]
-- =====================================================================

CREATE TEMP VIEW _s241_p241c3_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-peter-3-scoffers-in-the-last-days-where-is-the-promise-of-his-coming-isaiah-5-malachi-2
  ('canon', '2-peter', 3, 4, 'canon', 'isaiah', 5, 19, 'free', E'*That say, Let him make speed, and hasten his work, that we may see it: and let the counsel of the Holy One of Yashar''el (Israel) draw nigh and come, that we may know it!* (Isaiah 5:19). Isaiah''s scoffers mock the delay of Yahuah''s (LORD) work — *let him make speed... that we may see it* — daring the judgment to come if it is real. Peter''s scoffers do the same in the last days: *Where is the promise of his coming? for since the fathers fell asleep, all things continue as they were from the beginning of the creation* (2 Peter 3:4). It is the ancient taunt against the sure prophetic word — the demand to see before they will believe — and it is no new thing.'),
  ('canon', '2-peter', 3, 4, 'canon', 'malachi', 2, 17, 'free', E'*Ye have wearied Yahuah (LORD) with your words. Yet ye say, Wherein have we wearied him? When ye say, Every one that doeth evil is good in the sight of Yahuah (LORD), and he delighteth in them; or, Where is the Elohim (God) of judgment?* (Malachi 2:17). Malachi names the very mockery: *Where is the Elohim (God) of judgment?* — the doubt that Yahuah (LORD) will ever come to set things right. Peter''s last-days scoffers ask the same: *Where is the promise of his coming?* (2 Peter 3:4). The wearying word against the day of judgment is the same word, ancient and answered: the day comes, and the prophet says so.'),
  ('canon', '2-peter', 3, 4, 'canon', 'ezekiel', 12, 22, 'free', E'*Son of Adam, what is that proverb that ye have in the land of Yashar''el (Israel), saying, The days are prolonged, and every vision faileth?* (Ezekiel 12:22). The proverb of the mockers in Ezekiel''s day is exactly the scoffers'' creed: *the days are prolonged, and every vision faileth* — the delay is taken as proof the word is empty. Peter''s scoffers say *all things continue as they were from the beginning of the creation* (2 Peter 3:4). But Yahuah (LORD) answers Ezekiel, *The days are at hand, and the effect of every vision* (Ezekiel 12:23): the prolonging is not failure but longsuffering, and the vision does not fail.'),
  -- thread: 2-peter-3-by-the-word-of-elohim-the-heavens-were-of-old-genesis-1-psalm-33
  ('canon', '2-peter', 3, 5, 'canon', 'genesis', 1, 6, 'free', E'*And Elohim (God) said, Let there be a firmament in the midst of the waters, and let it divide the waters from the waters.* (Genesis 1:6). At creation Elohim (God) spoke and divided the waters by the firmament — the earth set *standing out of the water and in the water.* This is what the scoffers *willingly are ignorant of, that by the word of Elohim (God) the heavens were of old, and the earth standing out of the water and in the water* (2 Peter 3:5). The spoken word that ordered the waters is the same word that now keeps the heavens reserved; the scoffers'' *all things continue* forgets the word that made them.'),
  ('canon', '2-peter', 3, 5, 'canon', 'genesis', 1, 9, 'free', E'*And Elohim (God) said, Let the waters under the heaven be gathered together unto one place, and let the dry land appear: and it was so.* (Genesis 1:9). The dry land appeared at Elohim''s (God) word, gathered out from the waters — *the earth standing out of the water and in the water* (2 Peter 3:5). Peter points back to this ordering of the waters by the spoken word to silence the scoffers: the world did not always continue as it is; it was framed by the word, and *the same word* keeps it now (2 Peter 3:7).'),
  ('canon', '2-peter', 3, 5, 'canon', 'psalms', 33, 6, 'free', E'*By the word of Yahuah (LORD) were the heavens made; and all the host of them by the breath of his mouth.* (Psalm 33:6). The Psalm states it plainly: *by the word of Yahuah (LORD) were the heavens made.* This is the exact ground of Peter''s rebuke of the scoffers: *by the word of Elohim (God) the heavens were of old* (2 Peter 3:5). The heavens are not self-existing nor everlasting in themselves; they stand by the spoken word — and what the word framed, the word can dissolve and remake.'),
  -- thread: 2-peter-3-the-world-that-then-was-overflowed-with-water-perished-genesis-7-jubilees-5  [FLOOD SELF-LINK]
  ('canon', '2-peter', 3, 6, 'canon', 'genesis', 7, 11, 'free', E'*In the six hundredth year of Noah''s life, in the second month, the seventeenth day of the month, the same day were all the fountains of the great deep broken up, and the windows of heaven were opened.* (Genesis 7:11). The Flood came when *the fountains of the great deep* burst and *the windows of heaven were opened* — the waters that creation had divided returning to overflow the world. This is the judgment Peter names: *the world that then was, being overflowed with water, perished* (2 Peter 3:6). The same world framed out of the water in Genesis 1 was unmade by water at the word of Elohim (God); the precedent answers the scoffers'' *all things continue.*'),
  ('canon', '2-peter', 3, 6, 'canon', 'genesis', 7, 23, 'free', E'*And every living substance was destroyed which was upon the face of the ground, both man, and cattle, and the creeping things, and the fowl of the heaven; and they were destroyed from the earth: and Noah only remained alive, and they that were with him in the ark.* (Genesis 7:23). The old world *perished* utterly — *every living substance was destroyed* — and *Noah only remained.* Peter holds it up as the proof that the word does judge: *the world that then was, being overflowed with water, perished* (2 Peter 3:6), even as the present heavens are *reserved unto fire against the day of judgment* (2 Peter 3:7). The Flood is the down-payment of the day to come.'),
  ('canon', '2-peter', 3, 6, 'jubilees', 'jubilees', 5, 23, 'extras', E'*And Yahuah (God) opened seven flood-gates of heaven, And the mouths of the fountains of the great deep, seven mouths in number. And the flood-gates began to pour down water from the heaven forty days and forty nights, And the fountains of the deep also sent up waters, until the whole world was full of water.* (Jubilees 5:23). The restored library tells the same Flood with the same imagery as Genesis 7 — *the flood-gates of heaven* and *the fountains of the great deep* — *until the whole world was full of water.* It is the very world Peter says *being overflowed with water, perished* (2 Peter 3:6). The library records the judgment the scoffers deny; it ain''t new.'),
  ('canon', '2-peter', 3, 6, 'apocrypha', 'the-wisdom-of-solomon', 14, 6, 'extras', E'*For in the old time also, when the proud giants perished, the hope of the world governed by your hand escaped in a weak vessel, and left to all ages a seed of generation.* (Wisdom of Solomon 14:6). The wisdom of the library remembers the Flood as the perishing of *the proud giants,* while *the hope of the world... escaped in a weak vessel* — Noah in the ark. Peter says the same world *perished* in the overflowing waters (2 Peter 3:6). The proud who scoff are swept away; the remnant kept by the hand of Elohim (God) is carried through, the *seed of generation* preserved.'),
  -- thread: 2-peter-3-one-day-is-with-yahuah-as-a-thousand-years-psalm-90
  ('canon', '2-peter', 3, 8, 'canon', 'psalms', 90, 4, 'free', E'*For a thousand years in thy sight are but as yesterday when it is past, and as a watch in the night.* (Psalm 90:4). Moses'' psalm measures time by Yahuah''s (LORD) own reckoning: *a thousand years in thy sight are but as yesterday.* Peter takes it up word for word to answer the charge of slackness: *be not ignorant of this one thing, that one day is with Yahuah (Lord) as a thousand years, and a thousand years as one day* (2 Peter 3:8). What looks to the scoffer like delay is no delay to the Everlasting; the apparent prolonging is longsuffering — *not willing that any should perish, but that all should come to repentance* (2 Peter 3:9).'),
  -- thread: 2-peter-3-the-day-of-yahuah-as-a-thief-the-elements-melt-with-fervent-heat-isaiah-13-joel-2-malachi-4
  ('canon', '2-peter', 3, 10, 'canon', 'isaiah', 13, 6, 'free', E'*Howl ye; for the day of Yahuah (LORD) is at hand; it shall come as a destruction from the Almighty.* (Isaiah 13:6). Isaiah proclaims *the day of Yahuah (LORD)* — the very name Peter uses: *the day of Yahuah (Lord) will come as a thief in the night* (2 Peter 3:10). It is not a new doctrine but the prophets'' own day of reckoning, *at hand,* coming *as a destruction from the Almighty.* The sure prophetic word the scoffers mock is the word that names this day.'),
  ('canon', '2-peter', 3, 10, 'canon', 'isaiah', 13, 9, 'free', E'*Behold, the day of Yahuah (LORD) cometh, cruel both with wrath and fierce anger, to lay the land desolate: and he shall destroy the sinners thereof out of it.* (Isaiah 13:9). The day of Yahuah (LORD) *cometh* to judge the wicked — the same day Peter says comes *as a thief in the night... and the elements shall melt with fervent heat, the earth also and the works that are therein shall be burned up* (2 Peter 3:10). What Isaiah declares against the proud, Peter declares against the ungodly reserved unto fire; it is one day, one Judge, one word.'),
  ('canon', '2-peter', 3, 10, 'canon', 'isaiah', 13, 13, 'free', E'*Therefore I will shake the heavens, and the earth shall remove out of her place, in the wrath of Yahuah Tseva''ot (LORD of hosts), and in the day of his fierce anger.* (Isaiah 13:13). Isaiah says in that day *I will shake the heavens, and the earth shall remove out of her place.* Peter says *the heavens shall pass away with a great noise, and the elements shall melt with fervent heat* (2 Peter 3:10). The shaking of the heavens and the removing of the earth is the prophets'' word for the day of Yahuah (LORD); Peter does not invent the cosmic undoing, he hands on what was *spoken before by the holy prophets* (2 Peter 3:2).'),
  ('canon', '2-peter', 3, 10, 'canon', 'joel', 2, 1, 'free', E'*Blow ye the trumpet in Zion, and sound an alarm in my holy mountain: let all the inhabitants of the land tremble: for the day of Yahuah (LORD) cometh, for it is nigh at hand;* (Joel 2:1). Joel sounds the alarm: *the day of Yahuah (LORD) cometh, for it is nigh at hand* — *a day of darkness and of gloominess* (Joel 2:2). It is the same day Peter names, coming *as a thief in the night* (2 Peter 3:10). The trumpet of Zion and the thief in the night both warn of the one day of Yahuah (LORD); the scoffer who says *all things continue* sleeps through the alarm.'),
  ('canon', '2-peter', 3, 12, 'canon', 'malachi', 4, 1, 'free', E'*For, behold, the day cometh, that shall burn as an oven; and all the proud, yea, and all that do wickedly, shall be stubble: and the day that cometh shall burn them up, saith Yahuah Tseva''ot (LORD of hosts), that it shall leave them neither root nor branch.* (Malachi 4:1). Malachi names the fire of that day: *the day cometh, that shall burn as an oven... shall burn them up.* This is Peter''s *day of judgment and perdition of ungodly men* (2 Peter 3:7), the day *wherein the heavens being on fire shall be dissolved, and the elements shall melt with fervent heat* (2 Peter 3:12). The burning oven of Malachi is the fervent heat of Peter; the proud who scoff are the stubble.'),
  ('canon', '2-peter', 3, 10, 'canon', '1-thessalonians', 5, 2, 'free', E'*For yourselves know perfectly that the day of Yahuah (Lord) so cometh as a thief in the night.* (1 Thessalonians 5:2). Paul had already taught it in the very words Peter now uses: *the day of Yahuah (Lord) so cometh as a thief in the night* (2 Peter 3:10). The two apostles speak with one voice — and Peter goes on to call Paul *our beloved brother* whose epistles speak *of these things* (2 Peter 3:15-16). The thief-in-the-night day of Yahuah (LORD) is the shared apostolic charge, rooted in the prophets, against the scoffers'' false peace.'),
  -- thread: 2-peter-3-new-heavens-and-a-new-earth-wherein-dwelleth-righteousness-isaiah-65-66  [BLESSING]
  ('canon', '2-peter', 3, 13, 'canon', 'isaiah', 65, 17, 'free', E'*For, behold, I create new heavens and a new earth: and the former shall not be remembered, nor come into mind.* (Isaiah 65:17). Yahuah (LORD) himself promises *I create new heavens and a new earth.* This is the promise Peter holds out beyond the fire: *Nevertheless we, according to his promise, look for new heavens and a new earth, wherein dwelleth righteousness* (2 Peter 3:13). The day of judgment is not the end of the story; the same word that framed the heavens and will dissolve them remakes them new, and righteousness dwells there.'),
  ('canon', '2-peter', 3, 13, 'canon', 'isaiah', 66, 22, 'free', E'*For as the new heavens and the new earth, which I will make, shall remain before me, saith Yahuah (LORD), so shall your seed and your name remain.* (Isaiah 66:22). Yahuah (LORD) declares the new heavens and new earth *shall remain before me* — and binds to them the enduring of the covenant seed: *so shall your seed and your name remain.* Peter''s *new heavens and a new earth, wherein dwelleth righteousness* (2 Peter 3:13) is this very promise — not a new people in a severed story, but the seed and name of the covenant abiding forever in the world made new.'),
  ('canon', '2-peter', 3, 13, 'canon', 'revelation', 21, 1, 'free', E'*And I saw a new heaven and a new earth: for the first heaven and the first earth were passed away; and there was no more sea.* (Revelation 21:1). John sees the promise fulfilled: *a new heaven and a new earth* after *the first heaven and the first earth were passed away.* It is the same hope Peter sets before the elect — *we... look for new heavens and a new earth, wherein dwelleth righteousness* (2 Peter 3:13). The prophets promised it, Peter waits for it, John beholds it: one consummation of the one covenant story, where righteousness dwells.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s241_p241c3_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s241_p241c3_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-peter-3-scoffers-in-the-last-days-where-is-the-promise-of-his-coming-isaiah-5-malachi-2',
       E'Scoffers in the last days: Where is the promise of his coming? (Isaiah 5, Malachi 2, Ezekiel 12)',
       E'Peter warns *that there shall come in the last days scoffers, walking after their own lusts, And saying, Where is the promise of his coming? for since the fathers fell asleep, all things continue as they were from the beginning of the creation* (2 Peter 3:3-4). The taunt is ancient, not new. Isaiah''s mockers dared the judgment to come if it were real: *Let him make speed, and hasten his work, that we may see it: and let the counsel of the Holy One of Yashar''el (Israel) draw nigh and come, that we may know it!* (Isaiah 5:19). Malachi named the same doubt: *Ye have wearied Yahuah (LORD) with your words... When ye say... Where is the Elohim (God) of judgment?* (Malachi 2:17). And Ezekiel records the very proverb of the scoffers: *what is that proverb that ye have in the land of Yashar''el (Israel), saying, The days are prolonged, and every vision faileth?* (Ezekiel 12:22) — the same *all things continue* that Peter''s scoffers speak. But Yahuah (LORD) answered Ezekiel: *The days are at hand, and the effect of every vision* (Ezekiel 12:23). The prolonging is not the failing of the word but the longsuffering of the One who keeps it; the mockery against the sure prophetic word is old, and it has always been answered by the day that comes.',
       sv.verse_id, ev.verse_id, 'free', 9820
  FROM _s241_p241c3_lookup sv, _s241_p241c3_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=3 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='2-peter' AND ev.chapter_number=3 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-peter-3-by-the-word-of-elohim-the-heavens-were-of-old-genesis-1-psalm-33',
       E'By the word of Elohim (God) the heavens were of old (Genesis 1, Psalm 33)',
       E'Against the scoffers'' *all things continue as they were,* Peter sets creation by the spoken word: *For this they willingly are ignorant of, that by the word of Elohim (God) the heavens were of old, and the earth standing out of the water and in the water* (2 Peter 3:5). At the beginning Elohim (God) ordered the waters by his word — *Let there be a firmament in the midst of the waters, and let it divide the waters from the waters* (Genesis 1:6) — and brought the dry land out: *Let the waters under the heaven be gathered together unto one place, and let the dry land appear: and it was so* (Genesis 1:9). The Psalm states the principle outright: *By the word of Yahuah (LORD) were the heavens made; and all the host of them by the breath of his mouth* (Psalm 33:6). The heavens are not self-existing nor everlasting in themselves; they were framed by the word and *standing out of the water,* and *the same word* now keeps them *in store, reserved unto fire* (2 Peter 3:7). What the word made, the word governs — and the word can dissolve and remake. The scoffer who says nothing changes has forgotten the word that spoke the world into being.',
       sv.verse_id, ev.verse_id, 'free', 9823
  FROM _s241_p241c3_lookup sv, _s241_p241c3_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=3 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='2-peter' AND ev.chapter_number=3 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-peter-3-the-world-that-then-was-overflowed-with-water-perished-genesis-7-jubilees-5',
       E'The world that then was, overflowed with water, perished (Genesis 7, Jubilees 5, Wisdom 14)',
       E'The word that framed the world also unmade it once. Peter answers the scoffers with the Flood: *Whereby the world that then was, being overflowed with water, perished* (2 Peter 3:6). Genesis tells how the waters that creation had divided returned: *the same day were all the fountains of the great deep broken up, and the windows of heaven were opened* (Genesis 7:11), until *every living substance was destroyed which was upon the face of the ground... and Noah only remained alive, and they that were with him in the ark* (Genesis 7:23). The restored library records the same judgment in the same imagery: *Yahuah (God) opened seven flood-gates of heaven, And the mouths of the fountains of the great deep... until the whole world was full of water* (Jubilees 5:23). And the wisdom of the library remembers it as the perishing of the proud while the remnant was carried through: *when the proud giants perished, the hope of the world governed by your hand escaped in a weak vessel, and left to all ages a seed of generation* (Wisdom of Solomon 14:6). One world framed out of the water was unmade by water at the word of Elohim (God) — the down-payment of the day of judgment to come, *reserved unto fire* (2 Peter 3:7). The judgment the scoffers deny is written across the whole library; it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 9826
  FROM _s241_p241c3_lookup sv, _s241_p241c3_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=3 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='2-peter' AND ev.chapter_number=3 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-peter-3-one-day-is-with-yahuah-as-a-thousand-years-psalm-90',
       E'One day is with Yahuah (Lord) as a thousand years (Psalm 90)',
       E'To the charge that the promise has failed because it tarries, Peter answers with Moses'' reckoning of time: *be not ignorant of this one thing, that one day is with Yahuah (Lord) as a thousand years, and a thousand years as one day* (2 Peter 3:8). The psalm of Moses said it first: *For a thousand years in thy sight are but as yesterday when it is past, and as a watch in the night* (Psalm 90:4). What the scoffer counts as long delay is no delay to the Everlasting, in whose sight a thousand years pass as a single day. And the seeming slowness is mercy, not slackness: *Yahuah (Lord) is not slack concerning his promise, as some men count slackness; but is longsuffering to us-ward, not willing that any should perish, but that all should come to repentance* (2 Peter 3:9). The prolonging of the days is the patience of the One who keeps the sure word — the very longsuffering Peter goes on to call *salvation* (2 Peter 3:15).',
       sv.verse_id, ev.verse_id, 'free', 9829
  FROM _s241_p241c3_lookup sv, _s241_p241c3_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=3 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='2-peter' AND ev.chapter_number=3 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-peter-3-the-day-of-yahuah-as-a-thief-the-elements-melt-with-fervent-heat-isaiah-13-joel-2-malachi-4',
       E'The day of Yahuah (Lord) as a thief; the elements melt with fervent heat (Isaiah 13, Joel 2, Malachi 4)',
       E'*But the day of Yahuah (Lord) will come as a thief in the night; in the which the heavens shall pass away with a great noise, and the elements shall melt with fervent heat, the earth also and the works that are therein shall be burned up* (2 Peter 3:10). This is no new doctrine but the prophets'' own day of Yahuah, handed on. Isaiah cried *Howl ye; for the day of Yahuah (LORD) is at hand; it shall come as a destruction from the Almighty* (Isaiah 13:6), the day that *cometh, cruel both with wrath and fierce anger, to lay the land desolate* (Isaiah 13:9), wherein *I will shake the heavens, and the earth shall remove out of her place* (Isaiah 13:13). Joel sounded the alarm: *Blow ye the trumpet in Zion... for the day of Yahuah (LORD) cometh, for it is nigh at hand* (Joel 2:1). Malachi named its fire: *the day cometh, that shall burn as an oven; and all the proud... shall be stubble... shall burn them up* (Malachi 4:1) — the very *day of judgment and perdition of ungodly men* (2 Peter 3:7) in which *the heavens being on fire shall be dissolved* (2 Peter 3:12). And Paul taught the same to the Thessalonians in Peter''s exact words: *the day of Yahuah (Lord) so cometh as a thief in the night* (1 Thessalonians 5:2), for which cause Peter calls him *our beloved brother* whose epistles speak *of these things* (2 Peter 3:15-16). The shaking of the heavens, the burning oven, the thief in the night — one day, one Judge, one sure prophetic word against the scoffers'' false peace.',
       sv.verse_id, ev.verse_id, 'free', 9832
  FROM _s241_p241c3_lookup sv, _s241_p241c3_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=3 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='2-peter' AND ev.chapter_number=3 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-peter-3-new-heavens-and-a-new-earth-wherein-dwelleth-righteousness-isaiah-65-66',
       E'New heavens and a new earth, wherein dwelleth righteousness (Isaiah 65, Isaiah 66, Revelation 21)',
       E'The day of fire is not the end of the story. *Nevertheless we, according to his promise, look for new heavens and a new earth, wherein dwelleth righteousness* (2 Peter 3:13). The promise is Yahuah''s (LORD) own, spoken through Isaiah: *For, behold, I create new heavens and a new earth: and the former shall not be remembered, nor come into mind* (Isaiah 65:17). And Isaiah binds the new creation to the enduring of the covenant seed: *For as the new heavens and the new earth, which I will make, shall remain before me, saith Yahuah (LORD), so shall your seed and your name remain* (Isaiah 66:22). This is no new people in a severed story but the seed and name of the covenant abiding forever in the world made new. John beheld the promise fulfilled: *And I saw a new heaven and a new earth: for the first heaven and the first earth were passed away; and there was no more sea* (Revelation 21:1). The same word that framed the heavens of old, that drowned the world that then was, and that reserves the present heavens unto fire, remakes them new — and *righteousness dwelleth* there. The prophets promised it, Peter waits for it, John beholds it: one consummation of the one covenant story.',
       sv.verse_id, ev.verse_id, 'free', 9835
  FROM _s241_p241c3_lookup sv, _s241_p241c3_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=3 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='2-peter' AND ev.chapter_number=3 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-peter-3-scoffers-in-the-last-days-where-is-the-promise-of-his-coming-isaiah-5-malachi-2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 5:19 — *Let him make speed, and hasten his work, that we may see it* the ancient mockers daring the judgment to come; the same taunt as *Where is the promise of his coming?* (2 Peter 3:4).'
  FROM cross_reference_threads t, cross_references x, _s241_p241c3_lookup sv, _s241_p241c3_lookup tv
 WHERE t.slug='2-peter-3-scoffers-in-the-last-days-where-is-the-promise-of-his-coming-isaiah-5-malachi-2'
   AND sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=3 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=5 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Malachi 2:17 — *Where is the Elohim (God) of judgment?* the wearying word of the mockers; the same doubt as *Where is the promise of his coming?* (2 Peter 3:4).'
  FROM cross_reference_threads t, cross_references x, _s241_p241c3_lookup sv, _s241_p241c3_lookup tv
 WHERE t.slug='2-peter-3-scoffers-in-the-last-days-where-is-the-promise-of-his-coming-isaiah-5-malachi-2'
   AND sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=3 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=2 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 12:22 — *The days are prolonged, and every vision faileth* the scoffers'' proverb; the same *all things continue* (2 Peter 3:4), answered by *The days are at hand* (Ezekiel 12:23).'
  FROM cross_reference_threads t, cross_references x, _s241_p241c3_lookup sv, _s241_p241c3_lookup tv
 WHERE t.slug='2-peter-3-scoffers-in-the-last-days-where-is-the-promise-of-his-coming-isaiah-5-malachi-2'
   AND sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=3 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=12 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-peter-3-by-the-word-of-elohim-the-heavens-were-of-old-genesis-1-psalm-33
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:6 — *Let there be a firmament in the midst of the waters, and let it divide the waters* the spoken word that ordered the waters; *by the word of Elohim (God) the heavens were of old* (2 Peter 3:5).'
  FROM cross_reference_threads t, cross_references x, _s241_p241c3_lookup sv, _s241_p241c3_lookup tv
 WHERE t.slug='2-peter-3-by-the-word-of-elohim-the-heavens-were-of-old-genesis-1-psalm-33'
   AND sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=3 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 1:9 — *let the dry land appear: and it was so* the earth gathered out of the waters; *the earth standing out of the water and in the water* (2 Peter 3:5).'
  FROM cross_reference_threads t, cross_references x, _s241_p241c3_lookup sv, _s241_p241c3_lookup tv
 WHERE t.slug='2-peter-3-by-the-word-of-elohim-the-heavens-were-of-old-genesis-1-psalm-33'
   AND sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=3 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 33:6 — *By the word of Yahuah (LORD) were the heavens made* the principle stated plainly; the exact ground of Peter''s rebuke of the scoffers (2 Peter 3:5).'
  FROM cross_reference_threads t, cross_references x, _s241_p241c3_lookup sv, _s241_p241c3_lookup tv
 WHERE t.slug='2-peter-3-by-the-word-of-elohim-the-heavens-were-of-old-genesis-1-psalm-33'
   AND sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=3 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=33 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-peter-3-the-world-that-then-was-overflowed-with-water-perished-genesis-7-jubilees-5
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 7:11 — *the fountains of the great deep broken up, and the windows of heaven were opened* the waters returning to overflow the world; *the world that then was, being overflowed with water, perished* (2 Peter 3:6).'
  FROM cross_reference_threads t, cross_references x, _s241_p241c3_lookup sv, _s241_p241c3_lookup tv
 WHERE t.slug='2-peter-3-the-world-that-then-was-overflowed-with-water-perished-genesis-7-jubilees-5'
   AND sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=3 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=7 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 7:23 — *every living substance was destroyed... and Noah only remained alive* the old world perished utterly; the precedent of the day reserved unto fire (2 Peter 3:6-7).'
  FROM cross_reference_threads t, cross_references x, _s241_p241c3_lookup sv, _s241_p241c3_lookup tv
 WHERE t.slug='2-peter-3-the-world-that-then-was-overflowed-with-water-perished-genesis-7-jubilees-5'
   AND sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=3 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=7 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 5:23 — *Yahuah (God) opened seven flood-gates of heaven, And the mouths of the fountains of the great deep... until the whole world was full of water* the library''s same Flood SELF-LINK; the world Peter says *perished* (2 Peter 3:6).'
  FROM cross_reference_threads t, cross_references x, _s241_p241c3_lookup sv, _s241_p241c3_lookup tv
 WHERE t.slug='2-peter-3-the-world-that-then-was-overflowed-with-water-perished-genesis-7-jubilees-5'
   AND sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=3 AND sv.verse_number=6
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Wisdom of Solomon 14:6 — *when the proud giants perished, the hope of the world... escaped in a weak vessel* the Flood as the perishing of the proud and the keeping of the remnant; the world that *perished* (2 Peter 3:6).'
  FROM cross_reference_threads t, cross_references x, _s241_p241c3_lookup sv, _s241_p241c3_lookup tv
 WHERE t.slug='2-peter-3-the-world-that-then-was-overflowed-with-water-perished-genesis-7-jubilees-5'
   AND sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=3 AND sv.verse_number=6
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=14 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-peter-3-one-day-is-with-yahuah-as-a-thousand-years-psalm-90
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 90:4 — *a thousand years in thy sight are but as yesterday when it is past* Moses'' reckoning of time, taken up word for word: *one day is with Yahuah (Lord) as a thousand years* (2 Peter 3:8).'
  FROM cross_reference_threads t, cross_references x, _s241_p241c3_lookup sv, _s241_p241c3_lookup tv
 WHERE t.slug='2-peter-3-one-day-is-with-yahuah-as-a-thousand-years-psalm-90'
   AND sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=3 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=90 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-peter-3-the-day-of-yahuah-as-a-thief-the-elements-melt-with-fervent-heat-isaiah-13-joel-2-malachi-4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 13:6 — *the day of Yahuah (LORD) is at hand; it shall come as a destruction from the Almighty* the prophets'' own day; *the day of Yahuah (Lord) will come as a thief in the night* (2 Peter 3:10).'
  FROM cross_reference_threads t, cross_references x, _s241_p241c3_lookup sv, _s241_p241c3_lookup tv
 WHERE t.slug='2-peter-3-the-day-of-yahuah-as-a-thief-the-elements-melt-with-fervent-heat-isaiah-13-joel-2-malachi-4'
   AND sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=3 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=13 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 13:9 — *the day of Yahuah (LORD) cometh, cruel both with wrath and fierce anger... he shall destroy the sinners thereof* the day against the wicked; the day burning up the ungodly (2 Peter 3:10).'
  FROM cross_reference_threads t, cross_references x, _s241_p241c3_lookup sv, _s241_p241c3_lookup tv
 WHERE t.slug='2-peter-3-the-day-of-yahuah-as-a-thief-the-elements-melt-with-fervent-heat-isaiah-13-joel-2-malachi-4'
   AND sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=3 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=13 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 13:13 — *I will shake the heavens, and the earth shall remove out of her place* the cosmic undoing of that day; *the heavens shall pass away with a great noise* (2 Peter 3:10).'
  FROM cross_reference_threads t, cross_references x, _s241_p241c3_lookup sv, _s241_p241c3_lookup tv
 WHERE t.slug='2-peter-3-the-day-of-yahuah-as-a-thief-the-elements-melt-with-fervent-heat-isaiah-13-joel-2-malachi-4'
   AND sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=3 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=13 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Joel 2:1 — *Blow ye the trumpet in Zion... for the day of Yahuah (LORD) cometh, for it is nigh at hand* the alarm of the one day; coming *as a thief in the night* (2 Peter 3:10).'
  FROM cross_reference_threads t, cross_references x, _s241_p241c3_lookup sv, _s241_p241c3_lookup tv
 WHERE t.slug='2-peter-3-the-day-of-yahuah-as-a-thief-the-elements-melt-with-fervent-heat-isaiah-13-joel-2-malachi-4'
   AND sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=3 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Malachi 4:1 — *the day cometh, that shall burn as an oven; and all the proud... shall be stubble... shall burn them up* the fire of that day; *the heavens being on fire shall be dissolved* (2 Peter 3:12).'
  FROM cross_reference_threads t, cross_references x, _s241_p241c3_lookup sv, _s241_p241c3_lookup tv
 WHERE t.slug='2-peter-3-the-day-of-yahuah-as-a-thief-the-elements-melt-with-fervent-heat-isaiah-13-joel-2-malachi-4'
   AND sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=3 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=4 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'1 Thessalonians 5:2 — *the day of Yahuah (Lord) so cometh as a thief in the night* Paul''s teaching in Peter''s exact words; *our beloved brother Paul* whose epistles speak of these things (2 Peter 3:10,15-16).'
  FROM cross_reference_threads t, cross_references x, _s241_p241c3_lookup sv, _s241_p241c3_lookup tv
 WHERE t.slug='2-peter-3-the-day-of-yahuah-as-a-thief-the-elements-melt-with-fervent-heat-isaiah-13-joel-2-malachi-4'
   AND sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=3 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='1-thessalonians' AND tv.chapter_number=5 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-peter-3-new-heavens-and-a-new-earth-wherein-dwelleth-righteousness-isaiah-65-66
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 65:17 — *I create new heavens and a new earth: and the former shall not be remembered* Yahuah''s (LORD) own promise; *we... look for new heavens and a new earth, wherein dwelleth righteousness* (2 Peter 3:13).'
  FROM cross_reference_threads t, cross_references x, _s241_p241c3_lookup sv, _s241_p241c3_lookup tv
 WHERE t.slug='2-peter-3-new-heavens-and-a-new-earth-wherein-dwelleth-righteousness-isaiah-65-66'
   AND sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=3 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=65 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 66:22 — *the new heavens and the new earth... shall remain before me... so shall your seed and your name remain* the new creation bound to the covenant seed; not a severed people but the covenant abiding (2 Peter 3:13).'
  FROM cross_reference_threads t, cross_references x, _s241_p241c3_lookup sv, _s241_p241c3_lookup tv
 WHERE t.slug='2-peter-3-new-heavens-and-a-new-earth-wherein-dwelleth-righteousness-isaiah-65-66'
   AND sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=3 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=66 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 21:1 — *And I saw a new heaven and a new earth: for the first heaven and the first earth were passed away* the promise beheld fulfilled; the same hope Peter waits for (2 Peter 3:13).'
  FROM cross_reference_threads t, cross_references x, _s241_p241c3_lookup sv, _s241_p241c3_lookup tv
 WHERE t.slug='2-peter-3-new-heavens-and-a-new-earth-wherein-dwelleth-righteousness-isaiah-65-66'
   AND sv.edition_slug='canon' AND sv.book_slug='2-peter' AND sv.chapter_number=3 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session241 — 2 Peter cross-references complete.'
