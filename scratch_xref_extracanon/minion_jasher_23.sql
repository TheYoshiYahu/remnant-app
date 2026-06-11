-- ----- fragment: minion_jasher_23.sql (session252 jasher 23) -----
-- Source anchor: jasher/jasher ch23. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja23 (view _session252_ja23_lookup). Sort band base 55550, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja23_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-23-the-command-to-offer-isaac
  ('jasher', 'jasher', 23, 2, 'canon', 'genesis', 22, 2, 'free', E'Genesis 22:2 — *And he said, Take now thy son, thine only son Isaac, whom thou lovest, and get thee into the land of Moriah; and offer him there for a burnt offering upon one of the mountains which I will tell thee of.* Jasher 23:2 carries the Moriah command of Genesis verbatim, naming the same only-son and the same mountains shown to Abraham.'),
  ('jasher', 'jasher', 23, 1, 'canon', 'genesis', 22, 1, 'free', E'Genesis 22:1 — *And it came to pass after these things, that Elohim (God) did tempt Abraham, and said unto him, Abraham: and he said, Behold, here I am.* Jasher 23:1 opens the same testing with the same call and the same answer, ''Here I am,'' beginning the Akedah.'),
  ('jasher', 'jasher', 23, 1, 'jubilees', 'jubilees', 18, 1, 'extras', E'Jubilees 18:1 — *And Elohim (God) said to him, “Abraham, Abraham”; and he said, “Behold, (here) am I.” . And He said, “Take your beloved son whom you love, (even) Isaac, and go to the high country, and offer him on one of the mountains which I will point out to you.”* Jubilees retells the identical command Jasher records, the same patriarchal event in the live self-linked apparatus.'),
  -- thread: jasher-23-satan-tempts-on-the-road
  ('jasher', 'jasher', 23, 38, 'canon', 'zechariah', 3, 2, 'free', E'Zechariah 3:2 — *And Yahuah (LORD) said unto Satan, Yahuah (LORD) rebuke thee, O Satan; even Yahuah (LORD) that hath chosen Jerusalem rebuke thee: is not this a brand plucked out of the fire?* Abraham''s rebuke in Jasher 23:38 echoes the very formula by which the adversary is silenced in the canon.'),
  ('jasher', 'jasher', 23, 25, 'canon', 'matthew', 4, 10, 'free', E'Matthew 4:10 — *Then saith Yahusha (Jesus) unto him, Get thee hence, Satan: for it is written, Thou shalt worship Yahuah thy Elohim (the Lord thy God), and him only shalt thou serve.* As the adversary tempts Abraham aside from the command in Jasher 23:25, so the Messiah turns the same tempter away with the word — the chosen seed will not be drawn aside.'),
  ('jasher', 'jasher', 23, 33, 'jubilees', 'jubilees', 18, 12, 'extras', E'Jubilees 18:12 — *And the prince of the Mastêmâ was put to shame; and Abraham lifted up his eyes and looked, and, behold, a single ram caught … by his horns...* Jubilees gives the adversary Jasher calls Satan the name Mastema, and shows him shamed at the same altar where Abraham resists him in Jasher 23:33.'),
  -- thread: jasher-23-elohim-will-provide-the-lamb
  ('jasher', 'jasher', 23, 50, 'canon', 'genesis', 22, 7, 'free', E'Genesis 22:7 — *And Isaac spake unto Abraham his father, and said, My father: and he said, Here am I, my son. And he said, Behold the fire and the wood: but where is the lamb for a burnt offering?* Jasher 23:50 records Isaac''s identical question on the mount, the fire and the wood and the missing lamb.'),
  ('jasher', 'jasher', 23, 70, 'canon', 'genesis', 22, 13, 'free', E'Genesis 22:13 — *And Abraham lifted up his eyes, and looked, and behold behind him a ram caught in a thicket by his horns: and Abraham went and took the ram, and offered him up for a burnt offering in the stead of his son.* The provided ram of Jasher 23:70 is the same thicket-caught substitute Genesis names, offered in Isaac''s stead.'),
  ('jasher', 'jasher', 23, 51, 'canon', 'john', 1, 29, 'free', E'John 1:29 — *The next day John seeth Yahusha (Jesus) coming unto him, and saith, Behold the Lamb of Elohim (God), which taketh away the sin of the world.* The provided burnt offering in place of Isaac (Jasher 23:51) foreshadows the Lamb of Elohim John points to.'),
  -- thread: jasher-23-bound-on-the-altar
  ('jasher', 'jasher', 23, 65, 'canon', 'genesis', 22, 9, 'free', E'Genesis 22:9 — *And they came to the place which Elohim (God) had told him of; and Abraham built an altar there, and laid the wood in order, and bound Isaac his son, and laid him on the altar upon the wood.* Jasher 23:65 expands the same binding Genesis records, Isaac laid on the wood upon the altar.'),
  ('jasher', 'jasher', 23, 65, 'canon', 'james', 2, 21, 'free', E'James 2:21 — *Was not Abraham our father justified by works, when he had offered Isaac his son upon the altar?* The binding in Jasher 23:65 is the very work by which James says Abraham was justified — faith made perfect in the offering.'),
  ('jasher', 'jasher', 23, 56, 'canon', 'hebrews', 11, 17, 'free', E'Hebrews 11:17 — *By faith Abraham, when he was tried, offered up Isaac: and he that had received the promises offered up his only begotten son,* Isaac''s joyful consent to be the offering in Jasher 23:56 is the faith Hebrews credits to Abraham, the trial of the only begotten son.'),
  -- thread: jasher-23-now-i-know-that-you-fear-elohim
  ('jasher', 'jasher', 23, 69, 'canon', 'genesis', 22, 12, 'free', E'Genesis 22:12 — *And he said, Lay not thine hand upon the lad, neither do thou any thing unto him: for now I know that thou fearest Elohim (God), seeing thou hast not withheld thy son, thine only son from me.* Jasher 23:69 carries heaven''s staying word verbatim, the fear of Elohim proven in the unwithheld son.'),
  ('jasher', 'jasher', 23, 75, 'canon', 'genesis', 22, 17, 'free', E'Genesis 22:17 — *That in blessing I will bless thee, and in multiplying I will multiply thy seed as the stars of the heaven, and as the sand which is upon the sea shore; and thy seed shall possess the gate of his enemies;* The blessing of Abraham and his seed in Jasher 23:75 is the sworn covenant blessing Genesis pronounces after the binding.'),
  ('jasher', 'jasher', 23, 75, 'canon', 'romans', 4, 21, 'free', E'Romans 4:21 — *And being fully persuaded that, what he had promised, he was able also to perform.* Abraham''s accepted offering and blessed seed in Jasher 23:75 embody the persuaded faith Paul counts to him for righteousness.'),
  ('jasher', 'jasher', 23, 70, 'jubilees', 'jubilees', 18, 18, 'extras', E'Jubilees 18:18 — *And he celebrated this festival every year, seven days with joy, and he called it the festival of Yahuah (God) according to the seven days during which he went and returned in peace.* Jubilees turns the same accepted offering of Jasher 23:70 into an ordained seven-day feast — Torah-before-Sinai, the fathers keeping the appointed time.'),
  -- thread: jasher-23-the-death-of-sarah
  ('jasher', 'jasher', 23, 89, 'canon', 'genesis', 23, 2, 'free', E'Genesis 23:2 — *And Sarah died in Kirjath-arba; the same is Hebron in the land of Canaan: and Abraham came to mourn for Sarah, and to weep for her.* Jasher 23:89 records the same death at Hebron and the same weeping of Abraham over Sarah.'),
  ('jasher', 'jasher', 23, 86, 'canon', 'genesis', 23, 1, 'free', E'Genesis 23:1 — *And Sarah was an hundred and seven and twenty years old: these were the years of the life of Sarah.* The death of Sarah in Jasher 23:86 closes the same span of years Genesis numbers for the mother of the promised seed.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja23_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja23_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-23-the-command-to-offer-isaac',
       E'Take now your son, your only son Isaac',
       E'Jasher opens the Akedah word-for-word with the canon: *At that time the word of Yahuah (the Lord) came to Abraham... Take now your son, your only son whom you love, even Isaac, and go to the land of Moriah, and offer him there for a burnt offering upon one of the mountains which shall be shown to you* (Jasher 23:1-2). This is Genesis spoken again — *And he said, Take now thy son, thine only son Isaac, whom thou lovest, and get thee into the land of Moriah; and offer him there for a burnt offering upon one of the mountains which I will tell thee of* (Genesis 22:2). Jubilees narrates the very same command — *And He said, ''Take your beloved son whom you love, (even) Isaac, and go to the high country, and offer him on one of the mountains which I will point out to you.''* (Jubilees 18:1). It ain''t new: the testing of Abraham was already written, the same scene carried in three witnesses. The seed of promise himself is laid on the altar — election held in the fire.',
       sv.verse_id, ev.verse_id, 'extras', 55550
  FROM _session252_ja23_lookup sv, _session252_ja23_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=23 AND sv.verse_number=1
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=23 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-23-satan-tempts-on-the-road',
       E'Satan in the way — the adversary who could not prevail',
       E'Where Genesis is silent on the journey, Jasher adds the legendary detail of the adversary: *Satan came and appeared to Abraham in the figure of a very aged man... Are you silly or brutish, that you go to do this thing this day to your only son?* (Jasher 23:25), and Abraham answers his son, *Take heed of him and do not listen to his words... for he is Satan, endeavoring to draw us aside this day from the commands of Elohim* (Jasher 23:33). When the adversary becomes a flooding brook to bar the way, Abraham rebukes him — *Yahuah (the Lord) rebuke you, O Satan, begone from us for we go by the commands of Elohim* (Jasher 23:38). The canon parallel for the rebuke is exact: *And said unto Satan, Yahuah (LORD) rebuke thee, O Satan* (Zechariah 3:2). Jubilees names this same adversary the prince of Mastema, put to shame at the altar — *And the prince of the Mastêmâ was put to shame* (Jubilees 18:12). The kingdom-of-darkness that opposes the chosen seed is dismantled by the Name, not by Abraham''s own strength.',
       sv.verse_id, ev.verse_id, 'extras', 55553
  FROM _session252_ja23_lookup sv, _session252_ja23_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=23 AND sv.verse_number=25
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=23 AND ev.verse_number=38
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-23-elohim-will-provide-the-lamb',
       E'Where is the lamb? — Elohim provides Himself an offering',
       E'On the mount Isaac asks the question the whole Torah leans toward: *Behold, I see here the fire and wood, and where then is the lamb that is to be the burnt offering before Yahuah (the Lord)?* (Jasher 23:50). Genesis records the same exchange — *Behold the fire and the wood: but where is the lamb for a burnt offering?* (Genesis 22:7) — and answers it: *My son, Elohim (God) will provide himself a lamb for a burnt offering* (Genesis 22:8). The provided ram comes — *And Abraham lifted up his eyes and saw, and behold, a ram was caught in a thicket by his horns* (Jasher 23:70), word for word the canon''s *behold behind him a ram caught in a thicket by his horns* (Genesis 22:13). The lamb provided on Moriah opens onto the Lamb of Elohim — *Behold the Lamb of Elohim (God), which taketh away the sin of the world* (John 1:29). It ain''t new: the substitute prepared from the foundation was already written into the binding of Isaac.',
       sv.verse_id, ev.verse_id, 'extras', 55556
  FROM _session252_ja23_lookup sv, _session252_ja23_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=23 AND sv.verse_number=50
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=23 AND ev.verse_number=71
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-23-bound-on-the-altar',
       E'Bound on the wood — the willing offering',
       E'Jasher dwells on the binding with detail the canon leaves implicit: *And Abraham bound his son Isaac, and placed him on the altar upon the wood, and Isaac stretched forth his neck upon the altar before his father, and Abraham stretched forth his hand to take the knife to slay his son as a burnt offering before Yahuah (the Lord)* (Jasher 23:65). Genesis compresses the same act — *and bound Isaac his son, and laid him on the altar upon the wood. And Abraham stretched forth his hand, and took the knife to slay his son* (Genesis 22:9-10). Isaac is no unwilling victim; he asks to be bound securely and rejoices, *Blessed is Yahuah (the Lord) who has this day chosen me to be a burnt offering before Him* (Jasher 23:56). This is the faith the apostle names — *Was not Abraham our father justified by works, when he had offered Isaac his son upon the altar?* (James 2:21). Faith and works are one act on the altar; Torah-before-Sinai stands.',
       sv.verse_id, ev.verse_id, 'extras', 55559
  FROM _session252_ja23_lookup sv, _session252_ja23_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=23 AND sv.verse_number=56
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=23 AND ev.verse_number=65
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-23-now-i-know-that-you-fear-elohim',
       E'Lay not your hand upon the lad — faith counted, blessing sworn',
       E'Heaven stays the knife in the canon''s own words: *Yahuah (the Lord) appeared to Abraham, and called to him, from heaven, and said to him, Lay not your hand upon the lad, neither do you any thing to him, for now I know that you fear Elohim in performing this act, and in not withholding your son, your only son, from me* (Jasher 23:69). Genesis is identical — *Lay not thine hand upon the lad... for now I know that thou fearest Elohim (God), seeing thou hast not withheld thy son, thine only son from me* (Genesis 22:12). Then the service is accepted and *Yahuah (the Lord) blessed Abraham and his seed on that day* (Jasher 23:75) — the sworn blessing of Genesis, *That in blessing I will bless thee, and in multiplying I will multiply thy seed as the stars of the heaven* (Genesis 22:17). This is the faith counted righteous the apostle preaches — *being fully persuaded that, what he had promised, he was able also to perform* (Romans 4:21). Election precedes the obedience and is sealed by it; the seed is kept and blessed.',
       sv.verse_id, ev.verse_id, 'extras', 55562
  FROM _session252_ja23_lookup sv, _session252_ja23_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=23 AND sv.verse_number=69
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=23 AND ev.verse_number=75
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-23-the-death-of-sarah',
       E'Sarah dies at Hebron — they wept and mourned',
       E'Jasher binds the Akedah to Sarah''s death by Satan''s last lie, which kills her with sudden joy: *Abraham did not kill his son and he is not dead... her soul went out through joy; she died and was gathered to her people* (Jasher 23:86). Abraham and Isaac come to her at Hebron — *when they found that she was dead they lifted up their voices and wept bitterly over her* (Jasher 23:89) — and *they mourned over her a great and heavy mourning* (Jasher 23:90). Genesis names the same place and grief: *And Sarah died in Kirjath-arba; the same is Hebron in the land of Canaan: and Abraham came to mourn for Sarah, and to weep for her* (Genesis 23:2). The mother of the promised seed is gathered to her people, the covenant line carried on through Isaac whom Elohim spared.',
       sv.verse_id, ev.verse_id, 'extras', 55565
  FROM _session252_ja23_lookup sv, _session252_ja23_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=23 AND sv.verse_number=86
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=23 AND ev.verse_number=90
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-23-the-command-to-offer-isaac
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 22:2 — *And he said, Take now thy son, thine only son Isaac, whom thou lovest, and get thee into the land of Moriah; and offer him there for a burnt offering upon one of the mountains which I will tell thee of.* Jasher 23:2 carries the Moriah command of Genesis verbatim, naming the same only-son and the same mountains shown to Abraham.'
  FROM cross_reference_threads t, cross_references x, _session252_ja23_lookup sv, _session252_ja23_lookup tv
 WHERE t.slug='jasher-23-the-command-to-offer-isaac'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=23 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 22:1 — *And it came to pass after these things, that Elohim (God) did tempt Abraham, and said unto him, Abraham: and he said, Behold, here I am.* Jasher 23:1 opens the same testing with the same call and the same answer, ''Here I am,'' beginning the Akedah.'
  FROM cross_reference_threads t, cross_references x, _session252_ja23_lookup sv, _session252_ja23_lookup tv
 WHERE t.slug='jasher-23-the-command-to-offer-isaac'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=23 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 18:1 — *And Elohim (God) said to him, “Abraham, Abraham”; and he said, “Behold, (here) am I.” . And He said, “Take your beloved son whom you love, (even) Isaac, and go to the high country, and offer him on one of the mountains which I will point out to you.”* Jubilees retells the identical command Jasher records, the same patriarchal event in the live self-linked apparatus.'
  FROM cross_reference_threads t, cross_references x, _session252_ja23_lookup sv, _session252_ja23_lookup tv
 WHERE t.slug='jasher-23-the-command-to-offer-isaac'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=23 AND sv.verse_number=1
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=18 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-23-satan-tempts-on-the-road
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Zechariah 3:2 — *And Yahuah (LORD) said unto Satan, Yahuah (LORD) rebuke thee, O Satan; even Yahuah (LORD) that hath chosen Jerusalem rebuke thee: is not this a brand plucked out of the fire?* Abraham''s rebuke in Jasher 23:38 echoes the very formula by which the adversary is silenced in the canon.'
  FROM cross_reference_threads t, cross_references x, _session252_ja23_lookup sv, _session252_ja23_lookup tv
 WHERE t.slug='jasher-23-satan-tempts-on-the-road'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=23 AND sv.verse_number=38
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=3 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 4:10 — *Then saith Yahusha (Jesus) unto him, Get thee hence, Satan: for it is written, Thou shalt worship Yahuah thy Elohim (the Lord thy God), and him only shalt thou serve.* As the adversary tempts Abraham aside from the command in Jasher 23:25, so the Messiah turns the same tempter away with the word — the chosen seed will not be drawn aside.'
  FROM cross_reference_threads t, cross_references x, _session252_ja23_lookup sv, _session252_ja23_lookup tv
 WHERE t.slug='jasher-23-satan-tempts-on-the-road'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=23 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=4 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 18:12 — *And the prince of the Mastêmâ was put to shame; and Abraham lifted up his eyes and looked, and, behold, a single ram caught … by his horns...* Jubilees gives the adversary Jasher calls Satan the name Mastema, and shows him shamed at the same altar where Abraham resists him in Jasher 23:33.'
  FROM cross_reference_threads t, cross_references x, _session252_ja23_lookup sv, _session252_ja23_lookup tv
 WHERE t.slug='jasher-23-satan-tempts-on-the-road'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=23 AND sv.verse_number=33
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=18 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-23-elohim-will-provide-the-lamb
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 22:7 — *And Isaac spake unto Abraham his father, and said, My father: and he said, Here am I, my son. And he said, Behold the fire and the wood: but where is the lamb for a burnt offering?* Jasher 23:50 records Isaac''s identical question on the mount, the fire and the wood and the missing lamb.'
  FROM cross_reference_threads t, cross_references x, _session252_ja23_lookup sv, _session252_ja23_lookup tv
 WHERE t.slug='jasher-23-elohim-will-provide-the-lamb'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=23 AND sv.verse_number=50
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 22:13 — *And Abraham lifted up his eyes, and looked, and behold behind him a ram caught in a thicket by his horns: and Abraham went and took the ram, and offered him up for a burnt offering in the stead of his son.* The provided ram of Jasher 23:70 is the same thicket-caught substitute Genesis names, offered in Isaac''s stead.'
  FROM cross_reference_threads t, cross_references x, _session252_ja23_lookup sv, _session252_ja23_lookup tv
 WHERE t.slug='jasher-23-elohim-will-provide-the-lamb'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=23 AND sv.verse_number=70
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 1:29 — *The next day John seeth Yahusha (Jesus) coming unto him, and saith, Behold the Lamb of Elohim (God), which taketh away the sin of the world.* The provided burnt offering in place of Isaac (Jasher 23:51) foreshadows the Lamb of Elohim John points to.'
  FROM cross_reference_threads t, cross_references x, _session252_ja23_lookup sv, _session252_ja23_lookup tv
 WHERE t.slug='jasher-23-elohim-will-provide-the-lamb'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=23 AND sv.verse_number=51
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-23-bound-on-the-altar
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 22:9 — *And they came to the place which Elohim (God) had told him of; and Abraham built an altar there, and laid the wood in order, and bound Isaac his son, and laid him on the altar upon the wood.* Jasher 23:65 expands the same binding Genesis records, Isaac laid on the wood upon the altar.'
  FROM cross_reference_threads t, cross_references x, _session252_ja23_lookup sv, _session252_ja23_lookup tv
 WHERE t.slug='jasher-23-bound-on-the-altar'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=23 AND sv.verse_number=65
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'James 2:21 — *Was not Abraham our father justified by works, when he had offered Isaac his son upon the altar?* The binding in Jasher 23:65 is the very work by which James says Abraham was justified — faith made perfect in the offering.'
  FROM cross_reference_threads t, cross_references x, _session252_ja23_lookup sv, _session252_ja23_lookup tv
 WHERE t.slug='jasher-23-bound-on-the-altar'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=23 AND sv.verse_number=65
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=2 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 11:17 — *By faith Abraham, when he was tried, offered up Isaac: and he that had received the promises offered up his only begotten son,* Isaac''s joyful consent to be the offering in Jasher 23:56 is the faith Hebrews credits to Abraham, the trial of the only begotten son.'
  FROM cross_reference_threads t, cross_references x, _session252_ja23_lookup sv, _session252_ja23_lookup tv
 WHERE t.slug='jasher-23-bound-on-the-altar'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=23 AND sv.verse_number=56
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-23-now-i-know-that-you-fear-elohim
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 22:12 — *And he said, Lay not thine hand upon the lad, neither do thou any thing unto him: for now I know that thou fearest Elohim (God), seeing thou hast not withheld thy son, thine only son from me.* Jasher 23:69 carries heaven''s staying word verbatim, the fear of Elohim proven in the unwithheld son.'
  FROM cross_reference_threads t, cross_references x, _session252_ja23_lookup sv, _session252_ja23_lookup tv
 WHERE t.slug='jasher-23-now-i-know-that-you-fear-elohim'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=23 AND sv.verse_number=69
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 22:17 — *That in blessing I will bless thee, and in multiplying I will multiply thy seed as the stars of the heaven, and as the sand which is upon the sea shore; and thy seed shall possess the gate of his enemies;* The blessing of Abraham and his seed in Jasher 23:75 is the sworn covenant blessing Genesis pronounces after the binding.'
  FROM cross_reference_threads t, cross_references x, _session252_ja23_lookup sv, _session252_ja23_lookup tv
 WHERE t.slug='jasher-23-now-i-know-that-you-fear-elohim'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=23 AND sv.verse_number=75
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 4:21 — *And being fully persuaded that, what he had promised, he was able also to perform.* Abraham''s accepted offering and blessed seed in Jasher 23:75 embody the persuaded faith Paul counts to him for righteousness.'
  FROM cross_reference_threads t, cross_references x, _session252_ja23_lookup sv, _session252_ja23_lookup tv
 WHERE t.slug='jasher-23-now-i-know-that-you-fear-elohim'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=23 AND sv.verse_number=75
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=4 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 18:18 — *And he celebrated this festival every year, seven days with joy, and he called it the festival of Yahuah (God) according to the seven days during which he went and returned in peace.* Jubilees turns the same accepted offering of Jasher 23:70 into an ordained seven-day feast — Torah-before-Sinai, the fathers keeping the appointed time.'
  FROM cross_reference_threads t, cross_references x, _session252_ja23_lookup sv, _session252_ja23_lookup tv
 WHERE t.slug='jasher-23-now-i-know-that-you-fear-elohim'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=23 AND sv.verse_number=70
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=18 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-23-the-death-of-sarah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 23:2 — *And Sarah died in Kirjath-arba; the same is Hebron in the land of Canaan: and Abraham came to mourn for Sarah, and to weep for her.* Jasher 23:89 records the same death at Hebron and the same weeping of Abraham over Sarah.'
  FROM cross_reference_threads t, cross_references x, _session252_ja23_lookup sv, _session252_ja23_lookup tv
 WHERE t.slug='jasher-23-the-death-of-sarah'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=23 AND sv.verse_number=89
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=23 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 23:1 — *And Sarah was an hundred and seven and twenty years old: these were the years of the life of Sarah.* The death of Sarah in Jasher 23:86 closes the same span of years Genesis numbers for the mother of the promised seed.'
  FROM cross_reference_threads t, cross_references x, _session252_ja23_lookup sv, _session252_ja23_lookup tv
 WHERE t.slug='jasher-23-the-death-of-sarah'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=23 AND sv.verse_number=86
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=23 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

