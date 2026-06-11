-- ----- fragment: minion_jubilees_18.sql (session251 jubilees 18) -----
-- Source anchor: jubilees/jubilees ch18. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ju18 (view _session251_ju18_lookup). Sort band base 53425, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session251_ju18_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jubilees-18-take-thy-son
  ('jubilees', 'jubilees', 18, 1, 'canon', 'genesis', 22, 2, 'free', E'Genesis 22:2 — *And he said, Take now thy son, thine only son Isaac, whom thou lovest, and get thee into the land of Moriah; and offer him there for a burnt offering upon one of the mountains which I will tell thee of.* The command Jubilees 18:1 retells — the beloved son offered on a mountain Elohim will point out — is the very word of Genesis.'),
  ('jubilees', 'jubilees', 18, 3, 'canon', 'genesis', 22, 3, 'free', E'Genesis 22:3 — *And Abraham rose up early in the morning, and saddled his ass, and took two of his young men with him, and Isaac his son, and clave the wood for the burnt offering, and rose up, and went unto the place of which Elohim (God) had told him.* Jubilees 18:3 reproduces the obedience down to the saddled ass and the clave wood — the patriarch keeps the Torah account exactly.'),
  ('jubilees', 'jubilees', 18, 7, 'canon', 'genesis', 22, 8, 'free', E'Genesis 22:8 — *And Abraham said, My son, Elohim (God) will provide himself a lamb for a burnt offering: so they went both of them together.* Abraham''s answer in Jubilees 18:7 is the Torah''s faith — Elohim Himself will provide the offering.'),
  -- thread: jubilees-18-mastema-provokes
  ('jubilees', 'jubilees', 18, 9, 'canon', 'job', 1, 6, 'free', E'Job 1:6 — *Now there was a day when the sons of Elohim (God) came to present themselves before Yahuah (LORD), and Satan came also among them.* The prince of the Mastema standing before Yahuah in Jubilees 18:9 is the same accuser of Job — present at the throne, provoking the test of the upright.'),
  ('jubilees', 'jubilees', 18, 12, 'canon', 'job', 1, 12, 'free', E'Job 1:12 — *And Yahuah (LORD) said unto Satan, Behold, all that he hath is in thy power; only upon himself put not forth thine hand. So Satan went forth from the presence of Yahuah (LORD).* The accuser is granted the test but bounded by Yahuah — and like the satan of Job, the Mastema of Jubilees 18:12 is put to shame when the righteous endures.'),
  ('jubilees', 'jubilees', 18, 11, 'canon', 'genesis', 22, 12, 'free', E'Genesis 22:12 — *And he said, Lay not thine hand upon the lad, neither do thou any thing unto him: for now I know that thou fearest Elohim (God), seeing thou hast not withheld thy son, thine only son from me.* The heavenly voice in Jubilees 18:11 is verbatim Genesis — the staying hand and the proof of the fear of Elohim.'),
  -- thread: jubilees-18-ram-in-the-thicket
  ('jubilees', 'jubilees', 18, 12, 'canon', 'genesis', 22, 13, 'free', E'Genesis 22:13 — *And Abraham lifted up his eyes, and looked, and behold behind him a ram caught in a thicket by his horns: and Abraham went and took the ram, and offered him up for a burnt offering in the stead of his son.* The ram offered in the son''s stead in Jubilees 18:12 is the Torah''s substitute, word for word.'),
  ('jubilees', 'jubilees', 18, 12, 'canon', 'genesis', 22, 14, 'free', E'Genesis 22:14 — *And Abraham called the name of that place Yahuah Yireh (Jehovah-jireh): as it is said to this day, In the mount of Yahuah (LORD) it shall be seen.* Jubilees 18:12 names the same place — “Yahuah has seen” — and locates it as Mount Sion, the mountain of provision.'),
  -- thread: jubilees-18-by-myself-have-i-sworn
  ('jubilees', 'jubilees', 18, 14, 'canon', 'genesis', 22, 16, 'free', E'Genesis 22:16 — *And said, By myself have I sworn, saith Yahuah (LORD), for because thou hast done this thing, and hast not withheld thy son, thine only son:* The self-sworn oath of Jubilees 18:14 is the Torah''s own — Yahuah binds Himself because the son was not withheld.'),
  ('jubilees', 'jubilees', 18, 14, 'canon', 'genesis', 22, 17, 'free', E'Genesis 22:17 — *That in blessing I will bless thee, and in multiplying I will multiply thy seed as the stars of the heaven, and as the sand which is upon the sea shore; and thy seed shall possess the gate of his enemies;* The seed multiplied as the stars and the sand in Jubilees 18:14 is the Genesis oath verbatim — the covenant kept in the fathers.'),
  ('jubilees', 'jubilees', 18, 16, 'canon', 'genesis', 22, 18, 'free', E'Genesis 22:18 — *And in thy seed shall all the nations of the earth be blessed; because thou hast obeyed my voice.* Jubilees 18:16 carries the all-nations blessing in the seed unchanged — the covenant taproot, conditioned on obedience.'),
  -- thread: jubilees-18-faith-made-perfect
  ('jubilees', 'jubilees', 18, 7, 'canon', 'james', 2, 21, 'free', E'James 2:21 — *Was not Abraham our father justified by works, when he had offered Isaac his son upon the altar?* The altar-offering of Jubilees 18:7 is James''s proof that Abraham was justified by works, not faith alone.'),
  ('jubilees', 'jubilees', 18, 11, 'canon', 'james', 2, 22, 'free', E'James 2:22 — *Seest thou how faith wrought with his works, and by works was faith made perfect?* The testing in Jubilees 18 is exactly this — faith and deed made one, faith perfected in the offering.'),
  ('jubilees', 'jubilees', 18, 7, 'canon', 'hebrews', 11, 17, 'free', E'Hebrews 11:17 — *By faith Abraham, when he was tried, offered up Isaac: and he that had received the promises offered up his only begotten son,* The offered son of Jubilees 18:7 is Hebrews'' first witness of tried faith — the one who had the promise yet offered the heir.'),
  ('jubilees', 'jubilees', 18, 11, 'canon', 'hebrews', 11, 19, 'free', E'Hebrews 11:19 — *Accounting that Elohim (God) was able to raise him up, even from the dead; from whence also he received him in a figure.* The son spared in Jubilees 18:11 is, for Hebrews, received back as a figure of resurrection — the faith that reckons Elohim able to raise the dead.'),
  -- thread: jubilees-18-festival-seven-days
  ('jubilees', 'jubilees', 18, 18, 'canon', 'leviticus', 23, 34, 'free', E'Leviticus 23:34 — *Speak unto the children of Yashar''el (Israel), saying, The fifteenth day of this seventh month shall be the feast of tabernacles for seven days unto Yahuah (LORD).* The seven-day festival of joy Abraham keeps in Jubilees 18:18 follows the Torah''s own seven-day pattern of the appointed feast.'),
  ('jubilees', 'jubilees', 18, 19, 'canon', 'leviticus', 23, 41, 'free', E'Leviticus 23:41 — *And ye shall keep it a feast unto Yahuah (LORD) seven days in the year. It shall be a statute for ever in your generations: ye shall celebrate it in the seventh month.* The everlasting ordinance for Israel in Jubilees 18:19 — written on the heavenly tables — is the Torah''s statute for ever.'),
  ('jubilees', 'jubilees', 18, 19, 'jubilees', 'jubilees', 16, 21, 'extras', E'Jubilees 16:21 — *And he built booths for himself and for his servants on this festival, and he was the first to celebrate the feast of tabernacles on the earth.* Two chapters back Abraham already kept the seven-day feast before Sinai — the festival ordained on the heavenly tables in Jubilees 18:19 is no late invention but a patriarch''s practice.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session251_ju18_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session251_ju18_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-18-take-thy-son',
       E'Take your beloved son — the Akedah retold from Genesis 22',
       E'Jubilees opens the binding of Isaac word for word with Genesis: *And He said, “Take your beloved son whom you love, (even) Isaac, and go to the high country, and offer him on one of the mountains which I will point out to you.”* (Jubilees 18:1). This is the same command Moses recorded — *And he said, Take now thy son, thine only son Isaac, whom thou lovest, and get thee into the land of Moriah; and offer him there for a burnt offering upon one of the mountains which I will tell thee of.* (Genesis 22:2). Jubilees follows the Genesis account step by step — the saddled ass, the two young men, the wood clave for the burnt-offering, the third day (Jubilees 18:3 / Genesis 22:3-4) — and reaches the unbearable question of the son who carries the wood for his own offering: *Behold the fire, and the knife, and the wood; but where is the sheep for the burnt-offering, father?* (Jubilees 18:6), answered by the father''s faith — *Elohim (God) will provide for himself a sheep for a burnt-offering, my son.* (Jubilees 18:7) — exactly as Genesis tells it (Genesis 22:7-8). It ain''t new: the patriarch''s testing is the Torah''s, carried unchanged on the heavenly tables.',
       sv.verse_id, ev.verse_id, 'extras', 53425
  FROM _session251_ju18_lookup sv, _session251_ju18_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=18 AND sv.verse_number=1
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=18 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-18-mastema-provokes',
       E'The prince of the Mastema put to shame — the satan provoking the test',
       E'Where Genesis 22 simply says Elohim *did tempt Abraham* (Genesis 22:1), Jubilees names the accuser standing behind the trial: *And I stood before him, and before the prince of the Mastêmâ, and Yahuah (God) said, “Bid him not to lay his hand on the lad, nor to do anything to him, for I have shown that he fears Yahuah (God).”* (Jubilees 18:9), and at the rescue *the prince of the Mastêmâ was put to shame* (Jubilees 18:12). This is the courtroom of Job: *Now there was a day when the sons of Elohim (God) came to present themselves before Yahuah (LORD), and Satan came also among them.* (Job 1:6) — the accuser who provokes the testing of the righteous, given leave but no last word: *And Yahuah (LORD) said unto Satan, Behold, all that he hath is in thy power; only upon himself put not forth thine hand.* (Job 1:12). Mastema, like the satan in Job, is the provoker; Yahuah is the One who shows the man''s fear and shames the accuser. The voice from heaven seals it — *now I have shown that you fear Yahuah (God), and have not withheld your son* (Jubilees 18:11) — echoing *now I know that thou fearest Elohim (God), seeing thou hast not withheld thy son* (Genesis 22:12).',
       sv.verse_id, ev.verse_id, 'extras', 53428
  FROM _session251_ju18_lookup sv, _session251_ju18_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=18 AND sv.verse_number=9
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=18 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-18-ram-in-the-thicket',
       E'A single ram caught by his horns — Yahuah-Yireh on Mount Sion',
       E'The provision answers the father''s faith: *Abraham lifted up his eyes and looked, and, behold, a single ram caught … by his horns, and Abraham went and took the ram and offered it for a burnt-offering in the stead of his son.* (Jubilees 18:12). This is Genesis exactly — *And Abraham lifted up his eyes, and looked, and behold behind him a ram caught in a thicket by his horns: and Abraham went and took the ram, and offered him up for a burnt offering in the stead of his son.* (Genesis 22:13). And the place is named for the seeing of Yahuah — *And Abraham called the name of that place Yahuah Yireh (Jehovah-jireh): as it is said to this day, In the mount of Yahuah (LORD) it shall be seen.* (Genesis 22:14) — which Jubilees identifies for the reader: *Abraham called that place “Yahuah (God) has seen” … that is Mount Sion.* (Jubilees 18:12). The substitute offered in the son''s stead, on the mountain where Yahuah provides, is the Torah''s own picture, carried whole.',
       sv.verse_id, ev.verse_id, 'extras', 53431
  FROM _session251_ju18_lookup sv, _session251_ju18_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=18 AND sv.verse_number=12
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=18 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-18-by-myself-have-i-sworn',
       E'By Myself have I sworn — the seed-oath multiplied as the stars',
       E'Because Abraham did not withhold his son, the oath descends from heaven a second time: *By Myself have I sworn, says Yahuah (God), Because you have done this thing, And have not withheld your son, your beloved son, from Me, That in blessing I shall bless you And in multiplying I shall multiply your seed As the stars of heaven, And as the sand which is on the seashore.* (Jubilees 18:14), and *in your seed will all nations of the earth be blessed; Because you have obeyed My voice* (Jubilees 18:16). Jubilees carries the Genesis oath unchanged — *By myself have I sworn, saith Yahuah (LORD) … That in blessing I will bless thee, and in multiplying I will multiply thy seed as the stars of the heaven, and as the sand which is upon the sea shore* (Genesis 22:16-17), *And in thy seed shall all the nations of the earth be blessed; because thou hast obeyed my voice.* (Genesis 22:18). The promise that all nations are blessed in the seed is the covenant taproot — the same multiplied, separated seed Jubilees grounds in the patriarchs and writes on the heavenly tables.',
       sv.verse_id, ev.verse_id, 'extras', 53434
  FROM _session251_ju18_lookup sv, _session251_ju18_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=18 AND sv.verse_number=14
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=18 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-18-faith-made-perfect',
       E'Faith made perfect by works — Abraham justified, the offered son',
       E'The Akedah is the New Testament''s chief proof that living faith acts. Jubilees frames it as the testing in which the man''s faith is shown by deed — he *bound Isaac his son, and placed him on the wood … and stretched forth his hand to take the knife* (Jubilees 18:7), and only then heaven declares *now I have shown that you fear Yahuah (God), and have not withheld your son* (Jubilees 18:11). James reads this same scene as faith working with works: *Was not Abraham our father justified by works, when he had offered Isaac his son upon the altar? Seest thou how faith wrought with his works, and by works was faith made perfect?* (James 2:21-22), *And the scripture was fulfilled which saith, Abraham believed Elohim (God), and it was imputed unto him for righteousness: and he was called the Friend of Elohim (God).* (James 2:23). And Hebrews reads it as resurrection-faith: *By faith Abraham, when he was tried, offered up Isaac … Accounting that Elohim (God) was able to raise him up, even from the dead; from whence also he received him in a figure.* (Hebrews 11:17,19). Jubilees, James, and Hebrews stand together — the testing of Abraham is faith and works made one, and it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53437
  FROM _session251_ju18_lookup sv, _session251_ju18_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=18 AND sv.verse_number=7
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=18 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-18-festival-seven-days',
       E'A festival kept seven days — ordained on the heavenly tables',
       E'Jubilees does what Genesis does not: it turns the Akedah into a feast. *And he celebrated this festival every year, seven days with joy, and he called it the festival of Yahuah (God) according to the seven days during which he went and returned in peace.* (Jubilees 18:18), *And accordingly has it been ordained and written on the heavenly tables regarding Yashar’el (Israel) and its seed that they should observe this festival seven days with the joy of festival.* (Jubilees 18:19). This is the spine of Jubilees — the appointed times are ancient, kept by the fathers, engraved on the heavenly tablets, not later inventions. The seven-day feast of joy is the Torah''s own pattern — *The fifteenth day of this seventh month shall be the feast of tabernacles for seven days unto Yahuah (LORD).* (Leviticus 23:34), *And ye shall keep it a feast unto Yahuah (LORD) seven days in the year. It shall be a statute for ever in your generations* (Leviticus 23:41) — and Jubilees has already shown Abraham keeping that very feast before Sinai: *he was the first to celebrate the feast of tabernacles on the earth* (Jubilees 16:21). The fathers kept the appointed times; the tablets hold them eternal. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53440
  FROM _session251_ju18_lookup sv, _session251_ju18_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=18 AND sv.verse_number=18
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=18 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jubilees-18-take-thy-son
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 22:2 — *And he said, Take now thy son, thine only son Isaac, whom thou lovest, and get thee into the land of Moriah; and offer him there for a burnt offering upon one of the mountains which I will tell thee of.* The command Jubilees 18:1 retells — the beloved son offered on a mountain Elohim will point out — is the very word of Genesis.'
  FROM cross_reference_threads t, cross_references x, _session251_ju18_lookup sv, _session251_ju18_lookup tv
 WHERE t.slug='jubilees-18-take-thy-son'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=18 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 22:3 — *And Abraham rose up early in the morning, and saddled his ass, and took two of his young men with him, and Isaac his son, and clave the wood for the burnt offering, and rose up, and went unto the place of which Elohim (God) had told him.* Jubilees 18:3 reproduces the obedience down to the saddled ass and the clave wood — the patriarch keeps the Torah account exactly.'
  FROM cross_reference_threads t, cross_references x, _session251_ju18_lookup sv, _session251_ju18_lookup tv
 WHERE t.slug='jubilees-18-take-thy-son'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=18 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 22:8 — *And Abraham said, My son, Elohim (God) will provide himself a lamb for a burnt offering: so they went both of them together.* Abraham''s answer in Jubilees 18:7 is the Torah''s faith — Elohim Himself will provide the offering.'
  FROM cross_reference_threads t, cross_references x, _session251_ju18_lookup sv, _session251_ju18_lookup tv
 WHERE t.slug='jubilees-18-take-thy-son'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=18 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-18-mastema-provokes
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Job 1:6 — *Now there was a day when the sons of Elohim (God) came to present themselves before Yahuah (LORD), and Satan came also among them.* The prince of the Mastema standing before Yahuah in Jubilees 18:9 is the same accuser of Job — present at the throne, provoking the test of the upright.'
  FROM cross_reference_threads t, cross_references x, _session251_ju18_lookup sv, _session251_ju18_lookup tv
 WHERE t.slug='jubilees-18-mastema-provokes'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=18 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Job 1:12 — *And Yahuah (LORD) said unto Satan, Behold, all that he hath is in thy power; only upon himself put not forth thine hand. So Satan went forth from the presence of Yahuah (LORD).* The accuser is granted the test but bounded by Yahuah — and like the satan of Job, the Mastema of Jubilees 18:12 is put to shame when the righteous endures.'
  FROM cross_reference_threads t, cross_references x, _session251_ju18_lookup sv, _session251_ju18_lookup tv
 WHERE t.slug='jubilees-18-mastema-provokes'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=18 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=1 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 22:12 — *And he said, Lay not thine hand upon the lad, neither do thou any thing unto him: for now I know that thou fearest Elohim (God), seeing thou hast not withheld thy son, thine only son from me.* The heavenly voice in Jubilees 18:11 is verbatim Genesis — the staying hand and the proof of the fear of Elohim.'
  FROM cross_reference_threads t, cross_references x, _session251_ju18_lookup sv, _session251_ju18_lookup tv
 WHERE t.slug='jubilees-18-mastema-provokes'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=18 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-18-ram-in-the-thicket
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 22:13 — *And Abraham lifted up his eyes, and looked, and behold behind him a ram caught in a thicket by his horns: and Abraham went and took the ram, and offered him up for a burnt offering in the stead of his son.* The ram offered in the son''s stead in Jubilees 18:12 is the Torah''s substitute, word for word.'
  FROM cross_reference_threads t, cross_references x, _session251_ju18_lookup sv, _session251_ju18_lookup tv
 WHERE t.slug='jubilees-18-ram-in-the-thicket'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=18 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 22:14 — *And Abraham called the name of that place Yahuah Yireh (Jehovah-jireh): as it is said to this day, In the mount of Yahuah (LORD) it shall be seen.* Jubilees 18:12 names the same place — “Yahuah has seen” — and locates it as Mount Sion, the mountain of provision.'
  FROM cross_reference_threads t, cross_references x, _session251_ju18_lookup sv, _session251_ju18_lookup tv
 WHERE t.slug='jubilees-18-ram-in-the-thicket'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=18 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-18-by-myself-have-i-sworn
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 22:16 — *And said, By myself have I sworn, saith Yahuah (LORD), for because thou hast done this thing, and hast not withheld thy son, thine only son:* The self-sworn oath of Jubilees 18:14 is the Torah''s own — Yahuah binds Himself because the son was not withheld.'
  FROM cross_reference_threads t, cross_references x, _session251_ju18_lookup sv, _session251_ju18_lookup tv
 WHERE t.slug='jubilees-18-by-myself-have-i-sworn'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=18 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 22:17 — *That in blessing I will bless thee, and in multiplying I will multiply thy seed as the stars of the heaven, and as the sand which is upon the sea shore; and thy seed shall possess the gate of his enemies;* The seed multiplied as the stars and the sand in Jubilees 18:14 is the Genesis oath verbatim — the covenant kept in the fathers.'
  FROM cross_reference_threads t, cross_references x, _session251_ju18_lookup sv, _session251_ju18_lookup tv
 WHERE t.slug='jubilees-18-by-myself-have-i-sworn'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=18 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 22:18 — *And in thy seed shall all the nations of the earth be blessed; because thou hast obeyed my voice.* Jubilees 18:16 carries the all-nations blessing in the seed unchanged — the covenant taproot, conditioned on obedience.'
  FROM cross_reference_threads t, cross_references x, _session251_ju18_lookup sv, _session251_ju18_lookup tv
 WHERE t.slug='jubilees-18-by-myself-have-i-sworn'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=18 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-18-faith-made-perfect
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'James 2:21 — *Was not Abraham our father justified by works, when he had offered Isaac his son upon the altar?* The altar-offering of Jubilees 18:7 is James''s proof that Abraham was justified by works, not faith alone.'
  FROM cross_reference_threads t, cross_references x, _session251_ju18_lookup sv, _session251_ju18_lookup tv
 WHERE t.slug='jubilees-18-faith-made-perfect'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=18 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=2 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'James 2:22 — *Seest thou how faith wrought with his works, and by works was faith made perfect?* The testing in Jubilees 18 is exactly this — faith and deed made one, faith perfected in the offering.'
  FROM cross_reference_threads t, cross_references x, _session251_ju18_lookup sv, _session251_ju18_lookup tv
 WHERE t.slug='jubilees-18-faith-made-perfect'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=18 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=2 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 11:17 — *By faith Abraham, when he was tried, offered up Isaac: and he that had received the promises offered up his only begotten son,* The offered son of Jubilees 18:7 is Hebrews'' first witness of tried faith — the one who had the promise yet offered the heir.'
  FROM cross_reference_threads t, cross_references x, _session251_ju18_lookup sv, _session251_ju18_lookup tv
 WHERE t.slug='jubilees-18-faith-made-perfect'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=18 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hebrews 11:19 — *Accounting that Elohim (God) was able to raise him up, even from the dead; from whence also he received him in a figure.* The son spared in Jubilees 18:11 is, for Hebrews, received back as a figure of resurrection — the faith that reckons Elohim able to raise the dead.'
  FROM cross_reference_threads t, cross_references x, _session251_ju18_lookup sv, _session251_ju18_lookup tv
 WHERE t.slug='jubilees-18-faith-made-perfect'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=18 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-18-festival-seven-days
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 23:34 — *Speak unto the children of Yashar''el (Israel), saying, The fifteenth day of this seventh month shall be the feast of tabernacles for seven days unto Yahuah (LORD).* The seven-day festival of joy Abraham keeps in Jubilees 18:18 follows the Torah''s own seven-day pattern of the appointed feast.'
  FROM cross_reference_threads t, cross_references x, _session251_ju18_lookup sv, _session251_ju18_lookup tv
 WHERE t.slug='jubilees-18-festival-seven-days'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=18 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 23:41 — *And ye shall keep it a feast unto Yahuah (LORD) seven days in the year. It shall be a statute for ever in your generations: ye shall celebrate it in the seventh month.* The everlasting ordinance for Israel in Jubilees 18:19 — written on the heavenly tables — is the Torah''s statute for ever.'
  FROM cross_reference_threads t, cross_references x, _session251_ju18_lookup sv, _session251_ju18_lookup tv
 WHERE t.slug='jubilees-18-festival-seven-days'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=18 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=41
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 16:21 — *And he built booths for himself and for his servants on this festival, and he was the first to celebrate the feast of tabernacles on the earth.* Two chapters back Abraham already kept the seven-day feast before Sinai — the festival ordained on the heavenly tables in Jubilees 18:19 is no late invention but a patriarch''s practice.'
  FROM cross_reference_threads t, cross_references x, _session251_ju18_lookup sv, _session251_ju18_lookup tv
 WHERE t.slug='jubilees-18-festival-seven-days'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=18 AND sv.verse_number=19
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=16 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

