-- =====================================================================
-- Session 260 — John (depth) FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py /tmp/nt-depth-wt/data-schema/migrations/session260_john_depth_cross_references.sql
-- =====================================================================

\echo 'session260 — John (depth) cross-references starting...'
BEGIN;

-- ----- fragment: minion_john_05.sql -----
-- John 5 — NT DEPTH pass — Come-and-See full-library cross-references (THIN-ADD)
-- DEDUP: did NOT touch 5:22 or 5:25 (existing threads). 4 NEW threads on 5:1-18, 5:19-29, 5:30-38, 5:39-47.

CREATE TEMP VIEW _jn05_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1',
   'pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- =====================================================================
-- 3b. cross_references rows (one VALUES tuple per member)
-- =====================================================================
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- THREAD 1: 5:1-18 Bethesda / the sabbath rightly kept / my Father worketh
  ('canon','john',5,17,'canon','genesis',2,2, 'free', E'*And on the seventh day Elohim (God) ended his work which he had made; and he rested on the seventh day from all his work which he had made.* (Genesis 2:2). The Father''s rest at creation was never an idle nothing — it is the rest of the finished, sustaining work. So when Yahusha says *My Father worketh hitherto, and I work* (John 5:17), he is not breaking the seventh day; he is doing on it exactly what the Father has never ceased to do — uphold and give life.'),
  ('canon','john',5,17,'canon','psalms',121,4, 'free', E'*Behold, he that keepeth Yashar''el (Israel) shall neither slumber nor sleep.* (Psalm 121:4). The Keeper of Yashar''el does not clock out on the sabbath. His sustaining hand holds the world up through the seventh day — and the Formed Son, doing the Father''s work, lifts a man off his bed of thirty-eight years on that very day.'),
  ('canon','john',5,16,'canon','isaiah',58,13, 'free', E'*If thou turn away thy foot from the sabbath, from doing thy pleasure on my holy day; and call the sabbath a delight, the holy of Yahuah (LORD), honourable...* (Isaiah 58:13). The sabbath is a *delight* — and what is more a delight than a man made whole? The accusers count the carried bed a breaking of the day; the Father counts mercy and life the very honour of it.'),
  ('canon','john',5,8,'canon','ezekiel',34,4, 'free', E'*The diseased have ye not strengthened, neither have ye healed that which was sick... neither have ye sought that which was lost...* (Ezekiel 34:4). The hireling shepherds left the impotent man lying for thirty-eight years. The True Shepherd finds the one *that which was driven away* and says *Rise, take up thy bed, and walk* (John 5:8) — the healing the false shepherds withheld.'),
  ('canon','john',5,17,'jubilees','jubilees',2,18, 'extras', E'*And all the angels of the presence, and all the angels of sanctification... He has hidden us to keep the Sabbath with Him in heaven and on earth.* (Jubilees 2:18). Heaven keeps the sabbath while the Father''s work of sustaining never stops — the day is kept above, not abandoned. The Son''s sabbath mercy below is heaven''s own pattern: rest that is full of life, not an empty cessation.'),
  -- THREAD 2: 5:19-29 the Son can do nothing of himself (FORMED-SON KEYSTONE)
  ('canon','john',5,19,'canon','deuteronomy',18,18, 'free', E'*I will raise them up a Prophet from among their brethren, like unto thee, and will put my words in his mouth; and he shall speak unto them all that I shall command him.* (Deuteronomy 18:18). The Prophet Moses foretold speaks only the words the Father puts in his mouth — which is exactly what the Son says of himself: *The Son can do nothing of himself, but what he seeth the Father do* (John 5:19). The sent one carries the Sender''s word, not his own.'),
  ('canon','john',5,27,'canon','daniel',7,13, 'free', E'*I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him.* (Daniel 7:13). The kaph stands — *one like the Son of Adam* — the Formed Son brought near to the Father to receive what the Father gives. John 5:27 names him by this very title: authority to judge is given *because he is the Son of Adam.*'),
  ('canon','john',5,27,'canon','daniel',7,14, 'free', E'*And there was given him dominion, and glory, and a kingdom... his dominion is an everlasting dominion, which shall not pass away.* (Daniel 7:14). Note the word *given* — the kingdom and the judgment are not the Son''s by independent right; they are handed to him by the Ancient of Days. So in John 5:26-27 the Father *hath given* the Son to have life in himself and authority to execute judgment. The Son receives; the Father gives.'),
  ('canon','john',5,22,'enoch','1-enoch',49,2, 'extras', E'*For he is mighty in all the secrets of righteousness... Because the Elect One standeth before Yahuah (God) of Spirits, And his glory is for ever and ever... And he shall judge the secret things, And none shall be able to utter a lying word before him.* (1 Enoch 49:2,4). The Elect One stands *before* the Lord of Spirits — never instead of him — and judges by the authority he has been given. This is John 5:22 in older ink: the Father *hath committed all judgment unto the Son.*'),
  ('canon','john',5,27,'enoch','1-enoch',62,6, 'extras', E'*And Yahuah (God) of Spirits seated the Elect One on the throne of His glory, And he shall judge all the secret things... For he is the Chosen One before Yahuah (God) of Spirits... And Yahuah (God) of Spirits said: This is the Son of Adam who is born unto righteousness... the righteousness of the Head of Days forsakes him not.* (1 Enoch 62:6-7). The Father seats the Son of Adam on the throne to judge — the Son enthroned BY the Head of Days, the same architecture as John 5:27: judgment given *because he is the Son of Adam.*'),
  -- THREAD 3: 5:30-38 I seek not mine own will / the witnesses
  ('canon','john',5,30,'canon','psalms',40,8, 'free', E'*I delight to do thy will, O my Elohim (God): yea, thy law is within my heart.* (Psalm 40:8). The Son''s whole posture is here: *I seek not mine own will, but the will of the Father which hath sent me* (John 5:30). The delight to do the Father''s will and the Torah written within are one and the same — the Son lives the song David sang.'),
  ('canon','john',5,31,'canon','deuteronomy',19,15, 'free', E'*One witness shall not rise up against a man for any iniquity... at the mouth of two witnesses, or at the mouth of three witnesses, shall the matter be established.* (Deuteronomy 19:15). The Son keeps the Torah''s own rule of evidence: *If I bear witness of myself, my witness is not true* (John 5:31). So he brings the others — John, the works the Father gave him, and the Father himself — the two and three witnesses Torah requires.'),
  ('canon','john',5,37,'canon','isaiah',42,1, 'free', E'*Behold my servant, whom I uphold; mine elect, in whom my soul delighteth; I have put my spirit upon him: he shall bring forth judgment...* (Isaiah 42:1). The Father''s own witness, foretold: *mine elect, in whom my soul delighteth.* When Yahusha says *the Father himself, which hath sent me, hath borne witness of me* (John 5:37), this is the witness — the Servant upheld, chosen, and Spirit-anointed by the One who sent him.'),
  -- THREAD 4: 5:39-47 search the scriptures, they testify of me / Moses wrote of me
  ('canon','john',5,46,'canon','deuteronomy',18,15, 'free', E'*Yahuah Elohayka (The LORD thy God) will raise up unto thee a Prophet from the midst of thee, of thy brethren, like unto me; unto him ye shall hearken.* (Deuteronomy 18:15). This is Moses writing of Messiah. *Had ye believed Moses, ye would have believed me: for he wrote of me* (John 5:46) — the Prophet Moses promised is the One standing before them. The Torah does not abolish; it points.'),
  ('canon','john',5,39,'canon','psalms',40,7, 'free', E'*Then said I, Lo, I come: in the volume of the book it is written of me.* (Psalm 40:7). *Search the scriptures... they are they which testify of me* (John 5:39). The whole volume of the book is written of him — the Son does not overturn the scriptures; he is their subject. Read them rightly and you find him on every page.'),
  ('canon','john',5,46,'canon','deuteronomy',30,14, 'free', E'*But the word is very nigh unto thee, in thy mouth, and in thy heart, that thou mayest do it.* (Deuteronomy 30:14). Moses said the word is not far off — it is near, to be done. They had the writings in their hands and would not come to the One the writings pointed to (John 5:40). The word was very nigh; they would not do it.'),
  ('canon','john',5,46,'canon','genesis',3,15, 'free', E'*And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* (Genesis 3:15). From the first pages Moses wrote of the seed of the woman who would crush the serpent. *He wrote of me* (John 5:46) reaches all the way back to Eden''s promise — the testimony of Messiah runs through the whole Torah.'),
  ('canon','john',5,39,'apocrypha','ecclesiasticus',24,23, 'extras', E'*All these things are the book of the covenant of the most high Yahuah (God), even the law which Moses commanded for an heritage to the congregations of Jacob.* (Sirach 24:23). The wisdom that was *created from the beginning before the world* (Sirach 24:9) is the very Torah Moses gave — the living testimony Yahusha points to: *Search the scriptures... they testify of me.* The Torah is the heritage, not the discarded thing.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _jn05_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _jn05_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- =====================================================================
-- 3c. threads
-- =====================================================================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'john-5-bethesda-the-sabbath-rightly-kept-my-father-worketh-hitherto-and-i-work',
       E'Bethesda — the sabbath rightly kept: my Father worketh hitherto, and I work (Genesis 2; Psalm 121; Isaiah 58)',
       E'A man had lain by the pool thirty-eight years, and Yahusha (Jesus) healed him on the sabbath: *Rise, take up thy bed, and walk* (John 5:8). The accusers cried that the day was broken; the Father calls it the day rightly kept.\n\n*And on the seventh day Elohim (God) ended his work which he had made; and he rested on the seventh day from all his work which he had made.* (Genesis 2:2). The Father''s rest is never idleness — it is the rest of the finished, sustaining work. *Behold, he that keepeth Yashar''el (Israel) shall neither slumber nor sleep.* (Psalm 121:4): the Keeper does not clock out on the seventh day. So *My Father worketh hitherto, and I work* (John 5:17) — the Formed Son does on the sabbath exactly what the Father has never ceased to do, uphold and give life.\n\n*If thou turn away thy foot from the sabbath... and call the sabbath a delight, the holy of Yahuah (LORD), honourable.* (Isaiah 58:13). What is more a delight than a man made whole? And the hireling shepherds had failed him: *The diseased have ye not strengthened, neither have ye healed that which was sick... neither have ye sought that which was lost* (Ezekiel 34:4). The True Shepherd seeks the one driven away. Even heaven keeps the day so: *all the angels of the presence... He has hidden us to keep the Sabbath with Him in heaven and on earth* (Jubilees 2:18) — rest full of life, not an empty cessation. The day stands; mercy is its heart.',
       sv.verse_id, ev.verse_id, 'extras', 15120
  FROM _jn05_lookup sv, _jn05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=5 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='john' AND ev.chapter_number=5 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'john-5-the-son-can-do-nothing-of-himself-but-what-he-seeth-the-father-do',
       E'The Son can do nothing of himself, but what he seeth the Father do (Deuteronomy 18; Daniel 7; 1 Enoch 49, 62)',
       E'Here is the heart of who the Son is. *The Son can do nothing of himself, but what he seeth the Father do: for what things soever he doeth, these also doeth the Son likewise* (John 5:19). Not an independent deity acting on his own; not a creature improvising. The Formed Son does only what he sees the Father do.\n\nMoses foretold him so: *I will raise them up a Prophet from among their brethren... and will put my words in his mouth; and he shall speak unto them all that I shall command him.* (Deuteronomy 18:18). The Prophet carries the Sender''s word, never his own. And the kingdom is *given*: *one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days* (Daniel 7:13) — the kaph preserved, the Formed Son brought near — *and there was given him dominion, and glory, and a kingdom... his dominion is an everlasting dominion* (Daniel 7:14). Given by the Father, received by the Son. So *the Father hath given to the Son to have life in himself, and hath given him authority to execute judgment also, because he is the Son of Adam* (John 5:26-27).\n\nThe older witnesses say the same. *Because the Elect One standeth before Yahuah (God) of Spirits... he shall judge the secret things, And none shall be able to utter a lying word before him* (1 Enoch 49:2,4): the Son stands before the Father and judges by what he is given. *And Yahuah (God) of Spirits seated the Elect One on the throne of His glory... And Yahuah (God) of Spirits said: This is the Son of Adam who is born unto righteousness* (1 Enoch 62:6-7) — the Father seats the Son of Adam to judge. One will, one work: the Father shows, the Son does; the Father gives, the Son receives.',
       sv.verse_id, ev.verse_id, 'extras', 15123
  FROM _jn05_lookup sv, _jn05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=5 AND sv.verse_number=19
   AND ev.edition_slug='canon' AND ev.book_slug='john' AND ev.chapter_number=5 AND ev.verse_number=29
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'john-5-i-seek-not-mine-own-will-but-the-will-of-the-father-the-witnesses',
       E'I seek not mine own will, but the will of the Father — and the witnesses that establish it (Psalm 40; Deuteronomy 19; Isaiah 42)',
       E'*I can of mine own self do nothing... because I seek not mine own will, but the will of the Father which hath sent me* (John 5:30). The sent Son submits — and this is no reluctant servitude but delight: *I delight to do thy will, O my Elohim (God): yea, thy law is within my heart* (Psalm 40:8). The Son lives the song; the Father''s will and the Torah within are one.\n\nAnd he keeps the Torah''s own rule of evidence. *If I bear witness of myself, my witness is not true* (John 5:31), for *at the mouth of two witnesses, or at the mouth of three witnesses, shall the matter be established* (Deuteronomy 19:15). So he brings them forward — John the burning lamp, the works the Father gave him to finish, and the Father himself. *The Father himself, which hath sent me, hath borne witness of me* (John 5:37): *Behold my servant, whom I uphold; mine elect, in whom my soul delighteth; I have put my spirit upon him* (Isaiah 42:1). The Father''s witness was spoken by Isaiah long before — the Servant upheld, chosen, and anointed by the One who sent him.',
       sv.verse_id, ev.verse_id, 'free', 15126
  FROM _jn05_lookup sv, _jn05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=5 AND sv.verse_number=30
   AND ev.edition_slug='canon' AND ev.book_slug='john' AND ev.chapter_number=5 AND ev.verse_number=38
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'john-5-search-the-scriptures-they-testify-of-me-moses-wrote-of-me',
       E'Search the scriptures, they testify of me; Moses wrote of me (Deuteronomy 18, 30; Psalm 40; Genesis 3; Sirach 24)',
       E'*Search the scriptures; for in them ye think ye have eternal life: and they are they which testify of me* (John 5:39). And the sharpest word of all: *had ye believed Moses, ye would have believed me: for he wrote of me* (John 5:46). The Torah is not the abolished thing — it is the living witness that points to Messiah.\n\nMoses wrote of him plainly: *The LORD thy God will raise up unto thee a Prophet from the midst of thee, of thy brethren, like unto me; unto him ye shall hearken* (Deuteronomy 18:15). And the whole volume testifies: *Lo, I come: in the volume of the book it is written of me* (Psalm 40:7). It reaches back to the first promise: *I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head* (Genesis 3:15) — the seed of the woman, written by Moses in Eden.\n\nThe word was never far from them: *the word is very nigh unto thee, in thy mouth, and in thy heart, that thou mayest do it* (Deuteronomy 30:14). They held the writings and would not come to the One the writings named. For *all these things are the book of the covenant of the most high Yahuah (God), even the law which Moses commanded for an heritage to the congregations of Jacob* (Sirach 24:23) — the Torah is the heritage, and its testimony is Yahusha (Jesus). To believe Moses is to believe him.',
       sv.verse_id, ev.verse_id, 'extras', 15129
  FROM _jn05_lookup sv, _jn05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=5 AND sv.verse_number=39
   AND ev.edition_slug='canon' AND ev.book_slug='john' AND ev.chapter_number=5 AND ev.verse_number=47
ON CONFLICT (slug) DO NOTHING;

-- =====================================================================
-- 3d. thread_members
-- =====================================================================
-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:2 — *And on the seventh day Elohim (God) ended his work... and he rested on the seventh day from all his work which he had made.* The Father''s rest is the rest of finished, sustaining work — never idleness.'
  FROM cross_reference_threads t, cross_references x, _jn05_lookup sv, _jn05_lookup tv
 WHERE t.slug='john-5-bethesda-the-sabbath-rightly-kept-my-father-worketh-hitherto-and-i-work'
   AND sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=5 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 121:4 — *Behold, he that keepeth Yashar''el (Israel) shall neither slumber nor sleep.* The Keeper does not clock out on the sabbath; his sustaining hand holds the world through the seventh day.'
  FROM cross_reference_threads t, cross_references x, _jn05_lookup sv, _jn05_lookup tv
 WHERE t.slug='john-5-bethesda-the-sabbath-rightly-kept-my-father-worketh-hitherto-and-i-work'
   AND sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=5 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=121 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 58:13 — *call the sabbath a delight, the holy of Yahuah (LORD), honourable.* What is more a delight than a man made whole? Mercy is the honour of the day.'
  FROM cross_reference_threads t, cross_references x, _jn05_lookup sv, _jn05_lookup tv
 WHERE t.slug='john-5-bethesda-the-sabbath-rightly-kept-my-father-worketh-hitherto-and-i-work'
   AND sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=5 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=58 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ezekiel 34:4 — *The diseased have ye not strengthened, neither have ye healed that which was sick... neither have ye sought that which was lost.* The hireling shepherds left him lying; the True Shepherd seeks the one driven away.'
  FROM cross_reference_threads t, cross_references x, _jn05_lookup sv, _jn05_lookup tv
 WHERE t.slug='john-5-bethesda-the-sabbath-rightly-kept-my-father-worketh-hitherto-and-i-work'
   AND sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=5 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=34 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 2:18 — *all the angels of the presence... He has hidden us to keep the Sabbath with Him in heaven and on earth.* Heaven itself keeps the day; rest full of life, not an empty cessation.'
  FROM cross_reference_threads t, cross_references x, _jn05_lookup sv, _jn05_lookup tv
 WHERE t.slug='john-5-bethesda-the-sabbath-rightly-kept-my-father-worketh-hitherto-and-i-work'
   AND sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=5 AND sv.verse_number=17
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=2 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 18:18 — *I will raise them up a Prophet from among their brethren... and will put my words in his mouth; and he shall speak unto them all that I shall command him.* The Prophet carries the Sender''s word, never his own.'
  FROM cross_reference_threads t, cross_references x, _jn05_lookup sv, _jn05_lookup tv
 WHERE t.slug='john-5-the-son-can-do-nothing-of-himself-but-what-he-seeth-the-father-do'
   AND sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=5 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:13 — *one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days.* The kaph preserved — the Formed Son brought NEAR to the Father to receive.'
  FROM cross_reference_threads t, cross_references x, _jn05_lookup sv, _jn05_lookup tv
 WHERE t.slug='john-5-the-son-can-do-nothing-of-himself-but-what-he-seeth-the-father-do'
   AND sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=5 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 7:14 — *And there was given him dominion, and glory, and a kingdom... his dominion is an everlasting dominion.* The kingdom is GIVEN — the Son receives from the Father; he does not seize it of himself.'
  FROM cross_reference_threads t, cross_references x, _jn05_lookup sv, _jn05_lookup tv
 WHERE t.slug='john-5-the-son-can-do-nothing-of-himself-but-what-he-seeth-the-father-do'
   AND sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=5 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 49:2,4 — *the Elect One standeth before Yahuah (God) of Spirits... he shall judge the secret things, And none shall be able to utter a lying word before him.* He stands BEFORE the Father and judges by what he is given — John 5:22 in older ink.'
  FROM cross_reference_threads t, cross_references x, _jn05_lookup sv, _jn05_lookup tv
 WHERE t.slug='john-5-the-son-can-do-nothing-of-himself-but-what-he-seeth-the-father-do'
   AND sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=5 AND sv.verse_number=22
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=49 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Enoch 62:6-7 — *Yahuah (God) of Spirits seated the Elect One on the throne of His glory, And he shall judge... This is the Son of Adam who is born unto righteousness.* The Father seats the Son of Adam to judge — exactly John 5:27.'
  FROM cross_reference_threads t, cross_references x, _jn05_lookup sv, _jn05_lookup tv
 WHERE t.slug='john-5-the-son-can-do-nothing-of-himself-but-what-he-seeth-the-father-do'
   AND sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=5 AND sv.verse_number=27
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=62 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 40:8 — *I delight to do thy will, O my Elohim (God): yea, thy law is within my heart.* The Son lives David''s song; the Father''s will and the Torah within are one.'
  FROM cross_reference_threads t, cross_references x, _jn05_lookup sv, _jn05_lookup tv
 WHERE t.slug='john-5-i-seek-not-mine-own-will-but-the-will-of-the-father-the-witnesses'
   AND sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=5 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=40 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 19:15 — *at the mouth of two witnesses, or at the mouth of three witnesses, shall the matter be established.* The Son keeps the Torah''s own rule of evidence: *If I bear witness of myself, my witness is not true.*'
  FROM cross_reference_threads t, cross_references x, _jn05_lookup sv, _jn05_lookup tv
 WHERE t.slug='john-5-i-seek-not-mine-own-will-but-the-will-of-the-father-the-witnesses'
   AND sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=5 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=19 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 42:1 — *Behold my servant, whom I uphold; mine elect, in whom my soul delighteth; I have put my spirit upon him.* The Father''s own witness, foretold — the Servant upheld, chosen, Spirit-anointed by the One who sent him.'
  FROM cross_reference_threads t, cross_references x, _jn05_lookup sv, _jn05_lookup tv
 WHERE t.slug='john-5-i-seek-not-mine-own-will-but-the-will-of-the-father-the-witnesses'
   AND sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=5 AND sv.verse_number=37
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=42 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 18:15 — *The LORD thy God will raise up unto thee a Prophet from the midst of thee, of thy brethren, like unto me; unto him ye shall hearken.* This is Moses writing of Messiah — *he wrote of me.*'
  FROM cross_reference_threads t, cross_references x, _jn05_lookup sv, _jn05_lookup tv
 WHERE t.slug='john-5-search-the-scriptures-they-testify-of-me-moses-wrote-of-me'
   AND sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=5 AND sv.verse_number=46
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 40:7 — *Lo, I come: in the volume of the book it is written of me.* The whole volume is written of him; the Son is the scriptures'' subject, not their overturner.'
  FROM cross_reference_threads t, cross_references x, _jn05_lookup sv, _jn05_lookup tv
 WHERE t.slug='john-5-search-the-scriptures-they-testify-of-me-moses-wrote-of-me'
   AND sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=5 AND sv.verse_number=39
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=40 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 30:14 — *the word is very nigh unto thee, in thy mouth, and in thy heart, that thou mayest do it.* They held the writings and would not come to the One the writings named.'
  FROM cross_reference_threads t, cross_references x, _jn05_lookup sv, _jn05_lookup tv
 WHERE t.slug='john-5-search-the-scriptures-they-testify-of-me-moses-wrote-of-me'
   AND sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=5 AND sv.verse_number=46
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 3:15 — *I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head.* The first promise of the seed of the woman, written by Moses in Eden — the testimony runs the whole Torah.'
  FROM cross_reference_threads t, cross_references x, _jn05_lookup sv, _jn05_lookup tv
 WHERE t.slug='john-5-search-the-scriptures-they-testify-of-me-moses-wrote-of-me'
   AND sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=5 AND sv.verse_number=46
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Sirach 24:23 — *All these things are the book of the covenant of the most high Yahuah (God), even the law which Moses commanded for an heritage to the congregations of Jacob.* The Torah is the heritage that testifies of him — not the discarded thing.'
  FROM cross_reference_threads t, cross_references x, _jn05_lookup sv, _jn05_lookup tv
 WHERE t.slug='john-5-search-the-scriptures-they-testify-of-me-moses-wrote-of-me'
   AND sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=5 AND sv.verse_number=39
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=24 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_john_12.sql -----
-- minion_john_12.sql  — John 12 full-library cross-reference threads (NT DEPTH, THIN-ADD)
-- Tag: _jn12_lookup.  DEDUP: 12:23 (grain-of-wheat, x2) is OWNED — NOT re-anchored here.
-- 4 NEW threads: 12:1-8 anoint/poor; 12:12-19 triumphal entry; 12:27-36 soul-troubled/lifted-up;
-- 12:37-43 Esaias-blinding/saw-his-glory (Rom 11 partial-blinding guard).

-- ============================================================
-- 3a. TEMP VIEW
-- ============================================================
CREATE TEMP VIEW _jn12_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1',
   'pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================================================
-- 3b. CROSS_REFERENCES (one tuple per member)
-- ============================================================
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- THREAD 1 — 12:1-8 Mary anoints for burying / the poor ye have always
  ('canon','john',12,7,'canon','deuteronomy',15,11, 'free', E'*For the poor shall never cease out of the land: therefore I command thee, saying, Thou shalt open thine hand wide unto thy brother, to thy poor, and to thy needy, in thy land.* (Deuteronomy 15:11). Yahusha (Jesus) does not displace the open hand — he quotes the very Torah word: *For the poor always ye have with you* (John 12:8). The command stands.'),
  ('canon','john',12,8,'canon','deuteronomy',15,7, 'free', E'*If there be among you a poor man of one of thy brethren within any of thy gates in thy land which Yahuah Elohayka (the LORD thy God) giveth thee, thou shalt not harden thine heart, nor shut thine hand from thy poor brother* (Deuteronomy 15:7). The poor are always near because Torah always commands the open hand — never a license to neglect them.'),
  ('canon','john',12,3,'canon','song-of-solomon',1,12, 'free', E'*While the king sitteth at his table, my spikenard sendeth forth the smell thereof.* (Song of Solomon 1:12). Mary''s pound of spikenard poured upon the King at table — *the house was filled with the odour of the ointment* (John 12:3) — the bride''s costly love spent on the Beloved.'),
  ('canon','john',12,7,'canon','2-chronicles',16,14, 'free', E'*And they buried him in his own sepulchres... and laid him in the bed which was filled with sweet odours and divers kinds of spices prepared by the apothecaries'' art* (2 Chronicles 16:14). The spices of burial: *against the day of my burying hath she kept this* (John 12:7). She anointed him for the grave before he went to it.'),
  ('canon','john',12,8,'apocrypha','ecclesiasticus',4,1, 'extras', E'*My son, defraud not the poor of his living, and make not the needy eyes to wait long.* (Sirach 4:1). The wisdom of the fathers carries the same Torah charge — *Reject not the supplication of the afflicted; neither turn away your face from a poor man* (Sirach 4:4) — that the open hand to the poor is the abiding command, not a thing Messiah set aside.'),

  -- THREAD 2 — 12:12-19 triumphal entry / Hosanna / Blessed is the King / Fear not daughter of Sion
  ('canon','john',12,13,'canon','psalms',118,25, 'free', E'*Save now, I beseech thee, O Yahuah (LORD): O Yahuah (LORD), I beseech thee, send now prosperity.* (Psalm 118:25). The crowd''s *Hosanna* (John 12:13) is this very cry — Save now — sung straight from the Hallel.'),
  ('canon','john',12,13,'canon','psalms',118,26, 'free', E'*Blessed be he that cometh in the name of Yahuah (LORD): we have blessed you out of the house of Yahuah (LORD).* (Psalm 118:26). They cried it over him: *Blessed is the King of Yashar''el (Israel) that cometh in the name of Yahuah (Lord)* (John 12:13). The stone the builders refused (Psalm 118:22) enters his city.'),
  ('canon','john',12,15,'canon','zechariah',9,9, 'free', E'*Rejoice greatly, O daughter of Zion; shout, O daughter of Jerusalem: behold, thy King cometh unto thee: he is just, and having salvation; lowly, and riding upon an ass, and upon a colt the foal of an ass.* (Zechariah 9:9). John names it written and fulfilled: *Fear not, daughter of Sion: behold, thy King cometh, sitting on an ass''s colt* (John 12:15). The lowly King, not a war-horse — the next breath promises peace to the nations (Zechariah 9:10).'),
  ('canon','john',12,13,'canon','zephaniah',3,15, 'free', E'*Yahuah (LORD) hath taken away thy judgments, he hath cast out thine enemy: the king of Yashar''el (Israel), even Yahuah (LORD), is in the midst of thee: thou shalt not see evil any more.* (Zephaniah 3:15). The King of Yashar''el in the midst of Zion — *Sing, O daughter of Zion* (Zephaniah 3:14) — the same daughter-of-Zion the gospel crowd hails.'),
  ('canon','john',12,15,'canon','zechariah',9,10, 'free', E'*And I will cut off the chariot from Ephraim, and the horse from Jerusalem... and he shall speak peace unto the heathen: and his dominion shall be from sea even to sea.* (Zechariah 9:10). The lowly King gathers BOTH houses — Ephraim and Jerusalem — and speaks peace to the nations; the two sticks made one under one King.'),

  -- THREAD 3 — 12:27-36 soul troubled / Father glorify thy name / lifted up draw all
  ('canon','john',12,27,'canon','psalms',6,3, 'free', E'*My soul is also sore vexed: but thou, O Yahuah (LORD), how long?* (Psalm 6:3). The troubled soul of the Anointed was sung long before in the Psalter — *Now is my soul troubled* (John 12:27) — the Formed Son in real human dread, yet not turning aside: *for this cause came I unto this hour.*'),
  ('canon','john',12,27,'canon','psalms',42,5, 'free', E'*Why art thou cast down, O my soul? and why art thou disquieted in me? hope thou in Elohim (God): for I shall yet praise him for the help of his countenance.* (Psalm 42:5). The disquieted soul that hopes in Elohim — the Son''s own posture in the hour: not *save me from this hour* as flight, but *Father, glorify thy name* (John 12:28).'),
  ('canon','john',12,32,'canon','numbers',21,9, 'free', E'*And Moses made a serpent of brass, and put it upon a pole, and it came to pass, that if a serpent had bitten any man, when he beheld the serpent of brass, he lived.* (Numbers 21:9). Lifted up on a pole that the bitten might look and live — *And I, if I be lifted up from the earth, will draw all men unto me* (John 12:32). The Torah carried the figure of the cross in the wilderness.'),
  ('canon','john',12,32,'canon','isaiah',11,10, 'free', E'*And in that day there shall be a root of Jesse, which shall stand for an ensign of the people; to it shall the Gentiles seek: and his rest shall be glorious.* (Isaiah 11:10). The lifted-up ensign draws the nations — and the same chapter gathers *the outcasts of Yashar''el (Israel)* and *the dispersed of Yahudah (Judah)* (Isaiah 11:12): the drawing of all is the gathering of the scattered, both houses home.'),
  ('canon','john',12,32,'enoch','1-enoch',48,4, 'extras', E'*He shall be a staff to the righteous whereon to stay themselves and not fall, And he shall be the light of the Gentiles, And the hope of those who are troubled of heart.* (1 Enoch 48:4). The Son of Adam named before the Head of Days is *the light of the Gentiles* — *All who dwell on earth shall fall down and worship before him* (1 Enoch 48:5): the lifted-up One who draws all, the hope of the troubled-of-heart.'),

  -- THREAD 4 — 12:37-43 they believed not / Esaias / he hath blinded their eyes / saw his glory
  ('canon','john',12,38,'canon','isaiah',53,1, 'free', E'*Who hath believed our report? and to whom is the arm of Yahuah (LORD) revealed?* (Isaiah 53:1). John names the rejection as Esaias foretold it: *Yahuah (Lord), who hath believed our report? and to whom hath the arm of Yahuah (Lord) been revealed?* (John 12:38). The despised and rejected Servant of Isaiah 53 is the One they would not believe.'),
  ('canon','john',12,40,'canon','isaiah',6,10, 'free', E'*Make the heart of this people fat, and make their ears heavy, and shut their eyes; lest they see with their eyes, and hear with their ears, and understand with their heart, and convert, and be healed.* (Isaiah 6:10). John quotes it of the unbelief: *He hath blinded their eyes, and hardened their heart* (John 12:40). The blinding is judicial — yet Isaiah''s own chapter keeps *a tenth... the holy seed* (Isaiah 6:13): a remnant always remains.'),
  ('canon','john',12,41,'canon','isaiah',6,1, 'free', E'*In the year that king Uzziah died I saw also Yahuah (Lord) sitting upon a throne, high and lifted up, and his train filled the temple.* (Isaiah 6:1). John says plainly: *These things said Esaias, when he saw his glory, and spake of him* (John 12:41). The glory Isaiah saw high and lifted up was the glory of the Formed Son — Yahusha (Jesus), the One the Father shows, seen on the throne by the prophet.'),
  ('canon','john',12,41,'canon','isaiah',6,3, 'free', E'*And one cried unto another, and said, Holy, holy, holy, is Yahuah Tseva''ot (LORD of hosts): the whole earth is full of his glory.* (Isaiah 6:3). The thrice-holy glory filling the earth — *Esaias... saw his glory, and spake of him* (John 12:41): the Son whose glory is the Father''s, made visible to the seer.'),
  ('canon','john',12,37,'canon','romans',11,25, 'free', E'*that blindness in part is happened to Yashar''el (Israel), until the fulness of the Gentiles be come in.* (Romans 11:25). The blinding John names is *in part* and *until* — never final, never a casting-off: *Elohim (God) hath not cast away his people which he foreknew* (Romans 11:2). Even here *among the chief rulers also many believed on him* (John 12:42), and *all Yashar''el shall be saved* (Romans 11:26).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _jn12_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _jn12_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================================================
-- 3c. THREADS (one INSERT per thread) — 7 columns, 7 expressions
-- ============================================================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'john-12-mary-anoints-for-burying-the-poor-ye-have-always-deuteronomy-15',
       E'Anointed for burying; the poor ye have always with you (Deuteronomy 15)',
       E'Mary breaks open *a pound of ointment of spikenard, very costly, and anointed the feet of Yahusha (Jesus), and wiped his feet with her hair: and the house was filled with the odour of the ointment* (John 12:3). When the bag-keeper grudges the cost, Yahusha answers, *Let her alone: against the day of my burying hath she kept this. For the poor always ye have with you; but me ye have not always* (John 12:7-8).\n\nHe is not waving the poor aside — he is quoting Torah. *For the poor shall never cease out of the land: therefore I command thee, saying, Thou shalt open thine hand wide unto thy brother, to thy poor, and to thy needy, in thy land* (Deuteronomy 15:11). The very reason the poor are *always* with us is the very reason the open hand is *always* commanded: *thou shalt not harden thine heart, nor shut thine hand from thy poor brother* (Deuteronomy 15:7). The command stands; it is never displaced by devotion to the King — it flows from it.\n\nThe spikenard itself sings from the Song: *While the king sitteth at his table, my spikenard sendeth forth the smell thereof* (Song of Solomon 1:12) — the bride''s costly love spent on the Beloved at his table. And the spices are the spices of the grave: *they buried him... and laid him in the bed which was filled with sweet odours and divers kinds of spices prepared by the apothecaries'' art* (2 Chronicles 16:14). She anointed him for the tomb before he reached it.\n\nThe fathers'' wisdom carries the same charge unbroken: *My son, defraud not the poor of his living, and make not the needy eyes to wait long... Reject not the supplication of the afflicted; neither turn away your face from a poor man* (Sirach 4:1, 4). One library, one command: love the King with all you have, and never shut your hand to the poor he loves.',
       sv.verse_id, ev.verse_id, 'extras', 15330
  FROM _jn12_lookup sv, _jn12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=12 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='john' AND ev.chapter_number=12 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'john-12-triumphal-entry-hosanna-blessed-is-the-king-of-israel-zechariah-9-psalm-118',
       E'Hosanna! Blessed is the King of Yashar''el; thy King cometh, lowly (Zechariah 9; Psalm 118)',
       E'The feast crowd *took branches of palm trees, and went forth to meet him, and cried, Hosanna: Blessed is the King of Yashar''el (Israel) that cometh in the name of Yahuah (Lord)* (John 12:13). Every word of it is sung straight out of the Hallel. *Save now, I beseech thee, O Yahuah (LORD)* (Psalm 118:25) — that cry, *Save now,* is *Hosanna.* And the blessing: *Blessed be he that cometh in the name of Yahuah (LORD): we have blessed you out of the house of Yahuah (LORD)* (Psalm 118:26). The stone the builders refused (Psalm 118:22) rides into his own city to the people''s shout.\n\nThen Yahusha finds the colt, *as it is written, Fear not, daughter of Sion: behold, thy King cometh, sitting on an ass''s colt* (John 12:14-15) — the word of Zechariah made flesh: *Rejoice greatly, O daughter of Zion; shout, O daughter of Jerusalem: behold, thy King cometh unto thee: he is just, and having salvation; lowly, and riding upon an ass, and upon a colt the foal of an ass* (Zechariah 9:9). Not a war-horse — a lowly King. And the very next breath of that prophecy is the gathering of both houses: *I will cut off the chariot from Ephraim, and the horse from Jerusalem... and he shall speak peace unto the heathen: and his dominion shall be from sea even to sea* (Zechariah 9:10). Ephraim and Jerusalem — the two sticks — under one King who speaks peace to the nations.\n\nZephaniah saw the same King in the midst of the same daughter: *Sing, O daughter of Zion; shout, O Yashar''el (Israel)... the king of Yashar''el (Israel), even Yahuah (LORD), is in the midst of thee: thou shalt not see evil any more* (Zephaniah 3:14-15). The King of Yashar''el has come unto Zion — and the Pharisees confess, in spite of themselves, *behold, the world is gone after him* (John 12:19).',
       sv.verse_id, ev.verse_id, 'free', 15333
  FROM _jn12_lookup sv, _jn12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=12 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='john' AND ev.chapter_number=12 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'john-12-now-is-my-soul-troubled-father-glorify-thy-name-lifted-up-draw-all-numbers-21-isaiah-11',
       E'Now is my soul troubled; Father, glorify thy name; if I be lifted up, will draw all (Numbers 21; Isaiah 11)',
       E'*Now is my soul troubled; and what shall I say? Father, save me from this hour: but for this cause came I unto this hour. Father, glorify thy name* (John 12:27-28). The Formed Son stands in real human dread — and the Psalter sang that dread long before him: *My soul is also sore vexed: but thou, O Yahuah (LORD), how long?* (Psalm 6:3); *Why art thou cast down, O my soul? and why art thou disquieted in me? hope thou in Elohim (God): for I shall yet praise him* (Psalm 42:5). He does not flee the hour. He turns it back to the Father: *Father, glorify thy name* — and *there came... a voice from heaven, saying, I have both glorified it, and will glorify it again* (John 12:28). The Son seeks the Father''s glory, and the Father answers.\n\n*And I, if I be lifted up from the earth, will draw all men unto me* (John 12:32). The Torah already carried the figure: *Moses made a serpent of brass, and put it upon a pole, and it came to pass, that if a serpent had bitten any man, when he beheld the serpent of brass, he lived* (Numbers 21:9). Lifted up on a pole, that the dying might look and live.\n\nAnd the drawing of *all men* is the gathering the prophets named: *in that day there shall be a root of Jesse, which shall stand for an ensign of the people; to it shall the Gentiles seek* (Isaiah 11:10) — the same ensign that *shall assemble the outcasts of Yashar''el (Israel), and gather together the dispersed of Yahudah (Judah) from the four corners of the earth* (Isaiah 11:12). The lifted-up One draws the scattered home, both houses, and the stranger with them.\n\nThe Son of Adam, named before the Head of Days, was foreseen as exactly this: *He shall be a staff to the righteous whereon to stay themselves and not fall, And he shall be the light of the Gentiles, And the hope of those who are troubled of heart* (1 Enoch 48:4) — *All who dwell on earth shall fall down and worship before him* (1 Enoch 48:5). The light lifted up, drawing all.',
       sv.verse_id, ev.verse_id, 'extras', 15336
  FROM _jn12_lookup sv, _jn12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=12 AND sv.verse_number=27
   AND ev.edition_slug='canon' AND ev.book_slug='john' AND ev.chapter_number=12 AND ev.verse_number=36
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'john-12-they-believed-not-esaias-blinded-their-eyes-saw-his-glory-isaiah-53-isaiah-6',
       E'They believed not; he hath blinded their eyes; Esaias saw his glory (Isaiah 53; Isaiah 6)',
       E'Though he had done so many miracles, *yet they believed not on him: That the saying of Esaias the prophet might be fulfilled, which he spake, Yahuah (Lord), who hath believed our report? and to whom hath the arm of Yahuah (Lord) been revealed?* (John 12:37-38). The unbelief is Isaiah 53''s own opening: *Who hath believed our report? and to whom is the arm of Yahuah (LORD) revealed?* (Isaiah 53:1). The despised and rejected Servant — *he is despised and rejected of men; a man of sorrows* (Isaiah 53:3) — is the One they would not receive.\n\nJohn names the second word of Esaias too: *He hath blinded their eyes, and hardened their heart; that they should not see with their eyes* (John 12:40), quoting the throne-room commission: *Make the heart of this people fat, and make their ears heavy, and shut their eyes* (Isaiah 6:10). This is a judicial blinding — but read the whole chapter and the blinding is never the end: *in it shall be a tenth... so the holy seed shall be the substance thereof* (Isaiah 6:13). A remnant always remains.\n\nAnd here is the glory of it: *These things said Esaias, when he saw his glory, and spake of him* (John 12:41). Whose glory did Isaiah see? *In the year that king Uzziah died I saw also Yahuah (Lord) sitting upon a throne, high and lifted up, and his train filled the temple* (Isaiah 6:1) — *Holy, holy, holy, is Yahuah Tseva''ot (LORD of hosts): the whole earth is full of his glory* (Isaiah 6:3). The glory enthroned in Isaiah 6 was the glory of the Formed Son. Yahusha (Jesus) is the One the prophet saw high and lifted up — the Father made visible in his Son, the One through whom the invisible Father is known.\n\nAnd the blinding is *in part* and *until,* never a casting-off. *Blindness in part is happened to Yashar''el (Israel), until the fulness of the Gentiles be come in* (Romans 11:25) — and *Elohim (God) hath not cast away his people which he foreknew* (Romans 11:2). Even in John''s own account, *among the chief rulers also many believed on him* (John 12:42); the remnant believes, and *all Yashar''el (Israel) shall be saved* (Romans 11:26). The hardening is the hinge of mercy, not the end of the people.',
       sv.verse_id, ev.verse_id, 'free', 15339
  FROM _jn12_lookup sv, _jn12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=12 AND sv.verse_number=37
   AND ev.edition_slug='canon' AND ev.book_slug='john' AND ev.chapter_number=12 AND ev.verse_number=43
ON CONFLICT (slug) DO NOTHING;

-- ============================================================
-- 3d. THREAD_MEMBERS (one INSERT per member)  TABLE = cross_reference_thread_members
-- ============================================================

-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 15:11 — *For the poor shall never cease out of the land: therefore I command thee... Thou shalt open thine hand wide unto thy brother, to thy poor, and to thy needy.* Yahusha quotes this very word in John 12:8; the poor''s presence is the ground of the open-hand command, not an excuse to neglect it.'
  FROM cross_reference_threads t, cross_references x, _jn12_lookup sv, _jn12_lookup tv
 WHERE t.slug='john-12-mary-anoints-for-burying-the-poor-ye-have-always-deuteronomy-15'
   AND sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=12 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=15 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 15:7 — *thou shalt not harden thine heart, nor shut thine hand from thy poor brother.* The standing Torah charge that the open hand to the poor is never set aside.'
  FROM cross_reference_threads t, cross_references x, _jn12_lookup sv, _jn12_lookup tv
 WHERE t.slug='john-12-mary-anoints-for-burying-the-poor-ye-have-always-deuteronomy-15'
   AND sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=12 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=15 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Song of Solomon 1:12 — *While the king sitteth at his table, my spikenard sendeth forth the smell thereof.* The bride''s costly spikenard poured on the King at table — the figure Mary fulfils.'
  FROM cross_reference_threads t, cross_references x, _jn12_lookup sv, _jn12_lookup tv
 WHERE t.slug='john-12-mary-anoints-for-burying-the-poor-ye-have-always-deuteronomy-15'
   AND sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=12 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='song-of-solomon' AND tv.chapter_number=1 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Chronicles 16:14 — *laid him in the bed which was filled with sweet odours and divers kinds of spices prepared by the apothecaries'' art.* The spices of the grave; Mary anoints him for burial before the tomb (John 12:7).'
  FROM cross_reference_threads t, cross_references x, _jn12_lookup sv, _jn12_lookup tv
 WHERE t.slug='john-12-mary-anoints-for-burying-the-poor-ye-have-always-deuteronomy-15'
   AND sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=12 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=16 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Sirach 4:1, 4 — *My son, defraud not the poor of his living... Reject not the supplication of the afflicted; neither turn away your face from a poor man.* The fathers'' wisdom carries the same standing charge for the poor that Yahusha affirms.'
  FROM cross_reference_threads t, cross_references x, _jn12_lookup sv, _jn12_lookup tv
 WHERE t.slug='john-12-mary-anoints-for-burying-the-poor-ye-have-always-deuteronomy-15'
   AND sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=12 AND sv.verse_number=8
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=4 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 118:25 — *Save now, I beseech thee, O Yahuah (LORD).* The Hallel cry *Save now* is the crowd''s *Hosanna* (John 12:13).'
  FROM cross_reference_threads t, cross_references x, _jn12_lookup sv, _jn12_lookup tv
 WHERE t.slug='john-12-triumphal-entry-hosanna-blessed-is-the-king-of-israel-zechariah-9-psalm-118'
   AND sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=12 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=118 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 118:26 — *Blessed be he that cometh in the name of Yahuah (LORD).* Sung over the King entering his city; the stone the builders refused (118:22) is hailed.'
  FROM cross_reference_threads t, cross_references x, _jn12_lookup sv, _jn12_lookup tv
 WHERE t.slug='john-12-triumphal-entry-hosanna-blessed-is-the-king-of-israel-zechariah-9-psalm-118'
   AND sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=12 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=118 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Zechariah 9:9 — *behold, thy King cometh unto thee: he is just, and having salvation; lowly, and riding upon an ass, and upon a colt the foal of an ass.* John names it written and fulfilled (12:14-15): the lowly King, not a war-horse.'
  FROM cross_reference_threads t, cross_references x, _jn12_lookup sv, _jn12_lookup tv
 WHERE t.slug='john-12-triumphal-entry-hosanna-blessed-is-the-king-of-israel-zechariah-9-psalm-118'
   AND sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=12 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=9 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Zephaniah 3:15 — *the king of Yashar''el (Israel), even Yahuah (LORD), is in the midst of thee.* The King of Yashar''el in the midst of the daughter of Zion the crowd hails.'
  FROM cross_reference_threads t, cross_references x, _jn12_lookup sv, _jn12_lookup tv
 WHERE t.slug='john-12-triumphal-entry-hosanna-blessed-is-the-king-of-israel-zechariah-9-psalm-118'
   AND sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=12 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='zephaniah' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Zechariah 9:10 — *I will cut off the chariot from Ephraim, and the horse from Jerusalem... and he shall speak peace unto the heathen.* The lowly King gathers both houses (Ephraim + Jerusalem) and speaks peace to the nations.'
  FROM cross_reference_threads t, cross_references x, _jn12_lookup sv, _jn12_lookup tv
 WHERE t.slug='john-12-triumphal-entry-hosanna-blessed-is-the-king-of-israel-zechariah-9-psalm-118'
   AND sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=12 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=9 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 6:3 — *My soul is also sore vexed: but thou, O Yahuah (LORD), how long?* The Anointed''s troubled soul sung long before the hour (John 12:27).'
  FROM cross_reference_threads t, cross_references x, _jn12_lookup sv, _jn12_lookup tv
 WHERE t.slug='john-12-now-is-my-soul-troubled-father-glorify-thy-name-lifted-up-draw-all-numbers-21-isaiah-11'
   AND sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=12 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=6 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 42:5 — *Why art thou cast down, O my soul?... hope thou in Elohim (God): for I shall yet praise him.* The disquieted-yet-hoping soul that turns to glorify the Father (John 12:28).'
  FROM cross_reference_threads t, cross_references x, _jn12_lookup sv, _jn12_lookup tv
 WHERE t.slug='john-12-now-is-my-soul-troubled-father-glorify-thy-name-lifted-up-draw-all-numbers-21-isaiah-11'
   AND sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=12 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=42 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Numbers 21:9 — *Moses made a serpent of brass, and put it upon a pole... when he beheld the serpent of brass, he lived.* The Torah figure of the lifted-up One: look and live (John 12:32).'
  FROM cross_reference_threads t, cross_references x, _jn12_lookup sv, _jn12_lookup tv
 WHERE t.slug='john-12-now-is-my-soul-troubled-father-glorify-thy-name-lifted-up-draw-all-numbers-21-isaiah-11'
   AND sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=12 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=21 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 11:10 — *a root of Jesse, which shall stand for an ensign of the people; to it shall the Gentiles seek.* The lifted-up ensign that draws the nations and gathers the scattered of both houses (Isaiah 11:12).'
  FROM cross_reference_threads t, cross_references x, _jn12_lookup sv, _jn12_lookup tv
 WHERE t.slug='john-12-now-is-my-soul-troubled-father-glorify-thy-name-lifted-up-draw-all-numbers-21-isaiah-11'
   AND sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=12 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Enoch 48:4 — *he shall be the light of the Gentiles, And the hope of those who are troubled of heart.* The Son of Adam named before the Head of Days, foreseen as the lifted-up light who draws all (cf. 48:5, all fall down and worship before him).'
  FROM cross_reference_threads t, cross_references x, _jn12_lookup sv, _jn12_lookup tv
 WHERE t.slug='john-12-now-is-my-soul-troubled-father-glorify-thy-name-lifted-up-draw-all-numbers-21-isaiah-11'
   AND sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=12 AND sv.verse_number=32
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=48 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 53:1 — *Who hath believed our report? and to whom is the arm of Yahuah (LORD) revealed?* John quotes it of the unbelief (12:38); the despised, rejected Servant is the One they would not receive.'
  FROM cross_reference_threads t, cross_references x, _jn12_lookup sv, _jn12_lookup tv
 WHERE t.slug='john-12-they-believed-not-esaias-blinded-their-eyes-saw-his-glory-isaiah-53-isaiah-6'
   AND sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=12 AND sv.verse_number=38
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 6:10 — *make their ears heavy, and shut their eyes; lest they see... and convert, and be healed.* The throne-room word John quotes (12:40); a judicial blinding, yet 6:13 keeps a tenth, the holy seed — a remnant always remains.'
  FROM cross_reference_threads t, cross_references x, _jn12_lookup sv, _jn12_lookup tv
 WHERE t.slug='john-12-they-believed-not-esaias-blinded-their-eyes-saw-his-glory-isaiah-53-isaiah-6'
   AND sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=12 AND sv.verse_number=40
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=6 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 6:1 — *I saw also Yahuah (Lord) sitting upon a throne, high and lifted up.* John 12:41 says Esaias *saw his glory, and spake of him* — the glory enthroned in Isaiah 6 was the glory of the Formed Son, Yahusha (Jesus), the Father made visible.'
  FROM cross_reference_threads t, cross_references x, _jn12_lookup sv, _jn12_lookup tv
 WHERE t.slug='john-12-they-believed-not-esaias-blinded-their-eyes-saw-his-glory-isaiah-53-isaiah-6'
   AND sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=12 AND sv.verse_number=41
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=6 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 6:3 — *Holy, holy, holy, is Yahuah Tseva''ot (LORD of hosts): the whole earth is full of his glory.* The thrice-holy glory the seer beheld — the glory of the Son, which is the Father''s (John 12:41).'
  FROM cross_reference_threads t, cross_references x, _jn12_lookup sv, _jn12_lookup tv
 WHERE t.slug='john-12-they-believed-not-esaias-blinded-their-eyes-saw-his-glory-isaiah-53-isaiah-6'
   AND sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=12 AND sv.verse_number=41
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=6 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Romans 11:25 — *blindness in part is happened to Yashar''el (Israel), until the fulness of the Gentiles be come in.* The blinding is in part and until — never a casting-off (11:2); even here many rulers believed (John 12:42), and all Yashar''el shall be saved (11:26).'
  FROM cross_reference_threads t, cross_references x, _jn12_lookup sv, _jn12_lookup tv
 WHERE t.slug='john-12-they-believed-not-esaias-blinded-their-eyes-saw-his-glory-isaiah-53-isaiah-6'
   AND sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=12 AND sv.verse_number=37
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_john_13.sql -----
-- John 13 — NT DEPTH pass — THIN-ADD (3 NEW threads; 13:34 new-commandment already threaded x2, NOT touched)

CREATE TEMP VIEW _jn13_lookup AS
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
  -- THREAD 1 — John 13:1-11 he washed the disciples' feet; if I wash thee not, thou hast no part with me
  ('canon','john',13,5,'canon','genesis',18,4, 'free', E'*Let a little water, I pray you, be fetched, and wash your feet, and rest yourselves under the tree* (Genesis 18:4). When the three came to Abraham''s tent, the welcome of the righteous was water for the feet — the servant''s office of love. Here the Master himself takes the bason: the One who appeared to Abraham now kneels to the towel.'),
  ('canon','john',13,5,'canon','1-samuel',25,41, 'free', E'*And she arose, and bowed herself on her face to the earth, and said, Behold, let thine handmaid be a servant to wash the feet of the servants of my lord* (1 Samuel 25:41). Abigail counts it her lowest gladness to wash the feet of the servants of her lord. Yahusha (Jesus) inverts the order entirely — the Lord washes the feet of the servants.'),
  ('canon','john',13,5,'canon','exodus',30,19, 'free', E'*For Aaron and his sons shall wash their hands and their feet thereat* (Exodus 30:19). Before the priests could draw near to minister, the Torah set a laver between the altar and the tent, that they wash their feet and not die. The washing that fits a man to serve is no new thing; the Master fulfils it at the basin, fitting his own for their ministry.'),
  ('canon','john',13,8,'canon','psalms',51,7, 'free', E'*Purge me with hyssop, and I shall be clean: wash me, and I shall be whiter than snow* (Psalm 51:7). *If I wash thee not, thou hast no part with me* — the cleansing David begged for is the cleansing Yahusha gives; no man has part with him unwashed, for the heart made clean is the Father''s own work.'),
  ('canon','john',13,4,'canon','philippians',2,7, 'free', E'*But made himself of no reputation, and took upon him the form of a servant, and was made in the likeness of men* (Philippians 2:7). *He riseth from supper, and laid aside his garments* is the hymn made flesh — the Formed Son, knowing the Father had given all things into his hands (13:3), takes the form of a servant. The towel is the kenosis the whole library sings.'),

  -- THREAD 2 — John 13:12-20 ye ought to wash one another feet; the servant is not greater than his lord
  ('canon','john',13,14,'canon','leviticus',19,18, 'free', E'*Thou shalt not avenge, nor bear any grudge against the children of thy people, but thou shalt love thy neighbour as thyself: I am Yahuah (LORD)* (Leviticus 19:18). *Ye also ought to wash one another''s feet* is love-thy-neighbour given hands and a bason — not a new law replacing the old, but the royal commandment of the Torah shown plainly in a stooping Master.'),
  ('canon','john',13,16,'canon','proverbs',22,29, 'free', E'*Seest thou a man diligent in his business? he shall stand before kings; he shall not stand before mean men* (Proverbs 22:29). *The servant is not greater than his lord* names the lowliness Proverbs commends — the diligent servant who knows his place; and the Lord who took that place is the example given.'),
  ('canon','john',13,16,'canon','matthew',10,40, 'free', E'*He that receiveth you receiveth me, and he that receiveth me receiveth him that sent me* (Matthew 10:40). The sending-chain of 13:20 is the same word: the sent one carries the Sender. The Formed Son is sent by the Father, and those he sends carry him — to receive the servant is to receive the Lord, and to receive the Lord is to receive the Father who sent him.'),
  ('canon','john',13,15,'canon','1-peter',5,5, 'free', E'*Yea, all of you be subject one to another, and be clothed with humility: for Elohim (God) resisteth the proud, and giveth grace to the humble* (1 Peter 5:5). *I have given you an example, that ye should do as I have done to you* — Peter, whose feet were washed, hands down the very lesson: be clothed with humility, one toward another, as the Master clothed himself with the towel.'),
  ('canon','john',13,13,'canon','philippians',2,5, 'free', E'*Let this mind be in you, which was also in HaMashiach Yahusha (Christ Jesus)* (Philippians 2:5). *Ye call me Master and Lord: and ye say well; for so I am* — he does not deny the title; he fills it with the servant''s mind. The lordship is real, and it stoops. That mind is the one to be in his own.'),

  -- THREAD 3 — John 13:18-30 he that eateth bread with me hath lifted up his heel against me; the betrayal foretold
  ('canon','john',13,18,'canon','psalms',41,9, 'free', E'*Yea, mine own familiar friend, in whom I trusted, which did eat of my bread, hath lifted up his heel against me* (Psalm 41:9). Yahusha quotes the psalm word for word — *that the scripture may be fulfilled.* The table-companion turned betrayer was written long before; the wound of the trusted friend is foreseen and Scripture-bound.'),
  ('canon','john',13,18,'canon','psalms',55,12, 'free', E'*For it was not an enemy that reproached me; then I could have borne it: neither was it he that hated me that did magnify himself against me; then I would have hid myself from him* (Psalm 55:12). The sharpest grief is not the open foe — David already named it; the betrayer wears the face of a friend.'),
  ('canon','john',13,18,'canon','psalms',55,13, 'free', E'*But it was thou, a man mine equal, my guide, and mine acquaintance* (Psalm 55:13). *He that eateth bread with me* — the one nearest the bosom, the trusted acquaintance, lifts the heel. The same betrayal David sang, the Son of David now walks.'),
  ('canon','john',13,26,'canon','zechariah',11,12, 'free', E'*And I said unto them, If ye think good, give me my price; and if not, forbear. So they weighed for my price thirty pieces of silver* (Zechariah 11:12). The sop handed to Judas is the next step of a betrayal Zechariah already priced — thirty pieces of silver, the shepherd''s wage, weighed out for the One who feeds the flock.'),
  ('canon','john',13,26,'canon','zechariah',11,13, 'free', E'*And Yahuah (LORD) said unto me, Cast it unto the potter: a goodly price that I was prised at of them. And I took the thirty pieces of silver, and cast them to the potter in the house of Yahuah (LORD)* (Zechariah 11:13). The silver cast to the potter is where the betrayer''s reward ends — the field of blood foreseen in the prophet''s own act.'),
  ('canon','john',13,26,'canon','matthew',26,23, 'free', E'*And he answered and said, He that dippeth his hand with me in the dish, the same shall betray me* (Matthew 26:23). Matthew records the same sign at the same table — the hand in the dish, the sop given — that the betrayer be marked by the bread he shared.'),
  ('canon','john',13,18,'canon','acts',1,16, 'free', E'*Men and brethren, this scripture must needs have been fulfilled, which the Ruach HaKodesh (Holy Spirit) by the mouth of David spake before concerning Judas, which was guide to them that took Yahusha (Jesus)* (Acts 1:16). Peter reads it back as the early assembly did — the Spirit by David''s mouth spoke beforehand of Judas; *that the scripture may be fulfilled* was no afterthought but the library''s own word.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _jn13_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _jn13_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================================================
-- 3c. threads
-- ============================================================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'john-13-washed-the-disciples-feet-if-i-wash-thee-not-genesis-18-psalm-51',
       E'He washed the disciples'' feet; if I wash thee not, thou hast no part with me (Genesis 18; Psalm 51)',
       E'*He riseth from supper, and laid aside his garments; and took a towel, and girded himself. After that he poureth water into a bason, and began to wash the disciples'' feet, and to wipe them with the towel wherewith he was girded* (John 13:4-5). The Master kneels to the towel — and the whole library has been preparing the bason.\n\nThe washing of feet was the welcome of the righteous from the beginning. When the three came to Abraham''s tent, *Let a little water, I pray you, be fetched, and wash your feet, and rest yourselves under the tree* (Genesis 18:4) — and the One who appeared there now stoops to do the washing himself. It was the servant''s lowest gladness: *Behold, let thine handmaid be a servant to wash the feet of the servants of my lord* (1 Samuel 25:41), Abigail said. Yahusha (Jesus) overturns the order — the Lord washes the servants. And it was the Torah''s own preparation for ministry: *For Aaron and his sons shall wash their hands and their feet thereat* (Exodus 30:19), that the priests not die when they draw near. The cleansing that fits a man to serve is no new thing.\n\nWhen Peter resists, the word cuts deep: *If I wash thee not, thou hast no part with me* (John 13:8). The cleansing David begged for is the cleansing the Master gives — *Purge me with hyssop, and I shall be clean: wash me, and I shall be whiter than snow* (Psalm 51:7). No man has part with him unwashed.\n\nAnd the towel is the hymn made flesh. Knowing *the Father had given all things into his hands* (13:3), he lays aside his garments — *But made himself of no reputation, and took upon him the form of a servant, and was made in the likeness of men* (Philippians 2:7). The Formed Son, who has a Father and does the Father''s will, takes the form of the servant. The bason is the kenosis the whole library sings.',
       sv.verse_id, ev.verse_id, 'free', 15360
  FROM _jn13_lookup sv, _jn13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=13 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='john' AND ev.chapter_number=13 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'john-13-ye-ought-to-wash-one-anothers-feet-servant-not-greater-than-his-lord-leviticus-19',
       E'Ye ought to wash one another''s feet; the servant is not greater than his lord (Leviticus 19; Matthew 10)',
       E'*If I then, your Lord and Master, have washed your feet; ye also ought to wash one another''s feet. For I have given you an example, that ye should do as I have done to you* (John 13:14-15). He does not lay down the title — he fills it. *Ye call me Master and Lord: and ye say well; for so I am* (13:13). The lordship is real, and it stoops.\n\nThe command to wash one another''s feet is the royal commandment of the Torah given hands: *Thou shalt not avenge, nor bear any grudge against the children of thy people, but thou shalt love thy neighbour as thyself: I am Yahuah (LORD)* (Leviticus 19:18). This is not a new law replacing the old — it is love-thy-neighbour shown plainly in a stooping Master. *Let this mind be in you, which was also in HaMashiach Yahusha (Christ Jesus)* (Philippians 2:5); and Peter, whose feet were washed, hands the lesson down: *all of you be subject one to another, and be clothed with humility: for Elohim (God) resisteth the proud, and giveth grace to the humble* (1 Peter 5:5).\n\nThen the seal: *Verily, verily, I say unto you, The servant is not greater than his lord; neither he that is sent greater than he that sent him* (John 13:16). It is the lowliness Proverbs commends — *Seest thou a man diligent in his business? he shall stand before kings* (Proverbs 22:29). And it opens into the sending-chain: *He that receiveth whomsoever I send receiveth me; and he that receiveth me receiveth him that sent me* (13:20). The same word stands in Matthew: *He that receiveth you receiveth me, and he that receiveth me receiveth him that sent me* (Matthew 10:40). The sent one carries the Sender. The Formed Son is sent by the Father; those he sends carry him; and to receive them is to receive the Father who sent the Son.',
       sv.verse_id, ev.verse_id, 'free', 15363
  FROM _jn13_lookup sv, _jn13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=13 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='john' AND ev.chapter_number=13 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'john-13-he-that-eateth-bread-with-me-hath-lifted-up-his-heel-against-me-psalm-41-zechariah-11',
       E'He that eateth bread with me hath lifted up his heel against me; the betrayal foretold (Psalm 41; Zechariah 11)',
       E'*I speak not of you all: I know whom I have chosen: but that the scripture may be fulfilled, He that eateth bread with me hath lifted up his heel against me* (John 13:18). The betrayal is not a surprise sprung on the Master — it is written, and he quotes it word for word.\n\nThe psalm he cites named it long before: *Yea, mine own familiar friend, in whom I trusted, which did eat of my bread, hath lifted up his heel against me* (Psalm 41:9). The sharpest wound is not the open enemy but the table-companion: *For it was not an enemy that reproached me; then I could have borne it... But it was thou, a man mine equal, my guide, and mine acquaintance* (Psalm 55:12-13). The same betrayal David sang, the Son of David now walks. When *he had dipped the sop, he gave it to Judas Iscariot* (13:26) — and Matthew records the same sign at the same table: *He that dippeth his hand with me in the dish, the same shall betray me* (Matthew 26:23).\n\nAnd the price was already weighed in the prophet: *So they weighed for my price thirty pieces of silver* (Zechariah 11:12), the shepherd''s wage for the One who feeds the flock; *And Yahuah (LORD) said unto me, Cast it unto the potter... And I took the thirty pieces of silver, and cast them to the potter in the house of Yahuah (LORD)* (Zechariah 11:13) — the field of blood foreseen in the prophet''s own act.\n\nThe early assembly read it back the same way. *Men and brethren, this scripture must needs have been fulfilled, which the Ruach HaKodesh (Holy Spirit) by the mouth of David spake before concerning Judas, which was guide to them that took Yahusha (Jesus)* (Acts 1:16). *That the scripture may be fulfilled* was no afterthought — the library spoke the betrayal beforehand, and the Father''s purpose stood through it.',
       sv.verse_id, ev.verse_id, 'free', 15366
  FROM _jn13_lookup sv, _jn13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=13 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='john' AND ev.chapter_number=13 AND ev.verse_number=30
ON CONFLICT (slug) DO NOTHING;

-- ============================================================
-- 3d. thread_members
-- ============================================================
-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 18:4 — *Let a little water, I pray you, be fetched, and wash your feet, and rest yourselves under the tree.* The welcome of the righteous; the One who appeared to Abraham now does the washing.'
  FROM cross_reference_threads t, cross_references x, _jn13_lookup sv, _jn13_lookup tv
 WHERE t.slug='john-13-washed-the-disciples-feet-if-i-wash-thee-not-genesis-18-psalm-51'
   AND sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=13 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=18 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Samuel 25:41 — *Behold, let thine handmaid be a servant to wash the feet of the servants of my lord.* Abigail''s lowest gladness; Yahusha inverts it — the Lord washes the servants.'
  FROM cross_reference_threads t, cross_references x, _jn13_lookup sv, _jn13_lookup tv
 WHERE t.slug='john-13-washed-the-disciples-feet-if-i-wash-thee-not-genesis-18-psalm-51'
   AND sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=13 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=25 AND tv.verse_number=41
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 30:19 — *For Aaron and his sons shall wash their hands and their feet thereat.* The Torah''s laver fits the priests to serve; the Master fulfils the washing at the bason.'
  FROM cross_reference_threads t, cross_references x, _jn13_lookup sv, _jn13_lookup tv
 WHERE t.slug='john-13-washed-the-disciples-feet-if-i-wash-thee-not-genesis-18-psalm-51'
   AND sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=13 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=30 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 51:7 — *Purge me with hyssop, and I shall be clean: wash me, and I shall be whiter than snow.* The cleansing David begged for; *if I wash thee not, thou hast no part with me.*'
  FROM cross_reference_threads t, cross_references x, _jn13_lookup sv, _jn13_lookup tv
 WHERE t.slug='john-13-washed-the-disciples-feet-if-i-wash-thee-not-genesis-18-psalm-51'
   AND sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=13 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=51 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Philippians 2:7 — *But made himself of no reputation, and took upon him the form of a servant, and was made in the likeness of men.* He laid aside his garments — the Formed Son took the servant''s form; the towel is the kenosis hymn made flesh.'
  FROM cross_reference_threads t, cross_references x, _jn13_lookup sv, _jn13_lookup tv
 WHERE t.slug='john-13-washed-the-disciples-feet-if-i-wash-thee-not-genesis-18-psalm-51'
   AND sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=13 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 19:18 — *thou shalt love thy neighbour as thyself: I am Yahuah (LORD).* Washing one another''s feet is love-thy-neighbour given hands — the Torah''s royal commandment, not a new law replacing it.'
  FROM cross_reference_threads t, cross_references x, _jn13_lookup sv, _jn13_lookup tv
 WHERE t.slug='john-13-ye-ought-to-wash-one-anothers-feet-servant-not-greater-than-his-lord-leviticus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=13 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 22:29 — *Seest thou a man diligent in his business? he shall stand before kings; he shall not stand before mean men.* The lowliness Proverbs commends; *the servant is not greater than his lord.*'
  FROM cross_reference_threads t, cross_references x, _jn13_lookup sv, _jn13_lookup tv
 WHERE t.slug='john-13-ye-ought-to-wash-one-anothers-feet-servant-not-greater-than-his-lord-leviticus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=13 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=22 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 10:40 — *He that receiveth you receiveth me, and he that receiveth me receiveth him that sent me.* The same sending-chain as 13:20 — the sent one carries the Sender; the Formed Son sent by the Father.'
  FROM cross_reference_threads t, cross_references x, _jn13_lookup sv, _jn13_lookup tv
 WHERE t.slug='john-13-ye-ought-to-wash-one-anothers-feet-servant-not-greater-than-his-lord-leviticus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=13 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=10 AND tv.verse_number=40
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Peter 5:5 — *be clothed with humility: for Elohim (God) resisteth the proud, and giveth grace to the humble.* Peter, whose feet were washed, hands the lesson down — be clothed with humility as the Master clothed himself with the towel.'
  FROM cross_reference_threads t, cross_references x, _jn13_lookup sv, _jn13_lookup tv
 WHERE t.slug='john-13-ye-ought-to-wash-one-anothers-feet-servant-not-greater-than-his-lord-leviticus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=13 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Philippians 2:5 — *Let this mind be in you, which was also in HaMashiach Yahusha (Christ Jesus).* *Ye say well; for so I am* — the lordship is real, and it stoops; that servant''s mind is the one to be in his own.'
  FROM cross_reference_threads t, cross_references x, _jn13_lookup sv, _jn13_lookup tv
 WHERE t.slug='john-13-ye-ought-to-wash-one-anothers-feet-servant-not-greater-than-his-lord-leviticus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=13 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 41:9 — *Yea, mine own familiar friend, in whom I trusted, which did eat of my bread, hath lifted up his heel against me.* Yahusha quotes it word for word — the table-companion turned betrayer, written long before.'
  FROM cross_reference_threads t, cross_references x, _jn13_lookup sv, _jn13_lookup tv
 WHERE t.slug='john-13-he-that-eateth-bread-with-me-hath-lifted-up-his-heel-against-me-psalm-41-zechariah-11'
   AND sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=13 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=41 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 55:12 — *For it was not an enemy that reproached me; then I could have borne it... then I would have hid myself from him.* The sharpest grief is not the open foe — the betrayer wears the face of a friend.'
  FROM cross_reference_threads t, cross_references x, _jn13_lookup sv, _jn13_lookup tv
 WHERE t.slug='john-13-he-that-eateth-bread-with-me-hath-lifted-up-his-heel-against-me-psalm-41-zechariah-11'
   AND sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=13 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=55 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 55:13 — *But it was thou, a man mine equal, my guide, and mine acquaintance.* The trusted acquaintance nearest the bosom lifts the heel — the same betrayal David sang, the Son of David now walks.'
  FROM cross_reference_threads t, cross_references x, _jn13_lookup sv, _jn13_lookup tv
 WHERE t.slug='john-13-he-that-eateth-bread-with-me-hath-lifted-up-his-heel-against-me-psalm-41-zechariah-11'
   AND sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=13 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=55 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Zechariah 11:12 — *So they weighed for my price thirty pieces of silver.* The shepherd''s wage for the One who feeds the flock, priced by the prophet before the sop was ever dipped.'
  FROM cross_reference_threads t, cross_references x, _jn13_lookup sv, _jn13_lookup tv
 WHERE t.slug='john-13-he-that-eateth-bread-with-me-hath-lifted-up-his-heel-against-me-psalm-41-zechariah-11'
   AND sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=13 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=11 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Zechariah 11:13 — *And I took the thirty pieces of silver, and cast them to the potter in the house of Yahuah (LORD).* The silver cast to the potter — the field of blood foreseen in the prophet''s own act.'
  FROM cross_reference_threads t, cross_references x, _jn13_lookup sv, _jn13_lookup tv
 WHERE t.slug='john-13-he-that-eateth-bread-with-me-hath-lifted-up-his-heel-against-me-psalm-41-zechariah-11'
   AND sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=13 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=11 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Matthew 26:23 — *He that dippeth his hand with me in the dish, the same shall betray me.* Matthew records the same sign at the same table — the betrayer marked by the bread he shared.'
  FROM cross_reference_threads t, cross_references x, _jn13_lookup sv, _jn13_lookup tv
 WHERE t.slug='john-13-he-that-eateth-bread-with-me-hath-lifted-up-his-heel-against-me-psalm-41-zechariah-11'
   AND sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=13 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=26 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Acts 1:16 — *this scripture must needs have been fulfilled, which the Ruach HaKodesh (Holy Spirit) by the mouth of David spake before concerning Judas.* The early assembly read it back the same way — the Spirit spoke the betrayal beforehand; the Father''s purpose stood through it.'
  FROM cross_reference_threads t, cross_references x, _jn13_lookup sv, _jn13_lookup tv
 WHERE t.slug='john-13-he-that-eateth-bread-with-me-hath-lifted-up-his-heel-against-me-psalm-41-zechariah-11'
   AND sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=13 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=1 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_john_20.sql -----
-- minion_john_20.sql — John 20 DEPTH pass (THIN-ADD, 3 NEW threads)
-- DEDUP: existing threads anchor on 20:1 (resurrection-appearances) and 20:28 (Thomas) — NOT touched here.
-- New anchors: 20:9, 20:11-18, 20:19-23. Band base 15570, step +3.

CREATE TEMP VIEW _jn20_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1',
   'pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================================================
-- 3b. CROSS_REFERENCES (members)
-- ============================================================
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- THREAD 1: 20:9 the scripture that he must rise
  ('canon','john',20,9,'canon','psalms',16,10, 'free', E'*For thou wilt not leave my soul in hell; neither wilt thou suffer thine Holy One to see corruption.* (Psalm 16:10). David sang it of the One who would not be left in the grave — the very word the disciples *knew not* yet as they stood in the empty tomb.'),
  ('canon','john',20,9,'canon','hosea',6,2, 'free', E'*After two days will he revive us: in the third day he will raise us up, and we shall live in his sight.* (Hosea 6:2). The third-day raising was written into the prophets long before the women came at dawn.'),
  ('canon','john',20,9,'canon','jonah',1,17, 'free', E'*Now Yahuah (LORD) had prepared a great fish to swallow up Jonah. And Jonah was in the belly of the fish three days and three nights.* (Jonah 1:17). The sign of Jonah — three days swallowed, three days delivered — the buried scripture the empty tomb was opening.'),
  ('canon','john',20,9,'canon','isaiah',53,10, 'free', E'*Yet it pleased Yahuah (LORD) to bruise him; he hath put him to grief: when thou shalt make his soul an offering for sin, he shall see his seed, he shall prolong his days, and the pleasure of Yahuah (LORD) shall prosper in his hand.* (Isaiah 53:10). The pierced Servant *shall prolong his days* — life on the far side of the offering, written plainly.'),
  ('canon','john',20,9,'canon','luke',24,46, 'free', E'*And said unto them, Thus it is written, and thus it behoved Messiah (Christ) to suffer, and to rise from the dead the third day:* (Luke 24:46). The risen One Himself names *it is written* — the same scripture John 20:9 says they had not yet grasped.'),
  ('canon','john',20,9,'canon','acts',2,31, 'free', E'*He seeing this before spake of the resurrection of Messiah (Christ), that his soul was not left in hell, neither his flesh did see corruption.* (Acts 2:31). Peter, filled with the Ruach, reads Psalm 16 aloud as the resurrection foretold — the scripture the disciples now knew.'),
  ('canon','john',20,9,'canon','1-corinthians',15,4, 'free', E'*And that he was buried, and that he rose again the third day according to the scriptures:* (1 Corinthians 15:4). *According to the scriptures* — twice over — the gospel itself anchored in the Tanakh that John 20:9 says they had not yet read aright.'),

  -- THREAD 2: 20:11-18 I ascend to my Father AND your Father
  ('canon','john',20,17,'canon','psalms',22,22, 'free', E'*I will declare thy name unto my brethren: in the midst of the congregation will I praise thee.* (Psalm 22:22). The Suffering One of Psalm 22 turns from the cross to call the gathered *my brethren* — the same word the risen Yahusha sends to Mary: *go to my brethren.*'),
  ('canon','john',20,17,'canon','ruth',1,16, 'free', E'*And Ruth said, Intreat me not to leave thee, or to return from following after thee: for whither thou goest, I will go; and where thou lodgest, I will lodge: thy people shall be my people, and thy Elohim (God) my Elohim (God):* (Ruth 1:16). *Thy Elohim my Elohim* — the shared-covenant pattern: the Father of the Son is made the Father of the brethren, His Elohim their Elohim.'),
  ('canon','john',20,17,'canon','hebrews',2,11, 'free', E'*For both he that sanctifieth and they who are sanctified are all of one: for which cause he is not ashamed to call them brethren,* (Hebrews 2:11). The Son and the sanctified are *all of one* — He is the firstborn among many brethren, not a co-equal apart from them.'),
  ('canon','john',20,17,'canon','hebrews',2,12, 'free', E'*Saying, I will declare thy name unto my brethren, in the midst of the church will I sing praise unto thee.* (Hebrews 2:12). Hebrews lays Psalm 22:22 in the risen Son''s own mouth — the very *my brethren* of John 20:17, declaring the Father''s name to the gathered.'),

  -- THREAD 3: 20:19-23 he breathed on them, Receive the Ruach
  ('canon','john',20,22,'canon','genesis',2,7, 'free', E'*And Yahuah Elohim (the LORD God) formed man of the dust of the ground, and breathed into his nostrils the breath of life; and man became a living soul.* (Genesis 2:7). The same breath that made the first man a living soul is breathed again upon the gathered — new creation, the second Adam breathing life.'),
  ('canon','john',20,22,'canon','ezekiel',37,9, 'free', E'*Then said he unto me, Prophesy unto the wind, prophesy, son of Adam, and say to the wind, Thus saith Adonai Yahuah (the Lord GOD); Come from the four winds, O breath, and breathe upon these slain, that they may live.* (Ezekiel 37:9). The breath called over the valley of dry bones — *breathe upon these slain, that they may live* — breathed now on the disciples.'),
  ('canon','john',20,22,'canon','ezekiel',37,14, 'free', E'*And shall put my spirit in you, and ye shall live, and I shall place you in your own land: then shall ye know that I Yahuah (LORD) have spoken it, and performed it, saith Yahuah (LORD).* (Ezekiel 37:14). *I will put my spirit in you* — the two-house promise of the whole house of Yashar''el revived and gathered home.'),
  ('canon','john',20,22,'canon','numbers',11,25, 'free', E'*And Yahuah (LORD) came down in a cloud, and spake unto him, and took of the spirit that was upon him, and gave it unto the seventy elders: and it came to pass, that, when the spirit rested upon them, they prophesied, and did not cease.* (Numbers 11:25). The Spirit of the one put upon the many — the pattern of the sent bearing the Sender''s Spirit, fulfilled when the Son breathes upon His own.'),
  ('canon','john',20,22,'canon','acts',2,4, 'free', E'*And they were all filled with the Ruach HaKodesh (Holy Spirit), and began to speak with other tongues, as the Spirit gave them utterance.* (Acts 2:4). What the risen Son breathed in the upper room came in fulness at Pentecost — the rushing wind, the same Ruach poured out.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _jn20_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _jn20_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================================================
-- 3c. THREADS
-- ============================================================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'john-20-9-the-scripture-that-he-must-rise-psalm-16-hosea-6',
       E'As yet they knew not the scripture, that he must rise again (Psalm 16:10; Hosea 6:2)',
       E'John stoops into the empty tomb and *saw, and believed* — and then the honest line: *For as yet they knew not the scripture, that he must rise again from the dead.* (John 20:9). The resurrection was never an afterthought; it was written, and they had simply not yet read it aright. David sang it: *For thou wilt not leave my soul in hell; neither wilt thou suffer thine Holy One to see corruption.* (Psalm 16:10). Hosea named the day: *After two days will he revive us: in the third day he will raise us up, and we shall live in his sight.* (Hosea 6:2). Jonah was the sign in the deep: *Now Yahuah (LORD) had prepared a great fish to swallow up Jonah. And Jonah was in the belly of the fish three days and three nights.* (Jonah 1:17). Isaiah saw life on the far side of the offering: *when thou shalt make his soul an offering for sin, he shall see his seed, he shall prolong his days* (Isaiah 53:10). And the risen Yahusha Himself opened it to them — *Thus it is written... to rise from the dead the third day:* (Luke 24:46) — Peter preached it from Psalm 16: *neither his flesh did see corruption* (Acts 2:31), and the whole gospel stands on it: *he rose again the third day according to the scriptures:* (1 Corinthians 15:4). The library was one, and it was never new; the empty tomb only opened a book already written.',
       sv.verse_id, ev.verse_id, 'free', 15570
  FROM _jn20_lookup sv, _jn20_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=20 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='john' AND ev.chapter_number=20 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'john-20-17-i-ascend-unto-my-father-and-your-father-psalm-22-22',
       E'I ascend unto my Father, and your Father; and to my Elohim, and your Elohim (Psalm 22:22)',
       E'In the garden the risen Yahusha says to Mary: *Touch me not; for I am not yet ascended to my Father: but go to my brethren, and say unto them, I ascend unto my Father, and your Father; and to my Elohim (God), and your Elohim (God).* (John 20:17). Hear the line exactly as He drew it: *my* Father AND *your* Father — *my* Elohim AND *your* Elohim. The Father is the Son''s Elohim too. This is the Formed Son who has a Father — begotten, sent, raised, and now ascending to the One who is the source of all — not a co-equal apart from the Most High, and not a creature, but the firstborn among many brethren who shares the one Father with them. The Suffering One sang this turn from the cross: *I will declare thy name unto my brethren: in the midst of the congregation will I praise thee.* (Psalm 22:22). Ruth''s vow holds the same shared-covenant pattern — the absorbing of one into another''s household and Elohim: *thy people shall be my people, and thy Elohim (God) my Elohim (God):* (Ruth 1:16). And Hebrews lays Psalm 22:22 straight into the risen Son''s mouth, naming the very bond: *For both he that sanctifieth and they who are sanctified are all of one: for which cause he is not ashamed to call them brethren,* (Hebrews 2:11) — *Saying, I will declare thy name unto my brethren, in the midst of the church will I sing praise unto thee.* (Hebrews 2:12). *All of one.* The Son brings many sons to glory and calls them brethren, and the Father He goes to becomes their Father.',
       sv.verse_id, ev.verse_id, 'free', 15573
  FROM _jn20_lookup sv, _jn20_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=20 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='john' AND ev.chapter_number=20 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'john-20-22-he-breathed-on-them-receive-the-ruach-genesis-2-ezekiel-37',
       E'He breathed on them, Receive ye the Ruach HaKodesh (Genesis 2:7; Ezekiel 37:9)',
       E'*As my Father hath sent me, even so send I you.* (John 20:21) — the sent Son now sends, the Father the source of the whole motion. *And when he had said this, he breathed on them, and saith unto them, Receive ye the Ruach HaKodesh (Holy Spirit):* (John 20:22). That breath is no new thing; it is the oldest thing. *And Yahuah Elohim (the LORD God) formed man of the dust of the ground, and breathed into his nostrils the breath of life; and man became a living soul.* (Genesis 2:7) — the second Adam breathing life into a new creation. It is the breath called over the valley of bones: *Come from the four winds, O breath, and breathe upon these slain, that they may live.* (Ezekiel 37:9) — and the promise that breath carries is the two-house gathering: *And shall put my spirit in you, and ye shall live, and I shall place you in your own land* (Ezekiel 37:14), the whole house of Yashar''el (Israel) revived, Yahudah and Ephraim made one stick in His hand. It is the Spirit of the one put upon the many: *and took of the spirit that was upon him, and gave it unto the seventy elders... when the spirit rested upon them, they prophesied* (Numbers 11:25). And what He breathed here came in fulness at Pentecost: *And they were all filled with the Ruach HaKodesh (Holy Spirit)* (Acts 2:4). Genesis breath, Ezekiel breath, Pentecost wind — one Ruach, raising the dead and gathering the scattered home.',
       sv.verse_id, ev.verse_id, 'free', 15576
  FROM _jn20_lookup sv, _jn20_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=20 AND sv.verse_number=19
   AND ev.edition_slug='canon' AND ev.book_slug='john' AND ev.chapter_number=20 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

-- ============================================================
-- 3d. THREAD_MEMBERS
-- ============================================================
-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 16:10 — *For thou wilt not leave my soul in hell; neither wilt thou suffer thine Holy One to see corruption.* The grave could not hold the Holy One.'
  FROM cross_reference_threads t, cross_references x, _jn20_lookup sv, _jn20_lookup tv
 WHERE t.slug='john-20-9-the-scripture-that-he-must-rise-psalm-16-hosea-6'
   AND sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=20 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=16 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hosea 6:2 — *in the third day he will raise us up, and we shall live in his sight.* The third-day raising written into the prophets.'
  FROM cross_reference_threads t, cross_references x, _jn20_lookup sv, _jn20_lookup tv
 WHERE t.slug='john-20-9-the-scripture-that-he-must-rise-psalm-16-hosea-6'
   AND sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=20 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jonah 1:17 — *Jonah was in the belly of the fish three days and three nights.* The sign of Jonah: three days swallowed, three days delivered.'
  FROM cross_reference_threads t, cross_references x, _jn20_lookup sv, _jn20_lookup tv
 WHERE t.slug='john-20-9-the-scripture-that-he-must-rise-psalm-16-hosea-6'
   AND sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=20 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='jonah' AND tv.chapter_number=1 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 53:10 — *he shall see his seed, he shall prolong his days* — the pierced Servant lives on the far side of the offering.'
  FROM cross_reference_threads t, cross_references x, _jn20_lookup sv, _jn20_lookup tv
 WHERE t.slug='john-20-9-the-scripture-that-he-must-rise-psalm-16-hosea-6'
   AND sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=20 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Luke 24:46 — *Thus it is written... to rise from the dead the third day:* the risen One names the scripture they had not yet grasped.'
  FROM cross_reference_threads t, cross_references x, _jn20_lookup sv, _jn20_lookup tv
 WHERE t.slug='john-20-9-the-scripture-that-he-must-rise-psalm-16-hosea-6'
   AND sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=20 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=24 AND tv.verse_number=46
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Acts 2:31 — *neither his flesh did see corruption* — Peter reads Psalm 16 aloud as the resurrection foretold.'
  FROM cross_reference_threads t, cross_references x, _jn20_lookup sv, _jn20_lookup tv
 WHERE t.slug='john-20-9-the-scripture-that-he-must-rise-psalm-16-hosea-6'
   AND sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=20 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=2 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'1 Corinthians 15:4 — *he rose again the third day according to the scriptures:* the gospel anchored in the Tanakh.'
  FROM cross_reference_threads t, cross_references x, _jn20_lookup sv, _jn20_lookup tv
 WHERE t.slug='john-20-9-the-scripture-that-he-must-rise-psalm-16-hosea-6'
   AND sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=20 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 22:22 — *I will declare thy name unto my brethren: in the midst of the congregation will I praise thee.* The Suffering One calls the gathered *my brethren.*'
  FROM cross_reference_threads t, cross_references x, _jn20_lookup sv, _jn20_lookup tv
 WHERE t.slug='john-20-17-i-ascend-unto-my-father-and-your-father-psalm-22-22'
   AND sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=20 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=22 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ruth 1:16 — *thy people shall be my people, and thy Elohim (God) my Elohim (God):* the shared-covenant pattern — His Father becomes their Father, His Elohim their Elohim.'
  FROM cross_reference_threads t, cross_references x, _jn20_lookup sv, _jn20_lookup tv
 WHERE t.slug='john-20-17-i-ascend-unto-my-father-and-your-father-psalm-22-22'
   AND sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=20 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='ruth' AND tv.chapter_number=1 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 2:11 — *he that sanctifieth and they who are sanctified are all of one... he is not ashamed to call them brethren* — the firstborn among many brethren.'
  FROM cross_reference_threads t, cross_references x, _jn20_lookup sv, _jn20_lookup tv
 WHERE t.slug='john-20-17-i-ascend-unto-my-father-and-your-father-psalm-22-22'
   AND sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=20 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=2 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hebrews 2:12 — *I will declare thy name unto my brethren* — Psalm 22:22 laid in the risen Son''s mouth, the *my brethren* of John 20:17.'
  FROM cross_reference_threads t, cross_references x, _jn20_lookup sv, _jn20_lookup tv
 WHERE t.slug='john-20-17-i-ascend-unto-my-father-and-your-father-psalm-22-22'
   AND sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=20 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=2 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:7 — *breathed into his nostrils the breath of life; and man became a living soul.* The second Adam breathing a new creation into being.'
  FROM cross_reference_threads t, cross_references x, _jn20_lookup sv, _jn20_lookup tv
 WHERE t.slug='john-20-22-he-breathed-on-them-receive-the-ruach-genesis-2-ezekiel-37'
   AND sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=20 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 37:9 — *Come from the four winds, O breath, and breathe upon these slain, that they may live.* The breath called over the valley of dry bones.'
  FROM cross_reference_threads t, cross_references x, _jn20_lookup sv, _jn20_lookup tv
 WHERE t.slug='john-20-22-he-breathed-on-them-receive-the-ruach-genesis-2-ezekiel-37'
   AND sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=20 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 37:14 — *And shall put my spirit in you, and ye shall live* — the two-house promise, the whole house of Yashar''el revived and gathered home.'
  FROM cross_reference_threads t, cross_references x, _jn20_lookup sv, _jn20_lookup tv
 WHERE t.slug='john-20-22-he-breathed-on-them-receive-the-ruach-genesis-2-ezekiel-37'
   AND sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=20 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Numbers 11:25 — *took of the spirit that was upon him, and gave it unto the seventy elders... they prophesied* — the Spirit of the one put upon the many.'
  FROM cross_reference_threads t, cross_references x, _jn20_lookup sv, _jn20_lookup tv
 WHERE t.slug='john-20-22-he-breathed-on-them-receive-the-ruach-genesis-2-ezekiel-37'
   AND sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=20 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=11 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Acts 2:4 — *they were all filled with the Ruach HaKodesh (Holy Spirit)* — what the risen Son breathed came in fulness at Pentecost.'
  FROM cross_reference_threads t, cross_references x, _jn20_lookup sv, _jn20_lookup tv
 WHERE t.slug='john-20-22-he-breathed-on-them-receive-the-ruach-genesis-2-ezekiel-37'
   AND sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=20 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session260 — John (depth) cross-references complete.'
