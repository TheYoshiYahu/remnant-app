-- ----- fragment: minion_exodus_38.sql (Exodus 38) -----
-- Chapter: Exodus 38 (the brazen altar, the laver of the women''s mirrors, the court,
--   the SUM of the tabernacle of the testimony counted, the redemption-silver reckoned)
-- Tag: ex38   Session prefix: s305   Sort band: 29925 step +3
-- Temp view: _s305_ex38_lookup
--
-- THREADS (4):
--   exodus-38-the-brazen-altar-of-burnt-offering-made-foursquare      [free: canon]
--   exodus-38-the-laver-from-the-womens-mirrors-the-washing-of-the-word [free: canon]
--   exodus-38-the-tabernacle-of-the-testimony-the-earthly-copy-of-the-heavenly [free: canon]
--   exodus-38-the-redemption-silver-of-every-numbered-soul-the-ransom  [free: canon]
--
-- Exodus 38 coverage:
--   v.1-2  THE BRAZEN ALTAR MADE
--          NT:     none warranted (horns/altar-typology carried at Exod 27 lateral; light touch)
--          Extras: none warranted
--          Tanakh: Exod 27:1-2 (the altar-command this builds) -> THREAD 1
--   v.3-7  altar vessels, grate, staves -- construction detail; none warranted (folded under v.1-2)
--   v.8    THE LAVER OF BRASS FROM THE LOOKINGGLASSES OF THE WOMEN
--          NT:     Eph 5:26 (washing of water by the word); 2 Cor 3:18 (beholding as in a glass, changed into the image);
--                  James 1:23 + 1:25 (beholding the natural face in a glass vs the perfect law of liberty) -> THREAD 2
--          Extras: none warranted (Sirach 50 = later Simon/altar, not the laver; not load-bearing)
--          Tanakh: 1 Sam 2:22 (the women that assembled at the door) -> THREAD 2
--   v.9-20 THE COURT: hangings of fine twined linen, pillars, sockets -- gate/fine-linen weave carried at ch27; none added here
--   v.21   THE SUM OF THE TABERNACLE OF TESTIMONY, AS IT WAS COUNTED
--          NT:     Heb 8:5 (example and shadow, the pattern in the mount); Heb 9:23-24 (the patterns of things in the heavens, the figures of the true);
--                  Rev 15:5 (the temple of the tabernacle of the testimony in heaven opened) -> THREAD 3
--                  [complementary to live Revelation-anchored slug revelation-15-...-exodus-38; this is the EXODUS-38-anchored direction]
--          Extras: none warranted
--          Tanakh: none warranted (Heb supplies the pattern-language)
--   v.22-23 Bezaleel of Yahudah, Aholiab of Dan -- builders named; folded under v.21 (made all that Yahuah commanded)
--   v.24    the gold of the offering -- folded under the reckoning (v.25-31)
--   v.25-27 THE SILVER OF THE NUMBERED CONGREGATION, A BEKAH FOR EVERY MAN, BECAME THE SOCKETS
--          NT:     1 Pet 1:18-19 (redeemed not with silver but the precious blood of Messiah) -> THREAD 4
--          Extras: none warranted
--          Tanakh: Exod 30:12-16 (the ransom for the soul, the atonement-money); Num 1:2-3 (the numbering, twenty years and upward) -> THREAD 4
--   v.28-31 the silver hooks, the brass sockets/altar/pins -- construction tally; folded under v.25-27

