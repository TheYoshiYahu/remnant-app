-- ----- fragment: minion_jubilees_21.sql (session251 jubilees 21) -----
-- Source anchor: jubilees/jubilees ch21. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ju21 (view _session251_ju21_lookup). Sort band base 53500, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session251_ju21_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jubilees-21-abraham-kept-torah
  ('jubilees', 'jubilees', 21, 5, 'canon', 'genesis', 26, 5, 'free', E'Genesis 26:5 — *Because that Abraham obeyed my voice, and kept my charge, my commandments, my statutes, and my laws.* Yahuah''s own word that Abraham kept the whole Torah — its commandments, statutes, and judgments — long before Sinai, exactly as Jubilees 21:5 has him passing them to Isaac.'),
  -- thread: jubilees-21-eat-no-blood
  ('jubilees', 'jubilees', 21, 18, 'canon', 'leviticus', 17, 11, 'free', E'Leviticus 17:11 — *For the life of the flesh is in the blood: and I have given it to you upon the altar to make an atonement for your souls: for it is the blood that maketh an atonement for the soul.* The very reason Abraham gives — the blood is the soul — is the reason Yahuah seals at Sinai.'),
  ('jubilees', 'jubilees', 21, 6, 'canon', 'leviticus', 3, 17, 'free', E'Leviticus 3:17 — *It shall be a perpetual statute for your generations throughout all your dwellings, that ye eat neither fat nor blood.* The perpetual statute against blood that Abraham hands Isaac is written into the Torah as a forever ordinance, never abolished.'),
  ('jubilees', 'jubilees', 21, 18, 'canon', 'deuteronomy', 12, 23, 'free', E'Deuteronomy 12:23 — *Only be sure that thou eat not the blood: for the blood is the life; and thou mayest not eat the life with the flesh.* Abraham''s words "eat no blood, for it is the soul" are Moses'' words "the blood is the life" — the same revelation across the centuries.'),
  ('jubilees', 'jubilees', 21, 18, 'jubilees', 'jubilees', 6, 10, 'extras', E'Jubilees 6:10 — *And Noah and his sons swore that they would not eat any blood that was in any flesh, and he made a covenant before Yahuah Elohim (the LORD God) for ever throughout all the generations of the earth in this month.* Abraham''s blood-law to Isaac descends from the everlasting covenant Noah swore — it ain''t new even to the patriarchs.'),
  -- thread: jubilees-21-the-burnt-offering
  ('jubilees', 'jubilees', 21, 8, 'canon', 'leviticus', 3, 4, 'free', E'Leviticus 3:4 — *And the two kidneys, and the fat that is on them, which is by the flanks, and the caul above the liver, with the kidneys, it shall he take away.* The fat, the two kidneys, and the caul above the liver that Abraham names in Jubilees 21:8 are the very portions the peace-offering law specifies.'),
  ('jubilees', 'jubilees', 21, 6, 'canon', 'leviticus', 1, 9, 'free', E'Leviticus 1:9 — *But his inwards and his legs shall he wash in water: and the priest shall burn all on the altar, to be a burnt sacrifice, an offering made by fire, of a sweet savour unto Yahuah (LORD).* Abraham''s "sweet savour before Yahuah" upon the altar is the Torah''s own phrase for the accepted burnt offering.'),
  ('jubilees', 'jubilees', 21, 9, 'canon', 'genesis', 8, 21, 'free', E'Genesis 8:21 — *And Yahuah (LORD) smelled a sweet savour; and Yahuah (LORD) said in his heart, I will not again curse the ground any more for man''s sake.* The same sweet savour Abraham seeks first rose from Noah''s altar after the Flood — the order of offering is older than Sinai.'),
  -- thread: jubilees-21-blood-for-blood
  ('jubilees', 'jubilees', 21, 19, 'canon', 'genesis', 9, 6, 'free', E'Genesis 9:6 — *Whoso sheddeth man''s blood, by man shall his blood be shed: for in the image of Elohim (God) made he man.* Abraham''s "blood for blood" and the land cleansed only by the blood of him who shed it is the Noahic covenant of justice, given because man bears Elohim''s image.'),
  ('jubilees', 'jubilees', 21, 20, 'canon', 'genesis', 9, 5, 'free', E'Genesis 9:5 — *And surely your blood of your lives will I require; at the hand of every beast will I require it, and at the hand of man; at the hand of every man''s brother will I require the life of man.* Yahuah requiring the life for the blood of man is the root of Abraham''s charge that no gift may ransom murder.'),
  ('jubilees', 'jubilees', 21, 19, 'jubilees', 'jubilees', 6, 8, 'extras', E'Jubilees 6:8 — *Whoso sheds man''s blood by man shall his blood be shed; for in the image of Elohim (God) made He man.* The law Abraham presses on Isaac is the same word Jubilees records was given to Noah — the seamless witness across the patriarchs.'),
  -- thread: jubilees-21-be-clean-wash
  ('jubilees', 'jubilees', 21, 16, 'canon', 'leviticus', 17, 13, 'free', E'Leviticus 17:13 — *And whatsoever man there be of the children of Yashar''el (Israel), or of the strangers that sojourn among you, which hunteth and catcheth any beast or fowl that may be eaten; he shall even pour out the blood thereof, and cover it with dust.* Abraham''s "cover it with dust" is the Torah''s own command for the blood of the hunt — kept centuries before Moses wrote it.'),
  -- thread: jubilees-21-plant-of-righteousness
  ('jubilees', 'jubilees', 21, 24, 'enoch', '1-enoch', 10, 16, 'extras', E'1 Enoch 10:16 — *let the plant of righteousness and truth appear: and it shall prove a blessing; the works of righteousness and truth'' shall be planted in truth and joy for evermore.* Abraham''s "plant of righteousness" raised up through all the earth is Enoch''s restored seed — Jubilees 21:10 names Enoch''s own words as Abraham''s source.'),
  ('jubilees', 'jubilees', 21, 25, 'canon', 'genesis', 26, 4, 'free', E'Genesis 26:4 — *And I will make thy seed to multiply as the stars of heaven, and will give unto thy seed all these countries; and in thy seed shall all the nations of the earth be blessed.* Abraham''s prayer that Isaac''s seed be a blessing on all the earth is the Genesis promise to the kept and separated seed.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session251_ju21_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session251_ju21_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-21-abraham-kept-torah',
       E'Abraham kept the charge — before Sinai',
       E'Abraham''s deathbed testament to Isaac opens with a life of obedience: *And do you, my son, observe His commandments and His ordinances and His judgments, and walk not after the abominations and after the graven images and after the molten images* (Jubilees 21:5). This is the spine of "it ain''t new." Genesis itself testifies that the patriarch kept the whole Torah generations before it was given at Sinai: *Because that Abraham obeyed my voice, and kept my charge, my commandments, my statutes, and my laws* (Genesis 26:5) — the same fourfold "charge, commandments, statutes, laws." And the whole counsel hangs on the character of the One who gave it: *For He is the living Elohim (God), and He is holy and faithful, and He is righteous beyond all* (Jubilees 21:4). The Torah Abraham hands Isaac is not law-as-curse but the way of the living Elohim, engraved before it was ever spoken from the mountain.',
       sv.verse_id, ev.verse_id, 'extras', 53500
  FROM _session251_ju21_lookup sv, _session251_ju21_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=21 AND sv.verse_number=4
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=21 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-21-eat-no-blood',
       E'Eat no blood — for it is the soul',
       E'Abraham''s first command on the altar is the blood: *And eat no blood at all of animals or cattle, or of any bird which flies in the heaven* (Jubilees 21:6), and again *And do not eat any blood, for it is the soul; eat no blood whatever* (Jubilees 21:18). This is the same law Yahuah engraves through Moses, with the same reason — the life: *For the life of the flesh is in the blood... No soul of you shall eat blood, neither shall any stranger that sojourneth among you eat blood* (Leviticus 17:11,12). It is named a *perpetual statute for your generations throughout all your dwellings, that ye eat neither fat nor blood* (Leviticus 3:17), and Deuteronomy gives the heart of it: *Only be sure that thou eat not the blood: for the blood is the life; and thou mayest not eat the life with the flesh* (Deuteronomy 12:23). And it ain''t new even to Abraham — Jubilees grounds it in the oath sworn by Noah: *And Noah and his sons swore that they would not eat any blood that was in any flesh* (Jubilees 6:10). One law, from the Flood to the fathers to Sinai.',
       sv.verse_id, ev.verse_id, 'extras', 53503
  FROM _session251_ju21_lookup sv, _session251_ju21_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=21 AND sv.verse_number=6
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=21 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-21-the-burnt-offering',
       E'The order of the offering — the altar, the fat, the sweet savour',
       E'Abraham instructs Isaac in the exact order of the peace-offering: *slay you it, and pour out its blood upon the altar, and all the fat of the offering offer on the altar... it is a sweet savour before Yahuah (God)* (Jubilees 21:6), naming *the fat which is on the belly, and all the fat on the inwards and the two kidneys... and upon the loins and liver* (Jubilees 21:8). This is the Levitical peace-offering rite to the letter: *the fat that covereth the inwards... And the two kidneys, and the fat that is on them, which is by the flanks, and the caul above the liver, with the kidneys* (Leviticus 3:3,4), burnt for *a sweet savour unto Yahuah (LORD)* (Leviticus 1:9). The patriarch knows the order of the altar before Aaron is born — and the same "sweet savour" rose from Noah''s altar at the first: *And Yahuah (LORD) smelled a sweet savour* (Genesis 8:21). The sacrificial system is not a Mosaic novelty; it is the ancient way of approach.',
       sv.verse_id, ev.verse_id, 'extras', 53506
  FROM _session251_ju21_lookup sv, _session251_ju21_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=21 AND sv.verse_number=6
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=21 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-21-blood-for-blood',
       E'Blood for blood — the land defiled, the man''s life required',
       E'Turning from the altar to the shedding of man''s blood, Abraham warns: *And take no gifts for the blood of man, lest it be shed with impunity, without judgment; for it is the blood that is shed that causes the earth to sin, and the earth cannot be cleansed from the blood of man save by the blood of him who shed it* (Jubilees 21:19), and *blood for blood, that you may be accepted before Yahuah (God)* (Jubilees 21:20). This is the covenant given to Noah after the Flood, the foundation of all justice: *And surely your blood of your lives will I require... Whoso sheddeth man''s blood, by man shall his blood be shed: for in the image of Elohim (God) made he man* (Genesis 9:5,6). The defilement of the land by unavenged blood is the same teaching the Torah carries forward — and Jubilees grounds the whole law of blood in the Noahic oath: *Whoso sheds man''s blood by man shall his blood be shed; for in the image of Elohim (God) made He man* (Jubilees 6:8).',
       sv.verse_id, ev.verse_id, 'extras', 53509
  FROM _session251_ju21_lookup sv, _session251_ju21_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=21 AND sv.verse_number=19
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=21 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-21-be-clean-wash',
       E'Be clean — wash before you approach the altar',
       E'Abraham binds purity to the priestly approach: *And at all times be clean in your body, and wash yourself with water before you approach to offer on the altar, and wash your hands and your feet before you draw near to the altar* (Jubilees 21:16). This is the priestly washing the Torah ordains, and the hunter''s covering of blood with dust: *he shall even pour out the blood thereof, and cover it with dust* (Leviticus 17:13) — the very command Abraham echoes, *be on your guard, my son, against blood... cover it with dust* (Jubilees 21:16). Clean hands and a clean body before the altar are not Levitical innovations but the ancient discipline of drawing near, kept by the father of the faithful.',
       sv.verse_id, ev.verse_id, 'extras', 53512
  FROM _session251_ju21_lookup sv, _session251_ju21_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=21 AND sv.verse_number=16
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=21 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-21-plant-of-righteousness',
       E'The plant of righteousness — turn from their ways, and be blessed',
       E'Abraham''s testament closes with the separation of the seed and the promise of restoration: *Beware, lest you should walk in their ways And tread in their paths, And sin a sin to death before the El Elyon (Most High) Elohim (God)* (Jubilees 21:22), then the turning: *Turn away from all their deeds and all their uncleanness, And observe the ordinance of the El Elyon (Most High) Elohim (God)* (Jubilees 21:23), and the blessing: *And He will bless you in all your deeds, And will raise up from you the plant of righteousness through all the earth, throughout all generations of the earth* (Jubilees 21:24). "The plant of righteousness" is Enoch''s own phrase for the restored seed: *let the plant of righteousness and truth appear: and it shall prove a blessing; the works of righteousness and truth shall be planted in truth and joy for evermore* (1 Enoch 10:16). And Abraham''s parting word — *May He bless all your seed and the residue of your seed for the generations for ever... That you may be a blessing on all the earth* (Jubilees 21:25) — is the Genesis promise of the seed kept holy and made a blessing to the nations: *And in thy seed shall all the nations of the earth be blessed; Because that Abraham obeyed my voice* (Genesis 26:4,5).',
       sv.verse_id, ev.verse_id, 'extras', 53515
  FROM _session251_ju21_lookup sv, _session251_ju21_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=21 AND sv.verse_number=22
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=21 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jubilees-21-abraham-kept-torah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 26:5 — *Because that Abraham obeyed my voice, and kept my charge, my commandments, my statutes, and my laws.* Yahuah''s own word that Abraham kept the whole Torah — its commandments, statutes, and judgments — long before Sinai, exactly as Jubilees 21:5 has him passing them to Isaac.'
  FROM cross_reference_threads t, cross_references x, _session251_ju21_lookup sv, _session251_ju21_lookup tv
 WHERE t.slug='jubilees-21-abraham-kept-torah'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=21 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=26 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-21-eat-no-blood
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 17:11 — *For the life of the flesh is in the blood: and I have given it to you upon the altar to make an atonement for your souls: for it is the blood that maketh an atonement for the soul.* The very reason Abraham gives — the blood is the soul — is the reason Yahuah seals at Sinai.'
  FROM cross_reference_threads t, cross_references x, _session251_ju21_lookup sv, _session251_ju21_lookup tv
 WHERE t.slug='jubilees-21-eat-no-blood'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=21 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=17 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 3:17 — *It shall be a perpetual statute for your generations throughout all your dwellings, that ye eat neither fat nor blood.* The perpetual statute against blood that Abraham hands Isaac is written into the Torah as a forever ordinance, never abolished.'
  FROM cross_reference_threads t, cross_references x, _session251_ju21_lookup sv, _session251_ju21_lookup tv
 WHERE t.slug='jubilees-21-eat-no-blood'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=21 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=3 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 12:23 — *Only be sure that thou eat not the blood: for the blood is the life; and thou mayest not eat the life with the flesh.* Abraham''s words "eat no blood, for it is the soul" are Moses'' words "the blood is the life" — the same revelation across the centuries.'
  FROM cross_reference_threads t, cross_references x, _session251_ju21_lookup sv, _session251_ju21_lookup tv
 WHERE t.slug='jubilees-21-eat-no-blood'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=21 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=12 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 6:10 — *And Noah and his sons swore that they would not eat any blood that was in any flesh, and he made a covenant before Yahuah Elohim (the LORD God) for ever throughout all the generations of the earth in this month.* Abraham''s blood-law to Isaac descends from the everlasting covenant Noah swore — it ain''t new even to the patriarchs.'
  FROM cross_reference_threads t, cross_references x, _session251_ju21_lookup sv, _session251_ju21_lookup tv
 WHERE t.slug='jubilees-21-eat-no-blood'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=21 AND sv.verse_number=18
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=6 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-21-the-burnt-offering
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 3:4 — *And the two kidneys, and the fat that is on them, which is by the flanks, and the caul above the liver, with the kidneys, it shall he take away.* The fat, the two kidneys, and the caul above the liver that Abraham names in Jubilees 21:8 are the very portions the peace-offering law specifies.'
  FROM cross_reference_threads t, cross_references x, _session251_ju21_lookup sv, _session251_ju21_lookup tv
 WHERE t.slug='jubilees-21-the-burnt-offering'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=21 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=3 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 1:9 — *But his inwards and his legs shall he wash in water: and the priest shall burn all on the altar, to be a burnt sacrifice, an offering made by fire, of a sweet savour unto Yahuah (LORD).* Abraham''s "sweet savour before Yahuah" upon the altar is the Torah''s own phrase for the accepted burnt offering.'
  FROM cross_reference_threads t, cross_references x, _session251_ju21_lookup sv, _session251_ju21_lookup tv
 WHERE t.slug='jubilees-21-the-burnt-offering'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=21 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=1 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 8:21 — *And Yahuah (LORD) smelled a sweet savour; and Yahuah (LORD) said in his heart, I will not again curse the ground any more for man''s sake.* The same sweet savour Abraham seeks first rose from Noah''s altar after the Flood — the order of offering is older than Sinai.'
  FROM cross_reference_threads t, cross_references x, _session251_ju21_lookup sv, _session251_ju21_lookup tv
 WHERE t.slug='jubilees-21-the-burnt-offering'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=21 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=8 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-21-blood-for-blood
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 9:6 — *Whoso sheddeth man''s blood, by man shall his blood be shed: for in the image of Elohim (God) made he man.* Abraham''s "blood for blood" and the land cleansed only by the blood of him who shed it is the Noahic covenant of justice, given because man bears Elohim''s image.'
  FROM cross_reference_threads t, cross_references x, _session251_ju21_lookup sv, _session251_ju21_lookup tv
 WHERE t.slug='jubilees-21-blood-for-blood'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=21 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 9:5 — *And surely your blood of your lives will I require; at the hand of every beast will I require it, and at the hand of man; at the hand of every man''s brother will I require the life of man.* Yahuah requiring the life for the blood of man is the root of Abraham''s charge that no gift may ransom murder.'
  FROM cross_reference_threads t, cross_references x, _session251_ju21_lookup sv, _session251_ju21_lookup tv
 WHERE t.slug='jubilees-21-blood-for-blood'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=21 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 6:8 — *Whoso sheds man''s blood by man shall his blood be shed; for in the image of Elohim (God) made He man.* The law Abraham presses on Isaac is the same word Jubilees records was given to Noah — the seamless witness across the patriarchs.'
  FROM cross_reference_threads t, cross_references x, _session251_ju21_lookup sv, _session251_ju21_lookup tv
 WHERE t.slug='jubilees-21-blood-for-blood'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=21 AND sv.verse_number=19
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=6 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-21-be-clean-wash
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 17:13 — *And whatsoever man there be of the children of Yashar''el (Israel), or of the strangers that sojourn among you, which hunteth and catcheth any beast or fowl that may be eaten; he shall even pour out the blood thereof, and cover it with dust.* Abraham''s "cover it with dust" is the Torah''s own command for the blood of the hunt — kept centuries before Moses wrote it.'
  FROM cross_reference_threads t, cross_references x, _session251_ju21_lookup sv, _session251_ju21_lookup tv
 WHERE t.slug='jubilees-21-be-clean-wash'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=21 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=17 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-21-plant-of-righteousness
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 10:16 — *let the plant of righteousness and truth appear: and it shall prove a blessing; the works of righteousness and truth'' shall be planted in truth and joy for evermore.* Abraham''s "plant of righteousness" raised up through all the earth is Enoch''s restored seed — Jubilees 21:10 names Enoch''s own words as Abraham''s source.'
  FROM cross_reference_threads t, cross_references x, _session251_ju21_lookup sv, _session251_ju21_lookup tv
 WHERE t.slug='jubilees-21-plant-of-righteousness'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=21 AND sv.verse_number=24
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 26:4 — *And I will make thy seed to multiply as the stars of heaven, and will give unto thy seed all these countries; and in thy seed shall all the nations of the earth be blessed.* Abraham''s prayer that Isaac''s seed be a blessing on all the earth is the Genesis promise to the kept and separated seed.'
  FROM cross_reference_threads t, cross_references x, _session251_ju21_lookup sv, _session251_ju21_lookup tv
 WHERE t.slug='jubilees-21-plant-of-righteousness'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=21 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=26 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

