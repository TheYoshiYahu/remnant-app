-- ----- fragment: minion_ecclesiasticus_29.sql (session253 ecclesiasticus 29) -----
-- Source anchor: apocrypha/ecclesiasticus ch29. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: sir29 (view _session253_sir29_lookup). Sort band base 59000, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_sir29_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ecclesiasticus-29-lend-keeps-commandments
  ('apocrypha', 'ecclesiasticus', 29, 1, 'canon', 'deuteronomy', 15, 8, 'free', E'Deuteronomy 15:8 — *But thou shalt open thine hand wide unto him, and shalt surely lend him sufficient for his need, in that which he wanteth.* The Torah command Sirach 29:1 calls keeping the commandments: the merciful man lends.'),
  ('apocrypha', 'ecclesiasticus', 29, 1, 'canon', 'psalms', 37, 26, 'free', E'Psalm 37:26 — *He is ever merciful, and lendeth; and his seed is blessed.* The Psalmist makes the merciful lender of Sirach 29:1 the very portrait of the blessed righteous.'),
  ('apocrypha', 'ecclesiasticus', 29, 1, 'canon', 'psalms', 37, 21, 'free', E'Psalm 37:21 — *The wicked borroweth, and payeth not again: but the righteous sheweth mercy, and giveth.* The same righteous/wicked contrast over lending that frames Sirach 29:1-2.'),
  ('apocrypha', 'ecclesiasticus', 29, 1, 'canon', 'proverbs', 19, 17, 'free', E'Proverbs 19:17 — *He that hath pity upon the poor lendeth unto Yahuah (LORD); and that which he hath given will he pay him again.* Sirach 29:1''s lending to a neighbour is, in Wisdom''s eyes, lending to Yahuah Himself.'),
  ('apocrypha', 'ecclesiasticus', 29, 2, 'canon', 'matthew', 5, 42, 'free', E'Matthew 5:42 — *Give to him that asketh thee, and from him that would borrow of thee turn not thou away.* The Messiah''s Sermon-on-the-Mount word is Sirach 29:2 made fuller: lend to your neighbour in his need.'),
  -- thread: ecclesiasticus-29-lend-hoping-nothing-again
  ('apocrypha', 'ecclesiasticus', 29, 8, 'canon', 'luke', 6, 35, 'free', E'Luke 6:35 — *But love ye your enemies, and do good, and lend, hoping for nothing again; and your reward shall be great, and ye shall be the children of the Highest: for he is kind unto the unthankful and to the evil.* The Messiah''s ''lend hoping for nothing again'' is Sirach 29:8''s patience with the poor debtor.'),
  ('apocrypha', 'ecclesiasticus', 29, 7, 'canon', 'luke', 6, 34, 'free', E'Luke 6:34 — *And if ye lend to them of whom ye hope to receive, what thank have ye? for sinners also lend to sinners, to receive as much again.* The very fear of loss Sirach 29:7 names is the sinner''s reckoning the Messiah calls us above.'),
  ('apocrypha', 'ecclesiasticus', 29, 9, 'canon', 'matthew', 5, 42, 'free', E'Matthew 5:42 — *Give to him that asketh thee, and from him that would borrow of thee turn not thou away.* ''Turn him not away because of his poverty'' (Sirach 29:9) is the same refusal to turn the borrower away.'),
  ('apocrypha', 'ecclesiasticus', 29, 9, 'canon', 'deuteronomy', 15, 10, 'free', E'Deuteronomy 15:10 — *Thou shalt surely give him, and thine heart shall not be grieved when thou givest unto him: because that for this thing Yahuah Elohayka (the LORD thy God) shall bless thee in all thy works, and in all that thou puttest thine hand unto.* ''Help the poor for the commandment''s sake'' (Sirach 29:9) cites this Torah blessing on the ungrudging giver.'),
  -- thread: ecclesiasticus-29-lay-up-treasure-alms
  ('apocrypha', 'ecclesiasticus', 29, 11, 'canon', 'matthew', 6, 20, 'free', E'Matthew 6:20 — *But lay up for yourselves treasures in heaven, where neither moth nor rust doth corrupt, and where thieves do not break through nor steal.* The Messiah''s heavenly treasure is Sirach 29:11''s ''lay up your treasure according to the commandments of the Most High.'''),
  ('apocrypha', 'ecclesiasticus', 29, 10, 'canon', 'matthew', 6, 19, 'free', E'Matthew 6:19 — *Lay not up for yourselves treasures upon earth, where moth and rust doth corrupt, and where thieves break through and steal.* Sirach 29:10''s money that should not ''rust under a stone to be lost'' is the earthly treasure the Messiah warns against hoarding.'),
  ('apocrypha', 'ecclesiasticus', 29, 12, 'apocrypha', 'tobit', 4, 10, 'extras', E'Tobit 4:10 — *Because that alms do deliver from death, and suffers not to come into darkness.* The live sister-book teaches Sirach 29:12 word for word: alms in store deliver you from affliction.'),
  ('apocrypha', 'ecclesiasticus', 29, 12, 'apocrypha', 'tobit', 4, 9, 'extras', E'Tobit 4:9 — *For you layest up a good treasure for thyself against the day of necessity.* Tobit''s ''good treasure laid up'' is the same storehouse of alms Sirach 29:12 says shall deliver.'),
  ('apocrypha', 'ecclesiasticus', 29, 11, 'canon', 'proverbs', 11, 24, 'free', E'Proverbs 11:24 — *There is that scattereth, and yet increaseth; and there is that withholdeth more than is meet, but it tendeth to poverty.* Wisdom''s paradox underwrites Sirach 29:11: giving treasure away brings ''more profit than gold.'''),
  -- thread: ecclesiasticus-29-surety-life-for-neighbour
  ('apocrypha', 'ecclesiasticus', 29, 15, 'canon', 'john', 15, 13, 'free', E'John 15:13 — *Greater love hath no man than this, that a man lay down his life for his friends.* The surety who ''has given his life for you'' (Sirach 29:15) is a shadow of the Messiah''s own laid-down life.'),
  ('apocrypha', 'ecclesiasticus', 29, 18, 'canon', 'proverbs', 6, 1, 'free', E'Proverbs 6:1 — *My son, if thou be surety for thy friend, if thou hast stricken thy hand with a stranger,* Proverbs'' warning is the same sober counsel as Sirach 29:18, that suretiship has undone many.'),
  ('apocrypha', 'ecclesiasticus', 29, 18, 'canon', 'proverbs', 22, 26, 'free', E'Proverbs 22:26 — *Be not thou one of them that strike hands, or of them that are sureties for debts.* The peril of standing surety in Sirach 29:18 is Wisdom''s own caution.'),
  ('apocrypha', 'ecclesiasticus', 29, 19, 'canon', 'proverbs', 19, 17, 'free', E'Proverbs 19:17 — *He that hath pity upon the poor lendeth unto Yahuah (LORD); and that which he hath given will he pay him again.* Against the wicked who ''transgressing the commandments of Yahuah'' falls into suretiship (Sirach 29:19), Wisdom sets the merciful lender repaid by Yahuah.'),
  -- thread: ecclesiasticus-29-content-with-little
  ('apocrypha', 'ecclesiasticus', 29, 21, 'canon', '1-timothy', 6, 8, 'free', E'1 Timothy 6:8 — *And having food and raiment let us be therewith content.* Paul''s ''food and raiment'' is Sirach 29:21''s water, bread, clothing and house — the chief things for life.'),
  ('apocrypha', 'ecclesiasticus', 29, 22, 'canon', 'proverbs', 15, 16, 'free', E'Proverbs 15:16 — *Better is little with the fear of Yahuah (LORD) than great treasure and trouble therewith.* The ''better-is-little'' wisdom of Sirach 29:22''s poor cottage is straight from Proverbs.'),
  ('apocrypha', 'ecclesiasticus', 29, 22, 'canon', 'proverbs', 17, 1, 'free', E'Proverbs 17:1 — *Better is a dry morsel, and quietness therewith, than an house full of sacrifices with strife.* Sirach 29:22''s poor man''s cottage over delicate fare in another''s house echoes the dry morsel with peace.'),
  ('apocrypha', 'ecclesiasticus', 29, 23, 'canon', 'hebrews', 13, 5, 'free', E'Hebrews 13:5 — *Let your conversation be without covetousness; and be content with such things as ye have: for he hath said, I will never leave thee, nor forsake thee.* ''Hold you contented'' (Sirach 29:23) is the apostolic word of contentment grounded in Yahuah''s faithfulness.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_sir29_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_sir29_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-29-lend-keeps-commandments',
       E'He that is merciful will lend — and keeps the commandments',
       E'Ben Sira opens the chapter binding mercy to Torah: *He that is merciful will lend to his neighbour; and he that strengtheneth his hand keepeth the commandments* (Ecclesiasticus 29:1) — *Lend to your neighbour in time of his need* (Ecclesiasticus 29:2). It ain''t new. The Torah already commanded the open hand: *But thou shalt open thine hand wide unto him, and shalt surely lend him sufficient for his need, in that which he wanteth* (Deuteronomy 15:8), promising *Yahuah Elohayka (the LORD thy God) shall bless thee in all thy works* (Deuteronomy 15:10). The Psalmist makes lending the mark of the righteous: *He is ever merciful, and lendeth; and his seed is blessed* (Psalm 37:26), over against *The wicked borroweth, and payeth not again: but the righteous sheweth mercy, and giveth* (Psalm 37:21). And Proverbs reveals who the true creditor is: *He that hath pity upon the poor lendeth unto Yahuah (LORD); and that which he hath given will he pay him again* (Proverbs 19:17). The Messiah carries the same word to its fullness: *Give to him that asketh thee, and from him that would borrow of thee turn not thou away* (Matthew 5:42), and *do good, and lend, hoping for nothing again* (Luke 6:35). Sirach stands in the one stream of the Sermon on the Mount.',
       sv.verse_id, ev.verse_id, 'extras', 59000
  FROM _session253_sir29_lookup sv, _session253_sir29_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=29 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=29 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-29-lend-hoping-nothing-again',
       E'Lend, hoping for nothing again — bearing the bad debtor',
       E'Ben Sira knows men refuse to lend because debtors default: *Many therefore have refused to lend for other men''s ill dealing, fearing to be defrauded* (Ecclesiasticus 29:7). Yet he commands mercy anyway: *Yet have you patience with a man in poor estate, and delay not to shew him mercy* (Ecclesiasticus 29:8), *Help the poor for the commandment''s sake, and turn him not away because of his poverty* (Ecclesiasticus 29:9). This is precisely the higher righteousness the Messiah teaches: not the sinner''s calculus *if ye lend to them of whom ye hope to receive, what thank have ye? for sinners also lend to sinners, to receive as much again* (Luke 6:34), but *do good, and lend, hoping for nothing again; and your reward shall be great, and ye shall be the children of the Highest: for he is kind unto the unthankful and to the evil* (Luke 6:35). Sirach''s ''for the commandment''s sake'' is the Torah ground beneath the gospel of generous lending.',
       sv.verse_id, ev.verse_id, 'extras', 59003
  FROM _session253_sir29_lookup sv, _session253_sir29_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=29 AND sv.verse_number=7
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=29 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-29-lay-up-treasure-alms',
       E'Lay up treasure by the commandments — alms in the storehouse',
       E'Here is the chapter''s crown, and it is the Sermon on the Mount centuries early: *Lose your money for your brother and your friend, and let it not rust under a stone to be lost* (Ecclesiasticus 29:10); *Lay up your treasure according to the commandments of the Most High, and it shall bring you more profit than gold* (Ecclesiasticus 29:11); *Shut up alms in your storehouses: and it shall deliver you from all affliction* (Ecclesiasticus 29:12). The Messiah''s word rings the same bell: *Lay not up for yourselves treasures upon earth, where moth and rust doth corrupt* (Matthew 6:19), *But lay up for yourselves treasures in heaven, where neither moth nor rust doth corrupt* (Matthew 6:20). Sirach''s sister-book Tobit teaches the identical mercy-as-treasure: *For you layest up a good treasure for thyself against the day of necessity. Because that alms do deliver from death* (Tobit 4:9-10) — alms laid up that deliver, exactly as Sirach says they *shall deliver you from all affliction*. And Proverbs already knew the paradox: *There is that scattereth, and yet increaseth* (Proverbs 11:24). It ain''t new — laying up heavenly treasure by giving is the wisdom of the whole library.',
       sv.verse_id, ev.verse_id, 'extras', 59006
  FROM _session253_sir29_lookup sv, _session253_sir29_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=29 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=29 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-29-surety-life-for-neighbour',
       E'The honest man surety for his neighbour — and its peril',
       E'Ben Sira praises the surety as one who lays down his very life: *An honest man is surety for his neighbour: but he that is impudent will forsake him* (Ecclesiasticus 29:14); *Forget not the friendship of your surety, for he has given his life for you* (Ecclesiasticus 29:15). The Messiah names this the highest love: *Greater love hath no man than this, that a man lay down his life for his friends* (John 15:13) — the standing-surety becomes a shadow of the cross. Yet Sirach is also sober about the danger, just as Proverbs is: *Suretiship has undone many of good estate, and shaken them as a wave of the sea* (Ecclesiasticus 29:18) echoes *My son, if thou be surety for thy friend, if thou hast stricken thy hand with a stranger, Thou art snared with the words of thy mouth* (Proverbs 6:1-2), and *Be not thou one of them that strike hands, or of them that are sureties for debts* (Proverbs 22:26). And he keeps the covenant frame: *A wicked man transgressing the commandments of Yahuah (God) shall fall into suretiship* (Ecclesiasticus 29:19) — even here, the commandments stand.',
       sv.verse_id, ev.verse_id, 'extras', 59009
  FROM _session253_sir29_lookup sv, _session253_sir29_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=29 AND sv.verse_number=14
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=29 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-29-content-with-little',
       E'Better the poor man''s cottage — be content with little',
       E'The chapter closes by naming life''s true necessities and commending contentment: *The chief thing for life is water, and bread, and clothing, and an house to cover shame* (Ecclesiasticus 29:21); *Better is the life of a poor man in a mean cottage, than delicate fare in another man''s house* (Ecclesiasticus 29:22); *Be it little or much, hold you contented, that you hear not the reproach of your house* (Ecclesiasticus 29:23). Paul says the same to Timothy: *And having food and raiment let us be therewith content* (1 Timothy 6:8) — Sirach''s water, bread, clothing and shelter exactly. Proverbs sang it first: *Better is little with the fear of Yahuah (LORD) than great treasure and trouble therewith* (Proverbs 15:16), and *Better is a dry morsel, and quietness therewith, than an house full of sacrifices with strife* (Proverbs 17:1). And Hebrews seals the heart of it: *be content with such things as ye have: for he hath said, I will never leave thee, nor forsake thee* (Hebrews 13:5). Sirach''s wisdom on contentment is the Tanakh''s and the apostles'' one voice.',
       sv.verse_id, ev.verse_id, 'extras', 59012
  FROM _session253_sir29_lookup sv, _session253_sir29_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=29 AND sv.verse_number=21
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=29 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ecclesiasticus-29-lend-keeps-commandments
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 15:8 — *But thou shalt open thine hand wide unto him, and shalt surely lend him sufficient for his need, in that which he wanteth.* The Torah command Sirach 29:1 calls keeping the commandments: the merciful man lends.'
  FROM cross_reference_threads t, cross_references x, _session253_sir29_lookup sv, _session253_sir29_lookup tv
 WHERE t.slug='ecclesiasticus-29-lend-keeps-commandments'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=29 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=15 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 37:26 — *He is ever merciful, and lendeth; and his seed is blessed.* The Psalmist makes the merciful lender of Sirach 29:1 the very portrait of the blessed righteous.'
  FROM cross_reference_threads t, cross_references x, _session253_sir29_lookup sv, _session253_sir29_lookup tv
 WHERE t.slug='ecclesiasticus-29-lend-keeps-commandments'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=29 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=37 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 37:21 — *The wicked borroweth, and payeth not again: but the righteous sheweth mercy, and giveth.* The same righteous/wicked contrast over lending that frames Sirach 29:1-2.'
  FROM cross_reference_threads t, cross_references x, _session253_sir29_lookup sv, _session253_sir29_lookup tv
 WHERE t.slug='ecclesiasticus-29-lend-keeps-commandments'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=29 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=37 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 19:17 — *He that hath pity upon the poor lendeth unto Yahuah (LORD); and that which he hath given will he pay him again.* Sirach 29:1''s lending to a neighbour is, in Wisdom''s eyes, lending to Yahuah Himself.'
  FROM cross_reference_threads t, cross_references x, _session253_sir29_lookup sv, _session253_sir29_lookup tv
 WHERE t.slug='ecclesiasticus-29-lend-keeps-commandments'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=29 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=19 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Matthew 5:42 — *Give to him that asketh thee, and from him that would borrow of thee turn not thou away.* The Messiah''s Sermon-on-the-Mount word is Sirach 29:2 made fuller: lend to your neighbour in his need.'
  FROM cross_reference_threads t, cross_references x, _session253_sir29_lookup sv, _session253_sir29_lookup tv
 WHERE t.slug='ecclesiasticus-29-lend-keeps-commandments'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=29 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=42
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-29-lend-hoping-nothing-again
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Luke 6:35 — *But love ye your enemies, and do good, and lend, hoping for nothing again; and your reward shall be great, and ye shall be the children of the Highest: for he is kind unto the unthankful and to the evil.* The Messiah''s ''lend hoping for nothing again'' is Sirach 29:8''s patience with the poor debtor.'
  FROM cross_reference_threads t, cross_references x, _session253_sir29_lookup sv, _session253_sir29_lookup tv
 WHERE t.slug='ecclesiasticus-29-lend-hoping-nothing-again'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=29 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=6 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 6:34 — *And if ye lend to them of whom ye hope to receive, what thank have ye? for sinners also lend to sinners, to receive as much again.* The very fear of loss Sirach 29:7 names is the sinner''s reckoning the Messiah calls us above.'
  FROM cross_reference_threads t, cross_references x, _session253_sir29_lookup sv, _session253_sir29_lookup tv
 WHERE t.slug='ecclesiasticus-29-lend-hoping-nothing-again'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=29 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=6 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 5:42 — *Give to him that asketh thee, and from him that would borrow of thee turn not thou away.* ''Turn him not away because of his poverty'' (Sirach 29:9) is the same refusal to turn the borrower away.'
  FROM cross_reference_threads t, cross_references x, _session253_sir29_lookup sv, _session253_sir29_lookup tv
 WHERE t.slug='ecclesiasticus-29-lend-hoping-nothing-again'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=29 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=42
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Deuteronomy 15:10 — *Thou shalt surely give him, and thine heart shall not be grieved when thou givest unto him: because that for this thing Yahuah Elohayka (the LORD thy God) shall bless thee in all thy works, and in all that thou puttest thine hand unto.* ''Help the poor for the commandment''s sake'' (Sirach 29:9) cites this Torah blessing on the ungrudging giver.'
  FROM cross_reference_threads t, cross_references x, _session253_sir29_lookup sv, _session253_sir29_lookup tv
 WHERE t.slug='ecclesiasticus-29-lend-hoping-nothing-again'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=29 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=15 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-29-lay-up-treasure-alms
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 6:20 — *But lay up for yourselves treasures in heaven, where neither moth nor rust doth corrupt, and where thieves do not break through nor steal.* The Messiah''s heavenly treasure is Sirach 29:11''s ''lay up your treasure according to the commandments of the Most High.'''
  FROM cross_reference_threads t, cross_references x, _session253_sir29_lookup sv, _session253_sir29_lookup tv
 WHERE t.slug='ecclesiasticus-29-lay-up-treasure-alms'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=29 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=6 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 6:19 — *Lay not up for yourselves treasures upon earth, where moth and rust doth corrupt, and where thieves break through and steal.* Sirach 29:10''s money that should not ''rust under a stone to be lost'' is the earthly treasure the Messiah warns against hoarding.'
  FROM cross_reference_threads t, cross_references x, _session253_sir29_lookup sv, _session253_sir29_lookup tv
 WHERE t.slug='ecclesiasticus-29-lay-up-treasure-alms'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=29 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=6 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Tobit 4:10 — *Because that alms do deliver from death, and suffers not to come into darkness.* The live sister-book teaches Sirach 29:12 word for word: alms in store deliver you from affliction.'
  FROM cross_reference_threads t, cross_references x, _session253_sir29_lookup sv, _session253_sir29_lookup tv
 WHERE t.slug='ecclesiasticus-29-lay-up-treasure-alms'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=29 AND sv.verse_number=12
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=4 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Tobit 4:9 — *For you layest up a good treasure for thyself against the day of necessity.* Tobit''s ''good treasure laid up'' is the same storehouse of alms Sirach 29:12 says shall deliver.'
  FROM cross_reference_threads t, cross_references x, _session253_sir29_lookup sv, _session253_sir29_lookup tv
 WHERE t.slug='ecclesiasticus-29-lay-up-treasure-alms'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=29 AND sv.verse_number=12
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=4 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Proverbs 11:24 — *There is that scattereth, and yet increaseth; and there is that withholdeth more than is meet, but it tendeth to poverty.* Wisdom''s paradox underwrites Sirach 29:11: giving treasure away brings ''more profit than gold.'''
  FROM cross_reference_threads t, cross_references x, _session253_sir29_lookup sv, _session253_sir29_lookup tv
 WHERE t.slug='ecclesiasticus-29-lay-up-treasure-alms'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=29 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=11 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-29-surety-life-for-neighbour
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 15:13 — *Greater love hath no man than this, that a man lay down his life for his friends.* The surety who ''has given his life for you'' (Sirach 29:15) is a shadow of the Messiah''s own laid-down life.'
  FROM cross_reference_threads t, cross_references x, _session253_sir29_lookup sv, _session253_sir29_lookup tv
 WHERE t.slug='ecclesiasticus-29-surety-life-for-neighbour'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=29 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=15 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 6:1 — *My son, if thou be surety for thy friend, if thou hast stricken thy hand with a stranger,* Proverbs'' warning is the same sober counsel as Sirach 29:18, that suretiship has undone many.'
  FROM cross_reference_threads t, cross_references x, _session253_sir29_lookup sv, _session253_sir29_lookup tv
 WHERE t.slug='ecclesiasticus-29-surety-life-for-neighbour'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=29 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=6 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 22:26 — *Be not thou one of them that strike hands, or of them that are sureties for debts.* The peril of standing surety in Sirach 29:18 is Wisdom''s own caution.'
  FROM cross_reference_threads t, cross_references x, _session253_sir29_lookup sv, _session253_sir29_lookup tv
 WHERE t.slug='ecclesiasticus-29-surety-life-for-neighbour'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=29 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=22 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 19:17 — *He that hath pity upon the poor lendeth unto Yahuah (LORD); and that which he hath given will he pay him again.* Against the wicked who ''transgressing the commandments of Yahuah'' falls into suretiship (Sirach 29:19), Wisdom sets the merciful lender repaid by Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_sir29_lookup sv, _session253_sir29_lookup tv
 WHERE t.slug='ecclesiasticus-29-surety-life-for-neighbour'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=29 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=19 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-29-content-with-little
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Timothy 6:8 — *And having food and raiment let us be therewith content.* Paul''s ''food and raiment'' is Sirach 29:21''s water, bread, clothing and house — the chief things for life.'
  FROM cross_reference_threads t, cross_references x, _session253_sir29_lookup sv, _session253_sir29_lookup tv
 WHERE t.slug='ecclesiasticus-29-content-with-little'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=29 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='1-timothy' AND tv.chapter_number=6 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 15:16 — *Better is little with the fear of Yahuah (LORD) than great treasure and trouble therewith.* The ''better-is-little'' wisdom of Sirach 29:22''s poor cottage is straight from Proverbs.'
  FROM cross_reference_threads t, cross_references x, _session253_sir29_lookup sv, _session253_sir29_lookup tv
 WHERE t.slug='ecclesiasticus-29-content-with-little'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=29 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=15 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 17:1 — *Better is a dry morsel, and quietness therewith, than an house full of sacrifices with strife.* Sirach 29:22''s poor man''s cottage over delicate fare in another''s house echoes the dry morsel with peace.'
  FROM cross_reference_threads t, cross_references x, _session253_sir29_lookup sv, _session253_sir29_lookup tv
 WHERE t.slug='ecclesiasticus-29-content-with-little'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=29 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=17 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hebrews 13:5 — *Let your conversation be without covetousness; and be content with such things as ye have: for he hath said, I will never leave thee, nor forsake thee.* ''Hold you contented'' (Sirach 29:23) is the apostolic word of contentment grounded in Yahuah''s faithfulness.'
  FROM cross_reference_threads t, cross_references x, _session253_sir29_lookup sv, _session253_sir29_lookup tv
 WHERE t.slug='ecclesiasticus-29-content-with-little'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=29 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=13 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

