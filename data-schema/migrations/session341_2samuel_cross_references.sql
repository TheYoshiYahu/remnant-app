-- =====================================================================
-- Session 341 — 2 Samuel FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py /tmp/former-prophets-wt/data-schema/migrations/session341_2samuel_cross_references.sql
-- =====================================================================

\echo 'session341 — 2 Samuel cross-references starting...'
BEGIN;

-- ----- fragment: minion_2-samuel_1.sql (2 Samuel 1) -----
-- Chapter: 2 Samuel 1 — the Amalekite messenger, David's reverence for the anointed, the Song of the Bow
-- Tag: 2sa01   View: _s341_2sa01_lookup   Sort band: 37250, step 3 (37250, 37253, 37256, ...)
--
-- 2 Samuel 1 coverage:
--   v.1     NT: none warranted   Extras: none warranted   Tanakh: 1-samuel 31 (the Gilboa defeat just narrated) — woven in Song-of-the-Bow thread
--   v.2-12  NT: none warranted   Extras: none warranted   Tanakh: 1-samuel 31 (the death David mourns) — covered by Song-of-the-Bow
--   v.14,16 NT: matthew 26:52 (they that take the sword)   Extras: none warranted
--           Tanakh: 1-samuel 24:6, 1-samuel 26:9 (David spared the anointed twice), psalms 105:15 (Touch not mine anointed),
--                   numbers 35:30 (death by the mouth of witnesses), genesis 9:6 (whoso sheddeth man's blood) — Touch-not-mine-anointed thread
--   v.18    NT: none warranted   Extras: jasher named IN the verse (book of Jasher) — no clean Jasher lament-witness in parse, named in prose only
--   v.19,23,25,27 NT: none warranted   Extras: none warranted
--           Tanakh: 1-samuel 31:1 (the mighty fallen on Gilboa), 1-samuel 18:7 (Saul his thousands, David his ten thousands), 1-chronicles 10:13 (Saul died for his transgression) — Song-of-the-Bow thread
--   v.26    NT: john 15:13 (greater love — lay down his life for his friends)   Extras: none warranted
--           Tanakh: 1-samuel 18:1 (Jonathan's soul knit to David), 1-samuel 18:3 (the covenant) — covenant-grief thread
--
-- Threads (3):
--   2-samuel-1-touch-not-mine-anointed-the-amalekites-blood-on-his-own-head   [Tanakh + NT]   tier free
--   2-samuel-1-the-song-of-the-bow-how-are-the-mighty-fallen                  [Tanakh]        tier free
--   2-samuel-1-thy-love-to-me-was-wonderful-the-covenant-grief                [Tanakh + NT]   tier free
--
-- Framework notes: David's execution of the Amalekite (1:14-16) seals the reverence he held in 1 Sam 24/26 — the anointed
--   office is Yahuah's, untouchable; blood-guilt by the man's OWN confession (his mouth testified against him, Num 35:30 / Gen 9:6).
--   Matthew 26:52 carries the principle forward. The Song of the Bow mourns Saul (the enemy-king) and Jonathan with NO triumphalism
--   — victims not enemies, honoring the office even of the one who hunted him. The covenant-love of Jonathan (1 Sam 18) grounds the
--   grief of 1:26; John 15:13 (lay down his life for his friends) carries that covenant-love forward. No co-equal/divine reading needed here.

CREATE TEMP VIEW _s341_2sa01_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: Touch not mine anointed
    ('canon','2-samuel',1,14,'canon','1-samuel',24,6,'free',
      E'*And he said unto his men, Yahuah (LORD) forbid that I should do this thing unto my master, the LORD''S anointed, to stretch forth mine hand against him, seeing he is the anointed of Yahuah (LORD)* (1 Samuel 24:6). In the cave at En-gedi David refused the very act the Amalekite boasted of. So when the messenger claims he stretched forth his hand to kill Saul, David asks *How wast thou not afraid to stretch forth thine hand to destroy the LORD''S anointed?* (2 Samuel 1:14) — the anointed office is Yahuah''s alone, untouchable.'),
    ('canon','2-samuel',1,14,'canon','1-samuel',26,9,'free',
      E'*And David said to Abishai, Destroy him not: for who can stretch forth his hand against the LORD''S anointed, and be guiltless?* (1 Samuel 26:9). A second time, in the trench at Hachilah, David held the spared spear and would not strike. The Amalekite did the thing David twice refused — *who can stretch forth his hand against the LORD''S anointed, and be guiltless?* is now answered against him: *How wast thou not afraid to stretch forth thine hand* (2 Samuel 1:14).'),
    ('canon','2-samuel',1,14,'canon','psalms',105,15,'free',
      E'*Saying, Touch not mine anointed, and do my prophets no harm* (Psalm 105:15). The psalm that sings the patriarchs'' history names Yahuah''s own guard over his chosen. David has lived by that word — twice he stayed his hand — and now requires it of the Amalekite who *stretch[ed] forth thine hand to destroy the LORD''S anointed* (2 Samuel 1:14).'),
    ('canon','2-samuel',1,16,'canon','numbers',35,30,'free',
      E'*Whoso killeth any person, the murderer shall be put to death by the mouth of witnesses: but one witness shall not testify against any person to cause him to die* (Numbers 35:30). David condemns the Amalekite on his own confession — *Thy blood be upon thy head; for thy mouth hath testified against thee, saying, I have slain the LORD''S anointed* (2 Samuel 1:16). The man''s own mouth is the witness the Torah requires.'),
    ('canon','2-samuel',1,16,'canon','genesis',9,6,'free',
      E'*Whoso sheddeth man''s blood, by man shall his blood be shed: for in the image of Elohim (God) made he man* (Genesis 9:6). The blood charge runs from Noah''s covenant: the shedder of blood answers with his own. So David pronounces *Thy blood be upon thy head* (2 Samuel 1:16) — the Amalekite''s confessed bloodshed returns upon himself.'),
    ('canon','2-samuel',1,16,'canon','matthew',26,52,'free',
      E'*Then said Yahusha (Jesus) unto him, Put up again thy sword into his place: for all they that take the sword shall perish with the sword* (Matthew 26:52). The Formed Son carries the principle forward: violence wielded against Yahuah''s purpose returns on the wielder. The Amalekite who took the sword against the anointed perishes by David''s word — *Thy blood be upon thy head* (2 Samuel 1:16).'),
    -- Thread 2: The Song of the Bow
    ('canon','2-samuel',1,19,'canon','1-samuel',31,1,'free',
      E'*Now the Philistines fought against Yashar''el (Israel): and the men of Yashar''el (Israel) fled from before the Philistines, and fell down slain in mount Gilboa* (1 Samuel 31:1). This is the battle David laments. The plain account of the rout becomes the burden of his song — *The beauty of Yashar''el (Israel) is slain upon thy high places: how are the mighty fallen!* (2 Samuel 1:19).'),
    ('canon','2-samuel',1,23,'canon','1-samuel',18,7,'free',
      E'*And the women answered one another as they played, and said, Saul hath slain his thousands, and David his ten thousands* (1 Samuel 18:7). Once the daughters of Yashar''el sang Saul''s victories in the dance; now David bids them *weep over Saul, who clothed you in scarlet* (2 Samuel 1:24), for *Saul and Jonathan were lovely and pleasant in their lives* (2 Samuel 1:23). The mourning song answers the victory song — no triumph, only grief over the fallen king.'),
    ('canon','2-samuel',1,27,'canon','1-chronicles',10,13,'free',
      E'*So Saul died for his transgression which he committed against Yahuah (LORD), even against the word of Yahuah (LORD), which he kept not* (1 Chronicles 10:13). The chronicler names the covenant cause of Saul''s fall, yet David''s lament holds no accusation — only *How are the mighty fallen, and the weapons of war perished!* (2 Samuel 1:27). The judgment is Yahuah''s; the grief is David''s. Victims mourned, not enemies despised.'),
    -- Thread 3: Thy love passing the love of women
    ('canon','2-samuel',1,26,'canon','1-samuel',18,1,'free',
      E'*And it came to pass, when he had made an end of speaking unto Saul, that the soul of Jonathan was knit with the soul of David, and Jonathan loved him as his own soul* (1 Samuel 18:1). The bond David now mourns was sealed at the first. His grief — *thy love to me was wonderful, passing the love of women* (2 Samuel 1:26) — is the cry of a soul knit to a soul now slain.'),
    ('canon','2-samuel',1,26,'canon','1-samuel',18,3,'free',
      E'*Then Jonathan and David made a covenant, because he loved him as his own soul* (1 Samuel 18:3). Their love was covenant-bound, not mere affection. So David''s lament is covenant-grief — *I am distressed for thee, my brother Jonathan: very pleasant hast thou been unto me* (2 Samuel 1:26) — mourning a covenant brother, not a fallen rival.'),
    ('canon','2-samuel',1,26,'canon','john',15,13,'free',
      E'*Greater love hath no man than this, that a man lay down his life for his friends* (John 15:13). Jonathan loved David as his own soul, set his own claim to the throne aside, and stood with him to the death on Gilboa. The Formed Son names that very measure of covenant-love — the love David weeps over: *thy love to me was wonderful, passing the love of women* (2 Samuel 1:26).')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s341_2sa01_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s341_2sa01_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Thread 1: Touch not mine anointed
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-samuel-1-touch-not-mine-anointed-the-amalekites-blood-on-his-own-head',
       E'Touch Not Mine Anointed — the Amalekite''s Blood on His Own Head',
       E'An Amalekite runs to David with Saul''s crown and bracelet, claiming he finished the dying king himself: *So I stood upon him, and slew him... and I took the crown that was upon his head... and have brought them hither unto my lord* (2 Samuel 1:10). He expects reward. He receives judgment, for David has spent his fugitive years guarding the very office this man boasts of breaking. Twice David had Saul in his hand and refused: *Yahuah (LORD) forbid that I should do this thing unto my master, the LORD''S anointed, to stretch forth mine hand against him* (1 Samuel 24:6), and again, *who can stretch forth his hand against the LORD''S anointed, and be guiltless?* (1 Samuel 26:9). The principle is older than David — it is Yahuah''s own guard over his chosen: *Touch not mine anointed, and do my prophets no harm* (Psalm 105:15). So David asks, *How wast thou not afraid to stretch forth thine hand to destroy the LORD''S anointed?* (2 Samuel 1:14). The man is condemned out of his own mouth, exactly as the Torah requires a charge to be witnessed: *Whoso killeth any person, the murderer shall be put to death by the mouth of witnesses* (Numbers 35:30) — *Thy blood be upon thy head; for thy mouth hath testified against thee* (2 Samuel 1:16). The blood returns upon the shedder, the law given to Noah: *Whoso sheddeth man''s blood, by man shall his blood be shed* (Genesis 9:6). And the Formed Son carries the same word forward in the garden: *Put up again thy sword into his place: for all they that take the sword shall perish with the sword* (Matthew 26:52). The anointed office is Yahuah''s, and the hand stretched against it answers for the blood it sheds.',
       sv.verse_id, ev.verse_id, 'free', 37250
  FROM _s341_2sa01_lookup sv, _s341_2sa01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=1 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='2-samuel' AND ev.chapter_number=1 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- Thread 2: The Song of the Bow
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-samuel-1-the-song-of-the-bow-how-are-the-mighty-fallen',
       E'The Song of the Bow — How Are the Mighty Fallen',
       E'David sets a lament over Saul and Jonathan and bids the children of Yahudah (Judah) be taught the use of the bow (2 Samuel 1:17-18). The battle he mourns is the rout of Gilboa just narrated: *Now the Philistines fought against Yashar''el (Israel)... and fell down slain in mount Gilboa* (1 Samuel 31:1). The chronicler weighs the covenant cause of that fall — *So Saul died for his transgression which he committed against Yahuah (LORD)... which he kept not* (1 Chronicles 10:13) — yet David''s song holds no accusation, only grief: *The beauty of Yashar''el (Israel) is slain upon thy high places: how are the mighty fallen!* (2 Samuel 1:19). He even silences the enemy''s gloating — *Tell it not in Gath... lest the daughters of the Philistines rejoice* (2 Samuel 1:20). Once the women of Yashar''el sang in the dance, *Saul hath slain his thousands, and David his ten thousands* (1 Samuel 18:7), and that song made Saul David''s hunter; now David bids those same daughters *weep over Saul, who clothed you in scarlet* (2 Samuel 1:24), for *Saul and Jonathan were lovely and pleasant in their lives, and in their death they were not divided* (2 Samuel 1:23). He mourns the king who pursued him with no triumph at all — victims, not enemies — and closes, *How are the mighty fallen, and the weapons of war perished!* (2 Samuel 1:27).',
       sv.verse_id, ev.verse_id, 'free', 37253
  FROM _s341_2sa01_lookup sv, _s341_2sa01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=1 AND sv.verse_number=19
   AND ev.edition_slug='canon' AND ev.book_slug='2-samuel' AND ev.chapter_number=1 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

-- Thread 3: Thy love to me was wonderful
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-samuel-1-thy-love-to-me-was-wonderful-the-covenant-grief',
       E'Thy Love to Me Was Wonderful — the Covenant Grief',
       E'At the heart of the lament David turns to Jonathan: *I am distressed for thee, my brother Jonathan: very pleasant hast thou been unto me: thy love to me was wonderful, passing the love of women* (2 Samuel 1:26). This is not sudden sentiment but the breaking of a bond sealed years before. When David first stood before Saul, *the soul of Jonathan was knit with the soul of David, and Jonathan loved him as his own soul* (1 Samuel 18:1), and they bound it in covenant: *Then Jonathan and David made a covenant, because he loved him as his own soul* (1 Samuel 18:3). Jonathan, the king''s heir, stripped off his own robe for David and set aside his claim to the throne for him — a love that sought the other''s life above its own place. The Formed Son names exactly that measure: *Greater love hath no man than this, that a man lay down his life for his friends* (John 15:13). Jonathan stood with David to the end and fell on Gilboa beside his father. So David''s grief is covenant-grief — the loss of a brother whose love was bound by oath, *passing the love of women* (2 Samuel 1:26).',
       sv.verse_id, ev.verse_id, 'free', 37256
  FROM _s341_2sa01_lookup sv, _s341_2sa01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=1 AND sv.verse_number=26
   AND ev.edition_slug='canon' AND ev.book_slug='2-samuel' AND ev.chapter_number=1 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

-- Members: Thread 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'1 Samuel 24:6 — *Yahuah (LORD) forbid that I should... stretch forth mine hand against him, seeing he is the anointed of Yahuah (LORD)* — David spared the anointed in the cave.'
  FROM cross_reference_threads t
  JOIN _s341_2sa01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=1 AND sv.verse_number=14
  JOIN _s341_2sa01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=24 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-1-touch-not-mine-anointed-the-amalekites-blood-on-his-own-head'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'1 Samuel 26:9 — *who can stretch forth his hand against the LORD''S anointed, and be guiltless?* — David spared the anointed a second time, in the trench.'
  FROM cross_reference_threads t
  JOIN _s341_2sa01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=1 AND sv.verse_number=14
  JOIN _s341_2sa01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=26 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-1-touch-not-mine-anointed-the-amalekites-blood-on-his-own-head'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Psalm 105:15 — *Touch not mine anointed, and do my prophets no harm* — Yahuah''s own guard over the anointed office.'
  FROM cross_reference_threads t
  JOIN _s341_2sa01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=1 AND sv.verse_number=14
  JOIN _s341_2sa01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=105 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-1-touch-not-mine-anointed-the-amalekites-blood-on-his-own-head'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Numbers 35:30 — *the murderer shall be put to death by the mouth of witnesses* — the Amalekite condemned on his own confession.'
  FROM cross_reference_threads t
  JOIN _s341_2sa01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=1 AND sv.verse_number=16
  JOIN _s341_2sa01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=35 AND tv.verse_number=30
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-1-touch-not-mine-anointed-the-amalekites-blood-on-his-own-head'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Genesis 9:6 — *Whoso sheddeth man''s blood, by man shall his blood be shed* — the blood returns upon the shedder.'
  FROM cross_reference_threads t
  JOIN _s341_2sa01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=1 AND sv.verse_number=16
  JOIN _s341_2sa01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-1-touch-not-mine-anointed-the-amalekites-blood-on-his-own-head'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Matthew 26:52 — *all they that take the sword shall perish with the sword* — the Formed Son carries the principle forward.'
  FROM cross_reference_threads t
  JOIN _s341_2sa01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=1 AND sv.verse_number=16
  JOIN _s341_2sa01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=26 AND tv.verse_number=52
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-1-touch-not-mine-anointed-the-amalekites-blood-on-his-own-head'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Members: Thread 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'1 Samuel 31:1 — *fell down slain in mount Gilboa* — the battle David''s song laments.'
  FROM cross_reference_threads t
  JOIN _s341_2sa01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=1 AND sv.verse_number=19
  JOIN _s341_2sa01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=31 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-1-the-song-of-the-bow-how-are-the-mighty-fallen'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'1 Samuel 18:7 — *Saul hath slain his thousands, and David his ten thousands* — the victory song now turned to a mourning song.'
  FROM cross_reference_threads t
  JOIN _s341_2sa01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=1 AND sv.verse_number=23
  JOIN _s341_2sa01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=18 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-1-the-song-of-the-bow-how-are-the-mighty-fallen'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'1 Chronicles 10:13 — *So Saul died for his transgression* — the covenant cause named, yet David''s lament holds no accusation.'
  FROM cross_reference_threads t
  JOIN _s341_2sa01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=1 AND sv.verse_number=27
  JOIN _s341_2sa01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=10 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-1-the-song-of-the-bow-how-are-the-mighty-fallen'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Members: Thread 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'1 Samuel 18:1 — *the soul of Jonathan was knit with the soul of David* — the bond David now mourns, sealed at the first.'
  FROM cross_reference_threads t
  JOIN _s341_2sa01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=1 AND sv.verse_number=26
  JOIN _s341_2sa01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=18 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-1-thy-love-to-me-was-wonderful-the-covenant-grief'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'1 Samuel 18:3 — *Then Jonathan and David made a covenant, because he loved him as his own soul* — the love was covenant-bound, so the grief is covenant-grief.'
  FROM cross_reference_threads t
  JOIN _s341_2sa01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=1 AND sv.verse_number=26
  JOIN _s341_2sa01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=18 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-1-thy-love-to-me-was-wonderful-the-covenant-grief'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'John 15:13 — *Greater love hath no man than this, that a man lay down his life for his friends* — the Formed Son names the very measure of Jonathan''s love.'
  FROM cross_reference_threads t
  JOIN _s341_2sa01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=1 AND sv.verse_number=26
  JOIN _s341_2sa01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=15 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-1-thy-love-to-me-was-wonderful-the-covenant-grief'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2-samuel_2.sql (2 Samuel 2) -----
-- Chapter: 2 Samuel 2 — David anointed king over the house of Yahudah at Hebron;
--   the men of Jabesh-gilead blessed for their kindness to Saul; Abner makes
--   Ish-bosheth king over Yashar'el — THE TWO HOUSES NOW VISIBLY DIVIDED;
--   the deadly contest at the pool of Gibeon (Joab vs Abner; Asahel slain).
-- Tag: 2sa02   View: _s341_2sa02_lookup
-- Sort band: base 37275, step 3  (37275, 37278, 37281, 37284)
--
-- 2 Samuel 2 coverage:
--   v.1-4  (David enquires, anointed king over Yahudah at Hebron)
--          NT:     none warranted (Davidic-king-line carried by Tanakh threads here)
--          Extras: none warranted
--          Tanakh: 1-samuel 16:1,13 (anointed-while-young); 2-samuel 5:3,5 (later anointed over ALL Israel at same Hebron); 1-chronicles 12:23,38 (the tribes come to Hebron to turn the kingdom)  -> THREAD 1
--   v.4-6  (David blesses the men of Jabesh-gilead, kindness/chesed to Saul's body)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: 1-samuel 31:11-13 (the very deed David requites — Jabesh recovered Saul's body)  -> THREAD 2
--   v.7    (the house of Yahudah have anointed me king) -> folded into THREAD 1 and THREAD 3 (house of Yahudah)
--   v.8-11 (Abner makes Ish-bosheth king over Yashar'el; the north / the south divided)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: ezekiel 37:16,17,19,22 (two sticks made one, no more two nations); hosea 1:11 (Yahudah + Yashar'el gathered, one head); 2-samuel 3:1 (the long war between the two houses)  -> THREAD 3
--   v.12-32 (the contest at Gibeon; Asahel slain; Abner's plea; the trumpet halts the slaughter)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: internal v.14/16/26/28 — brother against brother, the sword devouring own kin  -> THREAD 4 (intra-chapter)
--
-- Threads:
--   1. 2-samuel-2-david-anointed-king-over-the-house-of-yahudah-at-hebron   (Tanakh: 1-samuel, 2-samuel, 1-chronicles)
--   2. 2-samuel-2-blessed-be-ye-of-yahuah-kindness-to-the-buriers-of-saul   (Tanakh: 1-samuel)
--   3. 2-samuel-2-the-two-houses-divided-the-wound-the-prophets-heal        (Tanakh: ezekiel, hosea, 2-samuel)
--   4. 2-samuel-2-the-sword-devoured-the-brethren-at-the-pool-of-gibeon     (Tanakh: 2-samuel intra-chapter)
-- Framework-load-bearing: THREAD 3 is THE TWO HOUSES verse-event of the chapter —
--   Yahudah under David / the north under Ish-bosheth — the division Ezek 37 promises
--   to heal (*they shall be no more two nations*) and Hosea 1:11 (*gathered together,
--   and appoint themselves one head*); 2 Sam 3:1 names the long war that followed.
--   All members canon -> every thread tier_required 'free'.

CREATE TEMP VIEW _s341_2sa02_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===================== B. cross_references =====================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: David anointed king over the house of Yahudah at Hebron
    ('canon','2-samuel',2,4,'canon','1-samuel',16,1,'free',
      E'*And Yahuah (LORD) said unto Samuel... fill thine horn with oil, and go, I will send thee to Jesse the Beth-lehemite: for I have provided me a king among his sons* (1 Samuel 16:1). Long before *the men of Yahudah (Judah) came, and there they anointed David king over the house of Yahudah (Judah)* (2 Samuel 2:4), Yahuah had already chosen the seed-line king out of Beth-lehem. The anointing at Hebron is the unfolding of the choice already made.'),
    ('canon','2-samuel',2,4,'canon','1-samuel',16,13,'free',
      E'*Then Samuel took the horn of oil, and anointed him in the midst of his brethren: and the Spirit of Yahuah (LORD) came upon David from that day forward* (1 Samuel 16:13). That first secret anointing by the prophet is now made public when *they anointed David king over the house of Yahudah (Judah)* (2 Samuel 2:4) — the same David, the same Spirit, now openly enthroned over the southern house.'),
    ('canon','2-samuel',2,4,'canon','2-samuel',5,3,'free',
      E'*So all the elders of Yashar''el (Israel) came to the king to Hebron... and they anointed David king over Yashar''el (Israel)* (2 Samuel 5:3). David is anointed THREE times: by Samuel in secret, here over *the house of Yahudah (Judah)* (2 Samuel 2:4), and at last over all Yashar''el at this same Hebron — the southern house first, the whole people after. The one head comes to the divided people in stages.'),
    ('canon','2-samuel',2,11,'canon','2-samuel',5,5,'free',
      E'*In Hebron he reigned over Yahudah (Judah) seven years and six months: and in Jerusalem he reigned thirty and three years over all Yashar''el (Israel) and Yahudah (Judah)* (2 Samuel 5:5). This exactly answers *the time that David was king in Hebron over the house of Yahudah (Judah) was seven years and six months* (2 Samuel 2:11) — the seven-and-a-half years over the south alone, before the two houses were joined under him.'),
    ('canon','2-samuel',2,4,'canon','1-chronicles',12,23,'free',
      E'*And these are the numbers of the bands that were ready armed to the war, and came to David to Hebron, to turn the kingdom of Saul to him, according to the word of Yahuah (LORD)* (1 Chronicles 12:23). The Chronicler frames the same Hebron enthronement where *they anointed David king over the house of Yahudah (Judah)* (2 Samuel 2:4) as the fulfilment of *the word of Yahuah* — the throne given, not seized.'),
    ('canon','2-samuel',2,4,'canon','1-chronicles',12,38,'free',
      E'*All these men of war, that could keep rank, came with a perfect heart to Hebron, to make David king over all Yashar''el (Israel): and all the rest also of Yashar''el (Israel) were of one heart to make David king* (1 Chronicles 12:38). The anointing that begins over *the house of Yahudah (Judah)* (2 Samuel 2:4) is gathered up by Chronicles into the whole-house ingathering *of one heart* — the south first, then the perfect-hearted union of all the tribes.'),

    -- THREAD 2: Blessed be ye of Yahuah — kindness to the buriers of Saul
    ('canon','2-samuel',2,5,'canon','1-samuel',31,11,'free',
      E'*And when the inhabitants of Jabesh-gilead heard of that which the Philistines had done to Saul* (1 Samuel 31:11). This is the very deed David now blesses: *Blessed be ye of Yahuah (LORD), that ye have shewed this kindness unto your lord, even unto Saul, and have buried him* (2 Samuel 2:5). David honours the covenant-loyalty shown to the fallen king he never lifted a hand against.'),
    ('canon','2-samuel',2,5,'canon','1-samuel',31,12,'free',
      E'*All the valiant men arose, and went all night, and took the body of Saul and the bodies of his sons from the wall of Beth-shan, and came to Jabesh, and burnt them there* (1 Samuel 31:12). The men of Jabesh risked themselves by night to recover the body of *your lord, even... Saul* (2 Samuel 2:5) — and David, the rival the throne now belongs to, requites their chesed rather than rejoicing in Saul''s shame: victims and loyalty honoured, never enemies destroyed.'),
    ('canon','2-samuel',2,5,'canon','1-samuel',31,13,'free',
      E'*And they took their bones, and buried them under a tree at Jabesh, and fasted seven days* (1 Samuel 31:13). The burial and seven-day fast for Saul is the *kindness... ye have shewed... and have buried him* (2 Samuel 2:5) that David answers with *kindness and truth* (2 Samuel 2:6) — chesed for chesed, the covenant-bond honoured even across the dynastic divide.'),

    -- THREAD 3: The two houses divided — the wound the prophets promise to heal
    ('canon','2-samuel',2,9,'canon','ezekiel',37,16,'free',
      E'*Moreover, thou son of Adam, take thee one stick, and write upon it, For Yahudah (Judah)... then take another stick, and write upon it, For Joseph, the stick of Ephraim, and for all the house of Yashar''el (Israel) his companions* (Ezekiel 37:16). The two sticks are the very division opened here: Abner makes Ish-bosheth king *over Ephraim... and over all Yashar''el (Israel)* (2 Samuel 2:9) while the south follows David. The sign Ezekiel later acts out is the wound this chapter inflicts.'),
    ('canon','2-samuel',2,9,'canon','ezekiel',37,17,'free',
      E'*And join them one to another into one stick; and they shall become one in thine hand* (Ezekiel 37:17). Yashar''el is now two — the north under Ish-bosheth *over... all Yashar''el (Israel)* (2 Samuel 2:9), the house of Yahudah under David (2 Samuel 2:10) — but the word of Yahuah is the two made *one in thine hand*. The division is real; it is not the last word.'),
    ('canon','2-samuel',2,10,'canon','ezekiel',37,19,'free',
      E'*Behold, I will take the stick of Joseph, which is in the hand of Ephraim... and will put them with him, even with the stick of Yahudah (Judah), and make them one stick, and they shall be one in mine hand* (Ezekiel 37:19). Here *the house of Yahudah (Judah) followed David* (2 Samuel 2:10) while the rest follow Saul''s son — the very two-stick split Yahuah promises to rejoin in his own hand.'),
    ('canon','2-samuel',2,10,'canon','ezekiel',37,22,'free',
      E'*And I will make them one nation in the land upon the mountains of Yashar''el (Israel); and one king shall be king to them all: and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* (Ezekiel 37:22). The two kingdoms begin precisely here — Ish-bosheth over Yashar''el, *the house of Yahudah (Judah) followed David* (2 Samuel 2:10). The promise is the undoing of this very division: *no more two nations*, one king over all.'),
    ('canon','2-samuel',2,10,'canon','hosea',1,11,'free',
      E'*Then shall the children of Yahudah (Judah) and the children of Yashar''el (Israel) be gathered together, and appoint themselves one head, and they shall come up out of the land: for great shall be the day of Jezreel* (Hosea 1:11). The two peoples named in their division here — *the house of Yahudah (Judah) followed David* (2 Samuel 2:10), the north followed Ish-bosheth — are the same *children of Yahudah* and *children of Yashar''el* Hosea sees gathered under *one head*. David over Yahudah is the seed-line king awaiting the whole.'),
    ('canon','2-samuel',2,10,'canon','2-samuel',3,1,'free',
      E'*Now there was long war between the house of Saul and the house of David: but David waxed stronger and stronger, and the house of Saul waxed weaker and weaker* (2 Samuel 3:1). The split sealed in this chapter — *the house of Yahudah (Judah) followed David* (2 Samuel 2:10), Ish-bosheth over Yashar''el — opens the *long war* between the houses. The two-house wound bleeds for years before any joining.'),

    -- THREAD 4: The sword devoured the brethren at the pool of Gibeon
    ('canon','2-samuel',2,14,'canon','2-samuel',2,26,'free',
      E'*Then Abner called to Joab, and said, Shall the sword devour for ever? knowest thou not that it will be bitterness in the latter end?* (2 Samuel 2:26). What Abner began as sport — *Let the young men now arise, and play before us* (2 Samuel 2:14) — turns to a sword that devours, and he himself names the bitter end of brother killing brother.'),
    ('canon','2-samuel',2,16,'canon','2-samuel',2,26,'free',
      E'*Shall the sword devour for ever? knowest thou not that it will be bitterness in the latter end? how long shall it be then, ere thou bid the people return from following their brethren?* (2 Samuel 2:26). The mutual slaughter — *they caught every one his fellow by the head, and thrust his sword in his fellow''s side; so they fell down together* (2 Samuel 2:16) — is the sword devouring kin; Abner pleads to stop the people *following their brethren* with the blade. This is civil war within the one people, never enemies.'),
    ('canon','2-samuel',2,26,'canon','2-samuel',2,28,'free',
      E'*So Joab blew a trumpet, and all the people stood still, and pursued after Yashar''el (Israel) no more, neither fought they any more* (2 Samuel 2:28). Abner''s plea — *how long shall it be then, ere thou bid the people return from following their brethren?* (2 Samuel 2:26) — is answered by the trumpet that halts the killing of *Yashar''el*: the brethren-war stayed, the bitterness of the latter end held back for a day.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s341_2sa02_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s341_2sa02_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===================== C. cross_reference_threads =====================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-samuel-2-david-anointed-king-over-the-house-of-yahudah-at-hebron',
  E'David anointed king over the house of Yahudah at Hebron',
  E'*And the men of Yahudah (Judah) came, and there they anointed David king over the house of Yahudah (Judah)* (2 Samuel 2:4). The seed-line king takes his throne — but over the SOUTHERN house first. This is the unfolding of a choice made long before: *And Yahuah (LORD) said unto Samuel... I have provided me a king among his sons* (1 Samuel 16:1), and *Then Samuel took the horn of oil, and anointed him in the midst of his brethren: and the Spirit of Yahuah (LORD) came upon David from that day forward* (1 Samuel 16:13). David is anointed in stages: secretly by the prophet, then openly over Yahudah here, and at last over the whole people at this very Hebron — *So all the elders of Yashar''el (Israel) came to the king to Hebron... and they anointed David king over Yashar''el (Israel)* (2 Samuel 5:3). The seven-and-a-half years counted here, *the time that David was king in Hebron over the house of Yahudah (Judah) was seven years and six months* (2 Samuel 2:11), is exactly answered by *In Hebron he reigned over Yahudah (Judah) seven years and six months* (2 Samuel 5:5). The Chronicler frames the same enthronement as the keeping of a word: *they... came to David to Hebron, to turn the kingdom of Saul to him, according to the word of Yahuah (LORD)* (1 Chronicles 12:23), the tribes coming *with a perfect heart to Hebron, to make David king over all Yashar''el (Israel): and all the rest also of Yashar''el (Israel) were of one heart to make David king* (1 Chronicles 12:38). The throne is given, not grasped; the south first, the one head awaiting the whole.',
  sv.verse_id, ev.verse_id, 'free', 37275
  FROM _s341_2sa02_lookup sv, _s341_2sa02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=2 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='2-samuel' AND ev.chapter_number=2 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-samuel-2-blessed-be-ye-of-yahuah-kindness-to-the-buriers-of-saul',
  E'Blessed be ye of Yahuah — the kindness shown to the buriers of Saul',
  E'David''s first act as king is not vengeance on the house he supplanted but blessing on those who honoured it: *And David sent messengers unto the men of Jabesh-gilead, and said unto them, Blessed be ye of Yahuah (LORD), that ye have shewed this kindness unto your lord, even unto Saul, and have buried him* (2 Samuel 2:5), *and now Yahuah (LORD) shew kindness and truth unto you: and I also will requite you this kindness* (2 Samuel 2:6). The deed he blesses is the close of the previous book: *And when the inhabitants of Jabesh-gilead heard of that which the Philistines had done to Saul* (1 Samuel 31:11), *all the valiant men arose, and went all night, and took the body of Saul and the bodies of his sons from the wall of Beth-shan, and came to Jabesh, and burnt them there* (1 Samuel 31:12), *and they took their bones, and buried them under a tree at Jabesh, and fasted seven days* (1 Samuel 31:13). The men of Jabesh risked their lives by night to recover the body of the king from the Philistine wall. David — the rival to whom the throne now passes — answers their chesed with chesed, *kindness and truth*, requiting loyalty rather than rejoicing in Saul''s fall. Saul was a man David refused to harm; his loyal buriers are blessed, never counted enemies.',
  sv.verse_id, ev.verse_id, 'free', 37278
  FROM _s341_2sa02_lookup sv, _s341_2sa02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=2 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='2-samuel' AND ev.chapter_number=2 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-samuel-2-the-two-houses-divided-the-wound-the-prophets-heal',
  E'The two houses divided — the wound the prophets promise to heal',
  E'Here the one people becomes visibly two. *But Abner the son of Ner... took Ish-bosheth the son of Saul... and made him king over Gilead, and over the Ashurites, and over Jezreel, and over Ephraim, and over Benjamin, and over all Yashar''el (Israel)* (2 Samuel 2:9), while *the house of Yahudah (Judah) followed David* (2 Samuel 2:10). Yahudah in the south under the anointed seed-line king; Ephraim and the north under Saul''s son. This is the very division Ezekiel is later commanded to act out and Yahuah to heal: *take thee one stick, and write upon it, For Yahudah (Judah)... then take another stick, and write upon it, For Joseph, the stick of Ephraim, and for all the house of Yashar''el (Israel) his companions* (Ezekiel 37:16), *and join them one to another into one stick; and they shall become one in thine hand* (Ezekiel 37:17). The word of Yahuah is the two made one: *I will take the stick of Joseph... and... the stick of Yahudah (Judah), and make them one stick, and they shall be one in mine hand* (Ezekiel 37:19), *and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* (Ezekiel 37:22). Hosea sees the same two peoples gathered under a single head: *Then shall the children of Yahudah (Judah) and the children of Yashar''el (Israel) be gathered together, and appoint themselves one head* (Hosea 1:11). But the wound first bleeds: *Now there was long war between the house of Saul and the house of David* (2 Samuel 3:1). David over Yahudah is the seed-line king the prophets await — the one head over a people not yet whole.',
  sv.verse_id, ev.verse_id, 'free', 37281
  FROM _s341_2sa02_lookup sv, _s341_2sa02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=2 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='2-samuel' AND ev.chapter_number=2 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-samuel-2-the-sword-devoured-the-brethren-at-the-pool-of-gibeon',
  E'The sword devoured the brethren at the pool of Gibeon',
  E'The two-house split turns at once to bloodshed between kinsmen. What Abner proposes as sport — *Let the young men now arise, and play before us* (2 Samuel 2:14) — becomes a mutual slaughter: *they caught every one his fellow by the head, and thrust his sword in his fellow''s side; so they fell down together* (2 Samuel 2:16). When the cost is counted, Abner himself names the bitterness: *Shall the sword devour for ever? knowest thou not that it will be bitterness in the latter end? how long shall it be then, ere thou bid the people return from following their brethren?* (2 Samuel 2:26). This is no war on enemies — it is the people of Yahuah devouring their own *brethren*, the wound of the divided houses drawing kindred blood. The plea is heard, and the trumpet stays the slaughter for a day: *So Joab blew a trumpet, and all the people stood still, and pursued after Yashar''el (Israel) no more, neither fought they any more* (2 Samuel 2:28). The sword is checked, but the *long war* (2 Samuel 3:1) it opens will not be ended until the two are one.',
  sv.verse_id, ev.verse_id, 'free', 37284
  FROM _s341_2sa02_lookup sv, _s341_2sa02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=2 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='2-samuel' AND ev.chapter_number=2 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

-- ===================== D. cross_reference_thread_members =====================
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'1 Samuel 16:1 — *I have provided me a king among his sons*: the choice behind the Hebron anointing.'
  FROM cross_reference_threads t
  JOIN _s341_2sa02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=2 AND sv.verse_number=4
  JOIN _s341_2sa02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=16 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-2-david-anointed-king-over-the-house-of-yahudah-at-hebron'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'1 Samuel 16:13 — Samuel''s secret anointing; *the Spirit of Yahuah came upon David from that day forward*.'
  FROM cross_reference_threads t
  JOIN _s341_2sa02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=2 AND sv.verse_number=4
  JOIN _s341_2sa02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=16 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-2-david-anointed-king-over-the-house-of-yahudah-at-hebron'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'2 Samuel 5:3 — the same Hebron, later: *they anointed David king over Yashar''el* — the whole house after the south.'
  FROM cross_reference_threads t
  JOIN _s341_2sa02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=2 AND sv.verse_number=4
  JOIN _s341_2sa02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=5 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-2-david-anointed-king-over-the-house-of-yahudah-at-hebron'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'2 Samuel 5:5 — *seven years and six months* over Yahudah: the exact span counted in 2 Samuel 2:11.'
  FROM cross_reference_threads t
  JOIN _s341_2sa02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=2 AND sv.verse_number=11
  JOIN _s341_2sa02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=5 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-2-david-anointed-king-over-the-house-of-yahudah-at-hebron'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'1 Chronicles 12:23 — the bands came to Hebron *according to the word of Yahuah*: the throne given.'
  FROM cross_reference_threads t
  JOIN _s341_2sa02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=2 AND sv.verse_number=4
  JOIN _s341_2sa02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=12 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-2-david-anointed-king-over-the-house-of-yahudah-at-hebron'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'1 Chronicles 12:38 — the tribes *of one heart* at Hebron: the south-first anointing gathered to the whole.'
  FROM cross_reference_threads t
  JOIN _s341_2sa02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=2 AND sv.verse_number=4
  JOIN _s341_2sa02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=12 AND tv.verse_number=38
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-2-david-anointed-king-over-the-house-of-yahudah-at-hebron'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'1 Samuel 31:11 — Jabesh-gilead hears what was done to Saul: the kindness David now blesses.'
  FROM cross_reference_threads t
  JOIN _s341_2sa02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=2 AND sv.verse_number=5
  JOIN _s341_2sa02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=31 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-2-blessed-be-ye-of-yahuah-kindness-to-the-buriers-of-saul'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'1 Samuel 31:12 — the valiant men go by night to recover Saul''s body from the wall: the chesed requited.'
  FROM cross_reference_threads t
  JOIN _s341_2sa02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=2 AND sv.verse_number=5
  JOIN _s341_2sa02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=31 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-2-blessed-be-ye-of-yahuah-kindness-to-the-buriers-of-saul'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'1 Samuel 31:13 — buried under a tree, seven days'' fast: the burial David answers with kindness and truth.'
  FROM cross_reference_threads t
  JOIN _s341_2sa02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=2 AND sv.verse_number=5
  JOIN _s341_2sa02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=31 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-2-blessed-be-ye-of-yahuah-kindness-to-the-buriers-of-saul'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Ezekiel 37:16 — the two sticks, Yahudah and Joseph-Ephraim: the very division opened here.'
  FROM cross_reference_threads t
  JOIN _s341_2sa02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=2 AND sv.verse_number=9
  JOIN _s341_2sa02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-2-the-two-houses-divided-the-wound-the-prophets-heal'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Ezekiel 37:17 — *they shall become one in thine hand*: the division is real but not the last word.'
  FROM cross_reference_threads t
  JOIN _s341_2sa02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=2 AND sv.verse_number=9
  JOIN _s341_2sa02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-2-the-two-houses-divided-the-wound-the-prophets-heal'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Ezekiel 37:19 — Joseph''s stick joined to Yahudah''s, one in Yahuah''s hand: the two-stick split rejoined.'
  FROM cross_reference_threads t
  JOIN _s341_2sa02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=2 AND sv.verse_number=10
  JOIN _s341_2sa02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-2-the-two-houses-divided-the-wound-the-prophets-heal'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Ezekiel 37:22 — *they shall be no more two nations*: the undoing of this very two-kingdom split.'
  FROM cross_reference_threads t
  JOIN _s341_2sa02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=2 AND sv.verse_number=10
  JOIN _s341_2sa02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-2-the-two-houses-divided-the-wound-the-prophets-heal'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Hosea 1:11 — *children of Yahudah and... Yashar''el... gathered... one head*: the two peoples named here, regathered.'
  FROM cross_reference_threads t
  JOIN _s341_2sa02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=2 AND sv.verse_number=10
  JOIN _s341_2sa02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=1 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-2-the-two-houses-divided-the-wound-the-prophets-heal'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'2 Samuel 3:1 — *long war between the house of Saul and the house of David*: the two-house wound that bleeds.'
  FROM cross_reference_threads t
  JOIN _s341_2sa02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=2 AND sv.verse_number=10
  JOIN _s341_2sa02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=3 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-2-the-two-houses-divided-the-wound-the-prophets-heal'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'2 Samuel 2:26 — the *play* of v.14 turns to a sword that devours; Abner names the bitter end.'
  FROM cross_reference_threads t
  JOIN _s341_2sa02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=2 AND sv.verse_number=14
  JOIN _s341_2sa02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=2 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-2-the-sword-devoured-the-brethren-at-the-pool-of-gibeon'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'2 Samuel 2:26 — the mutual slaughter of v.16 is the sword devouring *brethren*: civil war within the one people.'
  FROM cross_reference_threads t
  JOIN _s341_2sa02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=2 AND sv.verse_number=16
  JOIN _s341_2sa02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=2 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-2-the-sword-devoured-the-brethren-at-the-pool-of-gibeon'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'2 Samuel 2:28 — the trumpet halts the killing of Yashar''el: Abner''s plea answered, the brethren-war stayed.'
  FROM cross_reference_threads t
  JOIN _s341_2sa02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=2 AND sv.verse_number=26
  JOIN _s341_2sa02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=2 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-2-the-sword-devoured-the-brethren-at-the-pool-of-gibeon'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2-samuel_3.sql (2 Samuel 3) -----
-- 2 Samuel 3 — the kingdom moving toward two-house unity; the innocent king clear of
--   bloodguilt; vengeance left to Yahuah. Tag 2sa03. Session s341. Sort band 37300 step 3.
--   View: _s341_2sa03_lookup. SOURCE every row 'canon','2-samuel',3,v.
--
-- 2 Samuel 3 coverage:
--   v.1   NT:     none warranted
--         Extras: none warranted
--         Tanakh: 2-samuel 5:1-3 (all tribes anoint), ezekiel 37:22, jeremiah 31:10  [THREAD 1]
--   v.2-5 NT:     none warranted (Hebron sons genealogy)
--         Extras: none warranted
--         Tanakh: none warranted
--   v.6-8 NT:     none warranted (Abner/Ish-bosheth quarrel)
--         Extras: none warranted
--         Tanakh: none warranted
--   v.9-10 NT:    none warranted
--         Extras: none warranted
--         Tanakh: 2-samuel 5:1-3; ezekiel 37:22; jeremiah 31:10  [THREAD 1 — translate kingdom, throne over both houses]
--   v.11-16 NT:   none warranted (Michal restored)
--         Extras: none warranted
--         Tanakh: none warranted
--   v.17-18 NT:   none warranted
--         Extras: none warranted
--         Tanakh: 2-samuel 5:1-3 (elders of Israel come to David)  [THREAD 1]
--   v.19-26 NT:   none warranted (Abner's embassy; Joab's suspicion)
--         Extras: none warranted
--         Tanakh: none warranted
--   v.21  NT:     none warranted
--         Extras: none warranted
--         Tanakh: 2-samuel 5:3 (gather all Israel, make a league)  [THREAD 1]
--   v.27,30 NT:   none warranted
--         Extras: none warranted
--         Tanakh: 2-samuel 2:23 (Asahel slain under fifth rib); numbers 35:19-21; deuteronomy 19:11-13  [THREAD 2 — blood for blood outside the law]
--   v.28-29 NT:   romans 12:19 (vengeance is mine)
--         Extras: none warranted
--         Tanakh: 1-kings 2:5; 1-kings 2:32; psalms 7:16  [THREAD 3 — guiltless of blood; vengeance to Yahuah]
--   v.31-37 NT:   none warranted (David mourns Abner; a prince fallen)
--         Extras: none warranted
--         Tanakh: covered under THREAD 3 framing (the king clears himself publicly)
--   v.38  NT:     none warranted
--         Extras: none warranted
--         Tanakh: covered under THREAD 3
--   v.39  NT:     romans 12:19  [THREAD 3]
--         Extras: none warranted
--         Tanakh: 1-kings 2:32; psalms 7:16  [THREAD 3]
--
-- THREADS:
--   2-samuel-3-translate-the-kingdom-and-set-up-the-throne-of-david-over-both-houses
--       (Tanakh: 2-samuel 5; ezekiel 37; jeremiah 31) — free
--   2-samuel-3-joab-smote-abner-for-the-blood-of-his-brother-blood-for-blood-outside-the-law
--       (Tanakh: 2-samuel 2; numbers 35; deuteronomy 19) — free
--   2-samuel-3-i-and-my-kingdom-are-guiltless-vengeance-belongs-to-yahuah
--       (Tanakh: 1-kings 2; psalms 7 | NT: romans 12) — free
--
-- Framework-load-bearing notes:
--   THREAD 1: Abner's pledge to "translate the kingdom... and set up the throne of David over
--     Yashar'el and over Yahudah, from Dan even to Beersheba" (3:9-10) is the move toward the
--     ONE kingdom over BOTH houses — read forward to Ezekiel 37:22 (no more two nations) and
--     Jeremiah 31:10 (He that scattered Israel will gather him). Not replacement; the regathering.
--   THREAD 3: David leaves vengeance to Yahuah (3:39) — the SAME principle Paul quotes from
--     Torah at Romans 12:19. NOT abolishing the law's blood-guilt; the law itself reserved
--     vengeance to Yahuah and his ordained avenger (Num 35), and David honors that order.

CREATE TEMP VIEW _s341_2sa03_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================ cross_references ============================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
  -- THREAD 1 — translate the kingdom; the throne of David over both houses
  ('canon','2-samuel',3,1,'canon','2-samuel',5,1,'free',
   E'*Then came all the tribes of Yashar''el (Israel) to David unto Hebron, and spake, saying, Behold, we are thy bone and thy flesh* (2 Samuel 5:1). The long war ends where it was tending: *but David waxed stronger and stronger, and the house of Saul waxed weaker and weaker* (3:1) — the seed-line king prevailing until ALL the tribes, not Yahudah only, come to own him as their own bone and flesh.'),
  ('canon','2-samuel',3,10,'canon','2-samuel',5,3,'free',
   E'*So all the elders of Yashar''el (Israel) came to the king to Hebron; and king David made a league with them in Hebron before Yahuah (LORD): and they anointed David king over Yashar''el (Israel)* (2 Samuel 5:3). Abner''s pledge — *to set up the throne of David over Yashar''el (Israel) and over Yahudah (Judah), from Dan even to Beer-sheba* (3:10) — is fulfilled two chapters on when the elders of the whole house come and anoint David king over all.'),
  ('canon','2-samuel',3,10,'canon','ezekiel',37,22,'free',
   E'*And I will make them one nation in the land upon the mountains of Yashar''el (Israel); and one king shall be king to them all: and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* (Ezekiel 37:22). David''s one throne *over Yashar''el (Israel) and over Yahudah (Judah)* (3:10) is the pattern the prophet later names outright: the two houses made one nation under one king, never two kingdoms again.'),
  ('canon','2-samuel',3,12,'canon','jeremiah',31,10,'free',
   E'*Hear the word of Yahuah (LORD), O ye nations, and declare it in the isles afar off, and say, He that scattered Yashar''el (Israel) will gather him, and keep him, as a shepherd doth his flock* (Jeremiah 31:10). Abner''s offer *to bring about all Yashar''el (Israel) unto thee* (3:12) is the early shadow of the great ingathering — the scattered house brought back to one shepherd-king.'),
  ('canon','2-samuel',3,18,'canon','2-samuel',5,2,'free',
   E'*Also in time past, when Saul was king over us, thou wast he that leddest out and broughtest in Yashar''el (Israel): and Yahuah (LORD) said to thee, Thou shalt feed my people Yashar''el (Israel), and thou shalt be a captain over Yashar''el (Israel)* (2 Samuel 5:2). Abner recalls the very word: *Yahuah (LORD) hath spoken of David, saying, By the hand of my servant David I will save my people Yashar''el (Israel)* (3:18) — the shepherd-deliverer set over the whole flock.'),
  ('canon','2-samuel',3,21,'canon','2-samuel',5,3,'free',
   E'*And king David made a league with them in Hebron before Yahuah (LORD): and they anointed David king over Yashar''el (Israel)* (2 Samuel 5:3). Abner''s intent — *I will arise and go, and will gather all Yashar''el (Israel) unto my lord the king, that they may make a league with thee* (3:21) — is the very league struck in 5:3, the whole house brought into covenant with the one king.'),

  -- THREAD 2 — Joab smote Abner for his brother''s blood: blood for blood outside the law
  ('canon','2-samuel',3,27,'canon','2-samuel',2,23,'free',
   E'*Howbeit he refused to turn aside: wherefore Abner with the hinder end of the spear smote him under the fifth rib, that the spear came out behind him; and he fell down there, and died in the same place* (2 Samuel 2:23). Asahel fell in open battle, after Abner twice warned him to turn aside; yet *Joab took him aside in the gate to speak with him quietly, and smote him there under the fifth rib, that he died, for the blood of Asahel his brother* (3:27) — Joab repays a battle-death with a treacherous one, the same wound, in cold blood.'),
  ('canon','2-samuel',3,27,'canon','numbers',35,21,'free',
   E'*Or in enmity smite him with his hand, that he die: he that smote him shall surely be put to death; for he is a murderer: the revenger of blood shall slay the murderer, when he meeteth him* (Numbers 35:21). The Torah sharply parts the man who kills *at unawares* (Numbers 35:11) from the one who kills *in enmity* — and Joab killing Abner *for the blood of Asahel his brother* (3:27) is murder by enmity, not the avenger''s lawful act, for Abner had slain Asahel *at unawares* in war.'),
  ('canon','2-samuel',3,30,'canon','numbers',35,19,'free',
   E'*The revenger of blood himself shall slay the murderer: when he meeteth him, he shall slay him* (Numbers 35:19). Joab and Abishai claim the avenger''s right — *because he had slain their brother Asahel at Gibeon in the battle* (3:30) — but the law gives the avenger only the proven murderer (Numbers 35:24), not the man who killed in open battle; they take the form of the statute while breaking its substance.'),
  ('canon','2-samuel',3,30,'canon','deuteronomy',19,11,'free',
   E'*But if any man hate his neighbour, and lie in wait for him, and rise up against him, and smite him mortally that he die, and fleeth into one of these cities; Then the elders of his city shall send and fetch him thence, and deliver him into the hand of the avenger of blood, that he may die* (Deuteronomy 19:11-12). Joab *lying in wait* in the gate is the very portrait the Torah condemns — the deceitful slayer the cities of refuge could not shelter, slaying *Asahel at Gibeon in the battle* (3:30) made the pretext for a murder of hatred.'),

  -- THREAD 3 — I and my kingdom are guiltless; vengeance belongs to Yahuah
  ('canon','2-samuel',3,28,'canon','1-kings',2,5,'free',
   E'*Moreover thou knowest also what Joab the son of Zeruiah did to me, and what he did to the two captains of the hosts of Yashar''el (Israel), unto Abner the son of Ner, and unto Amasa the son of Jether, whom he slew, and shed the blood of war in peace* (1 Kings 2:5). David''s clearing of himself — *I and my kingdom are guiltless before Yahuah (LORD) for ever from the blood of Abner the son of Ner* (3:28) — is held in trust to the end: on his deathbed he charges Solomon with the unpaid blood Joab shed *in peace*.'),
  ('canon','2-samuel',3,29,'canon','1-kings',2,32,'free',
   E'*And Yahuah (LORD) shall return his blood upon his own head, who fell upon two men more righteous and better than he, and slew them with the sword... to wit, Abner the son of Ner... and Amasa the son of Jether* (1 Kings 2:32). David''s word — *let it rest on the head of Joab, and on all his father''s house* (3:29) — is exactly how Yahuah settles it: the shed blood returns on the head of the one who shed it, the king''s house left clean.'),
  ('canon','2-samuel',3,39,'canon','psalms',7,16,'free',
   E'*His mischief shall return upon his own head, and his violent dealing shall come down upon his own pate* (Psalms 7:16). David''s confession of weakness — *these men the sons of Zeruiah be too hard for me: Yahuah (LORD) shall reward the doer of evil according to his wickedness* (3:39) — sings the same law of recompense David''s own psalm declares: the evildoer''s violence falls back on his own head, judgment left to Yahuah.'),
  ('canon','2-samuel',3,39,'canon','romans',12,19,'free',
   E'*Dearly beloved, avenge not yourselves, but rather give place unto wrath: for it is written, Vengeance is mine; I will repay, saith Yahuah (Lord)* (Romans 12:19). David will not take the sword against Joab in the heat of the hour but commits him to the Judge — *Yahuah (LORD) shall reward the doer of evil according to his wickedness* (3:39) — the very principle Paul draws straight out of the Torah (Deuteronomy 32:35): vengeance is not man''s to seize but Yahuah''s to repay.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s341_2sa03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s341_2sa03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================ threads ============================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-samuel-3-translate-the-kingdom-and-set-up-the-throne-of-david-over-both-houses',
       E'Translate the kingdom: the throne of David over both houses',
       E'*Now there was long war between the house of Saul and the house of David: but David waxed stronger and stronger, and the house of Saul waxed weaker and weaker* (2 Samuel 3:1). The seed-line king prevails not toward Yahudah (Judah) alone but toward the whole. Abner, breaking with the failing house of Saul, pledges *to translate the kingdom from the house of Saul, and to set up the throne of David over Yashar''el (Israel) and over Yahudah (Judah), from Dan even to Beer-sheba* (3:9-10) — the move toward the one kingdom over both houses. He carries it to the elders: *Yahuah (LORD) hath spoken of David, saying, By the hand of my servant David I will save my people Yashar''el (Israel)* (3:18), and offers *to gather all Yashar''el (Israel) unto my lord the king, that they may make a league with thee* (3:21). The fulfillment stands two chapters on: *Then came all the tribes of Yashar''el (Israel) to David unto Hebron, and spake, saying, Behold, we are thy bone and thy flesh* (2 Samuel 5:1), *and they anointed David king over Yashar''el (Israel)* (5:3). And this is the very pattern the prophets reach for when they speak of the regathering of the divided house: *I will make them one nation in the land upon the mountains of Yashar''el (Israel); and one king shall be king to them all: and they shall be no more two nations* (Ezekiel 37:22), for *He that scattered Yashar''el (Israel) will gather him, and keep him, as a shepherd doth his flock* (Jeremiah 31:10). One king, one league, one people — the throne of David over both houses.',
       sv.verse_id, ev.verse_id, 'free', 37300
  FROM _s341_2sa03_lookup sv, _s341_2sa03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=3 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='2-samuel' AND ev.chapter_number=3 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-samuel-3-joab-smote-abner-for-the-blood-of-his-brother-blood-for-blood-outside-the-law',
       E'Joab smote Abner for his brother''s blood: vengeance outside the law',
       E'Abner had killed Asahel in open battle, and only after twice pleading with him to turn back: *Turn thee aside from following me: wherefore should I smite thee to the ground?* (2 Samuel 2:22), until *Abner with the hinder end of the spear smote him under the fifth rib... and he fell down there, and died* (2:23). That is a death *at unawares* in war. But Joab repays it with treachery: *And when Abner was returned to Hebron, Joab took him aside in the gate to speak with him quietly, and smote him there under the fifth rib, that he died, for the blood of Asahel his brother* (3:27) — the same wound, but now murder by enmity. He and Abishai cloak it as the avenger''s right, *because he had slain their brother Asahel at Gibeon in the battle* (3:30). Yet the Torah carefully parts the two: *The revenger of blood himself shall slay the murderer: when he meeteth him, he shall slay him* (Numbers 35:19) — but only the proven murderer, *if he thrust him of hatred* (35:20), never the man who killed *at unawares* (35:11), who the congregation must shield. And the lying-in-wait slayer is the very one the law condemns: *if any man hate his neighbour, and lie in wait for him, and rise up against him, and smite him mortally that he die... the elders of his city shall send and fetch him thence, and deliver him into the hand of the avenger of blood, that he may die* (Deuteronomy 19:11-12). Joab takes the form of the avenger''s statute while breaking its whole substance — blood for blood outside the law.',
       sv.verse_id, ev.verse_id, 'free', 37303
  FROM _s341_2sa03_lookup sv, _s341_2sa03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=3 AND sv.verse_number=27
   AND ev.edition_slug='canon' AND ev.book_slug='2-samuel' AND ev.chapter_number=3 AND ev.verse_number=30
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-samuel-3-i-and-my-kingdom-are-guiltless-vengeance-belongs-to-yahuah',
       E'I and my kingdom are guiltless: vengeance belongs to Yahuah',
       E'David will not seize the sword to settle the murder, though it was done in his own gate. He clears himself before the whole nation: *I and my kingdom are guiltless before Yahuah (LORD) for ever from the blood of Abner the son of Ner: Let it rest on the head of Joab, and on all his father''s house* (2 Samuel 3:28-29). He rends his clothes, follows the bier, weeps at the grave, and fasts, asking *Know ye not that there is a prince and a great man fallen this day in Yashar''el (Israel)?* (3:38) — *and all the people... understood that day that it was not of the king to slay Abner* (3:37). Then, owning his own present weakness, he leaves the matter where it belongs: *I am this day weak, though anointed king; and these men the sons of Zeruiah be too hard for me: Yahuah (LORD) shall reward the doer of evil according to his wickedness* (3:39). This is the law of recompense his own psalm sings — *His mischief shall return upon his own head, and his violent dealing shall come down upon his own pate* (Psalms 7:16) — and the very word Paul lifts straight out of the Torah: *avenge not yourselves, but rather give place unto wrath: for it is written, Vengeance is mine; I will repay, saith Yahuah (Lord)* (Romans 12:19). The blood is not forgotten but committed; on his deathbed David charges it back to justice — *Yahuah (LORD) shall return his blood upon his own head, who fell upon two men more righteous and better than he* (1 Kings 2:32), leaving the king''s house clean and the wrong repaid by Yahuah, not by man''s hand.',
       sv.verse_id, ev.verse_id, 'free', 37306
  FROM _s341_2sa03_lookup sv, _s341_2sa03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=3 AND sv.verse_number=28
   AND ev.edition_slug='canon' AND ev.book_slug='2-samuel' AND ev.chapter_number=3 AND ev.verse_number=39
ON CONFLICT (slug) DO NOTHING;

-- ============================ thread_members ============================
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Behold, we are thy bone and thy flesh* (2 Samuel 5:1) — all the tribes, not Yahudah only, come to the king who *waxed stronger and stronger* (3:1).'
  FROM cross_reference_threads t
  JOIN _s341_2sa03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=3 AND sv.verse_number=1
  JOIN _s341_2sa03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=5 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-3-translate-the-kingdom-and-set-up-the-throne-of-david-over-both-houses'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*They anointed David king over Yashar''el (Israel)* (2 Samuel 5:3) — the throne *over Yashar''el and over Yahudah* (3:10) fulfilled.'
  FROM cross_reference_threads t
  JOIN _s341_2sa03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=3 AND sv.verse_number=10
  JOIN _s341_2sa03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=5 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-3-translate-the-kingdom-and-set-up-the-throne-of-david-over-both-houses'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*One king shall be king to them all... no more two nations* (Ezekiel 37:22) — the two-house unity David''s one throne foreshadows.'
  FROM cross_reference_threads t
  JOIN _s341_2sa03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=3 AND sv.verse_number=10
  JOIN _s341_2sa03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-3-translate-the-kingdom-and-set-up-the-throne-of-david-over-both-houses'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*He that scattered Yashar''el will gather him* (Jeremiah 31:10) — Abner''s offer to *bring about all Yashar''el unto thee* (3:12) is the early shadow of the ingathering.'
  FROM cross_reference_threads t
  JOIN _s341_2sa03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=3 AND sv.verse_number=12
  JOIN _s341_2sa03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-3-translate-the-kingdom-and-set-up-the-throne-of-david-over-both-houses'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Thou shalt feed my people Yashar''el... a captain over Yashar''el* (2 Samuel 5:2) — the word Abner recalls in 3:18, the shepherd-deliverer over the whole flock.'
  FROM cross_reference_threads t
  JOIN _s341_2sa03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=3 AND sv.verse_number=18
  JOIN _s341_2sa03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=5 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-3-translate-the-kingdom-and-set-up-the-throne-of-david-over-both-houses'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*King David made a league with them* (2 Samuel 5:3) — the league Abner sets out to gather *all Yashar''el* into (3:21).'
  FROM cross_reference_threads t
  JOIN _s341_2sa03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=3 AND sv.verse_number=21
  JOIN _s341_2sa03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=5 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-3-translate-the-kingdom-and-set-up-the-throne-of-david-over-both-houses'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Abner... smote him under the fifth rib... and he died* (2 Samuel 2:23) — Asahel''s death in open battle, after a twice-given warning, that Joab now avenges with treachery.'
  FROM cross_reference_threads t
  JOIN _s341_2sa03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=3 AND sv.verse_number=27
  JOIN _s341_2sa03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=2 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-3-joab-smote-abner-for-the-blood-of-his-brother-blood-for-blood-outside-the-law'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*If in enmity smite him with his hand... he is a murderer* (Numbers 35:21) — the Torah''s line between killing in enmity and killing at unawares, the line Joab crosses.'
  FROM cross_reference_threads t
  JOIN _s341_2sa03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=3 AND sv.verse_number=27
  JOIN _s341_2sa03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=35 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-3-joab-smote-abner-for-the-blood-of-his-brother-blood-for-blood-outside-the-law'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*The revenger of blood himself shall slay the murderer* (Numbers 35:19) — but only the proven murderer, not the battle-slayer; Joab takes the form of the statute, not its substance.'
  FROM cross_reference_threads t
  JOIN _s341_2sa03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=3 AND sv.verse_number=30
  JOIN _s341_2sa03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=35 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-3-joab-smote-abner-for-the-blood-of-his-brother-blood-for-blood-outside-the-law'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*If any man hate his neighbour, and lie in wait for him... that he may die* (Deuteronomy 19:11-12) — the lying-in-wait slayer the cities of refuge could not shelter, the very portrait of Joab in the gate.'
  FROM cross_reference_threads t
  JOIN _s341_2sa03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=3 AND sv.verse_number=30
  JOIN _s341_2sa03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=19 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-3-joab-smote-abner-for-the-blood-of-his-brother-blood-for-blood-outside-the-law'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*What Joab... did... unto Abner... and unto Amasa... he slew, and shed the blood of war in peace* (1 Kings 2:5) — the unpaid blood David charges to Solomon on his deathbed.'
  FROM cross_reference_threads t
  JOIN _s341_2sa03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=3 AND sv.verse_number=28
  JOIN _s341_2sa03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=2 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-3-i-and-my-kingdom-are-guiltless-vengeance-belongs-to-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Yahuah shall return his blood upon his own head* (1 Kings 2:32) — exactly David''s word that it *rest on the head of Joab* (3:29); the king''s house left clean.'
  FROM cross_reference_threads t
  JOIN _s341_2sa03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=3 AND sv.verse_number=29
  JOIN _s341_2sa03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=2 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-3-i-and-my-kingdom-are-guiltless-vengeance-belongs-to-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*His mischief shall return upon his own head* (Psalms 7:16) — the same law of recompense David''s psalm sings, that he trusts in 3:39.'
  FROM cross_reference_threads t
  JOIN _s341_2sa03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=3 AND sv.verse_number=39
  JOIN _s341_2sa03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=7 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-3-i-and-my-kingdom-are-guiltless-vengeance-belongs-to-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Avenge not yourselves... Vengeance is mine; I will repay, saith Yahuah* (Romans 12:19) — the Torah principle David honors, committing Joab to the Judge rather than seizing the sword.'
  FROM cross_reference_threads t
  JOIN _s341_2sa03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=3 AND sv.verse_number=39
  JOIN _s341_2sa03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=12 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-3-i-and-my-kingdom-are-guiltless-vengeance-belongs-to-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2-samuel_4.sql (2 Samuel 4) -----
-- Chapter: 2 Samuel 4  | tag: 2sa04  | session prefix: s341
-- Sort band base: 37325, step 3  (37325, 37328, 37331)
-- Temp view: _s341_2sa04_lookup
--
-- FRAMING (the lens, per MINION_BRIEF_TANAKH.md):
--   2 Samuel 4 is a chapter of murder and the blood required. With Abner dead,
--   the house of Saul collapses; two captains of Ish-bosheth's own bands,
--   Rechab and Baanah, murder their lame king in his bed at noon, behead him,
--   and carry the head to David at Hebron expecting reward, claiming Yahuah has
--   "avenged my lord the king." David, exactly as in chapter 1 with the Amalekite
--   who claimed to have slain Saul, refuses to build his throne on the blood of
--   the anointed's house: *shall I not therefore now require his blood of your
--   hand?* (4:11). He executes them. The chapter sets the avenger-of-innocent-
--   blood principle of Genesis 9:5-6 (blood required at the hand of the shedder,
--   for man is the image of Elohim) at the foundation of David's kingship — the
--   king who will not profit from murder, the throne kept clean of innocent blood.
--   Woven in (v.4) is Mephibosheth, Jonathan's lame son, dropped and crippled in
--   flight at the news of Saul's death — set up here, gathered to David's table
--   in chapter 9: covenant-kindness to the broken heir of a fallen house, the
--   victim of the collapse shown chesed, not destroyed.
--
-- 2 Samuel 4 coverage:
--   v.1-3  Saul's son's hands feeble at Abner's death; Rechab and Baanah named,
--          sons of Rimmon the Beerothite of Benjamin
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: none warranted (narrative setup; carried by the murder threads)
--   v.4    Mephibosheth, Jonathan's lame son, dropped in flight, lame of his feet
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: 2 Samuel 9:3 + 9:7 + 9:13 (the lame heir of Saul's house
--                  brought to David's table, shown kindness for Jonathan's sake)
--   v.5-8  the two captains murder Ish-bosheth in his bed, behead him, bring the
--          head to David claiming Yahuah hath avenged the king of Saul and his seed
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: carried with the blood-required + clean-throne threads
--   v.9-11 David: *As Yahuah liveth, who hath redeemed my soul... shall I not
--          therefore now require his blood of your hand?* — the murder of a
--          righteous man in his own house upon his bed; blood required at the hand
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: Genesis 9:5 + 9:6 (your blood will I require... whoso sheddeth
--                  man's blood, by man shall his blood be shed) + Genesis 4:10
--                  (the voice of thy brother's blood crieth from the ground) +
--                  Deuteronomy 27:25 (cursed be he that taketh reward to slay the
--                  innocent); 2 Samuel 1:14-16 (the Amalekite executed for the same
--                  claim) + 1 Kings 2:31-33 (take away the innocent blood, blood
--                  return on the murderer's head) + Psalm 7:16 (his mischief shall
--                  return upon his own head)
--   v.12   David's young men slay them, cut off hands and feet, hang them; bury
--          Ish-bosheth's head in Abner's sepulchre
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: carried with the clean-throne thread (the sentence executed)
--
-- Threads (3):
--   1. 2-samuel-4-mephibosheth-the-lame-son-of-jonathan-spared-for-the-covenant
--        members: 2 Samuel 9:3 (canon/free), 2 Samuel 9:7 (canon/free),
--                 2 Samuel 9:13 (canon/free)   -> tier free
--   2. 2-samuel-4-the-blood-of-the-righteous-required-at-the-hand-of-the-shedder
--        members: Genesis 9:5 (canon/free), Genesis 9:6 (canon/free),
--                 Genesis 4:10 (canon/free), Deuteronomy 27:25 (canon/free)  -> free
--   3. 2-samuel-4-the-king-who-will-not-build-his-throne-on-innocent-blood
--        members: 2 Samuel 1:14 (canon/free), 2 Samuel 1:16 (canon/free),
--                 1 Kings 2:31 (canon/free), 1 Kings 2:32 (canon/free),
--                 1 Kings 2:33 (canon/free), Psalm 7:16 (canon/free)   -> tier free
--
-- All members are canon (Tanakh) => every thread tier_required = 'free'.
-- =====================================================================

CREATE TEMP VIEW _s341_2sa04_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================ B. cross_references ============================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: Mephibosheth, the lame son of Jonathan, spared for the covenant
    ('canon','2-samuel',4,4,'canon','2-samuel',9,3,'free',
     E'*And the king said, Is there not yet any of the house of Saul, that I may shew the kindness of Elohim (God) unto him? And Ziba said unto the king, Jonathan hath yet a son, which is lame on his feet.* (2 Samuel 9:3). The lame child introduced here — *And Jonathan, Saul''s son, had a son that was lame of his feet... as she made haste to flee, that he fell, and became lame. And his name was Mephibosheth* (2 Samuel 4:4) — is sought out by David not to destroy the fallen house but to shew it *the kindness of Elohim*: the broken heir of Saul''s line is the very one covenant-chesed reaches.'),
    ('canon','2-samuel',4,4,'canon','2-samuel',9,7,'free',
     E'*And David said unto him, Fear not: for I will surely shew thee kindness for Jonathan thy father''s sake, and will restore thee all the land of Saul thy father; and thou shalt eat bread at my table continually.* (2 Samuel 9:7). The lame son dropped in flight at *the tidings... of Saul and Jonathan* (2 Samuel 4:4) is restored and seated at the king''s table — kindness *for Jonathan thy father''s sake*, the covenant David swore to Jonathan honoured in his crippled son.'),
    ('canon','2-samuel',4,4,'canon','2-samuel',9,13,'free',
     E'*So Mephibosheth dwelt in Jerusalem: for he did eat continually at the king''s table; and was lame on both his feet.* (2 Samuel 9:13). The closing note circles back to 2 Samuel 4:4 — *lame on both his feet* — the very wound got in flight is named again, now beside the king''s bread: the victim of the house''s fall is not cut off with it but gathered in, the lame heir at the table of the anointed king.'),
    -- THREAD 2: the blood of the righteous required at the hand of the shedder
    ('canon','2-samuel',4,11,'canon','genesis',9,5,'free',
     E'*And surely your blood of your lives will I require; at the hand of every beast will I require it, and at the hand of man; at the hand of every man''s brother will I require the life of man.* (Genesis 9:5). David''s sentence — *shall I not therefore now require his blood of your hand, and take you away from the earth?* (2 Samuel 4:11) — is the Noahic charter spoken as a king''s judgment: Yahuah *will require* shed blood at the hand of the shedder, and the throne enforces it.'),
    ('canon','2-samuel',4,11,'canon','genesis',9,6,'free',
     E'*Whoso sheddeth man''s blood, by man shall his blood be shed: for in the image of Elohim (God) made he man.* (Genesis 9:6). The reason behind *when wicked men have slain a righteous person in his own house upon his bed* (2 Samuel 4:11) is that the murdered man bore *the image of Elohim* — so his blood is required *by man*, through the human magistrate; David, the king *by man*, sheds the murderers'' blood for the blood they shed.'),
    ('canon','2-samuel',4,11,'canon','genesis',4,10,'free',
     E'*And he said, What hast thou done? the voice of thy brother''s blood crieth unto me from the ground.* (Genesis 4:10). From the first murder, innocent blood does not lie silent — it *crieth* to Yahuah. The blood of Ish-bosheth, *a righteous person* slain *in his own house upon his bed* (2 Samuel 4:11), cries the same cry; David answers it as the avenger, requiring it *of your hand*.'),
    ('canon','2-samuel',4,11,'canon','deuteronomy',27,25,'free',
     E'*Cursed be he that taketh reward to slay an innocent person. And all the people shall say, Amen.* (Deuteronomy 27:25). Rechab and Baanah slew a righteous man *thinking to have brought good tidings* — expecting a reward, as the Amalekite did before them (2 Samuel 4:10). They fall under the Ebal curse exactly: *Cursed be he that taketh reward to slay an innocent person* — and David''s judgment, *shall I not therefore now require his blood of your hand* (2 Samuel 4:11), is that curse executed.'),
    -- THREAD 3: the king who will not build his throne on innocent blood
    ('canon','2-samuel',4,10,'canon','2-samuel',1,14,'free',
     E'*And David said unto him, How wast thou not afraid to stretch forth thine hand to destroy the LORD''S anointed?* (2 Samuel 1:14). David rehearses that earlier judgment as his precedent: *When one told me, saying, Behold, Saul is dead, thinking to have brought good tidings, I took hold of him, and slew him in Ziklag* (2 Samuel 4:10). The man who claimed to have slain the anointed was put to death; the king will not reward the killer of Yahuah''s anointed, then or now.'),
    ('canon','2-samuel',4,10,'canon','2-samuel',1,16,'free',
     E'*And David said unto him, Thy blood be upon thy head; for thy mouth hath testified against thee, saying, I have slain the LORD''S anointed.* (2 Samuel 1:16). *Thy blood be upon thy head* is the verdict David recalls in 2 Samuel 4:10 and now extends to the captains: by their own boast — *the head of Ish-bosheth... thine enemy* (4:8) — their mouths testify against them, and their blood is required at their own hand.'),
    ('canon','2-samuel',4,11,'canon','1-kings',2,31,'free',
     E'*And the king said unto him, Do as he hath said, and fall upon him, and bury him; that thou mayest take away the innocent blood, which Joab shed, from me, and from the house of my father.* (1 Kings 2:31). David''s dying charge keeps the same principle he set in 2 Samuel 4:11 — *require his blood of your hand* — that the throne must *take away the innocent blood* lest the guilt cling to the king and his house; the kingdom is not to be founded on unavenged murder.'),
    ('canon','2-samuel',4,11,'canon','1-kings',2,32,'free',
     E'*And Yahuah (LORD) shall return his blood upon his own head, who fell upon two men more righteous and better than he, and slew them with the sword, my father David not knowing thereof, to wit, Abner the son of Ner... and Amasa the son of Jether...* (1 Kings 2:32). The same word David spoke over Rechab and Baanah — the blood of *a righteous person* required (2 Samuel 4:11) — is spoken over Joab, who slew men *more righteous and better than he*: Yahuah *shall return his blood upon his own head*, the murderer''s blood for the blood he shed.'),
    ('canon','2-samuel',4,11,'canon','1-kings',2,33,'free',
     E'*Their blood shall therefore return upon the head of Joab, and upon the head of his seed for ever: but upon David, and upon his seed, and upon his house, and upon his throne, shall there be peace for ever from Yahuah (LORD).* (1 Kings 2:33). Here is the fruit of the principle David enacted in 2 Samuel 4: when the throne keeps itself clean of innocent blood, requiring it *of the hand* of the shedder, the murderer''s guilt stays on his own head and *peace for ever* rests on David''s house and throne.'),
    ('canon','2-samuel',4,11,'canon','psalms',7,16,'free',
     E'*His mischief shall return upon his own head, and his violent dealing shall come down upon his own pate.* (Psalm 7:16). David''s own psalm sings the law his kingship enforces: violence recoils on the violent. The captains who shed innocent blood expecting reward instead receive it back — *require his blood of your hand* (2 Samuel 4:11) — their mischief returned upon their own head.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s341_2sa04_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s341_2sa04_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================ C. threads ============================
-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-samuel-4-mephibosheth-the-lame-son-of-jonathan-spared-for-the-covenant',
       E'Mephibosheth, the Lame Son of Jonathan, Spared for the Covenant',
       E'In the midst of a chapter of murder, one verse looks ahead in mercy: *And Jonathan, Saul''s son, had a son that was lame of his feet. He was five years old when the tidings came of Saul and Jonathan out of Jezreel, and his nurse took him up, and fled: and it came to pass, as she made haste to flee, that he fell, and became lame. And his name was Mephibosheth* (2 Samuel 4:4). He is the wounded survivor of the house''s collapse — crippled in the panic of the fall, the last male heir of Saul''s line. The narrative drops his name here and gathers it again in chapter 9, when David seeks him out: *Is there not yet any of the house of Saul, that I may shew the kindness of Elohim (God) unto him? And Ziba said unto the king, Jonathan hath yet a son, which is lame on his feet* (2 Samuel 9:3). Not vengeance on the fallen dynasty but covenant-chesed for Jonathan''s sake: *I will surely shew thee kindness for Jonathan thy father''s sake, and will restore thee all the land of Saul thy father; and thou shalt eat bread at my table continually* (2 Samuel 9:7). And the closing note seals it, naming again the wound of 4:4: *So Mephibosheth dwelt in Jerusalem: for he did eat continually at the king''s table; and was lame on both his feet* (2 Samuel 9:13). The broken heir of a fallen house is not cut off with it but seated at the king''s own table — victims shown kindness, not enemies destroyed; the covenant sworn to Jonathan kept in his crippled son.',
       sv.verse_id, ev.verse_id, 'free', 37325
  FROM _s341_2sa04_lookup sv, _s341_2sa04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=4 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='2-samuel' AND ev.chapter_number=4 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-samuel-4-the-blood-of-the-righteous-required-at-the-hand-of-the-shedder',
       E'The Blood of the Righteous Required at the Hand of the Shedder',
       E'Two captains murder their own king in his bed and bring the head to David as a trophy, claiming Yahuah''s favour. David answers with the oldest law of blood: *How much more, when wicked men have slain a righteous person in his own house upon his bed? shall I not therefore now require his blood of your hand, and take you away from the earth?* (2 Samuel 4:11). This is the charter given to Noah for all flesh: *And surely your blood of your lives will I require; at the hand of every beast will I require it, and at the hand of man; at the hand of every man''s brother will I require the life of man* (Genesis 9:5), *Whoso sheddeth man''s blood, by man shall his blood be shed: for in the image of Elohim (God) made he man* (Genesis 9:6). Murder is no light thing because the murdered man bears the image of Elohim; his blood is *required* — and required *by man*, through the human magistrate Yahuah ordains. From the first killing, innocent blood has never lain silent: *the voice of thy brother''s blood crieth unto me from the ground* (Genesis 4:10). And the Torah lays the curse precisely on these two, who slew for reward: *Cursed be he that taketh reward to slay an innocent person. And all the people shall say, Amen* (Deuteronomy 27:25) — they came *thinking to have brought good tidings*, looking for a reward, and David, the king *by man*, hands them the wage the curse names: their own blood required of their own hand.',
       sv.verse_id, ev.verse_id, 'free', 37328
  FROM _s341_2sa04_lookup sv, _s341_2sa04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=4 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='2-samuel' AND ev.chapter_number=4 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-samuel-4-the-king-who-will-not-build-his-throne-on-innocent-blood',
       E'The King Who Will Not Build His Throne on Innocent Blood',
       E'David''s answer to the murderers is no improvised anger; it is the settled principle of his kingship, and he names the precedent himself: *When one told me, saying, Behold, Saul is dead, thinking to have brought good tidings, I took hold of him, and slew him in Ziklag, who thought that I would have given him a reward for his tidings* (2 Samuel 4:10). That was the Amalekite of chapter 1, to whom David had said *How wast thou not afraid to stretch forth thine hand to destroy the LORD''S anointed?* (2 Samuel 1:14), and *Thy blood be upon thy head; for thy mouth hath testified against thee, saying, I have slain the LORD''S anointed* (2 Samuel 1:16). David will not let his throne rise on the murder of the anointed''s house, nor reward any man who profits from such blood. This conviction outlasts him: on his deathbed he charges Solomon to *take away the innocent blood, which Joab shed, from me, and from the house of my father* (1 Kings 2:31), for *Yahuah (LORD) shall return his blood upon his own head, who fell upon two men more righteous and better than he* (1 Kings 2:32), so that *upon David, and upon his seed, and upon his house, and upon his throne, shall there be peace for ever from Yahuah (LORD)* (1 Kings 2:33). The principle is the very righteousness David sang: *His mischief shall return upon his own head, and his violent dealing shall come down upon his own pate* (Psalm 7:16). A throne kept clean of innocent blood — the murderer''s guilt left on his own head — is a throne Yahuah establishes in peace.',
       sv.verse_id, ev.verse_id, 'free', 37331
  FROM _s341_2sa04_lookup sv, _s341_2sa04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=4 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='2-samuel' AND ev.chapter_number=4 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- ============================ D. thread_members ============================
-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*that I may shew the kindness of Elohim (God) unto him... Jonathan hath yet a son, which is lame on his feet* (2 Samuel 9:3) — the lame child of 4:4 sought out for covenant-kindness, not destroyed with the fallen house.'
  FROM cross_reference_threads t
  JOIN _s341_2sa04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=4 AND sv.verse_number=4
  JOIN _s341_2sa04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=9 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-4-mephibosheth-the-lame-son-of-jonathan-spared-for-the-covenant'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*I will surely shew thee kindness for Jonathan thy father''s sake... and thou shalt eat bread at my table continually* (2 Samuel 9:7) — the heir crippled in flight (4:4) restored to the king''s table, the covenant to Jonathan kept.'
  FROM cross_reference_threads t
  JOIN _s341_2sa04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=4 AND sv.verse_number=4
  JOIN _s341_2sa04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=9 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-4-mephibosheth-the-lame-son-of-jonathan-spared-for-the-covenant'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*So Mephibosheth dwelt in Jerusalem... and was lame on both his feet* (2 Samuel 9:13) — the wound named in 4:4 named again beside the king''s bread; the victim gathered in, not cut off.'
  FROM cross_reference_threads t
  JOIN _s341_2sa04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=4 AND sv.verse_number=4
  JOIN _s341_2sa04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=9 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-4-mephibosheth-the-lame-son-of-jonathan-spared-for-the-covenant'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*your blood of your lives will I require... at the hand of every man''s brother will I require the life of man* (Genesis 9:5) — the Noahic charter David speaks as a king''s judgment: blood required at the hand of the shedder.'
  FROM cross_reference_threads t
  JOIN _s341_2sa04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=4 AND sv.verse_number=11
  JOIN _s341_2sa04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-4-the-blood-of-the-righteous-required-at-the-hand-of-the-shedder'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Whoso sheddeth man''s blood, by man shall his blood be shed: for in the image of Elohim (God) made he man* (Genesis 9:6) — the reason murder is required: the slain bears Elohim''s image; required *by man*, through the king.'
  FROM cross_reference_threads t
  JOIN _s341_2sa04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=4 AND sv.verse_number=11
  JOIN _s341_2sa04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-4-the-blood-of-the-righteous-required-at-the-hand-of-the-shedder'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the voice of thy brother''s blood crieth unto me from the ground* (Genesis 4:10) — from the first murder, innocent blood is never silent; Ish-bosheth''s blood cries the same, and David answers it.'
  FROM cross_reference_threads t
  JOIN _s341_2sa04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=4 AND sv.verse_number=11
  JOIN _s341_2sa04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-4-the-blood-of-the-righteous-required-at-the-hand-of-the-shedder'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Cursed be he that taketh reward to slay an innocent person. And all the people shall say, Amen* (Deuteronomy 27:25) — the Ebal curse on exactly these two, who slew a righteous man expecting reward; David executes the curse.'
  FROM cross_reference_threads t
  JOIN _s341_2sa04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=4 AND sv.verse_number=11
  JOIN _s341_2sa04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=27 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-4-the-blood-of-the-righteous-required-at-the-hand-of-the-shedder'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*How wast thou not afraid to stretch forth thine hand to destroy the LORD''S anointed?* (2 Samuel 1:14) — the precedent David names in 4:10: the man who claimed to slay the anointed was put to death, not rewarded.'
  FROM cross_reference_threads t
  JOIN _s341_2sa04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=4 AND sv.verse_number=10
  JOIN _s341_2sa04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=1 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-4-the-king-who-will-not-build-his-throne-on-innocent-blood'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Thy blood be upon thy head; for thy mouth hath testified against thee* (2 Samuel 1:16) — the verdict David recalls in 4:10 and extends to the captains, whose own boast condemns them.'
  FROM cross_reference_threads t
  JOIN _s341_2sa04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=4 AND sv.verse_number=10
  JOIN _s341_2sa04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=1 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-4-the-king-who-will-not-build-his-throne-on-innocent-blood'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*take away the innocent blood, which Joab shed, from me, and from the house of my father* (1 Kings 2:31) — David''s dying charge keeps the same rule of 4:11: the throne must not carry unavenged murder.'
  FROM cross_reference_threads t
  JOIN _s341_2sa04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=4 AND sv.verse_number=11
  JOIN _s341_2sa04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=2 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-4-the-king-who-will-not-build-his-throne-on-innocent-blood'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Yahuah (LORD) shall return his blood upon his own head, who fell upon two men more righteous and better than he* (1 Kings 2:32) — the murderer''s blood for the blood he shed, the very word David spoke over Rechab and Baanah.'
  FROM cross_reference_threads t
  JOIN _s341_2sa04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=4 AND sv.verse_number=11
  JOIN _s341_2sa04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=2 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-4-the-king-who-will-not-build-his-throne-on-innocent-blood'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*upon David, and upon his seed, and upon his house, and upon his throne, shall there be peace for ever from Yahuah (LORD)* (1 Kings 2:33) — the fruit of the principle of 2 Samuel 4: a throne clean of innocent blood Yahuah establishes in peace.'
  FROM cross_reference_threads t
  JOIN _s341_2sa04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=4 AND sv.verse_number=11
  JOIN _s341_2sa04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=2 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-4-the-king-who-will-not-build-his-throne-on-innocent-blood'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*His mischief shall return upon his own head, and his violent dealing shall come down upon his own pate* (Psalm 7:16) — David''s own psalm sings the law his kingship enforces; the captains'' mischief returned on their head (4:11).'
  FROM cross_reference_threads t
  JOIN _s341_2sa04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=4 AND sv.verse_number=11
  JOIN _s341_2sa04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=7 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-4-the-king-who-will-not-build-his-throne-on-innocent-blood'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2-samuel_5.sql (2 Samuel 5) -----
-- 2 Samuel 5 — David made king over ALL Yashar'el at Hebron; Zion taken (city of David);
--   kingdom established; the Philistines broken at Baal-perazim by enquiring of Yahuah.
-- TAG: 2sa05   VIEW: _s341_2sa05_lookup   SORT BAND: 37350 step 3 (37350,37353,37356,37359)
--
-- FRAME: the shepherd-king over the reunited TWO HOUSES (Yahudah + Yashar'el under one king,
--   the Davidic/Messianic pattern, the one king of Ezek 37, the good shepherd of John 10/Micah 5);
--   Zion the city of the great King (Ps 2/Ps 78); victory by enquiring of Yahuah, not by the sword.
--
-- 2 Samuel 5 coverage:
--   v.1-3 (all tribes come; bone and flesh; feed my people; anoint king over Yashar'el)
--        NT:     John 10:11,16 (good shepherd; one fold one shepherd) — WARRANTED
--        Extras: none warranted (the two-house ingathering is carried by Ezek 37 + Micah 5)
--        Tanakh: Ezek 37:22,24 (one king/one shepherd); Micah 5:2,4 (ruler who feeds);
--                1 Chron 11:1,3 (parallel); Ps 78:70,71 (David from the sheepfolds) — WARRANTED
--   v.4-5 (regnal summary; Hebron 7.5y / Jerusalem 33y over all Yashar'el and Yahudah)
--        NT/Extras/Tanakh: none warranted (folded into the anointing thread by sense)
--   v.6-9 (Jebusites; David took the strong hold of Zion = the city of David; built from Millo)
--        NT:     none warranted (Zion-as-holy-hill carried canon-internally)
--        Extras: none warranted
--        Tanakh: Ps 2:6 (my king upon my holy hill of Zion); Ps 78:68,69 (chose mount Zion,
--                built his sanctuary); 1 Chron 11:5,7 (parallel) — WARRANTED
--   v.10,12 (David grew great; Yahuah Elohim of hosts with him; kingdom exalted for his people's sake)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Ps 89:20,24,27 (found David my servant, anointed, firstborn highest of kings);
--                1 Chron 11:9 (waxed greater, Yahuah Tseva'ot with him) — WARRANTED
--   v.11 (Hiram of Tyre builds David a house) — none warranted
--   v.13-16 (concubines/wives; sons born at Jerusalem incl. Nathan, Solomon) — none warranted (genealogy)
--   v.17-25 (Philistines twice; David ENQUIRES of Yahuah; Baal-perazim breach of waters; mulberry
--            trees, the sound of a going; Yahuah goes out before him)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: 1 Chron 14:10,11,15 (the exact parallel — enquired, broken forth as waters,
--                the sound of going, Elohim gone forth before thee) — WARRANTED
--
-- THREADS (all members canon → tier_required 'free'):
--   2-samuel-5-all-the-tribes-anoint-david-the-one-shepherd-king-over-the-reunited-houses
--        → Ezek 37 (Tanakh), Micah 5 (Tanakh), John 10 (NT), 1 Chron 11 (Tanakh), Ps 78 (Tanakh)
--   2-samuel-5-david-takes-the-strong-hold-of-zion-the-city-of-the-great-king
--        → Ps 2 (Tanakh), Ps 78 (Tanakh), 1 Chron 11 (Tanakh)
--   2-samuel-5-yahuah-of-hosts-was-with-him-the-kingdom-established-for-his-peoples-sake
--        → Ps 89 (Tanakh), 1 Chron 11 (Tanakh)
--   2-samuel-5-david-enquired-of-yahuah-broken-forth-as-the-breach-of-waters
--        → 1 Chron 14 (Tanakh)

CREATE TEMP VIEW _s341_2sa05_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================ B. cross_references ============================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 — all the tribes anoint David, the one shepherd-king over the reunited houses
    ('canon','2-samuel',5,1,'canon','1-chronicles',11,1,'free',
      E'*Then all Yashar''el (Israel) gathered themselves to David unto Hebron, saying, Behold, we are thy bone and thy flesh* (1 Chronicles 11:1). The Chronicler tells the same hour: not a tribe holding back, but *all Yashar''el* owning David as kindred — the very confession of *Then came all the tribes of Yashar''el (Israel) to David unto Hebron... Behold, we are thy bone and thy flesh* (2 Samuel 5:1). Bone-and-flesh is covenant kinship, the two houses gathered to one head.'),
    ('canon','2-samuel',5,2,'canon','ezekiel',37,24,'free',
      E'*And David my servant shall be king over them; and they all shall have one shepherd: they shall also walk in my judgments, and observe my statutes, and do them* (Ezekiel 37:24). The word over David at Hebron — *Thou shalt feed my people Yashar''el (Israel), and thou shalt be a captain over Yashar''el* (2 Samuel 5:2) — is the seed of the prophet''s vision: one shepherd-king over the regathered houses who keeps and teaches the Torah, never abolishes it.'),
    ('canon','2-samuel',5,2,'canon','john',10,11,'free',
      E'*I am the good shepherd: the good shepherd giveth his life for the sheep* (John 10:11). David is told to *feed my people Yashar''el* (2 Samuel 5:2); the Formed Son fills the shepherd-king pattern, the greater David who lays down his life for the flock he feeds.'),
    ('canon','2-samuel',5,2,'canon','john',10,16,'free',
      E'*And other sheep I have, which are not of this fold: them also I must bring, and they shall hear my voice; and there shall be one fold, and one shepherd* (John 10:16). The captain who feeds *my people Yashar''el* (2 Samuel 5:2) prefigures the one shepherd who gathers BOTH folds — the scattered house of Yashar''el back with Yahudah — into one flock, exactly the two sticks made one of Ezekiel 37.'),
    ('canon','2-samuel',5,2,'canon','micah',5,4,'free',
      E'*And he shall stand and feed in the strength of Yahuah (LORD), in the majesty of the name of Yahuah Elohav (the LORD his God); and they shall abide: for now shall he be great unto the ends of the earth* (Micah 5:4). The ruler out of Beth-lehem Ephratah feeds the flock as David was charged to *feed my people Yashar''el* (2 Samuel 5:2) — the Bethlehem shepherd-king whose dominion reaches the ends of the earth.'),
    ('canon','2-samuel',5,2,'canon','psalms',78,71,'free',
      E'*From following the ewes great with young he brought him to feed Jacob his people, and Yashar''el (Israel) his inheritance* (Psalm 78:71). The psalm sings the same calling Hebron speaks: the shepherd of literal ewes raised up *to feed my people Yashar''el* (2 Samuel 5:2) — Yahuah''s flock entrusted to David''s hand.'),
    ('canon','2-samuel',5,3,'canon','1-chronicles',11,3,'free',
      E'*Therefore came all the elders of Yashar''el (Israel) to the king to Hebron; and David made a covenant with them in Hebron before Yahuah (LORD); and they anointed David king over Yashar''el (Israel), according to the word of Yahuah (LORD) by Samuel* (1 Chronicles 11:3). The Chronicler adds that the anointing of *king over Yashar''el* (2 Samuel 5:3) was *according to the word of Yahuah by Samuel* — the league at Hebron fulfils the prophetic decree, not mere politics.'),
    ('canon','2-samuel',5,3,'canon','ezekiel',37,22,'free',
      E'*And I will make them one nation in the land upon the mountains of Yashar''el (Israel); and one king shall be king to them all: and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* (Ezekiel 37:22). When *they anointed David king over Yashar''el* (2 Samuel 5:3), the two houses stood under one head — the foretaste of the day the divided kingdoms are *no more two nations* under the one Davidic king.'),
    ('canon','2-samuel',5,3,'canon','micah',5,2,'free',
      E'*But thou, Beth-lehem Ephratah, though thou be little among the thousands of Yahudah (Judah), yet out of thee shall he come forth unto me that is to be ruler in Yashar''el (Israel); whose goings forth have been from of old, from everlasting* (Micah 5:2). David — anointed *king over Yashar''el* (2 Samuel 5:3) — comes from Bethlehem of Ephratah; the prophet reaches past him to the ruler whose goings forth are from everlasting, the Formed Son drawn from the Formless.'),

    -- THREAD 2 — David takes the strong hold of Zion, the city of the great King
    ('canon','2-samuel',5,7,'canon','psalms',2,6,'free',
      E'*Yet have I set my king upon my holy hill of Zion* (Psalm 2:6). *Nevertheless David took the strong hold of Zion: the same is the city of David* (2 Samuel 5:7). The Jebusite fortress David seizes becomes Yahuah''s holy hill, the seat of the anointed king the heathen rage against in vain.'),
    ('canon','2-samuel',5,7,'canon','psalms',78,68,'free',
      E'*But chose the tribe of Yahudah (Judah), the mount Zion which he loved* (Psalm 78:68). The stronghold David takes — *the strong hold of Zion: the same is the city of David* (2 Samuel 5:7) — is the very mount Yahuah loved and chose; David''s conquest enacts Yahuah''s election of Zion.'),
    ('canon','2-samuel',5,7,'canon','1-chronicles',11,5,'free',
      E'*And the inhabitants of Jebus said to David, Thou shalt not come hither. Nevertheless David took the castle of Zion, which is the city of David* (1 Chronicles 11:5). The Chronicler tells the same taking of *the strong hold of Zion: the same is the city of David* (2 Samuel 5:7) — the Jebusites'' boast overturned, the fortress made the city of the king.'),
    ('canon','2-samuel',5,9,'canon','psalms',78,69,'free',
      E'*And he built his sanctuary like high palaces, like the earth which he hath established for ever* (Psalm 78:69). *So David dwelt in the fort, and called it the city of David. And David built round about from Millo and inward* (2 Samuel 5:9). David''s building of the city of David opens toward the sanctuary built on Zion, established for ever — the city of the great King.'),

    -- THREAD 3 — Yahuah of hosts was with him; the kingdom established for his people's sake
    ('canon','2-samuel',5,10,'canon','1-chronicles',11,9,'free',
      E'*So David waxed greater and greater: for Yahuah Tseva''ot (LORD of hosts) was with him* (1 Chronicles 11:9). The Chronicler echoes word for word: *And David went on, and grew great, and Yahuah Elohim (the LORD God) of hosts was with him* (2 Samuel 5:10). David''s greatness is not self-made — it is Yahuah of hosts present with him.'),
    ('canon','2-samuel',5,10,'canon','psalms',89,24,'free',
      E'*But my faithfulness and my mercy shall be with him: and in my name shall his horn be exalted* (Psalm 89:24). The psalm of the Davidic covenant unfolds why *David went on, and grew great, and Yahuah Elohim of hosts was with him* (2 Samuel 5:10): Yahuah''s own faithfulness is with David and exalts his horn.'),
    ('canon','2-samuel',5,12,'canon','psalms',89,20,'free',
      E'*I have found David my servant; with my holy oil have I anointed him* (Psalm 89:20). *And David perceived that Yahuah (LORD) had established him king over Yashar''el* (2 Samuel 5:12); the establishing David perceives is the choosing and anointing Yahuah declares in the covenant psalm — the kingdom held *for his people Yashar''el''s sake*.'),
    ('canon','2-samuel',5,12,'canon','psalms',89,27,'free',
      E'*Also I will make him my firstborn, higher than the kings of the earth* (Psalm 89:27). Yahuah *exalted his kingdom for his people Yashar''el''s (Israel''s) sake* (2 Samuel 5:12); the covenant reaches past David to the firstborn King highest of all the earth — the Davidic line crowned in the Formed Son.'),

    -- THREAD 4 — David enquired of Yahuah; broken forth as the breach of waters
    ('canon','2-samuel',5,19,'canon','1-chronicles',14,10,'free',
      E'*And David enquired of Elohim (God), saying, Shall I go up against the Philistines? and wilt thou deliver them into mine hand? And Yahuah (LORD) said unto him, Go up; for I will deliver them into thine hand* (1 Chronicles 14:10). The Chronicler records the same enquiry — *And David enquired of Yahuah (LORD), saying, Shall I go up to the Philistines? wilt thou deliver them into mine hand?* (2 Samuel 5:19). The king does not presume; he asks of Yahuah and waits for the word before he moves.'),
    ('canon','2-samuel',5,20,'canon','1-chronicles',14,11,'free',
      E'*So they came up to Baal-perazim; and David smote them there. Then David said, Elohim (God) hath broken in upon mine enemies by mine hand like the breaking forth of waters: therefore they called the name of that place Baal-perazim* (1 Chronicles 14:11). Both books name the victory by Yahuah''s hand: *Yahuah (LORD) hath broken forth upon mine enemies before me, as the breach of waters* (2 Samuel 5:20). The breach is Yahuah''s, not David''s sword.'),
    ('canon','2-samuel',5,24,'canon','1-chronicles',14,15,'free',
      E'*And it shall be, when thou shalt hear a sound of going in the tops of the mulberry trees, that then thou shalt go out to battle: for Elohim (God) is gone forth before thee to smite the host of the Philistines* (1 Chronicles 14:15). The same sign answers David''s second enquiry — *when thou hearest the sound of a going in the tops of the mulberry trees... then shall Yahuah go out before thee* (2 Samuel 5:24). Yahuah goes out before his anointed; the king follows the sound of Yahuah''s going.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s341_2sa05_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s341_2sa05_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================ C. threads ============================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-samuel-5-all-the-tribes-anoint-david-the-one-shepherd-king-over-the-reunited-houses',
       E'All the tribes anoint David — the one shepherd-king over the reunited houses',
       E'Hebron is the gathering of the divided people to one head. *Then came all the tribes of Yashar''el (Israel) to David unto Hebron, and spake, saying, Behold, we are thy bone and thy flesh* (2 Samuel 5:1) — covenant kinship, not politics, and the Chronicler agrees that *all Yashar''el gathered themselves to David... Behold, we are thy bone and thy flesh* (1 Chronicles 11:1). The charge over him is shepherd-language: *Thou shalt feed my people Yashar''el (Israel), and thou shalt be a captain over Yashar''el* (2 Samuel 5:2), and *they anointed David king over Yashar''el* — *according to the word of Yahuah (LORD) by Samuel* (1 Chronicles 11:3). This is the Davidic pattern that the prophets carry forward to the two-house ingathering: *one king shall be king to them all: and they shall be no more two nations* (Ezekiel 37:22), *and David my servant shall be king over them; and they all shall have one shepherd: they shall also walk in my judgments, and observe my statutes, and do them* (Ezekiel 37:24) — the one shepherd-king who keeps and teaches the Torah, never abolishes it. Psalm 78 sings the calling: *from following the ewes great with young he brought him to feed Jacob his people, and Yashar''el (Israel) his inheritance* (Psalm 78:71). Micah reaches past David to the everlasting ruler: *But thou, Beth-lehem Ephratah... out of thee shall he come forth unto me that is to be ruler in Yashar''el; whose goings forth have been from of old, from everlasting* (Micah 5:2), who *shall stand and feed in the strength of Yahuah* (Micah 5:4). And the Formed Son fills it whole: *I am the good shepherd: the good shepherd giveth his life for the sheep* (John 10:11) — *and other sheep I have, which are not of this fold: them also I must bring... and there shall be one fold, and one shepherd* (John 10:16). The scattered house of Yashar''el brought back with Yahudah under the greater David: the two sticks made one in his hand.',
       sv.verse_id, ev.verse_id, 'free', 37350
  FROM _s341_2sa05_lookup sv, _s341_2sa05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=5 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='2-samuel' AND ev.chapter_number=5 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-samuel-5-david-takes-the-strong-hold-of-zion-the-city-of-the-great-king',
       E'David takes the strong hold of Zion — the city of the great King',
       E'The Jebusite boast — *Except thou take away the blind and the lame, thou shalt not come in hither... David cannot come in hither* (2 Samuel 5:6) — is overturned: *Nevertheless David took the strong hold of Zion: the same is the city of David* (2 Samuel 5:7), and *David dwelt in the fort, and called it the city of David. And David built round about from Millo and inward* (2 Samuel 5:9). The Chronicler tells it the same: *David took the castle of Zion, which is the city of David* (1 Chronicles 11:5). What David seizes is no ordinary fortress; it is the mount Yahuah Himself chose and loved — *but chose the tribe of Yahudah (Judah), the mount Zion which he loved. And he built his sanctuary like high palaces, like the earth which he hath established for ever* (Psalm 78:68-69). It is the holy hill where Yahuah sets His anointed against the raging of the nations: *Yet have I set my king upon my holy hill of Zion* (Psalm 2:6). David''s conquest enacts Yahuah''s election — Zion becomes the city of David, and the city of the great King.',
       sv.verse_id, ev.verse_id, 'free', 37353
  FROM _s341_2sa05_lookup sv, _s341_2sa05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=5 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='2-samuel' AND ev.chapter_number=5 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-samuel-5-yahuah-of-hosts-was-with-him-the-kingdom-established-for-his-peoples-sake',
       E'Yahuah of hosts was with him — the kingdom established for his people''s sake',
       E'David''s rise is not self-made. *And David went on, and grew great, and Yahuah Elohim (the LORD God) of hosts was with him* (2 Samuel 5:10), which the Chronicler echoes: *So David waxed greater and greater: for Yahuah Tseva''ot (LORD of hosts) was with him* (1 Chronicles 11:9). And David reads the meaning of his own throne rightly: *David perceived that Yahuah (LORD) had established him king over Yashar''el (Israel), and that he had exalted his kingdom for his people Yashar''el''s (Israel''s) sake* (2 Samuel 5:12) — the kingdom held in trust for the flock, not for the king''s glory. The covenant psalm unfolds the whole of it: *I have found David my servant; with my holy oil have I anointed him* (Psalm 89:20); *my faithfulness and my mercy shall be with him: and in my name shall his horn be exalted* (Psalm 89:24); and the line reaches past David to its crown — *also I will make him my firstborn, higher than the kings of the earth* (Psalm 89:27). The Davidic throne, established by Yahuah''s own faithfulness for the sake of His people, opens toward the firstborn King highest of all the earth, the Formed Son in whom the covenant stands for ever.',
       sv.verse_id, ev.verse_id, 'free', 37356
  FROM _s341_2sa05_lookup sv, _s341_2sa05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=5 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='2-samuel' AND ev.chapter_number=5 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-samuel-5-david-enquired-of-yahuah-broken-forth-as-the-breach-of-waters',
       E'David enquired of Yahuah — broken forth as the breach of waters',
       E'Twice the Philistines spread themselves in the valley of Rephaim, and twice David refuses to presume. *And David enquired of Yahuah (LORD), saying, Shall I go up to the Philistines? wilt thou deliver them into mine hand?* (2 Samuel 5:19) — the Chronicler records the same asking: *David enquired of Elohim (God)... And Yahuah (LORD) said unto him, Go up; for I will deliver them into thine hand* (1 Chronicles 14:10). The victory is named as Yahuah''s alone: *Yahuah (LORD) hath broken forth upon mine enemies before me, as the breach of waters* (2 Samuel 5:20) — *Elohim (God) hath broken in upon mine enemies by mine hand like the breaking forth of waters* (1 Chronicles 14:11). And when the enemy returns, the answer is not a charge but a sign to wait for: *when thou hearest the sound of a going in the tops of the mulberry trees... then shall Yahuah (LORD) go out before thee, to smite the host of the Philistines* (2 Samuel 5:24) — *for Elohim is gone forth before thee* (1 Chronicles 14:15). The anointed king conquers by enquiring of Yahuah and following the sound of Yahuah''s going before him — the pattern of the kingdom won by the word of Yahuah, not by the sword of man.',
       sv.verse_id, ev.verse_id, 'free', 37359
  FROM _s341_2sa05_lookup sv, _s341_2sa05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=5 AND sv.verse_number=19
   AND ev.edition_slug='canon' AND ev.book_slug='2-samuel' AND ev.chapter_number=5 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

-- ============================ D. thread_members ============================
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'1 Chronicles 11:1 — *all Yashar''el gathered... Behold, we are thy bone and thy flesh*: the same kinship-confession at Hebron.'
  FROM cross_reference_threads t
  JOIN _s341_2sa05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=5 AND sv.verse_number=1
  JOIN _s341_2sa05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=11 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-5-all-the-tribes-anoint-david-the-one-shepherd-king-over-the-reunited-houses'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Ezekiel 37:24 — *David my servant shall be king over them... one shepherd... walk in my judgments*: the Torah-keeping shepherd-king David''s charge to feed Yashar''el foreshadows.'
  FROM cross_reference_threads t
  JOIN _s341_2sa05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=5 AND sv.verse_number=2
  JOIN _s341_2sa05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-5-all-the-tribes-anoint-david-the-one-shepherd-king-over-the-reunited-houses'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'John 10:11 — *I am the good shepherd... giveth his life for the sheep*: the Formed Son fills the shepherd-king charged to feed my people.'
  FROM cross_reference_threads t
  JOIN _s341_2sa05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=5 AND sv.verse_number=2
  JOIN _s341_2sa05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=10 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-5-all-the-tribes-anoint-david-the-one-shepherd-king-over-the-reunited-houses'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'John 10:16 — *other sheep I have... one fold, and one shepherd*: both folds gathered, the two-house ingathering of Ezekiel 37.'
  FROM cross_reference_threads t
  JOIN _s341_2sa05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=5 AND sv.verse_number=2
  JOIN _s341_2sa05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=10 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-5-all-the-tribes-anoint-david-the-one-shepherd-king-over-the-reunited-houses'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Micah 5:4 — *he shall stand and feed in the strength of Yahuah... great unto the ends of the earth*: the Bethlehem ruler who feeds the flock.'
  FROM cross_reference_threads t
  JOIN _s341_2sa05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=5 AND sv.verse_number=2
  JOIN _s341_2sa05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=5 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-5-all-the-tribes-anoint-david-the-one-shepherd-king-over-the-reunited-houses'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Psalm 78:71 — *from following the ewes... to feed Jacob his people, and Yashar''el his inheritance*: the shepherd raised to feed the flock.'
  FROM cross_reference_threads t
  JOIN _s341_2sa05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=5 AND sv.verse_number=2
  JOIN _s341_2sa05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=78 AND tv.verse_number=71
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-5-all-the-tribes-anoint-david-the-one-shepherd-king-over-the-reunited-houses'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'1 Chronicles 11:3 — *they anointed David king over Yashar''el, according to the word of Yahuah by Samuel*: the anointing fulfils the prophetic decree.'
  FROM cross_reference_threads t
  JOIN _s341_2sa05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=5 AND sv.verse_number=3
  JOIN _s341_2sa05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=11 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-5-all-the-tribes-anoint-david-the-one-shepherd-king-over-the-reunited-houses'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'Ezekiel 37:22 — *one king shall be king to them all... no more two nations*: the two houses under one head, foretasted at Hebron.'
  FROM cross_reference_threads t
  JOIN _s341_2sa05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=5 AND sv.verse_number=3
  JOIN _s341_2sa05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-5-all-the-tribes-anoint-david-the-one-shepherd-king-over-the-reunited-houses'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'Micah 5:2 — *Beth-lehem Ephratah... ruler in Yashar''el; whose goings forth have been from of old, from everlasting*: past David to the everlasting Formed Son.'
  FROM cross_reference_threads t
  JOIN _s341_2sa05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=5 AND sv.verse_number=3
  JOIN _s341_2sa05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=5 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-5-all-the-tribes-anoint-david-the-one-shepherd-king-over-the-reunited-houses'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Psalm 2:6 — *Yet have I set my king upon my holy hill of Zion*: the fortress David takes is Yahuah''s holy hill, seat of the anointed.'
  FROM cross_reference_threads t
  JOIN _s341_2sa05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=5 AND sv.verse_number=7
  JOIN _s341_2sa05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-5-david-takes-the-strong-hold-of-zion-the-city-of-the-great-king'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Psalm 78:68 — *chose... the mount Zion which he loved*: David''s conquest enacts Yahuah''s election of Zion.'
  FROM cross_reference_threads t
  JOIN _s341_2sa05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=5 AND sv.verse_number=7
  JOIN _s341_2sa05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=78 AND tv.verse_number=68
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-5-david-takes-the-strong-hold-of-zion-the-city-of-the-great-king'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'1 Chronicles 11:5 — *David took the castle of Zion, which is the city of David*: the Chronicler''s parallel taking of the stronghold.'
  FROM cross_reference_threads t
  JOIN _s341_2sa05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=5 AND sv.verse_number=7
  JOIN _s341_2sa05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=11 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-5-david-takes-the-strong-hold-of-zion-the-city-of-the-great-king'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Psalm 78:69 — *he built his sanctuary... established for ever*: the city of David opens toward the sanctuary on Zion.'
  FROM cross_reference_threads t
  JOIN _s341_2sa05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=5 AND sv.verse_number=9
  JOIN _s341_2sa05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=78 AND tv.verse_number=69
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-5-david-takes-the-strong-hold-of-zion-the-city-of-the-great-king'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'1 Chronicles 11:9 — *David waxed greater and greater: for Yahuah Tseva''ot was with him*: the same greatness, the same reason.'
  FROM cross_reference_threads t
  JOIN _s341_2sa05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=5 AND sv.verse_number=10
  JOIN _s341_2sa05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=11 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-5-yahuah-of-hosts-was-with-him-the-kingdom-established-for-his-peoples-sake'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Psalm 89:24 — *my faithfulness and my mercy shall be with him: and in my name shall his horn be exalted*: why Yahuah of hosts was with David.'
  FROM cross_reference_threads t
  JOIN _s341_2sa05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=5 AND sv.verse_number=10
  JOIN _s341_2sa05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=89 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-5-yahuah-of-hosts-was-with-him-the-kingdom-established-for-his-peoples-sake'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Psalm 89:20 — *I have found David my servant; with my holy oil have I anointed him*: the establishing David perceives is Yahuah''s choosing.'
  FROM cross_reference_threads t
  JOIN _s341_2sa05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=5 AND sv.verse_number=12
  JOIN _s341_2sa05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=89 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-5-yahuah-of-hosts-was-with-him-the-kingdom-established-for-his-peoples-sake'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Psalm 89:27 — *I will make him my firstborn, higher than the kings of the earth*: the throne for his people''s sake crowned in the firstborn King.'
  FROM cross_reference_threads t
  JOIN _s341_2sa05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=5 AND sv.verse_number=12
  JOIN _s341_2sa05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=89 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-5-yahuah-of-hosts-was-with-him-the-kingdom-established-for-his-peoples-sake'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'1 Chronicles 14:10 — *David enquired of Elohim... Go up; for I will deliver them into thine hand*: the king asks before he moves.'
  FROM cross_reference_threads t
  JOIN _s341_2sa05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=5 AND sv.verse_number=19
  JOIN _s341_2sa05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=14 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-5-david-enquired-of-yahuah-broken-forth-as-the-breach-of-waters'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'1 Chronicles 14:11 — *Elohim hath broken in upon mine enemies... like the breaking forth of waters*: the victory is Yahuah''s, not the sword.'
  FROM cross_reference_threads t
  JOIN _s341_2sa05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=5 AND sv.verse_number=20
  JOIN _s341_2sa05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=14 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-5-david-enquired-of-yahuah-broken-forth-as-the-breach-of-waters'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'1 Chronicles 14:15 — *when thou shalt hear a sound of going in the tops of the mulberry trees... Elohim is gone forth before thee*: follow the sound of Yahuah''s going.'
  FROM cross_reference_threads t
  JOIN _s341_2sa05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=5 AND sv.verse_number=24
  JOIN _s341_2sa05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=14 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-5-david-enquired-of-yahuah-broken-forth-as-the-breach-of-waters'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session341 — 2 Samuel cross-references complete.'