CREATE TEMP VIEW _s305_ex38_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===================== cross_references =====================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the brazen altar of burnt offering made foursquare
    ('canon','exodus',38,1,'canon','exodus',27,1,'free',
     E'*And thou shalt make an altar of shittim wood, five cubits long, and five cubits broad; the altar shall be foursquare: and the height thereof shall be three cubits.* (Exodus 27:1). What Yahuah (LORD) commanded in the mount is now built to the cubit: *And he made the altar of burnt offering of shittim wood: five cubits was the length thereof, and five cubits the breadth thereof; it was foursquare* (Exodus 38:1). The pattern given becomes the pattern made -- exactly, nothing added, nothing left out.'),
    ('canon','exodus',38,2,'canon','exodus',27,2,'free',
     E'*And thou shalt make the horns of it upon the four corners thereof: his horns shall be of the same: and thou shalt overlay it with brass.* (Exodus 27:2). The horns of the altar -- the place atonement-blood was put -- are made as commanded: *And he made the horns thereof on the four corners of it; the horns thereof were of the same: and he overlaid it with brass* (Exodus 38:2). The altar of burnt offering is the door of approach, the brass that bears the fire of judgment.'),
    -- THREAD 2: the laver from the women''s mirrors -- the washing of the word
    ('canon','exodus',38,8,'canon','ephesians',5,26,'free',
     E'*That he might sanctify and cleanse it with the washing of water by the word,* (Ephesians 5:26). The laver of brass -- the basin of washing -- was made *of the lookingglasses of the women assembling* (Exodus 38:8); the bride is now cleansed at that laver by the water of the word. The vessel of cleansing was forged from surrendered mirrors, and its waters wash the gathered people clean.'),
    ('canon','exodus',38,8,'canon','2-corinthians',3,18,'free',
     E'*But we all, with open face beholding as in a glass the glory of Yahuah (Lord), are changed into the same image from glory to glory, even as by the Spirit of Yahuah (Lord).* (2 Corinthians 3:18). The women gave up the *lookingglasses* (Exodus 38:8) in which they saw themselves, and the brass became the laver. The glass that once returned self-reflection now, surrendered, returns his glory -- and the beholder is changed into that same image.'),
    ('canon','exodus',38,8,'canon','james',1,23,'free',
     E'*For if any be a hearer of the word, and not a doer, he is like unto a man beholding his natural face in a glass:* (James 1:23). The mirror that shows only the *natural face* is the un-surrendered glass; the women''s *lookingglasses* (Exodus 38:8) were given up to be made the laver of washing, the glass exchanged for the cleansing of the word that one must DO, not merely behold.'),
    ('canon','exodus',38,8,'canon','james',1,25,'free',
     E'*But whoso looketh into the perfect law of liberty, and continueth therein, he being not a forgetful hearer, but a doer of the work, this man shall be blessed in his deed.* (James 1:25). Against the vain mirror stands the *perfect law of liberty* -- the Torah looked into and kept. The women''s mirrors of self (Exodus 38:8) were melted into the laver of cleansing, the same exchange: self set down, the doing of the word taken up.'),
    ('canon','exodus',38,8,'canon','1-samuel',2,22,'free',
     E'*Now Eli was very old, and heard all that his sons did unto all Yashar''el (Israel); and how they lay with the women that assembled at the door of the tabernacle of the congregation.* (1 Samuel 2:22). The *women assembling, which assembled at the door of the tabernacle of the congregation* (Exodus 38:8) are the same serving women at the same door -- the laver born of their self-surrender stands as the rebuke of the priests who defiled them.'),
    -- THREAD 3: the tabernacle of the testimony -- earthly copy of the heavenly
    ('canon','exodus',38,21,'canon','hebrews',8,5,'free',
     E'*Who serve unto the example and shadow of heavenly things, as Moses was admonished of Elohim (God) when he was about to make the tabernacle: for, See, saith he, that thou make all things according to the pattern shewed to thee in the mount.* (Hebrews 8:5). *This is the sum of the tabernacle, even of the tabernacle of testimony, as it was counted, according to the commandment of Moses* (Exodus 38:21) -- every cubit of it built to the pattern shown in the mount, the earthly shadow of the heavenly true.'),
    ('canon','exodus',38,21,'canon','hebrews',9,23,'free',
     E'*It was therefore necessary that the patterns of things in the heavens should be purified with these; but the heavenly things themselves with better sacrifices than these.* (Hebrews 9:23). The *tabernacle of testimony* (Exodus 38:21) is named one of *the patterns of things in the heavens* -- a copy that points to its original; the figure was cleansed with blood, the heavenly itself with a better sacrifice.'),
    ('canon','exodus',38,21,'canon','hebrews',9,24,'free',
     E'*For Messiah (Christ) is not entered into the holy places made with hands, which are the figures of the true; but into heaven itself, now to appear in the presence of Elohim (God) for us:* (Hebrews 9:24). The *tabernacle of testimony* counted in Exodus 38:21 is one of the *holy places made with hands, which are the figures of the true* -- the Formed Son entered not the copy but heaven itself, the original it always pointed to.'),
    ('canon','exodus',38,21,'canon','revelation',15,5,'free',
     E'*And after that I looked, and, behold, the temple of the tabernacle of the testimony in heaven was opened:* (Revelation 15:5). The very phrase Moses'' record uses -- *the tabernacle of testimony* (Exodus 38:21) -- John sees standing OPEN in heaven: the heavenly original of which the wilderness tent was the counted copy. The pattern made on earth is the shadow of the temple now opened above.'),
    -- THREAD 4: the redemption-silver of every numbered soul -- the ransom
    ('canon','exodus',38,25,'canon','exodus',30,12,'free',
     E'*When thou takest the sum of the children of Yashar''el (Israel) after their number, then shall they give every man a ransom for his soul unto Yahuah (LORD), when thou numberest them; that there be no plague among them, when thou numberest them.* (Exodus 30:12). The *silver of them that were numbered of the congregation* (Exodus 38:25) is exactly this ransom -- *a ransom for his soul* -- now reckoned and weighed; every counted soul gave its redemption-price.'),
    ('canon','exodus',38,26,'canon','exodus',30,13,'free',
     E'*This they shall give, every one that passeth among them that are numbered, half a shekel after the shekel of the sanctuary: (a shekel is twenty gerahs:) an half shekel shall be the offering of Yahuah (LORD).* (Exodus 30:13). The reckoning fulfils the command to the gerah: *A bekah for every man, that is, half a shekel, after the shekel of the sanctuary* (Exodus 38:26) -- the rich no more, the poor no less, every soul ransomed at the same price.'),
    ('canon','exodus',38,26,'canon','exodus',30,16,'free',
     E'*And thou shalt take the atonement money of the children of Yashar''el (Israel), and shalt appoint it for the service of the tabernacle of the congregation; that it may be a memorial unto the children of Yashar''el (Israel) before Yahuah (LORD), to make an atonement for your souls.* (Exodus 30:16). The *atonement money* was to build the dwelling; in Exodus 38:26-27 it does -- *from twenty years old and upward, for six hundred thousand and three thousand and five hundred and fifty men* -- the ransom of every soul becoming the foundation it rests on.'),
    ('canon','exodus',38,26,'canon','numbers',1,2,'free',
     E'*Take ye the sum of all the congregation of the children of Yashar''el (Israel), after their families, by the house of their fathers, with the number of their names, every male by their polls;* (Numbers 1:2). The numbering reckoned in Exodus 38:26 -- *for every one that went to be numbered, from twenty years old and upward* -- is this census of the redeemed congregation, each soul named, counted, and ransomed.'),
    ('canon','exodus',38,26,'canon','numbers',1,3,'free',
     E'*From twenty years old and upward, all that are able to go forth to war in Yashar''el (Israel): thou and Aaron shall number them by their armies.* (Numbers 1:3). The age-line is identical -- *from twenty years old and upward* (Exodus 38:26) -- the ransomed host of warriors whose half-shekels were cast into the sockets of the sanctuary.'),
    ('canon','exodus',38,27,'canon','1-peter',1,18,'free',
     E'*Forasmuch as ye know that ye were not redeemed with corruptible things, as silver and gold, from your vain conversation received by tradition from your fathers;* (1 Peter 1:18). The silver of the ransom was cast into *the sockets of the sanctuary* (Exodus 38:27) -- the whole dwelling resting on redemption-money. Peter unfolds the type: the true redemption is not by silver at all.'),
    ('canon','exodus',38,27,'canon','1-peter',1,19,'free',
     E'*But with the precious blood of Messiah (Christ), as of a lamb without blemish and without spot:* (1 Peter 1:19). Every soul''s silver became *the sockets of the sanctuary... a talent for a socket* (Exodus 38:27) -- the house standing on the ransom of the people. The shadow of half-shekels finds its substance in the precious blood of the spotless Lamb on which the true sanctuary stands.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s305_ex38_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s305_ex38_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===================== threads =====================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-38-the-brazen-altar-of-burnt-offering-made-foursquare',
       E'The Brazen Altar of Burnt Offering — Made Foursquare as Commanded',
       E'In the mount Yahuah (LORD) gave the pattern: *And thou shalt make an altar of shittim wood, five cubits long, and five cubits broad; the altar shall be foursquare: and the height thereof shall be three cubits* (Exodus 27:1), *And thou shalt make the horns of it upon the four corners thereof... and thou shalt overlay it with brass* (Exodus 27:2). Now it is built to the cubit, nothing added, nothing left undone: *And he made the altar of burnt offering of shittim wood: five cubits was the length thereof, and five cubits the breadth thereof; it was foursquare* (Exodus 38:1), *And he made the horns thereof on the four corners of it... and he overlaid it with brass* (Exodus 38:2). The brazen altar is the place of approach — the brass that bears the fire of judgment, the horns where atonement-blood was put. The command given becomes the work made, exactly.',
       sv.verse_id, ev.verse_id, 'free', 29925
  FROM _s305_ex38_lookup sv, _s305_ex38_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=38 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=38 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-38-the-laver-from-the-womens-mirrors-the-washing-of-the-word',
       E'The Laver from the Women''s Mirrors — Self Surrendered to the Washing of the Word',
       E'*And he made the laver of brass, and the foot of it of brass, of the lookingglasses of the women assembling, which assembled at the door of the tabernacle of the congregation* (Exodus 38:8). The serving women gave up their mirrors — the very glass in which they saw themselves — and that brass was forged into the laver of cleansing. The whole gospel of sanctification is in the exchange: the glass that returned self-reflection, surrendered, becomes the vessel of washing. So the bride is *sanctif[ied] and cleanse[d]... with the washing of water by the word* (Ephesians 5:26); so *we all, with open face beholding as in a glass the glory of Yahuah (Lord), are changed into the same image from glory to glory* (2 Corinthians 3:18) — the mirror now shows his glory, not the self, and the beholder is transformed. James draws the same line: the un-surrendered man is *like unto a man beholding his natural face in a glass* (James 1:23), but the blessed man *looketh into the perfect law of liberty, and continueth therein... a doer of the work* (James 1:25) — the Torah looked into and kept, not the vain mirror of self. And these are the same *women that assembled at the door of the tabernacle of the congregation* (1 Samuel 2:22) whom Eli''s sons defiled — their self-surrender stands as the rebuke of the priests who profaned the door.',
       sv.verse_id, ev.verse_id, 'free', 29928
  FROM _s305_ex38_lookup sv, _s305_ex38_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=38 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=38 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-38-the-tabernacle-of-the-testimony-the-earthly-copy-of-the-heavenly',
       E'The Tabernacle of the Testimony — The Earthly Copy of the Heavenly Original',
       E'*This is the sum of the tabernacle, even of the tabernacle of testimony, as it was counted, according to the commandment of Moses* (Exodus 38:21). The wilderness tent is named *the tabernacle of testimony* — and it is not the original but the copy. *Who serve unto the example and shadow of heavenly things, as Moses was admonished of Elohim (God)... See, saith he, that thou make all things according to the pattern shewed to thee in the mount* (Hebrews 8:5): every cubit was built to a heavenly pattern. It is one of *the patterns of things in the heavens* (Hebrews 9:23), one of the *holy places made with hands, which are the figures of the true* — into which the Formed Son entered not, *but into heaven itself, now to appear in the presence of Elohim (God) for us* (Hebrews 9:24). And John sees the original standing open: *the temple of the tabernacle of the testimony in heaven was opened* (Revelation 15:5) — the very phrase of Moses'' record, the heavenly true of which the counted tent below was always the shadow.',
       sv.verse_id, ev.verse_id, 'free', 29931
  FROM _s305_ex38_lookup sv, _s305_ex38_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=38 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=38 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-38-the-redemption-silver-of-every-numbered-soul-the-ransom',
       E'The Redemption-Silver of Every Numbered Soul — The Ransom that Built the House',
       E'*And the silver of them that were numbered of the congregation was an hundred talents... A bekah for every man, that is, half a shekel, after the shekel of the sanctuary, for every one that went to be numbered, from twenty years old and upward, for six hundred thousand and three thousand and five hundred and fifty men* (Exodus 38:25-26); *And of the hundred talents of silver were cast the sockets of the sanctuary... a talent for a socket* (Exodus 38:27). Every ransomed soul''s silver became the foundation the dwelling rested on. This is the atonement-money commanded: *then shall they give every man a ransom for his soul unto Yahuah (LORD)* (Exodus 30:12), *half a shekel after the shekel of the sanctuary... an half shekel shall be the offering of Yahuah (LORD)* (Exodus 30:13), to be appointed *for the service of the tabernacle... to make an atonement for your souls* (Exodus 30:16). It is the census of Numbers — *Take ye the sum of all the congregation... every male by their polls* (Numbers 1:2), *From twenty years old and upward* (Numbers 1:3) — each soul named, counted, ransomed. And the type opens forward: *ye were not redeemed with corruptible things, as silver and gold... but with the precious blood of Messiah (Christ), as of a lamb without blemish and without spot* (1 Peter 1:18-19). The shadow of half-shekels finds its substance in the blood on which the true sanctuary stands.',
       sv.verse_id, ev.verse_id, 'free', 29934
  FROM _s305_ex38_lookup sv, _s305_ex38_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=38 AND sv.verse_number=25
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=38 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

-- ===================== thread_members =====================
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*And thou shalt make an altar of shittim wood, five cubits long, and five cubits broad; the altar shall be foursquare* (Exodus 27:1) — the altar-command given in the mount, now built to the cubit in 38:1.'
  FROM cross_reference_threads t
  JOIN _s305_ex38_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=38 AND sv.verse_number=1
  JOIN _s305_ex38_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=27 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-38-the-brazen-altar-of-burnt-offering-made-foursquare'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*And thou shalt make the horns of it upon the four corners thereof... and thou shalt overlay it with brass* (Exodus 27:2) — the horns where atonement-blood was put, made as commanded in 38:2.'
  FROM cross_reference_threads t
  JOIN _s305_ex38_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=38 AND sv.verse_number=2
  JOIN _s305_ex38_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=27 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-38-the-brazen-altar-of-burnt-offering-made-foursquare'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*That he might sanctify and cleanse it with the washing of water by the word* (Ephesians 5:26) — the laver of cleansing, forged from surrendered mirrors, fulfilled as the washing of the word.'
  FROM cross_reference_threads t
  JOIN _s305_ex38_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=38 AND sv.verse_number=8
  JOIN _s305_ex38_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=5 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-38-the-laver-from-the-womens-mirrors-the-washing-of-the-word'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*...with open face beholding as in a glass the glory of Yahuah (Lord), are changed into the same image* (2 Corinthians 3:18) — the mirror of self, surrendered, now returns his glory.'
  FROM cross_reference_threads t
  JOIN _s305_ex38_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=38 AND sv.verse_number=8
  JOIN _s305_ex38_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=3 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-38-the-laver-from-the-womens-mirrors-the-washing-of-the-word'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*...like unto a man beholding his natural face in a glass* (James 1:23) — the un-surrendered mirror of self, set against the laver of washing.'
  FROM cross_reference_threads t
  JOIN _s305_ex38_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=38 AND sv.verse_number=8
  JOIN _s305_ex38_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-38-the-laver-from-the-womens-mirrors-the-washing-of-the-word'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*But whoso looketh into the perfect law of liberty, and continueth therein... a doer of the work* (James 1:25) — the Torah looked into and kept, the doing of the word taken up.'
  FROM cross_reference_threads t
  JOIN _s305_ex38_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=38 AND sv.verse_number=8
  JOIN _s305_ex38_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-38-the-laver-from-the-womens-mirrors-the-washing-of-the-word'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*...the women that assembled at the door of the tabernacle of the congregation* (1 Samuel 2:22) — the same serving women at the same door, their self-surrender rebuking the priests who defiled them.'
  FROM cross_reference_threads t
  JOIN _s305_ex38_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=38 AND sv.verse_number=8
  JOIN _s305_ex38_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=2 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-38-the-laver-from-the-womens-mirrors-the-washing-of-the-word'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*...that thou make all things according to the pattern shewed to thee in the mount* (Hebrews 8:5) — the counted tent built to a heavenly pattern, the shadow of heavenly things.'
  FROM cross_reference_threads t
  JOIN _s305_ex38_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=38 AND sv.verse_number=21
  JOIN _s305_ex38_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=8 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-38-the-tabernacle-of-the-testimony-the-earthly-copy-of-the-heavenly'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*...the patterns of things in the heavens should be purified with these* (Hebrews 9:23) — the testimony-tent named a copy of the heavenly original.'
  FROM cross_reference_threads t
  JOIN _s305_ex38_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=38 AND sv.verse_number=21
  JOIN _s305_ex38_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=9 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-38-the-tabernacle-of-the-testimony-the-earthly-copy-of-the-heavenly'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*...the figures of the true; but into heaven itself* (Hebrews 9:24) — the Formed Son entered not the copy made with hands but the heavenly original.'
  FROM cross_reference_threads t
  JOIN _s305_ex38_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=38 AND sv.verse_number=21
  JOIN _s305_ex38_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=9 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-38-the-tabernacle-of-the-testimony-the-earthly-copy-of-the-heavenly'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*...the temple of the tabernacle of the testimony in heaven was opened* (Revelation 15:5) — the heavenly original, named in Moses'' very phrase, seen standing open.'
  FROM cross_reference_threads t
  JOIN _s305_ex38_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=38 AND sv.verse_number=21
  JOIN _s305_ex38_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=15 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-38-the-tabernacle-of-the-testimony-the-earthly-copy-of-the-heavenly'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*...then shall they give every man a ransom for his soul unto Yahuah (LORD), when thou numberest them* (Exodus 30:12) — the silver of the numbered is exactly this ransom for the soul.'
  FROM cross_reference_threads t
  JOIN _s305_ex38_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=38 AND sv.verse_number=25
  JOIN _s305_ex38_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=30 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-38-the-redemption-silver-of-every-numbered-soul-the-ransom'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*...half a shekel after the shekel of the sanctuary... an half shekel shall be the offering of Yahuah (LORD)* (Exodus 30:13) — the bekah reckoned in 38:26, the rich no more, the poor no less.'
  FROM cross_reference_threads t
  JOIN _s305_ex38_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=38 AND sv.verse_number=26
  JOIN _s305_ex38_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=30 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-38-the-redemption-silver-of-every-numbered-soul-the-ransom'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*...the atonement money... appoint it for the service of the tabernacle... to make an atonement for your souls* (Exodus 30:16) — the ransom becoming the dwelling it rests on.'
  FROM cross_reference_threads t
  JOIN _s305_ex38_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=38 AND sv.verse_number=26
  JOIN _s305_ex38_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=30 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-38-the-redemption-silver-of-every-numbered-soul-the-ransom'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Take ye the sum of all the congregation... every male by their polls* (Numbers 1:2) — the census of the ransomed, each soul named and counted.'
  FROM cross_reference_threads t
  JOIN _s305_ex38_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=38 AND sv.verse_number=26
  JOIN _s305_ex38_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=1 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-38-the-redemption-silver-of-every-numbered-soul-the-ransom'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*From twenty years old and upward... thou and Aaron shall number them by their armies* (Numbers 1:3) — the identical age-line of the ransomed host whose silver built the sockets.'
  FROM cross_reference_threads t
  JOIN _s305_ex38_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=38 AND sv.verse_number=26
  JOIN _s305_ex38_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=1 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-38-the-redemption-silver-of-every-numbered-soul-the-ransom'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*...ye were not redeemed with corruptible things, as silver and gold... from your fathers* (1 Peter 1:18) — the silver cast into the sockets is the shadow; the true redemption is not by silver.'
  FROM cross_reference_threads t
  JOIN _s305_ex38_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=38 AND sv.verse_number=27
  JOIN _s305_ex38_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=1 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-38-the-redemption-silver-of-every-numbered-soul-the-ransom'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*But with the precious blood of Messiah (Christ), as of a lamb without blemish and without spot* (1 Peter 1:19) — the substance of the half-shekels: the true sanctuary stands on the blood of the spotless Lamb.'
  FROM cross_reference_threads t
  JOIN _s305_ex38_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=38 AND sv.verse_number=27
  JOIN _s305_ex38_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=1 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-38-the-redemption-silver-of-every-numbered-soul-the-ransom'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
