-- ----- fragment: minion_1corinthians_11.sql (S228 1 Corinthians 11) -----
-- =====================================================================
-- S228 minion — 1 CORINTHIANS 11 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 1 CORINTHIANS 11 (34 verses).
-- Tag: co11 (temp view _s228_co11_lookup).
-- Sort band: floor 6850, step 3 (6850, 6853 used; under 6875).
-- Source is ALWAYS the canon 1 Corinthians verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME. Paul writes to the gathered seed at Corinth — Israel and the grafted-in made one.
-- Two load-bearing weaves in this chapter. (1) The headship and creation order (11:3,7-9) reads back
-- to Genesis: the man *the image and glory of Elohim (God)* and the woman *the glory of the man,*
-- *the man is not of the woman; but the woman of the man* — Adam formed first of the dust, the woman
-- built from his side as the help meet — held in balance by the counterweight *neither is the man
-- without the woman, neither the woman without the man, in Yahuah (the Lord)* (11:11), *but all things
-- of Elohim (God)* (11:12): an order of glory within mutual belonging, not a ranking of worth.
-- (2) The supper *which I also received of the Lord* (11:23-25) is the covenant-Passover memorial, not
-- a new rite severed from Israel: *This cup is the new covenant in my blood* (11:25) re-speaks the
-- blood of the covenant sprinkled at Sinai (*Behold the blood of the covenant,* Exodus 24:8) and the
-- new covenant Yahuah (LORD) promised to make *with the house of Yashar'el (Israel), and with the
-- house of Yahudah (Judah)* (Jeremiah 31:31) — the SAME house, the law written on the heart, NOT a
-- replacement people. *This do in remembrance of me* is the Passover *memorial... a feast to Yahuah
-- (LORD)... for ever* (Exodus 12:14). The institution is the very night of the gospels (Luke 22:19-20,
-- Matthew 26:26-28), the same words Paul received and delivered; *not discerning the body of Yahusha
-- (the Lord)* (11:29) is the failure to weigh that covenant body. Christology: the head of the Messiah
-- (Christ) is Elohim (God) (11:3) — the Formed Son ordered under the Father, the One; preserved.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-2   imitators of me; hold fast the traditions
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted (no load-bearing root)
--   v.3,7-9 headship; man the image and glory of Elohim, the woman the glory of the man; not of the
--           woman but the woman of the man; the woman created for the man
--           Tanakh: Genesis 1:26-27 (let us make man in our image... male and female), Genesis 2:18
--                   (an help meet), Genesis 2:21-23 (the rib, bone of my bones)
--           Extras: none warranted   NT: none warranted
--   v.10    authority on her head because of the angels
--           Tanakh: none warranted (carried in the creation-order thread)
--           Extras: none warranted   NT: none warranted
--   v.11-12 neither the man without the woman... in the Lord; all things of Elohim
--           Tanakh: Genesis 2:23 (taken out of Man — the counterweight of mutual belonging)
--           Extras: none warranted   NT: none warranted
--   v.13-16 nature, long hair, no such custom
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted
--   v.17-22 divisions at the gathering; the supper of Yahusha profaned
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted (setup to the supper)
--   v.23-26 received of the Lord; the bread and the cup; this cup is the new covenant in my blood;
--           this do in remembrance of me; shew the death till he come
--           Tanakh: Exodus 24:8 (the blood of the covenant), Jeremiah 31:31 (a new covenant with the
--                   house of Yashar'el and the house of Yahudah), Jeremiah 31:33 (my law in their
--                   inward parts), Exodus 12:14 (a memorial... a feast to Yahuah for ever)
--           Extras: none warranted   NT: Luke 22:19-20 (this is my body... this cup is the new
--                   testament in my blood), Matthew 26:26-28 (Take, eat; this is my body... my blood
--                   of the new testament)
--   v.27-34 discerning the body; examine himself; chastened of Yahuah
--           Tanakh: none warranted (v.29 carried in the supper thread)   Extras: none warranted
--           NT: none warranted
--
-- THREADS (slug -> target libraries):
--   6850 1-corinthians-11-the-head-of-the-woman-and-the-glory-of-creation-order-genesis-1-2   (Tanakh)
--   6853 1-corinthians-11-this-cup-is-the-new-covenant-in-my-blood-exodus-24-jeremiah-31      (Tanakh + NT)
-- =====================================================================

