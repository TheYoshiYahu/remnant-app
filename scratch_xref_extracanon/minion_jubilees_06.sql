-- ----- fragment: minion_jubilees_06.sql (session251 jubilees 6) -----
-- Source anchor: jubilees/jubilees ch6. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ju06 (view _session251_ju06_lookup). Sort band base 53125, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session251_ju06_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jubilees-6-noah-altar-covenant
  ('jubilees', 'jubilees', 6, 1, 'canon', 'genesis', 8, 20, 'free', E'Genesis 8:20 — *And Noah builded an altar unto Yahuah (LORD); and took of every clean beast, and of every clean fowl, and offered burnt offerings on the altar.* The Genesis source of Noah''s altar that Jubilees 6:1 dates to the new moon of the third month.'),
  ('jubilees', 'jubilees', 6, 3, 'canon', 'genesis', 8, 21, 'free', E'Genesis 8:21 — *And Yahuah (LORD) smelled a sweet savour; and Yahuah (LORD) said in his heart, I will not again curse the ground any more for man''s sake; for the imagination of man''s heart is evil from his youth; neither will I again smite any more every thing living, as I have done.* The goodly savour of Jubilees 6:3 is the sweet savour Genesis records, and the same promise of no second flood follows.'),
  ('jubilees', 'jubilees', 6, 4, 'canon', 'genesis', 8, 22, 'free', E'Genesis 8:22 — *While the earth remaineth, seedtime and harvest, and cold and heat, and summer and winter, and day and night shall not cease.* Jubilees 6:4 quotes this ordering of the seasons almost word for word as the content of the covenant Yahuah makes with Noah.'),
  ('jubilees', 'jubilees', 6, 4, 'canon', 'genesis', 9, 11, 'free', E'Genesis 9:11 — *And I will establish my covenant with you; neither shall all flesh be cut off any more by the waters of a flood; neither shall there any more be a flood to destroy the earth.* The covenant of no second flood that Jubilees 6:4 names is the covenant Genesis 9 establishes.'),
  -- thread: jubilees-6-be-fruitful-the-bow
  ('jubilees', 'jubilees', 6, 5, 'canon', 'genesis', 9, 1, 'free', E'Genesis 9:1 — *And Elohim (God) blessed Noah and his sons, and said unto them, Be fruitful, and multiply, and replenish the earth.* The increase-and-multiply blessing of Jubilees 6:5,9 is the Genesis blessing on Noah, itself the creation mandate renewed after the flood.'),
  ('jubilees', 'jubilees', 6, 5, 'canon', 'genesis', 9, 2, 'free', E'Genesis 9:2 — *And the fear of you and the dread of you shall be upon every beast of the earth, and upon every fowl of the air, upon all that moveth upon the earth, and upon all the fishes of the sea; into your hand are they delivered.* Jubilees 6:5 retells this dominion: the fear and dread inspired in everything on earth and in the sea.'),
  ('jubilees', 'jubilees', 6, 16, 'canon', 'genesis', 9, 13, 'free', E'Genesis 9:13 — *I do set my bow in the cloud, and it shall be for a token of a covenant between me and the earth.* The bow Yahuah sets in Jubilees 6:16 as the sign of the covenant is the bow Genesis sets as its token.'),
  ('jubilees', 'jubilees', 6, 16, 'canon', 'genesis', 9, 16, 'free', E'Genesis 9:16 — *And the bow shall be in the cloud; and I will look upon it, that I may remember the everlasting covenant between Elohim (God) and every living creature of all flesh that is upon the earth.* What Jubilees 6:16 calls the eternal covenant Genesis calls the everlasting covenant — a permanent sign, never abolished.'),
  -- thread: jubilees-6-no-blood-the-life-is-the-blood
  ('jubilees', 'jubilees', 6, 6, 'canon', 'genesis', 9, 4, 'free', E'Genesis 9:4 — *But flesh with the life thereof, which is the blood thereof, shall ye not eat.* The blood prohibition Jubilees 6:6 gives Noah is taken straight from Genesis'' covenant with Noah.'),
  ('jubilees', 'jubilees', 6, 8, 'canon', 'genesis', 9, 6, 'free', E'Genesis 9:6 — *Whoso sheddeth man''s blood, by man shall his blood be shed: for in the image of Elohim (God) made he man.* Jubilees 6:8 quotes this image-of-Elohim ground for requiring the blood of man almost verbatim.'),
  ('jubilees', 'jubilees', 6, 13, 'canon', 'leviticus', 17, 10, 'free', E'Leviticus 17:10 — *And whatsoever man there be of the house of Yashar''el (Israel), or of the strangers that sojourn among you, that eateth any manner of blood; I will even set my face against that soul that eateth blood, and will cut him off from among his people.* The Torah carries the Noahic no-blood law forward to Israel, with the same cutting-off Jubilees 6:11,13 commands.'),
  ('jubilees', 'jubilees', 6, 6, 'canon', 'leviticus', 17, 11, 'free', E'Leviticus 17:11 — *For the life of the flesh is in the blood: and I have given it to you upon the altar to make an atonement for your souls: for it is the blood that maketh an atonement for the soul.* Jubilees 6:6''s reason — the life of all flesh is in the blood — is the Torah''s own reason, and it is why the blood belongs on the altar (Jubilees 6:14).'),
  ('jubilees', 'jubilees', 6, 6, 'canon', 'leviticus', 17, 14, 'free', E'Leviticus 17:14 — *For it is the life of all flesh; the blood of it is for the life thereof: therefore I said unto the children of Yashar''el (Israel), Ye shall eat the blood of no manner of flesh: for the life of all flesh is the blood thereof: whosoever eateth it shall be cut off.* Word for word the rationale of Jubilees 6:6 — the life of all flesh is the blood — binding the same eternal commandment.'),
  -- thread: jubilees-6-covenant-by-oath-blood-sprinkled-sinai
  ('jubilees', 'jubilees', 6, 11, 'canon', 'exodus', 19, 1, 'free', E'Exodus 19:1 — *In the third month, when the children of Yashar''el (Israel) were gone forth out of the land of Egypt, the same day came they into the wilderness of Sinai.* Jubilees 6:11 makes the covenant on the mountain a third-month covenant, the very month Exodus places Israel at Sinai.'),
  ('jubilees', 'jubilees', 6, 11, 'canon', 'exodus', 24, 8, 'free', E'Exodus 24:8 — *And Moses took the blood, and sprinkled it on the people, and said, Behold the blood of the covenant, which Yahuah (LORD) hath made with you concerning all these words.* The sprinkling of blood on the people because of all the words of the covenant in Jubilees 6:11 is the Sinai covenant-blood Exodus describes.'),
  -- thread: jubilees-6-feast-of-weeks-heavenly-tablets
  ('jubilees', 'jubilees', 6, 17, 'canon', 'leviticus', 23, 15, 'free', E'Leviticus 23:15 — *And ye shall count unto you from the morrow after the sabbath, from the day that ye brought the sheaf of the wave offering; seven sabbaths shall be complete.* The Torah''s count of weeks to Shavuot is the feast of weeks Jubilees 6:17 says was engraved on the heavenly tablets and kept from creation.'),
  ('jubilees', 'jubilees', 6, 21, 'canon', 'leviticus', 23, 16, 'free', E'Leviticus 23:16 — *Even unto the morrow after the seventh sabbath shall ye number fifty days; and ye shall offer a new meat offering unto Yahuah (LORD).* The fifty-day count to the new offering matches the once-a-year feast of weeks Jubilees 6:21 calls twofold.'),
  ('jubilees', 'jubilees', 6, 21, 'canon', 'leviticus', 23, 17, 'free', E'Leviticus 23:17 — *Ye shall bring out of your habitations two wave loaves of two tenth deals: they shall be of fine flour; they shall be baken with leaven; they are the firstfruits unto Yahuah (LORD).* Jubilees 6:21 names the feast ''the feast of weeks and the feast of first-fruits''; here are the firstfruits loaves the Torah commands for it.'),
  ('jubilees', 'jubilees', 6, 20, 'canon', 'leviticus', 23, 21, 'free', E'Leviticus 23:21 — *And ye shall proclaim on the selfsame day, that it may be an holy convocation unto you: ye shall do no servile work therein: it shall be a statute for ever in all your dwellings throughout your generations.* Jubilees 6:20 commands Israel to keep this festival in all their generations; the Torah seals it a statute for ever — never abolished.'),
  -- thread: jubilees-6-364-day-year-against-the-moon
  ('jubilees', 'jubilees', 6, 32, 'enoch', '1-enoch', 74, 10, 'extras', E'1 Enoch 74:10 — *And the sun and the moon complete the year in three hundred and sixty-four days.* Enoch''s luminary order names the exact 364-day reckoning Jubilees 6:32 commands Israel to observe.'),
  ('jubilees', 'jubilees', 6, 32, 'enoch', '1-enoch', 74, 13, 'extras', E'1 Enoch 74:13 — *And the moon brings in all the years exactly, that their stations may come, and that they may not transgress their reckoned stations, and that they may not change their order, but complete the years with righteousness, three hundred and sixty-four days.* The same 364-day order kept ''with righteousness'' that Jubilees 6:32 says must not disturb its feasts.'),
  ('jubilees', 'jubilees', 6, 37, 'enoch', '1-enoch', 82, 3, 'extras', E'1 Enoch 82:3 — *And in those days the sinners shall alter the order, And shall set aside all the commandments of Yahuah (God) of Spirits... And they shall alter the times, And the seasons, And the new moons, And the sabbaths, And the festivals, And they shall eat blood with all kinds of flesh.* Enoch''s warning is Jubilees 6:37 word for word, closing on the same eating of blood with all kinds of flesh.'),
  ('jubilees', 'jubilees', 6, 36, 'canon', 'daniel', 7, 25, 'free', E'Daniel 7:25 — *And he shall speak great words against the El Elyon (most High), and shall wear out the saints of the El Elyon (most High), and think to change times and laws: and they shall be given into his hand until a time and times and the dividing of time.* The horn that thinks to change times and laws is Daniel''s name for the very disordering of the appointed times Jubilees 6:36-37 foretells.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session251_ju06_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session251_ju06_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-6-noah-altar-covenant',
       E'Noah''s altar and the covenant after the flood',
       E'Jubilees opens the chapter with Noah coming off the ark and building an altar in the third month: *And on the new moon of the third month he went forth from the ark, and built an altar on that mountain* (Jubilees 6:1), and Yahuah answers the sweet savour with a covenant — *And Yahuah (God) smelt the goodly savour, and He made a covenant with him that there should not be any more a flood to destroy the earth; that all the days of the earth seed-time and harvest should never cease; cold and heat, and summer and winter, and day and night should not change their order, nor cease for ever* (Jubilees 6:4). This is Genesis retold beside its source: *And Noah builded an altar unto Yahuah (LORD); and took of every clean beast, and of every clean fowl, and offered burnt offerings on the altar* (Genesis 8:20), the same sweet savour — *And Yahuah (LORD) smelled a sweet savour* (Genesis 8:21) — and the same unbroken seasons, *While the earth remaineth, seedtime and harvest, and cold and heat, and summer and winter, and day and night shall not cease* (Genesis 8:22). The covenant of Genesis 9 stands behind it — *And I will establish my covenant with you; neither shall all flesh be cut off any more by the waters of a flood; neither shall there any more be a flood to destroy the earth* (Genesis 9:11). It ain''t new: Jubilees is unfolding Genesis, not replacing it.',
       sv.verse_id, ev.verse_id, 'extras', 53125
  FROM _session251_ju06_lookup sv, _session251_ju06_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=6 AND sv.verse_number=1
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=6 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-6-be-fruitful-the-bow',
       E'Be fruitful and multiply, and the bow in the cloud',
       E'To Noah Jubilees gives the creation blessing again — *And you, increase you and multiply upon the earth, and become many upon it, and be a blessing upon it. The fear of you and the dread of you I shall inspire in everything that is on earth and in the sea* (Jubilees 6:5) — and seals it with the sign: *He set His bow in the cloud for a sign of the eternal covenant that there should not again be a flood on the earth to destroy it all the days of the earth* (Jubilees 6:16). Genesis is the source quoted beside it: *And Elohim (God) blessed Noah and his sons, and said unto them, Be fruitful, and multiply, and replenish the earth* (Genesis 9:1), with the same fear and dread laid on every beast (Genesis 9:2), and the bow set as the token — *I do set my bow in the cloud, and it shall be for a token of a covenant between me and the earth* (Genesis 9:13). Jubilees calls it the sign of the **eternal** covenant, and Genesis calls it the **everlasting** covenant (Genesis 9:16): a sign engraved into the order of things, never repealed.',
       sv.verse_id, ev.verse_id, 'extras', 53128
  FROM _session251_ju06_lookup sv, _session251_ju06_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=6 AND sv.verse_number=5
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=6 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-6-no-blood-the-life-is-the-blood',
       E'Eat no blood: the life of all flesh is in the blood',
       E'Jubilees grounds the blood prohibition in Noah and binds it on Israel for ever: *But flesh, with the life thereof, with the blood, you shall not eat; for the life of all flesh is in the blood* (Jubilees 6:7), and the oath that follows — *And Noah and his sons swore that they would not eat any blood that was in any flesh* (Jubilees 6:10) — is law without limit: *And for this law there is no limit of days, for it is for ever* (Jubilees 6:14). The Genesis source is quoted beside it — *But flesh with the life thereof, which is the blood thereof, shall ye not eat* (Genesis 9:4) — together with the image-of-Elohim ground for the avenging of blood, *Whoso sheddeth man''s blood, by man shall his blood be shed: for in the image of Elohim (God) made he man* (Genesis 9:6). And the Torah carries the same statute forward to Israel: *And whatsoever man there be of the house of Yashar''el (Israel)... that eateth any manner of blood; I will even set my face against that soul that eateth blood, and will cut him off from among his people* (Leviticus 17:10), *For the life of the flesh is in the blood* (Leviticus 17:11). One unbroken commandment from Noah to Sinai — it ain''t new, and it ain''t repealed.',
       sv.verse_id, ev.verse_id, 'extras', 53131
  FROM _session251_ju06_lookup sv, _session251_ju06_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=6 AND sv.verse_number=6
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=6 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-6-covenant-by-oath-blood-sprinkled-sinai',
       E'The covenant by oath, the blood sprinkled in the third month at Sinai',
       E'Jubilees reads Noah''s third-month oath forward to Sinai: *On this account He spake to you that you should make a covenant with the children of Yashar''el (Israel) in this month upon the mountain with an oath, and that you should sprinkle blood upon them because of all the words of the covenant* (Jubilees 6:11). The same third month, the same mountain — Exodus places Israel at Sinai exactly then: *In the third month, when the children of Yashar''el (Israel) were gone forth out of the land of Egypt, the same day came they into the wilderness of Sinai* (Exodus 19:1). And the blood sprinkled on the people is the Sinai covenant-blood: *And Moses took the blood, and sprinkled it on the people, and said, Behold the blood of the covenant, which Yahuah (LORD) hath made with you concerning all these words* (Exodus 24:8). Jubilees binds Noah''s feast-of-oaths to the covenant cut at Sinai in the very same month — the patriarchal root of Shavuot as a covenant-renewal feast.',
       sv.verse_id, ev.verse_id, 'extras', 53134
  FROM _session251_ju06_lookup sv, _session251_ju06_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=6 AND sv.verse_number=10
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=6 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-6-feast-of-weeks-heavenly-tablets',
       E'The feast of weeks engraved on the heavenly tablets — it ain''t new',
       E'Here is the spine of Yoshi''s Appointed Times. Jubilees grounds Shavuot in the heavenly tablets and the fathers, centuries before Sinai: *For this reason it is ordained and written on the heavenly tables, that they should celebrate the feast of weeks in this month once a year, to renew the covenant every year* (Jubilees 6:17), kept from creation through Noah, *But Abraham observed it, and Isaac and Jacob and his children observed it up to your days* (Jubilees 6:19). It is named twofold — *For it is the feast of weeks and the feast of first-fruits: this feast is twofold and of a double nature* (Jubilees 6:21). The Torah counts that very feast: *And ye shall count unto you from the morrow after the sabbath, from the day that ye brought the sheaf of the wave offering; seven sabbaths shall be complete* (Leviticus 23:15); *Even unto the morrow after the seventh sabbath shall ye number fifty days* (Leviticus 23:16), the firstfruits loaves (Leviticus 23:17), proclaimed a holy convocation *for ever in all your dwellings throughout your generations* (Leviticus 23:21). The feast is not a later Jewish invention layered on; Jubilees says it was kept by the patriarchs and engraved on the tablets. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53137
  FROM _session251_ju06_lookup sv, _session251_ju06_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=6 AND sv.verse_number=17
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=6 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-6-364-day-year-against-the-moon',
       E'The 364-day year on the heavenly tablets, and the sinners who follow the moon',
       E'The calendar climax. Jubilees commands the solar reckoning engraved on the tablets — *And command you the children of Yashar''el (Israel) that they observe the years according to this reckoning-three hundred and sixty-four days, and (these) will constitute a complete year, and they will not disturb its time from its days and from its feasts* (Jubilees 6:32) — and warns that those who watch the moon will wreck the appointed times: *For there will be those who will assuredly make observations of the moon–now (it) disturbs the seasons and comes in from year to year ten days too soon* (Jubilees 6:36), confounding the holy with the unclean, *for they will go wrong as to the months and sabbaths and feasts and jubilees* (Jubilees 6:37). The live 1 Enoch apparatus speaks with one voice: *And the sun and the moon complete the year in three hundred and sixty-four days* (1 Enoch 74:10), the years brought in *that they may not change their order, but complete the years with righteousness, three hundred and sixty-four days* (1 Enoch 74:13); and the same indictment of the sinners — *And shall set aside all the commandments... And they shall alter the times, And the seasons, And the new moons, And the sabbaths, And the festivals, And they shall eat blood with all kinds of flesh* (1 Enoch 82:3), which echoes Jubilees 6:37''s blood-and-flesh closing line exactly. And Daniel names the same spirit in the last days: *and think to change times and laws* (Daniel 7:25). Yoshi''s Appointed Times: the order is fixed on the heavenly tablets — to follow the moon''s drift is to lose the path of the years.',
       sv.verse_id, ev.verse_id, 'extras', 53140
  FROM _session251_ju06_lookup sv, _session251_ju06_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=6 AND sv.verse_number=32
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=6 AND ev.verse_number=37
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jubilees-6-noah-altar-covenant
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 8:20 — *And Noah builded an altar unto Yahuah (LORD); and took of every clean beast, and of every clean fowl, and offered burnt offerings on the altar.* The Genesis source of Noah''s altar that Jubilees 6:1 dates to the new moon of the third month.'
  FROM cross_reference_threads t, cross_references x, _session251_ju06_lookup sv, _session251_ju06_lookup tv
 WHERE t.slug='jubilees-6-noah-altar-covenant'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=6 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=8 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 8:21 — *And Yahuah (LORD) smelled a sweet savour; and Yahuah (LORD) said in his heart, I will not again curse the ground any more for man''s sake; for the imagination of man''s heart is evil from his youth; neither will I again smite any more every thing living, as I have done.* The goodly savour of Jubilees 6:3 is the sweet savour Genesis records, and the same promise of no second flood follows.'
  FROM cross_reference_threads t, cross_references x, _session251_ju06_lookup sv, _session251_ju06_lookup tv
 WHERE t.slug='jubilees-6-noah-altar-covenant'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=6 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=8 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 8:22 — *While the earth remaineth, seedtime and harvest, and cold and heat, and summer and winter, and day and night shall not cease.* Jubilees 6:4 quotes this ordering of the seasons almost word for word as the content of the covenant Yahuah makes with Noah.'
  FROM cross_reference_threads t, cross_references x, _session251_ju06_lookup sv, _session251_ju06_lookup tv
 WHERE t.slug='jubilees-6-noah-altar-covenant'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=6 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=8 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 9:11 — *And I will establish my covenant with you; neither shall all flesh be cut off any more by the waters of a flood; neither shall there any more be a flood to destroy the earth.* The covenant of no second flood that Jubilees 6:4 names is the covenant Genesis 9 establishes.'
  FROM cross_reference_threads t, cross_references x, _session251_ju06_lookup sv, _session251_ju06_lookup tv
 WHERE t.slug='jubilees-6-noah-altar-covenant'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=6 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-6-be-fruitful-the-bow
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 9:1 — *And Elohim (God) blessed Noah and his sons, and said unto them, Be fruitful, and multiply, and replenish the earth.* The increase-and-multiply blessing of Jubilees 6:5,9 is the Genesis blessing on Noah, itself the creation mandate renewed after the flood.'
  FROM cross_reference_threads t, cross_references x, _session251_ju06_lookup sv, _session251_ju06_lookup tv
 WHERE t.slug='jubilees-6-be-fruitful-the-bow'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=6 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 9:2 — *And the fear of you and the dread of you shall be upon every beast of the earth, and upon every fowl of the air, upon all that moveth upon the earth, and upon all the fishes of the sea; into your hand are they delivered.* Jubilees 6:5 retells this dominion: the fear and dread inspired in everything on earth and in the sea.'
  FROM cross_reference_threads t, cross_references x, _session251_ju06_lookup sv, _session251_ju06_lookup tv
 WHERE t.slug='jubilees-6-be-fruitful-the-bow'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=6 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 9:13 — *I do set my bow in the cloud, and it shall be for a token of a covenant between me and the earth.* The bow Yahuah sets in Jubilees 6:16 as the sign of the covenant is the bow Genesis sets as its token.'
  FROM cross_reference_threads t, cross_references x, _session251_ju06_lookup sv, _session251_ju06_lookup tv
 WHERE t.slug='jubilees-6-be-fruitful-the-bow'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=6 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 9:16 — *And the bow shall be in the cloud; and I will look upon it, that I may remember the everlasting covenant between Elohim (God) and every living creature of all flesh that is upon the earth.* What Jubilees 6:16 calls the eternal covenant Genesis calls the everlasting covenant — a permanent sign, never abolished.'
  FROM cross_reference_threads t, cross_references x, _session251_ju06_lookup sv, _session251_ju06_lookup tv
 WHERE t.slug='jubilees-6-be-fruitful-the-bow'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=6 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-6-no-blood-the-life-is-the-blood
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 9:4 — *But flesh with the life thereof, which is the blood thereof, shall ye not eat.* The blood prohibition Jubilees 6:6 gives Noah is taken straight from Genesis'' covenant with Noah.'
  FROM cross_reference_threads t, cross_references x, _session251_ju06_lookup sv, _session251_ju06_lookup tv
 WHERE t.slug='jubilees-6-no-blood-the-life-is-the-blood'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=6 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 9:6 — *Whoso sheddeth man''s blood, by man shall his blood be shed: for in the image of Elohim (God) made he man.* Jubilees 6:8 quotes this image-of-Elohim ground for requiring the blood of man almost verbatim.'
  FROM cross_reference_threads t, cross_references x, _session251_ju06_lookup sv, _session251_ju06_lookup tv
 WHERE t.slug='jubilees-6-no-blood-the-life-is-the-blood'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=6 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 17:10 — *And whatsoever man there be of the house of Yashar''el (Israel), or of the strangers that sojourn among you, that eateth any manner of blood; I will even set my face against that soul that eateth blood, and will cut him off from among his people.* The Torah carries the Noahic no-blood law forward to Israel, with the same cutting-off Jubilees 6:11,13 commands.'
  FROM cross_reference_threads t, cross_references x, _session251_ju06_lookup sv, _session251_ju06_lookup tv
 WHERE t.slug='jubilees-6-no-blood-the-life-is-the-blood'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=6 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=17 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Leviticus 17:11 — *For the life of the flesh is in the blood: and I have given it to you upon the altar to make an atonement for your souls: for it is the blood that maketh an atonement for the soul.* Jubilees 6:6''s reason — the life of all flesh is in the blood — is the Torah''s own reason, and it is why the blood belongs on the altar (Jubilees 6:14).'
  FROM cross_reference_threads t, cross_references x, _session251_ju06_lookup sv, _session251_ju06_lookup tv
 WHERE t.slug='jubilees-6-no-blood-the-life-is-the-blood'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=6 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=17 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Leviticus 17:14 — *For it is the life of all flesh; the blood of it is for the life thereof: therefore I said unto the children of Yashar''el (Israel), Ye shall eat the blood of no manner of flesh: for the life of all flesh is the blood thereof: whosoever eateth it shall be cut off.* Word for word the rationale of Jubilees 6:6 — the life of all flesh is the blood — binding the same eternal commandment.'
  FROM cross_reference_threads t, cross_references x, _session251_ju06_lookup sv, _session251_ju06_lookup tv
 WHERE t.slug='jubilees-6-no-blood-the-life-is-the-blood'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=6 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=17 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-6-covenant-by-oath-blood-sprinkled-sinai
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 19:1 — *In the third month, when the children of Yashar''el (Israel) were gone forth out of the land of Egypt, the same day came they into the wilderness of Sinai.* Jubilees 6:11 makes the covenant on the mountain a third-month covenant, the very month Exodus places Israel at Sinai.'
  FROM cross_reference_threads t, cross_references x, _session251_ju06_lookup sv, _session251_ju06_lookup tv
 WHERE t.slug='jubilees-6-covenant-by-oath-blood-sprinkled-sinai'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=6 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=19 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 24:8 — *And Moses took the blood, and sprinkled it on the people, and said, Behold the blood of the covenant, which Yahuah (LORD) hath made with you concerning all these words.* The sprinkling of blood on the people because of all the words of the covenant in Jubilees 6:11 is the Sinai covenant-blood Exodus describes.'
  FROM cross_reference_threads t, cross_references x, _session251_ju06_lookup sv, _session251_ju06_lookup tv
 WHERE t.slug='jubilees-6-covenant-by-oath-blood-sprinkled-sinai'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=6 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=24 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-6-feast-of-weeks-heavenly-tablets
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 23:15 — *And ye shall count unto you from the morrow after the sabbath, from the day that ye brought the sheaf of the wave offering; seven sabbaths shall be complete.* The Torah''s count of weeks to Shavuot is the feast of weeks Jubilees 6:17 says was engraved on the heavenly tablets and kept from creation.'
  FROM cross_reference_threads t, cross_references x, _session251_ju06_lookup sv, _session251_ju06_lookup tv
 WHERE t.slug='jubilees-6-feast-of-weeks-heavenly-tablets'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=6 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 23:16 — *Even unto the morrow after the seventh sabbath shall ye number fifty days; and ye shall offer a new meat offering unto Yahuah (LORD).* The fifty-day count to the new offering matches the once-a-year feast of weeks Jubilees 6:21 calls twofold.'
  FROM cross_reference_threads t, cross_references x, _session251_ju06_lookup sv, _session251_ju06_lookup tv
 WHERE t.slug='jubilees-6-feast-of-weeks-heavenly-tablets'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=6 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 23:17 — *Ye shall bring out of your habitations two wave loaves of two tenth deals: they shall be of fine flour; they shall be baken with leaven; they are the firstfruits unto Yahuah (LORD).* Jubilees 6:21 names the feast ''the feast of weeks and the feast of first-fruits''; here are the firstfruits loaves the Torah commands for it.'
  FROM cross_reference_threads t, cross_references x, _session251_ju06_lookup sv, _session251_ju06_lookup tv
 WHERE t.slug='jubilees-6-feast-of-weeks-heavenly-tablets'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=6 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Leviticus 23:21 — *And ye shall proclaim on the selfsame day, that it may be an holy convocation unto you: ye shall do no servile work therein: it shall be a statute for ever in all your dwellings throughout your generations.* Jubilees 6:20 commands Israel to keep this festival in all their generations; the Torah seals it a statute for ever — never abolished.'
  FROM cross_reference_threads t, cross_references x, _session251_ju06_lookup sv, _session251_ju06_lookup tv
 WHERE t.slug='jubilees-6-feast-of-weeks-heavenly-tablets'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=6 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-6-364-day-year-against-the-moon
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 74:10 — *And the sun and the moon complete the year in three hundred and sixty-four days.* Enoch''s luminary order names the exact 364-day reckoning Jubilees 6:32 commands Israel to observe.'
  FROM cross_reference_threads t, cross_references x, _session251_ju06_lookup sv, _session251_ju06_lookup tv
 WHERE t.slug='jubilees-6-364-day-year-against-the-moon'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=6 AND sv.verse_number=32
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=74 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 74:13 — *And the moon brings in all the years exactly, that their stations may come, and that they may not transgress their reckoned stations, and that they may not change their order, but complete the years with righteousness, three hundred and sixty-four days.* The same 364-day order kept ''with righteousness'' that Jubilees 6:32 says must not disturb its feasts.'
  FROM cross_reference_threads t, cross_references x, _session251_ju06_lookup sv, _session251_ju06_lookup tv
 WHERE t.slug='jubilees-6-364-day-year-against-the-moon'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=6 AND sv.verse_number=32
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=74 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 82:3 — *And in those days the sinners shall alter the order, And shall set aside all the commandments of Yahuah (God) of Spirits... And they shall alter the times, And the seasons, And the new moons, And the sabbaths, And the festivals, And they shall eat blood with all kinds of flesh.* Enoch''s warning is Jubilees 6:37 word for word, closing on the same eating of blood with all kinds of flesh.'
  FROM cross_reference_threads t, cross_references x, _session251_ju06_lookup sv, _session251_ju06_lookup tv
 WHERE t.slug='jubilees-6-364-day-year-against-the-moon'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=6 AND sv.verse_number=37
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=82 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Daniel 7:25 — *And he shall speak great words against the El Elyon (most High), and shall wear out the saints of the El Elyon (most High), and think to change times and laws: and they shall be given into his hand until a time and times and the dividing of time.* The horn that thinks to change times and laws is Daniel''s name for the very disordering of the appointed times Jubilees 6:36-37 foretells.'
  FROM cross_reference_threads t, cross_references x, _session251_ju06_lookup sv, _session251_ju06_lookup tv
 WHERE t.slug='jubilees-6-364-day-year-against-the-moon'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=6 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

