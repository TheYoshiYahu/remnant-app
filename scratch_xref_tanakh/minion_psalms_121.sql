-- ----- fragment: minion_psalms_121.sql (Psalm 121) -----
-- Chapter: Psalm 121 (Song of Ascents — the Keeper of Yashar'el)
-- Tag: ps121   Session prefix: s302   Sort band base: 25000 (25000, 25003, 25006, 25009)
-- Temp view: _s302_ps121_lookup
--
-- Psalm 121 coverage:
--   v.1-2 (help from the Maker of heaven and earth):
--        NT:     John 1:3 (all things made by the Formed Word) — taken
--        Extras: Jubilees 2:1 (Maker finished in six days + kept Sabbath) — taken
--        Tanakh: Psalm 124:8 (our help in the name of Yahuah who made heaven and earth) + Genesis 1:1 (in the beginning Elohim created) — taken
--   v.3-4 (he that keepeth Yashar'el shall neither slumber nor sleep):
--        NT:     Romans 11:1-2 (Elohim hath NOT cast away his people) — taken (two-house guard)
--        Extras: none warranted (the keeping-of-Israel weave is canon/two-house; extras add no clean witness here)
--        Tanakh: Jeremiah 31:10 (he that scattered Yashar'el will gather him, and keep him) + Ezekiel 37:19 (two sticks made one) — taken
--   v.5-6 (Yahuah thy keeper / thy shade / sun shall not smite thee by day, nor moon by night):
--        NT:     Revelation 7:16 (neither shall the sun light on them, nor any heat) — taken
--        Extras: 1 Enoch 41:5-7 (the sun and moon keep their oath-bound courses before Yahuah) — taken
--        Tanakh: Isaiah 49:10 (neither shall the heat nor sun smite them) — taken
--   v.7-8 (preserve thee from all evil / going out and coming in):
--        NT:     John 17:15 (keep them from the evil) + 2 Thessalonians 3:3 (Yahuah is faithful, keep you from evil) — taken
--        Extras: none warranted (the preserving + Torah-blessing weave is canon)
--        Tanakh: Deuteronomy 28:6 (blessed comest in / goest out) + Deuteronomy 31:2 (I can no more go out and come in) — taken
--
-- Threads (4):
--   1. psalm-121-my-help-from-the-maker-of-heaven-and-earth  [Tanakh + NT + Extras(Jubilees)] tier=extras  band 25000
--   2. psalm-121-he-that-keepeth-yasharel-shall-not-slumber  [Tanakh + NT]                      tier=free    band 25003
--   3. psalm-121-the-sun-shall-not-smite-thee-by-day         [Tanakh + NT + Extras(1 Enoch)]    tier=extras  band 25006
--   4. psalm-121-preserve-thy-going-out-and-thy-coming-in    [Tanakh + NT]                       tier=free    band 25009
--
-- Framework-load-bearing notes:
--   * v.2 "which made heaven and earth": framed Formed/Formless — the Maker made all things BY the Formed Word
--     (John 1:3), never a co-equal second person; the Father is the formless Source, the Word the expressed Maker.
--   * v.4 "he that keepeth Yashar'el": framed two-house — the Keeper guards the WHOLE house (Judah + scattered
--     Ephraim), bound to Jer 31:10 / Ezek 37:19 and guarded by Rom 11:1-2 against replacement (NOT cast away).
--   * v.6 sun/moon: extras witness 1 Enoch 41 reads the luminaries as oath-bound servants of the Maker, not powers
--     to be feared — the Keeper rules the very lights that "shall not smite thee."

CREATE TEMP VIEW _s302_ps121_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== B. cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: my help from the Maker of heaven and earth (v.1-2)
    ('canon','psalms',121,2,'canon','psalms',124,8,'free',
     E'*Our help is in the name of Yahuah (LORD), who made heaven and earth* (Psalm 124:8). The companion Song of Ascents sings the same confession the lifted eyes of Psalm 121 reach for — *My help cometh from Yahuah (LORD), which made heaven and earth* (Psalm 121:2). The help is never in the hills themselves; it is in the Name of the One who made the hills.'),
    ('canon','psalms',121,2,'canon','john',1,3,'free',
     E'*All things were made by him; and without him was not any thing made that was made* (John 1:3). The Maker of *heaven and earth* (Psalm 121:2) made them by the Formed Word — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God)* (John 1:1). The formless Father is the Source; the Word is the expressed Maker through whom the help comes, never a rival second power.'),
    ('canon','psalms',121,2,'canon','genesis',1,1,'free',
     E'*In the beginning Elohim (God) created the heaven and the earth* (Genesis 1:1). The psalm grounds its hope in the first act of the canon — *Yahuah (LORD), which made heaven and earth* (Psalm 121:2). The One who began the world holds the one who lifts his eyes to its hills.'),
    ('canon','psalms',121,2,'jubilees','jubilees',2,1,'extras',
     E'*Write the complete history of the creation, how in six days Yahuah Elohim (the LORD God) finished all His works and all that He created, and kept Sabbath on the seventh day and hallowed it for all ages, and appointed it as a sign for all His works* (Jubilees 2:1). The Maker of *heaven and earth* (Psalm 121:2) is the same who sealed the work with the Sabbath sign — the appointed rest set in creation, never abolished. To trust the Maker is to keep his sign.'),
    -- Thread 2: he that keepeth Yashar'el shall neither slumber nor sleep (v.3-4)
    ('canon','psalms',121,4,'canon','jeremiah',31,10,'free',
     E'*Hear the word of Yahuah (LORD), O ye nations, and declare it in the isles afar off, and say, He that scattered Yashar''el (Israel) will gather him, and keep him, as a shepherd doth his flock* (Jeremiah 31:10). The sleepless Keeper of Psalm 121 is the Shepherd who keeps the scattered flock — *he that keepeth Yashar''el (Israel) shall neither slumber nor sleep* (Psalm 121:4). The same hand that scattered the northern house will gather and KEEP it; the watch never lapses.'),
    ('canon','psalms',121,4,'canon','ezekiel',37,19,'free',
     E'*Behold, I will take the stick of Joseph, which is in the hand of Ephraim, and the tribes of Yashar''el (Israel) his fellows... even with the stick of Yahudah (Judah), and make them one stick, and they shall be one in mine hand* (Ezekiel 37:19). The Keeper who *shall neither slumber nor sleep* (Psalm 121:4) keeps the WHOLE house — Judah and scattered Ephraim — to be made one again in his hand. He guards both sticks toward the one ingathering.'),
    ('canon','psalms',121,4,'canon','romans',11,1,'free',
     E'*I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin* (Romans 11:1). The Keeper does not sleep AND does not forsake — *he that keepeth Yashar''el (Israel) shall neither slumber nor sleep* (Psalm 121:4). Paul forbids the replacement reading at the root: the people the Keeper watches are not cast off.'),
    ('canon','psalms',121,4,'canon','romans',11,2,'free',
     E'*Elohim (God) hath not cast away his people which he foreknew* (Romans 11:2). The sleepless watch of Psalm 121 is the standing proof — *he that keepeth Yashar''el (Israel) shall neither slumber nor sleep* (Psalm 121:4). Foreknown and kept, never abandoned: the Keeper''s vigilance over Yashar''el is unbroken across both covenants.'),
    -- Thread 3: the sun shall not smite thee by day, nor the moon by night (v.5-6)
    ('canon','psalms',121,6,'canon','isaiah',49,10,'free',
     E'*They shall not hunger nor thirst; neither shall the heat nor sun smite them: for he that hath mercy on them shall lead them, even by the springs of water shall he guide them* (Isaiah 49:10). The promise of Psalm 121 — *The sun shall not smite thee by day* (Psalm 121:6) — is the regathering promise: the One who is *thy shade upon thy right hand* (Psalm 121:5) shields the returning exiles and leads them home.'),
    ('canon','psalms',121,6,'canon','revelation',7,16,'free',
     E'*They shall hunger no more, neither thirst any more; neither shall the sun light on them, nor any heat* (Revelation 7:16). The keeping shade of Psalm 121 finds its consummation among the gathered tribes before the throne — *The sun shall not smite thee by day, nor the moon by night* (Psalm 121:6). The Keeper who shaded the pilgrim brings him at last where no heat can reach.'),
    ('canon','psalms',121,6,'enoch','1-enoch',41,5,'extras',
     E'*And I saw the chambers of the sun and moon, whence they proceed and whither they come again... and how they do not leave their orbit... and they keep faith one with another: and in accordance with an oath they set and they rise* (1 Enoch 41:5). The sun and moon that *shall not smite thee by day... nor... by night* (Psalm 121:6) are not powers to dread but oath-bound servants of the Maker, keeping the courses he set. The Keeper rules the very lights, so they cannot harm the one he keeps.'),
    -- Thread 4: preserve thy going out and thy coming in (v.7-8)
    ('canon','psalms',121,7,'canon','john',17,15,'free',
     E'*I pray not that thou shouldest take them out of the world, but that thou shouldest keep them from the evil* (John 17:15). The Formed Son prays the very preservation Psalm 121 promises — *Yahuah (LORD) shall preserve thee from all evil* (Psalm 121:7). Not removal from the world, but keeping IN it; the Keeper''s shield, not escape.'),
    ('canon','psalms',121,7,'canon','2-thessalonians',3,3,'free',
     E'*But Yahuah (Lord) is faithful, who shall stablish you, and keep you from evil* (2 Thessalonians 3:3). The apostolic word echoes the psalm''s pledge — *Yahuah (LORD) shall preserve thee from all evil: he shall preserve thy soul* (Psalm 121:7). The faithfulness that keeps is the Keeper himself, unchanged from psalm to epistle.'),
    ('canon','psalms',121,8,'canon','deuteronomy',28,6,'free',
     E'*Blessed shalt thou be when thou comest in, and blessed shalt thou be when thou goest out* (Deuteronomy 28:6). The psalm sings back the Torah blessing — *Yahuah (LORD) shall preserve thy going out and thy coming in* (Psalm 121:8). The covenant obedience that opens the blessing is the same walk the Keeper guards; the preserving is the inheritance, never the curse.'),
    ('canon','psalms',121,8,'canon','deuteronomy',31,2,'free',
     E'*And he said unto them, I am an hundred and twenty years old this day; I can no more go out and come in: also Yahuah (LORD) hath said unto me, Thou shalt not go over this Jordan* (Deuteronomy 31:2). Moses lays down the going-out-and-coming-in at the border; the psalm answers that the LORD himself takes it up — *Yahuah (LORD) shall preserve thy going out and thy coming in from this time forth, and even for evermore* (Psalm 121:8). What the servant could no longer do, the Keeper does forever.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s302_ps121_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s302_ps121_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== C. threads =====
-- Thread 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-121-my-help-from-the-maker-of-heaven-and-earth',
       E'My help cometh from Yahuah, which made heaven and earth',
       E'The pilgrim lifts his eyes — *I will lift up mine eyes unto the hills, from whence cometh my help* (Psalm 121:1) — and finds the help is never in the hills but in the One who made them: *My help cometh from Yahuah (LORD), which made heaven and earth* (Psalm 121:2). The companion ascent-song confesses the same — *Our help is in the name of Yahuah (LORD), who made heaven and earth* (Psalm 124:8) — and the canon opens with that very Maker: *In the beginning Elohim (God) created the heaven and the earth* (Genesis 1:1). He made it all by the Formed Word: *All things were made by him; and without him was not any thing made that was made* (John 1:3) — the formless Father the Source, the expressed Word the Maker, never a rival power. And the restored witness seals the work with the appointed rest: *in six days Yahuah Elohim (the LORD God) finished all His works... and kept Sabbath on the seventh day and hallowed it for all ages, and appointed it as a sign for all His works* (Jubilees 2:1). To lift the eyes to the Maker is to trust the One whose Sabbath sign still stands.',
       sv.verse_id, ev.verse_id, 'extras', 25000
  FROM _s302_ps121_lookup sv, _s302_ps121_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=121 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=121 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- Thread 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-121-he-that-keepeth-yasharel-shall-not-slumber',
       E'He that keepeth Yashar''el shall neither slumber nor sleep',
       E'*He will not suffer thy foot to be moved: he that keepeth thee will not slumber* (Psalm 121:3) — and the watch widens from the one pilgrim to the whole people: *Behold, he that keepeth Yashar''el (Israel) shall neither slumber nor sleep* (Psalm 121:4). This is the Keeper of both houses. He scattered the northern house and yet keeps it: *He that scattered Yashar''el (Israel) will gather him, and keep him, as a shepherd doth his flock* (Jeremiah 31:10), to be made one again with Judah — *I will take the stick of Joseph... even with the stick of Yahudah (Judah), and make them one stick, and they shall be one in mine hand* (Ezekiel 37:19). And lest any read the Keeper as having let his people go, the apostle forbids it at the root: *Hath Elohim (God) cast away his people? Elohim (God) forbid* (Romans 11:1); *Elohim (God) hath not cast away his people which he foreknew* (Romans 11:2). The sleepless watch over Yashar''el is unbroken — never replaced, never abandoned.',
       sv.verse_id, ev.verse_id, 'free', 25003
  FROM _s302_ps121_lookup sv, _s302_ps121_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=121 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=121 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- Thread 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-121-the-sun-shall-not-smite-thee-by-day',
       E'The sun shall not smite thee by day, nor the moon by night',
       E'*Yahuah (LORD) is thy keeper: Yahuah (LORD) is thy shade upon thy right hand* (Psalm 121:5), and so *The sun shall not smite thee by day, nor the moon by night* (Psalm 121:6). The same shade shields the returning exiles: *neither shall the heat nor sun smite them: for he that hath mercy on them shall lead them, even by the springs of water shall he guide them* (Isaiah 49:10), and brings them at last where no heat can reach: *neither shall the sun light on them, nor any heat* (Revelation 7:16). The very lights are no terror but oath-bound servants of the Maker: *I saw the chambers of the sun and moon... how they do not leave their orbit... and they keep faith one with another: and in accordance with an oath they set and they rise* (1 Enoch 41:5). The Keeper rules the lights, so they cannot harm the one he keeps.',
       sv.verse_id, ev.verse_id, 'extras', 25006
  FROM _s302_ps121_lookup sv, _s302_ps121_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=121 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=121 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- Thread 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-121-preserve-thy-going-out-and-thy-coming-in',
       E'Yahuah shall preserve thy going out and thy coming in',
       E'*Yahuah (LORD) shall preserve thee from all evil: he shall preserve thy soul* (Psalm 121:7), *Yahuah (LORD) shall preserve thy going out and thy coming in from this time forth, and even for evermore* (Psalm 121:8). The Formed Son prays exactly this keeping: *I pray not that thou shouldest take them out of the world, but that thou shouldest keep them from the evil* (John 17:15), and the apostle pledges it: *But Yahuah (Lord) is faithful, who shall stablish you, and keep you from evil* (2 Thessalonians 3:3). The going-out-and-coming-in is the Torah blessing itself — *Blessed shalt thou be when thou comest in, and blessed shalt thou be when thou goest out* (Deuteronomy 28:6) — the covenant inheritance, never the curse. What the servant Moses could no longer do — *I can no more go out and come in... Thou shalt not go over this Jordan* (Deuteronomy 31:2) — the Keeper takes up and does forever.',
       sv.verse_id, ev.verse_id, 'free', 25009
  FROM _s302_ps121_lookup sv, _s302_ps121_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=121 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=121 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- ===== D. thread_members =====
-- Thread 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.so, m.member_note
  FROM (VALUES
    (121,2,'canon','psalms',124,8, 1, E'Psalm 124:8 — the companion Song of Ascents: *Our help is in the name of Yahuah (LORD), who made heaven and earth* — the same confession.'),
    (121,2,'canon','genesis',1,1, 2, E'Genesis 1:1 — *In the beginning Elohim (God) created the heaven and the earth* — the Maker''s first act, the ground of the hope.'),
    (121,2,'canon','john',1,3, 3, E'John 1:3 — *All things were made by him* — the Father made all things by the Formed Word, never a rival power.'),
    (121,2,'jubilees','jubilees',2,1, 4, E'Jubilees 2:1 — the Maker *kept Sabbath on the seventh day and hallowed it... and appointed it as a sign* — the appointed rest sealing the work.')
  ) AS m(src_v_x,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,so,member_note)
  JOIN cross_reference_threads t ON t.slug='psalm-121-my-help-from-the-maker-of-heaven-and-earth'
  JOIN _s302_ps121_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=121 AND sv.verse_number=m.src_v
  JOIN _s302_ps121_lookup tv ON tv.edition_slug=m.tgt_edition AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.so, m.member_note
  FROM (VALUES
    (121,4,'canon','jeremiah',31,10, 1, E'Jeremiah 31:10 — *He that scattered Yashar''el (Israel) will gather him, and keep him, as a shepherd doth his flock* — the Keeper of the scattered house.'),
    (121,4,'canon','ezekiel',37,19, 2, E'Ezekiel 37:19 — the stick of Joseph and the stick of Yahudah *make them one stick... one in mine hand* — both houses kept toward the one ingathering.'),
    (121,4,'canon','romans',11,1, 3, E'Romans 11:1 — *Hath Elohim (God) cast away his people? Elohim (God) forbid* — the replacement reading forbidden at the root.'),
    (121,4,'canon','romans',11,2, 4, E'Romans 11:2 — *Elohim (God) hath not cast away his people which he foreknew* — foreknown and kept, the watch unbroken.')
  ) AS m(src_v_x,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,so,member_note)
  JOIN cross_reference_threads t ON t.slug='psalm-121-he-that-keepeth-yasharel-shall-not-slumber'
  JOIN _s302_ps121_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=121 AND sv.verse_number=m.src_v
  JOIN _s302_ps121_lookup tv ON tv.edition_slug=m.tgt_edition AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.so, m.member_note
  FROM (VALUES
    (121,6,'canon','isaiah',49,10, 1, E'Isaiah 49:10 — *neither shall the heat nor sun smite them* — the same shielding shade over the returning exiles.'),
    (121,6,'canon','revelation',7,16, 2, E'Revelation 7:16 — *neither shall the sun light on them, nor any heat* — the keeping consummated among the gathered tribes.'),
    (121,6,'enoch','1-enoch',41,5, 3, E'1 Enoch 41:5 — the sun and moon *do not leave their orbit... and in accordance with an oath they set and they rise* — oath-bound servants of the Maker, not powers to dread.')
  ) AS m(src_v_x,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,so,member_note)
  JOIN cross_reference_threads t ON t.slug='psalm-121-the-sun-shall-not-smite-thee-by-day'
  JOIN _s302_ps121_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=121 AND sv.verse_number=m.src_v
  JOIN _s302_ps121_lookup tv ON tv.edition_slug=m.tgt_edition AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.so, m.member_note
  FROM (VALUES
    (121,7,'canon','john',17,15, 1, E'John 17:15 — *keep them from the evil* — the Formed Son prays the very preservation of the psalm.'),
    (121,7,'canon','2-thessalonians',3,3, 2, E'2 Thessalonians 3:3 — *Yahuah (Lord) is faithful, who shall stablish you, and keep you from evil* — the apostolic echo of the pledge.'),
    (121,8,'canon','deuteronomy',28,6, 3, E'Deuteronomy 28:6 — *Blessed shalt thou be when thou comest in, and blessed shalt thou be when thou goest out* — the Torah blessing the psalm sings back, the inheritance not the curse.'),
    (121,8,'canon','deuteronomy',31,2, 4, E'Deuteronomy 31:2 — Moses: *I can no more go out and come in* — what the servant lays down at the border, the Keeper takes up forever.')
  ) AS m(src_v_x,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,so,member_note)
  JOIN cross_reference_threads t ON t.slug='psalm-121-preserve-thy-going-out-and-thy-coming-in'
  JOIN _s302_ps121_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=121 AND sv.verse_number=m.src_v
  JOIN _s302_ps121_lookup tv ON tv.edition_slug=m.tgt_edition AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
