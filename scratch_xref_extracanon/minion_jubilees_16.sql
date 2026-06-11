-- ----- fragment: minion_jubilees_16.sql (session251 jubilees 16) -----
-- Source anchor: jubilees/jubilees ch16. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ju16 (view _session251_ju16_lookup). Sort band base 53375, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session251_ju16_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jubilees-16-mamre-sarah-laughed
  ('jubilees', 'jubilees', 16, 1, 'canon', 'genesis', 18, 1, 'free', E'Genesis 18:1 — *And Yahuah (LORD) appeared unto him in the plains of Mamre: and he sat in the tent door in the heat of the day;* The Genesis source of Jubilees 16:1, the appearing at Mamre that opens the chapter.'),
  ('jubilees', 'jubilees', 16, 1, 'canon', 'genesis', 18, 10, 'free', E'Genesis 18:10 — *And he said, I will certainly return unto thee according to the time of life; and, lo, Sarah thy wife shall have a son. And Sarah heard it in the tent door, which was behind him.* The very promise Jubilees 16:1 announces — a son by Sarah his wife.'),
  ('jubilees', 'jubilees', 16, 2, 'canon', 'genesis', 18, 15, 'free', E'Genesis 18:15 — *Then Sarah denied, saying, I laughed not; for she was afraid. And he said, Nay; but thou didst laugh.* The laugh, the fear, and the denial of Jubilees 16:2 are kept verbatim from the Torah account.'),
  ('jubilees', 'jubilees', 16, 3, 'canon', 'genesis', 17, 19, 'free', E'Genesis 17:19 — *And Elohim (God) said, Sarah thy wife shall bear thee a son indeed; and thou shalt call his name Isaac: and I will establish my covenant with him for an everlasting covenant, and with his seed after him.* Jubilees 16:3 says the name Isaac was ordained and written before his birth — Yahuah had already named him at the covenant of circumcision.'),
  -- thread: jubilees-16-sodom-overthrown-lot-delivered
  ('jubilees', 'jubilees', 16, 5, 'canon', 'genesis', 19, 24, 'free', E'Genesis 19:24 — *Then Yahuah (LORD) rained upon Sodom and upon Gomorrah brimstone and fire from Yahuah (LORD) out of heaven;* The fire and brimstone of Jubilees 16:5 is the Torah''s own overthrow of the cities of the plain.'),
  ('jubilees', 'jubilees', 16, 5, 'canon', 'genesis', 19, 25, 'free', E'Genesis 19:25 — *And he overthrew those cities, and all the plain, and all the inhabitants of the cities, and that which grew upon the ground.* Jubilees 16:5 names Sodom, Gomorrah, Zeboim and all the region of the Jordan — the same total overthrow.'),
  ('jubilees', 'jubilees', 16, 6, 'canon', 'genesis', 19, 29, 'free', E'Genesis 19:29 — *And it came to pass, when Elohim (God) destroyed the cities of the plain, that Elohim (God) remembered Abraham, and sent Lot out of the midst of the overthrow, when he overthrew the cities in the which Lot dwelt.* Lot is saved because Elohim remembered Abraham — Jubilees 16:6 keeps this Torah reason verbatim.'),
  ('jubilees', 'jubilees', 16, 9, 'enoch', '1-enoch', 10, 13, 'extras', E'1 Enoch 10:13 — *In those days they shall be led off to the abyss of fire: and to the torment and the prison in which they shall be confined for ever.* Jubilees 16:9 says the judgment of Sodom was commanded and engraven on the heavenly tables — the same pre-written doom of the wicked the Watchers apparatus testifies to.'),
  -- thread: jubilees-16-isaac-born-circumcised-eighth-day
  ('jubilees', 'jubilees', 16, 12, 'canon', 'genesis', 21, 1, 'free', E'Genesis 21:1 — *And Yahuah (LORD) visited Sarah as he had said, and Yahuah (LORD) did unto Sarah as he had spoken.* Jubilees 16:12 keeps the Torah''s exact wording — Yahuah visited Sarah and did to her as He had spoken.'),
  ('jubilees', 'jubilees', 16, 12, 'canon', 'genesis', 21, 2, 'free', E'Genesis 21:2 — *For Sarah conceived, and bare Abraham a son in his old age, at the set time of which Elohim (God) had spoken to him.* The set time of which Yahuah had spoken to Abraham is the same set time Jubilees 16:12 records for Isaac''s birth.'),
  ('jubilees', 'jubilees', 16, 14, 'canon', 'genesis', 21, 4, 'free', E'Genesis 21:4 — *And Abraham circumcised his son Isaac being eight days old, as Elohim (God) had commanded him.* The eighth-day circumcision of Jubilees 16:14 is Abraham''s Torah obedience to the covenant command.'),
  ('jubilees', 'jubilees', 16, 14, 'jubilees', 'jubilees', 15, 25, 'extras', E'Jubilees 15:25 — *This law is for all the generations for ever, and there is no circumcision of the days, and no omission of one day out of the eight days; for it is an eternal ordinance, ordained and written on the heavenly tables.* The covenant Jubilees 16:14 calls ordained for ever is engraved on the heavenly tables — the eternal sign in the flesh of the seed.'),
  -- thread: jubilees-16-holy-seed-kingdom-of-priests
  ('jubilees', 'jubilees', 16, 16, 'canon', 'genesis', 21, 12, 'free', E'Genesis 21:12 — *And Elohim (God) said unto Abraham, Let it not be grievous in thy sight because of the lad, and because of thy bondwoman; in all that Sarah hath said unto thee, hearken unto her voice; for in Isaac shall thy seed be called.* Jubilees 16:16 quotes this Torah word — in Isaac his name and seed are called, narrowing the line of election.'),
  ('jubilees', 'jubilees', 16, 17, 'canon', 'exodus', 19, 6, 'free', E'Exodus 19:6 — *And ye shall be unto me a kingdom of priests, and an holy nation. These are the words which thou shalt speak unto the children of Yashar''el (Israel).* The kingdom and priests and holy nation Jubilees 16:17 sees in Abraham''s holy seed is Sinai''s own charter for Israel.'),
  ('jubilees', 'jubilees', 16, 17, 'canon', '1-peter', 2, 9, 'free', E'1 Peter 2:9 — *But ye are a chosen generation, a royal priesthood, an holy nation, a peculiar people; that ye should shew forth the praises of him who hath called you out of darkness into his marvellous light:* The portion of the Most High, the kingdom and priests of Jubilees 16:17, is the same calling the apostle lays on the regathered remnant.'),
  ('jubilees', 'jubilees', 16, 17, 'canon', 'galatians', 3, 16, 'free', E'Galatians 3:16 — *Now to Abraham and his seed were the promises made. He saith not, And to seeds, as of many; but as of one, And to thy seed, which is Messiah (Christ).* The holy seed of Jubilees 16:17 narrows to the one Seed, Messiah, in whom the promise to Abraham is fulfilled.'),
  -- thread: jubilees-16-abraham-keeps-tabernacles-it-aint-new
  ('jubilees', 'jubilees', 16, 21, 'canon', 'leviticus', 23, 42, 'free', E'Leviticus 23:42 — *Ye shall dwell in booths seven days; all that are Israelites born shall dwell in booths:* The booths Abraham built in Jubilees 16:21 are the very booths the Torah later commands Israel to dwell in seven days — it ain''t new.'),
  ('jubilees', 'jubilees', 16, 30, 'canon', 'leviticus', 23, 40, 'free', E'Leviticus 23:40 — *And ye shall take you on the first day the boughs of goodly trees, branches of palm trees, and the boughs of thick trees, and willows of the brook; and ye shall rejoice before Yahuah Elohaychem (the LORD your God) seven days.* The leafy boughs and willows from the brook of Jubilees 16:30 are the Torah''s own four species of the feast.'),
  ('jubilees', 'jubilees', 16, 20, 'canon', 'deuteronomy', 16, 13, 'free', E'Deuteronomy 16:13 — *Thou shalt observe the feast of tabernacles seven days, after that thou hast gathered in thy corn and thy wine:* Abraham''s seven-day festival of joy in Jubilees 16:20 is the feast of tabernacles the Torah commands for seven days after the harvest.'),
  ('jubilees', 'jubilees', 16, 29, 'canon', 'nehemiah', 8, 17, 'free', E'Nehemiah 8:17 — *And all the congregation of them that were come again out of the captivity made booths, and sat under the booths: for since the days of Jeshua the son of Nun unto that day had not the children of Yashar''el (Israel) done so. And there was very great gladness.* The statute for ever of Jubilees 16:29 is the same feast the returning remnant keeps with great gladness.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session251_ju16_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session251_ju16_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-16-mamre-sarah-laughed',
       E'The Visit at Mamre — a son for Sarah, and the laugh',
       E'Jubilees opens chapter 16 with the visit at the oak of Mamre: *And on the new moon of the fourth month we appeared to Abraham, at the oak of Mamre, and we talked with him, and we announced to him that a son would be given to him by Sarah his wife* (Jubilees 16:1). This is the Genesis scene retold from the angels'' own mouth: *And Yahuah (LORD) appeared unto him in the plains of Mamre: and he sat in the tent door in the heat of the day* (Genesis 18:1), where the promise is spoken plainly — *and, lo, Sarah thy wife shall have a son* (Genesis 18:10). Jubilees keeps Sarah''s laugh and her fear: *And Sarah laughed, for she heard that we had spoken these words with Abraham... and she became afraid, and denied that she had laughed* (Jubilees 16:2), exactly as Genesis tells it — *Then Sarah denied, saying, I laughed not; for she was afraid. And he said, Nay; but thou didst laugh* (Genesis 18:15). And Jubilees fixes the name on the heavenly tables before the child is conceived — *And we told her the name of her son, as his name is ordained and written in the heavenly tables (i.e.) Isaac* (Jubilees 16:3) — the same name Yahuah had already given in the circumcision covenant: *thou shalt call his name Isaac: and I will establish my covenant with him for an everlasting covenant* (Genesis 17:19). It ain''t new — the laugh, the fear, the named son are all in the Torah.',
       sv.verse_id, ev.verse_id, 'extras', 53375
  FROM _session251_ju16_lookup sv, _session251_ju16_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=16 AND sv.verse_number=1
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=16 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-16-sodom-overthrown-lot-delivered',
       E'Sodom overthrown, Lot delivered — judgment engraved on the tables',
       E'In the same month judgment falls: *And in this month Yahuah (God) executed his judgments on Sodom, and Gomorrah, and Zeboim, and all the region of the Jordan, and He burned them with fire and brimstone, and destroyed them until this day* (Jubilees 16:5). This is the Genesis overthrow retold — *Then Yahuah (LORD) rained upon Sodom and upon Gomorrah brimstone and fire from Yahuah (LORD) out of heaven; And he overthrew those cities, and all the plain* (Genesis 19:24-25). Jubilees keeps the deliverance of Lot for Abraham''s sake exactly as Genesis does: *But Lot we saved; for Elohim (God) remembered Abraham, and sent him out from the midst of the overthrow* (Jubilees 16:6) — word for word the Torah''s *and it came to pass, when Elohim (God) destroyed the cities of the plain, that Elohim (God) remembered Abraham, and sent Lot out of the midst of the overthrow* (Genesis 19:29). But Jubilees adds the heavenly-tables verdict the framework leans on — the uncleanness of Sodom is *commanded and engraven concerning all his seed, on the heavenly tables, to remove them and root them out* (Jubilees 16:9): the judgment of the wicked was written before it fell, as in the books of the Watchers'' doom (1 Enoch 10:14).',
       sv.verse_id, ev.verse_id, 'extras', 53378
  FROM _session251_ju16_lookup sv, _session251_ju16_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=16 AND sv.verse_number=5
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=16 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-16-isaac-born-circumcised-eighth-day',
       E'Isaac born and circumcised the eighth day — the first of the covenant',
       E'Yahuah keeps the word: *And in the middle of the sixth month Yahuah (God) visited Sarah and did to her as He had spoken, and she conceived... on the festival of the first-fruits of the harvest, Isaac was born* (Jubilees 16:12). This is the Torah''s *And Yahuah (LORD) visited Sarah as he had said, and Yahuah (LORD) did unto Sarah as he had spoken. For Sarah conceived, and bare Abraham a son in his old age, at the set time of which Elohim (God) had spoken to him* (Genesis 21:1-2), the son named *Isaac* (Genesis 21:3). Then the eternal sign: *And Abraham circumcised his son on the eighth day: he was the first that was circumcised according to the covenant which is ordained for ever* (Jubilees 16:14) — the obedience Genesis records, *And Abraham circumcised his son Isaac being eight days old, as Elohim (God) had commanded him* (Genesis 21:4). Jubilees binds the eighth-day circumcision to the heavenly tables as an eternal ordinance in the previous chapter — *This law is for all the generations for ever... for it is an eternal ordinance, ordained and written on the heavenly tables* (Jubilees 15:25). Circumcision is the covenant SIGN kept in the flesh of the seed — it ain''t new, and it ain''t abolished.',
       sv.verse_id, ev.verse_id, 'extras', 53381
  FROM _session251_ju16_lookup sv, _session251_ju16_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=16 AND sv.verse_number=12
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=16 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-16-holy-seed-kingdom-of-priests',
       E'A holy seed — the portion of the Most High, a kingdom and priests',
       E'The angels announce the election that runs through the whole framework: of all Abraham''s offspring, *from the sons of Isaac one should become a holy seed, and should not be reckoned among the nations. For he should become the portion of the El Elyon (Most High)... that it should become a kingdom and priests and a holy nation* (Jubilees 16:17). This separation began with the word kept in the covenant — *in Isaac should his name and seed be called* (Jubilees 16:16) — the Torah''s *for in Isaac shall thy seed be called* (Genesis 21:12). The same language Yahuah spoke over Israel at Sinai is laid here over Abraham''s holy seed: *ye shall be unto me a kingdom of priests, and an holy nation* (Exodus 19:6). And the apostle carries it forward to the regathered remnant — *But ye are a chosen generation, a royal priesthood, an holy nation, a peculiar people* (1 Peter 2:9). The seed is kept and chosen out of the nations — election precedes confession, and the one true Seed in whom it all narrows is named in the gospel: *Now to Abraham and his seed were the promises made. He saith not, And to seeds, as of many; but as of one, And to thy seed, which is Messiah (Christ)* (Galatians 3:16).',
       sv.verse_id, ev.verse_id, 'extras', 53384
  FROM _session251_ju16_lookup sv, _session251_ju16_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=16 AND sv.verse_number=16
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=16 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-16-abraham-keeps-tabernacles-it-aint-new',
       E'Abraham keeps the Feast of Tabernacles — the first on the earth',
       E'Here is the calendar heart of the chapter, and the clearest ''it ain''t new'' in the book: *And he built there an altar to Yahuah (God) who had delivered him... and he celebrated a festival of joy in this month seven days, near the altar which he had built at the Well of the Oath. And he built booths for himself and for his servants on this festival, and he was the first to celebrate the feast of tabernacles on the earth* (Jubilees 16:20-21). Abraham keeps Sukkot — booths, branches, seven days of joy — long before Sinai, before Moses, before the Levitical statute. And what Abraham did, the Torah later commands in the very same shape: *Ye shall dwell in booths seven days... that your generations may know that I made the children of Yashar''el (Israel) to dwell in booths* (Leviticus 23:42-43), with the very boughs Jubilees names — *take leafy boughs, and willows from the brook* (Jubilees 16:30) — *And ye shall take you on the first day the boughs of goodly trees, branches of palm trees, and the boughs of thick trees, and willows of the brook; and ye shall rejoice before Yahuah Elohaychem... seven days* (Leviticus 23:40). Deuteronomy commands the same seven days of joy: *Thou shalt observe the feast of tabernacles seven days, after that thou hast gathered in thy corn and thy wine* (Deuteronomy 16:13). And when the remnant returns from exile and rediscovers it, they keep it exactly so — *And all the congregation of them that were come again out of the captivity made booths, and sat under the booths... And there was very great gladness* (Nehemiah 8:17). Jubilees writes it onto the heavenly tables as a statute for ever: *For this reason it is ordained on the heavenly tables concerning Yashar''el (Israel), that they shall celebrate the feast of tabernacles seven days with joy, in the seventh month* (Jubilees 16:29). The Appointed Times were kept by Abraham — they are ancient, engraved before they were written, and never abolished.',
       sv.verse_id, ev.verse_id, 'extras', 53387
  FROM _session251_ju16_lookup sv, _session251_ju16_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=16 AND sv.verse_number=20
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=16 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jubilees-16-mamre-sarah-laughed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 18:1 — *And Yahuah (LORD) appeared unto him in the plains of Mamre: and he sat in the tent door in the heat of the day;* The Genesis source of Jubilees 16:1, the appearing at Mamre that opens the chapter.'
  FROM cross_reference_threads t, cross_references x, _session251_ju16_lookup sv, _session251_ju16_lookup tv
 WHERE t.slug='jubilees-16-mamre-sarah-laughed'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=16 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=18 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 18:10 — *And he said, I will certainly return unto thee according to the time of life; and, lo, Sarah thy wife shall have a son. And Sarah heard it in the tent door, which was behind him.* The very promise Jubilees 16:1 announces — a son by Sarah his wife.'
  FROM cross_reference_threads t, cross_references x, _session251_ju16_lookup sv, _session251_ju16_lookup tv
 WHERE t.slug='jubilees-16-mamre-sarah-laughed'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=16 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=18 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 18:15 — *Then Sarah denied, saying, I laughed not; for she was afraid. And he said, Nay; but thou didst laugh.* The laugh, the fear, and the denial of Jubilees 16:2 are kept verbatim from the Torah account.'
  FROM cross_reference_threads t, cross_references x, _session251_ju16_lookup sv, _session251_ju16_lookup tv
 WHERE t.slug='jubilees-16-mamre-sarah-laughed'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=16 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=18 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 17:19 — *And Elohim (God) said, Sarah thy wife shall bear thee a son indeed; and thou shalt call his name Isaac: and I will establish my covenant with him for an everlasting covenant, and with his seed after him.* Jubilees 16:3 says the name Isaac was ordained and written before his birth — Yahuah had already named him at the covenant of circumcision.'
  FROM cross_reference_threads t, cross_references x, _session251_ju16_lookup sv, _session251_ju16_lookup tv
 WHERE t.slug='jubilees-16-mamre-sarah-laughed'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=16 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-16-sodom-overthrown-lot-delivered
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 19:24 — *Then Yahuah (LORD) rained upon Sodom and upon Gomorrah brimstone and fire from Yahuah (LORD) out of heaven;* The fire and brimstone of Jubilees 16:5 is the Torah''s own overthrow of the cities of the plain.'
  FROM cross_reference_threads t, cross_references x, _session251_ju16_lookup sv, _session251_ju16_lookup tv
 WHERE t.slug='jubilees-16-sodom-overthrown-lot-delivered'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=16 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=19 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 19:25 — *And he overthrew those cities, and all the plain, and all the inhabitants of the cities, and that which grew upon the ground.* Jubilees 16:5 names Sodom, Gomorrah, Zeboim and all the region of the Jordan — the same total overthrow.'
  FROM cross_reference_threads t, cross_references x, _session251_ju16_lookup sv, _session251_ju16_lookup tv
 WHERE t.slug='jubilees-16-sodom-overthrown-lot-delivered'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=16 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=19 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 19:29 — *And it came to pass, when Elohim (God) destroyed the cities of the plain, that Elohim (God) remembered Abraham, and sent Lot out of the midst of the overthrow, when he overthrew the cities in the which Lot dwelt.* Lot is saved because Elohim remembered Abraham — Jubilees 16:6 keeps this Torah reason verbatim.'
  FROM cross_reference_threads t, cross_references x, _session251_ju16_lookup sv, _session251_ju16_lookup tv
 WHERE t.slug='jubilees-16-sodom-overthrown-lot-delivered'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=16 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=19 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 10:13 — *In those days they shall be led off to the abyss of fire: and to the torment and the prison in which they shall be confined for ever.* Jubilees 16:9 says the judgment of Sodom was commanded and engraven on the heavenly tables — the same pre-written doom of the wicked the Watchers apparatus testifies to.'
  FROM cross_reference_threads t, cross_references x, _session251_ju16_lookup sv, _session251_ju16_lookup tv
 WHERE t.slug='jubilees-16-sodom-overthrown-lot-delivered'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=16 AND sv.verse_number=9
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-16-isaac-born-circumcised-eighth-day
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 21:1 — *And Yahuah (LORD) visited Sarah as he had said, and Yahuah (LORD) did unto Sarah as he had spoken.* Jubilees 16:12 keeps the Torah''s exact wording — Yahuah visited Sarah and did to her as He had spoken.'
  FROM cross_reference_threads t, cross_references x, _session251_ju16_lookup sv, _session251_ju16_lookup tv
 WHERE t.slug='jubilees-16-isaac-born-circumcised-eighth-day'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=16 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=21 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 21:2 — *For Sarah conceived, and bare Abraham a son in his old age, at the set time of which Elohim (God) had spoken to him.* The set time of which Yahuah had spoken to Abraham is the same set time Jubilees 16:12 records for Isaac''s birth.'
  FROM cross_reference_threads t, cross_references x, _session251_ju16_lookup sv, _session251_ju16_lookup tv
 WHERE t.slug='jubilees-16-isaac-born-circumcised-eighth-day'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=16 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=21 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 21:4 — *And Abraham circumcised his son Isaac being eight days old, as Elohim (God) had commanded him.* The eighth-day circumcision of Jubilees 16:14 is Abraham''s Torah obedience to the covenant command.'
  FROM cross_reference_threads t, cross_references x, _session251_ju16_lookup sv, _session251_ju16_lookup tv
 WHERE t.slug='jubilees-16-isaac-born-circumcised-eighth-day'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=16 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=21 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 15:25 — *This law is for all the generations for ever, and there is no circumcision of the days, and no omission of one day out of the eight days; for it is an eternal ordinance, ordained and written on the heavenly tables.* The covenant Jubilees 16:14 calls ordained for ever is engraved on the heavenly tables — the eternal sign in the flesh of the seed.'
  FROM cross_reference_threads t, cross_references x, _session251_ju16_lookup sv, _session251_ju16_lookup tv
 WHERE t.slug='jubilees-16-isaac-born-circumcised-eighth-day'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=16 AND sv.verse_number=14
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=15 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-16-holy-seed-kingdom-of-priests
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 21:12 — *And Elohim (God) said unto Abraham, Let it not be grievous in thy sight because of the lad, and because of thy bondwoman; in all that Sarah hath said unto thee, hearken unto her voice; for in Isaac shall thy seed be called.* Jubilees 16:16 quotes this Torah word — in Isaac his name and seed are called, narrowing the line of election.'
  FROM cross_reference_threads t, cross_references x, _session251_ju16_lookup sv, _session251_ju16_lookup tv
 WHERE t.slug='jubilees-16-holy-seed-kingdom-of-priests'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=16 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=21 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 19:6 — *And ye shall be unto me a kingdom of priests, and an holy nation. These are the words which thou shalt speak unto the children of Yashar''el (Israel).* The kingdom and priests and holy nation Jubilees 16:17 sees in Abraham''s holy seed is Sinai''s own charter for Israel.'
  FROM cross_reference_threads t, cross_references x, _session251_ju16_lookup sv, _session251_ju16_lookup tv
 WHERE t.slug='jubilees-16-holy-seed-kingdom-of-priests'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=16 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=19 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Peter 2:9 — *But ye are a chosen generation, a royal priesthood, an holy nation, a peculiar people; that ye should shew forth the praises of him who hath called you out of darkness into his marvellous light:* The portion of the Most High, the kingdom and priests of Jubilees 16:17, is the same calling the apostle lays on the regathered remnant.'
  FROM cross_reference_threads t, cross_references x, _session251_ju16_lookup sv, _session251_ju16_lookup tv
 WHERE t.slug='jubilees-16-holy-seed-kingdom-of-priests'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=16 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Galatians 3:16 — *Now to Abraham and his seed were the promises made. He saith not, And to seeds, as of many; but as of one, And to thy seed, which is Messiah (Christ).* The holy seed of Jubilees 16:17 narrows to the one Seed, Messiah, in whom the promise to Abraham is fulfilled.'
  FROM cross_reference_threads t, cross_references x, _session251_ju16_lookup sv, _session251_ju16_lookup tv
 WHERE t.slug='jubilees-16-holy-seed-kingdom-of-priests'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=16 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=3 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-16-abraham-keeps-tabernacles-it-aint-new
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 23:42 — *Ye shall dwell in booths seven days; all that are Israelites born shall dwell in booths:* The booths Abraham built in Jubilees 16:21 are the very booths the Torah later commands Israel to dwell in seven days — it ain''t new.'
  FROM cross_reference_threads t, cross_references x, _session251_ju16_lookup sv, _session251_ju16_lookup tv
 WHERE t.slug='jubilees-16-abraham-keeps-tabernacles-it-aint-new'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=16 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=42
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 23:40 — *And ye shall take you on the first day the boughs of goodly trees, branches of palm trees, and the boughs of thick trees, and willows of the brook; and ye shall rejoice before Yahuah Elohaychem (the LORD your God) seven days.* The leafy boughs and willows from the brook of Jubilees 16:30 are the Torah''s own four species of the feast.'
  FROM cross_reference_threads t, cross_references x, _session251_ju16_lookup sv, _session251_ju16_lookup tv
 WHERE t.slug='jubilees-16-abraham-keeps-tabernacles-it-aint-new'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=16 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=40
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 16:13 — *Thou shalt observe the feast of tabernacles seven days, after that thou hast gathered in thy corn and thy wine:* Abraham''s seven-day festival of joy in Jubilees 16:20 is the feast of tabernacles the Torah commands for seven days after the harvest.'
  FROM cross_reference_threads t, cross_references x, _session251_ju16_lookup sv, _session251_ju16_lookup tv
 WHERE t.slug='jubilees-16-abraham-keeps-tabernacles-it-aint-new'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=16 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=16 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Nehemiah 8:17 — *And all the congregation of them that were come again out of the captivity made booths, and sat under the booths: for since the days of Jeshua the son of Nun unto that day had not the children of Yashar''el (Israel) done so. And there was very great gladness.* The statute for ever of Jubilees 16:29 is the same feast the returning remnant keeps with great gladness.'
  FROM cross_reference_threads t, cross_references x, _session251_ju16_lookup sv, _session251_ju16_lookup tv
 WHERE t.slug='jubilees-16-abraham-keeps-tabernacles-it-aint-new'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=16 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=8 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

