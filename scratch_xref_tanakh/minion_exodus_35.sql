-- ----- fragment: minion_exodus_35.sql (Exodus 35) -----
-- Chapter: Exodus 35 — the build BEGINS: Sabbath reaffirmed FIRST, the willing-hearted
--   offering, the Spirit-filled craftsmen.
-- Tag: ex35   Session prefix: s305   Temp view: _s305_ex35_lookup
-- Sort band: 29850 step +3  (29850, 29853, 29856, 29859)
--
-- Exodus 35 coverage checklist (35 verses):
--   v.1-3  (Sabbath reaffirmed before the holy work; kindle no fire)
--          NT:     Hebrews 4:9-10 (he that is entered into his rest hath ceased from his own works)
--          Extras: none warranted (Sabbath chain is canon Torah/Prophets/NT)
--          Tanakh: Exodus 20:8-11; Exodus 31:13-17; Genesis 2:2-3; Isaiah 58:13-14
--   v.4-9  (take an offering, whosoever is of a willing heart)
--          NT:     2 Corinthians 9:7; 2 Corinthians 8:12 (the cheerful/willing giver)
--          Extras: Ecclesiasticus/Sirach 35:8-10 (give with a cheerful eye)
--          Tanakh: Exodus 25:2 (the original willing-heart command); 1 Chronicles 29:9,14; Psalm 110:3
--   v.10-19 (inventory of the tabernacle furniture to be made)
--          NT/Extras/Tanakh: none warranted standalone — gathered under v.4-9 willing-offering & v.30-35 craftsmen
--   v.20-24 (every one whose heart stirred him up brought the offering)
--          NT:     (under willing-offering thread) 2 Corinthians 9:7
--          Extras: (under willing-offering thread) Sirach 35:9-10
--          Tanakh: 1 Chronicles 29:9 (offered willingly with perfect heart)
--   v.25-26 (all the wise-hearted women spun with their hands)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: Psalm 110:3 (thy people shall be willing); 1 Chronicles 29:5 (who is willing to consecrate his service)
--   v.27-29 (rulers brought the stones; Yashar'el brought a willing offering)
--          NT:     (willing-offering thread) 2 Corinthians 8:12
--          Extras: (willing-offering thread) Sirach 35:8
--          Tanakh: 1 Chronicles 29:14 (all things come of thee, and of thine own have we given thee)
--   v.30-35 (Bezaleel & Aholiab filled with the spirit of Elohim, to work and to teach)
--          NT:     1 Corinthians 12:4-7 (diversities of gifts, the same Spirit); Ephesians 4:11-12 (gifts for the building up)
--          Extras: none warranted
--          Tanakh: Exodus 31:1-6 (the original calling); 1 Kings 7:14 (Hiram filled with wisdom to work in brass)
--
-- Threads (4):
--   exodus-35-the-sabbath-rest-comes-before-the-holy-work
--       [canon: Exodus, Hebrews, Genesis, Isaiah] tier free — even the tabernacle work
--       does not override the seventh-day rest; Torah-never-abolished, rest BEFORE works.
--   exodus-35-the-willing-hearted-offering-the-cheerful-giver
--       [canon: Exodus, 1 Chronicles, Psalms, 2 Corinthians + extras: Ecclesiasticus] tier extras —
--       the free, willing, cheerful gift, woven forward to the cheerful giver.
--   exodus-35-the-wise-hearted-women-who-spun
--       [canon: Psalms, 1 Chronicles] tier free — the willing hands of the women, thy
--       people willing in the day of thy power.
--   exodus-35-the-spirit-filled-craftsmen-gifted-to-build-and-to-teach
--       [canon: Exodus, 1 Kings, 1 Corinthians, Ephesians] tier free — the Spirit given for
--       the work AND to teach; one Spirit, diversities of gifts, for the building up.

CREATE TEMP VIEW _s305_ex35_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the Sabbath rest comes before the holy work (35:1-3)
    ('canon','exodus',35,2,'canon','exodus',20,8,'free',
     E'*Remember the sabbath day, to keep it holy* (Exodus 20:8). The build of the tabernacle opens not with a hammer but with the seventh day: *on the seventh day there shall be to you an holy day, a sabbath of rest to Yahuah* (Exodus 35:2). Even the holy work cannot override the rest already commanded at Sinai — the fourth word stands first.'),
    ('canon','exodus',35,2,'canon','exodus',20,11,'free',
     E'*For in six days Yahuah (LORD) made heaven and earth, the sea, and all that in them is, and rested the seventh day: wherefore Yahuah (LORD) blessed the sabbath day, and hallowed it* (Exodus 20:11). The *six days shall work be done, but on the seventh day there shall be to you... a sabbath of rest* of Exodus 35:2 is rooted in creation itself — the Sabbath is older than the tabernacle and is not abolished by it.'),
    ('canon','exodus',35,2,'canon','exodus',31,13,'free',
     E'*Verily my sabbaths ye shall keep: for it is a sign between me and you throughout your generations; that ye may know that I am Yahuah (LORD) that doth sanctify you* (Exodus 31:13). The very chapter that first named Bezaleel (Exodus 31) ended on the Sabbath sign; Exodus 35 repeats the order — Sabbath FIRST, then the craftsmen — so the sign that sanctifies is never traded for the work of our hands.'),
    ('canon','exodus',35,2,'canon','genesis',2,3,'free',
     E'*And Elohim (God) blessed the seventh day, and sanctified it: because that in it he had rested from all his work which Elohim (God) created and made* (Genesis 2:3). The *holy day, a sabbath of rest to Yahuah* of Exodus 35:2 is the seventh day Elohim Himself hallowed at the foundation of the world — the pattern the builders are bound to keep.'),
    ('canon','exodus',35,2,'canon','isaiah',58,13,'free',
     E'*If thou turn away thy foot from the sabbath, from doing thy pleasure on my holy day; and call the sabbath a delight, the holy of Yahuah (LORD), honourable* (Isaiah 58:13). The prophet reaches back to the *holy day, a sabbath of rest* of Exodus 35:2 — the Sabbath is no burden but a delight, kept in the days of the prophets exactly as in the days of the building.'),
    ('canon','exodus',35,2,'canon','hebrews',4,10,'free',
     E'*For he that is entered into his rest, he also hath ceased from his own works, as Elohim (God) did from his* (Hebrews 4:10). The *sabbath of rest to Yahuah* of Exodus 35:2 — set before all the labour of the tabernacle — is the very figure the NT fills: there remaineth a rest for the people of Elohim, and entering it means ceasing from our own works, not abolishing the day.'),

    -- THREAD 2: the willing-hearted offering, the cheerful giver (35:4-9, 20-29)
    ('canon','exodus',35,5,'canon','exodus',25,2,'free',
     E'*Speak unto the children of Yashar''el (Israel), that they bring me an offering: of every man that giveth it willingly with his heart ye shall take my offering* (Exodus 25:2). Exodus 35:5 carries out the very command first given on the mount — *whosoever is of a willing heart, let him bring it, an offering of Yahuah* — the gift Yahuah will receive is the free gift of the willing heart, never the extorted one.'),
    ('canon','exodus',35,29,'canon','1-chronicles',29,9,'free',
     E'*Then the people rejoiced, for that they offered willingly, because with perfect heart they offered willingly to Yahuah (LORD): and David the king also rejoiced with great joy* (1 Chronicles 29:9). When the second house was prepared, the same willing-heart of Exodus 35:29 — *every man and woman, whose heart made them willing* — flowed again: the offering Yahuah loves is poured out with a perfect heart and great gladness.'),
    ('canon','exodus',35,29,'canon','1-chronicles',29,14,'free',
     E'*But who am I, and what is my people, that we should be able to offer so willingly after this sort? for all things come of thee, and of thine own have we given thee* (1 Chronicles 29:14). David names the secret of the *willing offering* of Exodus 35:29 — even the gold the willing heart brings was first Yahuah''s; the giver returns only what was already given him.'),
    ('canon','exodus',35,5,'canon','psalms',110,3,'free',
     E'*Thy people shall be willing in the day of thy power, in the beauties of holiness from the womb of the morning* (Psalm 110:3). The *willing heart* of Exodus 35:5 prophesies the willing people of the Messiah''s reign — the gift Yahuah seeks has always been the freely-willing heart, the same heart that will answer the Formed Son in the day of his power.'),
    ('canon','exodus',35,5,'canon','2-corinthians',9,7,'free',
     E'*Every man according as he purposeth in his heart, so let him give; not grudgingly, or of necessity: for Elohim (God) loveth a cheerful giver* (2 Corinthians 9:7). Paul does not invent a new principle; he quotes the law of the tabernacle offering — *whosoever is of a willing heart, let him bring it* (Exodus 35:5). The cheerful giver of the assembly is the willing-hearted Yashar''el of the wilderness.'),
    ('canon','exodus',35,5,'canon','2-corinthians',8,12,'free',
     E'*For if there be first a willing mind, it is accepted according to that a man hath, and not according to that he hath not* (2 Corinthians 8:12). The acceptance turns on the *willing heart* of Exodus 35:5 — Yahuah measures the offering by the willingness, not the amount; the widow''s mite and the ruler''s onyx stones are weighed on the same scale of the heart.'),
    ('canon','exodus',35,5,'apocrypha','ecclesiasticus',35,10,'extras',
     E'*Give to the Most High according as he has enriched you; and as you have gotten, give with a cheerful eye* (Ecclesiasticus 35:10). The wisdom of the fathers guards the same Torah principle as Exodus 35:5 — *whosoever is of a willing heart, let him bring it* — the gift is to be given freely, with a cheerful eye, out of what the Most High Himself has provided.'),

    -- THREAD 3: the wise-hearted women who spun (35:25-26)
    ('canon','exodus',35,25,'canon','psalms',110,3,'free',
     E'*Thy people shall be willing in the day of thy power, in the beauties of holiness from the womb of the morning* (Psalm 110:3). The *women that were wise hearted did spin with their hands* (Exodus 35:25) are this willing people — their freely-offered labour, the work of willing hands, is the beauty of holiness the psalm foresees.'),
    ('canon','exodus',35,26,'canon','1-chronicles',29,5,'free',
     E'*The gold for things of gold... and for all manner of work to be made by the hands of artificers. And who then is willing to consecrate his service this day unto Yahuah (LORD)?* (1 Chronicles 29:5). The women *whose heart stirred them up in wisdom* (Exodus 35:26) answer David''s question before he asks it — to consecrate one''s skilled service is the willing offering of the hands, treasured by Yahuah in every generation.'),

    -- THREAD 4: the Spirit-filled craftsmen, gifted to build and to teach (35:30-35)
    ('canon','exodus',35,31,'canon','exodus',31,3,'free',
     E'*And I have filled him with the spirit of Elohim (God), in wisdom, and in understanding, and in knowledge, and in all manner of workmanship* (Exodus 31:3). Exodus 35:31 declares the calling already given on the mount fulfilled — *he hath filled him with the spirit of Elohim (God), in wisdom, in understanding, and in knowledge* — the Spirit equips the hands of the builder before a single board is cut.'),
    ('canon','exodus',35,31,'canon','1-kings',7,14,'free',
     E'*He was a widow''s son of the tribe of Naphtali... a worker in brass: and he was filled with wisdom, and understanding, and cunning to work all works in brass* (1 Kings 7:14). When the temple rose, Hiram bore the very gift of Bezaleel — *filled with the spirit of Elohim (God), in wisdom, in understanding, and in knowledge, and in all manner of workmanship* (Exodus 35:31) — the Spirit-given skill of the craftsman is no small thing but the means by which the dwelling of Yahuah is built.'),
    ('canon','exodus',35,34,'canon','1-corinthians',12,7,'free',
     E'*But the manifestation of the Spirit is given to every man to profit withal* (1 Corinthians 12:7). Bezaleel was filled with the Spirit not only to work but that *he may teach* (Exodus 35:34); so the diversities of gifts of the same Spirit are given to profit the whole body — the gift is never private, but for the building up of all.'),
    ('canon','exodus',35,34,'canon','ephesians',4,11,'free',
     E'*And he gave some, apostles; and some, prophets; and some, evangelists; and some, pastors and teachers* (Ephesians 4:11). The Spirit *put in his heart that he may teach* (Exodus 35:34) — the same pattern the NT names: gifts given *for the perfecting of the saints, for the work of the ministry, for the edifying of the body* (Ephesians 4:12). The Spirit-filled craftsman who teaches is the elder pattern of the gifted teacher.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s305_ex35_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s305_ex35_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-35-the-sabbath-rest-comes-before-the-holy-work',
       E'The Sabbath Rest Comes Before the Holy Work',
       E'Before a single board of the tabernacle is cut, Moses gathers the whole congregation and says: *Six days shall work be done, but on the seventh day there shall be to you an holy day, a sabbath of rest to Yahuah (LORD)* (Exodus 35:2). Even the most holy labour — the building of the dwelling-place of Yahuah — does not override the seventh-day rest. The rest comes FIRST.\n\nThis is the fourth word of Sinai standing unmoved: *Remember the sabbath day, to keep it holy* (Exodus 20:8), *for in six days Yahuah (LORD) made heaven and earth, the sea, and all that in them is, and rested the seventh day: wherefore Yahuah (LORD) blessed the sabbath day, and hallowed it* (Exodus 20:11). The Sabbath is older than the tabernacle — it reaches back to the foundation: *And Elohim (God) blessed the seventh day, and sanctified it: because that in it he had rested from all his work which Elohim (God) created and made* (Genesis 2:3).\n\nThe same chapter that first named the craftsmen sealed itself with the sign: *Verily my sabbaths ye shall keep: for it is a sign between me and you throughout your generations; that ye may know that I am Yahuah (LORD) that doth sanctify you* (Exodus 31:13). And the prophet calls it no burden but a delight: *call the sabbath a delight, the holy of Yahuah (LORD), honourable* (Isaiah 58:13). Far from being abolished, the day is fulfilled as the very figure of the rest that remains: *For he that is entered into his rest, he also hath ceased from his own works, as Elohim (God) did from his* (Hebrews 4:10). The order never changes — rest, then work; the day stands.',
       sv.verse_id, ev.verse_id, 'free', 29850
  FROM _s305_ex35_lookup sv, _s305_ex35_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=35 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=35 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-35-the-willing-hearted-offering-the-cheerful-giver',
       E'The Willing-Hearted Offering: The Cheerful Giver',
       E'The materials for the dwelling of Yahuah are not taxed or seized — they are freely brought: *Take ye from among you an offering unto Yahuah (LORD): whosoever is of a willing heart, let him bring it, an offering of Yahuah (LORD)* (Exodus 35:5). Three times the willing heart is named: *they came, both men and women, as many as were willing hearted* (35:22); *The children of Yashar''el (Israel) brought a willing offering unto Yahuah (LORD), every man and woman, whose heart made them willing* (35:29). This carries out the command first given on the mount: *of every man that giveth it willingly with his heart ye shall take my offering* (Exodus 25:2).\n\nWhen the second house was prepared, the same willing heart poured out again: *the people rejoiced, for that they offered willingly, because with perfect heart they offered willingly to Yahuah (LORD)* (1 Chronicles 29:9). And David named the secret of it — the giver returns only what was already given him: *for all things come of thee, and of thine own have we given thee* (1 Chronicles 29:14). It is the willing people the Messiah''s reign foresees: *Thy people shall be willing in the day of thy power* (Psalm 110:3).\n\nThis is exactly the principle the assembly inherits — Paul does not invent it, he quotes the Torah of the tabernacle: *Every man according as he purposeth in his heart, so let him give; not grudgingly, or of necessity: for Elohim (God) loveth a cheerful giver* (2 Corinthians 9:7); *for if there be first a willing mind, it is accepted according to that a man hath* (2 Corinthians 8:12). The wisdom of the fathers guards the same law: *Give to the Most High according as he has enriched you; and as you have gotten, give with a cheerful eye* (Ecclesiasticus 35:10). The gift Yahuah receives, in every age, is the free gift of the willing heart.',
       sv.verse_id, ev.verse_id, 'extras', 29853
  FROM _s305_ex35_lookup sv, _s305_ex35_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=35 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=35 AND ev.verse_number=29
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-35-the-wise-hearted-women-who-spun',
       E'The Wise-Hearted Women Who Spun',
       E'The willing offering was not only gold and stones from the rulers — it was skilled labour from the women: *And all the women that were wise hearted did spin with their hands, and brought that which they had spun, both of blue, and of purple, and of scarlet, and of fine linen* (Exodus 35:25); *And all the women whose heart stirred them up in wisdom spun goats'' hair* (Exodus 35:26). The same willing heart that gave the materials gave the work of the hands.\n\nThese willing hands are the people the psalm foresees: *Thy people shall be willing in the day of thy power, in the beauties of holiness from the womb of the morning* (Psalm 110:3) — the freely-offered labour is itself a beauty of holiness. And they answer David''s question before he asks it: *for all manner of work to be made by the hands of artificers. And who then is willing to consecrate his service this day unto Yahuah (LORD)?* (1 Chronicles 29:5). To consecrate one''s skilled service is the willing offering of the hands — treasured by Yahuah in every generation, woven into the very curtains of His dwelling.',
       sv.verse_id, ev.verse_id, 'free', 29856
  FROM _s305_ex35_lookup sv, _s305_ex35_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=35 AND sv.verse_number=25
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=35 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-35-the-spirit-filled-craftsmen-gifted-to-build-and-to-teach',
       E'The Spirit-Filled Craftsmen, Gifted to Build and to Teach',
       E'The work of the tabernacle is not natural skill alone — it is the Spirit of Elohim resting on the workers: *Yahuah (LORD) hath called by name Bezaleel the son of Uri, the son of Hur, of the tribe of Yahudah (Judah); and he hath filled him with the spirit of Elohim (God), in wisdom, in understanding, and in knowledge, and in all manner of workmanship* (Exodus 35:30-31). This fulfils the calling first spoken on the mount: *And I have filled him with the spirit of Elohim (God), in wisdom, and in understanding, and in knowledge, and in all manner of workmanship* (Exodus 31:3). The same Spirit-given skill raised the temple: Hiram too *was filled with wisdom, and understanding, and cunning to work all works in brass* (1 Kings 7:14).\n\nBut the gift is not for the worker alone — *he hath put in his heart that he may teach, both he, and Aholiab* (Exodus 35:34). The Spirit equips the craftsman to pass on the work. This is the elder pattern of the assembly''s gifts: *Now there are diversities of gifts, but the same Spirit... the manifestation of the Spirit is given to every man to profit withal* (1 Corinthians 12:4,7); *and he gave some, apostles; and some, prophets; and some, evangelists; and some, pastors and teachers; for the perfecting of the saints, for the work of the ministry, for the edifying of the body of Messiah (Christ)* (Ephesians 4:11-12). One Spirit, many gifts — given to build the dwelling and to teach the next hands to build it too.',
       sv.verse_id, ev.verse_id, 'free', 29859
  FROM _s305_ex35_lookup sv, _s305_ex35_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=35 AND sv.verse_number=30
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=35 AND ev.verse_number=35
ON CONFLICT (slug) DO NOTHING;

-- ===== thread_members =====
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    ('canon','exodus',35,2,'canon','exodus',20,8,1,E'*Remember the sabbath day, to keep it holy* (Exodus 20:8) — the fourth word stands first; the holy work begins with the holy day.'),
    ('canon','exodus',35,2,'canon','exodus',20,11,2,E'*Yahuah (LORD) blessed the sabbath day, and hallowed it* (Exodus 20:11) — the Sabbath is creation-rooted, older than the tabernacle.'),
    ('canon','exodus',35,2,'canon','exodus',31,13,3,E'*My sabbaths ye shall keep: for it is a sign between me and you* (Exodus 31:13) — the sign that sanctifies, never traded for the work of hands.'),
    ('canon','exodus',35,2,'canon','genesis',2,3,4,E'*Elohim (God) blessed the seventh day, and sanctified it* (Genesis 2:3) — the rest hallowed at the foundation of the world.'),
    ('canon','exodus',35,2,'canon','isaiah',58,13,5,E'*Call the sabbath a delight, the holy of Yahuah (LORD), honourable* (Isaiah 58:13) — the prophet keeps the day a delight, not a burden.'),
    ('canon','exodus',35,2,'canon','hebrews',4,10,6,E'*He that is entered into his rest... hath ceased from his own works* (Hebrews 4:10) — the rest fulfilled, the day not abolished.')
  ) AS m(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='exodus-35-the-sabbath-rest-comes-before-the-holy-work'
  JOIN _s305_ex35_lookup sv ON sv.edition_slug=m.src_edition AND sv.book_slug=m.src_slug AND sv.chapter_number=m.src_ch AND sv.verse_number=m.src_v
  JOIN _s305_ex35_lookup tv ON tv.edition_slug=m.tgt_edition AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    ('canon','exodus',35,5,'canon','exodus',25,2,1,E'*That they bring me an offering: of every man that giveth it willingly with his heart* (Exodus 25:2) — the original willing-heart command, now carried out.'),
    ('canon','exodus',35,29,'canon','1-chronicles',29,9,2,E'*They offered willingly, because with perfect heart they offered willingly to Yahuah (LORD)* (1 Chronicles 29:9) — the same willing heart for the second house.'),
    ('canon','exodus',35,29,'canon','1-chronicles',29,14,3,E'*For all things come of thee, and of thine own have we given thee* (1 Chronicles 29:14) — the giver returns only what was already given him.'),
    ('canon','exodus',35,5,'canon','psalms',110,3,4,E'*Thy people shall be willing in the day of thy power* (Psalm 110:3) — the willing heart prophesies the willing people of the Messiah''s reign.'),
    ('canon','exodus',35,5,'canon','2-corinthians',9,7,5,E'*Elohim (God) loveth a cheerful giver* (2 Corinthians 9:7) — Paul quotes the Torah of the offering; the cheerful giver is the willing-hearted Yashar''el.'),
    ('canon','exodus',35,5,'canon','2-corinthians',8,12,6,E'*If there be first a willing mind, it is accepted* (2 Corinthians 8:12) — measured by willingness, not amount.'),
    ('canon','exodus',35,5,'apocrypha','ecclesiasticus',35,10,7,E'*As you have gotten, give with a cheerful eye* (Ecclesiasticus 35:10) — the fathers'' wisdom guards the same willing, cheerful gift.')
  ) AS m(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='exodus-35-the-willing-hearted-offering-the-cheerful-giver'
  JOIN _s305_ex35_lookup sv ON sv.edition_slug=m.src_edition AND sv.book_slug=m.src_slug AND sv.chapter_number=m.src_ch AND sv.verse_number=m.src_v
  JOIN _s305_ex35_lookup tv ON tv.edition_slug=m.tgt_edition AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    ('canon','exodus',35,25,'canon','psalms',110,3,1,E'*Thy people shall be willing in the day of thy power, in the beauties of holiness* (Psalm 110:3) — the women''s willing hands are this beauty of holiness.'),
    ('canon','exodus',35,26,'canon','1-chronicles',29,5,2,E'*Who then is willing to consecrate his service this day unto Yahuah (LORD)?* (1 Chronicles 29:5) — the wise-hearted women answer the call to consecrated, skilled service.')
  ) AS m(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='exodus-35-the-wise-hearted-women-who-spun'
  JOIN _s305_ex35_lookup sv ON sv.edition_slug=m.src_edition AND sv.book_slug=m.src_slug AND sv.chapter_number=m.src_ch AND sv.verse_number=m.src_v
  JOIN _s305_ex35_lookup tv ON tv.edition_slug=m.tgt_edition AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    ('canon','exodus',35,31,'canon','exodus',31,3,1,E'*I have filled him with the spirit of Elohim (God), in wisdom, and in understanding, and in knowledge* (Exodus 31:3) — the calling first given on the mount, now fulfilled.'),
    ('canon','exodus',35,31,'canon','1-kings',7,14,2,E'*Filled with wisdom, and understanding, and cunning to work all works in brass* (1 Kings 7:14) — Hiram bears Bezaleel''s gift to build the temple.'),
    ('canon','exodus',35,34,'canon','1-corinthians',12,7,3,E'*The manifestation of the Spirit is given to every man to profit withal* (1 Corinthians 12:7) — the gift is never private; it profits the whole body.'),
    ('canon','exodus',35,34,'canon','ephesians',4,11,4,E'*He gave some... pastors and teachers; for the perfecting of the saints* (Ephesians 4:11-12) — the Spirit-filled teacher pattern, for the building up.')
  ) AS m(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='exodus-35-the-spirit-filled-craftsmen-gifted-to-build-and-to-teach'
  JOIN _s305_ex35_lookup sv ON sv.edition_slug=m.src_edition AND sv.book_slug=m.src_slug AND sv.chapter_number=m.src_ch AND sv.verse_number=m.src_v
  JOIN _s305_ex35_lookup tv ON tv.edition_slug=m.tgt_edition AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
