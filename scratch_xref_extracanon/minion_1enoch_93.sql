-- ----- fragment: minion_1enoch_93.sql (session250 1-enoch 93) -----
-- Source anchor: enoch/1-enoch ch93. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en93 (view _session250_en93_lookup). Sort band base 52300, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en93_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-93-two-ways-choose-life
  ('enoch', '1-enoch', 93, 7, 'canon', 'deuteronomy', 30, 15, 'free', E'Deuteronomy 30:15 — *See, I have set before thee this day life and good, and death and evil;* Moses sets the same two ways Enoch sets before his sons in 93:7.'),
  ('enoch', '1-enoch', 93, 7, 'canon', 'deuteronomy', 30, 19, 'free', E'Deuteronomy 30:19 — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live:* Enoch''s "choose... that ye may live... and that your seed may be multiplied" (93:7) is Moses'' choose-life-and-thy-seed-may-live verbatim in substance.'),
  ('enoch', '1-enoch', 93, 2, 'canon', 'psalms', 1, 1, 'free', E'Psalms 1:1 — *Blessed is the man that walketh not in the counsel of the ungodly, nor standeth in the way of sinners, nor sitteth in the seat of the scornful.* The Psalter''s two ways match Enoch''s "seek not the counsel of the ungodly" in 93:2.'),
  ('enoch', '1-enoch', 93, 4, 'canon', 'matthew', 7, 13, 'free', E'Matthew 7:13 — *Enter ye in at the strait gate: for wide is the gate, and broad is the way, that leadeth to destruction, and many there be which go in thereat:* Yahusha shows the very two paths Enoch shows in 93:4, the way of unrighteousness "cut off."'),
  ('enoch', '1-enoch', 93, 7, 'apocrypha', 'ecclesiasticus', 15, 17, 'extras', E'Ecclesiasticus 15:17 — *Before man is life and death; and whether him liketh shall be given him.* Sirach sets life and death before man exactly as Enoch bids his sons choose in 93:7.'),
  -- thread: 1-enoch-93-perish-way-of-wicked
  ('enoch', '1-enoch', 93, 3, 'canon', 'psalms', 1, 6, 'free', E'Psalms 1:6 — *For Yahuah (LORD) knoweth the way of the righteous: but the way of the ungodly shall perish.* The Psalter ends where Enoch begins: all who walk in unrighteousness shall perish (93:3).'),
  ('enoch', '1-enoch', 93, 4, 'canon', 'proverbs', 4, 18, 'free', E'Proverbs 4:18 — *But the path of the just is as the shining light, that shineth more and more unto the perfect day.* Solomon''s path of the just is Enoch''s path of righteousness in 93:4.'),
  ('enoch', '1-enoch', 93, 4, 'canon', 'proverbs', 4, 19, 'free', E'Proverbs 4:19 — *The way of the wicked is as darkness: they know not at what they stumble.* The way of the wicked stumbling in the dark is the path of unrighteousness "cut off" in 93:4.'),
  ('enoch', '1-enoch', 93, 4, 'canon', 'matthew', 7, 14, 'free', E'Matthew 7:14 — *Because strait is the gate, and narrow is the way, which leadeth unto life, and few there be that find it.* The narrow way that leadeth unto life is Enoch''s path of righteousness chosen in 93:4.'),
  ('enoch', '1-enoch', 93, 3, 'apocrypha', 'the-wisdom-of-solomon', 5, 7, 'extras', E'Wisdom of Solomon 5:7 — *We wearied ourselves in the way of wickedness and destruction: yes, we have gone through deserts, where there lay no way: but as for the way of Yahuah (God), we have not known it.* The ungodly''s own confession that those who walk in unrighteousness perish (93:3).'),
  -- thread: 1-enoch-93-love-god-love-neighbour
  ('enoch', '1-enoch', 93, 9, 'canon', 'deuteronomy', 6, 5, 'free', E'Deuteronomy 6:5 — *And thou shalt love Yahuah Elohayka (the LORD thy God) with all thine heart, and with all thy soul, and with all thy might.* The Shema''s love-command is the heart of Enoch''s path of righteousness in 93:9.'),
  ('enoch', '1-enoch', 93, 9, 'canon', 'matthew', 22, 37, 'free', E'Matthew 22:37 — *Yahusha (Jesus) said unto him, Thou shalt love Yahuah Elohayka (the Lord thy God) with all thy heart, and with all thy soul, and with all thy mind.* Yahusha names the first great commandment Enoch already names in 93:9.'),
  ('enoch', '1-enoch', 93, 9, 'canon', 'matthew', 22, 39, 'free', E'Matthew 22:39 — *And the second is like unto it, Thou shalt love thy neighbour as thyself.* The second commandment is Enoch''s "love your neighbour as yourself" in 93:9, verbatim in substance.'),
  ('enoch', '1-enoch', 93, 9, 'jubilees', 'jubilees', 20, 2, 'extras', E'Jubilees 20:2 — *And he commanded them that they should observe the way of Yahuah (God); that they should work righteousness, and love each his neighbour, and act on this manner amongst all men; that they should each so walk with regard to them as to do judgment and righteousness on the earth.* Abraham charges his house with the same love-neighbour way Enoch sets in 93:9.'),
  ('enoch', '1-enoch', 93, 9, 'jubilees', 'jubilees', 7, 20, 'extras', E'Jubilees 7:20 — *And in the twenty-eighth jubilee Noah began to enjoin upon his sons'' sons the ordinances and commandments, and all the judgments that he knew, and he exhorted his sons to observe righteousness, and to cover the shame of their flesh, and to bless their Creator, and honour father and mother, and love their neighbour, and guard their souls from fornication and uncleanness and all iniquity.* Noah enjoins the love-neighbour way Enoch defines in 93:9.'),
  -- thread: 1-enoch-93-do-justice-walk-humbly
  ('enoch', '1-enoch', 93, 5, 'canon', 'micah', 6, 8, 'free', E'Micah 6:8 — *He hath shewed thee, O man, what is good; and what doth Yahuah (LORD) require of thee, but to do justly, and to love mercy, and to walk humbly with thy Elohim (God)?* Micah''s do-justly, love-mercy, walk-humbly is Enoch''s path of righteousness in 93:5 line for line.'),
  ('enoch', '1-enoch', 93, 6, 'enoch', '1-enoch', 94, 6, 'extras', E'1 Enoch 94:6 — *Woe to you who eat all the best food, And drink wine in large bowls, And tread upon the righteous with your might.* The very violence and oppression of Enoch''s wicked path (93:6) is the woe the next chapter sentences.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en93_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en93_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-93-two-ways-choose-life',
       E'Choose the paths of righteousness — life set before the sons',
       E'Enoch sets the two ways before his sons as a deliberate choice unto life: *And now, my sons, choose for yourselves The paths of righteousness, And walk therein, That ye may live and prosper, And that your seed may be multiplied upon the earth.* (1 Enoch 93:7). This is Moses'' own farewell charge, word for word in spirit: *See, I have set before thee this day life and good, and death and evil;* (Deuteronomy 30:15), and the sealing call, *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live:* (Deuteronomy 30:19). The way of life is the Torah kept, never the curse — life *and* multiplied seed for those who walk it. The Psalter opens on the same fork — *Blessed is the man that walketh not in the counsel of the ungodly, nor standeth in the way of sinners, nor sitteth in the seat of the scornful.* (Psalms 1:1) — which is why Enoch warns *And seek not the counsel of the ungodly* (1 Enoch 93:2). Yahusha gives the two ways their narrow-gate edge: *Enter ye in at the strait gate: for wide is the gate, and broad is the way, that leadeth to destruction, and many there be which go in thereat:* (Matthew 7:13). The extra-canon witnesses speak in one voice — Sirach, *Before man is life and death; and whether him liketh shall be given him.* (Ecclesiasticus 15:17). It ain''t new: choose life is the oldest commandment, and the seed that walks it is multiplied upon the earth.',
       sv.verse_id, ev.verse_id, 'extras', 52300
  FROM _session250_en93_lookup sv, _session250_en93_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=93 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=93 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-93-perish-way-of-wicked',
       E'The paths of unrighteousness shall be cut off',
       E'Over and again Enoch names the end of the wicked road: *And I will show you the paths of righteousness, And the paths of unrighteousness, And I will show you how the paths of unrighteousness Shall be cut off.* (1 Enoch 93:4), warning that *all who walk in unrighteousness shall perish* (1 Enoch 93:3). The Psalter''s closing line is the same verdict: *For Yahuah (LORD) knoweth the way of the righteous: but the way of the ungodly shall perish.* (Psalms 1:6). Solomon draws the two roads as light against darkness — *But the path of the just is as the shining light, that shineth more and more unto the perfect day.* (Proverbs 4:18), and *The way of the wicked is as darkness: they know not at what they stumble.* (Proverbs 4:19). Yahusha''s narrow gate carries the life-end of it: *Because strait is the gate, and narrow is the way, which leadeth unto life, and few there be that find it.* (Matthew 7:14). And the ungodly''s own confession at the judgment is in the Wisdom of Solomon — *We wearied ourselves in the way of wickedness and destruction: yes, we have gone through deserts, where there lay no way: but as for the way of Yahuah (God), we have not known it.* (Wisdom of Solomon 5:7). The way of unrighteousness is not punished arbitrarily; it self-destructs — it is *cut off*.',
       sv.verse_id, ev.verse_id, 'extras', 52303
  FROM _session250_en93_lookup sv, _session250_en93_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=93 AND sv.verse_number=3
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=93 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-93-love-god-love-neighbour',
       E'Fear Yahuah, love Him with all the heart, love your neighbour',
       E'Enoch defines the way of life as the two great commandments themselves: *The paths of righteousness are these: To fear Yahuah (God) of Spirits, To love Him with all your heart, With all your soul, With all your strength, And to love your neighbour as yourself.* (1 Enoch 93:9). This is the Shema and its companion, Torah quoted straight: *And thou shalt love Yahuah Elohayka (the LORD thy God) with all thine heart, and with all thy soul, and with all thy might.* (Deuteronomy 6:5). Yahusha names these two as the whole law: *Yahusha (Jesus) said unto him, Thou shalt love Yahuah Elohayka (the Lord thy God) with all thy heart, and with all thy soul, and with all thy mind.* (Matthew 22:37), and *And the second is like unto it, Thou shalt love thy neighbour as thyself.* (Matthew 22:39). The contrary path Enoch names — *To hate Yahuah (God) of Spirits, To love idols and false gods, To hate your neighbour* (1 Enoch 93:10) — is the precise inversion. The patriarchs carried this same charge: Jubilees has Noah enjoin his sons'' sons *to bless their Creator, and honour father and mother, and love their neighbour* (Jubilees 7:20), and Abraham command his house *that they should observe the way of Yahuah (God); that they should work righteousness, and love each his neighbour* (Jubilees 20:2). It ain''t new — love of Elohim and neighbour is the eternal Torah, kept from Enoch to Noah to Abraham to Yahusha.',
       sv.verse_id, ev.verse_id, 'extras', 52306
  FROM _session250_en93_lookup sv, _session250_en93_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=93 AND sv.verse_number=9
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=93 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-93-do-justice-walk-humbly',
       E'Do judgment and righteousness, love mercy, walk humbly',
       E'Enoch''s way of life is justice, mercy, and humility before Elohim: *The paths of righteousness are these: To walk in truth and righteousness, To love mercy and truth, To do judgment and righteousness, To walk humbly with Yahuah (God) of Spirits.* (1 Enoch 93:5), against the way *To love violence and oppression, To do injustice and wickedness, To walk proudly and haughtily* (1 Enoch 93:6). This is Micah''s summary of all the LORD requires: *He hath shewed thee, O man, what is good; and what doth Yahuah (LORD) require of thee, but to do justly, and to love mercy, and to walk humbly with thy Elohim (God)?* (Micah 6:8) — "do justly, love mercy, walk humbly" is Enoch''s "do judgment and righteousness, love mercy and truth, walk humbly" line for line. The oppressors of Enoch''s wicked path are the very rich and violent the woes will sentence in the next chapter — *Woe to you who eat all the best food, And drink wine in large bowls, And tread upon the righteous with your might.* (1 Enoch 94:6) — so the two ways here are not abstract but social: the system of violence and oppression is dismantled, the humble walk preserved.',
       sv.verse_id, ev.verse_id, 'extras', 52309
  FROM _session250_en93_lookup sv, _session250_en93_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=93 AND sv.verse_number=5
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=93 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-93-two-ways-choose-life
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 30:15 — *See, I have set before thee this day life and good, and death and evil;* Moses sets the same two ways Enoch sets before his sons in 93:7.'
  FROM cross_reference_threads t, cross_references x, _session250_en93_lookup sv, _session250_en93_lookup tv
 WHERE t.slug='1-enoch-93-two-ways-choose-life'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=93 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 30:19 — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live:* Enoch''s "choose... that ye may live... and that your seed may be multiplied" (93:7) is Moses'' choose-life-and-thy-seed-may-live verbatim in substance.'
  FROM cross_reference_threads t, cross_references x, _session250_en93_lookup sv, _session250_en93_lookup tv
 WHERE t.slug='1-enoch-93-two-ways-choose-life'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=93 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalms 1:1 — *Blessed is the man that walketh not in the counsel of the ungodly, nor standeth in the way of sinners, nor sitteth in the seat of the scornful.* The Psalter''s two ways match Enoch''s "seek not the counsel of the ungodly" in 93:2.'
  FROM cross_reference_threads t, cross_references x, _session250_en93_lookup sv, _session250_en93_lookup tv
 WHERE t.slug='1-enoch-93-two-ways-choose-life'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=93 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 7:13 — *Enter ye in at the strait gate: for wide is the gate, and broad is the way, that leadeth to destruction, and many there be which go in thereat:* Yahusha shows the very two paths Enoch shows in 93:4, the way of unrighteousness "cut off."'
  FROM cross_reference_threads t, cross_references x, _session250_en93_lookup sv, _session250_en93_lookup tv
 WHERE t.slug='1-enoch-93-two-ways-choose-life'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=93 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Ecclesiasticus 15:17 — *Before man is life and death; and whether him liketh shall be given him.* Sirach sets life and death before man exactly as Enoch bids his sons choose in 93:7.'
  FROM cross_reference_threads t, cross_references x, _session250_en93_lookup sv, _session250_en93_lookup tv
 WHERE t.slug='1-enoch-93-two-ways-choose-life'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=93 AND sv.verse_number=7
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=15 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-93-perish-way-of-wicked
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalms 1:6 — *For Yahuah (LORD) knoweth the way of the righteous: but the way of the ungodly shall perish.* The Psalter ends where Enoch begins: all who walk in unrighteousness shall perish (93:3).'
  FROM cross_reference_threads t, cross_references x, _session250_en93_lookup sv, _session250_en93_lookup tv
 WHERE t.slug='1-enoch-93-perish-way-of-wicked'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=93 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 4:18 — *But the path of the just is as the shining light, that shineth more and more unto the perfect day.* Solomon''s path of the just is Enoch''s path of righteousness in 93:4.'
  FROM cross_reference_threads t, cross_references x, _session250_en93_lookup sv, _session250_en93_lookup tv
 WHERE t.slug='1-enoch-93-perish-way-of-wicked'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=93 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=4 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 4:19 — *The way of the wicked is as darkness: they know not at what they stumble.* The way of the wicked stumbling in the dark is the path of unrighteousness "cut off" in 93:4.'
  FROM cross_reference_threads t, cross_references x, _session250_en93_lookup sv, _session250_en93_lookup tv
 WHERE t.slug='1-enoch-93-perish-way-of-wicked'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=93 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=4 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 7:14 — *Because strait is the gate, and narrow is the way, which leadeth unto life, and few there be that find it.* The narrow way that leadeth unto life is Enoch''s path of righteousness chosen in 93:4.'
  FROM cross_reference_threads t, cross_references x, _session250_en93_lookup sv, _session250_en93_lookup tv
 WHERE t.slug='1-enoch-93-perish-way-of-wicked'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=93 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Wisdom of Solomon 5:7 — *We wearied ourselves in the way of wickedness and destruction: yes, we have gone through deserts, where there lay no way: but as for the way of Yahuah (God), we have not known it.* The ungodly''s own confession that those who walk in unrighteousness perish (93:3).'
  FROM cross_reference_threads t, cross_references x, _session250_en93_lookup sv, _session250_en93_lookup tv
 WHERE t.slug='1-enoch-93-perish-way-of-wicked'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=93 AND sv.verse_number=3
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=5 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-93-love-god-love-neighbour
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 6:5 — *And thou shalt love Yahuah Elohayka (the LORD thy God) with all thine heart, and with all thy soul, and with all thy might.* The Shema''s love-command is the heart of Enoch''s path of righteousness in 93:9.'
  FROM cross_reference_threads t, cross_references x, _session250_en93_lookup sv, _session250_en93_lookup tv
 WHERE t.slug='1-enoch-93-love-god-love-neighbour'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=93 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 22:37 — *Yahusha (Jesus) said unto him, Thou shalt love Yahuah Elohayka (the Lord thy God) with all thy heart, and with all thy soul, and with all thy mind.* Yahusha names the first great commandment Enoch already names in 93:9.'
  FROM cross_reference_threads t, cross_references x, _session250_en93_lookup sv, _session250_en93_lookup tv
 WHERE t.slug='1-enoch-93-love-god-love-neighbour'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=93 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=22 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 22:39 — *And the second is like unto it, Thou shalt love thy neighbour as thyself.* The second commandment is Enoch''s "love your neighbour as yourself" in 93:9, verbatim in substance.'
  FROM cross_reference_threads t, cross_references x, _session250_en93_lookup sv, _session250_en93_lookup tv
 WHERE t.slug='1-enoch-93-love-god-love-neighbour'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=93 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=22 AND tv.verse_number=39
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 20:2 — *And he commanded them that they should observe the way of Yahuah (God); that they should work righteousness, and love each his neighbour, and act on this manner amongst all men; that they should each so walk with regard to them as to do judgment and righteousness on the earth.* Abraham charges his house with the same love-neighbour way Enoch sets in 93:9.'
  FROM cross_reference_threads t, cross_references x, _session250_en93_lookup sv, _session250_en93_lookup tv
 WHERE t.slug='1-enoch-93-love-god-love-neighbour'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=93 AND sv.verse_number=9
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=20 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 7:20 — *And in the twenty-eighth jubilee Noah began to enjoin upon his sons'' sons the ordinances and commandments, and all the judgments that he knew, and he exhorted his sons to observe righteousness, and to cover the shame of their flesh, and to bless their Creator, and honour father and mother, and love their neighbour, and guard their souls from fornication and uncleanness and all iniquity.* Noah enjoins the love-neighbour way Enoch defines in 93:9.'
  FROM cross_reference_threads t, cross_references x, _session250_en93_lookup sv, _session250_en93_lookup tv
 WHERE t.slug='1-enoch-93-love-god-love-neighbour'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=93 AND sv.verse_number=9
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=7 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-93-do-justice-walk-humbly
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Micah 6:8 — *He hath shewed thee, O man, what is good; and what doth Yahuah (LORD) require of thee, but to do justly, and to love mercy, and to walk humbly with thy Elohim (God)?* Micah''s do-justly, love-mercy, walk-humbly is Enoch''s path of righteousness in 93:5 line for line.'
  FROM cross_reference_threads t, cross_references x, _session250_en93_lookup sv, _session250_en93_lookup tv
 WHERE t.slug='1-enoch-93-do-justice-walk-humbly'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=93 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=6 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 94:6 — *Woe to you who eat all the best food, And drink wine in large bowls, And tread upon the righteous with your might.* The very violence and oppression of Enoch''s wicked path (93:6) is the woe the next chapter sentences.'
  FROM cross_reference_threads t, cross_references x, _session250_en93_lookup sv, _session250_en93_lookup tv
 WHERE t.slug='1-enoch-93-do-justice-walk-humbly'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=93 AND sv.verse_number=6
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=94 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

