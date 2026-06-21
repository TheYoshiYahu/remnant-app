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

-- ----- fragment: minion_2-samuel_6.sql (2 Samuel 6) -----
--
-- 2 Samuel 6 — David brings the ark of the Presence up to Zion.
-- Tag: 2sa06   View: _s341_2sa06_lookup   Sort band: base 37375 step 3.
-- SOURCE every row 'canon','2-samuel',6,v. Canon targets 'free'; extras 'extras'.
--
-- 2 Samuel 6 coverage:
--   v.2  (ark dwelleth between the cherubims) NT: Hebrews 9:4-5 (cherubims of glory)
--        Extras: none warranted   Tanakh: Exodus 25:18-22; Numbers 7:89; 1 Samuel 4:4
--        -> thread: the-ark-that-dwelleth-between-the-cherubims-the-formed-presence
--   v.3  (new cart) NT: none warranted  Extras: none warranted
--        Tanakh: 1 Samuel 6:7 (the Philistine new-cart method); 1 Chronicles 13:7
--        -> thread: the-new-cart-and-uzzahs-error-the-bearing-law-of-the-presence
--   v.6-7 (Uzzah smitten) NT: none warranted  Extras: none warranted
--        Tanakh: Numbers 4:15; Numbers 7:9; 1 Chronicles 13:9-10; 1 Chronicles 15:13-15; 1 Samuel 6:19
--        -> thread: the-new-cart-and-uzzahs-error-the-bearing-law-of-the-presence
--   v.12,17 (ark brought to its place in Zion) NT: none warranted  Extras: none warranted
--        Tanakh: Psalm 132:8,13,14 (Arise into thy rest; Yahuah chosen Zion)
--        -> thread: the-ark-into-his-rest-the-glory-enthroned-in-zion
--   v.14-15 (David danced before Yahuah, linen ephod, shouting + trumpet) NT: John 4:23 (worship the Father in spirit and in truth)
--        Extras: none warranted   Tanakh: Psalm 24:7-10 (King of glory shall come in); Psalm 132:9,16; 1 Chronicles 15:27-28
--        -> thread: david-danced-before-yahuah-the-kings-wholehearted-worship
--   v.16,20-23 (Michal despised him; barren) NT: none warranted  Extras: none warranted
--        Tanakh: 1 Chronicles 15:29 (parallel); 1 Samuel 15:23 (Saul's house rejected)
--        -> folded into the dancing thread (the contrast that proves the worship)
--   v.5,18-19 (instruments; blessing the people; bread/flesh/wine) Tanakh: 1 Chronicles 16:1-3 -> covered by 1 Chr parallels in rest thread
--
-- THREADS (5):
--   1. the-ark-that-dwelleth-between-the-cherubims-the-formed-presence   [canon: Exodus, Numbers, Hebrews]  free
--   2. the-new-cart-and-uzzahs-error-the-bearing-law-of-the-presence     [canon: Numbers, 1 Chronicles, 1 Samuel]  free
--   3. the-ark-into-his-rest-the-glory-enthroned-in-zion                 [canon: Psalm 132]  free
--   4. david-danced-before-yahuah-the-kings-wholehearted-worship         [canon: Psalm 24, Psalm 132, 1 Chronicles, John]  free
--   5. michal-despised-him-the-house-of-saul-rejected-the-worship        [canon: 1 Chronicles, 1 Samuel]  free
--
-- Framework load-bearing: v.2 cherubim-Presence = the Formed Son who HAS a Father, the visible
-- Glory enthroned on the mercy seat (Exod 25:22 "there I will meet... commune"; Num 7:89 voice
-- from between the cherubims), NOT a co-equal trinity person, NOT Arian; the ark IS the seat of
-- that Presence. v.6-7 Uzzah: the Torah's bearing-law (Num 4:15, 7:9) AFFIRMED, never the curse —
-- David's breach was abandoning the shoulder-borne ordinance for the Philistine new cart (1 Sam 6:7),
-- corrected in 1 Chr 15:13-15 ("after the due order"). v.14 the King who humbles himself in worship.

CREATE TEMP VIEW _s341_2sa06_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================================================================
-- B. cross_references
-- ============================================================================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the ark that dwelleth between the cherubims — the Formed Presence
    ('canon','2-samuel',6,2,'canon','exodus',25,18,'free',
      E'*And thou shalt make two cherubims of gold, of beaten work shalt thou make them, in the two ends of the mercy seat* (Exodus 25:18). The ark *whose name is called by the name of Yahuah Tseva''ot (LORD of hosts) that dwelleth between the cherubims* (2 Samuel 6:2) is the very seat Yahuah pattern-gave Moses — the Presence enthroned above the beaten gold, the Formed Glory who has a Father.'),
    ('canon','2-samuel',6,2,'canon','exodus',25,22,'free',
      E'*And there I will meet with thee, and I will commune with thee from above the mercy seat, from between the two cherubims which are upon the ark of the testimony* (Exodus 25:22). This is what *dwelleth between the cherubims* (2 Samuel 6:2) means: the meeting-place of the Presence, the voice of the Formed Son spoken from above the ark, not a dead box but the throne of the Glory.'),
    ('canon','2-samuel',6,2,'canon','numbers',7,89,'free',
      E'*And when Moses was gone into the tabernacle of the congregation to speak with him, then he heard the voice of one speaking unto him from off the mercy seat that was upon the ark of testimony, from between the two cherubims: and he spake unto him* (Numbers 7:89). The One who *dwelleth between the cherubims* (2 Samuel 6:2) is the One who SPEAKS — the Formed Word enthroned, the same Presence David brings up to Zion.'),
    ('canon','2-samuel',6,2,'canon','1-samuel',4,4,'free',
      E'*the ark of the covenant of Yahuah Tseva''ot (LORD of hosts), which dwelleth between the cherubims* (1 Samuel 4:4). The selfsame title Israel used at Shiloh — where the ark was taken and the glory departed (I-chabod) — David now restores to its name as he gathers it up: *whose name is called by the name of Yahuah Tseva''ot (LORD of hosts) that dwelleth between the cherubims* (2 Samuel 6:2).'),
    ('canon','2-samuel',6,2,'canon','hebrews',9,5,'free',
      E'*And over it the cherubims of glory shadowing the mercyseat* (Hebrews 9:5). The apostolic witness names the ark David bears: the *cherubims of glory* over the mercy seat — the Presence that *dwelleth between the cherubims* (2 Samuel 6:2), the throne of the Formed Glory the whole tabernacle was built to house.'),

    -- THREAD 2: the new cart and Uzzah''s error — the bearing-law of the Presence
    ('canon','2-samuel',6,3,'canon','1-samuel',6,7,'free',
      E'*Now therefore make a new cart, and take two milch kine, on which there hath come no yoke* (1 Samuel 6:7). The *new cart* (2 Samuel 6:3) is the PHILISTINE method — how the uncircumcised returned the ark from Ekron. David borrows the nations'' device for the holy thing instead of the Torah''s shoulder-borne ordinance, and the breach follows.'),
    ('canon','2-samuel',6,6,'canon','numbers',4,15,'free',
      E'*the sons of Kohath shall come to bear it: but they shall not touch any holy thing, lest they die* (Numbers 4:15). When *Uzzah put forth his hand to the ark of Elohim (God), and took hold of it* (2 Samuel 6:6), he crossed the very line the Torah drew — the most holy things borne, never touched. The bearing-law is affirmed, not abolished; the holiness is real.'),
    ('canon','2-samuel',6,6,'canon','numbers',7,9,'free',
      E'*But unto the sons of Kohath he gave none: because the service of the sanctuary belonging unto them was that they should bear upon their shoulders* (Numbers 7:9). The wagons went to Gershon and Merari — never to the ark. The ark was to ride on Levite SHOULDERS, not a cart''s axle; the oxen that *shook it* (2 Samuel 6:6) had no business under the Presence.'),
    ('canon','2-samuel',6,7,'canon','1-chronicles',13,10,'free',
      E'*And the anger of Yahuah (LORD) was kindled against Uzza, and he smote him, because he put his hand to the ark: and there he died before Elohim (God)* (1 Chronicles 13:10). The Chronicler tells the same day from the other side: *the anger of Yahuah (LORD) was kindled against Uzzah; and Elohim (God) smote him there for his error* (2 Samuel 6:7) — one event, two witnesses, the holiness of the Presence.'),
    ('canon','2-samuel',6,7,'canon','1-chronicles',15,13,'free',
      E'*For because ye did it not at the first, Yahuah Eloheinu (the LORD our God) made a breach upon us, for that we sought him not after the due order* (1 Chronicles 15:13). David himself names the error — *for his error* (2 Samuel 6:7) was the abandoned ordinance; the Levites must bear the ark *after the due order*, the Torah''s order, before it can come home.'),
    ('canon','2-samuel',6,7,'canon','1-chronicles',15,15,'free',
      E'*And the children of the Levites bare the ark of Elohim (God) upon their shoulders with the staves thereon, as Moses commanded according to the word of Yahuah (LORD)* (1 Chronicles 15:15). The correction of the breach: shoulders and staves *as Moses commanded* — the very ordinance Uzzah''s cart violated when *Elohim (God) smote him there for his error* (2 Samuel 6:7).'),
    ('canon','2-samuel',6,7,'canon','1-samuel',6,19,'free',
      E'*And he smote the men of Beth-shemesh, because they had looked into the ark of Yahuah (LORD)... and the people lamented, because Yahuah (LORD) had smitten many of the people with a great slaughter* (1 Samuel 6:19). The same lesson Beth-shemesh learned and David must relearn: the Presence is holy. *Elohim (God) smote him there for his error* (2 Samuel 6:7) — not cruelty, but the weight of the Glory that cannot be handled like a common thing.'),

    -- THREAD 3: the ark into his rest — the Glory enthroned in Zion
    ('canon','2-samuel',6,17,'canon','psalms',132,8,'free',
      E'*Arise, O Yahuah (LORD), into thy rest; thou, and the ark of thy strength* (Psalm 132:8). The psalm sings the very day: *they brought in the ark of Yahuah (LORD), and set it in his place, in the midst of the tabernacle that David had pitched for it* (2 Samuel 6:17). The ark coming to rest in Zion is the Presence entering his rest — the Glory enthroned among his people.'),
    ('canon','2-samuel',6,17,'canon','psalms',132,13,'free',
      E'*For Yahuah (LORD) hath chosen Zion; he hath desired it for his habitation. This is my rest for ever: here will I dwell; for I have desired it* (Psalm 132:13-14). David''s pitched tent in the city of David (2 Samuel 6:17) is the first dwelling of the chosen habitation; the ark *set... in his place* is the Glory taking up the rest Yahuah desired.'),
    ('canon','2-samuel',6,12,'canon','psalms',132,1,'free',
      E'*Yahuah (LORD), remember David, and all his afflictions: how he sware unto Yahuah (LORD), and vowed unto El Gibbor (the mighty God) of Jacob... Until I find out a place for Yahuah (LORD)* (Psalm 132:1-5). When *David went and brought up the ark of Elohim (God) from the house of Obed-edom into the city of David with gladness* (2 Samuel 6:12), he is finding out that place — the vow fulfilled, the habitation prepared.'),

    -- THREAD 4: David danced before Yahuah — the King''s wholehearted worship
    ('canon','2-samuel',6,15,'canon','psalms',24,7,'free',
      E'*Lift up your heads, O ye gates; and be ye lift up, ye everlasting doors; and the King of glory shall come in* (Psalm 24:7). The processional psalm of the ark''s ascent: *David and all the house of Yashar''el (Israel) brought up the ark of Yahuah (LORD) with shouting, and with the sound of the trumpet* (2 Samuel 6:15) — the Glory borne up through the gates of Zion, the King of glory coming in.'),
    ('canon','2-samuel',6,15,'canon','psalms',24,10,'free',
      E'*Who is this King of glory? Yahuah Tseva''ot (LORD of hosts), he is the King of glory* (Psalm 24:10). The very name on the ark — *Yahuah Tseva''ot (LORD of hosts) that dwelleth between the cherubims* (2 Samuel 6:2) — is the King of glory the gates lift up to receive, brought up *with shouting, and with the sound of the trumpet* (2 Samuel 6:15).'),
    ('canon','2-samuel',6,14,'canon','psalms',132,9,'free',
      E'*Let thy priests be clothed with righteousness; and let thy saints shout for joy* (Psalm 132:9). David, *girded with a linen ephod* (2 Samuel 6:14), dances as priest-king before the ark, and *all the house of Yashar''el (Israel)* shout — the priestly garment and the saints'' joy the psalm names, the King who humbles himself in worship.'),
    ('canon','2-samuel',6,14,'canon','1-chronicles',15,27,'free',
      E'*And David was clothed with a robe of fine linen... David also had upon him an ephod of linen* (1 Chronicles 15:27). The Chronicler confirms the King''s priestly dress as he *danced before Yahuah (LORD) with all his might; and David was girded with a linen ephod* (2 Samuel 6:14) — the anointed sovereign laying aside royal pomp to minister before the Presence.'),
    ('canon','2-samuel',6,14,'canon','john',4,23,'free',
      E'*But the hour cometh, and now is, when the true worshippers shall worship the Father in spirit and in truth: for the Father seeketh such to worship him* (John 4:23). David''s dance *with all his might* (2 Samuel 6:14) — and his answer to Michal''s scorn, *It was before Yahuah (LORD)... therefore will I play before Yahuah* (2 Samuel 6:21) — is worship the Father seeks: whole-hearted, abased before the Presence, in spirit and in truth.'),
    ('canon','2-samuel',6,22,'canon','psalms',132,16,'free',
      E'*I will also clothe her priests with salvation: and her saints shall shout aloud for joy* (Psalm 132:16). David''s vow, *I will yet be more vile than thus, and will be base in mine own sight... of them shall I be had in honour* (2 Samuel 6:22), is the king choosing the saints'' shouting joy over a queen''s contempt — abasement before Yahuah that ends in honour.'),

    -- THREAD 5: Michal despised him — the house of Saul rejected the worship
    ('canon','2-samuel',6,16,'canon','1-chronicles',15,29,'free',
      E'*And it came to pass, as the ark of the covenant of Yahuah (LORD) came to the city of David, that Michal the daughter of Saul looking out at a window saw king David dancing and playing: and she despised him in her heart* (1 Chronicles 15:29). The Chronicler sets the same scene — *Michal Saul''s daughter looked through a window... and she despised him in her heart* (2 Samuel 6:16) — the daughter of the rejected house scorning the worship of the chosen king.'),
    ('canon','2-samuel',6,20,'canon','1-samuel',15,23,'free',
      E'*For rebellion is as the sin of witchcraft, and stubbornness is as iniquity and idolatry. Because thou hast rejected the word of Yahuah (LORD), he hath also rejected thee from being king* (1 Samuel 15:23). Michal carries her father''s spirit when she mocks, *How glorious was the king of Yashar''el (Israel) to day, who uncovered himself* (2 Samuel 6:20) — the house of Saul, rejected for despising Yahuah''s word, despising still; her barrenness (2 Samuel 6:23) seals it.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s341_2sa06_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s341_2sa06_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================================================================
-- C. threads
-- ============================================================================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-samuel-6-the-ark-that-dwelleth-between-the-cherubims-the-formed-presence',
       E'The ark that dwelleth between the cherubims — the Formed Presence',
       E'David goes to bring up *the ark of Elohim (God), whose name is called by the name of Yahuah Tseva''ot (LORD of hosts) that dwelleth between the cherubims* (2 Samuel 6:2). The ark is not a relic but a throne. Yahuah gave Moses its pattern: *And thou shalt make two cherubims of gold, of beaten work shalt thou make them, in the two ends of the mercy seat* (Exodus 25:18), and named its purpose: *And there I will meet with thee, and I will commune with thee from above the mercy seat, from between the two cherubims* (Exodus 25:22). That meeting was no metaphor — *Moses... heard the voice of one speaking unto him from off the mercy seat that was upon the ark of testimony, from between the two cherubims: and he spake unto him* (Numbers 7:89). The One enthroned there is the Formed Glory who SPEAKS, the Son who has a Father, the visible Presence — not a co-equal abstraction. It is the selfsame title Shiloh lost when the glory departed: *the ark of the covenant of Yahuah Tseva''ot (LORD of hosts), which dwelleth between the cherubims* (1 Samuel 4:4); now David restores it. The apostolic witness names the same throne: *And over it the cherubims of glory shadowing the mercyseat* (Hebrews 9:5). To carry the ark is to carry the Presence of the Formed One up to Zion.',
       sv.verse_id, ev.verse_id, 'free', 37375
  FROM _s341_2sa06_lookup sv, _s341_2sa06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=6 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='2-samuel' AND ev.chapter_number=6 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-samuel-6-the-new-cart-and-uzzahs-error-the-bearing-law-of-the-presence',
       E'The new cart and Uzzah''s error — the bearing-law of the Presence',
       E'*They set the ark of Elohim (God) upon a new cart* (2 Samuel 6:3) — and that cart is the problem. The *new cart* is the Philistine device: *Now therefore make a new cart, and take two milch kine, on which there hath come no yoke* (1 Samuel 6:7) is how the uncircumcised returned the ark from Ekron. David borrows the nations'' method for the holy thing and bypasses the Torah''s ordinance. For the Torah is plain: the sons of Kohath *shall come to bear it: but they shall not touch any holy thing, lest they die* (Numbers 4:15), and to them no wagons were given, *because the service of the sanctuary belonging unto them was that they should bear upon their shoulders* (Numbers 7:9). So when *Uzzah put forth his hand to the ark of Elohim (God), and took hold of it; for the oxen shook it* (2 Samuel 6:6), the oxen were never meant to be there. *Elohim (God) smote him there for his error* (2 Samuel 6:7) — the same holiness Beth-shemesh felt: *he smote the men of Beth-shemesh, because they had looked into the ark of Yahuah (LORD)* (1 Samuel 6:19). The Chronicler records the breach (*the anger of Yahuah (LORD) was kindled against Uzza... because he put his hand to the ark*, 1 Chronicles 13:10) and David''s confession of the cause: *because ye did it not at the first... we sought him not after the due order* (1 Chronicles 15:13). The remedy is the Torah obeyed: *the children of the Levites bare the ark of Elohim (God) upon their shoulders with the staves thereon, as Moses commanded according to the word of Yahuah (LORD)* (1 Chronicles 15:15). The bearing-law is affirmed, never the curse — the holiness of the Presence is real, and it is approached his way.',
       sv.verse_id, ev.verse_id, 'free', 37378
  FROM _s341_2sa06_lookup sv, _s341_2sa06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=6 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='2-samuel' AND ev.chapter_number=6 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-samuel-6-the-ark-into-his-rest-the-glory-enthroned-in-zion',
       E'The ark into his rest — the Glory enthroned in Zion',
       E'When *David went and brought up the ark of Elohim (God) from the house of Obed-edom into the city of David with gladness* (2 Samuel 6:12), and *set it in his place, in the midst of the tabernacle that David had pitched for it* (2 Samuel 6:17), a vow was fulfilled. Psalm 132 sings it: *Yahuah (LORD), remember David, and all his afflictions: how he sware unto Yahuah (LORD)... Until I find out a place for Yahuah (LORD), an habitation for El Gibbor (the mighty God) of Jacob* (Psalm 132:1-5). The ark coming to rest is the Presence coming to rest: *Arise, O Yahuah (LORD), into thy rest; thou, and the ark of thy strength* (Psalm 132:8). And the place is no accident — *For Yahuah (LORD) hath chosen Zion; he hath desired it for his habitation. This is my rest for ever: here will I dwell; for I have desired it* (Psalm 132:13-14). The Glory enthroned between the cherubim takes up the dwelling Yahuah himself desired; Zion becomes the seat of the Presence.',
       sv.verse_id, ev.verse_id, 'free', 37381
  FROM _s341_2sa06_lookup sv, _s341_2sa06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=6 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='2-samuel' AND ev.chapter_number=6 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-samuel-6-david-danced-before-yahuah-the-kings-wholehearted-worship',
       E'David danced before Yahuah — the King''s wholehearted worship',
       E'*And David danced before Yahuah (LORD) with all his might; and David was girded with a linen ephod* (2 Samuel 6:14), and *all the house of Yashar''el (Israel) brought up the ark of Yahuah (LORD) with shouting, and with the sound of the trumpet* (2 Samuel 6:15). This is the processional Psalm 24 sings: *Lift up your heads, O ye gates; and be ye lift up, ye everlasting doors; and the King of glory shall come in* (Psalm 24:7) — *Who is this King of glory? Yahuah Tseva''ot (LORD of hosts), he is the King of glory* (Psalm 24:10), the very name borne on the ark (2 Samuel 6:2). David puts off royal pomp for a priest''s linen — *David was clothed with a robe of fine linen... David also had upon him an ephod of linen* (1 Chronicles 15:27) — fulfilling *Let thy priests be clothed with righteousness; and let thy saints shout for joy* (Psalm 132:9). When Michal scorns him, the king does not retreat: *It was before Yahuah (LORD)... therefore will I play before Yahuah* (2 Samuel 6:21), *And I will yet be more vile than thus, and will be base in mine own sight... of them shall I be had in honour* (2 Samuel 6:22). This is the worship the Father seeks: *the true worshippers shall worship the Father in spirit and in truth: for the Father seeketh such to worship him* (John 4:23) — and the promise answers it: *her saints shall shout aloud for joy* (Psalm 132:16). The King who humbles himself before the Presence is exalted; the worship that abases self is the worship that honours Yahuah.',
       sv.verse_id, ev.verse_id, 'free', 37384
  FROM _s341_2sa06_lookup sv, _s341_2sa06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=6 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='2-samuel' AND ev.chapter_number=6 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-samuel-6-michal-despised-him-the-house-of-saul-rejected-the-worship',
       E'Michal despised him — the house of Saul rejected the worship',
       E'*As the ark of Yahuah (LORD) came into the city of David, Michal Saul''s daughter looked through a window, and saw king David leaping and dancing before Yahuah (LORD); and she despised him in her heart* (2 Samuel 6:16). The Chronicler tells it the same: *Michal the daughter of Saul looking out at a window saw king David dancing and playing: and she despised him in her heart* (1 Chronicles 15:29). Her contempt is her father''s spirit. She mocks the king''s abasement — *How glorious was the king of Yashar''el (Israel) to day, who uncovered himself to day in the eyes of the handmaids* (2 Samuel 6:20) — the daughter of the rejected house scorning the worship of the chosen king. For the house of Saul was set aside precisely for despising Yahuah''s word: *Because thou hast rejected the word of Yahuah (LORD), he hath also rejected thee from being king* (1 Samuel 15:23). And so the scene closes: *Therefore Michal the daughter of Saul had no child unto the day of her death* (2 Samuel 6:23). The line that despised the Presence bears no fruit; the king who danced before it is *had in honour* (2 Samuel 6:22).',
       sv.verse_id, ev.verse_id, 'free', 37387
  FROM _s341_2sa06_lookup sv, _s341_2sa06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=6 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='2-samuel' AND ev.chapter_number=6 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

-- ============================================================================
-- D. thread_members
-- ============================================================================
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Exodus 25:18 — the pattern of the cherubims of beaten gold on the mercy seat, the ark''s throne.'
  FROM cross_reference_threads t
  JOIN _s341_2sa06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=6 AND sv.verse_number=2
  JOIN _s341_2sa06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=25 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-6-the-ark-that-dwelleth-between-the-cherubims-the-formed-presence'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Exodus 25:22 — "there I will meet... and commune from above the mercy seat": the ark is the meeting-place of the Presence.'
  FROM cross_reference_threads t
  JOIN _s341_2sa06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=6 AND sv.verse_number=2
  JOIN _s341_2sa06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=25 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-6-the-ark-that-dwelleth-between-the-cherubims-the-formed-presence'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Numbers 7:89 — Moses heard the voice from between the two cherubims: the Formed Word who SPEAKS, enthroned on the ark.'
  FROM cross_reference_threads t
  JOIN _s341_2sa06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=6 AND sv.verse_number=2
  JOIN _s341_2sa06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=7 AND tv.verse_number=89
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-6-the-ark-that-dwelleth-between-the-cherubims-the-formed-presence'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'1 Samuel 4:4 — the same title at Shiloh, where the glory departed; David now restores what was lost.'
  FROM cross_reference_threads t
  JOIN _s341_2sa06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=6 AND sv.verse_number=2
  JOIN _s341_2sa06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=4 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-6-the-ark-that-dwelleth-between-the-cherubims-the-formed-presence'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Hebrews 9:5 — "the cherubims of glory shadowing the mercyseat": the apostolic name for the ark''s throne of the Presence.'
  FROM cross_reference_threads t
  JOIN _s341_2sa06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=6 AND sv.verse_number=2
  JOIN _s341_2sa06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=9 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-6-the-ark-that-dwelleth-between-the-cherubims-the-formed-presence'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'1 Samuel 6:7 — the "new cart" is the Philistine method of returning the ark; David borrows the nations'' device.'
  FROM cross_reference_threads t
  JOIN _s341_2sa06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=6 AND sv.verse_number=3
  JOIN _s341_2sa06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=6 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-6-the-new-cart-and-uzzahs-error-the-bearing-law-of-the-presence'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Numbers 4:15 — the Kohathites bear the holy things but "shall not touch... lest they die": the line Uzzah crossed.'
  FROM cross_reference_threads t
  JOIN _s341_2sa06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=6 AND sv.verse_number=6
  JOIN _s341_2sa06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=4 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-6-the-new-cart-and-uzzahs-error-the-bearing-law-of-the-presence'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Numbers 7:9 — no wagons to Kohath; the ark rides on Levite shoulders, never a cart''s axle.'
  FROM cross_reference_threads t
  JOIN _s341_2sa06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=6 AND sv.verse_number=6
  JOIN _s341_2sa06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=7 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-6-the-new-cart-and-uzzahs-error-the-bearing-law-of-the-presence'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'1 Chronicles 13:10 — the parallel account of the breach upon Uzza, one event with two witnesses.'
  FROM cross_reference_threads t
  JOIN _s341_2sa06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=6 AND sv.verse_number=7
  JOIN _s341_2sa06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=13 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-6-the-new-cart-and-uzzahs-error-the-bearing-law-of-the-presence'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'1 Chronicles 15:13 — David names the cause: "we sought him not after the due order" — the abandoned ordinance.'
  FROM cross_reference_threads t
  JOIN _s341_2sa06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=6 AND sv.verse_number=7
  JOIN _s341_2sa06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=15 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-6-the-new-cart-and-uzzahs-error-the-bearing-law-of-the-presence'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'1 Chronicles 15:15 — the correction: Levites bear the ark on their shoulders with staves "as Moses commanded."'
  FROM cross_reference_threads t
  JOIN _s341_2sa06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=6 AND sv.verse_number=7
  JOIN _s341_2sa06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=15 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-6-the-new-cart-and-uzzahs-error-the-bearing-law-of-the-presence'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'1 Samuel 6:19 — Beth-shemesh smitten for looking into the ark: the same holiness of the Presence David must relearn.'
  FROM cross_reference_threads t
  JOIN _s341_2sa06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=6 AND sv.verse_number=7
  JOIN _s341_2sa06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=6 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-6-the-new-cart-and-uzzahs-error-the-bearing-law-of-the-presence'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Psalm 132:8 — "Arise, O Yahuah, into thy rest; thou, and the ark of thy strength": the ark set in its place is the Presence at rest.'
  FROM cross_reference_threads t
  JOIN _s341_2sa06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=6 AND sv.verse_number=17
  JOIN _s341_2sa06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=132 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-6-the-ark-into-his-rest-the-glory-enthroned-in-zion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Psalm 132:13 — "Yahuah hath chosen Zion... here will I dwell": the tent in the city of David is the chosen habitation.'
  FROM cross_reference_threads t
  JOIN _s341_2sa06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=6 AND sv.verse_number=17
  JOIN _s341_2sa06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=132 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-6-the-ark-into-his-rest-the-glory-enthroned-in-zion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Psalm 132:1 — David''s vow to find a place for Yahuah; bringing up the ark with gladness fulfills it.'
  FROM cross_reference_threads t
  JOIN _s341_2sa06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=6 AND sv.verse_number=12
  JOIN _s341_2sa06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=132 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-6-the-ark-into-his-rest-the-glory-enthroned-in-zion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Psalm 24:7 — "Lift up your heads, O ye gates... the King of glory shall come in": the processional of the ark''s ascent.'
  FROM cross_reference_threads t
  JOIN _s341_2sa06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=6 AND sv.verse_number=15
  JOIN _s341_2sa06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=24 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-6-david-danced-before-yahuah-the-kings-wholehearted-worship'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Psalm 24:10 — "Yahuah Tseva''ot, he is the King of glory": the very name on the ark, received through Zion''s gates.'
  FROM cross_reference_threads t
  JOIN _s341_2sa06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=6 AND sv.verse_number=15
  JOIN _s341_2sa06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=24 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-6-david-danced-before-yahuah-the-kings-wholehearted-worship'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Psalm 132:9 — "let thy priests be clothed with righteousness; and let thy saints shout for joy": David''s linen ephod and Israel''s shout.'
  FROM cross_reference_threads t
  JOIN _s341_2sa06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=6 AND sv.verse_number=14
  JOIN _s341_2sa06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=132 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-6-david-danced-before-yahuah-the-kings-wholehearted-worship'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'1 Chronicles 15:27 — the parallel: David clothed in fine linen with an ephod, the king ministering as priest.'
  FROM cross_reference_threads t
  JOIN _s341_2sa06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=6 AND sv.verse_number=14
  JOIN _s341_2sa06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=15 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-6-david-danced-before-yahuah-the-kings-wholehearted-worship'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'John 4:23 — "the true worshippers shall worship the Father in spirit and in truth": David''s dance "with all his might" is the worship the Father seeks.'
  FROM cross_reference_threads t
  JOIN _s341_2sa06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=6 AND sv.verse_number=14
  JOIN _s341_2sa06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=4 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-6-david-danced-before-yahuah-the-kings-wholehearted-worship'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Psalm 132:16 — "her saints shall shout aloud for joy": the answer to David''s "I will yet be more vile... had in honour."'
  FROM cross_reference_threads t
  JOIN _s341_2sa06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=6 AND sv.verse_number=22
  JOIN _s341_2sa06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=132 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-6-david-danced-before-yahuah-the-kings-wholehearted-worship'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'1 Chronicles 15:29 — the parallel: Michal despises David''s dancing in her heart as the ark enters the city.'
  FROM cross_reference_threads t
  JOIN _s341_2sa06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=6 AND sv.verse_number=16
  JOIN _s341_2sa06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=15 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-6-michal-despised-him-the-house-of-saul-rejected-the-worship'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'1 Samuel 15:23 — Saul rejected for rejecting Yahuah''s word; Michal carries her father''s contempt, and bears no child.'
  FROM cross_reference_threads t
  JOIN _s341_2sa06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=6 AND sv.verse_number=20
  JOIN _s341_2sa06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=15 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-6-michal-despised-him-the-house-of-saul-rejected-the-worship'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2-samuel_7.sql (2 Samuel 7) -----
--
-- 2 Samuel 7 — THE DAVIDIC COVENANT. The central KEYSTONE of the Former Prophets track:
--   David purposes to build Yahuah a house; Yahuah instead will build DAVID a house — a dynasty
--   whose throne is established FOR EVER. The seed who proceeds out of David''s bowels is Solomon
--   immediately AND the everlasting King; *I will be his father, and he shall be my son* — the
--   Formed Son who HAS a Father (NOT co-equal-trinity, NOT Arian; the iniquity-clause shows the
--   immediate son, the everlasting throne reaches the sinless greater Son). Tag 2sa07.
--   Sort band base 37400, step 3.
--
-- FRAMEWORK: The seed-of-promise narrows here to the Davidic line that carries the everlasting
--   King. *I will set up thy seed after thee... and I will establish his kingdom* (7:12); *the
--   throne of his kingdom for ever* (7:13); *thy throne shall be established for ever* (7:16). The
--   throne over *the house of Jacob* / both houses for ever (Luke 1:33). The temple the Son builds
--   (Zech 6:12-13). The righteous Branch = Yahuah Tsidkenu (Jer 23:5-6 / 33:15-17). The tabernacle
--   of David rebuilt (Amos 9:11 -> Acts 15:16). The sure mercies of David (Isa 55:3). Never
--   replacement; the everlasting throne fulfilled in the Formed Son (Yahusha) who took flesh as
--   David''s seed and HAS a Father.
--
-- 2 Samuel 7 coverage:
--   v.1-7   NT:     none warranted (the tent/temple weave runs Tanakh-laterally + Davidic prayer)
--           Extras: none warranted
--           Tanakh: 1 Chronicles 17:1 (I dwell in an house of cedars, the ark under curtains);
--                   1 Chronicles 17:4 (Thou shalt not build me an house); 1 Chronicles 17:5 (I have
--                   not dwelt in an house... but have gone from tent to tent); Psalm 132:3 (vow);
--                   Psalm 132:5 (until I find out a place... an habitation for El Gibbor of Jacob)
--   v.11-13 NT:     Luke 1:32 (the throne of his father David); Luke 1:33 (reign over the house of
--                   Jacob for ever, his kingdom no end); Acts 2:30 (of the fruit of his loins...
--                   raise up Messiah to sit on his throne)
--           Extras: none warranted
--           Tanakh: 1 Chronicles 17:11 (I will raise up thy seed after thee); 1 Chronicles 17:12 (he
--                   shall build me an house, I will stablish his throne for ever); Psalm 89:3 (covenant
--                   with my chosen, sworn unto David); Psalm 89:4 (thy seed will I establish for ever);
--                   Psalm 132:11 (of the fruit of thy body will I set upon thy throne)
--   v.14    NT:     Hebrews 1:5 (I will be to him a Father, and he shall be to me a Son — of the Son)
--           Extras: none warranted
--           Tanakh: Psalm 2:7 (Thou art my Son; this day have I begotten thee); Psalm 89:26 (Thou art
--                   my father, my Elohim); Psalm 89:27 (I will make him my firstborn); 1 Chronicles 17:13
--                   (I will be his father, and he shall be my son)
--   v.16    NT:     Luke 1:33 (of his kingdom there shall be no end)
--           Extras: none warranted
--           Tanakh: Psalm 89:28 (my covenant shall stand fast with him); Psalm 89:29 (his throne as the
--                   days of heaven); Psalm 89:36 (his throne as the sun before me); Psalm 132:12 (their
--                   children shall sit upon thy throne for evermore); Isaiah 9:7 (upon the throne of
--                   David... for ever)
--   v.13,16 NT:     Acts 15:16 (I will build again the tabernacle of David which is fallen down)
--   (Branch) Extras: none warranted
--           Tanakh: Jeremiah 23:5 (I will raise unto David a righteous Branch, a King); Jeremiah 23:6
--                   (Yahuah Tsidkenu); Jeremiah 33:15 (the Branch of righteousness to grow up unto David);
--                   Jeremiah 33:17 (David shall never want a man to sit upon the throne); Zechariah 6:12
--                   (the man whose name is The BRANCH... he shall build the temple); Zechariah 6:13 (he
--                   shall build the temple, bear the glory, sit and rule, a priest upon his throne);
--                   Amos 9:11 (raise up the tabernacle of David that is fallen)
--   v.18-22 NT:     none warranted (David''s prayer of humble response, woven to the Chronicles parallel)
--           Extras: none warranted
--           Tanakh: 1 Chronicles 17:16 (Who am I, O Yahuah Elohim); 1 Chronicles 17:17 (a small thing...
--                   spoken of thy servant''s house for a great while to come)
--   v.23-24 NT:     Luke 1:68 (he hath visited and redeemed his people)
--           Extras: none warranted
--           Tanakh: 1 Chronicles 17:21 (what one nation is like thy people, whom Elohim went to redeem);
--                   1 Chronicles 17:22 (thy people Yashar''el didst thou make thine own people for ever)
--   v.28-29 NT:     Acts 2:30 (the oath... the sure promise to David)
--           Extras: none warranted
--           Tanakh: Isaiah 55:3 (everlasting covenant... the sure mercies of David); Psalm 89:34 (my
--                   covenant will I not break); Psalm 89:35 (sworn by my holiness that I will not lie unto David)
--   v.8-10,15,17,25-27 NT/Extras/Tanakh: none warranted (covenant-narrative bridges carried by the
--                   surrounding threads; no external add warranted)
--
-- THREADS (8):
--   2-samuel-7-i-dwell-in-cedar-but-the-ark-within-curtains            [Tanakh] David purposes a house; Yahuah walked in a tent
--   2-samuel-7-i-will-set-up-thy-seed-and-establish-his-kingdom        [Tanakh+NT] the dynasty/seed -> Solomon AND the everlasting King
--   2-samuel-7-i-will-be-his-father-and-he-shall-be-my-son            [Tanakh+NT] the Formed Son who HAS a Father
--   2-samuel-7-thy-throne-shall-be-established-for-ever               [Tanakh+NT] the everlasting throne
--   2-samuel-7-the-righteous-branch-and-the-temple-the-son-builds     [Tanakh+NT] the Branch = Yahuah Tsidkenu, the tabernacle rebuilt
--   2-samuel-7-who-am-i-o-adonai-yahuah-davids-prayer                 [Tanakh] David''s humble response
--   2-samuel-7-thy-people-yashar-el-confirmed-a-people-for-ever       [Tanakh+NT] the redeemed two-house people
--   2-samuel-7-thy-words-be-true-the-sure-mercies-of-david            [Tanakh+NT] the sworn, sure mercies of David

CREATE TEMP VIEW _s341_2sa07_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: I dwell in cedar, but the ark within curtains
    ('canon','2-samuel',7,2,'canon','1-chronicles',17,1,'free',
      E'*Now it came to pass, as David sat in his house, that David said to Nathan the prophet, Lo, I dwell in an house of cedars, but the ark of the covenant of Yahuah (LORD) remaineth under curtains* (1 Chronicles 17:1). The Chronicler tells the same opening: David''s unrest that ''*I dwell in an house of cedar, but the ark of Elohim (God) dwelleth within curtains*'' (2 Samuel 7:2). The king at rest cannot bear that the ark has no house — the impulse that draws out the covenant.'),
    ('canon','2-samuel',7,5,'canon','1-chronicles',17,4,'free',
      E'*Go and tell David my servant, Thus saith Yahuah (LORD), Thou shalt not build me an house to dwell in* (1 Chronicles 17:4). The answer to David''s purpose is the same in both books: ''*Shalt thou build me an house for me to dwell in?*'' (2 Samuel 7:5). Yahuah will not have the house built by David''s hand — the covenant runs the other direction: Yahuah will build David a house.'),
    ('canon','2-samuel',7,6,'canon','1-chronicles',17,5,'free',
      E'*For I have not dwelt in an house since the day that I brought up Yashar''el (Israel) unto this day; but have gone from tent to tent, and from one tabernacle to another* (1 Chronicles 17:5). The One who led Yashar''el from Egypt has walked with his people in a tent — ''*I have not dwelt in any house since the time that I brought up the children of Yashar''el (Israel) out of Egypt... but have walked in a tent and in a tabernacle*'' (2 Samuel 7:6). The Formed Son who tabernacles with his people asks no house of cedar; he dwells among them.'),
    ('canon','2-samuel',7,2,'canon','psalms',132,5,'free',
      E'*Until I find out a place for Yahuah (LORD), an habitation for El Gibbor (the mighty God) of Jacob* (Psalm 132:5). David''s vow in the psalm is the same heart that says ''*I dwell in an house of cedar, but the ark of Elohim (God) dwelleth within curtains*'' (2 Samuel 7:2): he will not rest in his own house until Yahuah has a habitation. The longing is right, though the building waits for the son.'),
    ('canon','2-samuel',7,2,'canon','psalms',132,3,'free',
      E'*Surely I will not come into the tabernacle of my house, nor go up into my bed* (Psalm 132:3). The psalm voices the very disquiet of ''*I dwell in an house of cedar*'' while the ark is in curtains (2 Samuel 7:2): David swears no comfort of his own house until Yahuah''s ark is housed — the zeal that opens the covenant night.'),
    -- Thread 2: I will set up thy seed and establish his kingdom
    ('canon','2-samuel',7,12,'canon','1-chronicles',17,11,'free',
      E'*And it shall come to pass, when thy days be expired that thou must go to be with thy fathers, that I will raise up thy seed after thee, which shall be of thy sons; and I will establish his kingdom* (1 Chronicles 17:11). The promise stands word for word with ''*I will set up thy seed after thee, which shall proceed out of thy bowels, and I will establish his kingdom*'' (2 Samuel 7:12): the seed out of David''s own body, the dynasty Yahuah himself raises up.'),
    ('canon','2-samuel',7,13,'canon','1-chronicles',17,12,'free',
      E'*He shall build me an house, and I will stablish his throne for ever* (1 Chronicles 17:12). The Chronicler gives the same double word as ''*He shall build an house for my name, and I will stablish the throne of his kingdom for ever*'' (2 Samuel 7:13): the son builds the house, but it is Yahuah who establishes the throne — and the establishing is *for ever*, reaching past Solomon to the everlasting King.'),
    ('canon','2-samuel',7,12,'canon','psalms',89,3,'free',
      E'*I have made a covenant with my chosen, I have sworn unto David my servant* (Psalm 89:3). The covenant-psalm names what 2 Samuel 7 enacts: the sworn word to David that ''*I will set up thy seed after thee... and I will establish his kingdom*'' (2 Samuel 7:12). What Nathan delivers as promise, the psalm sings as an oath Yahuah has sworn.'),
    ('canon','2-samuel',7,12,'canon','psalms',89,4,'free',
      E'*Thy seed will I establish for ever, and build up thy throne to all generations. Selah* (Psalm 89:4). The psalm answers the promise of the seed: ''*I will set up thy seed after thee... and I will establish his kingdom*'' (2 Samuel 7:12) becomes the everlasting establishing of David''s seed and throne to all generations — the line that carries the King without end.'),
    ('canon','2-samuel',7,12,'canon','psalms',132,11,'free',
      E'*Yahuah (LORD) hath sworn in truth unto David; he will not turn from it; Of the fruit of thy body will I set upon thy throne* (Psalm 132:11). The oath is the seed-promise of 2 Samuel 7:12 — ''*thy seed... which shall proceed out of thy bowels*'' — sung as a sworn truth Yahuah will not turn from: the fruit of David''s body set upon his throne.'),
    ('canon','2-samuel',7,12,'canon','acts',2,30,'free',
      E'*Therefore being a prophet, and knowing that Elohim (God) had sworn with an oath to him, that of the fruit of his loins, according to the flesh, he would raise up Messiah (Christ) to sit on his throne* (Acts 2:30). Peter reads ''*I will set up thy seed after thee, which shall proceed out of thy bowels*'' (2 Samuel 7:12) as the oath fulfilled in the resurrection: of the fruit of David''s loins, Yahuah raises up Messiah to sit on his throne — Solomon immediately, the risen everlasting King ultimately.'),
    ('canon','2-samuel',7,13,'canon','luke',1,32,'free',
      E'*He shall be great, and shall be called the Son of the Highest: and Yahuah Elohim (the Lord God) shall give unto him the throne of his father David* (Luke 1:32). Gabriel announces the heir of the covenant: the throne of ''*the throne of his kingdom for ever*'' (2 Samuel 7:13) is given to the Son of the Highest — the throne of his father David, the seed who establishes the everlasting house.'),
    ('canon','2-samuel',7,13,'canon','luke',1,33,'free',
      E'*And he shall reign over the house of Jacob for ever; and of his kingdom there shall be no end* (Luke 1:33). The *for ever* of ''*the throne of his kingdom for ever*'' (2 Samuel 7:13) is spelled out: a reign over the house of Jacob — both houses gathered — with no end. The Davidic throne is not over a church that replaces Yashar''el, but over the house of Jacob for ever.'),
    -- Thread 3: I will be his father, and he shall be my son
    ('canon','2-samuel',7,14,'canon','1-chronicles',17,13,'free',
      E'*I will be his father, and he shall be my son: and I will not take my mercy away from him, as I took it from him that was before thee* (1 Chronicles 17:13). The Chronicler carries the father-son word of the covenant — ''*I will be his father, and he shall be my son*'' (2 Samuel 7:14) — with the same promise of unfailing mercy: the Davidic son stands in a sonship Yahuah himself declares.'),
    ('canon','2-samuel',7,14,'canon','psalms',2,7,'free',
      E'*I will declare the decree: Yahuah (LORD) hath said unto me, Thou art my Son; this day have I begotten thee* (Psalm 2:7). The enthroned king of the second psalm speaks the covenant sonship of ''*I will be his father, and he shall be my son*'' (2 Samuel 7:14): the decree by which the Davidic king is Yahuah''s begotten Son — the Formed Son who has a Father, the King set upon the holy hill of Zion.'),
    ('canon','2-samuel',7,14,'canon','psalms',89,26,'free',
      E'*He shall cry unto me, Thou art my father, my Elohim (God), and the rock of my salvation* (Psalm 89:26). The sonship of ''*I will be his father, and he shall be my son*'' (2 Samuel 7:14) is answered from the son''s side: the Davidic king cries to Yahuah as Father — a Son who has a Father, never a co-equal beside him nor a mere creature, but the One who calls the Most High his rock.'),
    ('canon','2-samuel',7,14,'canon','psalms',89,27,'free',
      E'*Also I will make him my firstborn, higher than the kings of the earth* (Psalm 89:27). The covenant son of 2 Samuel 7:14 is made firstborn — the rank the New Testament hangs on Messiah, the firstborn over all the kings of the earth. *I will be his father, and he shall be my son* opens into the firstborn Son exalted above every throne.'),
    ('canon','2-samuel',7,14,'canon','hebrews',1,5,'free',
      E'*For unto which of the angels said he at any time, Thou art my Son, this day have I begotten thee? And again, I will be to him a Father, and he shall be to me a Son?* (Hebrews 1:5). The letter quotes the covenant word of 2 Samuel 7:14 directly and applies it to the Messiah: ''*I will be to him a Father, and he shall be to me a Son*'' — the Son set above the angels, the Formed Son who has a Father, the everlasting heir the iniquity-clause never touches.'),
    -- Thread 4: Thy throne shall be established for ever
    ('canon','2-samuel',7,16,'canon','psalms',89,28,'free',
      E'*My mercy will I keep for him for evermore, and my covenant shall stand fast with him* (Psalm 89:28). The *for ever* of ''*thy throne shall be established for ever*'' (2 Samuel 7:16) is sung as the covenant that stands fast: mercy kept for evermore, a throne that does not fall though the king''s children be chastened.'),
    ('canon','2-samuel',7,16,'canon','psalms',89,29,'free',
      E'*His seed also will I make to endure for ever, and his throne as the days of heaven* (Psalm 89:29). The everlasting throne of 2 Samuel 7:16 endures *as the days of heaven* — the seed and the throne reaching as long as the heavens stand, the unbreakable Davidic line.'),
    ('canon','2-samuel',7,16,'canon','psalms',89,36,'free',
      E'*His seed shall endure for ever, and his throne as the sun before me* (Psalm 89:36). ''*Thy throne shall be established for ever*'' (2 Samuel 7:16) is set as fixed as the sun: a throne and a seed that endure before Yahuah''s face for ever — the covenant that cannot be cast off though the crown be profaned for a season.'),
    ('canon','2-samuel',7,16,'canon','psalms',132,12,'free',
      E'*If thy children will keep my covenant and my testimony that I shall teach them, their children shall also sit upon thy throne for evermore* (Psalm 132:12). The established throne of 2 Samuel 7:16 runs through generations who keep covenant and testimony — Torah-faithfulness, never Torah set aside — David''s children sitting upon his throne for evermore.'),
    ('canon','2-samuel',7,16,'canon','isaiah',9,7,'free',
      E'*Of the increase of his government and peace there shall be no end, upon the throne of David, and upon his kingdom, to order it, and to establish it with judgment and with justice from henceforth even for ever. The zeal of Yahuah Tseva''ot (LORD of hosts) will perform this* (Isaiah 9:7). The everlasting throne of ''*thy throne shall be established for ever*'' (2 Samuel 7:16) is the throne of David the child-born Son holds without end — government and peace upon David''s throne for ever, performed by the zeal of Yahuah.'),
    ('canon','2-samuel',7,16,'canon','luke',1,33,'free',
      E'*And he shall reign over the house of Jacob for ever; and of his kingdom there shall be no end* (Luke 1:33). The *for ever* of 2 Samuel 7:16 is fulfilled in the Son given the throne of his father David: a reign over the house of Jacob with no end — the everlasting establishing of the Davidic throne in the One who took flesh as David''s seed.'),
    -- Thread 5: The righteous Branch and the temple the Son builds
    ('canon','2-samuel',7,13,'canon','jeremiah',23,5,'free',
      E'*Behold, the days come, saith Yahuah (LORD), that I will raise unto David a righteous Branch, and a King shall reign and prosper, and shall execute judgment and justice in the earth* (Jeremiah 23:5). The seed who ''*shall build an house for my name*'' and whose throne is established for ever (2 Samuel 7:13) is the righteous Branch raised unto David — the King who reigns in judgment and justice, the covenant seed flowering in the Messiah.'),
    ('canon','2-samuel',7,13,'canon','jeremiah',23,6,'free',
      E'*In his days Yahudah (Judah) shall be saved, and Yashar''el (Israel) shall dwell safely: and this is his name whereby he shall be called, Yahuah Tsidkenu (THE LORD OUR RIGHTEOUSNESS)* (Jeremiah 23:6). The Davidic seed of 2 Samuel 7:13 saves both houses — Yahudah and Yashar''el together — and bears the Name itself, Yahuah Tsidkenu: the Formed Son who is Yahuah and has a Father, the King over the reunited people.'),
    ('canon','2-samuel',7,13,'canon','jeremiah',33,15,'free',
      E'*In those days, and at that time, will I cause the Branch of righteousness to grow up unto David; and he shall execute judgment and righteousness in the land* (Jeremiah 33:15). The promise of the seed who builds the house and holds the everlasting throne (2 Samuel 7:13) is the Branch of righteousness growing up unto David — the covenant Jeremiah declares as fixed as day and night.'),
    ('canon','2-samuel',7,16,'canon','jeremiah',33,17,'free',
      E'*For thus saith Yahuah (LORD); David shall never want a man to sit upon the throne of the house of Yashar''el (Israel)* (Jeremiah 33:17). The everlasting throne of ''*thy throne shall be established for ever*'' (2 Samuel 7:16) is the promise that David shall never lack a man upon the throne of the house of Yashar''el — the unbroken line that lands on the King who reigns for ever.'),
    ('canon','2-samuel',7,13,'canon','zechariah',6,12,'free',
      E'*And speak unto him, saying, Thus speaketh Yahuah Tseva''ot (LORD of hosts), saying, Behold the man whose name is The BRANCH; and he shall grow up out of his place, and he shall build the temple of Yahuah (LORD)* (Zechariah 6:12). The word ''*He shall build an house for my name*'' (2 Samuel 7:13) reaches past Solomon to the man named The BRANCH, who builds the temple of Yahuah — the Son who raises the true house.'),
    ('canon','2-samuel',7,13,'canon','zechariah',6,13,'free',
      E'*Even he shall build the temple of Yahuah (LORD); and he shall bear the glory, and shall sit and rule upon his throne; and he shall be a priest upon his throne: and the counsel of peace shall be between them both* (Zechariah 6:13). The seed who builds the house and is established on the throne (2 Samuel 7:13) is the Branch who builds the temple, bears the glory, and sits as king and priest at once — the throne and the sanctuary joined in the one Son.'),
    ('canon','2-samuel',7,11,'canon','amos',9,11,'free',
      E'*In that day will I raise up the tabernacle of David that is fallen, and close up the breaches thereof; and I will raise up his ruins, and I will build it as in the days of old* (Amos 9:11). Yahuah''s word ''*he will make thee an house*'' (2 Samuel 7:11) outlasts the fall: when the dynasty lies in ruins, Yahuah raises up the fallen tabernacle of David and builds it as in days of old — the house Yahuah builds cannot finally fall.'),
    ('canon','2-samuel',7,11,'canon','acts',15,16,'free',
      E'*After this I will return, and will build again the tabernacle of David, which is fallen down; and I will build again the ruins thereof, and I will set it up* (Acts 15:16). James reads Amos forward at Jerusalem: the house Yahuah promised to build David (2 Samuel 7:11) is the tabernacle of David rebuilt — and the rebuilding gathers the residue of men and the nations called by Yahuah''s name, the two-house ingathering, not a replacement.'),
    -- Thread 6: Who am I, O Adonai Yahuah — David's prayer
    ('canon','2-samuel',7,18,'canon','1-chronicles',17,16,'free',
      E'*And David the king came and sat before Yahuah (LORD), and said, Who am I, O Yahuah Elohim (LORD God), and what is mine house, that thou hast brought me hitherto?* (1 Chronicles 17:16). The Chronicler keeps David''s answer to the covenant: ''*Who am I, O Yahuah (Lord) GOD? and what is my house, that thou hast brought me hitherto?*'' (2 Samuel 7:18). The king who would build a house is undone by the house Yahuah builds him, and sits down in wonder.'),
    ('canon','2-samuel',7,19,'canon','1-chronicles',17,17,'free',
      E'*And yet this was a small thing in thine eyes, O Elohim (God); for thou hast also spoken of thy servant''s house for a great while to come, and hast regarded me according to the estate of a man of high degree, O Yahuah Elohim (LORD God)* (1 Chronicles 17:17). The same astonishment as ''*this was yet a small thing in thy sight, O Yahuah (Lord) GOD; but thou hast spoken also of thy servant''s house for a great while to come*'' (2 Samuel 7:19): the covenant reaches further than David can take in — a house for a great while to come.'),
    -- Thread 7: Thy people Yashar'el confirmed a people for ever
    ('canon','2-samuel',7,23,'canon','1-chronicles',17,21,'free',
      E'*And what one nation in the earth is like thy people Yashar''el (Israel), whom Elohim (God) went to redeem to be his own people, to make thee a name of greatness and terribleness, by driving out nations from before thy people, whom thou hast redeemed out of Egypt?* (1 Chronicles 17:21). David''s wonder is one in both books: ''*what one nation in the earth is like thy people, even like Yashar''el (Israel), whom Elohim (God) went to redeem for a people to himself*'' (2 Samuel 7:23). The covenant of the throne is bound to the covenant people Yahuah redeemed.'),
    ('canon','2-samuel',7,24,'canon','1-chronicles',17,22,'free',
      E'*For thy people Yashar''el (Israel) didst thou make thine own people for ever; and thou, Yahuah (LORD), becamest their Elohim (God)* (1 Chronicles 17:22). The everlasting people of ''*thou hast confirmed to thyself thy people Yashar''el (Israel) to be a people unto thee for ever*'' (2 Samuel 7:24) is the same in Chronicles: Yashar''el made Yahuah''s own people *for ever* — the people over whom the everlasting throne reigns, never cast off.'),
    ('canon','2-samuel',7,23,'canon','luke',1,68,'free',
      E'*Blessed be Yahuah Elohim (the Lord God) of Yashar''el (Israel); for he hath visited and redeemed his people* (Luke 1:68). Zacharias blesses the God who does again what David marvelled at — ''*whom Elohim (God) went to redeem for a people to himself*'' (2 Samuel 7:23): Yahuah visits and redeems his people, raising the horn of salvation in the house of David. The redemption that made Yashar''el a people is renewed in the coming of the Davidic King.'),
    -- Thread 8: Thy words be true — the sure mercies of David
    ('canon','2-samuel',7,28,'canon','isaiah',55,3,'free',
      E'*Incline your ear, and come unto me: hear, and your soul shall live; and I will make an everlasting covenant with you, even the sure mercies of David* (Isaiah 55:3). David''s confidence that ''*thou art that Elohim (God), and thy words be true, and thou hast promised this goodness unto thy servant*'' (2 Samuel 7:28) is the sure mercies of David — the everlasting covenant Yahuah swore, offered now to all who incline the ear and live.'),
    ('canon','2-samuel',7,29,'canon','psalms',89,34,'free',
      E'*My covenant will I not break, nor alter the thing that is gone out of my lips* (Psalm 89:34). David prays ''*let it please thee to bless the house of thy servant, that it may continue for ever before thee*'' (2 Samuel 7:29), and the psalm answers with Yahuah''s own pledge: the covenant he will not break nor alter — the word gone out of his lips that establishes the house for ever.'),
    ('canon','2-samuel',7,29,'canon','psalms',89,35,'free',
      E'*Once have I sworn by my holiness that I will not lie unto David* (Psalm 89:35). The blessing David asks ''*for thou, O Yahuah (Lord) GOD, hast spoken it*'' (2 Samuel 7:29) rests on the oath Yahuah swore by his own holiness — that he will not lie unto David. The everlasting house stands on a sworn word that cannot fail.'),
    ('canon','2-samuel',7,28,'canon','acts',2,30,'free',
      E'*Therefore being a prophet, and knowing that Elohim (God) had sworn with an oath to him, that of the fruit of his loins, according to the flesh, he would raise up Messiah (Christ) to sit on his throne* (Acts 2:30). David''s ''*thy words be true, and thou hast promised this goodness unto thy servant*'' (2 Samuel 7:28) is the oath Peter names — sworn with an oath, sure and true, raising up Messiah of David''s loins to sit on his throne. The promise David trusts is fulfilled in the risen King.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s341_2sa07_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s341_2sa07_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Thread 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-samuel-7-i-dwell-in-cedar-but-the-ark-within-curtains',
       E'I dwell in an house of cedar, but the ark within curtains',
       E'The covenant opens from David''s unrest: at rest from all his enemies, he cannot bear the imbalance — *See now, I dwell in an house of cedar, but the ark of Elohim (God) dwelleth within curtains* (2 Samuel 7:2). The Chronicler tells it the same — *Lo, I dwell in an house of cedars, but the ark of the covenant of Yahuah (LORD) remaineth under curtains* (1 Chronicles 17:1) — and the psalm makes the longing a vow: *Surely I will not come into the tabernacle of my house, nor go up into my bed... until I find out a place for Yahuah (LORD), an habitation for El Gibbor (the mighty God) of Jacob* (Psalm 132:3-5). But Yahuah turns the purpose around: *Shalt thou build me an house for me to dwell in?* (2 Samuel 7:5) / *Thou shalt not build me an house to dwell in* (1 Chronicles 17:4). The One who brought Yashar''el out of Egypt has not asked a house — *I have not dwelt in any house since the time that I brought up the children of Yashar''el (Israel) out of Egypt... but have walked in a tent and in a tabernacle* (2 Samuel 7:6). The Formed Son who tabernacles among his people will not be housed by David''s hand; the covenant runs the other way — Yahuah will build David a house.',
       sv.verse_id, ev.verse_id, 'free', 37400
  FROM _s341_2sa07_lookup sv, _s341_2sa07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=7 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='2-samuel' AND ev.chapter_number=7 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- Thread 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-samuel-7-i-will-set-up-thy-seed-and-establish-his-kingdom',
       E'I will set up thy seed, and establish his kingdom',
       E'The heart of the covenant: *And when thy days be fulfilled, and thou shalt sleep with thy fathers, I will set up thy seed after thee, which shall proceed out of thy bowels, and I will establish his kingdom. He shall build an house for my name, and I will stablish the throne of his kingdom for ever* (2 Samuel 7:12-13). The Chronicler keeps it word for word — *I will raise up thy seed after thee, which shall be of thy sons... He shall build me an house, and I will stablish his throne for ever* (1 Chronicles 17:11-12) — and the psalms make it a sworn oath: *I have made a covenant with my chosen, I have sworn unto David my servant, Thy seed will I establish for ever, and build up thy throne to all generations* (Psalm 89:3-4); *Yahuah (LORD) hath sworn in truth unto David... Of the fruit of thy body will I set upon thy throne* (Psalm 132:11). The seed is Solomon immediately, who builds the house — and the everlasting King ultimately. Peter reads the oath fulfilled in the resurrection: *of the fruit of his loins, according to the flesh, he would raise up Messiah (Christ) to sit on his throne* (Acts 2:30); and Gabriel announces the heir — *Yahuah Elohim (the Lord God) shall give unto him the throne of his father David: And he shall reign over the house of Jacob for ever; and of his kingdom there shall be no end* (Luke 1:32-33). The throne is over the house of Jacob — both houses gathered — never a people that replaces Yashar''el.',
       sv.verse_id, ev.verse_id, 'free', 37403
  FROM _s341_2sa07_lookup sv, _s341_2sa07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=7 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='2-samuel' AND ev.chapter_number=7 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- Thread 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-samuel-7-i-will-be-his-father-and-he-shall-be-my-son',
       E'I will be his father, and he shall be my son',
       E'The covenant declares a sonship: *I will be his father, and he shall be my son. If he commit iniquity, I will chasten him with the rod of men, and with the stripes of the children of men* (2 Samuel 7:14) — the iniquity-clause showing the immediate son, Solomon, who can be chastened, while the everlasting throne reaches the sinless greater Son. The Chronicler carries it with the same promise of unfailing mercy — *I will be his father, and he shall be my son: and I will not take my mercy away from him* (1 Chronicles 17:13). The psalms voice the sonship from both sides: Yahuah''s decree, *Thou art my Son; this day have I begotten thee* (Psalm 2:7), and the son''s cry, *Thou art my father, my Elohim (God), and the rock of my salvation* (Psalm 89:26), with the rank that follows — *Also I will make him my firstborn, higher than the kings of the earth* (Psalm 89:27). And Hebrews quotes 2 Samuel 7:14 of the Messiah outright: *I will be to him a Father, and he shall be to me a Son?* (Hebrews 1:5) — the Son set above the angels. This is the Formed Son who HAS a Father: not a co-equal person in a triad, not a creature made out of nothing, but the begotten King who calls the Most High his Father and his rock — the everlasting heir the chastening-clause never touches.',
       sv.verse_id, ev.verse_id, 'free', 37406
  FROM _s341_2sa07_lookup sv, _s341_2sa07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=7 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='2-samuel' AND ev.chapter_number=7 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- Thread 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-samuel-7-thy-throne-shall-be-established-for-ever',
       E'Thy throne shall be established for ever',
       E'The covenant''s refrain seals it: *And thine house and thy kingdom shall be established for ever before thee: thy throne shall be established for ever* (2 Samuel 7:16). The covenant-psalm sings the *for ever* from every angle — *My mercy will I keep for him for evermore, and my covenant shall stand fast with him* (Psalm 89:28); *His seed also will I make to endure for ever, and his throne as the days of heaven* (Psalm 89:29); *His seed shall endure for ever, and his throne as the sun before me* (Psalm 89:36) — a throne as fixed as sun and moon, that the later profaning of the crown cannot finally undo. The throne runs through covenant-keeping generations: *If thy children will keep my covenant and my testimony that I shall teach them, their children shall also sit upon thy throne for evermore* (Psalm 132:12) — Torah-faithfulness, never Torah set aside. Isaiah names the everlasting King who holds it: *Of the increase of his government and peace there shall be no end, upon the throne of David, and upon his kingdom, to order it, and to establish it with judgment and with justice from henceforth even for ever* (Isaiah 9:7); and Gabriel its fulfilment — *of his kingdom there shall be no end* (Luke 1:33). The throne established for ever is the throne of the Son who took flesh as David''s seed.',
       sv.verse_id, ev.verse_id, 'free', 37409
  FROM _s341_2sa07_lookup sv, _s341_2sa07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=7 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='2-samuel' AND ev.chapter_number=7 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- Thread 5
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-samuel-7-the-righteous-branch-and-the-temple-the-son-builds',
       E'The righteous Branch, and the temple the Son builds',
       E'The seed who *shall build an house for my name* and whose throne is *established for ever* (2 Samuel 7:13) flowers in the prophets as the righteous Branch. Jeremiah: *I will raise unto David a righteous Branch, and a King shall reign and prosper... In his days Yahudah (Judah) shall be saved, and Yashar''el (Israel) shall dwell safely: and this is his name whereby he shall be called, Yahuah Tsidkenu (THE LORD OUR RIGHTEOUSNESS)* (Jeremiah 23:5-6) — both houses saved, the King who bears the Name itself, the Formed Son who is Yahuah and has a Father. Again: *I will cause the Branch of righteousness to grow up unto David* (Jeremiah 33:15), and *David shall never want a man to sit upon the throne of the house of Yashar''el (Israel)* (Jeremiah 33:17). Zechariah joins throne and sanctuary in the one man: *Behold the man whose name is The BRANCH... he shall build the temple of Yahuah (LORD)... and he shall bear the glory, and shall sit and rule upon his throne; and he shall be a priest upon his throne* (Zechariah 6:12-13). And the house Yahuah builds cannot finally fall: *In that day will I raise up the tabernacle of David that is fallen* (Amos 9:11), which James reads forward at Jerusalem — *I will build again the tabernacle of David, which is fallen down... that the residue of men might seek after Yahuah (Lord), and all the Gentiles, upon whom my name is called* (Acts 15:16) — the two-house ingathering, not a replacement. The house David could not build, the Son builds.',
       sv.verse_id, ev.verse_id, 'free', 37412
  FROM _s341_2sa07_lookup sv, _s341_2sa07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=7 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='2-samuel' AND ev.chapter_number=7 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- Thread 6
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-samuel-7-who-am-i-o-adonai-yahuah-davids-prayer',
       E'Who am I, O Adonai Yahuah — David''s prayer of response',
       E'The king who would build a house is undone by the house Yahuah builds him, and sits down in wonder: *Then went king David in, and sat before Yahuah (LORD), and he said, Who am I, O Yahuah (Lord) GOD? and what is my house, that thou hast brought me hitherto?* (2 Samuel 7:18). The Chronicler keeps the same humility — *And David the king came and sat before Yahuah (LORD), and said, Who am I, O Yahuah Elohim (LORD God), and what is mine house, that thou hast brought me hitherto?* (1 Chronicles 17:16). The covenant reaches further than David can take in: *this was yet a small thing in thy sight, O Yahuah (Lord) GOD; but thou hast spoken also of thy servant''s house for a great while to come. And is this the manner of man, O Yahuah (Lord) GOD?* (2 Samuel 7:19) / *thou hast also spoken of thy servant''s house for a great while to come* (1 Chronicles 17:17). The promise of a house *for a great while to come* — the everlasting throne — leaves the king with nothing to say but *Who am I?*. The right response to the covenant is not pride of dynasty but the wonder of a servant brought hitherto.',
       sv.verse_id, ev.verse_id, 'free', 37415
  FROM _s341_2sa07_lookup sv, _s341_2sa07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=7 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='2-samuel' AND ev.chapter_number=7 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- Thread 7
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-samuel-7-thy-people-yashar-el-confirmed-a-people-for-ever',
       E'Thy people Yashar''el confirmed a people for ever',
       E'David''s prayer binds the covenant of the throne to the covenant of the people: *And what one nation in the earth is like thy people, even like Yashar''el (Israel), whom Elohim (God) went to redeem for a people to himself... which thou redeemedst to thee from Egypt* (2 Samuel 7:23); *For thou hast confirmed to thyself thy people Yashar''el (Israel) to be a people unto thee for ever: and thou, Yahuah (LORD), art become their Elohim (God)* (2 Samuel 7:24). The Chronicler keeps it — *whom Elohim (God) went to redeem to be his own people... For thy people Yashar''el (Israel) didst thou make thine own people for ever* (1 Chronicles 17:21-22). The people are made Yahuah''s own *for ever* — never cast off, never replaced. And Zacharias blesses the God who does it again at the coming of the Davidic King: *Blessed be Yahuah Elohim (the Lord God) of Yashar''el (Israel); for he hath visited and redeemed his people* (Luke 1:68). The everlasting throne reigns over an everlasting people: the redemption that made Yashar''el a nation to Yahuah is renewed, not annulled, in the Son of David.',
       sv.verse_id, ev.verse_id, 'free', 37418
  FROM _s341_2sa07_lookup sv, _s341_2sa07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=7 AND sv.verse_number=23
   AND ev.edition_slug='canon' AND ev.book_slug='2-samuel' AND ev.chapter_number=7 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

-- Thread 8
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-samuel-7-thy-words-be-true-the-sure-mercies-of-david',
       E'Thy words be true — the sure mercies of David',
       E'David closes resting his whole house on the truth of Yahuah''s word: *And now, O Yahuah (Lord) GOD, thou art that Elohim (God), and thy words be true, and thou hast promised this goodness unto thy servant* (2 Samuel 7:28); *Therefore now let it please thee to bless the house of thy servant, that it may continue for ever before thee... for thou, O Yahuah (Lord) GOD, hast spoken it* (2 Samuel 7:29). What David trusts, Isaiah offers to all who come: *I will make an everlasting covenant with you, even the sure mercies of David* (Isaiah 55:3). The covenant-psalm gives Yahuah''s own pledge behind those mercies: *My covenant will I not break, nor alter the thing that is gone out of my lips* (Psalm 89:34); *Once have I sworn by my holiness that I will not lie unto David* (Psalm 89:35). And Peter names the oath fulfilled: *Elohim (God) had sworn with an oath to him, that of the fruit of his loins... he would raise up Messiah (Christ) to sit on his throne* (Acts 2:30). The sure mercies of David are sure because the word that promised them cannot fail — *thy words be true* — and they are made good in the risen King.',
       sv.verse_id, ev.verse_id, 'free', 37421
  FROM _s341_2sa07_lookup sv, _s341_2sa07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=7 AND sv.verse_number=28
   AND ev.edition_slug='canon' AND ev.book_slug='2-samuel' AND ev.chapter_number=7 AND ev.verse_number=29
ON CONFLICT (slug) DO NOTHING;

-- Members thread 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'1 Chronicles 17:1 — *I dwell in an house of cedars, but the ark of the covenant of Yahuah remaineth under curtains*: the same opening disquiet that draws out the covenant.'
  FROM cross_reference_threads t
  JOIN _s341_2sa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=7 AND sv.verse_number=2
  JOIN _s341_2sa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=17 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-7-i-dwell-in-cedar-but-the-ark-within-curtains'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'1 Chronicles 17:4 — *Thou shalt not build me an house to dwell in*: Yahuah turns David''s purpose around — the covenant runs the other way.'
  FROM cross_reference_threads t
  JOIN _s341_2sa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=7 AND sv.verse_number=5
  JOIN _s341_2sa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=17 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-7-i-dwell-in-cedar-but-the-ark-within-curtains'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'1 Chronicles 17:5 — *I have not dwelt in an house... but have gone from tent to tent*: the One who led Yashar''el from Egypt has walked with his people in a tent.'
  FROM cross_reference_threads t
  JOIN _s341_2sa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=7 AND sv.verse_number=6
  JOIN _s341_2sa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=17 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-7-i-dwell-in-cedar-but-the-ark-within-curtains'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Psalm 132:5 — *Until I find out a place for Yahuah, an habitation for El Gibbor of Jacob*: David''s vow voices the same heart, to give Yahuah a habitation.'
  FROM cross_reference_threads t
  JOIN _s341_2sa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=7 AND sv.verse_number=2
  JOIN _s341_2sa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=132 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-7-i-dwell-in-cedar-but-the-ark-within-curtains'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Psalm 132:3 — *Surely I will not come into the tabernacle of my house, nor go up into my bed*: the king swears no comfort of his own house until Yahuah''s ark is housed.'
  FROM cross_reference_threads t
  JOIN _s341_2sa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=7 AND sv.verse_number=2
  JOIN _s341_2sa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=132 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-7-i-dwell-in-cedar-but-the-ark-within-curtains'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Members thread 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'1 Chronicles 17:11 — *I will raise up thy seed after thee, which shall be of thy sons; and I will establish his kingdom*: the seed out of David''s own body, the dynasty Yahuah raises.'
  FROM cross_reference_threads t
  JOIN _s341_2sa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=7 AND sv.verse_number=12
  JOIN _s341_2sa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=17 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-7-i-will-set-up-thy-seed-and-establish-his-kingdom'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'1 Chronicles 17:12 — *He shall build me an house, and I will stablish his throne for ever*: the son builds the house, Yahuah establishes the throne for ever.'
  FROM cross_reference_threads t
  JOIN _s341_2sa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=7 AND sv.verse_number=13
  JOIN _s341_2sa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=17 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-7-i-will-set-up-thy-seed-and-establish-his-kingdom'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Psalm 89:3 — *I have made a covenant with my chosen, I have sworn unto David my servant*: what Nathan delivers as promise, the psalm sings as an oath.'
  FROM cross_reference_threads t
  JOIN _s341_2sa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=7 AND sv.verse_number=12
  JOIN _s341_2sa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=89 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-7-i-will-set-up-thy-seed-and-establish-his-kingdom'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Psalm 89:4 — *Thy seed will I establish for ever, and build up thy throne to all generations*: the everlasting establishing of David''s seed and throne.'
  FROM cross_reference_threads t
  JOIN _s341_2sa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=7 AND sv.verse_number=12
  JOIN _s341_2sa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=89 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-7-i-will-set-up-thy-seed-and-establish-his-kingdom'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Psalm 132:11 — *Of the fruit of thy body will I set upon thy throne*: the seed-promise sung as a sworn truth Yahuah will not turn from.'
  FROM cross_reference_threads t
  JOIN _s341_2sa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=7 AND sv.verse_number=12
  JOIN _s341_2sa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=132 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-7-i-will-set-up-thy-seed-and-establish-his-kingdom'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Acts 2:30 — *of the fruit of his loins... he would raise up Messiah to sit on his throne*: Peter reads the seed-oath fulfilled in the resurrection.'
  FROM cross_reference_threads t
  JOIN _s341_2sa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=7 AND sv.verse_number=12
  JOIN _s341_2sa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=2 AND tv.verse_number=30
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-7-i-will-set-up-thy-seed-and-establish-his-kingdom'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'Luke 1:32 — *Yahuah Elohim shall give unto him the throne of his father David*: the heir of the covenant given the everlasting throne.'
  FROM cross_reference_threads t
  JOIN _s341_2sa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=7 AND sv.verse_number=13
  JOIN _s341_2sa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-7-i-will-set-up-thy-seed-and-establish-his-kingdom'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'Luke 1:33 — *he shall reign over the house of Jacob for ever; and of his kingdom there shall be no end*: the throne over both houses, never a replacement.'
  FROM cross_reference_threads t
  JOIN _s341_2sa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=7 AND sv.verse_number=13
  JOIN _s341_2sa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-7-i-will-set-up-thy-seed-and-establish-his-kingdom'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Members thread 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'1 Chronicles 17:13 — *I will be his father, and he shall be my son... I will not take my mercy away from him*: the same father-son word with unfailing mercy.'
  FROM cross_reference_threads t
  JOIN _s341_2sa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=7 AND sv.verse_number=14
  JOIN _s341_2sa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=17 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-7-i-will-be-his-father-and-he-shall-be-my-son'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Psalm 2:7 — *Thou art my Son; this day have I begotten thee*: the decree by which the Davidic king is Yahuah''s begotten Son.'
  FROM cross_reference_threads t
  JOIN _s341_2sa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=7 AND sv.verse_number=14
  JOIN _s341_2sa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-7-i-will-be-his-father-and-he-shall-be-my-son'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Psalm 89:26 — *Thou art my father, my Elohim, and the rock of my salvation*: the son cries to Yahuah as Father — a Son who HAS a Father.'
  FROM cross_reference_threads t
  JOIN _s341_2sa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=7 AND sv.verse_number=14
  JOIN _s341_2sa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=89 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-7-i-will-be-his-father-and-he-shall-be-my-son'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Psalm 89:27 — *Also I will make him my firstborn, higher than the kings of the earth*: the covenant son made firstborn over every throne.'
  FROM cross_reference_threads t
  JOIN _s341_2sa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=7 AND sv.verse_number=14
  JOIN _s341_2sa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=89 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-7-i-will-be-his-father-and-he-shall-be-my-son'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Hebrews 1:5 — *I will be to him a Father, and he shall be to me a Son?*: 2 Samuel 7:14 quoted of the Messiah, the Son set above the angels.'
  FROM cross_reference_threads t
  JOIN _s341_2sa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=7 AND sv.verse_number=14
  JOIN _s341_2sa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-7-i-will-be-his-father-and-he-shall-be-my-son'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Members thread 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Psalm 89:28 — *my covenant shall stand fast with him*: the for-ever throne as the covenant that stands fast.'
  FROM cross_reference_threads t
  JOIN _s341_2sa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=7 AND sv.verse_number=16
  JOIN _s341_2sa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=89 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-7-thy-throne-shall-be-established-for-ever'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Psalm 89:29 — *his throne as the days of heaven*: the seed and throne enduring as long as the heavens stand.'
  FROM cross_reference_threads t
  JOIN _s341_2sa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=7 AND sv.verse_number=16
  JOIN _s341_2sa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=89 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-7-thy-throne-shall-be-established-for-ever'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Psalm 89:36 — *His seed shall endure for ever, and his throne as the sun before me*: the throne as fixed as the sun before Yahuah''s face.'
  FROM cross_reference_threads t
  JOIN _s341_2sa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=7 AND sv.verse_number=16
  JOIN _s341_2sa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=89 AND tv.verse_number=36
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-7-thy-throne-shall-be-established-for-ever'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Psalm 132:12 — *their children shall also sit upon thy throne for evermore*: the throne running through covenant-keeping generations, Torah never set aside.'
  FROM cross_reference_threads t
  JOIN _s341_2sa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=7 AND sv.verse_number=16
  JOIN _s341_2sa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=132 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-7-thy-throne-shall-be-established-for-ever'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Isaiah 9:7 — *of the increase of his government and peace there shall be no end, upon the throne of David... for ever*: the everlasting King who holds David''s throne.'
  FROM cross_reference_threads t
  JOIN _s341_2sa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=7 AND sv.verse_number=16
  JOIN _s341_2sa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=9 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-7-thy-throne-shall-be-established-for-ever'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Luke 1:33 — *of his kingdom there shall be no end*: the for-ever throne fulfilled in the Son given the throne of his father David.'
  FROM cross_reference_threads t
  JOIN _s341_2sa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=7 AND sv.verse_number=16
  JOIN _s341_2sa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-7-thy-throne-shall-be-established-for-ever'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Members thread 5
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Jeremiah 23:5 — *I will raise unto David a righteous Branch, and a King shall reign and prosper*: the seed who builds the house is the righteous Branch raised unto David.'
  FROM cross_reference_threads t
  JOIN _s341_2sa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=7 AND sv.verse_number=13
  JOIN _s341_2sa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=23 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-7-the-righteous-branch-and-the-temple-the-son-builds'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Jeremiah 23:6 — *Yahudah shall be saved, and Yashar''el shall dwell safely... Yahuah Tsidkenu*: the Davidic seed saves both houses and bears the Name itself.'
  FROM cross_reference_threads t
  JOIN _s341_2sa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=7 AND sv.verse_number=13
  JOIN _s341_2sa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=23 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-7-the-righteous-branch-and-the-temple-the-son-builds'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Jeremiah 33:15 — *I will cause the Branch of righteousness to grow up unto David*: the covenant seed as the Branch growing up unto David.'
  FROM cross_reference_threads t
  JOIN _s341_2sa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=7 AND sv.verse_number=13
  JOIN _s341_2sa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=33 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-7-the-righteous-branch-and-the-temple-the-son-builds'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Jeremiah 33:17 — *David shall never want a man to sit upon the throne of the house of Yashar''el*: the everlasting throne as an unbroken line.'
  FROM cross_reference_threads t
  JOIN _s341_2sa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=7 AND sv.verse_number=16
  JOIN _s341_2sa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=33 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-7-the-righteous-branch-and-the-temple-the-son-builds'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Zechariah 6:12 — *Behold the man whose name is The BRANCH... he shall build the temple of Yahuah*: the word that the son builds the house reaches past Solomon to the Branch.'
  FROM cross_reference_threads t
  JOIN _s341_2sa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=7 AND sv.verse_number=13
  JOIN _s341_2sa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=6 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-7-the-righteous-branch-and-the-temple-the-son-builds'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Zechariah 6:13 — *he shall build the temple... and shall sit and rule upon his throne; and he shall be a priest upon his throne*: throne and sanctuary joined in the one Son, king and priest at once.'
  FROM cross_reference_threads t
  JOIN _s341_2sa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=7 AND sv.verse_number=13
  JOIN _s341_2sa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=6 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-7-the-righteous-branch-and-the-temple-the-son-builds'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'Amos 9:11 — *In that day will I raise up the tabernacle of David that is fallen*: the house Yahuah builds cannot finally fall — it is raised from the ruins.'
  FROM cross_reference_threads t
  JOIN _s341_2sa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=7 AND sv.verse_number=11
  JOIN _s341_2sa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=9 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-7-the-righteous-branch-and-the-temple-the-son-builds'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'Acts 15:16 — *I will build again the tabernacle of David, which is fallen down*: James reads Amos forward — the rebuilding gathers the nations called by Yahuah''s name, the two-house ingathering.'
  FROM cross_reference_threads t
  JOIN _s341_2sa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=7 AND sv.verse_number=11
  JOIN _s341_2sa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=15 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-7-the-righteous-branch-and-the-temple-the-son-builds'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Members thread 6
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'1 Chronicles 17:16 — *Who am I, O Yahuah Elohim, and what is mine house, that thou hast brought me hitherto?*: David sits before Yahuah in the same wonder.'
  FROM cross_reference_threads t
  JOIN _s341_2sa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=7 AND sv.verse_number=18
  JOIN _s341_2sa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=17 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-7-who-am-i-o-adonai-yahuah-davids-prayer'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'1 Chronicles 17:17 — *thou hast also spoken of thy servant''s house for a great while to come*: the covenant reaches further than David can take in.'
  FROM cross_reference_threads t
  JOIN _s341_2sa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=7 AND sv.verse_number=19
  JOIN _s341_2sa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=17 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-7-who-am-i-o-adonai-yahuah-davids-prayer'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Members thread 7
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'1 Chronicles 17:21 — *what one nation in the earth is like thy people Yashar''el, whom Elohim went to redeem*: the throne-covenant bound to the redeemed covenant people.'
  FROM cross_reference_threads t
  JOIN _s341_2sa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=7 AND sv.verse_number=23
  JOIN _s341_2sa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=17 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-7-thy-people-yashar-el-confirmed-a-people-for-ever'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'1 Chronicles 17:22 — *thy people Yashar''el didst thou make thine own people for ever*: Yashar''el made Yahuah''s own people for ever, never cast off.'
  FROM cross_reference_threads t
  JOIN _s341_2sa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=7 AND sv.verse_number=24
  JOIN _s341_2sa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=17 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-7-thy-people-yashar-el-confirmed-a-people-for-ever'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Luke 1:68 — *he hath visited and redeemed his people*: the redemption that made Yashar''el a people is renewed at the coming of the Davidic King.'
  FROM cross_reference_threads t
  JOIN _s341_2sa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=7 AND sv.verse_number=23
  JOIN _s341_2sa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=68
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-7-thy-people-yashar-el-confirmed-a-people-for-ever'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Members thread 8
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Isaiah 55:3 — *I will make an everlasting covenant with you, even the sure mercies of David*: the covenant David trusts, offered to all who incline the ear and live.'
  FROM cross_reference_threads t
  JOIN _s341_2sa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=7 AND sv.verse_number=28
  JOIN _s341_2sa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=55 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-7-thy-words-be-true-the-sure-mercies-of-david'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Psalm 89:34 — *My covenant will I not break, nor alter the thing that is gone out of my lips*: Yahuah''s pledge behind the sure mercies — the word that establishes the house for ever.'
  FROM cross_reference_threads t
  JOIN _s341_2sa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=7 AND sv.verse_number=29
  JOIN _s341_2sa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=89 AND tv.verse_number=34
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-7-thy-words-be-true-the-sure-mercies-of-david'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Psalm 89:35 — *Once have I sworn by my holiness that I will not lie unto David*: the everlasting house stands on an oath sworn by Yahuah''s own holiness.'
  FROM cross_reference_threads t
  JOIN _s341_2sa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=7 AND sv.verse_number=29
  JOIN _s341_2sa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=89 AND tv.verse_number=35
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-7-thy-words-be-true-the-sure-mercies-of-david'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Acts 2:30 — *Elohim had sworn with an oath to him... raise up Messiah to sit on his throne*: the oath David trusts, fulfilled in the risen King.'
  FROM cross_reference_threads t
  JOIN _s341_2sa07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=7 AND sv.verse_number=28
  JOIN _s341_2sa07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=2 AND tv.verse_number=30
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-7-thy-words-be-true-the-sure-mercies-of-david'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2-samuel_8.sql (2 Samuel 8) -----
-- 2 Samuel 8 — full-library cross-references — Yoshi's Remnant Bible
-- TAG: 2sa08   VIEW: _s341_2sa08_lookup   SORT BAND: 37425 step 3 (37425,37428,37431,37434)
--
-- FRAME: the covenant rest of 2 Sam 7 unfolding in the field — Yahuah preserves the king
-- whithersoever he goes; the spoil consecrated for the house his seed will build; the king
-- of judgment and justice (Davidic/Messianic righteousness) over all Yashar'el; the borders
-- reaching toward the land promised to Abram, Edom subdued as the Star/Sceptre foretold.
--
-- 2 Samuel 8 coverage:
--   v.1-5  (smote Philistines, Moab, Zobah, Syria) NT: none warranted | Extras: none warranted
--          Tanakh: 1-chronicles 18:1-5 (the parallel record) — folded into the "preserved" thread frame
--   v.6,14 (Yahuah preserved David whithersoever he went) NT: none warranted
--          Extras: none warranted
--          Tanakh: 2-samuel 7:9,11 (rest from all enemies, great name); 1-chronicles 18:6,13 (parallel);
--                  psalms 18:43,47-48 (subdued the people under me); psalms 89:22-24 (no son of wickedness afflict him)
--   v.7-10 (shields of gold, brass, vessels) NT: none | Extras: none
--          Tanakh: 1-chronicles 18:8 (the brass wherewith Solomon made the brasen sea) — folded into the dedication thread
--   v.11-12 (David dedicated the silver/gold/spoil unto Yahuah) NT: none warranted
--          Extras: none warranted
--          Tanakh: 2-samuel 7:13 (he shall build an house for my name); 1-chronicles 18:8,11 (parallel, brass for the temple)
--   v.13   (gat him a name, valley of salt) — folded with v.14 Edom into the Star/Sceptre thread
--   v.14   (Edom David's servants; preserved) Tanakh: genesis 15:18 (the border to Euphrates);
--          numbers 24:17,18,19 (Star/Sceptre out of Jacob, Edom a possession); psalms 60:8,9 (over Edom cast my shoe)
--   v.15   (David executed judgment and justice over all Yashar'el) NT: none warranted (Tanakh-forward type)
--          Extras: none warranted
--          Tanakh: psalms 72:1-4 (give the king thy judgments); isaiah 9:6,7 (judgment and justice, throne of David);
--                  jeremiah 23:5,6 (the righteous Branch shall execute judgment and justice); psalms 89:14 (justice the habitation of the throne)
--   v.16-18 (officers, Zadok the priest, David's sons) NT: none | Extras: none | Tanakh: 1-chronicles 18:15-17 (parallel) — administrative, no thread
--
-- THREADS (4):
--   2-samuel-8-yahuah-preserved-david-whithersoever-he-went            [Tanakh] free  — 8:6,14 covenant rest unfolding
--   2-samuel-8-david-dedicated-the-spoil-unto-yahuah-for-the-house     [Tanakh] free  — 8:11 spoil consecrated for the temple his seed builds
--   2-samuel-8-judgment-and-justice-the-king-of-righteousness         [Tanakh] free  — 8:15 Davidic/Messianic righteous reign
--   2-samuel-8-edom-subdued-the-star-and-sceptre-out-of-jacob         [Tanakh] free  — 8:14 borders + Star/Sceptre over Edom
--
-- CONTESTED/LOAD-BEARING: 8:15 judgment-and-justice is read FORWARD as the type the Branch fills
-- (Jer 23:5-6 same Hebrew pairing, throne of David Isa 9:7) — David the shadow, the Formed Davidic
-- King the substance; NOT a defunct old-covenant kingship superseded, but the covenant promise of
-- 2 Sam 7 advancing toward its everlasting fulfillment. All four threads are canon-only → tier free.

CREATE TEMP VIEW _s341_2sa08_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: preserved whithersoever he went (8:6,14)
    ('canon','2-samuel',8,6,'canon','2-samuel',7,9,'free',
      E'*And I was with thee whithersoever thou wentest, and have cut off all thine enemies out of thy sight, and have made thee a great name, like unto the name of the great men that are in the earth.* (2 Samuel 7:9). The chapter-8 refrain *And Yahuah (LORD) preserved David whithersoever he went* (8:6) is the covenant word of the night before, now walking in the field — the very *whithersoever* of the promise made flesh in the conquest, the great name being *gat* (8:13).'),
    ('canon','2-samuel',8,6,'canon','2-samuel',7,11,'free',
      E'*And as since the time that I commanded judges to be over my people Yashar''el (Israel), and have caused thee to rest from all thine enemies. Also Yahuah (LORD) telleth thee that he will make thee an house.* (2 Samuel 7:11). The rest *from all thine enemies* is precisely what 2 Samuel 8 records being given — Philistines, Moab, Zobah, Syria, Edom all subdued because *Yahuah (LORD) preserved David whithersoever he went* (8:6).'),
    ('canon','2-samuel',8,6,'canon','psalms',18,47,'free',
      E'*It is Elohim (God) that avengeth me, and subdueth the people under me.* (Psalm 18:47). David''s own song of deliverance names the hand behind 8:6 — not his sword but his Elohim that *subdueth the people*, the kings of Damascus and Zobah *become servants to David* only because Yahuah preserved him.'),
    ('canon','2-samuel',8,14,'canon','2-samuel',7,9,'free',
      E'*And I was with thee whithersoever thou wentest, and have cut off all thine enemies out of thy sight* (2 Samuel 7:9). The second sounding of the refrain — *And Yahuah (LORD) preserved David whithersoever he went* (8:14) — closes the conquest list as it opened it, framing the whole chapter as the keeping of the word *I was with thee whithersoever*.'),
    ('canon','2-samuel',8,14,'canon','psalms',89,23,'free',
      E'*And I will beat down his foes before his face, and plague them that hate him.* (Psalm 89:23). The covenant psalm of David''s house declares the same preserving hand: Edom, Moab, Syria are the *foes before his face* beaten down, the lived form of *Yahuah (LORD) preserved David whithersoever he went* (8:14).'),
    -- Thread 2: dedicated spoil unto Yahuah for the house (8:11)
    ('canon','2-samuel',8,11,'canon','2-samuel',7,13,'free',
      E'*He shall build an house for my name, and I will stablish the throne of his kingdom for ever.* (2 Samuel 7:13). David may not build the house, but he gathers its treasure: the silver and gold *did dedicate unto Yahuah (LORD)* (8:11) is laid up for the house his seed will raise *for my name* — the king consecrating the spoil of the nations to the temple he will not live to see.'),
    ('canon','2-samuel',8,11,'canon','1-chronicles',18,8,'free',
      E'*Likewise from Tibhath, and from Chun, cities of Hadarezer, brought David very much brass, wherewith Solomon made the brasen sea, and the pillars, and the vessels of brass.* (1 Chronicles 18:8). The Chronicler tells what the spoil became: the very brass David takes here is the metal of Solomon''s temple — proof that *did dedicate unto Yahuah (LORD)* (8:11) was treasure stored for the house of the Name.'),
    ('canon','2-samuel',8,11,'canon','1-chronicles',18,11,'free',
      E'*Them also king David dedicated unto Yahuah (LORD), with the silver and the gold that he brought from all these nations; from Edom, and from Moab, and from the children of Ammon, and from the Philistines, and from Amalek.* (1 Chronicles 18:11). The parallel record of *Which also king David did dedicate unto Yahuah (LORD)* (8:11) — the spoil of all the subdued nations set apart not for the king''s glory but for Yahuah''s house.'),
    -- Thread 3: judgment and justice — the king of righteousness (8:15)
    ('canon','2-samuel',8,15,'canon','psalms',72,1,'free',
      E'*Give the king thy judgments, O Elohim (God), and thy righteousness unto the king''s son.* (Psalm 72:1). Solomon''s psalm of the ideal king prays for exactly what 8:15 reports: *David executed judgment and justice unto all his people* is the firstfruit of the throne whose son shall *judge thy people with righteousness* and reach *from sea to sea* (Psalm 72:2,8).'),
    ('canon','2-samuel',8,15,'canon','psalms',72,4,'free',
      E'*He shall judge the poor of the people, he shall save the children of the needy, and shall break in pieces the oppressor.* (Psalm 72:4). The justice David begins — *judgment and justice unto all his people* (8:15) — opens upon the everlasting reign where the King defends *the poor of the people* against every oppressor.'),
    ('canon','2-samuel',8,15,'canon','isaiah',9,7,'free',
      E'*Of the increase of his government and peace there shall be no end, upon the throne of David, and upon his kingdom, to order it, and to establish it with judgment and with justice from henceforth even for ever. The zeal of Yahuah Tseva''ot (LORD of hosts) will perform this.* (Isaiah 9:7). The same paired words — *with judgment and with justice* — name the substance whose shadow is 8:15: David''s righteous reign points to the child *unto us a son is given* (Isaiah 9:6) on the unending *throne of David*, the Formed Davidic King.'),
    ('canon','2-samuel',8,15,'canon','jeremiah',23,5,'free',
      E'*Behold, the days come, saith Yahuah (LORD), that I will raise unto David a righteous Branch, and a King shall reign and prosper, and shall execute judgment and justice in the earth.* (Jeremiah 23:5). The promise echoes David''s deed in his very words: as *David executed judgment and justice* (8:15), so the righteous Branch *shall execute judgment and justice in the earth*, *and this is his name whereby he shall be called, Yahuah Tsidkenu (THE LORD OUR RIGHTEOUSNESS)* (Jeremiah 23:6) — Yahudah saved and Yashar''el dwelling safely, the two houses under one righteous King.'),
    ('canon','2-samuel',8,15,'canon','psalms',89,14,'free',
      E'*Justice and judgment are the habitation of thy throne: mercy and truth shall go before thy face.* (Psalm 89:14). The throne David sat upon to do *judgment and justice unto all his people* (8:15) is founded on Yahuah''s own — *justice and judgment are the habitation of thy throne* — the king imaging the King.'),
    -- Thread 4: Edom subdued / Star and Sceptre (8:14)
    ('canon','2-samuel',8,14,'canon','numbers',24,17,'free',
      E'*I shall see him, but not now: I shall behold him, but not nigh: there shall come a Star out of Jacob, and a Sceptre shall rise out of Yashar''el (Israel), and shall smite the corners of Moab, and destroy all the children of Sheth.* (Numbers 24:17). Balaam''s oracle is being kept in the field: David smites *Moab* (8:2) and puts *garrisons in Edom* (8:14), the Sceptre out of Yashar''el beginning the work the greater Son will finish.'),
    ('canon','2-samuel',8,14,'canon','numbers',24,18,'free',
      E'*And Edom shall be a possession, Seir also shall be a possession for his enemies; and Yashar''el (Israel) shall do valiantly.* (Numbers 24:18). The word spoken over the wilderness is fulfilled at 8:14 — *all they of Edom became David''s servants* — *Edom shall be a possession* under the rising Sceptre, *and Yashar''el (Israel) shall do valiantly*.'),
    ('canon','2-samuel',8,14,'canon','numbers',24,19,'free',
      E'*Out of Jacob shall come he that shall have dominion, and shall destroy him that remaineth of the city.* (Numbers 24:19). David is the early form of the One *out of Jacob* who *shall have dominion*: the garrisons of Edom and Damascus are dominion begun, awaiting the everlasting King in whom the oracle comes to its end.'),
    ('canon','2-samuel',8,14,'canon','genesis',15,18,'free',
      E'*In the same day Yahuah (LORD) made a covenant with Abram, saying, Unto thy seed have I given this land, from the river of Egypt unto the great river, the river Euphrates.* (Genesis 15:18). David''s conquest reaches *to recover his border at the river Euphrates* (8:3) and subdues Edom (8:14) — the kingdom stretching toward the very bounds Yahuah gave *unto thy seed*, the Abrahamic land-promise advancing under the king.'),
    ('canon','2-samuel',8,14,'canon','psalms',60,8,'free',
      E'*Moab is my washpot; over Edom will I cast out my shoe: Philistia, triumph thou because of me.* (Psalm 60:8). David''s own war-psalm sings 8:14 as worship — Moab, Edom, Philistia, the same nations of this chapter, claimed by Yahuah''s word: *Elohim (God) hath spoken in his holiness... over Edom will I cast out my shoe*, the casting-down of Edom done as Yahuah said.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s341_2sa08_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s341_2sa08_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-samuel-8-yahuah-preserved-david-whithersoever-he-went',
  E'Yahuah preserved David whithersoever he went',
  E'Twice this chapter the refrain falls like a seal on the conquest: *And Yahuah (LORD) preserved David whithersoever he went* (2 Samuel 8:6,14). It is not a new word — it is the night-vision of the chapter before walking out into the field. Nathan had carried Yahuah''s promise: *And I was with thee whithersoever thou wentest, and have cut off all thine enemies out of thy sight, and have made thee a great name, like unto the name of the great men that are in the earth* (2 Samuel 7:9), *and have caused thee to rest from all thine enemies* (2 Samuel 7:11). 2 Samuel 8 is that *whithersoever* kept — Philistines, Moab, Zobah, Syria, and Edom subdued, the *rest from all thine enemies* given, the *great name* gat (8:13).\n\nDavid knew the hand behind the sword. In his song he sings: *It is Elohim (God) that avengeth me, and subdueth the people under me* (Psalm 18:47). And the covenant psalm of his house declares the same preserving promise over the king: *And I will beat down his foes before his face, and plague them that hate him* (Psalm 89:23). The conquest is real, but the Preserver is the point — the covenant of 2 Samuel 7 unfolding into the rest it promised.',
  sv.verse_id, ev.verse_id, 'free', 37425
  FROM _s341_2sa08_lookup sv, _s341_2sa08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=8 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='2-samuel' AND ev.chapter_number=8 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-samuel-8-david-dedicated-the-spoil-unto-yahuah-for-the-house',
  E'David dedicated the spoil unto Yahuah for the house',
  E'David is forbidden to build the house, yet he spends his conquests gathering its treasure. *Which also king David did dedicate unto Yahuah (LORD), with the silver and gold that he had dedicated of all nations which he subdued* (2 Samuel 8:11) — the spoil of Syria, Moab, Ammon, the Philistines, Amalek, and Zobah (8:12) set apart not for the king''s glory but for the Name. For Yahuah had said: *He shall build an house for my name, and I will stablish the throne of his kingdom for ever* (2 Samuel 7:13). The father lays up what the son will lift.\n\nThe Chronicler shows the spoil''s end. The brass of Hadarezer''s cities was the very metal of the temple: *Likewise from Tibhath, and from Chun, cities of Hadarezer, brought David very much brass, wherewith Solomon made the brasen sea, and the pillars, and the vessels of brass* (1 Chronicles 18:8). And the dedication is recorded again: *Them also king David dedicated unto Yahuah (LORD), with the silver and the gold that he brought from all these nations* (1 Chronicles 18:11). The wars of David become the furniture of worship — every conquered nation''s gold returned to Yahuah, consecrated for the house of his seed.',
  sv.verse_id, ev.verse_id, 'free', 37428
  FROM _s341_2sa08_lookup sv, _s341_2sa08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=8 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='2-samuel' AND ev.chapter_number=8 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-samuel-8-judgment-and-justice-the-king-of-righteousness',
  E'Judgment and justice — the king of righteousness',
  E'One verse holds the heart of David''s kingship: *And David reigned over all Yashar''el (Israel); and David executed judgment and justice unto all his people* (2 Samuel 8:15). Not conquest only — righteousness. This is the throne imaging the throne of heaven, for *justice and judgment are the habitation of thy throne: mercy and truth shall go before thy face* (Psalm 89:14). The king sits where Yahuah sits, and does what Yahuah does.\n\nAnd it is a shadow thrown forward. The royal psalm prays the same: *Give the king thy judgments, O Elohim (God), and thy righteousness unto the king''s son... He shall judge the poor of the people, he shall save the children of the needy, and shall break in pieces the oppressor* (Psalm 72:1,4). Isaiah names the increase that has no end: *upon the throne of David, and upon his kingdom, to order it, and to establish it with judgment and with justice from henceforth even for ever* (Isaiah 9:7) — for *unto us a son is given* (Isaiah 9:6). And Jeremiah seals it in David''s own words: *I will raise unto David a righteous Branch, and a King shall reign and prosper, and shall execute judgment and justice in the earth. In his days Yahudah (Judah) shall be saved, and Yashar''el (Israel) shall dwell safely: and this is his name whereby he shall be called, Yahuah Tsidkenu (THE LORD OUR RIGHTEOUSNESS)* (Jeremiah 23:5-6). David''s *judgment and justice* is the firstfruit; the Formed Davidic King is the full harvest — and under him the two houses, Yahudah and Yashar''el, become one safe people.',
  sv.verse_id, ev.verse_id, 'free', 37431
  FROM _s341_2sa08_lookup sv, _s341_2sa08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=8 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='2-samuel' AND ev.chapter_number=8 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-samuel-8-edom-subdued-the-star-and-sceptre-out-of-jacob',
  E'Edom subdued — the Star and Sceptre out of Jacob',
  E'*And he put garrisons in Edom; throughout all Edom put he garrisons, and all they of Edom became David''s servants* (2 Samuel 8:14). This is Balaam''s oracle keeping its appointment. From the wilderness the unwilling prophet had seen: *there shall come a Star out of Jacob, and a Sceptre shall rise out of Yashar''el (Israel), and shall smite the corners of Moab, and destroy all the children of Sheth* (Numbers 24:17); *And Edom shall be a possession, Seir also shall be a possession for his enemies; and Yashar''el (Israel) shall do valiantly* (Numbers 24:18); *Out of Jacob shall come he that shall have dominion* (Numbers 24:19). David smites Moab (8:2) and possesses Edom (8:14) — the Sceptre rising, the dominion begun.\n\nThe borders reach as far as the covenant first drawn: David goes *to recover his border at the river Euphrates* (8:3), and Yahuah had sworn to Abram, *Unto thy seed have I given this land, from the river of Egypt unto the great river, the river Euphrates* (Genesis 15:18). David sings the whole campaign back as worship: *Moab is my washpot; over Edom will I cast out my shoe* (Psalm 60:8). Yet the oracle outruns the man — *Out of Jacob shall come he that shall have dominion* awaits the everlasting King in whom the Star out of Jacob shines and the Sceptre never falls.',
  sv.verse_id, ev.verse_id, 'free', 37434
  FROM _s341_2sa08_lookup sv, _s341_2sa08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=8 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='2-samuel' AND ev.chapter_number=8 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- ===== thread_members =====
-- Thread 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*And I was with thee whithersoever thou wentest, and have... made thee a great name* (2 Samuel 7:9) — the night-promise behind the field-refrain of 8:6.'
  FROM cross_reference_threads t
  JOIN _s341_2sa08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=8 AND sv.verse_number=6
  JOIN _s341_2sa08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-8-yahuah-preserved-david-whithersoever-he-went'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*And have caused thee to rest from all thine enemies* (2 Samuel 7:11) — the rest given in this chapter''s conquest.'
  FROM cross_reference_threads t
  JOIN _s341_2sa08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=8 AND sv.verse_number=6
  JOIN _s341_2sa08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-8-yahuah-preserved-david-whithersoever-he-went'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*It is Elohim (God) that avengeth me, and subdueth the people under me* (Psalm 18:47) — David names the hand behind the victories.'
  FROM cross_reference_threads t
  JOIN _s341_2sa08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=8 AND sv.verse_number=6
  JOIN _s341_2sa08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=18 AND tv.verse_number=47
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-8-yahuah-preserved-david-whithersoever-he-went'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*I was with thee whithersoever thou wentest, and have cut off all thine enemies* (2 Samuel 7:9) — the refrain''s second sounding at 8:14.'
  FROM cross_reference_threads t
  JOIN _s341_2sa08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=8 AND sv.verse_number=14
  JOIN _s341_2sa08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-8-yahuah-preserved-david-whithersoever-he-went'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*And I will beat down his foes before his face* (Psalm 89:23) — the covenant psalm''s preserving promise over David''s house.'
  FROM cross_reference_threads t
  JOIN _s341_2sa08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=8 AND sv.verse_number=14
  JOIN _s341_2sa08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=89 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-8-yahuah-preserved-david-whithersoever-he-went'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*He shall build an house for my name* (2 Samuel 7:13) — the house David''s dedicated spoil is laid up for.'
  FROM cross_reference_threads t
  JOIN _s341_2sa08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=8 AND sv.verse_number=11
  JOIN _s341_2sa08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-8-david-dedicated-the-spoil-unto-yahuah-for-the-house'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*...wherewith Solomon made the brasen sea, and the pillars, and the vessels of brass* (1 Chronicles 18:8) — the spoil''s end: temple furniture.'
  FROM cross_reference_threads t
  JOIN _s341_2sa08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=8 AND sv.verse_number=11
  JOIN _s341_2sa08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=18 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-8-david-dedicated-the-spoil-unto-yahuah-for-the-house'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Them also king David dedicated unto Yahuah (LORD), with the silver and the gold* (1 Chronicles 18:11) — the parallel dedication record.'
  FROM cross_reference_threads t
  JOIN _s341_2sa08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=8 AND sv.verse_number=11
  JOIN _s341_2sa08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=18 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-8-david-dedicated-the-spoil-unto-yahuah-for-the-house'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Give the king thy judgments, O Elohim (God), and thy righteousness unto the king''s son* (Psalm 72:1) — the royal psalm of the ideal righteous reign.'
  FROM cross_reference_threads t
  JOIN _s341_2sa08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=8 AND sv.verse_number=15
  JOIN _s341_2sa08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=72 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-8-judgment-and-justice-the-king-of-righteousness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*He shall judge the poor of the people... and shall break in pieces the oppressor* (Psalm 72:4) — justice for the needy under the King.'
  FROM cross_reference_threads t
  JOIN _s341_2sa08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=8 AND sv.verse_number=15
  JOIN _s341_2sa08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=72 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-8-judgment-and-justice-the-king-of-righteousness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*...to establish it with judgment and with justice... upon the throne of David* (Isaiah 9:7) — the unending throne David''s reign foreshadows.'
  FROM cross_reference_threads t
  JOIN _s341_2sa08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=8 AND sv.verse_number=15
  JOIN _s341_2sa08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=9 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-8-judgment-and-justice-the-king-of-righteousness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*A righteous Branch... shall execute judgment and justice in the earth... Yahuah Tsidkenu* (Jeremiah 23:5-6) — the same words, the two houses made safe.'
  FROM cross_reference_threads t
  JOIN _s341_2sa08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=8 AND sv.verse_number=15
  JOIN _s341_2sa08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=23 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-8-judgment-and-justice-the-king-of-righteousness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Justice and judgment are the habitation of thy throne* (Psalm 89:14) — the king''s throne founded on Yahuah''s own.'
  FROM cross_reference_threads t
  JOIN _s341_2sa08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=8 AND sv.verse_number=15
  JOIN _s341_2sa08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=89 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-8-judgment-and-justice-the-king-of-righteousness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*There shall come a Star out of Jacob, and a Sceptre shall rise out of Yashar''el* (Numbers 24:17) — Balaam''s oracle begun in David''s conquest of Moab and Edom.'
  FROM cross_reference_threads t
  JOIN _s341_2sa08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=8 AND sv.verse_number=14
  JOIN _s341_2sa08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=24 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-8-edom-subdued-the-star-and-sceptre-out-of-jacob'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*And Edom shall be a possession... and Yashar''el (Israel) shall do valiantly* (Numbers 24:18) — fulfilled as all Edom become David''s servants.'
  FROM cross_reference_threads t
  JOIN _s341_2sa08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=8 AND sv.verse_number=14
  JOIN _s341_2sa08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=24 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-8-edom-subdued-the-star-and-sceptre-out-of-jacob'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Out of Jacob shall come he that shall have dominion* (Numbers 24:19) — David the early form of the everlasting dominion.'
  FROM cross_reference_threads t
  JOIN _s341_2sa08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=8 AND sv.verse_number=14
  JOIN _s341_2sa08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=24 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-8-edom-subdued-the-star-and-sceptre-out-of-jacob'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Unto thy seed have I given this land... unto the great river, the river Euphrates* (Genesis 15:18) — the border David recovers at the river.'
  FROM cross_reference_threads t
  JOIN _s341_2sa08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=8 AND sv.verse_number=14
  JOIN _s341_2sa08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-8-edom-subdued-the-star-and-sceptre-out-of-jacob'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Moab is my washpot; over Edom will I cast out my shoe* (Psalm 60:8) — David sings the campaign back as worship.'
  FROM cross_reference_threads t
  JOIN _s341_2sa08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=8 AND sv.verse_number=14
  JOIN _s341_2sa08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=60 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-8-edom-subdued-the-star-and-sceptre-out-of-jacob'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2-samuel_9.sql (2 Samuel 9) -----
--
-- 2 Samuel 9 — David's kindness to Mephibosheth for Jonathan's sake
-- TAG: 2sa09   VIEW: _s341_2sa09_lookup   SORT BAND: base 37450, step 3 (37450, 37453, 37456)
--
-- Framework frame: covenant chesed kept to the seed — the OATH to Jonathan honoured (1 Sam
-- 20:14-17,42); the lame heir of the fallen house, undeserving ("a dead dog"), brought to the
-- king's table by covenant-love for another's sake. The king's-table grace is a vivid pattern of
-- undeserved kindness for the sake of a covenant — read FORWARD as Eph 2 (made nigh, seated) and
-- Luke 14 (the poor/lame brought to the feast). NOT a false-inclusion gospel: the kindness is
-- covenant-love HONOURED for Jonathan's sake, the sworn word kept, not a stranger grafted in by
-- nothing. The Tanakh sets the type; the table is the seed's table.
--
-- 2 Samuel 9 coverage:
--   v.1  (Is there yet any left of the house of Saul, that I may shew kindness for Jonathan's sake)
--        NT:     none warranted (Tanakh-internal oath fulfilment; weave forward at v.7)
--        Extras: none warranted
--        Tanakh: 1 Sam 20:14-15 (kindness of Yahuah not cut off from my house), 1 Sam 20:42 (sworn
--                seed-to-seed), 1 Sam 18:3 (covenant made) — THREAD 1 (oath honoured)
--   v.3  (kindness of Elohim; Jonathan hath yet a son, lame on his feet)
--        NT:     none warranted directly (lame-heir type weaves forward via the table at v.7)
--        Extras: none warranted
--        Tanakh: 2 Sam 4:4 (Mephibosheth made lame as a child), 1 Sam 20:14 (kindness of Yahuah) —
--                THREAD 1 + THREAD 2 (lame heir)
--   v.6  (Mephibosheth fell on his face, did reverence; Behold thy servant)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: 2 Sam 4:4 (his lameness), 2 Sam 19:24,28 (his later abiding at the table) — THREAD 2
--   v.7  (Fear not; I will surely shew thee kindness for Jonathan thy father's sake; restore thee
--        all the land; thou shalt eat bread at my table continually)
--        NT:     Eph 2:4-7 (rich in mercy, raised up, made to sit together), Eph 2:12-13 (aliens
--                made nigh), Luke 14:13/21 (call the poor, maimed, lame, blind to the feast) — THREAD 3
--        Extras: none warranted
--        Tanakh: 1 Sam 20:15 (kindness not cut off from my house) — THREAD 1
--   v.8  (What is thy servant, that thou shouldest look upon such a dead dog as I am?)
--        NT:     Eph 2:12-13 (without Messiah, aliens... made nigh) — THREAD 3 (the undeserving)
--        Extras: none warranted
--        Tanakh: 2 Sam 19:28 (all my father's house were but dead men... yet thou set thy servant
--                among them that did eat at thine own table) — THREAD 2
--   v.10 (Mephibosheth thy master's son shall eat bread alway at my table)
--        NT:     Luke 14:21 (bring in the poor, maimed, halt, blind) — THREAD 3
--        Extras: none warranted
--        Tanakh: none warranted (restatement of v.7)
--   v.11 (he shall eat at my table, as one of the king's sons)
--        NT:     Eph 2:19 (no more strangers and foreigners, but fellowcitizens... of the household
--                of Elohim) — THREAD 3
--        Extras: none warranted
--        Tanakh: none warranted
--   v.13 (Mephibosheth dwelt in Jerusalem: he did eat continually at the king's table; and was lame
--        on both his feet)
--        NT:     Eph 2:6 (made sit together in heavenly places) — THREAD 3
--        Extras: none warranted
--        Tanakh: 2 Sam 4:4 (lame on both feet — the wound that never leaves) — THREAD 2
--   v.2,4,5,9,12 — narrative connective (Ziba, Lo-debar, Machir, Micha); none warranted
--
-- THREADS:
--   1. 2-samuel-9-kindness-for-jonathans-sake-the-oath-honoured   (Tanakh: 1 Samuel) — free
--   2. 2-samuel-9-the-lame-heir-of-the-fallen-house-mephibosheth   (Tanakh: 1-2 Samuel) — free
--   3. 2-samuel-9-bread-at-the-kings-table-continually             (NT: Ephesians, Luke) — free
--
-- Contested framing: THREAD 3 (king's-table grace). Framed as covenant-love HONOURED for
-- Jonathan's sake (the sworn word kept), the undeserving heir of the fallen house seated by the
-- king — Eph 2's "made nigh / made to sit together" and Luke 14's lame-brought-to-the-feast read
-- as the SAME chesed-pattern, NOT a false-inclusion that severs grace from covenant.

CREATE TEMP VIEW _s341_2sa09_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================ CROSS_REFERENCES ============================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: kindness for Jonathan's sake — the oath honoured (1 Samuel)
    ('canon','2-samuel',9,1,'canon','1-samuel',20,15,'free',
     E'*But also thou shalt not cut off thy kindness from my house for ever: no, not when Yahuah (LORD) hath cut off the enemies of David every one from the face of the earth.* (1 Samuel 20:15). David''s opening question — *Is there yet any that is left of the house of Saul, that I may shew him kindness for Jonathan''s sake?* (2 Samuel 9:1) — is the oath remembered. Jonathan made David swear that his kindness (chesed) would not be cut off from Jonathan''s house *for ever*. Now the house of Saul is fallen and its enemies cut off, and David reaches back to keep the sworn word. Covenant-love honoured to the seed, not lineage erased.'),
    ('canon','2-samuel',9,1,'canon','1-samuel',20,42,'free',
     E'*And Jonathan said to David, Go in peace, forasmuch as we have sworn both of us in the name of Yahuah (LORD), saying, Yahuah (LORD) be between me and thee, and between my seed and thy seed for ever. And he arose and departed.* (1 Samuel 20:42). The oath was sworn *between my seed and thy seed for ever* — in the Name. David''s kindness *for Jonathan''s sake* (2 Samuel 9:1) is that very seed-to-seed oath kept: Jonathan''s seed (Mephibosheth) shown chesed by David''s house, the sworn word standing past Jonathan''s death.'),
    ('canon','2-samuel',9,1,'canon','1-samuel',18,3,'free',
     E'*Then Jonathan and David made a covenant, because he loved him as his own soul.* (1 Samuel 18:3). The kindness David seeks *for Jonathan''s sake* (2 Samuel 9:1) rests on this first covenant — the love that *knit* their souls. The chesed of chapter 9 is not sentiment but a covenant-bond being honoured; the king keeps faith with the one he swore to.'),
    ('canon','2-samuel',9,3,'canon','1-samuel',20,14,'free',
     E'*And thou shalt not only while yet I live shew me the kindness of Yahuah (LORD), that I die not:* (1 Samuel 20:14). When David asks to *shew the kindness of Elohim (God)* to Saul''s house (2 Samuel 9:3), he names the very thing Jonathan named — *the kindness of Yahuah*. The mercy David extends is covenant-mercy after the pattern of Yahuah''s own chesed, the sworn kindness now reaching Jonathan''s lame son.'),
    ('canon','2-samuel',9,7,'canon','1-samuel',20,15,'free',
     E'*But also thou shalt not cut off thy kindness from my house for ever...* (1 Samuel 20:15). David''s pledge — *I will surely shew thee kindness for Jonathan thy father''s sake, and will restore thee all the land of Saul thy father; and thou shalt eat bread at my table continually* (2 Samuel 9:7) — is the exact discharge of this oath: the kindness *not cut off from my house for ever* now made concrete in restored land and a seat at the king''s table. The sworn word becomes bread and inheritance.'),

    -- THREAD 2: the lame heir of the fallen house — Mephibosheth (1-2 Samuel)
    ('canon','2-samuel',9,3,'canon','2-samuel',4,4,'free',
     E'*And Jonathan, Saul''s son, had a son that was lame of his feet. He was five years old when the tidings came of Saul and Jonathan out of Jezreel, and his nurse took him up, and fled: and it came to pass, as she made haste to flee, that he fell, and became lame. And his name was Mephibosheth.* (2 Samuel 4:4). Ziba''s answer — *Jonathan hath yet a son, which is lame on his feet* (2 Samuel 9:3) — points back to this fall. The heir of the house of Saul was crippled in the day his house collapsed; he is the wounded remnant of the fallen line, and it is to him the king''s kindness will come.'),
    ('canon','2-samuel',9,6,'canon','2-samuel',4,4,'free',
     E'*And Jonathan, Saul''s son, had a son that was lame of his feet... and his name was Mephibosheth.* (2 Samuel 4:4). When *Mephibosheth, the son of Jonathan, the son of Saul, was come unto David, he fell on his face, and did reverence* (2 Samuel 9:6), this is that same lame child grown — the last of the fallen house, bowing in fear before the king who had every earthly reason to cut him off, yet is summoned for kindness.'),
    ('canon','2-samuel',9,8,'canon','2-samuel',19,28,'free',
     E'*For all of my father''s house were but dead men before my lord the king: yet didst thou set thy servant among them that did eat at thine own table. What right therefore have I yet to cry any more unto the king?* (2 Samuel 19:28). Mephibosheth''s self-naming as *such a dead dog as I am* (2 Samuel 9:8) is the same confession he repeats later: the heir of a house of *dead men* counts himself nothing, and marvels that the king sets him at his own table. The undeserving knows he is undeserving — and is seated anyway.'),
    ('canon','2-samuel',9,13,'canon','2-samuel',4,4,'free',
     E'*...his nurse took him up, and fled: and it came to pass, as she made haste to flee, that he fell, and became lame.* (2 Samuel 4:4). The chapter closes by returning to the wound: *So Mephibosheth dwelt in Jerusalem: for he did eat continually at the king''s table; and was lame on both his feet* (2 Samuel 9:13). The lameness never leaves; the man who eats at the king''s table is still the broken child of Jezreel. Grace seats him; it does not erase the scar of the fall.'),
    ('canon','2-samuel',9,13,'canon','2-samuel',19,24,'free',
     E'*And Mephibosheth the son of Saul came down to meet the king, and had neither dressed his feet, nor trimmed his beard, nor washed his clothes, from the day the king departed until the day he came again in peace.* (2 Samuel 19:24). The man who *did eat continually at the king''s table; and was lame on both his feet* (2 Samuel 9:13) appears again later as the king''s loyal mourner. The table-fellowship begun here in chapter 9 holds: the lame heir is bound to David''s house in faithful love, not merely fed once.'),

    -- THREAD 3: bread at the king's table continually (Ephesians, Luke)
    ('canon','2-samuel',9,7,'canon','ephesians',2,4,'free',
     E'*But Elohim (God), who is rich in mercy, for his great love wherewith he loved us,* (Ephesians 2:4). David''s *Fear not... thou shalt eat bread at my table continually* (2 Samuel 9:7) is the lived shape of mercy-rich love: the king reaching to the undeserving heir of the fallen house. The pattern Sha''ul (Paul) names — Elohim *rich in mercy, for his great love* — is the same chesed seating the lame outcast at the table.'),
    ('canon','2-samuel',9,7,'canon','ephesians',2,6,'free',
     E'*And hath raised us up together, and made us sit together in heavenly places in HaMashiach Yahusha (Christ Jesus).* (Ephesians 2:6). The king *made* Mephibosheth *sit* — *thou shalt eat bread at my table continually* (2 Samuel 9:7) — the fallen heir lifted from Lo-debar (no-pasture) and seated with the king''s sons. So Ephesians sings: *made sit together*. The table-grace of David''s house foreshadows being raised up and seated by the King for the covenant''s sake, not our own.'),
    ('canon','2-samuel',9,7,'canon','luke',14,13,'free',
     E'*But when thou makest a feast, call the poor, the maimed, the lame, the blind:* (Luke 14:13). The king who restores the land and says *thou shalt eat bread at my table continually* (2 Samuel 9:7) to a man *lame on both his feet* enacts the feast Yahusha (Jesus) commands: *call... the lame*. David''s table is the Tanakh type of the King who seats the lame and maimed at his board for love''s sake, not for what they can repay.'),
    ('canon','2-samuel',9,8,'canon','ephesians',2,12,'free',
     E'*That at that time ye were without Messiah (Christ), being aliens from the commonwealth of Yashar''el (Israel), and strangers from the covenants of promise, having no hope, and without Elohim (God) in the world:* (Ephesians 2:12). Mephibosheth''s *What is thy servant, that thou shouldest look upon such a dead dog as I am?* (2 Samuel 9:8) is the voice of the one without claim — the alien, the hopeless, the dead-dog estate. The wonder of the table is that the King looks upon exactly such, and brings the far-off near.'),
    ('canon','2-samuel',9,8,'canon','ephesians',2,13,'free',
     E'*But now in HaMashiach Yahusha (Christ Jesus) ye who sometimes were far off are made nigh by the blood of Messiah (Christ).* (Ephesians 2:13). The *dead dog* of Lo-debar (2 Samuel 9:8) is *made nigh* — fetched from the far house and set at the king''s table. The far-off brought near is the very shape of David''s kindness: covenant-love reaching the one with no standing, for the sake of the oath.'),
    ('canon','2-samuel',9,10,'canon','luke',14,21,'free',
     E'*...Then the master of the house being angry said to his servant, Go out quickly into the streets and lanes of the city, and bring in hither the poor, and the maimed, and the halt, and the blind.* (Luke 14:21). The decree *Mephibosheth thy master''s son shall eat bread alway at my table* (2 Samuel 9:10) is the King''s standing order to bring in *the halt* and set them at the feast. David''s permanent place for the lame heir prefigures the great supper where the maimed and halt are sought out and seated.'),
    ('canon','2-samuel',9,11,'canon','ephesians',2,19,'free',
     E'*Now therefore ye are no more strangers and foreigners, but fellowcitizens with the saints, and of the household of Elohim (God);* (Ephesians 2:19). *He shall eat at my table, as one of the king''s sons* (2 Samuel 9:11): the heir of the enemy house is reckoned a son of the king''s household. So the far-off become *no more strangers... but... of the household of Elohim* — not strangers grafted by nothing, but brought into the household by the King''s covenant-kindness.'),
    ('canon','2-samuel',9,13,'canon','ephesians',2,6,'free',
     E'*And hath raised us up together, and made us sit together in heavenly places in HaMashiach Yahusha (Christ Jesus).* (Ephesians 2:6). The closing word — *he did eat continually at the king''s table; and was lame on both his feet* (2 Samuel 9:13) — holds both truths at once: seated with the king''s sons, yet still lame. So the saints are *made sit together* while the scars of the old estate remain; the King''s table does not wait for the worthy, it seats the broken and keeps them there.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s341_2sa09_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s341_2sa09_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================ THREADS ============================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-samuel-9-kindness-for-jonathans-sake-the-oath-honoured',
       E'Kindness for Jonathan''s sake — the oath honoured',
       E'David''s first words are an oath remembered: *Is there yet any that is left of the house of Saul, that I may shew him kindness for Jonathan''s sake?* (2 Samuel 9:1), and again, *Is there not yet any of the house of Saul, that I may shew the kindness of Elohim (God) unto him?* (2 Samuel 9:3). This is no spontaneous mercy. Jonathan had bound David by covenant: *Then Jonathan and David made a covenant, because he loved him as his own soul* (1 Samuel 18:3), and made him swear, *thou shalt not only while yet I live shew me the kindness of Yahuah (LORD)... But also thou shalt not cut off thy kindness from my house for ever* (1 Samuel 20:14-15). The parting oath was sealed in the Name and reached to the seed: *Yahuah (LORD) be between me and thee, and between my seed and thy seed for ever* (1 Samuel 20:42). Now Saul''s house is fallen and David is king, and the sworn word stands. His pledge — *I will surely shew thee kindness for Jonathan thy father''s sake, and will restore thee all the land of Saul thy father; and thou shalt eat bread at my table continually* (2 Samuel 9:7) — is the chesed of Yahuah kept to the seed of the one he loved. Covenant-love honoured, the oath discharged in land and bread; the framework''s seed-promise carried by sworn word and not by lineage erased.',
       sv.verse_id, ev.verse_id, 'free', 37450
  FROM _s341_2sa09_lookup sv, _s341_2sa09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=9 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='2-samuel' AND ev.chapter_number=9 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-samuel-9-the-lame-heir-of-the-fallen-house-mephibosheth',
       E'The lame heir of the fallen house — Mephibosheth',
       E'The one David seeks is the wounded remnant of a collapsed line. Ziba answers, *Jonathan hath yet a son, which is lame on his feet* (2 Samuel 9:3), and the reader knows the wound: *Jonathan, Saul''s son, had a son that was lame of his feet. He was five years old when the tidings came of Saul and Jonathan out of Jezreel, and his nurse took him up, and fled: and it came to pass, as she made haste to flee, that he fell, and became lame. And his name was Mephibosheth* (2 Samuel 4:4). He was crippled in the very day his house fell. Fetched from Lo-debar, *Mephibosheth, the son of Jonathan, the son of Saul, was come unto David, he fell on his face, and did reverence* (2 Samuel 9:6), and named himself nothing: *What is thy servant, that thou shouldest look upon such a dead dog as I am?* (2 Samuel 9:8). It is the same confession he makes later — *all of my father''s house were but dead men before my lord the king: yet didst thou set thy servant among them that did eat at thine own table* (2 Samuel 19:28) — and the same loyal mourner who *had neither dressed his feet, nor trimmed his beard... until the day he came again in peace* (2 Samuel 19:24). The chapter ends as it must: *So Mephibosheth dwelt in Jerusalem: for he did eat continually at the king''s table; and was lame on both his feet* (2 Samuel 9:13). Grace seats the broken heir; it does not erase the scar of the fall.',
       sv.verse_id, ev.verse_id, 'free', 37453
  FROM _s341_2sa09_lookup sv, _s341_2sa09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=9 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='2-samuel' AND ev.chapter_number=9 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-samuel-9-bread-at-the-kings-table-continually',
       E'Bread at the king''s table continually',
       E'The pledge that crowns the chapter is repeated four times like a refrain: *thou shalt eat bread at my table continually* (2 Samuel 9:7); *Mephibosheth thy master''s son shall eat bread alway at my table* (2 Samuel 9:10); *he shall eat at my table, as one of the king''s sons* (2 Samuel 9:11); *he did eat continually at the king''s table; and was lame on both his feet* (2 Samuel 9:13). The lame outcast of the enemy house, who calls himself *such a dead dog as I am* (2 Samuel 9:8), is lifted from Lo-debar and seated with the king''s sons — for the sake of an oath, not for anything he could repay. The pattern is the King who is *rich in mercy, for his great love* (Ephesians 2:4), who *hath raised us up together, and made us sit together in heavenly places* (Ephesians 2:6), bringing the one who was *far off... made nigh* (Ephesians 2:13), so *ye are no more strangers and foreigners, but fellowcitizens... of the household of Elohim (God)* (Ephesians 2:19). It is the feast Yahusha (Jesus) commands: *when thou makest a feast, call the poor, the maimed, the lame, the blind* (Luke 14:13), the King''s servants sent to *bring in hither the poor, and the maimed, and the halt, and the blind* (Luke 14:21). Yet the table never severs grace from covenant: the dead-dog heir is seated *for Jonathan''s sake* — covenant-love honoured, the far-off brought near by the King''s sworn kindness, the lame kept at the board continually.',
       sv.verse_id, ev.verse_id, 'free', 37456
  FROM _s341_2sa09_lookup sv, _s341_2sa09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=9 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='2-samuel' AND ev.chapter_number=9 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- ============================ THREAD MEMBERS ============================
-- THREAD 1: kindness for Jonathan's sake — the oath honoured
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*thou shalt not cut off thy kindness from my house for ever* (1 Samuel 20:15) — Jonathan''s oath that David''s chesed would never be cut off from his house; *kindness for Jonathan''s sake* (2 Samuel 9:1) is that oath remembered.'
  FROM cross_reference_threads t
  JOIN _s341_2sa09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=9 AND sv.verse_number=1
  JOIN _s341_2sa09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=20 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-9-kindness-for-jonathans-sake-the-oath-honoured'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*between my seed and thy seed for ever* (1 Samuel 20:42) — the oath sworn in the Name, seed to seed; *for Jonathan''s sake* (2 Samuel 9:1) keeps it to Jonathan''s son.'
  FROM cross_reference_threads t
  JOIN _s341_2sa09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=9 AND sv.verse_number=1
  JOIN _s341_2sa09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=20 AND tv.verse_number=42
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-9-kindness-for-jonathans-sake-the-oath-honoured'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Then Jonathan and David made a covenant, because he loved him as his own soul* (1 Samuel 18:3) — the covenant-bond beneath the kindness *for Jonathan''s sake* (2 Samuel 9:1).'
  FROM cross_reference_threads t
  JOIN _s341_2sa09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=9 AND sv.verse_number=1
  JOIN _s341_2sa09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=18 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-9-kindness-for-jonathans-sake-the-oath-honoured'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*the kindness of Yahuah (LORD)* (1 Samuel 20:14) — Jonathan''s own name for it; David asks to *shew the kindness of Elohim (God)* (2 Samuel 9:3), covenant-mercy after Yahuah''s pattern.'
  FROM cross_reference_threads t
  JOIN _s341_2sa09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=9 AND sv.verse_number=3
  JOIN _s341_2sa09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=20 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-9-kindness-for-jonathans-sake-the-oath-honoured'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*thou shalt not cut off thy kindness from my house for ever* (1 Samuel 20:15) — discharged in *thou shalt eat bread at my table continually* (2 Samuel 9:7): the sworn word made bread and inheritance.'
  FROM cross_reference_threads t
  JOIN _s341_2sa09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=9 AND sv.verse_number=7
  JOIN _s341_2sa09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=20 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-9-kindness-for-jonathans-sake-the-oath-honoured'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2: the lame heir of the fallen house — Mephibosheth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*lame of his feet... he fell, and became lame. And his name was Mephibosheth* (2 Samuel 4:4) — the wound named; *lame on his feet* (2 Samuel 9:3) is this crippled heir of the fallen line.'
  FROM cross_reference_threads t
  JOIN _s341_2sa09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=9 AND sv.verse_number=3
  JOIN _s341_2sa09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=4 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-9-the-lame-heir-of-the-fallen-house-mephibosheth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*a son that was lame of his feet... and his name was Mephibosheth* (2 Samuel 4:4) — the same child grown, now *fell on his face, and did reverence* (2 Samuel 9:6) before the king.'
  FROM cross_reference_threads t
  JOIN _s341_2sa09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=9 AND sv.verse_number=6
  JOIN _s341_2sa09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=4 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-9-the-lame-heir-of-the-fallen-house-mephibosheth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*all of my father''s house were but dead men before my lord the king: yet didst thou set thy servant among them that did eat at thine own table* (2 Samuel 19:28) — the same confession as *such a dead dog as I am* (2 Samuel 9:8): the undeserving heir, seated anyway.'
  FROM cross_reference_threads t
  JOIN _s341_2sa09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=9 AND sv.verse_number=8
  JOIN _s341_2sa09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=19 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-9-the-lame-heir-of-the-fallen-house-mephibosheth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*he fell, and became lame* (2 Samuel 4:4) — the wound that never leaves; *he did eat continually at the king''s table; and was lame on both his feet* (2 Samuel 9:13). Grace seats him; the scar remains.'
  FROM cross_reference_threads t
  JOIN _s341_2sa09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=9 AND sv.verse_number=13
  JOIN _s341_2sa09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=4 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-9-the-lame-heir-of-the-fallen-house-mephibosheth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*had neither dressed his feet, nor trimmed his beard... until the day he came again in peace* (2 Samuel 19:24) — the lame heir is bound to David''s house in loyal love; the table-fellowship of *the king''s table* (2 Samuel 9:13) holds.'
  FROM cross_reference_threads t
  JOIN _s341_2sa09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=9 AND sv.verse_number=13
  JOIN _s341_2sa09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=19 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-9-the-lame-heir-of-the-fallen-house-mephibosheth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3: bread at the king's table continually
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Elohim (God), who is rich in mercy, for his great love* (Ephesians 2:4) — the mercy-rich love that seats the undeserving; the shape of *thou shalt eat bread at my table continually* (2 Samuel 9:7).'
  FROM cross_reference_threads t
  JOIN _s341_2sa09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=9 AND sv.verse_number=7
  JOIN _s341_2sa09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=2 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-9-bread-at-the-kings-table-continually'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*made us sit together in heavenly places* (Ephesians 2:6) — the King makes the lame heir sit; *thou shalt eat bread at my table continually* (2 Samuel 9:7) is the Tanakh type of being raised up and seated.'
  FROM cross_reference_threads t
  JOIN _s341_2sa09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=9 AND sv.verse_number=7
  JOIN _s341_2sa09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=2 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-9-bread-at-the-kings-table-continually'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*call the poor, the maimed, the lame, the blind* (Luke 14:13) — the feast the King commands; David seating the lame at *my table continually* (2 Samuel 9:7) is its type.'
  FROM cross_reference_threads t
  JOIN _s341_2sa09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=9 AND sv.verse_number=7
  JOIN _s341_2sa09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=14 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-9-bread-at-the-kings-table-continually'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*aliens from the commonwealth of Yashar''el (Israel)... having no hope* (Ephesians 2:12) — the no-claim estate; *such a dead dog as I am* (2 Samuel 9:8) is its very voice.'
  FROM cross_reference_threads t
  JOIN _s341_2sa09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=9 AND sv.verse_number=8
  JOIN _s341_2sa09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=2 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-9-bread-at-the-kings-table-continually'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*ye who sometimes were far off are made nigh* (Ephesians 2:13) — the *dead dog* of Lo-debar (2 Samuel 9:8) fetched from the far house and brought near to the king''s table.'
  FROM cross_reference_threads t
  JOIN _s341_2sa09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=9 AND sv.verse_number=8
  JOIN _s341_2sa09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=2 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-9-bread-at-the-kings-table-continually'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*bring in hither the poor, and the maimed, and the halt, and the blind* (Luke 14:21) — the King''s standing order; *shall eat bread alway at my table* (2 Samuel 9:10) is the permanent place for the halt.'
  FROM cross_reference_threads t
  JOIN _s341_2sa09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=9 AND sv.verse_number=10
  JOIN _s341_2sa09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=14 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-9-bread-at-the-kings-table-continually'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*no more strangers and foreigners, but fellowcitizens... of the household of Elohim (God)* (Ephesians 2:19) — *he shall eat at my table, as one of the king''s sons* (2 Samuel 9:11): the heir reckoned a son of the household.'
  FROM cross_reference_threads t
  JOIN _s341_2sa09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=9 AND sv.verse_number=11
  JOIN _s341_2sa09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=2 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-9-bread-at-the-kings-table-continually'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*made us sit together in heavenly places* (Ephesians 2:6) — both truths held: *he did eat continually at the king''s table; and was lame on both his feet* (2 Samuel 9:13). Seated with the sons, yet still lame.'
  FROM cross_reference_threads t
  JOIN _s341_2sa09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=9 AND sv.verse_number=13
  JOIN _s341_2sa09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=2 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-9-bread-at-the-kings-table-continually'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2-samuel_10.sql (2 Samuel 10) -----
-- 2 Samuel 10 — full-library cross-references — Yoshi's Remnant Bible
-- TAG: 2sa10   VIEW: _s341_2sa10_lookup   SORT BAND: 37475 step 3 (37475, 37478)
-- SOURCE rows all 'canon','2-samuel',10,v
--
-- 2 Samuel 10 coverage:
--   v.1-5  (kindness spurned: David comforts Hanun, Hanun shames the ambassadors)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: 1-chronicles 19:1-5 (the parallel account, the same kindness-shamed)  -> THREAD A
--   v.6-11 (Ammon hires Syria; Joab & Abishai caught between two armies, set the battle)
--          NT:     none warranted (battle logistics)
--          Extras: none warranted
--          Tanakh: 1-chronicles 19:6-15 (parallel)  -> folded into THREAD A as the war's frame; spine is v.12
--   v.12   (★ Be of good courage... and Yahuah do that which seemeth him good — courage WITH submission)
--          NT:     1-corinthians 16:13 (quit you like men, be strong)  -> THREAD B
--          Extras: none warranted
--          Tanakh: deuteronomy 31:6 / joshua 1:9 (be strong and of a good courage); 1-samuel 17:47
--                  (the battle is the LORD'S); proverbs 21:31 (safety is of Yahuah); psalms 18:32,39
--                  (Elohim girdeth me with strength unto the battle); 1-samuel 3:18 / 2-samuel 15:26
--                  (let him do what seemeth him good — the submission half)  -> THREAD B
--   v.13-19 (Syrians flee; David defeats Hadarezer; Syria fears to help Ammon any more)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: 1-chronicles 19:14-19 (parallel)  -> folded into THREAD A
--
-- THREADS:
--   2-samuel-10-kindness-spurned-the-shame-that-kindled-the-war  (Tanakh: 1 Chronicles)  tier free
--   2-samuel-10-be-of-good-courage-and-yahuah-do-what-seemeth-good  (Tanakh + NT)  tier free
-- No contested verses. v.12 framed as the chapter spine: courage for the people held together
-- with full submission to Yahuah's will — never bravado, never fatalism; the battle is His.

-- A. TEMP VIEW
CREATE TEMP VIEW _s341_2sa10_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- B. CROSS_REFERENCES
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD A: kindness spurned -> 1 Chronicles 19 (the parallel account)
    ('canon','2-samuel',10,2, 'canon','1-chronicles',19,2,'free',
      E'The Chronicler tells the same kindness: *And David said, I will shew kindness unto Hanun the son of Nahash, because his father shewed kindness to me. And David sent messengers to comfort him concerning his father. So the servants of David came into the land of the children of Ammon to Hanun, to comfort him* (1 Chronicles 19:2). David''s *I will shew kindness unto Hanun the son of Nahash, as his father shewed kindness unto me* is covenant loyalty (chesed) reaching across a border to a grieving son — the seed of Abraham meant to be a blessing to the nations, not their oppressor.'),
    ('canon','2-samuel',10,4, 'canon','1-chronicles',19,4,'free',
      E'*Wherefore Hanun took David''s servants, and shaved them, and cut off their garments in the midst hard by their buttocks, and sent them away* (1 Chronicles 19:4). The two accounts agree to the detail of the insult — *shaved off the one half of their beards, and cut off their garments in the middle, even to their buttocks*. Kindness was answered with deliberate shaming, and the shaming is what kindled the war: the princes'' suspicion turned a comfort-embassy into a casus belli.'),
    ('canon','2-samuel',10,6, 'canon','1-chronicles',19,7,'free',
      E'The hired host gathers in the parallel: *So they hired thirty and two thousand chariots, and the king of Maachah and his people; who came and pitched before Medeba. And the children of Ammon gathered themselves together from their cities, and came to battle* (1 Chronicles 19:7). When *the children of Ammon saw that they stank before David*, they bought Syria''s sword — the shame compounded into a coalition arrayed against Yashar''el (Israel).'),
    ('canon','2-samuel',10,19, 'canon','1-chronicles',19,19,'free',
      E'The war ends the same way in both books: *And when the servants of Hadarezer saw that they were put to the worse before Yashar''el (Israel), they made peace with David, and became his servants: neither would the Syrians help the children of Ammon any more* (1 Chronicles 19:19). The Syrians *feared to help the children of Ammon any more* — the hired sword, once broken, would not be hired again; the kindness Hanun spurned cost him every ally.'),

    -- THREAD B: 10:12 courage WITH submission to Yahuah''s will
    ('canon','2-samuel',10,12, 'canon','deuteronomy',31,6,'free',
      E'Joab''s charge is Moses'' charge to all Yashar''el (Israel): *Be strong and of a good courage, fear not, nor be afraid of them: for Yahuah Elohayka (the LORD thy God), he it is that doth go with thee; he will not fail thee, nor forsake thee* (Deuteronomy 31:6). Joab''s *Be of good courage, and let us play the men for our people, and for the cities of our Elohim (God)* is this Torah word carried onto the field — courage is never self-trust; it rests on the One who goes with His people.'),
    ('canon','2-samuel',10,12, 'canon','joshua',1,9,'free',
      E'The same word charged Joshua at the Jordan: *Have not I commanded thee? Be strong and of a good courage; be not afraid, neither be thou dismayed: for Yahuah Elohayka (the LORD thy God) is with thee whithersoever thou goest* (Joshua 1:9). Joab, caught with *the front of the battle against him before and behind*, speaks the courage Yahuah Himself commanded — *let us play the men for our people, and for the cities of our Elohim (God)* — the fight is for the covenant people and Yahuah''s own cities.'),
    ('canon','2-samuel',10,12, 'canon','1-samuel',17,47,'free',
      E'David had already named whose the battle is: *And all this assembly shall know that Yahuah (LORD) saveth not with sword and spear: for the battle is the LORD''S, and he will give you into our hands* (1 Samuel 17:47). Joab''s closing words — *and Yahuah (LORD) do that which seemeth him good* — are the same confession on the same king''s field: men play the men, but the outcome belongs to Yahuah, who saves not with sword and spear.'),
    ('canon','2-samuel',10,12, 'canon','proverbs',21,31,'free',
      E'Wisdom says the same of every battle: *The horse is prepared against the day of battle: but safety is of Yahuah (LORD)* (Proverbs 21:31). Joab sets his ranks, splits the host with Abishai, draws nigh — every prudent preparation — yet seals it all with *Yahuah (LORD) do that which seemeth him good*: the array is man''s part, the safety is Yahuah''s.'),
    ('canon','2-samuel',10,12, 'canon','psalms',18,39,'free',
      E'David sings what Joab counts on: *For thou hast girded me with strength unto the battle: thou hast subdued under me those that rose up against me* (Psalm 18:39). The courage Joab summons — *let us play the men* — is strength Yahuah girds on; the very next verses bear it out as *they fled before him* and Syria was subdued, exactly as the psalm confesses.'),
    ('canon','2-samuel',10,12, 'canon','1-samuel',3,18,'free',
      E'The other half of Joab''s word — submission to whatever Yahuah decides — is Eli''s word under the worst news: *And he said, It is Yahuah (LORD): let him do what seemeth him good* (1 Samuel 3:18). *Yahuah (LORD) do that which seemeth him good* is not fatalism but faith: the believer fights with all his courage and then lays the result in Yahuah''s hand, content with His will whether it bring victory or loss.'),
    ('canon','2-samuel',10,12, 'canon','2-samuel',15,26,'free',
      E'David himself will pray this surrender when he flees Absalom: *But if he thus say, I have no delight in thee; behold, here am I, let him do to me as seemeth good unto him* (2 Samuel 15:26). The same posture his captain takes into battle — *and Yahuah (LORD) do that which seemeth him good* — David takes into exile: courage and submission are one heart, bowed to Yahuah''s will in triumph and in trial alike.'),
    ('canon','2-samuel',10,12, 'canon','1-corinthians',16,13,'free',
      E'Sha''ul (Paul) carries Joab''s charge forward to the assembly: *Watch ye, stand fast in the faith, quit you like men, be strong* (1 Corinthians 16:13). *Let us play the men* and *quit you like men* are the same summons — be of good courage for the people of Elohim (God) — now set in the long war of faith, where the saints stand fast because the battle is still the Lord''s and He still does what seemeth Him good.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s341_2sa10_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s341_2sa10_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- C. THREADS
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-samuel-10-kindness-spurned-the-shame-that-kindled-the-war',
       E'Kindness Spurned: the shame that kindled the war',
       E'David moves first in chesed — covenant kindness across a border: *I will shew kindness unto Hanun the son of Nahash, as his father shewed kindness unto me. And David sent to comfort him by the hand of his servants for his father* (2 Samuel 10:2). The seed of Abraham was meant to be a blessing to the nations, and David''s comfort-embassy is that calling lived out toward a grieving son. The Chronicler tells it the same: *I will shew kindness unto Hanun the son of Nahash, because his father shewed kindness to me* (1 Chronicles 19:2).\n\nBut Hanun''s princes read malice into mercy — *Thinkest thou that David doth honour thy father... hath not David rather sent his servants unto thee, to search the city, and to spy it out, and to overthrow it?* (2 Samuel 10:3) — and the kindness is answered with calculated shame: *Hanun took David''s servants, and shaved off the one half of their beards, and cut off their garments in the middle, even to their buttocks, and sent them away* (2 Samuel 10:4; cf. *shaved them, and cut off their garments in the midst hard by their buttocks*, 1 Chronicles 19:4). David covers their shame — *Tarry at Jericho until your beards be grown* — but the insult cannot be uncovered, and so the war begins.\n\nWhen *the children of Ammon saw that they stank before David*, they bought a sword they could not field themselves: *So they hired thirty and two thousand chariots, and the king of Maachah and his people; who came and pitched before Medeba* (1 Chronicles 19:7). Shame compounded into a coalition arrayed against Yashar''el (Israel). And it ends as folly always ends: *they made peace with David, and became his servants: neither would the Syrians help the children of Ammon any more* (1 Chronicles 19:19) — the Syrians *feared to help the children of Ammon any more*. The kindness Hanun spurned cost him every ally and his standing; mercy refused turned to ruin upon his own house.',
       sv.verse_id, ev.verse_id, 'free', 37475
  FROM _s341_2sa10_lookup sv, _s341_2sa10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=10 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='2-samuel' AND ev.chapter_number=10 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-samuel-10-be-of-good-courage-and-yahuah-do-what-seemeth-good',
       E'Be of Good Courage — and Yahuah do that which seemeth him good',
       E'Caught with *the front of the battle against him before and behind*, Joab does not flinch and does not boast. He splits the host with Abishai his brother, sets the ranks, and speaks the chapter''s spine: *Be of good courage, and let us play the men for our people, and for the cities of our Elohim (God): and Yahuah (LORD) do that which seemeth him good* (2 Samuel 10:12). Two halves, held together — full courage for the covenant people, and full surrender to Yahuah''s will.\n\nThe first half is Yahuah''s own word carried onto the field. Moses charged all Yashar''el (Israel): *Be strong and of a good courage, fear not, nor be afraid of them: for Yahuah Elohayka (the LORD thy God), he it is that doth go with thee; he will not fail thee, nor forsake thee* (Deuteronomy 31:6); and Yahuah charged Joshua at the Jordan: *Be strong and of a good courage; be not afraid, neither be thou dismayed: for Yahuah Elohayka (the LORD thy God) is with thee whithersoever thou goest* (Joshua 1:9). The courage is never self-trust — it rests on the One who goes with His people. David had named whose the battle is: *the battle is the LORD''S, and he will give you into our hands* (1 Samuel 17:47), and wisdom seals it: *The horse is prepared against the day of battle: but safety is of Yahuah (LORD)* (Proverbs 21:31). Joab does every prudent thing and trusts none of it for the outcome.\n\nThe second half — *Yahuah (LORD) do that which seemeth him good* — is faith''s surrender, not fatalism. It is Eli''s word under the worst news: *It is Yahuah (LORD): let him do what seemeth him good* (1 Samuel 3:18); and it is David''s own prayer when he flees Absalom: *behold, here am I, let him do to me as seemeth good unto him* (2 Samuel 15:26). The same David who sang *thou hast girded me with strength unto the battle: thou hast subdued under me those that rose up against me* (Psalm 18:39) knew the strength was girded on by Yahuah and the result was Yahuah''s to give. And Sha''ul (Paul) carries the whole charge forward to the assembly: *Watch ye, stand fast in the faith, quit you like men, be strong* (1 Corinthians 16:13) — *play the men* and *quit you like men*, the same summons, now in the long war of faith, where the saints stand fast because the battle is still the Lord''s and He still does what seemeth Him good.',
       sv.verse_id, ev.verse_id, 'free', 37478
  FROM _s341_2sa10_lookup sv, _s341_2sa10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=10 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='2-samuel' AND ev.chapter_number=10 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- D. THREAD_MEMBERS
-- Thread A members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'1 Chronicles 19:2 — *I will shew kindness unto Hanun the son of Nahash, because his father shewed kindness to me*: the parallel account of David''s chesed-embassy across the border.'
  FROM cross_reference_threads t
  JOIN _s341_2sa10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=10 AND sv.verse_number=2
  JOIN _s341_2sa10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=19 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-10-kindness-spurned-the-shame-that-kindled-the-war'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'1 Chronicles 19:4 — *shaved them, and cut off their garments in the midst hard by their buttocks*: the same calculated shaming that turned a comfort-embassy into war.'
  FROM cross_reference_threads t
  JOIN _s341_2sa10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=10 AND sv.verse_number=4
  JOIN _s341_2sa10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=19 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-10-kindness-spurned-the-shame-that-kindled-the-war'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'1 Chronicles 19:7 — *thirty and two thousand chariots... came and pitched before Medeba*: the shame compounded into a hired coalition arrayed against Yashar''el (Israel).'
  FROM cross_reference_threads t
  JOIN _s341_2sa10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=10 AND sv.verse_number=6
  JOIN _s341_2sa10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=19 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-10-kindness-spurned-the-shame-that-kindled-the-war'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'1 Chronicles 19:19 — *they made peace with David... neither would the Syrians help the children of Ammon any more*: the kindness Hanun spurned cost him every ally.'
  FROM cross_reference_threads t
  JOIN _s341_2sa10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=10 AND sv.verse_number=19
  JOIN _s341_2sa10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=19 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-10-kindness-spurned-the-shame-that-kindled-the-war'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread B members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Deuteronomy 31:6 — *Be strong and of a good courage, fear not... he will not fail thee, nor forsake thee*: Moses'' Torah charge, the source of Joab''s courage.'
  FROM cross_reference_threads t
  JOIN _s341_2sa10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=10 AND sv.verse_number=12
  JOIN _s341_2sa10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=31 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-10-be-of-good-courage-and-yahuah-do-what-seemeth-good'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Joshua 1:9 — *Be strong and of a good courage... Yahuah Elohayka (the LORD thy God) is with thee whithersoever thou goest*: the courage Yahuah Himself commanded at the Jordan.'
  FROM cross_reference_threads t
  JOIN _s341_2sa10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=10 AND sv.verse_number=12
  JOIN _s341_2sa10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=1 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-10-be-of-good-courage-and-yahuah-do-what-seemeth-good'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'1 Samuel 17:47 — *the battle is the LORD''S, and he will give you into our hands*: David''s confession on the same king''s field — the outcome belongs to Yahuah.'
  FROM cross_reference_threads t
  JOIN _s341_2sa10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=10 AND sv.verse_number=12
  JOIN _s341_2sa10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=17 AND tv.verse_number=47
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-10-be-of-good-courage-and-yahuah-do-what-seemeth-good'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Proverbs 21:31 — *The horse is prepared against the day of battle: but safety is of Yahuah (LORD)*: the array is man''s part, the safety is Yahuah''s.'
  FROM cross_reference_threads t
  JOIN _s341_2sa10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=10 AND sv.verse_number=12
  JOIN _s341_2sa10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=21 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-10-be-of-good-courage-and-yahuah-do-what-seemeth-good'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Psalm 18:39 — *thou hast girded me with strength unto the battle: thou hast subdued under me those that rose up against me*: the courage Joab summons is strength Yahuah girds on.'
  FROM cross_reference_threads t
  JOIN _s341_2sa10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=10 AND sv.verse_number=12
  JOIN _s341_2sa10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=18 AND tv.verse_number=39
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-10-be-of-good-courage-and-yahuah-do-what-seemeth-good'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'1 Samuel 3:18 — *It is Yahuah (LORD): let him do what seemeth him good*: the submission half of Joab''s word, Eli''s faith under the worst news.'
  FROM cross_reference_threads t
  JOIN _s341_2sa10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=10 AND sv.verse_number=12
  JOIN _s341_2sa10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=3 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-10-be-of-good-courage-and-yahuah-do-what-seemeth-good'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'2 Samuel 15:26 — *here am I, let him do to me as seemeth good unto him*: David''s own surrender in exile — the same heart bowed to Yahuah''s will in triumph and in trial.'
  FROM cross_reference_threads t
  JOIN _s341_2sa10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=10 AND sv.verse_number=12
  JOIN _s341_2sa10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=15 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-10-be-of-good-courage-and-yahuah-do-what-seemeth-good'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'1 Corinthians 16:13 — *Watch ye, stand fast in the faith, quit you like men, be strong*: Joab''s charge carried forward into the long war of faith.'
  FROM cross_reference_threads t
  JOIN _s341_2sa10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=10 AND sv.verse_number=12
  JOIN _s341_2sa10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=16 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-10-be-of-good-courage-and-yahuah-do-what-seemeth-good'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2-samuel_11.sql (2 Samuel 11) -----
--
-- 2 Samuel 11 — David, Bath-sheba, and the murder of Uriah the Hittite
-- Tag: 2sa11   View: _s341_2sa11_lookup   Sort band: base 37500, step 3
-- Frame: the seed-king under the very Torah whose commandments he breaks — coveting
--   (Exod 20:17/Deut 5:21) ripening into adultery (Exod 20:14/Deut 5:18), deceit, and the
--   shedding of innocent blood (Exod 20:13/Deut 5:17). The Torah is never the curse here;
--   it is the standard by which David's sin is exposed AS sin even in the anointed
--   (1 Kings 15:5 "save only in the matter of Uriah"; cf. Nathan, 2 Sam 12:9). The lust-to-
--   death progression is named forward in James 1:14-15. Uriah the Hittite — the loyal
--   foreign sojourner whose integrity over the ark and Yashar'el in tents shames the king.
--   The chapter closes: *But the thing that David had done displeased Yahuah* (11:27);
--   David's own confession is Psalm 51:4. Bath-sheba enters the Messianic line, Matthew 1:6.
--   Victims, not enemies: Uriah and Bath-sheba are wronged, never blamed.
--
-- 2 Samuel 11 coverage:
--   v.1   NT:     none warranted   Extras: none warranted   Tanakh: none warranted (frame verse for thread setup)
--   v.2   NT:     none warranted   Extras: none warranted   Tanakh: Exod 20:17 / Deut 5:21 (the eye that covets)
--   v.3   NT:     none warranted   Extras: none warranted   Tanakh: Matt 1:6 (the wife of Uriah named)
--   v.4   NT:     none warranted   Extras: none warranted   Tanakh: Exod 20:14 / Deut 5:18 (adultery committed)
--   v.5-13 NT:    James 1:14-15 (lust conceives → sin → death)
--          Extras: none warranted   Tanakh: Exod 20:13 / Deut 5:17 (the murder being set up)
--   v.11  NT:     none warranted   Extras: none warranted   Tanakh: (Uriah's integrity — anchored in thread prose)
--   v.14-17 NT:   James 1:14-15    Extras: none warranted   Tanakh: Exod 20:13 / Deut 5:17 (innocent blood)
--   v.27  NT:     Matt 1:6 (Bathsheba in the line)
--          Extras: none warranted
--          Tanakh: 2 Sam 12:9 (Nathan's charge) / 1 Kings 15:5 (save only Uriah) / Psalm 51:4 (David's confession)
--
-- Threads (4):
--   2-samuel-11-the-eye-that-coveted-his-neighbours-wife  [Tanakh] — 11:2,4 → Exod20:14,17 / Deut5:18,21
--   2-samuel-11-uriah-the-hittites-integrity-shames-the-king [Tanakh+NT] — 11:11 → Matt1:6 (and 11:3)
--   2-samuel-11-lust-conceived-bringeth-forth-death       [Tanakh+NT] — 11:14-17 → Exod20:13 / Deut5:17 / James1:14-15
--   2-samuel-11-but-the-thing-displeased-yahuah           [Tanakh+NT] — 11:27 → 2Sam12:9 / 1Kgs15:5 / Ps51:4 / Matt1:6

CREATE TEMP VIEW _s341_2sa11_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===================== B. cross_references =====================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: the eye that coveted his neighbour's wife
    ('canon','2-samuel',11,2,'canon','exodus',20,17,'free',
      E'*Thou shalt not covet thy neighbour''s house, thou shalt not covet thy neighbour''s wife, nor his manservant, nor his maidservant, nor his ox, nor his ass, nor any thing that is thy neighbour''s* (Exodus 20:17). David *saw a woman washing herself; and the woman was very beautiful to look upon* (2 Samuel 11:2) — the tenth word broken at the eye. The Torah he was anointed to keep names the sin before the act, and names it AS sin: the neighbour''s wife is the very thing forbidden.'),
    ('canon','2-samuel',11,2,'canon','deuteronomy',5,21,'free',
      E'*Neither shalt thou desire thy neighbour''s wife, neither shalt thou covet thy neighbour''s house, his field, or his manservant, or his maidservant, his ox, or his ass, or any thing that is thy neighbour''s* (Deuteronomy 5:21). David *from the roof he saw a woman... very beautiful to look upon* (2 Samuel 11:2) — the desire of the eye, the covenant word still binding on the king as on all Yashar''el (Israel).'),
    ('canon','2-samuel',11,4,'canon','exodus',20,14,'free',
      E'*Thou shalt not commit adultery* (Exodus 20:14). *And David sent messengers, and took her; and she came in unto him, and he lay with her... and she returned unto her house* (2 Samuel 11:4) — Bath-sheba is *the wife of Uriah the Hittite* (11:3). The coveting of v.2 ripens into the seventh word broken; the Torah does not bend for the anointed.'),
    ('canon','2-samuel',11,4,'canon','deuteronomy',5,18,'free',
      E'*Neither shalt thou commit adultery* (Deuteronomy 5:18). *And David sent messengers, and took her; and... he lay with her* (2 Samuel 11:4) — the man after Yahuah''s (the LORD''s) own heart breaks the same word given to all the people; the standard that condemns him is the standard he was raised to teach.'),

    -- Thread 2: Uriah the Hittite's integrity shames the king
    ('canon','2-samuel',11,11,'canon','matthew',1,6,'free',
      E'*And Jesse begat David the king; and David the king begat Solomon of her that had been the wife of Urias* (Matthew 1:6). The Messianic genealogy will not erase the wound: it names Bath-sheba not by her own name but as *the wife of Urias* — Uriah the Hittite, the loyal foreigner who said *the ark, and Yashar''el (Israel), and Yahudah (Judah), abide in tents... shall I then go into mine house...?* (2 Samuel 11:11). The upright sojourner''s integrity is written forever into the line of Messiah, his death never excused.'),

    -- Thread 3: lust conceived bringeth forth death
    ('canon','2-samuel',11,15,'canon','exodus',20,13,'free',
      E'*Thou shalt not kill* (Exodus 20:13). *Set ye Uriah in the forefront of the hottest battle, and retire ye from him, that he may be smitten, and die* (2 Samuel 11:15) — the sixth word broken by the king''s own hand, the murder ordered by letter and carried by the victim himself (11:14). Coveting bore adultery, adultery bore deceit, deceit bore blood; the Torah names each stage.'),
    ('canon','2-samuel',11,15,'canon','deuteronomy',5,17,'free',
      E'*Thou shalt not kill* (Deuteronomy 5:17). David''s letter — *that he may be smitten, and die* (2 Samuel 11:15) — sheds innocent blood to bury the adultery. The same word stood at Horeb for all Yashar''el (Israel); the anointed is not above it.'),
    ('canon','2-samuel',11,17,'canon','james',1,15,'free',
      E'*Then when lust hath conceived, it bringeth forth sin: and sin, when it is finished, bringeth forth death* (James 1:15). *And the men of the city went out... and Uriah the Hittite died also* (2 Samuel 11:17) — the chapter is James'' verse made history: the lust of 11:2, the sin of 11:4, the finished sin bringing forth death at the wall. Yaaqob (James) reads David''s house exactly.'),
    ('canon','2-samuel',11,14,'canon','james',1,14,'free',
      E'*But every man is tempted, when he is drawn away of his own lust, and enticed* (James 1:14). *And it came to pass in the morning, that David wrote a letter to Joab, and sent it by the hand of Uriah* (2 Samuel 11:14) — drawn away and enticed, the king now drafts the cover-up in cold ink; the temptation that began at the eye is now an instrument of murder.'),

    -- Thread 4: but the thing displeased Yahuah
    ('canon','2-samuel',11,27,'canon','2-samuel',12,9,'free',
      E'*Wherefore hast thou despised the commandment of Yahuah (LORD), to do evil in his sight? thou hast killed Uriah the Hittite with the sword, and hast taken his wife to be thy wife, and hast slain him with the sword of the children of Ammon* (2 Samuel 12:9). The chapter ends *the thing that David had done displeased Yahuah (LORD)* (11:27); Nathan in the next breath names it *despised the commandment of Yahuah* — the Torah is the measure, the sin is sin, the king is summoned to account.'),
    ('canon','2-samuel',11,27,'canon','1-kings',15,5,'free',
      E'*Because David did that which was right in the eyes of Yahuah (LORD), and turned not aside from any thing that he commanded him all the days of his life, save only in the matter of Uriah the Hittite* (1 Kings 15:5). Centuries later the record still carves out this one wound — *save only in the matter of Uriah* — proof that the displeasure of *the thing that David had done displeased Yahuah (LORD)* (2 Samuel 11:27) was never papered over; the Torah-standard stands permanent.'),
    ('canon','2-samuel',11,27,'canon','psalms',51,4,'free',
      E'*Against thee, thee only, have I sinned, and done this evil in thy sight: that thou mightest be justified when thou speakest, and be clear when thou judgest* (Psalm 51:4). When *the thing that David had done displeased Yahuah (LORD)* (2 Samuel 11:27), the king does not defend himself but confesses Yahuah''s judgment just — he justifies the verdict against his own throne, the broken and contrite heart of Psalm 51:17.'),
    ('canon','2-samuel',11,27,'canon','matthew',1,6,'free',
      E'*And David the king begat Solomon of her that had been the wife of Urias* (Matthew 1:6). *She became his wife, and bare him a son* (2 Samuel 11:27) — yet the displeasure of Yahuah (the LORD) is not the end of the line but a turn within it; the seed of promise runs on through Bath-sheba to Solomon and to Messiah, mercy not erasing the sin but bearing the repentant king forward.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s341_2sa11_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s341_2sa11_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===================== C. threads =====================
-- Thread 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-samuel-11-the-eye-that-coveted-his-neighbours-wife',
  E'The eye that coveted his neighbour''s wife',
  E'David tarries from battle, and *from the roof he saw a woman washing herself; and the woman was very beautiful to look upon* (2 Samuel 11:2). The sin is born at the eye, and the Torah he was anointed to keep had already named it: *Thou shalt not covet thy neighbour''s house... thou shalt not covet thy neighbour''s wife* (Exodus 20:17); *Neither shalt thou desire thy neighbour''s wife* (Deuteronomy 5:21). The woman is *the wife of Uriah the Hittite* (11:3) — the very neighbour''s wife forbidden. Then *David sent messengers, and took her... and he lay with her* (11:4), and the coveting ripens into the broken seventh word: *Thou shalt not commit adultery* (Exodus 20:14); *Neither shalt thou commit adultery* (Deuteronomy 5:18). The Torah does not bend for the man after Yahuah''s (the LORD''s) own heart; it is the unmoving standard by which his sin is exposed AS sin even on the throne — affirmed, never abolished.',
  sv.verse_id, ev.verse_id, 'free', 37500
  FROM _s341_2sa11_lookup sv, _s341_2sa11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=11 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='2-samuel' AND ev.chapter_number=11 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- Thread 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-samuel-11-uriah-the-hittites-integrity-shames-the-king',
  E'Uriah the Hittite''s integrity shames the king',
  E'David summons Uriah and urges him *Go down to thy house, and wash thy feet* (2 Samuel 11:8) — but the loyal foreigner will not. *And Uriah said unto David, The ark, and Yashar''el (Israel), and Yahudah (Judah), abide in tents; and my lord Joab, and the servants of my lord, are encamped in the open fields; shall I then go into mine house, to eat and to drink, and to lie with my wife? as thou livest, and as thy soul liveth, I will not do this thing* (11:11). The upright Gentile-sojourner''s reverence for the ark and for Yashar''el at war is the standing rebuke of the king who lay with the man''s wife while staying home from the battle. The Messianic genealogy will not let the wound be forgotten: *And David the king begat Solomon of her that had been the wife of Urias* (Matthew 1:6) — Bath-sheba named only as *the wife of Urias*, the Hittite''s integrity written forever into the line of Messiah, his death never excused. Victims, not enemies: the foreigner is the faithful one here.',
  sv.verse_id, ev.verse_id, 'free', 37503
  FROM _s341_2sa11_lookup sv, _s341_2sa11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=11 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='2-samuel' AND ev.chapter_number=11 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- Thread 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-samuel-11-lust-conceived-bringeth-forth-death',
  E'Lust conceived bringeth forth death',
  E'When Uriah will not give the adultery a cover, David turns to murder: *And it came to pass in the morning, that David wrote a letter to Joab, and sent it by the hand of Uriah* (2 Samuel 11:14), the order reading *Set ye Uriah in the forefront of the hottest battle, and retire ye from him, that he may be smitten, and die* (11:15). The sixth word is broken: *Thou shalt not kill* (Exodus 20:13; Deuteronomy 5:17). *And the men of the city went out... and Uriah the Hittite died also* (11:17). This is Yaaqob''s (James''s) law of sin made history: *But every man is tempted, when he is drawn away of his own lust, and enticed* (James 1:14); *Then when lust hath conceived, it bringeth forth sin: and sin, when it is finished, bringeth forth death* (James 1:15). The eye of 11:2, the adultery of 11:4, the deceit, and now the finished sin bringing forth death at the wall — coveting ripened to blood, the broken commandments stacking exactly as James warns.',
  sv.verse_id, ev.verse_id, 'free', 37506
  FROM _s341_2sa11_lookup sv, _s341_2sa11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=11 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='2-samuel' AND ev.chapter_number=11 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- Thread 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-samuel-11-but-the-thing-displeased-yahuah',
  E'But the thing displeased Yahuah',
  E'The chapter''s last line is its verdict: *But the thing that David had done displeased Yahuah (LORD)* (2 Samuel 11:27). The seed-king stands under the same Torah as all his people, and sin is sin even in the anointed. Nathan speaks the charge plainly: *Wherefore hast thou despised the commandment of Yahuah (LORD), to do evil in his sight? thou hast killed Uriah the Hittite with the sword, and hast taken his wife to be thy wife* (2 Samuel 12:9). Centuries on, the record still carves out the one wound: *save only in the matter of Uriah the Hittite* (1 Kings 15:5). David does not defend himself but confesses the verdict just: *Against thee, thee only, have I sinned, and done this evil in thy sight: that thou mightest be justified when thou speakest, and be clear when thou judgest* (Psalm 51:4) — the broken and contrite heart that justifies Yahuah''s (the LORD''s) judgment against his own throne. And yet mercy bears the repentant king forward: *And David the king begat Solomon of her that had been the wife of Urias* (Matthew 1:6) — the seed of promise running on through Bath-sheba to Messiah, the sin never erased, the Torah-standard never abolished.',
  sv.verse_id, ev.verse_id, 'free', 37509
  FROM _s341_2sa11_lookup sv, _s341_2sa11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=11 AND sv.verse_number=27
   AND ev.edition_slug='canon' AND ev.book_slug='2-samuel' AND ev.chapter_number=11 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

-- ===================== D. thread_members =====================
-- Thread 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Thou shalt not covet thy neighbour''s... wife* (Exodus 20:17) — the tenth word, broken at the eye on the roof (11:2).'
  FROM cross_reference_threads t
  JOIN _s341_2sa11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=11 AND sv.verse_number=2
  JOIN _s341_2sa11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-11-the-eye-that-coveted-his-neighbours-wife'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Neither shalt thou desire thy neighbour''s wife* (Deuteronomy 5:21) — the same word at Horeb, binding on the king as on all the people.'
  FROM cross_reference_threads t
  JOIN _s341_2sa11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=11 AND sv.verse_number=2
  JOIN _s341_2sa11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=5 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-11-the-eye-that-coveted-his-neighbours-wife'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Thou shalt not commit adultery* (Exodus 20:14) — coveting ripens into the act, *he lay with her* (11:4).'
  FROM cross_reference_threads t
  JOIN _s341_2sa11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=11 AND sv.verse_number=4
  JOIN _s341_2sa11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-11-the-eye-that-coveted-his-neighbours-wife'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Neither shalt thou commit adultery* (Deuteronomy 5:18) — the standard David was raised to teach now condemns him.'
  FROM cross_reference_threads t
  JOIN _s341_2sa11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=11 AND sv.verse_number=4
  JOIN _s341_2sa11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=5 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-11-the-eye-that-coveted-his-neighbours-wife'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*David the king begat Solomon of her that had been the wife of Urias* (Matthew 1:6) — the Hittite''s integrity (11:11) written into the line of Messiah, his death never excused.'
  FROM cross_reference_threads t
  JOIN _s341_2sa11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=11 AND sv.verse_number=11
  JOIN _s341_2sa11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=1 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-11-uriah-the-hittites-integrity-shames-the-king'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*But every man is tempted, when he is drawn away of his own lust, and enticed* (James 1:14) — the king drafts the cover-up letter (11:14).'
  FROM cross_reference_threads t
  JOIN _s341_2sa11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=11 AND sv.verse_number=14
  JOIN _s341_2sa11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-11-lust-conceived-bringeth-forth-death'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Thou shalt not kill* (Exodus 20:13) — the murder ordered by the king''s own hand, *that he may be smitten, and die* (11:15).'
  FROM cross_reference_threads t
  JOIN _s341_2sa11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=11 AND sv.verse_number=15
  JOIN _s341_2sa11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-11-lust-conceived-bringeth-forth-death'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Thou shalt not kill* (Deuteronomy 5:17) — the same Horeb word, innocent blood shed to bury the adultery.'
  FROM cross_reference_threads t
  JOIN _s341_2sa11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=11 AND sv.verse_number=15
  JOIN _s341_2sa11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=5 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-11-lust-conceived-bringeth-forth-death'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Then when lust hath conceived, it bringeth forth sin: and sin, when it is finished, bringeth forth death* (James 1:15) — *Uriah the Hittite died also* (11:17), the chapter is the verse made history.'
  FROM cross_reference_threads t
  JOIN _s341_2sa11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=11 AND sv.verse_number=17
  JOIN _s341_2sa11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-11-lust-conceived-bringeth-forth-death'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Wherefore hast thou despised the commandment of Yahuah (LORD)... thou hast killed Uriah the Hittite with the sword* (2 Samuel 12:9) — Nathan names the displeasure of 11:27 as despised Torah.'
  FROM cross_reference_threads t
  JOIN _s341_2sa11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=11 AND sv.verse_number=27
  JOIN _s341_2sa11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=12 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-11-but-the-thing-displeased-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*save only in the matter of Uriah the Hittite* (1 Kings 15:5) — the record carves out the one wound forever; the Torah-standard stands permanent.'
  FROM cross_reference_threads t
  JOIN _s341_2sa11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=11 AND sv.verse_number=27
  JOIN _s341_2sa11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=15 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-11-but-the-thing-displeased-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Against thee, thee only, have I sinned... that thou mightest be justified when thou speakest* (Psalm 51:4) — David confesses the verdict of 11:27 just.'
  FROM cross_reference_threads t
  JOIN _s341_2sa11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=11 AND sv.verse_number=27
  JOIN _s341_2sa11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=51 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-11-but-the-thing-displeased-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*David the king begat Solomon of her that had been the wife of Urias* (Matthew 1:6) — mercy bears the repentant king forward; the seed of promise runs on to Messiah.'
  FROM cross_reference_threads t
  JOIN _s341_2sa11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=11 AND sv.verse_number=27
  JOIN _s341_2sa11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=1 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-11-but-the-thing-displeased-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2-samuel_12.sql (2 Samuel 12) -----
--
-- Chapter: 2 Samuel 12 (Nathan's parable; David's repentance; Psalm 51; the line preserved)
-- Tag: 2sa12   View: _s341_2sa12_lookup   Sort band: 37525, step 3 (37525..37540)
-- Session prefix: s341
--
-- 2 Samuel 12 coverage:
--   v.1-7 (parable / Thou art the man):
--        NT:     Galatians 6:1 (restore the overtaken in meekness) — warranted
--        Extras: none warranted
--        Tanakh: 2 Samuel 7:1-3 (Nathan the same prophet) — warranted
--   v.9-14 (despised the commandment / sword never departs / consequence remains):
--        NT:     Galatians 6:7 (whatsoever a man soweth, that shall he reap) — warranted
--        Extras: none warranted
--        Tanakh: 2 Samuel 7:14 (rod of men); Numbers 14:18-20 (pardoned yet carcases fall) — warranted
--   v.13a (I have sinned against Yahuah / instant grace on confession):
--        NT:     1 John 1:9 (if we confess our sins he is faithful and just to forgive) — warranted
--        Extras: none warranted
--        Tanakh: Psalm 32:5 (I acknowledged my sin and thou forgavest); Proverbs 28:13 (whoso confesseth shall have mercy) — warranted
--   v.13 (David's response = Psalm 51, the clean heart / new heart):
--        NT:     none warranted (Psalm 51 IS the response; Ezekiel carries the new heart)
--        Extras: none warranted
--        Tanakh: Psalm 51:1,2,3,4,10,17 (David's miserere); Ezekiel 36:25-27 (new heart, Torah within) — warranted
--   v.23 (I shall go to him but he shall not return — hope beyond death):
--        NT:     none warranted (kept Tanakh-internal; resurrection hope unfolded in prose)
--        Extras: none warranted
--        Tanakh: none warranted (self-standing within chapter; anchored verse stands alone in prose)
--   v.24-25 (Solomon / Jedidiah, beloved of Yah / the line to Messiah):
--        NT:     Matthew 1:6 (David begat Solomon — the royal line to Messiah) — warranted
--        Extras: none warranted
--        Tanakh: none warranted (NT carries the genealogical fulfillment)
--
-- THREADS (6):
--   2-samuel-12-the-poor-mans-one-ewe-lamb-thou-art-the-man      free   [canon: 2 Samuel 7, Galatians 6]
--   2-samuel-12-the-sword-shall-never-depart-the-consequence-remains  free   [canon: 2 Samuel 7, Numbers 14, Galatians 6]
--   2-samuel-12-i-have-sinned-against-yahuah-instant-grace-on-confession  free   [canon: Psalm 32, Proverbs 28, 1 John 1]
--   2-samuel-12-create-in-me-a-clean-heart-the-fifty-first-psalm  free   [canon: Psalm 51, Ezekiel 36]
--   2-samuel-12-i-shall-go-to-him-but-he-shall-not-return-to-me   free   [self-standing, prose only — no member]
--   2-samuel-12-solomon-jedidiah-beloved-of-yah-the-line-preserved  free   [canon: Matthew 1]
--
-- NOTE: thread "i-shall-go-to-him" carries no member (no warranted target — hope-beyond-death
--   unfolded in summary prose; anchor verse 23 stands on its own). All other threads fully membered.
-- Framework framing: the prophet's word that convicts the king by his own mouth (12:5-7); repentance
--   and INSTANT grace on true confession (12:13) — yet NOT cheap grace, for the consequence-sword
--   remains (12:10-12), the Deuteronomy/Numbers covenant-reality that pardon does not erase all
--   consequence; Psalm 51 is the clean heart / new heart of Ezekiel 36 — the Torah written within,
--   NOT antinomian licence; the Davidic line preserved through Solomon (Jedidiah, beloved of Yah)
--   on to the Messiah (Matthew 1:6). Torah is never the curse; the sword is the covenant consequence.

CREATE TEMP VIEW _s341_2sa12_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================ cross_references ============================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: the poor man's one ewe lamb / Thou art the man
    ('canon','2-samuel',12,7,'canon','2-samuel',7,3,'free',
     E'The same prophet who once told David *Go, do all that is in thine heart; for Yahuah (LORD) is with thee* (2 Samuel 7:3) now stands to convict him. When Nathan says *Thou art the man* (2 Samuel 12:7), it is the word of the prophet that turns the king''s own verdict back on his own head — the man who blessed the house of David is the man who arraigns it.'),
    ('canon','2-samuel',12,1,'canon','2-samuel',7,3,'free',
     E'*And Nathan said to the king, Go, do all that is in thine heart; for Yahuah (LORD) is with thee* (2 Samuel 7:3). The prophet who carried the covenant-promise to David — *Yahuah also hath put away thy sin; thou shalt not die* will come from the same mouth — first comes with a parable, *There were two men in one city; the one rich, and the other poor* (2 Samuel 12:1), to make the king pronounce sentence on himself.'),
    ('canon','2-samuel',12,5,'canon','galatians',6,1,'free',
     E'*Brethren, if a man be overtaken in a fault, ye which are spiritual, restore such an one in the spirit of meekness; considering thyself, lest thou also be tempted* (Galatians 6:1). David''s anger flares hot at the rich man''s crime — *the man that hath done this thing shall surely die* (2 Samuel 12:5) — quick to judge another, blind to himself; Nathan restores rather than destroys, the meekness that convicts and then says *thou shalt not die*.'),

    -- Thread 2: the sword shall never depart / the consequence remains
    ('canon','2-samuel',12,10,'canon','2-samuel',7,14,'free',
     E'*I will be his father, and he shall be my son. If he commit iniquity, I will chasten him with the rod of men, and with the stripes of the children of men* (2 Samuel 7:14). The covenant to David already named the rod; now *the sword shall never depart from thine house* (2 Samuel 12:10) is that very rod falling — mercy keeps the throne, but the chastening of a covenant Father is real, never the cancellation of all consequence.'),
    ('canon','2-samuel',12,13,'canon','numbers',14,20,'free',
     E'*And Yahuah (LORD) said, I have pardoned according to thy word* (Numbers 14:20) — yet in the same breath, *your carcases shall fall in this wilderness* (Numbers 14:29). The wilderness pattern is David''s: *Yahuah also hath put away thy sin; thou shalt not die* (2 Samuel 12:13), full pardon — and still the sword and the child''s death follow. Pardon lifts the guilt; it does not erase every consequence the deed has set loose.'),
    ('canon','2-samuel',12,9,'canon','galatians',6,7,'free',
     E'*Be not deceived; Elohim (God) is not mocked: for whatsoever a man soweth, that shall he also reap* (Galatians 6:7). David *despised the commandment of Yahuah (LORD)* (2 Samuel 12:9) — took the wife, slew by the sword — and the reaping is measured back: *the sword shall never depart from thine house.* The Torah is not the curse; despising it is, and the harvest is sure.'),

    -- Thread 3: I have sinned against Yahuah / instant grace on confession
    ('canon','2-samuel',12,13,'canon','psalms',32,5,'free',
     E'*I acknowledged my sin unto thee, and mine iniquity have I not hid. I said, I will confess my transgressions unto Yahuah (LORD); and thou forgavest the iniquity of my sin. Selah* (Psalm 32:5). This is the very rhythm of 2 Samuel 12:13 — the instant *I have sinned against Yahuah (LORD)* met by the instant *Yahuah (LORD) also hath put away thy sin.* The moment guilt is owned and not hidden, the forgiveness is already given.'),
    ('canon','2-samuel',12,13,'canon','proverbs',28,13,'free',
     E'*He that covereth his sins shall not prosper: but whoso confesseth and forsaketh them shall have mercy* (Proverbs 28:13). For a year David covered the matter of Uriah and his bones waxed old; the instant he uncovers it — *I have sinned against Yahuah (LORD)* (2 Samuel 12:13) — mercy answers: *thou shalt not die.* The proverb is the king''s own story in a single line.'),
    ('canon','2-samuel',12,13,'canon','1-john',1,9,'free',
     E'*If we confess our sins, he is faithful and just to forgive us our sins, and to cleanse us from all unrighteousness* (1 John 1:9). David''s bare confession — five words, *I have sinned against Yahuah (LORD)* (2 Samuel 12:13) — draws the immediate *Yahuah (LORD) also hath put away thy sin*: the faithful and just One forgiving the one who hides nothing, the Tanakh pattern the apostle simply repeats.'),

    -- Thread 4: create in me a clean heart / the fifty-first Psalm
    ('canon','2-samuel',12,13,'canon','psalms',51,1,'free',
     E'*Have mercy upon me, O Elohim (God), according to thy lovingkindness: according unto the multitude of thy tender mercies blot out my transgressions* (Psalm 51:1). The fifty-first Psalm is David''s answer to this very hour — when Nathan came; his confession *I have sinned against Yahuah (LORD)* (2 Samuel 12:13) breaks open into the whole cry of the miserere.'),
    ('canon','2-samuel',12,13,'canon','psalms',51,3,'free',
     E'*For I acknowledge my transgressions: and my sin is ever before me* (Psalm 51:3). What in the narrative is the bare *I have sinned against Yahuah (LORD)* (2 Samuel 12:13) is, in the Psalm, the heart laid wholly bare — the sin not hidden but held ever in view, exactly the uncovering that Proverbs 28:13 says draws mercy.'),
    ('canon','2-samuel',12,13,'canon','psalms',51,4,'free',
     E'*Against thee, thee only, have I sinned, and done this evil in thy sight: that thou mightest be justified when thou speakest, and be clear when thou judgest* (Psalm 51:4). David''s *I have sinned against Yahuah (LORD)* (2 Samuel 12:13) names the One first sinned against; Uriah and Bath-sheba were wronged, but the covenant breach is against Yahuah, who judges rightly.'),
    ('canon','2-samuel',12,13,'canon','psalms',51,10,'free',
     E'*Create in me a clean heart, O Elohim (God); and renew a right spirit within me* (Psalm 51:10). This is the heart of the matter: forgiveness — *thou shalt not die* (2 Samuel 12:13) — is not the end; David begs to be re-made within, the clean heart that is the new covenant''s whole hope.'),
    ('canon','2-samuel',12,13,'canon','psalms',51,17,'free',
     E'*The sacrifices of Elohim (God) are a broken spirit: a broken and a contrite heart, O Elohim (God), thou wilt not despise* (Psalm 51:17). No burnt offering atones for blood-guilt under the Torah; what Yahuah will not despise is the broken heart — and that contrition is what stands behind the bare *I have sinned against Yahuah (LORD)* (2 Samuel 12:13).'),
    ('canon','2-samuel',12,13,'canon','ezekiel',36,26,'free',
     E'*A new heart also will I give you, and a new spirit will I put within you: and I will take away the stony heart out of your flesh, and I will give you an heart of flesh* (Ezekiel 36:26). David''s *create in me a clean heart* foreshadows the covenant promise: *And I will put my spirit within you, and cause you to walk in my statutes* (Ezekiel 36:27). The clean heart is no licence to sin on — it is the Torah written within, the very statutes David despised now put inside the heart that asks for it after *I have sinned against Yahuah (LORD)* (2 Samuel 12:13).'),

    -- Thread 6: Solomon / Jedidiah, beloved of Yah / the line preserved
    ('canon','2-samuel',12,24,'canon','matthew',1,6,'free',
     E'*And Jesse begat David the king; and David the king begat Solomon of her that had been the wife of Urias* (Matthew 1:6). Out of the very breach — Bath-sheba, *the wife of Urias* — the royal line runs on: *she bare a son, and he called his name Solomon: and Yahuah (LORD) loved him* (2 Samuel 12:24). The genealogy of Messiah does not hide the sin; mercy carries the promise straight through it.'),
    ('canon','2-samuel',12,25,'canon','matthew',1,6,'free',
     E'*And David the king begat Solomon of her that had been the wife of Urias* (Matthew 1:6). Yahuah names the child Himself — *he called his name Jedidiah, because of Yahuah (LORD)* (2 Samuel 12:25), Jedidiah, beloved of Yah — and that beloved son stands first in the line that runs down to the Messiah, the seed of David preserved through pardoned sin.'),
    ('canon','2-samuel',12,23,'canon','1-thessalonians',4,13,'free',
     E'*But I would not have you to be ignorant, brethren, concerning them which are asleep, that ye sorrow not, even as others which have no hope* (1 Thessalonians 4:13). David rises, washes, and worships, and answers the servants'' bewilderment — *I shall go to him, but he shall not return to me* (2 Samuel 12:23). The child is not perished but gone ahead, and the grieving father will follow into the same keeping: the very hope Paul names, that the ones asleep are not lost and the covenant mourner sorrows not as the hopeless do.'),
    ('canon','2-samuel',12,23,'canon','john',11,25,'free',
     E'*Yahusha (Jesus) said unto her, I am the resurrection, and the life: he that believeth in me, though he were dead, yet shall he live* (John 11:25). David''s quiet certainty — *I shall go to him, but he shall not return to me* (2 Samuel 12:23) — leans forward onto the One who is Himself the resurrection and the life; the road runs one way now, toward reunion in Him who raises the sleeping.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s341_2sa12_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s341_2sa12_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================ threads ============================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-samuel-12-the-poor-mans-one-ewe-lamb-thou-art-the-man',
  E'The poor man''s one ewe lamb — Thou art the man',
  E'Yahuah sends Nathan, the same prophet who carried the everlasting covenant to David — *Go, do all that is in thine heart; for Yahuah (LORD) is with thee* (2 Samuel 7:3) — but now with a parable: *There were two men in one city; the one rich, and the other poor* (2 Samuel 12:1), the rich man with many flocks, the poor man with *one little ewe lamb* that *lay in his bosom, and was unto him as a daughter* (2 Samuel 12:3), seized to feed a traveller. David''s anger is greatly kindled — *the man that hath done this thing shall surely die* (2 Samuel 12:5) — and the king has sentenced himself. Then the prophet''s word turns: *Thou art the man* (2 Samuel 12:7). This is the office of the prophet, to convict the king by his own mouth where no other voice could reach him. And the spirit of it is restoration, not destruction — *if a man be overtaken in a fault, ye which are spiritual, restore such an one in the spirit of meekness; considering thyself, lest thou also be tempted* (Galatians 6:1) — for Nathan convicts and then says *thou shalt not die.*',
  sv.verse_id, ev.verse_id, 'free', 37525
  FROM _s341_2sa12_lookup sv, _s341_2sa12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=12 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='2-samuel' AND ev.chapter_number=12 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-samuel-12-the-sword-shall-never-depart-the-consequence-remains',
  E'The sword shall never depart — the consequence remains',
  E'The lawsuit is named: *Wherefore hast thou despised the commandment of Yahuah (LORD), to do evil in his sight?* (2 Samuel 12:9), and the sentence falls — *Now therefore the sword shall never depart from thine house* (2 Samuel 12:10). This is the rod the covenant itself foretold: *If he commit iniquity, I will chasten him with the rod of men, and with the stripes of the children of men* (2 Samuel 7:14). Even after the pardon of the next verse, the chastening is real — grace is not the cancellation of all consequence. It is the wilderness pattern exactly: *I have pardoned according to thy word* (Numbers 14:20), Yahuah says, and still *your carcases shall fall in this wilderness* (Numbers 14:29). Forgiveness lifts the guilt; it does not unmake every harvest the deed has sown — *whatsoever a man soweth, that shall he also reap* (Galatians 6:7). The Torah is never the curse; to despise it is, and the reaping is sure.',
  sv.verse_id, ev.verse_id, 'free', 37528
  FROM _s341_2sa12_lookup sv, _s341_2sa12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=12 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='2-samuel' AND ev.chapter_number=12 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-samuel-12-i-have-sinned-against-yahuah-instant-grace-on-confession',
  E'I have sinned against Yahuah — instant grace on confession',
  E'Five words break a year of covering: *And David said unto Nathan, I have sinned against Yahuah (LORD)* (2 Samuel 12:13). And the answer is just as immediate — *And Nathan said unto David, Yahuah (LORD) also hath put away thy sin; thou shalt not die.* This is the whole rhythm of true repentance, sung in David''s own Psalm: *I acknowledged my sin unto thee, and mine iniquity have I not hid... and thou forgavest the iniquity of my sin* (Psalm 32:5). The proverb is his story in one line: *He that covereth his sins shall not prosper: but whoso confesseth and forsaketh them shall have mercy* (Proverbs 28:13). The moment the sin is owned and not hidden, mercy is already given — the same faithfulness the apostle names: *If we confess our sins, he is faithful and just to forgive us our sins, and to cleanse us from all unrighteousness* (1 John 1:9). This is not cheap grace; it is the grace that meets honesty.',
  sv.verse_id, ev.verse_id, 'free', 37531
  FROM _s341_2sa12_lookup sv, _s341_2sa12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=12 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='2-samuel' AND ev.chapter_number=12 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-samuel-12-create-in-me-a-clean-heart-the-fifty-first-psalm',
  E'Create in me a clean heart — the fifty-first Psalm',
  E'David''s bare *I have sinned against Yahuah (LORD)* (2 Samuel 12:13) opens, in the fifty-first Psalm — his answer to this very hour when Nathan came — into the whole cry of the miserere: *Have mercy upon me, O Elohim (God), according to thy lovingkindness... blot out my transgressions* (Psalm 51:1); *For I acknowledge my transgressions: and my sin is ever before me* (Psalm 51:3); *Against thee, thee only, have I sinned, and done this evil in thy sight* (Psalm 51:4). And forgiveness is not the end of it — the king begs to be re-made within: *Create in me a clean heart, O Elohim (God); and renew a right spirit within me* (Psalm 51:10), for *the sacrifices of Elohim (God) are a broken spirit: a broken and a contrite heart, O Elohim (God), thou wilt not despise* (Psalm 51:17). This clean heart is the new covenant''s whole hope: *A new heart also will I give you, and a new spirit will I put within you: and I will take away the stony heart out of your flesh, and I will give you an heart of flesh* (Ezekiel 36:26) — and it is no licence to sin on, for the very next word is *I will put my spirit within you, and cause you to walk in my statutes* (Ezekiel 36:27). The clean heart is the Torah written within.',
  sv.verse_id, ev.verse_id, 'free', 37534
  FROM _s341_2sa12_lookup sv, _s341_2sa12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=12 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='2-samuel' AND ev.chapter_number=12 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-samuel-12-i-shall-go-to-him-but-he-shall-not-return-to-me',
  E'I shall go to him, but he shall not return to me',
  E'While the child lives, David fasts and weeps and lies all night upon the earth, pleading — *Who can tell whether GOD will be gracious to me, that the child may live?* (2 Samuel 12:22). When the child dies, the servants fear to tell him, but David rises, washes, worships in the house of Yahuah, and eats. To their bewilderment he answers: *But now he is dead, wherefore should I fast? can I bring him back again? I shall go to him, but he shall not return to me* (2 Samuel 12:23). Here is a hope that reaches past the grave — not that the dead return to the living, but that the living go to the dead and are gathered to them. David does not say the child is simply gone; he says *I shall go to him.* The covenant Father who chastens is the same who keeps His own beyond death, the seed of the resurrection-hope that runs through the whole canon.',
  sv.verse_id, ev.verse_id, 'free', 37537
  FROM _s341_2sa12_lookup sv, _s341_2sa12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=12 AND sv.verse_number=23
   AND ev.edition_slug='canon' AND ev.book_slug='2-samuel' AND ev.chapter_number=12 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-samuel-12-solomon-jedidiah-beloved-of-yah-the-line-preserved',
  E'Solomon, Jedidiah — beloved of Yah, the line preserved',
  E'Out of the very breach the promise runs on. David comforts Bath-sheba, *and she bare a son, and he called his name Solomon: and Yahuah (LORD) loved him* (2 Samuel 12:24); and Yahuah Himself names the child through the prophet — *he called his name Jedidiah, because of Yahuah (LORD)* (2 Samuel 12:25), Jedidiah, beloved of Yah. The same Nathan who came in judgment comes now in blessing. And the genealogy of the Messiah does not hide where this son came from: *And David the king begat Solomon of her that had been the wife of Urias* (Matthew 1:6). Mercy carries the seed-promise straight through pardoned sin — the beloved son standing first in the line that runs down to the Beloved Son, the seed of David preserved.',
  sv.verse_id, ev.verse_id, 'free', 37540
  FROM _s341_2sa12_lookup sv, _s341_2sa12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=12 AND sv.verse_number=24
   AND ev.edition_slug='canon' AND ev.book_slug='2-samuel' AND ev.chapter_number=12 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

-- ============================ thread_members ============================
-- Thread 1: the poor man's one ewe lamb / Thou art the man
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'2 Samuel 7:3 — the same prophet Nathan who once blessed the house of David: *Go, do all that is in thine heart; for Yahuah (LORD) is with thee.*'
  FROM cross_reference_threads t
  JOIN _s341_2sa12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=12 AND sv.verse_number=1
  JOIN _s341_2sa12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-12-the-poor-mans-one-ewe-lamb-thou-art-the-man'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'2 Samuel 7:2 — Nathan the prophet, who carried the everlasting covenant, now returns to arraign the king he once blessed: *Thou art the man.*'
  FROM cross_reference_threads t
  JOIN _s341_2sa12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=12 AND sv.verse_number=7
  JOIN _s341_2sa12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-12-the-poor-mans-one-ewe-lamb-thou-art-the-man'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Galatians 6:1 — restore the overtaken in the spirit of meekness; David, quick to judge another (*shall surely die*), is restored, not destroyed.'
  FROM cross_reference_threads t
  JOIN _s341_2sa12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=12 AND sv.verse_number=5
  JOIN _s341_2sa12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=6 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-12-the-poor-mans-one-ewe-lamb-thou-art-the-man'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2: the sword shall never depart / the consequence remains
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'2 Samuel 7:14 — the covenant already named the rod: *If he commit iniquity, I will chasten him with the rod of men*; the sword falling is that very chastening.'
  FROM cross_reference_threads t
  JOIN _s341_2sa12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=12 AND sv.verse_number=10
  JOIN _s341_2sa12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-12-the-sword-shall-never-depart-the-consequence-remains'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Numbers 14:20 — *I have pardoned according to thy word* — yet the carcases still fall in the wilderness; pardon lifts guilt, not every consequence.'
  FROM cross_reference_threads t
  JOIN _s341_2sa12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=12 AND sv.verse_number=13
  JOIN _s341_2sa12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=14 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-12-the-sword-shall-never-depart-the-consequence-remains'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Galatians 6:7 — *whatsoever a man soweth, that shall he also reap*; David despised the commandment, and the sword is the harvest reaped back.'
  FROM cross_reference_threads t
  JOIN _s341_2sa12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=12 AND sv.verse_number=9
  JOIN _s341_2sa12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=6 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-12-the-sword-shall-never-depart-the-consequence-remains'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3: I have sinned against Yahuah / instant grace on confession
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Psalm 32:5 — *I acknowledged my sin... and thou forgavest the iniquity of my sin*; the very rhythm of confession met instantly by pardon.'
  FROM cross_reference_threads t
  JOIN _s341_2sa12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=12 AND sv.verse_number=13
  JOIN _s341_2sa12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=32 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-12-i-have-sinned-against-yahuah-instant-grace-on-confession'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Proverbs 28:13 — *whoso confesseth and forsaketh them shall have mercy*; the king''s own story compressed into a single line of wisdom.'
  FROM cross_reference_threads t
  JOIN _s341_2sa12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=12 AND sv.verse_number=13
  JOIN _s341_2sa12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=28 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-12-i-have-sinned-against-yahuah-instant-grace-on-confession'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'1 John 1:9 — *if we confess our sins, he is faithful and just to forgive*; the apostle simply repeats the Tanakh pattern David lived.'
  FROM cross_reference_threads t
  JOIN _s341_2sa12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=12 AND sv.verse_number=13
  JOIN _s341_2sa12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=1 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-12-i-have-sinned-against-yahuah-instant-grace-on-confession'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4: create in me a clean heart / the fifty-first Psalm
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Psalm 51:1 — *Have mercy upon me, O Elohim (God)... blot out my transgressions*; the opening of David''s answer to the hour Nathan came.'
  FROM cross_reference_threads t
  JOIN _s341_2sa12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=12 AND sv.verse_number=13
  JOIN _s341_2sa12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=51 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-12-create-in-me-a-clean-heart-the-fifty-first-psalm'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Psalm 51:3 — *my sin is ever before me*; the bare confession laid wholly bare, the sin not hidden but held in view.'
  FROM cross_reference_threads t
  JOIN _s341_2sa12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=12 AND sv.verse_number=13
  JOIN _s341_2sa12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=51 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-12-create-in-me-a-clean-heart-the-fifty-first-psalm'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Psalm 51:4 — *Against thee, thee only, have I sinned*; David names the One first sinned against, the covenant breach against Yahuah.'
  FROM cross_reference_threads t
  JOIN _s341_2sa12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=12 AND sv.verse_number=13
  JOIN _s341_2sa12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=51 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-12-create-in-me-a-clean-heart-the-fifty-first-psalm'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Psalm 51:10 — *Create in me a clean heart, O Elohim (God)*; forgiveness is not the end — David begs to be re-made within.'
  FROM cross_reference_threads t
  JOIN _s341_2sa12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=12 AND sv.verse_number=13
  JOIN _s341_2sa12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=51 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-12-create-in-me-a-clean-heart-the-fifty-first-psalm'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Psalm 51:17 — *a broken and a contrite heart, O Elohim (God), thou wilt not despise*; what stands behind the bare confession.'
  FROM cross_reference_threads t
  JOIN _s341_2sa12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=12 AND sv.verse_number=13
  JOIN _s341_2sa12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=51 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-12-create-in-me-a-clean-heart-the-fifty-first-psalm'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Ezekiel 36:26 — *A new heart also will I give you... an heart of flesh*; the clean heart is the new covenant — and v.27 makes it walking in the statutes, the Torah within, NOT antinomian.'
  FROM cross_reference_threads t
  JOIN _s341_2sa12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=12 AND sv.verse_number=13
  JOIN _s341_2sa12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-12-create-in-me-a-clean-heart-the-fifty-first-psalm'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 6: Solomon / Jedidiah, beloved of Yah / the line preserved
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Matthew 1:6 — *David the king begat Solomon of her that had been the wife of Urias*; the royal line runs on out of the very breach.'
  FROM cross_reference_threads t
  JOIN _s341_2sa12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=12 AND sv.verse_number=24
  JOIN _s341_2sa12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=1 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-12-solomon-jedidiah-beloved-of-yah-the-line-preserved'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Matthew 1:6 — Jedidiah, beloved of Yah, stands first in the line that runs down to the Messiah, the seed of David preserved through pardoned sin.'
  FROM cross_reference_threads t
  JOIN _s341_2sa12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=12 AND sv.verse_number=25
  JOIN _s341_2sa12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=1 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-12-solomon-jedidiah-beloved-of-yah-the-line-preserved'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread "i-shall-go-to-him" members (resurrection-hope weave, repair)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*that ye sorrow not, even as others which have no hope* (1 Thessalonians 4:13) — David''s *I shall go to him, but he shall not return to me* (2 Samuel 12:23) is the covenant mourner''s grief, not the hopeless despair; the child is asleep, gone ahead, not lost.'
  FROM cross_reference_threads t
  JOIN _s341_2sa12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=12 AND sv.verse_number=23
  JOIN _s341_2sa12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-thessalonians' AND tv.chapter_number=4 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-12-i-shall-go-to-him-but-he-shall-not-return-to-me'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*I am the resurrection, and the life: he that believeth in me, though he were dead, yet shall he live* (John 11:25) — the One who raises the sleeping is the ground of David''s certainty that he will *go to him* (2 Samuel 12:23); the road runs one way, toward reunion.'
  FROM cross_reference_threads t
  JOIN _s341_2sa12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=12 AND sv.verse_number=23
  JOIN _s341_2sa12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=11 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-12-i-shall-go-to-him-but-he-shall-not-return-to-me'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2-samuel_13.sql (2 Samuel 13) -----
-- 2 Samuel 13 — The sword in David's own house (12:10-11 fulfilled): Amnon, by Jonadab's
-- crafty counsel, feigns sickness and forces his half-sister Tamar — the very abominations
-- the Torah forbids; Tamar the violated, desolate victim; David wroth but does nothing;
-- Absalom nurses hatred two years and murders Amnon at the sheepshearing — blood for the
-- unavenged sister, the seed of the rebellion to come. Handled gravely, no sensation.
-- TAG: 2sa13   VIEW: _s341_2sa13_lookup   SORT BAND: 37550 step 3 (37550, 37553, 37556)
--
-- ===== PER-CHAPTER COVERAGE CHECKLIST =====
-- v.1-7   NT:     none warranted (the feigned-sickness plot; narrative setup)
--         Extras: none warranted
--         Tanakh: none warranted (set up under thread 1)
-- v.12    NT:     none warranted
--         Extras: none warranted
--         Tanakh: Genesis 34:7 (folly wrought in Yashar'el) [thread 1]
-- v.13    NT:     none warranted
--         Extras: none warranted
--         Tanakh: Leviticus 18:9, Leviticus 18:11, Leviticus 20:17 (sister's nakedness) [thread 1]
-- v.14    NT:     none warranted
--         Extras: none warranted
--         Tanakh: Deuteronomy 22:25, Deuteronomy 22:26, Deuteronomy 22:27 (he forced her;
--                 the victim guiltless) [thread 1]
-- v.15-20 NT:     none warranted
--         Extras: none warranted
--         Tanakh: Genesis 34:31 (dealt with as a harlot — the violated daughter) [thread 2];
--                 Leviticus 18:5 (the statutes a man lives in — the covenant standard) [thread 2 frame]
-- v.21    NT:     none warranted
--         Extras: none warranted
--         Tanakh: 2 Samuel 12:10 (the sword shall never depart) [thread 3]
-- v.22-29 NT:     none warranted
--         Extras: none warranted
--         Tanakh: 2 Samuel 12:10, 2 Samuel 12:11 (evil raised up out of thine own house) [thread 3];
--                 Genesis 34:25, Genesis 34:26 (brothers take the sword for the violated sister) [thread 3]
-- v.30-39 NT:     none warranted
--         Extras: none warranted
--         Tanakh: gathered under thread 3 (Absalom flees; David mourns)
--
-- ===== THREADS =====
-- 1. 2-samuel-13-no-such-thing-ought-to-be-done-in-yashar'el
--      target libs: Tanakh (Leviticus 18:9/18:11/20:17 incest forbidden; Deuteronomy
--      22:25/26/27 the forced victim guiltless; Genesis 34:7 folly in Yashar'el). tier free.
--      FRAME: Tamar pleads by the covenant standard the Torah itself sets; the Torah forbids
--      exactly this abomination (Torah affirmed, never the curse).
-- 2. 2-samuel-13-tamar-remained-desolate
--      target libs: Tanakh (Genesis 34:31 dealt-with-as-a-harlot; Leviticus 18:5 the statutes
--      a man lives in). tier free. FRAME: victims-not-enemies — Tamar the violated, desolate
--      one, cast out; the love that was lust turns to hatred.
-- 3. 2-samuel-13-the-sword-departed-not-from-davids-house
--      target libs: Tanakh (2 Samuel 12:10 the sword shall never depart; 2 Samuel 12:11 evil
--      raised up out of thine own house; Genesis 34:25/34:26 the brothers' sword for the
--      sister). tier free. FRAME: the unfolding of the 12:10 judgment — the unavenged
--      abomination breeds the murder, the seed of the rebellion to come.

CREATE TEMP VIEW _s341_2sa13_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== B. cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the Torah standard exposes the abomination
    ('canon','2-samuel',13,12,'canon','genesis',34,7,'free',
      E'*And the sons of Jacob came out of the field when they heard it: and the men were grieved, and they were very wroth, because he had wrought folly in Yashar''el (Israel) in lying with Jacob''s daughter; which thing ought not to be done* (Genesis 34:7). Tamar pleads in the exact covenant words: *no such thing ought to be done in Yashar''el (Israel): do not thou this folly* (2 Samuel 13:12). The defiling of a daughter of the covenant is *folly in Yashar''el* — a fixed standard older than David''s house, which Amnon knew and trampled.'),
    ('canon','2-samuel',13,13,'canon','leviticus',18,9,'free',
      E'*The nakedness of thy sister, the daughter of thy father, or daughter of thy mother, whether she be born at home, or born abroad, even their nakedness thou shalt not uncover* (Leviticus 18:9). Tamar is Amnon''s half-sister, *the daughter of thy father* — the very kinship the Torah names first. Her cry *whither shall I cause my shame to go?* (2 Samuel 13:13) is the shame the statute was given to prevent.'),
    ('canon','2-samuel',13,13,'canon','leviticus',18,11,'free',
      E'*The nakedness of thy father''s wife''s daughter, begotten of thy father, she is thy sister, thou shalt not uncover her nakedness* (Leviticus 18:11). The Torah spells out the half-sister case precisely — *she is thy sister*. Amnon and Tamar share David their father; the bar Tamar names by saying *as for thee, thou shalt be as one of the fools in Yashar''el* (2 Samuel 13:13) is this written word, not her invention.'),
    ('canon','2-samuel',13,13,'canon','leviticus',20,17,'free',
      E'*And if a man shall take his sister, his father''s daughter, or his mother''s daughter, and see her nakedness... it is a wicked thing... he hath uncovered his sister''s nakedness; he shall bear his iniquity* (Leviticus 20:17). The same Torah that forbids the act fixes the guilt on the man — *he shall bear his iniquity*. Tamar offers the lawful path, *speak unto the king; for he will not withhold me from thee* (2 Samuel 13:13); Amnon refuses the covenant and chooses the abomination.'),
    ('canon','2-samuel',13,14,'canon','deuteronomy',22,25,'free',
      E'*But if a man find a betrothed damsel in the field, and the man force her, and lie with her: then the man only that lay with her shall die* (Deuteronomy 22:25). The text names Amnon''s deed by the Torah''s own word: *being stronger than she, forced her, and lay with her* (2 Samuel 13:14). The guilt is the forcer''s alone — *the man only*.'),
    ('canon','2-samuel',13,14,'canon','deuteronomy',22,26,'free',
      E'*But unto the damsel thou shalt do nothing; there is in the damsel no sin worthy of death: for as when a man riseth against his neighbour, and slayeth him, even so is this matter* (Deuteronomy 22:26). The Torah measures the forcing of a woman as a man rising to slay his neighbour — a violence done TO her. Tamar, *being stronger than she, forced her* (2 Samuel 13:14), is *the damsel* who has done nothing: the victim, never the offender.'),
    ('canon','2-samuel',13,14,'canon','deuteronomy',22,27,'free',
      E'*For he found her in the field, and the betrothed damsel cried, and there was none to save her* (Deuteronomy 22:27). Amnon had emptied the room — *Have out all men from me. And they went out every man from him* (2 Samuel 13:9) — so that, like the damsel in the field, *there was none to save her*. The Torah''s tenderness toward the cornered, unheard victim reads Tamar exactly.'),
    -- THREAD 2: Tamar the desolate violated one
    ('canon','2-samuel',13,15,'canon','genesis',34,31,'free',
      E'*And they said, Should he deal with our sister as with an harlot?* (Genesis 34:31). Amnon''s lust spent, *Amnon hated her exceedingly; so that the hatred wherewith he hated her was greater than the love wherewith he had loved her* (2 Samuel 13:15), and casts her out — dealing with a daughter of Yashar''el as a thing to be used and discarded, the very contempt Dinah''s brothers named.'),
    ('canon','2-samuel',13,20,'canon','leviticus',18,5,'free',
      E'*Ye shall therefore keep my statutes, and my judgments: which if a man do, he shall live in them: I am Yahuah (LORD)* (Leviticus 18:5). The statutes are the path of life; Amnon broke them and left *Tamar... desolate in her brother Absalom''s house* (2 Samuel 13:20) — desolation is what the abandoned commandment leaves in its wake. The Torah keeper lives; the covenant-breaker scatters death and desolation through the house.'),
    -- THREAD 3: the sword unfolds the 12:10 judgment
    ('canon','2-samuel',13,21,'canon','2-samuel',12,10,'free',
      E'*Now therefore the sword shall never depart from thine house; because thou hast despised me, and hast taken the wife of Uriah the Hittite to be thy wife* (2 Samuel 12:10). David hears of the rape and *was very wroth* (2 Samuel 13:21) — yet does nothing, the passive father. The word Nathan spoke over David''s own sin against a wife now bears its first bitter fruit inside his own house.'),
    ('canon','2-samuel',13,22,'canon','2-samuel',12,11,'free',
      E'*Thus saith Yahuah (LORD), Behold, I will raise up evil against thee out of thine own house...* (2 Samuel 12:11). The evil is raised up *out of thine own house*: *Absalom hated Amnon, because he had forced his sister Tamar* (2 Samuel 13:22). The unavenged abomination festers into a brother''s murderous hatred — the judgment unfolding from within.'),
    ('canon','2-samuel',13,28,'canon','2-samuel',12,10,'free',
      E'*Now therefore the sword shall never depart from thine house* (2 Samuel 12:10). Two years of silent hatred end in blood: *when I say unto you, Smite Amnon; then kill him* (2 Samuel 13:28). The literal sword now strikes inside David''s house, son slaying son, exactly as Nathan foretold.'),
    ('canon','2-samuel',13,28,'canon','genesis',34,25,'free',
      E'*And it came to pass on the third day, when they were sore, that two of the sons of Jacob, Simeon and Levi, Dinah''s brethren, took each man his sword, and came upon the city boldly, and slew all the males* (Genesis 34:25). As Dinah''s brothers took the sword for their violated sister, so Absalom''s servants *did unto Amnon as Absalom had commanded* (2 Samuel 13:29) — the brother''s vengeance for the unavenged sister, the same grievous pattern of blood answering the defilement of a daughter of Yashar''el.'),
    ('canon','2-samuel',13,29,'canon','genesis',34,26,'free',
      E'*And they slew Hamor and Shechem his son with the edge of the sword, and took Dinah out of Shechem''s house, and went out* (Genesis 34:26). *And the servants of Absalom did unto Amnon as Absalom had commanded* (2 Samuel 13:29). In both houses the violation of a sister goes unjudged by the father and is answered by the brothers'' sword — vengeance where covenant justice was withheld, the seed of greater sorrow to come.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s341_2sa13_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s341_2sa13_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== C. threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT E'2-samuel-13-no-such-thing-ought-to-be-done-in-yashar''el',
       E'No Such Thing Ought to Be Done in Yashar''el — the Torah''s Standard Exposes the Abomination',
       E'When Amnon seizes his half-sister, Tamar does not reason from feeling but from the covenant: *Nay, my brother, do not force me; for no such thing ought to be done in Yashar''el (Israel): do not thou this folly* (2 Samuel 13:12). Her words are the Torah''s own. The defiling of a daughter of the covenant is named *folly in Yashar''el* already in Dinah''s day — *because he had wrought folly in Yashar''el... which thing ought not to be done* (Genesis 34:7). The kinship she names is the first the statute forbids: *The nakedness of thy sister, the daughter of thy father... thou shalt not uncover* (Leviticus 18:9), spelled out for the half-sister, *she is thy sister, thou shalt not uncover her nakedness* (Leviticus 18:11), with the guilt fixed on the man — *he hath uncovered his sister''s nakedness; he shall bear his iniquity* (Leviticus 20:17). And the forcing itself the Torah judges as violence done TO her: *the man only that lay with her shall die* (Deuteronomy 22:25); *unto the damsel thou shalt do nothing; there is in the damsel no sin worthy of death: for as when a man riseth against his neighbour, and slayeth him, even so is this matter* (Deuteronomy 22:26); *he found her in the field, and the betrothed damsel cried, and there was none to save her* (Deuteronomy 22:27). Amnon had cleared the room — *Have out all men from me* (2 Samuel 13:9) — so that *there was none to save her*. The Torah is not the curse here; it is the very wall Amnon broke through, the standard that names his deed for what it is and lays the whole weight of guilt on him alone.',
       sv.verse_id, ev.verse_id, 'free', 37550
  FROM _s341_2sa13_lookup sv, _s341_2sa13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=13 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='2-samuel' AND ev.chapter_number=13 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT E'2-samuel-13-tamar-remained-desolate',
       E'Tamar Remained Desolate — the Violated, Cast-Out Victim',
       E'The same lust that drove Amnon turns instantly to loathing: *Then Amnon hated her exceedingly; so that the hatred wherewith he hated her was greater than the love wherewith he had loved her. And Amnon said unto her, Arise, be gone* (2 Samuel 13:15). What he called love was never love; and Tamar names the second cruelty — *this evil in sending me away is greater than the other that thou didst unto me* (2 Samuel 13:16). She is bolted out, ashes on her head, her royal virgin''s robe rent, crying aloud, and left *desolate in her brother Absalom''s house* (2 Samuel 13:20). She is the victim, never the offender — a daughter of Yashar''el *dealt with... as with an harlot*, the very contempt Dinah''s brothers refused to abide: *Should he deal with our sister as with an harlot?* (Genesis 34:31). And her desolation testifies against the broken statute, for the covenant was the path of life — *Ye shall therefore keep my statutes, and my judgments: which if a man do, he shall live in them* (Leviticus 18:5). Where the commandment is trampled, the innocent are left desolate. The text holds Tamar gently and lays no blame on her; the blame is Amnon''s, and the father''s who did not act.',
       sv.verse_id, ev.verse_id, 'free', 37553
  FROM _s341_2sa13_lookup sv, _s341_2sa13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=13 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='2-samuel' AND ev.chapter_number=13 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT E'2-samuel-13-the-sword-departed-not-from-davids-house',
       E'The Sword Departed Not From David''s House — the 12:10 Judgment Unfolds',
       E'Nathan''s word over David''s own sin against a wife now bears its first fruit inside David''s house: *Now therefore the sword shall never depart from thine house; because thou hast despised me, and hast taken the wife of Uriah the Hittite to be thy wife* (2 Samuel 12:10); *Behold, I will raise up evil against thee out of thine own house* (2 Samuel 12:11). David hears of the rape and *was very wroth* (2 Samuel 13:21) — but does nothing, the passive father who will not correct his son, and the unjudged abomination festers. *Absalom hated Amnon, because he had forced his sister Tamar* (2 Samuel 13:22). Two silent years later the hatred ripens at the sheepshearing: *when I say unto you, Smite Amnon; then kill him, fear not* (2 Samuel 13:28), and *the servants of Absalom did unto Amnon as Absalom had commanded* (2 Samuel 13:29). The sword has struck inside the house, son slaying son — the *evil... out of thine own house* exactly as foretold. It is the old pattern of Dinah, where the brothers took the sword for the violated sister the father failed to defend: *two of the sons of Jacob, Simeon and Levi, Dinah''s brethren, took each man his sword... and slew all the males* (Genesis 34:25); *and they slew Hamor and Shechem his son with the edge of the sword* (Genesis 34:26). Vengeance fills the place where covenant justice was withheld — and Absalom''s blood for his sister is the very seed of the rebellion that will yet rise against David.',
       sv.verse_id, ev.verse_id, 'free', 37556
  FROM _s341_2sa13_lookup sv, _s341_2sa13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=13 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='2-samuel' AND ev.chapter_number=13 AND ev.verse_number=29
ON CONFLICT (slug) DO NOTHING;

-- ===== D. thread_members =====
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*because he had wrought folly in Yashar''el (Israel)... which thing ought not to be done* (Genesis 34:7) — Tamar pleads the same fixed standard: *no such thing ought to be done in Yashar''el* (2 Samuel 13:12).'
  FROM cross_reference_threads t
  JOIN _s341_2sa13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=13 AND sv.verse_number=12
  JOIN _s341_2sa13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=34 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug=E'2-samuel-13-no-such-thing-ought-to-be-done-in-yashar''el'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*The nakedness of thy sister, the daughter of thy father... thou shalt not uncover* (Leviticus 18:9) — the half-sister case the Torah names first; Tamar is David''s daughter as Amnon is.'
  FROM cross_reference_threads t
  JOIN _s341_2sa13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=13 AND sv.verse_number=13
  JOIN _s341_2sa13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=18 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug=E'2-samuel-13-no-such-thing-ought-to-be-done-in-yashar''el'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*she is thy sister, thou shalt not uncover her nakedness* (Leviticus 18:11) — the written bar Tamar invokes by *thou shalt be as one of the fools in Yashar''el* (2 Samuel 13:13).'
  FROM cross_reference_threads t
  JOIN _s341_2sa13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=13 AND sv.verse_number=13
  JOIN _s341_2sa13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=18 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug=E'2-samuel-13-no-such-thing-ought-to-be-done-in-yashar''el'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*he hath uncovered his sister''s nakedness; he shall bear his iniquity* (Leviticus 20:17) — the Torah lays the whole guilt on the man, the same Torah Amnon refused.'
  FROM cross_reference_threads t
  JOIN _s341_2sa13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=13 AND sv.verse_number=13
  JOIN _s341_2sa13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=20 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug=E'2-samuel-13-no-such-thing-ought-to-be-done-in-yashar''el'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*the man only that lay with her shall die* (Deuteronomy 22:25) — the forcer alone bears the death; *being stronger than she, forced her* (2 Samuel 13:14).'
  FROM cross_reference_threads t
  JOIN _s341_2sa13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=13 AND sv.verse_number=14
  JOIN _s341_2sa13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=22 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug=E'2-samuel-13-no-such-thing-ought-to-be-done-in-yashar''el'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*unto the damsel thou shalt do nothing; there is in the damsel no sin worthy of death... even so is this matter* (Deuteronomy 22:26) — the Torah weighs forcing as a man slaying his neighbour; Tamar has done nothing.'
  FROM cross_reference_threads t
  JOIN _s341_2sa13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=13 AND sv.verse_number=14
  JOIN _s341_2sa13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=22 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug=E'2-samuel-13-no-such-thing-ought-to-be-done-in-yashar''el'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*the betrothed damsel cried, and there was none to save her* (Deuteronomy 22:27) — Amnon cleared the room, *Have out all men from me* (2 Samuel 13:9), so there was none to save her.'
  FROM cross_reference_threads t
  JOIN _s341_2sa13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=13 AND sv.verse_number=14
  JOIN _s341_2sa13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=22 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug=E'2-samuel-13-no-such-thing-ought-to-be-done-in-yashar''el'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Should he deal with our sister as with an harlot?* (Genesis 34:31) — the contempt of a daughter of Yashar''el used and cast off; Amnon''s love turns to hatred and *Arise, be gone* (2 Samuel 13:15).'
  FROM cross_reference_threads t
  JOIN _s341_2sa13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=13 AND sv.verse_number=15
  JOIN _s341_2sa13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=34 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-13-tamar-remained-desolate'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*which if a man do, he shall live in them* (Leviticus 18:5) — the statutes are the path of life; the broken commandment leaves Tamar *desolate* (2 Samuel 13:20).'
  FROM cross_reference_threads t
  JOIN _s341_2sa13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=13 AND sv.verse_number=20
  JOIN _s341_2sa13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=18 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-13-tamar-remained-desolate'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*the sword shall never depart from thine house* (2 Samuel 12:10) — David *was very wroth* (2 Samuel 13:21) but does nothing; the word bears its first fruit in his own house.'
  FROM cross_reference_threads t
  JOIN _s341_2sa13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=13 AND sv.verse_number=21
  JOIN _s341_2sa13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=12 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-13-the-sword-departed-not-from-davids-house'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*I will raise up evil against thee out of thine own house* (2 Samuel 12:11) — *Absalom hated Amnon, because he had forced his sister Tamar* (2 Samuel 13:22); the evil rises from within.'
  FROM cross_reference_threads t
  JOIN _s341_2sa13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=13 AND sv.verse_number=22
  JOIN _s341_2sa13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=12 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-13-the-sword-departed-not-from-davids-house'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the sword shall never depart from thine house* (2 Samuel 12:10) — the literal sword strikes: *Smite Amnon; then kill him* (2 Samuel 13:28), son slaying son as foretold.'
  FROM cross_reference_threads t
  JOIN _s341_2sa13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=13 AND sv.verse_number=28
  JOIN _s341_2sa13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=12 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-13-the-sword-departed-not-from-davids-house'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Simeon and Levi, Dinah''s brethren, took each man his sword... and slew all the males* (Genesis 34:25) — the brothers'' sword for the violated sister; Absalom''s servants do likewise to Amnon (2 Samuel 13:29).'
  FROM cross_reference_threads t
  JOIN _s341_2sa13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=13 AND sv.verse_number=28
  JOIN _s341_2sa13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=34 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-13-the-sword-departed-not-from-davids-house'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*they slew Hamor and Shechem his son with the edge of the sword* (Genesis 34:26) — *the servants of Absalom did unto Amnon as Absalom had commanded* (2 Samuel 13:29); vengeance where the father withheld justice.'
  FROM cross_reference_threads t
  JOIN _s341_2sa13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=13 AND sv.verse_number=29
  JOIN _s341_2sa13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=34 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-13-the-sword-departed-not-from-davids-house'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2-samuel_14.sql (2 Samuel 14) -----
--
-- Book/chapter: 2 Samuel 14    Tag: 2sa14    View: _s341_2sa14_lookup
-- Sort band: base 37575, step 3  ->  37575, 37578, 37581
--
-- 2 Samuel 14 coverage:
--   v.1-3  (Joab sends the wise woman of Tekoah with feigned mourning) -> THREAD 2 (the parable that moves the king)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: 2 Samuel 12:1-4 (Nathan's parable — the self-condemning story) -> THREAD 2
--   v.5-7  (the widow's parable: two sons strove, one slew the other, the family would destroy the heir / quench the coal) -> THREAD 2 source
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: Numbers 35:12,19,24-25 (the avenger of blood, the congregation delivers the slayer, the city of refuge) -> THREAD 2
--   v.11   (let the king remember Yahuah, that the revengers of blood destroy no more) -> THREAD 2 source
--          Tanakh: Numbers 35:25 (the congregation shall deliver the slayer out of the hand of the revenger of blood) -> THREAD 2
--   v.13   (the king doth not fetch home again his banished) -> THREAD 1 source
--   v.14   ★★★ KEYSTONE (we must needs die, as water spilt; yet doth he devise means, that his banished be not expelled from him) -> THREAD 1 source / anchor-start
--          NT:     Luke 15:4,20,24 (the lost sought and found; the father runs); John 6:37 (him that cometh I will in no wise cast out) -> THREAD 1
--          Extras: none warranted (Micah/Isaiah/Psalm carry the Tanakh weight cleanly)
--          Tanakh: Micah 7:18-19 (who pardoneth iniquity; casts all their sins into the depths of the sea);
--                  Isaiah 59:16 (his arm brought salvation; no intercessor); Psalm 103:10-13 (removed our transgressions;
--                  pitieth them that fear him) -> THREAD 1
--   v.16   (deliver his handmaid... out of the inheritance of Elohim) -> THREAD 1 (the banished kept in the inheritance)
--   v.21-23 (the king: bring the young man Absalom again; Joab brings him to Jerusalem) -> THREAD 3 source
--   v.24,28 (let him not see my face; Absalom dwelt two full years and saw not the king's face) -> THREAD 3 source
--          NT:     Luke 15:20 (the father saw him, ran, fell on his neck, kissed him) -> THREAD 3 (the contrast: full embrace)
--          Extras: none warranted
--          Tanakh: 2 Samuel 12:13 (Yahuah hath put away thy sin) -> THREAD 3 (David forgiven full, forgives by halves)
--   v.25-27 (Absalom's beauty, the weight of his hair, his children) -> narrative; none warranted (sets up ch.15-18)
--   v.30-32 (Absalom fires Joab's field to force an audience) -> THREAD 3 (the half-reconciliation festers)
--   v.33   (the king kissed Absalom) -> THREAD 3 anchor-end (the kiss two years late; the breach never truly healed)
--
-- THREADS:
--   2-samuel-14-he-devise-means-that-his-banished-be-not-expelled-from-him  (free)
--       -> Tanakh (Micah, Isaiah, Psalm) + NT (Luke, John) — THE KEYSTONE: Yahuah finds a just means to bring the outcast home
--   2-samuel-14-the-wise-woman-of-tekoah-and-the-avenger-of-blood-stayed   (free)
--       -> Tanakh (2 Samuel 12 Nathan's parable; Numbers 35 cities of refuge / the avenger / the congregation delivers)
--   2-samuel-14-brought-again-but-not-received-the-half-hearted-reconciliation (free)
--       -> Tanakh (2 Samuel 12:13) + NT (Luke 15:20) — the human reconciliation by halves vs the Father's full embrace
--
-- Framework-load-bearing framing:
--   * 14:14 KEYSTONE — *yet doth he devise means, that his banished be not expelled from him*. The wise woman, prompted
--     by Joab, presses David toward Absalom by naming what Yahuah Himself does: He DEVISES MEANS that the banished be
--     not finally cast out. This is the gospel of the gathering — the outcast brought home — but framed as Yahuah's JUST
--     means (Isaiah 59:16 His own arm and righteousness brought salvation; Micah 7:18-19 He pardons AND casts sin into
--     the deep; Psalm 103 He removes transgressions yet still pities them that fear Him and keep His covenant). NOT cheap
--     inclusion, NOT banished-by-confession-alone. The two-house outcast (Yashar'el divorced and scattered) is the larger
--     banished one Yahuah devises means to regather. Forward to Luke 15 (the lost found) and John 6:37 (in no wise cast out).
--   * 14:5-11 — the wise woman's parable mirrors Nathan's (2 Sam 12): the prophetic self-condemning story that moves the
--     king to judge his own case. Her plea to stay "the revengers of blood" rests on the Torah of Numbers 35 — the avenger
--     of blood, the city of refuge, the congregation that delivers the slayer. Torah is the very ground she stands on.
--   * 14:24,33 — David brings Absalom back but will NOT see his face two years; the eventual kiss is reconciliation by
--     halves, and it festers into rebellion (ch.15). The contrast is deliberate: the half-hearted human restoring against
--     Yahuah's full restoring of the banished (Luke 15:20 the father runs and kisses; 2 Sam 12:13 David himself was put
--     away his sin in full, yet forgives his son by halves).

CREATE TEMP VIEW _s341_2sa14_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== B. cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: he devise means, that his banished be not expelled from him (KEYSTONE)
    ('canon','2-samuel',14,14,'canon','micah',7,18,'free',
      E'*Who is a Elohim (God) like unto thee, that pardoneth iniquity, and passeth by the transgression of the remnant of his heritage? he retaineth not his anger for ever, because he delighteth in mercy* (Micah 7:18). The wise woman''s creed — *yet doth he devise means, that his banished be not expelled from him* (2 Samuel 14:14) — is Micah''s very wonder: the Elohim who pardons the remnant''s transgression and does not keep His anger for ever is the One who finds a way to bring the outcast home. He delights in mercy, and so He devises means.'),
    ('canon','2-samuel',14,14,'canon','micah',7,19,'free',
      E'*He will turn again, he will have compassion upon us; he will subdue our iniquities; and thou wilt cast all their sins into the depths of the sea* (Micah 7:19). The banished are not brought home by overlooking the wrong — the sin is subdued and drowned. *Yet doth he devise means, that his banished be not expelled from him* (2 Samuel 14:14): the means is just, not cheap. He casts the sin into the deep and keeps the sinner.'),
    ('canon','2-samuel',14,14,'canon','isaiah',59,16,'free',
      E'*And he saw that there was no man, and wondered that there was no intercessor: therefore his arm brought salvation unto him; and his righteousness, it sustained him* (Isaiah 59:16). When no man could devise the means, Yahuah''s own arm and His own righteousness brought the salvation. The wise woman says Yahuah *devise means, that his banished be not expelled* (2 Samuel 14:14); Isaiah names whose arm devises it — His own, sustained by His own righteousness, so the bringing-home wrongs no justice.'),
    ('canon','2-samuel',14,14,'canon','psalms',103,12,'free',
      E'*As far as the east is from the west, so far hath he removed our transgressions from us* (Psalm 103:12). To devise means that the banished be not expelled, Yahuah first removes what banished them. The wise woman knows *we are as water spilt on the ground, which cannot be gathered up again* (2 Samuel 14:14) — man cannot un-spill himself; but Yahuah can carry the transgression an infinite distance away and gather the outcast home.'),
    ('canon','2-samuel',14,14,'canon','psalms',103,13,'free',
      E'*Like as a father pitieth his children, so Yahuah (LORD) pitieth them that fear him* (Psalm 103:13). The wise woman pleads to a king who is also a father, that a banished son be brought home. The Psalm reaches past David to the true Father whose pity moves Him to devise the means the human father only half-managed: *that his banished be not expelled from him* (2 Samuel 14:14).'),
    ('canon','2-samuel',14,14,'canon','luke',15,4,'free',
      E'*What man of you, having an hundred sheep, if he lose one of them, doth not leave the ninety and nine in the wilderness, and go after that which is lost, until he find it?* (Luke 15:4). The means Yahuah devises is a seeking — He goes after the banished one *until he find it*. The wise woman''s word, *that his banished be not expelled from him* (2 Samuel 14:14), is the parable of the lost sheep before it was spoken: the Shepherd will not let the outcast stay lost.'),
    ('canon','2-samuel',14,14,'canon','luke',15,20,'free',
      E'*And he arose, and came to his father. But when he was yet a great way off, his father saw him, and had compassion, and ran, and fell on his neck, and kissed him* (Luke 15:20). The far country is the place of the banished; the means Yahuah devises is a Father who runs to meet the returning outcast. *Yet doth he devise means, that his banished be not expelled from him* (2 Samuel 14:14) — and here is the means embodied, the Father running while the son is yet a great way off.'),
    ('canon','2-samuel',14,14,'canon','luke',15,24,'free',
      E'*For this my son was dead, and is alive again; he was lost, and is found. And they began to be merry* (Luke 15:24). The banished son counted as dead is restored to the house and to life. The wise woman speaks of one *expelled* who is yet not expelled for ever (2 Samuel 14:14); the Father''s verdict over the returned is *was lost, and is found* — the banished gathered home and the house made merry.'),
    ('canon','2-samuel',14,14,'canon','john',6,37,'free',
      E'*All that the Father giveth me shall come to me; and him that cometh to me I will in no wise cast out* (John 6:37). This is the keystone answered in full. The wise woman could only hope a king would devise means that his banished *be not expelled from him* (2 Samuel 14:14); the Formed Son speaks it as covenant promise — *him that cometh to me I will in no wise cast out*. The banished who comes is never expelled again.'),

    -- THREAD 2: the wise woman of Tekoah and the avenger of blood stayed
    ('canon','2-samuel',14,3,'canon','2-samuel',12,1,'free',
      E'*And Yahuah (LORD) sent Nathan unto David. And he came unto him, and said unto him, There were two men in one city; the one rich, and the other poor* (2 Samuel 12:1). Joab *put the words in her mouth* (2 Samuel 14:3) exactly as Yahuah had put words in Nathan''s: the king is moved to judge his own case by a parable. The wise woman''s feigned suit is Nathan''s device a second time — a story that catches the king before he knows he is the man.'),
    ('canon','2-samuel',14,6,'canon','2-samuel',12,3,'free',
      E'*But the poor man had nothing, save one little ewe lamb... and it grew up together with him, and with his children... and was unto him as a daughter* (2 Samuel 12:3). The wise woman frames her loss as Nathan framed his: *thy handmaid had two sons, and they two strove together in the field... but the one smote the other, and slew him* (2 Samuel 14:6). The pathos of the single precious thing about to be taken is the same hook — the king pities the tale before he sees the mirror.'),
    ('canon','2-samuel',14,7,'canon','numbers',35,19,'free',
      E'*The revenger of blood himself shall slay the murderer: when he meeteth him, he shall slay him* (Numbers 35:19). The whole family pressing the widow — *Deliver him that smote his brother, that we may kill him, for the life of his brother whom he slew* (2 Samuel 14:7) — invokes precisely the Torah avenger of blood. Her parable lives inside Numbers 35: the blood of the slain demands the slayer, and the family claims that right.'),
    ('canon','2-samuel',14,7,'canon','numbers',35,12,'free',
      E'*And they shall be unto you cities for refuge from the avenger; that the manslayer die not, until he stand before the congregation in judgment* (Numbers 35:12). Torah does not leave the slayer to the avenger''s hand alone — there is refuge, and a congregation that judges first. The widow''s plea that her one remaining son not be slain (2 Samuel 14:7) appeals to that mercy built into the Torah: not every slayer is a murderer, and the heir must not be quenched without judgment.'),
    ('canon','2-samuel',14,11,'canon','numbers',35,25,'free',
      E'*And the congregation shall deliver the slayer out of the hand of the revenger of blood, and the congregation shall restore him to the city of his refuge* (Numbers 35:25). When David swears *there shall not one hair of thy son fall to the earth* (2 Samuel 14:11), he acts as the congregation Numbers commands — delivering the slayer out of the avenger''s hand. The king does for the parable-son exactly what Torah does for the manslayer: stays the blood and grants refuge.'),

    -- THREAD 3: brought again but not received — the half-hearted reconciliation
    ('canon','2-samuel',14,24,'canon','2-samuel',12,13,'free',
      E'*And David said unto Nathan, I have sinned against Yahuah (LORD). And Nathan said unto David, Yahuah (LORD) also hath put away thy sin; thou shalt not die* (2 Samuel 12:13). David was forgiven in full, his sin put away, his life spared. Yet to his own banished son he grants only half: *let him not see my face* (2 Samuel 14:24). The man who received whole pardon from Yahuah deals out a measured, faceless reconciliation — the human restoring by halves against the divine restoring entire.'),
    ('canon','2-samuel',14,33,'canon','luke',15,20,'free',
      E'*But when he was yet a great way off, his father saw him, and had compassion, and ran, and fell on his neck, and kissed him* (Luke 15:20). David''s reconciliation comes two years late and cold: *the king kissed Absalom* (2 Samuel 14:33) only after refusing his face. The father of the parable runs while the son is yet far off and kisses him at once. The contrast is the whole point — Yahuah''s full embrace of the banished against the king''s grudging, delayed kiss that left the breach to fester into rebellion.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s341_2sa14_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s341_2sa14_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== C. threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-samuel-14-he-devise-means-that-his-banished-be-not-expelled-from-him', E'He devise means, that his banished be not expelled from him', E'The wise woman of Tekoah, sent by Joab to move the king toward his exiled son, rises to a word far larger than Absalom: *For we must needs die, and are as water spilt on the ground, which cannot be gathered up again; neither doth Elohim (God) respect any person: yet doth he devise means, that his banished be not expelled from him* (2 Samuel 14:14). Man cannot ungather spilt water or undo his own banishment; but Yahuah DEVISES MEANS that the outcast be not finally cast out. This is the heart of restoration — and the framing matters: it is Yahuah''s JUST means, never cheap inclusion.\n\nMicah marvels at the same Elohim: *Who is a Elohim (God) like unto thee, that pardoneth iniquity... he retaineth not his anger for ever, because he delighteth in mercy* (Micah 7:18) — and the means is just, for *thou wilt cast all their sins into the depths of the sea* (Micah 7:19). The sin is drowned; the sinner is kept. Isaiah names whose arm devises it: *he saw that there was no man, and wondered that there was no intercessor: therefore his arm brought salvation unto him; and his righteousness, it sustained him* (Isaiah 59:16). The Psalm measures the distance the means must carry the transgression: *As far as the east is from the west, so far hath he removed our transgressions from us* (Psalm 103:12), for *like as a father pitieth his children, so Yahuah (LORD) pitieth them that fear him* (Psalm 103:13).\n\nThen the Formed Son embodies the means. He seeks the banished *until he find it* (Luke 15:4); the Father *saw him, and had compassion, and ran, and fell on his neck, and kissed him* (Luke 15:20), and the verdict is *was lost, and is found* (Luke 15:24). And the keystone is answered as covenant promise: *him that cometh to me I will in no wise cast out* (John 6:37). The water spilt cannot gather itself — but Yahuah devises the means, and the banished one who comes is never expelled again. This is the gathering of the outcast, the regathering of the scattered house, accomplished by His own just arm.',
       sv.verse_id, ev.verse_id, 'free', 37575
  FROM _s341_2sa14_lookup sv, _s341_2sa14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=14 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='2-samuel' AND ev.chapter_number=14 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-samuel-14-the-wise-woman-of-tekoah-and-the-avenger-of-blood-stayed', E'The wise woman of Tekoah, and the avenger of blood stayed', E'Joab fetches a wise woman of Tekoah and *put the words in her mouth* (2 Samuel 14:3) — the very method Yahuah used with Nathan: *And Yahuah (LORD) sent Nathan unto David... There were two men in one city; the one rich, and the other poor* (2 Samuel 12:1). A parable catches the king before he knows he is the man. The widow''s tale of *two sons* who *strove together in the field... but the one smote the other, and slew him* (2 Samuel 14:6) mirrors Nathan''s single precious *ewe lamb... as a daughter* (2 Samuel 12:3): pathos first, mirror after.\n\nHer suit runs straight through the Torah. The family demanding *Deliver him that smote his brother, that we may kill him, for the life of his brother whom he slew* (2 Samuel 14:7) is the avenger of blood of Numbers 35: *The revenger of blood himself shall slay the murderer* (Numbers 35:19). But Torah is no bare vengeance — it builds in refuge and judgment: *cities for refuge from the avenger; that the manslayer die not, until he stand before the congregation in judgment* (Numbers 35:12), and *the congregation shall deliver the slayer out of the hand of the revenger of blood* (Numbers 35:25). When David swears *there shall not one hair of thy son fall to the earth* (2 Samuel 14:11), he does for the parable-son exactly what Torah commands the congregation to do for the manslayer — stay the blood, grant the refuge. The wise woman wins her case on the ground of Yahuah''s own instruction, and from this the larger plea is sprung: bring home the banished.',
       sv.verse_id, ev.verse_id, 'free', 37578
  FROM _s341_2sa14_lookup sv, _s341_2sa14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=14 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='2-samuel' AND ev.chapter_number=14 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-samuel-14-brought-again-but-not-received-the-half-hearted-reconciliation', E'Brought again, but not received — the half-hearted reconciliation', E'The king relents and Absalom is brought back — *So Joab arose and went to Geshur, and brought Absalom to Jerusalem* (2 Samuel 14:23) — but the homecoming is a homecoming by halves: *Let him turn to his own house, and let him not see my face* (2 Samuel 14:24). Two full years the son dwells in the city and *saw not the king''s face* (2 Samuel 14:28). When the audience finally comes, the kiss is cold and late: *the king kissed Absalom* (2 Samuel 14:33). The breach is patched, not healed — and out of that unhealed wound the rebellion of the next chapters grows.\n\nThe contrast is deliberate and damning. David himself had received whole pardon: *Yahuah (LORD) also hath put away thy sin; thou shalt not die* (2 Samuel 12:13) — full, free, his life spared. Yet the man forgiven entire forgives his own banished son by halves. And the true Father, when His outcast returns, runs: *when he was yet a great way off, his father saw him, and had compassion, and ran, and fell on his neck, and kissed him* (Luke 15:20). No two-year wait, no withheld face — the Father meets the banished while he is still far off. The human reconciliation, measured and grudging, throws into relief the full restoring of Yahuah, who devises means that His banished be not expelled at all.',
       sv.verse_id, ev.verse_id, 'free', 37581
  FROM _s341_2sa14_lookup sv, _s341_2sa14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=14 AND sv.verse_number=24
   AND ev.edition_slug='canon' AND ev.book_slug='2-samuel' AND ev.chapter_number=14 AND ev.verse_number=33
ON CONFLICT (slug) DO NOTHING;

-- ===== D. thread_members =====
-- THREAD 1: he devise means, that his banished be not expelled from him
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Who is a Elohim (God) like unto thee, that pardoneth iniquity... because he delighteth in mercy* (Micah 7:18) — the Elohim who devises means is the One who delights in mercy.'
  FROM cross_reference_threads t
  JOIN _s341_2sa14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=14 AND sv.verse_number=14
  JOIN _s341_2sa14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=7 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-14-he-devise-means-that-his-banished-be-not-expelled-from-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*thou wilt cast all their sins into the depths of the sea* (Micah 7:19) — the means is just: the sin drowned, the sinner kept.'
  FROM cross_reference_threads t
  JOIN _s341_2sa14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=14 AND sv.verse_number=14
  JOIN _s341_2sa14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=7 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-14-he-devise-means-that-his-banished-be-not-expelled-from-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*therefore his arm brought salvation unto him; and his righteousness, it sustained him* (Isaiah 59:16) — when no man could devise it, His own arm did, by His own righteousness.'
  FROM cross_reference_threads t
  JOIN _s341_2sa14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=14 AND sv.verse_number=14
  JOIN _s341_2sa14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=59 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-14-he-devise-means-that-his-banished-be-not-expelled-from-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*As far as the east is from the west, so far hath he removed our transgressions from us* (Psalm 103:12) — the means carries the transgression an infinite distance, and gathers the outcast.'
  FROM cross_reference_threads t
  JOIN _s341_2sa14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=14 AND sv.verse_number=14
  JOIN _s341_2sa14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=103 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-14-he-devise-means-that-his-banished-be-not-expelled-from-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Like as a father pitieth his children, so Yahuah (LORD) pitieth them that fear him* (Psalm 103:13) — the true Father''s pity moves the means the human father only half-managed.'
  FROM cross_reference_threads t
  JOIN _s341_2sa14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=14 AND sv.verse_number=14
  JOIN _s341_2sa14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=103 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-14-he-devise-means-that-his-banished-be-not-expelled-from-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*go after that which is lost, until he find it* (Luke 15:4) — the means Yahuah devises is a seeking that does not quit until the banished is found.'
  FROM cross_reference_threads t
  JOIN _s341_2sa14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=14 AND sv.verse_number=14
  JOIN _s341_2sa14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=15 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-14-he-devise-means-that-his-banished-be-not-expelled-from-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*his father saw him, and had compassion, and ran, and fell on his neck, and kissed him* (Luke 15:20) — the means embodied: the Father runs while the banished is yet a great way off.'
  FROM cross_reference_threads t
  JOIN _s341_2sa14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=14 AND sv.verse_number=14
  JOIN _s341_2sa14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=15 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-14-he-devise-means-that-his-banished-be-not-expelled-from-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*he was lost, and is found* (Luke 15:24) — the banished counted as dead is restored to the house and to life.'
  FROM cross_reference_threads t
  JOIN _s341_2sa14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=14 AND sv.verse_number=14
  JOIN _s341_2sa14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=15 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-14-he-devise-means-that-his-banished-be-not-expelled-from-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'*him that cometh to me I will in no wise cast out* (John 6:37) — the keystone answered as covenant promise: the banished who comes is never expelled again.'
  FROM cross_reference_threads t
  JOIN _s341_2sa14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=14 AND sv.verse_number=14
  JOIN _s341_2sa14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=6 AND tv.verse_number=37
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-14-he-devise-means-that-his-banished-be-not-expelled-from-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2: the wise woman of Tekoah and the avenger of blood stayed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*And Yahuah (LORD) sent Nathan unto David... There were two men in one city; the one rich, and the other poor* (2 Samuel 12:1) — the parable-device a second time: a story that judges the king before he knows it.'
  FROM cross_reference_threads t
  JOIN _s341_2sa14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=14 AND sv.verse_number=3
  JOIN _s341_2sa14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=12 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-14-the-wise-woman-of-tekoah-and-the-avenger-of-blood-stayed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*the poor man had nothing, save one little ewe lamb... and was unto him as a daughter* (2 Samuel 12:3) — the single precious thing about to be taken; the same hook as the widow''s two sons.'
  FROM cross_reference_threads t
  JOIN _s341_2sa14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=14 AND sv.verse_number=6
  JOIN _s341_2sa14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=12 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-14-the-wise-woman-of-tekoah-and-the-avenger-of-blood-stayed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*The revenger of blood himself shall slay the murderer: when he meeteth him, he shall slay him* (Numbers 35:19) — the family''s demand is the Torah avenger of blood claiming the slayer.'
  FROM cross_reference_threads t
  JOIN _s341_2sa14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=14 AND sv.verse_number=7
  JOIN _s341_2sa14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=35 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-14-the-wise-woman-of-tekoah-and-the-avenger-of-blood-stayed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*cities for refuge from the avenger; that the manslayer die not, until he stand before the congregation in judgment* (Numbers 35:12) — Torah builds refuge and judgment in; not every slayer is a murderer.'
  FROM cross_reference_threads t
  JOIN _s341_2sa14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=14 AND sv.verse_number=7
  JOIN _s341_2sa14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=35 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-14-the-wise-woman-of-tekoah-and-the-avenger-of-blood-stayed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*the congregation shall deliver the slayer out of the hand of the revenger of blood... and restore him to the city of his refuge* (Numbers 35:25) — David''s oath that not a hair fall does for the parable-son what Torah commands the congregation to do.'
  FROM cross_reference_threads t
  JOIN _s341_2sa14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=14 AND sv.verse_number=11
  JOIN _s341_2sa14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=35 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-14-the-wise-woman-of-tekoah-and-the-avenger-of-blood-stayed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3: brought again but not received — the half-hearted reconciliation
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Yahuah (LORD) also hath put away thy sin; thou shalt not die* (2 Samuel 12:13) — David, forgiven in full, deals out to his son a measured, faceless reconciliation.'
  FROM cross_reference_threads t
  JOIN _s341_2sa14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=14 AND sv.verse_number=24
  JOIN _s341_2sa14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=12 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-14-brought-again-but-not-received-the-half-hearted-reconciliation'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*when he was yet a great way off, his father saw him... and ran, and fell on his neck, and kissed him* (Luke 15:20) — the Father''s instant full embrace against David''s two-years-late, withheld-face kiss.'
  FROM cross_reference_threads t
  JOIN _s341_2sa14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=14 AND sv.verse_number=33
  JOIN _s341_2sa14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=15 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-14-brought-again-but-not-received-the-half-hearted-reconciliation'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2-samuel_15.sql (2 Samuel 15) -----
-- 2 Samuel 15 — Absalom steals the hearts; the rejected anointed king flees Jerusalem,
--   crosses the brook Kidron, goes up the ascent of Olivet weeping, head covered, barefoot;
--   sends the ark BACK with Zadok in submission to Yahuah's will; the familiar friend
--   Ahithophel turns conspirator and David prays his counsel be turned to foolishness.
-- Tag: 2sa15   View: _s341_2sa15_lookup   Sort band: 37600, step 3 (37600, 37603, 37606, 37609)
--
-- THREADS (4):
--   2-samuel-15-absalom-stole-the-hearts-the-flatterer-and-the-kiss   [canon: Luke, Matthew]
--   2-samuel-15-the-rejected-king-crossing-kidron-weeping-on-olivet   [canon: John, Luke, Matthew]
--   2-samuel-15-the-familiar-friend-who-lifted-up-his-heel            [canon: Psalms, John]
--   2-samuel-15-carry-back-the-ark-let-him-do-as-seemeth-good         [canon: Luke, Matthew]
--
-- COVERAGE CHECKLIST:
--   v.1-6 (Absalom steals hearts, kiss/obeisance, usurper):
--        NT:     Luke 22:47-48, Matthew 26:48-49 (the betraying kiss of the false king) — USED
--        Extras: none warranted
--        Tanakh: kept within thread (the flatterer who stole the kingdom by the mouth) — none separate warranted
--   v.7-12 (conspiracy at Hebron; Ahithophel summoned, David's counsellor turns):
--        NT:     John 13:18 (he that eateth bread... lifted up his heel) — USED in heel thread
--        Extras: none warranted
--        Tanakh: Psalm 41:9, Psalm 55:12-14 (familiar friend / equal who betrayed) — USED
--   v.13-22 (David flees, the people, Ittai's loyalty):
--        NT:     subsumed in Kidron/Olivet flight thread (the weeping exodus of the rejected king)
--        Extras: none warranted
--        Tanakh: none separate warranted (Ittai the loyal stranger — none warranted as own thread)
--   v.23,30 (crossing Kidron, ascent of Olivet weeping, head covered, barefoot):
--        NT:     John 18:1, Luke 22:39 / 22:41-44, Matthew 26:36 (Son of David over the same Kidron to Olivet/Gethsemane, weeping) — USED
--        Extras: none warranted
--        Tanakh: Psalm 3:1-3 (superscription when he fled from Absalom — the shield, lifter of the head) — USED
--   v.24-29 (Zadok, the ark sent back, find favour in the eyes of Yahuah):
--        NT:     Luke 22:42, Matthew 26:39 (not my will but thine — submission over clutching the symbol) — USED
--        Extras: none warranted
--        Tanakh: kept within thread
--   v.31-37 (turn Ahithophel's counsel into foolishness; Hushai sent back):
--        NT:     John 13:18 (heel) carried in heel thread; Ahithophel's end (17:23 hanged) lies beyond this ch — none warranted here
--        Extras: none warranted
--        Tanakh: Psalm 55:12-14 carried in heel thread
--
-- No verse-block silently skipped; every meaningful unit weighed across all three libraries.

CREATE TEMP VIEW _s341_2sa15_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================ B. cross_references ============================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: Absalom stole the hearts — the flatterer and the kiss
    ('canon','2-samuel',15,5,'canon','luke',22,47,'free',
      E'*And while he yet spake, behold a multitude, and he that was called Judas, one of the twelve, went before them, and drew near unto Yahusha (Jesus) to kiss him* (Luke 22:47). Absalom''s craft was the same instrument: *when any man came nigh to him to do him obeisance, he put forth his hand, and took him, and kissed him* (2 Samuel 15:5). The kiss that should seal loyalty is turned into the tool of the usurper who steals a kingdom that is not his — Absalom against the anointed father, Judas against the anointed Son of David.'),
    ('canon','2-samuel',15,5,'canon','matthew',26,49,'free',
      E'*And forthwith he came to Yahusha (Jesus), and said, Hail, master; and kissed him* (Matthew 26:49) — the sign agreed beforehand, *Whomsoever I shall kiss, that same is he: hold him fast* (Matthew 26:48). David''s son Absalom *kissed* the men of Yashar''el (Israel) to steal their hearts (2 Samuel 15:5); the betrayer kisses the true King to deliver him up. The false affection that captures the throne in Hebron is fulfilled in the false affection that betrays it in Gethsemane.'),
    ('canon','2-samuel',15,6,'canon','matthew',26,48,'free',
      E'*Now he that betrayed him gave them a sign, saying, Whomsoever I shall kiss, that same is he: hold him fast* (Matthew 26:48). *So Absalom stole the hearts of the men of Yashar''el (Israel)* (2 Samuel 15:6) — the conspirator works by stolen affection and a contrived sign, the same pattern by which the King would be handed over to those that *hold him fast*.'),

    -- Thread 2: The rejected king crossing Kidron, weeping on Olivet
    ('canon','2-samuel',15,23,'canon','john',18,1,'free',
      E'*When Yahusha (Jesus) had spoken these words, he went forth with his disciples over the brook Cedron, where was a garden, into the which he entered, and his disciples* (John 18:1). The rejected king first crossed it: *the king also himself passed over the brook Kidron... toward the way of the wilderness* (2 Samuel 15:23). The Son of David, driven out by His own, crosses the very same brook Kidron on the night He is betrayed — the type of the suffering anointed walks the same ground.'),
    ('canon','2-samuel',15,30,'canon','luke',22,39,'free',
      E'*And he came out, and went, as he was wont, to the mount of Olives; and his disciples also followed him* (Luke 22:39). David went the same road in his grief: *And David went up by the ascent of mount Olivet, and wept as he went up, and had his head covered, and he went barefoot* (2 Samuel 15:30). Both anointed kings go up Olivet under rejection; the people that followed David *went up, weeping as they went up*, as the disciples follow the greater Son of David to the same mount.'),
    ('canon','2-samuel',15,30,'canon','luke',22,44,'free',
      E'*And being in an agony he prayed more earnestly: and his sweat was as it were great drops of blood falling down to the ground* (Luke 22:44). David''s weeping ascent — *wept as he went up, and had his head covered, and he went barefoot* (2 Samuel 15:30) — foreshadows the deeper agony of the Son of David on that same Olivet, the rejected anointed pouring out grief where David poured out tears.'),
    ('canon','2-samuel',15,30,'canon','matthew',26,36,'free',
      E'*Then cometh Yahusha (Jesus) with them unto a place called Gethsemane, and saith unto the disciples, Sit ye here, while I go and pray yonder* (Matthew 26:36) — Gethsemane on the mount of Olives, reached after crossing the Kidron. David, *weeping as he went up* the ascent of Olivet (2 Samuel 15:30), prefigures the King who comes to that garden to weep and pray.'),
    ('canon','2-samuel',15,23,'canon','psalms',3,3,'free',
      E'Psalm 3 carries the superscription *A Psalm of David, when he fled from Absalom his son* — its cry answers David''s crossing of Kidron *toward the way of the wilderness* (2 Samuel 15:23): *But thou, O Yahuah (LORD), art a shield for me; my glory, and the lifter up of mine head* (Psalm 3:3). The fleeing king whose *head covered* in grief on Olivet trusts Yahuah to be the lifter up of that bowed head.'),

    -- Thread 3: The familiar friend who lifted up his heel (Ahithophel -> Judas)
    ('canon','2-samuel',15,12,'canon','psalms',41,9,'free',
      E'*Yea, mine own familiar friend, in whom I trusted, which did eat of my bread, hath lifted up his heel against me* (Psalm 41:9). Ahithophel was that friend: *And Absalom sent for Ahithophel the Gilonite, David''s counsellor, from his city, even from Giloh... And the conspiracy was strong* (2 Samuel 15:12). The king''s most trusted counsellor turns to the conspiracy — the wound is not from an enemy but from the bread-companion.'),
    ('canon','2-samuel',15,31,'canon','psalms',55,12,'free',
      E'*For it was not an enemy that reproached me; then I could have borne it... But it was thou, a man mine equal, my guide, and mine acquaintance* (Psalm 55:12-13). When David hears *Ahithophel is among the conspirators with Absalom* (2 Samuel 15:31), it is the betrayal of the trusted equal that cuts — *We took sweet counsel together, and walked unto the house of Elohim (God) in company* (Psalm 55:14).'),
    ('canon','2-samuel',15,31,'canon','psalms',55,14,'free',
      E'*We took sweet counsel together, and walked unto the house of Elohim (God) in company* (Psalm 55:14). This is Ahithophel exactly — the counsellor whose word *was as if a man had enquired at the oracle of Elohim (God)* — now turned, so that David must pray *O Yahuah (LORD), I pray thee, turn the counsel of Ahithophel into foolishness* (2 Samuel 15:31).'),
    ('canon','2-samuel',15,31,'canon','john',13,18,'free',
      E'*I speak not of you all: I know whom I have chosen: but that the scripture may be fulfilled, He that eateth bread with me hath lifted up his heel against me* (John 13:18). The Son of David quotes the very psalm written over Ahithophel''s treason. As David grieved that *Ahithophel is among the conspirators* (2 Samuel 15:31), so the greater King names the table-companion who would betray Him — Ahithophel''s pattern fulfilled in Judas.'),

    -- Thread 4: Carry back the ark — let him do as seemeth good unto him
    ('canon','2-samuel',15,26,'canon','luke',22,42,'free',
      E'*Saying, Father, if thou be willing, remove this cup from me: nevertheless not my will, but thine, be done* (Luke 22:42). David at his fleeing surrenders the same way: *But if he thus say, I have no delight in thee; behold, here am I, let him do to me as seemeth good unto him* (2 Samuel 15:26). The anointed king will not clutch the ark as a charm to save himself but yields wholly to Yahuah''s will — the posture perfected by the Son of David in the garden.'),
    ('canon','2-samuel',15,26,'canon','matthew',26,39,'free',
      E'*And he went a little further, and fell on his face, and prayed, saying, O my Father, if it be possible, let this cup pass from me: nevertheless not as I will, but as thou wilt* (Matthew 26:39). David''s words in flight are the seed of this prayer: *here am I, let him do to me as seemeth good unto him* (2 Samuel 15:26). Not my will but thine — the rejected king refuses to seize his own deliverance and rests it on the Father.'),
    ('canon','2-samuel',15,25,'canon','luke',22,42,'free',
      E'*If I shall find favour in the eyes of Yahuah (LORD), he will bring me again, and shew me both it, and his habitation* (2 Samuel 15:25). David sends the ark of Elohim (God) back into the city rather than carry the symbol as a guarantee — trusting Yahuah to restore him if He wills. The Son of David prays the same trust: *not my will, but thine, be done* (Luke 22:42).')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s341_2sa15_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s341_2sa15_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================ C. threads ============================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-samuel-15-absalom-stole-the-hearts-the-flatterer-and-the-kiss',
       E'Absalom stole the hearts — the flatterer and the kiss',
       E'Absalom usurps not by valour but by stolen affection. He rises early at the gate, tells every man his cause is *good and right* with no one to hear him, and then *when any man came nigh to him to do him obeisance, he put forth his hand, and took him, and kissed him* (2 Samuel 15:5). The verdict is plain: *So Absalom stole the hearts of the men of Yashar''el (Israel)* (2 Samuel 15:6). The kiss — the sign of loyalty and love — becomes the instrument of the usurper against the anointed king.\n\nThat pattern is fulfilled against the true Son of David. The betrayer agrees a sign of affection: *Whomsoever I shall kiss, that same is he: hold him fast* (Matthew 26:48), *And forthwith he came to Yahusha (Jesus), and said, Hail, master; and kissed him* (Matthew 26:49). Luke shows the same drawn near to *kiss him* (Luke 22:47). The false king and the false friend both seize a throne that is not theirs through a counterfeit of love — Absalom against David, Judas against David''s greater Son.',
       sv.verse_id, ev.verse_id, 'free', 37600
  FROM _s341_2sa15_lookup sv, _s341_2sa15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=15 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='2-samuel' AND ev.chapter_number=15 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-samuel-15-the-rejected-king-crossing-kidron-weeping-on-olivet',
       E'The rejected king crossing Kidron, weeping on Olivet',
       E'The anointed king is driven from his own city by his own son. *And all the country wept with a loud voice, and all the people passed over: the king also himself passed over the brook Kidron, and all the people passed over, toward the way of the wilderness* (2 Samuel 15:23). Then *David went up by the ascent of mount Olivet, and wept as he went up, and had his head covered, and he went barefoot: and all the people that was with him covered every man his head, and they went up, weeping as they went up* (2 Samuel 15:30). A barefoot, bowed-headed, weeping king crosses Kidron and climbs Olivet under rejection. Psalm 3, headed *when he fled from Absalom*, answers: *But thou, O Yahuah (LORD), art a shield for me; my glory, and the lifter up of mine head* (Psalm 3:3).\n\nThe greater Son of David walks the same ground on the night He is handed over. *He went forth with his disciples over the brook Cedron, where was a garden* (John 18:1); He goes *as he was wont, to the mount of Olives* (Luke 22:39), to *a place called Gethsemane* (Matthew 26:36), and there *being in an agony he prayed more earnestly: and his sweat was as it were great drops of blood falling down to the ground* (Luke 22:44). The suffering anointed, rejected by His own, crosses David''s Kidron and weeps on David''s Olivet — the type fulfilled to the very stones of the road.',
       sv.verse_id, ev.verse_id, 'free', 37603
  FROM _s341_2sa15_lookup sv, _s341_2sa15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=15 AND sv.verse_number=23
   AND ev.edition_slug='canon' AND ev.book_slug='2-samuel' AND ev.chapter_number=15 AND ev.verse_number=30
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-samuel-15-the-familiar-friend-who-lifted-up-his-heel',
       E'The familiar friend who lifted up his heel',
       E'The sharpest grief in David''s flight is not Absalom''s army but Ahithophel''s defection. *And Absalom sent for Ahithophel the Gilonite, David''s counsellor, from his city, even from Giloh... And the conspiracy was strong* (2 Samuel 15:12) — a man whose counsel *was as if a man had enquired at the oracle of Elohim (God)* (2 Samuel 16:23). When the word reaches him, David prays, *O Yahuah (LORD), I pray thee, turn the counsel of Ahithophel into foolishness* (2 Samuel 15:31). David''s own psalms put words to the wound: *Yea, mine own familiar friend, in whom I trusted, which did eat of my bread, hath lifted up his heel against me* (Psalm 41:9); *For it was not an enemy that reproached me... But it was thou, a man mine equal, my guide, and mine acquaintance. We took sweet counsel together, and walked unto the house of Elohim (God) in company* (Psalm 55:12-14).\n\nThe Son of David takes that very psalm onto His own lips at the table: *He that eateth bread with me hath lifted up his heel against me* (John 13:18). Ahithophel the trusted counsellor who ate David''s bread and turned is the shadow whose fulfilment is Judas, the one of the twelve who dipped in the dish and went out to betray. The trusted equal becomes the betrayer — in David, and in great David''s greater Son.',
       sv.verse_id, ev.verse_id, 'free', 37606
  FROM _s341_2sa15_lookup sv, _s341_2sa15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=15 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='2-samuel' AND ev.chapter_number=15 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-samuel-15-carry-back-the-ark-let-him-do-as-seemeth-good',
       E'Carry back the ark — let him do to me as seemeth good',
       E'In flight David refuses to wield the ark of Elohim (God) as a charm to compel his own rescue. He commands Zadok, *Carry back the ark of Elohim (God) into the city: if I shall find favour in the eyes of Yahuah (LORD), he will bring me again, and shew me both it, and his habitation* (2 Samuel 15:25). And then the full surrender: *But if he thus say, I have no delight in thee; behold, here am I, let him do to me as seemeth good unto him* (2 Samuel 15:26). The anointed king will not clutch the symbol; he yields his throne, his city, and his life to Yahuah''s will.\n\nThis is the very posture perfected by the Son of David in the garden across that same Kidron: *Father, if thou be willing, remove this cup from me: nevertheless not my will, but thine, be done* (Luke 22:42); *O my Father, if it be possible, let this cup pass from me: nevertheless not as I will, but as thou wilt* (Matthew 26:39). *Here am I, let him do to me as seemeth good unto him* — the rejected king does not seize his own deliverance but rests it wholly on the Father, and so foreshadows the obedience that bought it.',
       sv.verse_id, ev.verse_id, 'free', 37609
  FROM _s341_2sa15_lookup sv, _s341_2sa15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=15 AND sv.verse_number=25
   AND ev.edition_slug='canon' AND ev.book_slug='2-samuel' AND ev.chapter_number=15 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

-- ============================ D. thread_members ============================
-- Thread 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*he put forth his hand, and took him, and kissed him* (2 Samuel 15:5) — the usurper''s kiss answered by Judas drawing near to *kiss him* (Luke 22:47).'
  FROM cross_reference_threads t
  JOIN _s341_2sa15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=15 AND sv.verse_number=5
  JOIN _s341_2sa15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=22 AND tv.verse_number=47
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-15-absalom-stole-the-hearts-the-flatterer-and-the-kiss'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Hail, master; and kissed him* (Matthew 26:49) — the betrayer''s contrived sign of affection, the kiss turned into the tool that seizes the King.'
  FROM cross_reference_threads t
  JOIN _s341_2sa15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=15 AND sv.verse_number=5
  JOIN _s341_2sa15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=26 AND tv.verse_number=49
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-15-absalom-stole-the-hearts-the-flatterer-and-the-kiss'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Whomsoever I shall kiss, that same is he: hold him fast* (Matthew 26:48) — the stolen-affection pattern of him who *stole the hearts of the men of Yashar''el (Israel)* (2 Samuel 15:6).'
  FROM cross_reference_threads t
  JOIN _s341_2sa15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=15 AND sv.verse_number=6
  JOIN _s341_2sa15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=26 AND tv.verse_number=48
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-15-absalom-stole-the-hearts-the-flatterer-and-the-kiss'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*went forth with his disciples over the brook Cedron* (John 18:1) — the Son of David crosses the same brook Kidron David *passed over* fleeing (2 Samuel 15:23).'
  FROM cross_reference_threads t
  JOIN _s341_2sa15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=15 AND sv.verse_number=23
  JOIN _s341_2sa15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=18 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-15-the-rejected-king-crossing-kidron-weeping-on-olivet'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*as he was wont, to the mount of Olives* (Luke 22:39) — both anointed kings go up Olivet, David *weeping as he went up* (2 Samuel 15:30).'
  FROM cross_reference_threads t
  JOIN _s341_2sa15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=15 AND sv.verse_number=30
  JOIN _s341_2sa15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=22 AND tv.verse_number=39
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-15-the-rejected-king-crossing-kidron-weeping-on-olivet'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*his sweat was as it were great drops of blood* (Luke 22:44) — the deeper agony on the same Olivet where David *wept as he went up* (2 Samuel 15:30).'
  FROM cross_reference_threads t
  JOIN _s341_2sa15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=15 AND sv.verse_number=30
  JOIN _s341_2sa15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=22 AND tv.verse_number=44
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-15-the-rejected-king-crossing-kidron-weeping-on-olivet'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*a place called Gethsemane* (Matthew 26:36) — the garden on Olivet reached across Kidron, where David''s weeping ascent (2 Samuel 15:30) is fulfilled.'
  FROM cross_reference_threads t
  JOIN _s341_2sa15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=15 AND sv.verse_number=30
  JOIN _s341_2sa15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=26 AND tv.verse_number=36
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-15-the-rejected-king-crossing-kidron-weeping-on-olivet'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*the lifter up of mine head* (Psalm 3:3) — Psalm headed *when he fled from Absalom*, answering the king whose *head covered* in grief crossed Kidron (2 Samuel 15:23,30).'
  FROM cross_reference_threads t
  JOIN _s341_2sa15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=15 AND sv.verse_number=23
  JOIN _s341_2sa15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=3 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-15-the-rejected-king-crossing-kidron-weeping-on-olivet'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*mine own familiar friend... which did eat of my bread, hath lifted up his heel against me* (Psalm 41:9) — the counsellor Ahithophel summoned to the conspiracy (2 Samuel 15:12).'
  FROM cross_reference_threads t
  JOIN _s341_2sa15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=15 AND sv.verse_number=12
  JOIN _s341_2sa15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=41 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-15-the-familiar-friend-who-lifted-up-his-heel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*it was thou, a man mine equal, my guide, and mine acquaintance* (Psalm 55:12-13) — the trusted counsellor''s betrayal that drives David to pray (2 Samuel 15:31).'
  FROM cross_reference_threads t
  JOIN _s341_2sa15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=15 AND sv.verse_number=31
  JOIN _s341_2sa15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=55 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-15-the-familiar-friend-who-lifted-up-his-heel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*We took sweet counsel together, and walked unto the house of Elohim (God) in company* (Psalm 55:14) — Ahithophel exactly, whose counsel David must ask Yahuah to *turn... into foolishness* (2 Samuel 15:31).'
  FROM cross_reference_threads t
  JOIN _s341_2sa15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=15 AND sv.verse_number=31
  JOIN _s341_2sa15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=55 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-15-the-familiar-friend-who-lifted-up-his-heel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*He that eateth bread with me hath lifted up his heel against me* (John 13:18) — the Son of David quotes the psalm of Ahithophel''s treason over Judas, fulfilling the pattern of 2 Samuel 15:31.'
  FROM cross_reference_threads t
  JOIN _s341_2sa15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=15 AND sv.verse_number=31
  JOIN _s341_2sa15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=13 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-15-the-familiar-friend-who-lifted-up-his-heel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Carry back the ark of Elohim (God) into the city: if I shall find favour in the eyes of Yahuah (LORD)* (2 Samuel 15:25) — David will not clutch the symbol but rests on Yahuah''s will, the seed of *not my will, but thine, be done* (Luke 22:42).'
  FROM cross_reference_threads t
  JOIN _s341_2sa15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=15 AND sv.verse_number=25
  JOIN _s341_2sa15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=22 AND tv.verse_number=42
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-15-carry-back-the-ark-let-him-do-as-seemeth-good'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*not my will, but thine, be done* (Luke 22:42) — the Son of David''s surrender, perfecting David''s *let him do to me as seemeth good unto him* (2 Samuel 15:26).'
  FROM cross_reference_threads t
  JOIN _s341_2sa15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=15 AND sv.verse_number=26
  JOIN _s341_2sa15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=22 AND tv.verse_number=42
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-15-carry-back-the-ark-let-him-do-as-seemeth-good'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*nevertheless not as I will, but as thou wilt* (Matthew 26:39) — the garden prayer that fulfils *here am I, let him do to me as seemeth good unto him* (2 Samuel 15:26).'
  FROM cross_reference_threads t
  JOIN _s341_2sa15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-samuel' AND sv.chapter_number=15 AND sv.verse_number=26
  JOIN _s341_2sa15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=26 AND tv.verse_number=39
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-samuel-15-carry-back-the-ark-let-him-do-as-seemeth-good'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session341 — 2 Samuel cross-references complete.'
