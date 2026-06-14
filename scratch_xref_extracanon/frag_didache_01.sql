-- ----- fragment: minion_didache_01.sql (session253 didache 1) -----
-- Source anchor: lightfoot-apostolic-fathers/didache ch1. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: didache1 (view _session253_didache1_lookup). Sort band base 71000, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_didache1_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: didache-1-two-ways-life-death
  ('lightfoot-apostolic-fathers', 'didache', 1, 4, 'canon', 'deuteronomy', 30, 15, 'free', E'Deuteronomy 30:15 — *See, I have set before thee this day life and good, and death and evil;* the Didache''s "way of life" and "way of death" simply re-utter the choice Moses set before Yashar''el.'),
  ('lightfoot-apostolic-fathers', 'didache', 1, 5, 'canon', 'deuteronomy', 30, 19, 'free', E'Deuteronomy 30:19 — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live:* the curse-laden "way of death" of Didache 1:5 is the very death Moses bids us refuse.'),
  ('lightfoot-apostolic-fathers', 'didache', 1, 5, 'canon', 'jeremiah', 21, 8, 'free', E'Jeremiah 21:8 — *And unto this people thou shalt say, Thus saith Yahuah (LORD); Behold, I set before you the way of life, and the way of death.* Jeremiah names the two ways word-for-word with the Teaching.'),
  ('lightfoot-apostolic-fathers', 'didache', 1, 5, 'canon', 'matthew', 7, 14, 'free', E'Matthew 7:14 — *Because strait is the gate, and narrow is the way, which leadeth unto life, and few there be that find it.* The Messiah Himself frames the Two Ways the Didache now teaches the nations.'),
  ('lightfoot-apostolic-fathers', 'didache', 1, 4, 'canon', 'psalms', 1, 6, 'free', E'Psalm 1:6 — *For Yahuah (LORD) knoweth the way of the righteous: but the way of the ungodly shall perish.* The first Psalm is the Two Ways entire, the way of life set against the way that perishes.'),
  -- thread: didache-1-love-god-and-neighbour
  ('lightfoot-apostolic-fathers', 'didache', 1, 4, 'canon', 'deuteronomy', 6, 5, 'free', E'Deuteronomy 6:5 — *And thou shalt love Yahuah Elohayka (the LORD thy God) with all thine heart, and with all thy soul, and with all thy might.* The Teaching''s call to honour Yahuah above all is the Shema it inherits.'),
  ('lightfoot-apostolic-fathers', 'didache', 1, 2, 'canon', 'leviticus', 19, 18, 'free', E'Leviticus 19:18 — *Thou shalt not avenge, nor bear any grudge against the children of thy people, but thou shalt love thy neighbour as thyself: I am Yahuah (LORD).* The Didache''s "cherish no grudge" and love-thy-neighbour-more-than-life draws straight from this verse.'),
  ('lightfoot-apostolic-fathers', 'didache', 1, 2, 'canon', 'matthew', 22, 39, 'free', E'Matthew 22:39 — *And the second is like unto it, Thou shalt love thy neighbour as thyself.* The Messiah names neighbour-love the second great commandment, the very love the Teaching commands.'),
  ('lightfoot-apostolic-fathers', 'didache', 1, 2, 'canon', 'matthew', 7, 12, 'free', E'Matthew 7:12 — *Therefore all things whatsoever ye would that men should do to you, do ye even so to them: for this is the law and the prophets.* The golden rule of the Sermon is the Didache''s rule of the Way of Life.'),
  -- thread: didache-1-second-commandment-decalogue
  ('lightfoot-apostolic-fathers', 'didache', 1, 2, 'canon', 'exodus', 20, 13, 'free', E'Exodus 20:13 — *Thou shalt not kill.* The Teaching''s "thou shalt do no murder" is the sixth word of Sinai.'),
  ('lightfoot-apostolic-fathers', 'didache', 1, 2, 'canon', 'exodus', 20, 14, 'free', E'Exodus 20:14 — *Thou shalt not commit adultery.* The Didache repeats the seventh word verbatim.'),
  ('lightfoot-apostolic-fathers', 'didache', 1, 2, 'canon', 'exodus', 20, 15, 'free', E'Exodus 20:15 — *Thou shalt not steal.* The eighth word stands at the heart of the Teaching''s catalogue.'),
  ('lightfoot-apostolic-fathers', 'didache', 1, 2, 'canon', 'exodus', 20, 17, 'free', E'Exodus 20:17 — *Thou shalt not covet thy neighbour''s house, thou shalt not covet thy neighbour''s wife, nor his manservant, nor his maidservant, nor his ox, nor his ass, nor any thing that is thy neighbour''s.* The tenth word grounds the Didache''s "thou shalt not covet thy neighbour''s goods."'),
  -- thread: didache-1-whole-yoke-perfect
  ('lightfoot-apostolic-fathers', 'didache', 1, 6, 'canon', 'matthew', 11, 30, 'free', E'Matthew 11:30 — *For my yoke is easy, and my burden is light.* The "whole yoke" the Didache bids us bear is the Messiah''s own light yoke, not a burden.'),
  ('lightfoot-apostolic-fathers', 'didache', 1, 6, 'canon', 'matthew', 11, 29, 'free', E'Matthew 11:29 — *Take my yoke upon you, and learn of me; for I am meek and lowly in heart: and ye shall find rest unto your souls.* The yoke that makes the disciple "perfect" gives rest to the soul.'),
  ('lightfoot-apostolic-fathers', 'didache', 1, 6, 'canon', 'psalms', 19, 7, 'free', E'Psalm 19:7 — *The law of Yahuah (LORD) is perfect, converting the soul: the testimony of Yahuah (LORD) is sure, making wise the simple.* The Torah is "perfect," so to bear its whole yoke is to be made perfect.'),
  ('lightfoot-apostolic-fathers', 'didache', 1, 4, 'canon', 'deuteronomy', 4, 2, 'free', E'Deuteronomy 4:2 — *Ye shall not add unto the word which I command you, neither shall ye diminish ought from it, that ye may keep the commandments of Yahuah Elohaychem (the LORD your God) which I command you.* The Didache''s "neither adding nor taking away" is Moses'' own guard upon the commandments.'),
  -- thread: didache-1-firstfruits-pure-sacrifice
  ('lightfoot-apostolic-fathers', 'didache', 1, 13, 'canon', 'deuteronomy', 18, 4, 'free', E'Deuteronomy 18:4 — *The firstfruit also of thy corn, of thy wine, and of thine oil, and the first of the fleece of thy sheep, shalt thou give him.* The Didache''s firstfruit of wine-vat, threshing-floor, oxen and sheep is Moses'' priestly due.'),
  ('lightfoot-apostolic-fathers', 'didache', 1, 13, 'canon', 'numbers', 18, 12, 'free', E'Numbers 18:12 — *All the best of the oil, and all the best of the wine, and of the wheat, the firstfruits of them which they shall offer unto Yahuah (LORD), them have I given thee.* The firstfruits the Teaching gives "to the prophets" are the priest''s portion of Sinai.'),
  ('lightfoot-apostolic-fathers', 'didache', 1, 13, 'canon', 'proverbs', 3, 9, 'free', E'Proverbs 3:9 — *Honour Yahuah (LORD) with thy substance, and with the firstfruits of all thine increase:* the wisdom-charge to honour Yahuah with firstfruits stands behind the Didache''s command.'),
  ('lightfoot-apostolic-fathers', 'didache', 1, 14, 'canon', 'malachi', 1, 11, 'free', E'Malachi 1:11 — *For from the rising of the sun even unto the going down of the same my name shall be great among the Gentiles; and in every place incense shall be offered unto my name, and a pure offering: for my name shall be great among the heathen, saith Yahuah Tseva''ot (LORD of hosts).* The Didache cites this very prophecy of the pure offering "in every place."'),
  -- thread: didache-1-watch-for-the-coming
  ('lightfoot-apostolic-fathers', 'didache', 1, 16, 'canon', 'matthew', 24, 42, 'free', E'Matthew 24:42 — *Watch therefore: for ye know not what hour your Lord doth come.* The Didache''s "be watchful... for ye know not the hour in which our Lord cometh" is this command nearly verbatim.'),
  ('lightfoot-apostolic-fathers', 'didache', 1, 16, 'canon', 'matthew', 24, 44, 'free', E'Matthew 24:44 — *Therefore be ye also ready: for in such an hour as ye think not the Son of Adam cometh.* The charge to keep lamps lit and loins girded "ready" echoes the Master''s call to readiness.'),
  ('lightfoot-apostolic-fathers', 'didache', 1, 16, 'canon', 'matthew', 24, 30, 'free', E'Matthew 24:30 — *And then shall appear the sign of the Son of Adam in heaven: and then shall all the tribes of the earth mourn, and they shall see the Son of Adam coming in the clouds of heaven with power and great glory.* The "signs of the truth" the Didache awaits are the Messiah''s appearing on the clouds.'),
  ('lightfoot-apostolic-fathers', 'didache', 1, 16, 'canon', '1-thessalonians', 4, 16, 'free', E'1 Thessalonians 4:16 — *For Yahuah (Lord) himself shall descend from heaven with a shout, with the voice of the archangel, and with the trump of Elohim (God): and the dead in Messiah (Christ) shall rise first:* the trumpet and resurrection the Didache lists as signs of the end are Paul''s same hope.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_didache1_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_didache1_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'didache-1-two-ways-life-death',
       E'The Two Ways — of Life and of Death',
       E'The Teaching opens upon the oldest fork in all of Scripture: *And this is the second commandment of the teaching... This is the way of life.* (Didache 1:4), and over against it, *But the way of death is this. First of all, it is evil and full of a curse* (Didache 1:5). It ain''t new. Moses set this very choice in the plains of Moab — *See, I have set before thee this day life and good, and death and evil* (Deuteronomy 30:15) — and pressed it home: *therefore choose life, that both thou and thy seed may live* (Deuteronomy 30:19). Jeremiah preached the same two roads — *Behold, I set before you the way of life, and the way of death* (Jeremiah 21:8) — and the Master gave it its sharpest edge: *Enter ye in at the strait gate... narrow is the way, which leadeth unto life, and few there be that find it* (Matthew 7:14). The first Psalm is the whole Two Ways in miniature, for the man whose delight is in the Torah stands while *the way of the ungodly shall perish* (Psalm 1:6). The Didache is not inventing a new ethic; it is handing on the choice Yahuah set before His people from the beginning.',
       sv.verse_id, ev.verse_id, 'extras', 71000
  FROM _session253_didache1_lookup sv, _session253_didache1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='didache' AND sv.chapter_number=1 AND sv.verse_number=4
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='didache' AND ev.chapter_number=1 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'didache-1-love-god-and-neighbour',
       E'Love Elohim, Love Thy Neighbour, the Golden Rule',
       E'The Way of Life is summed in two loves and a golden rule: the soul is to *honour him as Yahuah... for whencesoever the Lordship speaketh, there is Yahuah* (Didache 1:4), and the Teaching commands that *some thou shalt reprove, and for others thou shalt pray, and others thou shalt love more than thy life* (Didache 1:2). It ain''t new. The Shema set the first love — *thou shalt love Yahuah Elohayka (the LORD thy God) with all thine heart, and with all thy soul, and with all thy might* (Deuteronomy 6:5) — and the Holiness Code the second: *thou shalt love thy neighbour as thyself: I am Yahuah* (Leviticus 19:18). The Messiah bound the two into one yoke — *Thou shalt love Yahuah Elohayka (the Lord thy God) with all thy heart... And the second is like unto it, Thou shalt love thy neighbour as thyself* (Matthew 22:37, 39) — and gave the golden rule as the sum of Torah: *all things whatsoever ye would that men should do to you, do ye even so to them: for this is the law and the prophets* (Matthew 7:12). The Didache opens its hand to Moses'' two great commandments.',
       sv.verse_id, ev.verse_id, 'extras', 71003
  FROM _session253_didache1_lookup sv, _session253_didache1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='didache' AND sv.chapter_number=1 AND sv.verse_number=2
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='didache' AND ev.chapter_number=1 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'didache-1-second-commandment-decalogue',
       E'The Second Commandment of the Teaching — the Ten Words',
       E'The Way of Life is spelled out in the plain commandments of Sinai: *thou shalt do no murder, thou shalt not commit adultery... thou shalt not steal... thou shalt not covet thy neighbour''s goods... thou shalt not bear false witness* (Didache 1:2). It ain''t new — this is the Decalogue itself, repeated almost in order. *Thou shalt not kill.* (Exodus 20:13); *Thou shalt not commit adultery.* (Exodus 20:14); *Thou shalt not steal.* (Exodus 20:15); *Thou shalt not bear false witness against thy neighbour.* (Exodus 20:16); and the tenth word the Teaching keeps last — *Thou shalt not covet thy neighbour''s house, thou shalt not covet thy neighbour''s wife... nor any thing that is thy neighbour''s* (Exodus 20:17). The Apostolic Teaching does not abolish the Ten Words; it catechizes the nations in them.',
       sv.verse_id, ev.verse_id, 'extras', 71006
  FROM _session253_didache1_lookup sv, _session253_didache1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='didache' AND sv.chapter_number=1 AND sv.verse_number=2
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='didache' AND ev.chapter_number=1 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'didache-1-whole-yoke-perfect',
       E'Bear the Whole Yoke and Thou Shalt Be Perfect',
       E'The Teaching frames the commandments not as a burden but as the road to perfection: *if thou art able to bear the whole yoke of Yahuah (Lord), thou shalt be perfect; but if thou art not able, do that which thou art able* (Didache 1:6). It also charges the disciple to *never forsake the commandments of Yahuah; but shalt keep those things which thou hast received, neither adding to them nor taking away from them* (Didache 1:4). It ain''t new. The Messiah''s yoke is the same yoke, and it is not heavy — *Take my yoke upon you, and learn of me; for I am meek and lowly in heart: and ye shall find rest unto your souls. For my yoke is easy, and my burden is light* (Matthew 11:29-30). For the Torah is not a chain but a healing — *The law of Yahuah (LORD) is perfect, converting the soul* (Psalm 19:7) — and the charge to add nothing and take nothing away is Moses'' own fence: *Ye shall not add unto the word which I command you, neither shall ye diminish ought from it* (Deuteronomy 4:2). The whole yoke is life.',
       sv.verse_id, ev.verse_id, 'extras', 71009
  FROM _session253_didache1_lookup sv, _session253_didache1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='didache' AND sv.chapter_number=1 AND sv.verse_number=4
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='didache' AND ev.chapter_number=1 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'didache-1-firstfruits-pure-sacrifice',
       E'Firstfruits to the Prophets, a Pure Sacrifice in Every Place',
       E'The Teaching keeps the firstfruits-law alive among the nations: *Every firstfruit then of the produce of the wine-vat and of the threshing-floor, of thy oxen and of thy sheep, thou shalt take and give as the firstfruit to the prophets; for they are your chief-priests* (Didache 1:13). And it grounds the assembly''s thanksgiving in Malachi: gather and break bread *that your sacrifice may be pure; for this sacrifice it is that was spoken of by Yahuah; In every place... offer Me a pure sacrifice* (Didache 1:14). It ain''t new. The firstfruits belong to the priest by Sinai''s own ordinance — *The firstfruit also of thy corn, of thy wine, and of thine oil, and the first of the fleece of thy sheep, shalt thou give him* (Deuteronomy 18:4) — and Wisdom seals it: *Honour Yahuah (LORD) with thy substance, and with the firstfruits of all thine increase* (Proverbs 3:9). And the "pure sacrifice in every place" the Didache quotes is Malachi word for word — *in every place incense shall be offered unto my name, and a pure offering: for my name shall be great among the heathen* (Malachi 1:11). The Teaching hands on Torah''s offering, not abolishes it.',
       sv.verse_id, ev.verse_id, 'extras', 71012
  FROM _session253_didache1_lookup sv, _session253_didache1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='didache' AND sv.chapter_number=1 AND sv.verse_number=13
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='didache' AND ev.chapter_number=1 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'didache-1-watch-for-the-coming',
       E'Be Watchful — the Lord Cometh, the Trumpet and the Resurrection',
       E'The Teaching ends as the Master taught, gazing toward the last season: *Be watchful for your life; let your lamps not be quenched and your loins not ungirded, but be ye ready; for ye know not the hour in which our Lord cometh* (Didache 1:16). It looks for *a sign of a voice of a trumpet, and thirdly a resurrection of the dead*, and warns that *the world-deceiver shall appear as a son of Elohim* before the end (Didache 1:16). It ain''t new. The Messiah commanded the same vigilance — *Watch therefore: for ye know not what hour your Lord doth come* (Matthew 24:42) — and *Therefore be ye also ready: for in such an hour as ye think not the Son of Adam cometh* (Matthew 24:44). His coming on the clouds with the trumpet-gathering is the Didache''s hope — *they shall see the Son of Adam coming in the clouds of heaven with power and great glory* (Matthew 24:30) — and the trumpet that raises the dead is Paul''s same shout: *For Yahuah himself shall descend from heaven with a shout, with the voice of the archangel, and with the trump of Elohim: and the dead in Messiah shall rise first* (1 Thessalonians 4:16). The Teaching''s last word is the Master''s: watch, and be ready.',
       sv.verse_id, ev.verse_id, 'extras', 71015
  FROM _session253_didache1_lookup sv, _session253_didache1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='didache' AND sv.chapter_number=1 AND sv.verse_number=16
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='didache' AND ev.chapter_number=1 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: didache-1-two-ways-life-death
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 30:15 — *See, I have set before thee this day life and good, and death and evil;* the Didache''s "way of life" and "way of death" simply re-utter the choice Moses set before Yashar''el.'
  FROM cross_reference_threads t, cross_references x, _session253_didache1_lookup sv, _session253_didache1_lookup tv
 WHERE t.slug='didache-1-two-ways-life-death'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='didache' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 30:19 — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live:* the curse-laden "way of death" of Didache 1:5 is the very death Moses bids us refuse.'
  FROM cross_reference_threads t, cross_references x, _session253_didache1_lookup sv, _session253_didache1_lookup tv
 WHERE t.slug='didache-1-two-ways-life-death'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='didache' AND sv.chapter_number=1 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 21:8 — *And unto this people thou shalt say, Thus saith Yahuah (LORD); Behold, I set before you the way of life, and the way of death.* Jeremiah names the two ways word-for-word with the Teaching.'
  FROM cross_reference_threads t, cross_references x, _session253_didache1_lookup sv, _session253_didache1_lookup tv
 WHERE t.slug='didache-1-two-ways-life-death'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='didache' AND sv.chapter_number=1 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=21 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 7:14 — *Because strait is the gate, and narrow is the way, which leadeth unto life, and few there be that find it.* The Messiah Himself frames the Two Ways the Didache now teaches the nations.'
  FROM cross_reference_threads t, cross_references x, _session253_didache1_lookup sv, _session253_didache1_lookup tv
 WHERE t.slug='didache-1-two-ways-life-death'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='didache' AND sv.chapter_number=1 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Psalm 1:6 — *For Yahuah (LORD) knoweth the way of the righteous: but the way of the ungodly shall perish.* The first Psalm is the Two Ways entire, the way of life set against the way that perishes.'
  FROM cross_reference_threads t, cross_references x, _session253_didache1_lookup sv, _session253_didache1_lookup tv
 WHERE t.slug='didache-1-two-ways-life-death'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='didache' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: didache-1-love-god-and-neighbour
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 6:5 — *And thou shalt love Yahuah Elohayka (the LORD thy God) with all thine heart, and with all thy soul, and with all thy might.* The Teaching''s call to honour Yahuah above all is the Shema it inherits.'
  FROM cross_reference_threads t, cross_references x, _session253_didache1_lookup sv, _session253_didache1_lookup tv
 WHERE t.slug='didache-1-love-god-and-neighbour'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='didache' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 19:18 — *Thou shalt not avenge, nor bear any grudge against the children of thy people, but thou shalt love thy neighbour as thyself: I am Yahuah (LORD).* The Didache''s "cherish no grudge" and love-thy-neighbour-more-than-life draws straight from this verse.'
  FROM cross_reference_threads t, cross_references x, _session253_didache1_lookup sv, _session253_didache1_lookup tv
 WHERE t.slug='didache-1-love-god-and-neighbour'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='didache' AND sv.chapter_number=1 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 22:39 — *And the second is like unto it, Thou shalt love thy neighbour as thyself.* The Messiah names neighbour-love the second great commandment, the very love the Teaching commands.'
  FROM cross_reference_threads t, cross_references x, _session253_didache1_lookup sv, _session253_didache1_lookup tv
 WHERE t.slug='didache-1-love-god-and-neighbour'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='didache' AND sv.chapter_number=1 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=22 AND tv.verse_number=39
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 7:12 — *Therefore all things whatsoever ye would that men should do to you, do ye even so to them: for this is the law and the prophets.* The golden rule of the Sermon is the Didache''s rule of the Way of Life.'
  FROM cross_reference_threads t, cross_references x, _session253_didache1_lookup sv, _session253_didache1_lookup tv
 WHERE t.slug='didache-1-love-god-and-neighbour'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='didache' AND sv.chapter_number=1 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: didache-1-second-commandment-decalogue
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 20:13 — *Thou shalt not kill.* The Teaching''s "thou shalt do no murder" is the sixth word of Sinai.'
  FROM cross_reference_threads t, cross_references x, _session253_didache1_lookup sv, _session253_didache1_lookup tv
 WHERE t.slug='didache-1-second-commandment-decalogue'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='didache' AND sv.chapter_number=1 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 20:14 — *Thou shalt not commit adultery.* The Didache repeats the seventh word verbatim.'
  FROM cross_reference_threads t, cross_references x, _session253_didache1_lookup sv, _session253_didache1_lookup tv
 WHERE t.slug='didache-1-second-commandment-decalogue'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='didache' AND sv.chapter_number=1 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 20:15 — *Thou shalt not steal.* The eighth word stands at the heart of the Teaching''s catalogue.'
  FROM cross_reference_threads t, cross_references x, _session253_didache1_lookup sv, _session253_didache1_lookup tv
 WHERE t.slug='didache-1-second-commandment-decalogue'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='didache' AND sv.chapter_number=1 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Exodus 20:17 — *Thou shalt not covet thy neighbour''s house, thou shalt not covet thy neighbour''s wife, nor his manservant, nor his maidservant, nor his ox, nor his ass, nor any thing that is thy neighbour''s.* The tenth word grounds the Didache''s "thou shalt not covet thy neighbour''s goods."'
  FROM cross_reference_threads t, cross_references x, _session253_didache1_lookup sv, _session253_didache1_lookup tv
 WHERE t.slug='didache-1-second-commandment-decalogue'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='didache' AND sv.chapter_number=1 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: didache-1-whole-yoke-perfect
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 11:30 — *For my yoke is easy, and my burden is light.* The "whole yoke" the Didache bids us bear is the Messiah''s own light yoke, not a burden.'
  FROM cross_reference_threads t, cross_references x, _session253_didache1_lookup sv, _session253_didache1_lookup tv
 WHERE t.slug='didache-1-whole-yoke-perfect'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='didache' AND sv.chapter_number=1 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=11 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 11:29 — *Take my yoke upon you, and learn of me; for I am meek and lowly in heart: and ye shall find rest unto your souls.* The yoke that makes the disciple "perfect" gives rest to the soul.'
  FROM cross_reference_threads t, cross_references x, _session253_didache1_lookup sv, _session253_didache1_lookup tv
 WHERE t.slug='didache-1-whole-yoke-perfect'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='didache' AND sv.chapter_number=1 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=11 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 19:7 — *The law of Yahuah (LORD) is perfect, converting the soul: the testimony of Yahuah (LORD) is sure, making wise the simple.* The Torah is "perfect," so to bear its whole yoke is to be made perfect.'
  FROM cross_reference_threads t, cross_references x, _session253_didache1_lookup sv, _session253_didache1_lookup tv
 WHERE t.slug='didache-1-whole-yoke-perfect'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='didache' AND sv.chapter_number=1 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Deuteronomy 4:2 — *Ye shall not add unto the word which I command you, neither shall ye diminish ought from it, that ye may keep the commandments of Yahuah Elohaychem (the LORD your God) which I command you.* The Didache''s "neither adding nor taking away" is Moses'' own guard upon the commandments.'
  FROM cross_reference_threads t, cross_references x, _session253_didache1_lookup sv, _session253_didache1_lookup tv
 WHERE t.slug='didache-1-whole-yoke-perfect'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='didache' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: didache-1-firstfruits-pure-sacrifice
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 18:4 — *The firstfruit also of thy corn, of thy wine, and of thine oil, and the first of the fleece of thy sheep, shalt thou give him.* The Didache''s firstfruit of wine-vat, threshing-floor, oxen and sheep is Moses'' priestly due.'
  FROM cross_reference_threads t, cross_references x, _session253_didache1_lookup sv, _session253_didache1_lookup tv
 WHERE t.slug='didache-1-firstfruits-pure-sacrifice'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='didache' AND sv.chapter_number=1 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 18:12 — *All the best of the oil, and all the best of the wine, and of the wheat, the firstfruits of them which they shall offer unto Yahuah (LORD), them have I given thee.* The firstfruits the Teaching gives "to the prophets" are the priest''s portion of Sinai.'
  FROM cross_reference_threads t, cross_references x, _session253_didache1_lookup sv, _session253_didache1_lookup tv
 WHERE t.slug='didache-1-firstfruits-pure-sacrifice'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='didache' AND sv.chapter_number=1 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=18 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 3:9 — *Honour Yahuah (LORD) with thy substance, and with the firstfruits of all thine increase:* the wisdom-charge to honour Yahuah with firstfruits stands behind the Didache''s command.'
  FROM cross_reference_threads t, cross_references x, _session253_didache1_lookup sv, _session253_didache1_lookup tv
 WHERE t.slug='didache-1-firstfruits-pure-sacrifice'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='didache' AND sv.chapter_number=1 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Malachi 1:11 — *For from the rising of the sun even unto the going down of the same my name shall be great among the Gentiles; and in every place incense shall be offered unto my name, and a pure offering: for my name shall be great among the heathen, saith Yahuah Tseva''ot (LORD of hosts).* The Didache cites this very prophecy of the pure offering "in every place."'
  FROM cross_reference_threads t, cross_references x, _session253_didache1_lookup sv, _session253_didache1_lookup tv
 WHERE t.slug='didache-1-firstfruits-pure-sacrifice'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='didache' AND sv.chapter_number=1 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=1 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: didache-1-watch-for-the-coming
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 24:42 — *Watch therefore: for ye know not what hour your Lord doth come.* The Didache''s "be watchful... for ye know not the hour in which our Lord cometh" is this command nearly verbatim.'
  FROM cross_reference_threads t, cross_references x, _session253_didache1_lookup sv, _session253_didache1_lookup tv
 WHERE t.slug='didache-1-watch-for-the-coming'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='didache' AND sv.chapter_number=1 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=42
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 24:44 — *Therefore be ye also ready: for in such an hour as ye think not the Son of Adam cometh.* The charge to keep lamps lit and loins girded "ready" echoes the Master''s call to readiness.'
  FROM cross_reference_threads t, cross_references x, _session253_didache1_lookup sv, _session253_didache1_lookup tv
 WHERE t.slug='didache-1-watch-for-the-coming'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='didache' AND sv.chapter_number=1 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 24:30 — *And then shall appear the sign of the Son of Adam in heaven: and then shall all the tribes of the earth mourn, and they shall see the Son of Adam coming in the clouds of heaven with power and great glory.* The "signs of the truth" the Didache awaits are the Messiah''s appearing on the clouds.'
  FROM cross_reference_threads t, cross_references x, _session253_didache1_lookup sv, _session253_didache1_lookup tv
 WHERE t.slug='didache-1-watch-for-the-coming'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='didache' AND sv.chapter_number=1 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Thessalonians 4:16 — *For Yahuah (Lord) himself shall descend from heaven with a shout, with the voice of the archangel, and with the trump of Elohim (God): and the dead in Messiah (Christ) shall rise first:* the trumpet and resurrection the Didache lists as signs of the end are Paul''s same hope.'
  FROM cross_reference_threads t, cross_references x, _session253_didache1_lookup sv, _session253_didache1_lookup tv
 WHERE t.slug='didache-1-watch-for-the-coming'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='didache' AND sv.chapter_number=1 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='1-thessalonians' AND tv.chapter_number=4 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