CREATE TEMP VIEW _s228_co11_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-corinthians-11-the-head-of-the-woman-and-the-glory-of-creation-order-genesis-1-2
  ('canon', '1-corinthians', 11, 7, 'canon', 'genesis', 1, 26, 'free', E'*And Elohim (God) said, Let us make man in our image, after our likeness: and let them have dominion over the fish of the sea, and over the fowl of the air, and over the cattle, and over all the earth, and over every creeping thing that creepeth upon the earth.* (Genesis 1:26). Paul grounds the man''s uncovered head in the creation: *a man indeed ought not to cover his head out of shame, forasmuch as he is the image and glory of Elohim (God)* (1 Corinthians 11:7). Man made *in our image, after our likeness,* given dominion, is the *image and glory of Elohim (God)* — and from that image-and-glory of the man the woman is drawn as his glory in turn. The order is one of glory and likeness reaching back to the making of man, not a ranking of worth.'),
  ('canon', '1-corinthians', 11, 7, 'canon', 'genesis', 1, 27, 'free', E'*So Elohim (God) created man in his own image, in the image of Elohim (God) created he him; male and female created he them.* (Genesis 1:27). The man is *the image and glory of Elohim (God); but the woman is the glory of the man* (1 Corinthians 11:7). Both *male and female* are *created... in the image of Elohim (God)* — the woman is no less the creature of Elohim (God) — yet Paul reads from the order of their making the layered glory: the man bearing the image and glory of the Maker, the woman the glory of the man. *Male and female created he them* holds them together even as 11:11-12 will, *neither is the man without the woman, neither the woman without the man, in Yahuah (the Lord).*'),
  ('canon', '1-corinthians', 11, 8, 'canon', 'genesis', 2, 21, 'free', E'*And Yahuah Elohim (the LORD God) caused a deep sleep to fall upon Adam, and he slept: and he took one of his ribs, and closed up the flesh instead thereof;* (Genesis 2:21). *For the man is not of the woman; but the woman of the man* (1 Corinthians 11:8). The woman was taken out of the man''s own side while the deep sleep was upon him — she is *of the man,* built from him, the ground of Paul''s reading. This is the source of *the woman is the glory of the man* and the counterweight that the man too comes *by the woman* (11:12): the first woman from the first man''s side, every man since by a woman, *but all things of Elohim (God).*'),
  ('canon', '1-corinthians', 11, 8, 'canon', 'genesis', 2, 23, 'free', E'*And Adam said, This is now bone of my bones, and flesh of my flesh: she shall be called Woman, because she was taken out of Man.* (Genesis 2:23). *For the man is not of the woman; but the woman of the man* (1 Corinthians 11:8). Adam names the cause: she *was taken out of Man* — *bone of my bones, and flesh of my flesh.* The woman is *of the man,* his very glory, drawn from his side; and yet the same kinship of bone and flesh is the mutual belonging Paul holds up against any contempt — *neither is the man without the woman, neither the woman without the man, in Yahuah (the Lord)* (1 Corinthians 11:11).'),
  ('canon', '1-corinthians', 11, 9, 'canon', 'genesis', 2, 18, 'free', E'*And Yahuah Elohim (the LORD God) said, It is not good that the man should be alone; I will make him an help meet for him.* (Genesis 2:18). *Neither was the man created for the woman; but the woman for the man* (1 Corinthians 11:9). The woman was made *an help meet for him* — for the man who was alone; this is what Paul means by *the woman for the man.* Yet the help meet is no lesser creature: she answers a lack the Maker himself named *not good,* and she comes from his side as bone of his bone, so that the order of purpose and the mutual need of 11:11-12 stand together.'),
  -- thread: 1-corinthians-11-this-cup-is-the-new-covenant-in-my-blood-exodus-24-jeremiah-31
  ('canon', '1-corinthians', 11, 25, 'canon', 'exodus', 24, 8, 'free', E'*And Moses took the blood, and sprinkled it on the people, and said, Behold the blood of the covenant, which Yahuah (LORD) hath made with you concerning all these words.* (Exodus 24:8). *This cup is the new covenant in my blood* (1 Corinthians 11:25). At Sinai the covenant was cut and sealed in blood sprinkled on the people — *the blood of the covenant.* The cup of the supper is that same covenant-in-blood brought to its fullness: not a new thing severed from the old, but *the new covenant in my blood,* the blood of the covenant poured out by the One who made the first. The supper is the covenant memorial of Yashar''el (Israel)''s Elohim (God), renewed, not replaced.'),
  ('canon', '1-corinthians', 11, 25, 'canon', 'jeremiah', 31, 31, 'free', E'*Behold, the days come, saith Yahuah (LORD), that I will make a new covenant with the house of Yashar''el (Israel), and with the house of Yahudah (Judah):* (Jeremiah 31:31). *This cup is the new covenant in my blood* (1 Corinthians 11:25). The very phrase Paul received is Jeremiah''s promise — but mark with whom the new covenant is made: *with the house of Yashar''el (Israel), and with the house of Yahudah (Judah).* The cup does not announce a covenant with a people that replaced Israel; it announces the covenant promised TO the two houses, into which the grafted-in seed at Corinth are brought. The same house, the same Elohim (God), the law written within.'),
  ('canon', '1-corinthians', 11, 25, 'canon', 'jeremiah', 31, 33, 'free', E'*But this shall be the covenant that I will make with the house of Yashar''el (Israel); After those days, saith Yahuah (LORD), I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people.* (Jeremiah 31:33). The new covenant of the cup (1 Corinthians 11:25) is no abolition of the law but its inward writing: *I will put my law in their inward parts, and write it in their hearts.* The covenant *in my blood* is the covenant that places the Torah within and seals the people to their Elohim (God) — *they shall be my people.* The supper, then, is the seal of a law-keeping people, not its release from the commandments.'),
  ('canon', '1-corinthians', 11, 24, 'canon', 'exodus', 12, 14, 'free', E'*And this day shall be unto you for a memorial; and ye shall keep it a feast to Yahuah (LORD) throughout your generations; ye shall keep it a feast by an ordinance for ever.* (Exodus 12:14). *This is my body, which is broken for you: this do in remembrance of me* (1 Corinthians 11:24). The supper is given on the night of the Passover, and Paul''s *this do in remembrance of me* answers the Passover charge: *this day shall be unto you for a memorial.* The Passover is *a feast to Yahuah (LORD)... by an ordinance for ever* — and the broken bread of the Lord''s supper is that memorial brought to its fulness in the slain Lamb, kept *till he come* (1 Corinthians 11:26), not a new rite cut loose from the feast Israel was charged to keep for ever.'),
  ('canon', '1-corinthians', 11, 24, 'canon', 'luke', 22, 19, 'free', E'*And he took bread, and gave thanks, and brake it, and gave unto them, saying, This is my body which is given for you: this do in remembrance of me.* (Luke 22:19). *That Yahusha (the Lord Jesus) the same night in which he was betrayed took bread: And when he had given thanks, he brake it, and said, Take, eat: this is my body, which is broken for you: this do in remembrance of me* (1 Corinthians 11:23-24). The gospel records the very words Paul *received of the Lord* and *delivered* — the bread taken, thanks given, broken, *this is my body... this do in remembrance of me.* What Paul hands the assembly is no innovation of his own but the institution of that Passover night, word for word.'),
  ('canon', '1-corinthians', 11, 25, 'canon', 'luke', 22, 20, 'free', E'*Likewise also the cup after supper, saying, This cup is the new testament in my blood, which is shed for you.* (Luke 22:20). *After the same manner also he took the cup, when he had supped, saying, This cup is the new covenant in my blood: this do ye, as oft as ye drink it, in remembrance of me* (1 Corinthians 11:25). The cup *after supper,* *the new testament in my blood... shed for you* — Luke and Paul give the same words from the same night. The new covenant of the cup is the blood of the covenant poured out, the Sinai covenant and Jeremiah''s promise sealed in the One who supped with the twelve.'),
  ('canon', '1-corinthians', 11, 24, 'canon', 'matthew', 26, 26, 'free', E'*And as they were eating, Yahusha (Jesus) took bread, and blessed it, and brake it, and gave it to the disciples, and said, Take, eat; this is my body.* (Matthew 26:26). *Take, eat: this is my body, which is broken for you* (1 Corinthians 11:24). Matthew records the bread of that night in the same words Paul delivered: *Take, eat; this is my body.* The institution Paul *received of the Lord* is the institution the gospel sets at the Passover table — one body broken, one word handed down.'),
  ('canon', '1-corinthians', 11, 25, 'canon', 'matthew', 26, 28, 'free', E'*For this is my blood of the new testament, which is shed for many for the remission of sins.* (Matthew 26:28). *This cup is the new covenant in my blood* (1 Corinthians 11:25). Matthew names the cup *my blood of the new testament, which is shed for many for the remission of sins* — the same new-covenant blood Paul puts in the assembly''s hands. The blood of the covenant at Sinai, the new covenant promised to the house of Yashar''el (Israel), and the cup of the supper are one stream, *shed for many* and remembered *till he come.*')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s228_co11_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s228_co11_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-corinthians-11-the-head-of-the-woman-and-the-glory-of-creation-order-genesis-1-2',
       E'The head of the woman and the glory of the creation order (Genesis 1-2)',
       E'Paul reasons the order of headship and covering straight out of the making of man and woman. *A man indeed ought not to cover his head out of shame, forasmuch as he is the image and glory of Elohim (God); but the woman is the glory of the man* (1 Corinthians 11:7) — for *Elohim (God) said, Let us make man in our image, after our likeness... and let them have dominion* (Genesis 1:26), and *So Elohim (God) created man in his own image, in the image of Elohim (God) created he him; male and female created he them* (Genesis 1:27). The man bears the image and glory of his Maker; the woman, drawn from him, is the glory of the man. *For the man is not of the woman; but the woman of the man* (1 Corinthians 11:8) — *Yahuah Elohim (the LORD God) caused a deep sleep to fall upon Adam... and he took one of his ribs* (Genesis 2:21), and Adam said *This is now bone of my bones, and flesh of my flesh: she shall be called Woman, because she was taken out of Man* (Genesis 2:23). *Neither was the man created for the woman; but the woman for the man* (1 Corinthians 11:9) — she was made *an help meet for him* when *Yahuah Elohim (the LORD God) said, It is not good that the man should be alone* (Genesis 2:18). But this is an order of glory, not a ranking of worth, and Paul guards it at once with the counterweight: *Nevertheless neither is the man without the woman, neither the woman without the man, in Yahuah (the Lord). For as the woman is of the man, even so is the man also by the woman; but all things of Elohim (God)* (1 Corinthians 11:11-12). The first woman came from the man''s side; every man since comes by a woman; and all of it, man and woman alike, of Elohim (God). The bone-of-my-bones kinship of Genesis 2 is the very ground of the mutual belonging — image and glory ordered, yet neither one without the other in Yahuah (the Lord).',
       sv.verse_id, ev.verse_id, 'free', 6850
  FROM _s228_co11_lookup sv, _s228_co11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=11 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='1-corinthians' AND ev.chapter_number=11 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-corinthians-11-this-cup-is-the-new-covenant-in-my-blood-exodus-24-jeremiah-31',
       E'This cup is the new covenant in my blood — the covenant-Passover memorial (Exodus 24, Jeremiah 31)',
       E'The supper Paul delivers is not a rite of his own devising and not a new thing severed from Israel: *I have received of Yahusha (the Lord) that which also I delivered unto you, That Yahusha (the Lord Jesus) the same night in which he was betrayed took bread... this is my body, which is broken for you: this do in remembrance of me. After the same manner also he took the cup... saying, This cup is the new covenant in my blood* (1 Corinthians 11:23-25). It is the very institution of that Passover night, the same words the gospels record — *This is my body which is given for you: this do in remembrance of me... This cup is the new testament in my blood, which is shed for you* (Luke 22:19-20); *Take, eat; this is my body... this is my blood of the new testament, which is shed for many for the remission of sins* (Matthew 26:26-28). And *the new covenant in my blood* is no covenant cut loose from Yashar''el (Israel). It re-speaks the blood that sealed Sinai: *Moses took the blood, and sprinkled it on the people, and said, Behold the blood of the covenant, which Yahuah (LORD) hath made with you concerning all these words* (Exodus 24:8). It names the covenant Yahuah (LORD) promised to make *with the house of Yashar''el (Israel), and with the house of Yahudah (Judah)* (Jeremiah 31:31) — the same two houses, not a replacement people — the covenant that *put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people* (Jeremiah 31:33). The cup seals a law-written people, not a people released from the commandments. And *this do in remembrance of me* answers the Passover charge: *this day shall be unto you for a memorial; and ye shall keep it a feast to Yahuah (LORD)... by an ordinance for ever* (Exodus 12:14). The broken bread and the cup are that memorial brought to its fulness in the slain Lamb, shewing *the death of Yahusha (the Lord) till he come* (1 Corinthians 11:26) — which is why *not discerning the body of Yahusha (the Lord)* (1 Corinthians 11:29) is no small thing: it is to eat the covenant memorial without weighing the covenant body. The supper is the covenant-Passover memorial of Yashar''el (Israel)''s Elohim (God), renewed in the blood of the Messiah (Christ), not a new rite that left Israel behind.',
       sv.verse_id, ev.verse_id, 'free', 6853
  FROM _s228_co11_lookup sv, _s228_co11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=11 AND sv.verse_number=23
   AND ev.edition_slug='canon' AND ev.book_slug='1-corinthians' AND ev.chapter_number=11 AND ev.verse_number=29
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-corinthians-11-the-head-of-the-woman-and-the-glory-of-creation-order-genesis-1-2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:26 — *Let us make man in our image, after our likeness... and let them have dominion* the making of man whose image-and-glory the man bears; *he is the image and glory of Elohim (God)* (1 Corinthians 11:7).'
  FROM cross_reference_threads t, cross_references x, _s228_co11_lookup sv, _s228_co11_lookup tv
 WHERE t.slug='1-corinthians-11-the-head-of-the-woman-and-the-glory-of-creation-order-genesis-1-2'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=11 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 1:27 — *in the image of Elohim (God) created he him; male and female created he them* both created in the image, yet the woman *the glory of the man* (1 Corinthians 11:7).'
  FROM cross_reference_threads t, cross_references x, _s228_co11_lookup sv, _s228_co11_lookup tv
 WHERE t.slug='1-corinthians-11-the-head-of-the-woman-and-the-glory-of-creation-order-genesis-1-2'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=11 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 2:21 — *Yahuah Elohim (the LORD God) caused a deep sleep to fall upon Adam... and he took one of his ribs* the woman built from the man''s side; *the woman of the man* (1 Corinthians 11:8).'
  FROM cross_reference_threads t, cross_references x, _s228_co11_lookup sv, _s228_co11_lookup tv
 WHERE t.slug='1-corinthians-11-the-head-of-the-woman-and-the-glory-of-creation-order-genesis-1-2'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=11 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 2:23 — *bone of my bones, and flesh of my flesh... taken out of Man* the cause Adam names; *the man is not of the woman; but the woman of the man* (1 Corinthians 11:8), the kinship that grounds the mutual belonging of 11:11.'
  FROM cross_reference_threads t, cross_references x, _s228_co11_lookup sv, _s228_co11_lookup tv
 WHERE t.slug='1-corinthians-11-the-head-of-the-woman-and-the-glory-of-creation-order-genesis-1-2'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=11 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Genesis 2:18 — *It is not good that the man should be alone; I will make him an help meet for him* the woman made for the man; *the woman for the man* (1 Corinthians 11:9), answering a lack the Maker named not good.'
  FROM cross_reference_threads t, cross_references x, _s228_co11_lookup sv, _s228_co11_lookup tv
 WHERE t.slug='1-corinthians-11-the-head-of-the-woman-and-the-glory-of-creation-order-genesis-1-2'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=11 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-corinthians-11-this-cup-is-the-new-covenant-in-my-blood-exodus-24-jeremiah-31
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 24:8 — *Behold the blood of the covenant, which Yahuah (LORD) hath made with you* the blood sprinkled at Sinai; *this cup is the new covenant in my blood* (1 Corinthians 11:25), the same covenant-in-blood brought to its fulness.'
  FROM cross_reference_threads t, cross_references x, _s228_co11_lookup sv, _s228_co11_lookup tv
 WHERE t.slug='1-corinthians-11-this-cup-is-the-new-covenant-in-my-blood-exodus-24-jeremiah-31'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=11 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=24 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 31:31 — *I will make a new covenant with the house of Yashar''el (Israel), and with the house of Yahudah (Judah)* the new covenant promised to the two houses; *this cup is the new covenant in my blood* (1 Corinthians 11:25), made WITH Israel, not replacing it.'
  FROM cross_reference_threads t, cross_references x, _s228_co11_lookup sv, _s228_co11_lookup tv
 WHERE t.slug='1-corinthians-11-this-cup-is-the-new-covenant-in-my-blood-exodus-24-jeremiah-31'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=11 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 31:33 — *I will put my law in their inward parts, and write it in their hearts... they shall be my people* the new covenant writes the Torah within; the cup (1 Corinthians 11:25) seals a law-written people, not its release from the commandments.'
  FROM cross_reference_threads t, cross_references x, _s228_co11_lookup sv, _s228_co11_lookup tv
 WHERE t.slug='1-corinthians-11-this-cup-is-the-new-covenant-in-my-blood-exodus-24-jeremiah-31'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=11 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Exodus 12:14 — *this day shall be unto you for a memorial... a feast to Yahuah (LORD)... by an ordinance for ever* the Passover memorial; *this do in remembrance of me* (1 Corinthians 11:24), the memorial brought to its fulness in the slain Lamb.'
  FROM cross_reference_threads t, cross_references x, _s228_co11_lookup sv, _s228_co11_lookup tv
 WHERE t.slug='1-corinthians-11-this-cup-is-the-new-covenant-in-my-blood-exodus-24-jeremiah-31'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=11 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Luke 22:19 — *This is my body which is given for you: this do in remembrance of me* the gospel''s record of the bread Paul *received of the Lord* and delivered (1 Corinthians 11:23-24).'
  FROM cross_reference_threads t, cross_references x, _s228_co11_lookup sv, _s228_co11_lookup tv
 WHERE t.slug='1-corinthians-11-this-cup-is-the-new-covenant-in-my-blood-exodus-24-jeremiah-31'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=11 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=22 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Luke 22:20 — *This cup is the new testament in my blood, which is shed for you* the cup after supper in the same words; *this cup is the new covenant in my blood* (1 Corinthians 11:25).'
  FROM cross_reference_threads t, cross_references x, _s228_co11_lookup sv, _s228_co11_lookup tv
 WHERE t.slug='1-corinthians-11-this-cup-is-the-new-covenant-in-my-blood-exodus-24-jeremiah-31'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=11 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=22 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Matthew 26:26 — *Take, eat; this is my body* the bread of that night in the same words Paul delivered; *Take, eat: this is my body, which is broken for you* (1 Corinthians 11:24).'
  FROM cross_reference_threads t, cross_references x, _s228_co11_lookup sv, _s228_co11_lookup tv
 WHERE t.slug='1-corinthians-11-this-cup-is-the-new-covenant-in-my-blood-exodus-24-jeremiah-31'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=11 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=26 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'Matthew 26:28 — *this is my blood of the new testament, which is shed for many for the remission of sins* the new-covenant blood of the cup; *this cup is the new covenant in my blood* (1 Corinthians 11:25), the Sinai and Jeremiah covenant sealed.'
  FROM cross_reference_threads t, cross_references x, _s228_co11_lookup sv, _s228_co11_lookup tv
 WHERE t.slug='1-corinthians-11-this-cup-is-the-new-covenant-in-my-blood-exodus-24-jeremiah-31'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=11 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=26 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
