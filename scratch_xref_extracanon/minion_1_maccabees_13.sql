-- ----- fragment: minion_1maccabees_13.sql (session253 1-maccabees 13) -----
-- Source anchor: apocrypha/1-maccabees ch13. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1mac13 (view _session253_1mac13_lookup). Sort band base 61800, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1mac13_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-maccabees-13-simon-chosen-leader
  ('apocrypha', '1-maccabees', 13, 8, 'apocrypha', '1-maccabees', 9, 30, 'extras', E'1 Maccabees 9:30 — *Now therefore we have chosen you this day to be our prince and captain in his stead, that you may fight our battles.* The same acclamation once given to Jonathan now passes to Simon in 1-maccabees 13:8 — the remnant''s leadership handed brother to brother, unbroken.'),
  ('apocrypha', '1-maccabees', 13, 5, 'canon', 'john', 15, 13, 'free', E'John 15:13 — *Greater love hath no man than this, that a man lay down his life for his friends.* Simon''s refusal to spare his own life for the nation in 1-maccabees 13:5 is the shape of the love the Messiah names and then perfects.'),
  ('apocrypha', '1-maccabees', 13, 9, 'canon', 'zechariah', 9, 13, 'free', E'Zechariah 9:13 — *When I have bent Yahudah (Judah) for me, filled the bow with Ephraim, and raised up thy sons, O Zion, against thy sons, O Greece, and made thee as the sword of a mighty man.* The people pledging Simon to fight their battles in 1-maccabees 13:9 is the prophet''s bow of Judah bent against the sons of Greece.'),
  -- thread: 1-maccabees-13-brothers-slain-better-resurrection
  ('apocrypha', '1-maccabees', 13, 3, 'apocrypha', '1-maccabees', 2, 50, 'extras', E'1 Maccabees 2:50 — *Now therefore, my sons, be you zealous for the law, and give your lives for the covenant of your fathers.* Simon''s reckoning in 1-maccabees 13:3 of all the house has done for the laws and the sanctuary is the fulfilment of Mattathias'' dying charge.'),
  ('apocrypha', '1-maccabees', 13, 4, 'canon', 'numbers', 25, 11, 'free', E'Numbers 25:11 — *Phinehas, the son of Eleazar, the son of Aaron the priest, hath turned my wrath away from the children of Yashar''el (Israel), while he was zealous for my sake among them, that I consumed not the children of Yashar''el (Israel) in my jealousy.* The brothers slain for Israel''s sake in 1-maccabees 13:4 carry the priestly zeal of Phinehas, who stood for the covenant.'),
  ('apocrypha', '1-maccabees', 13, 4, 'canon', 'hebrews', 11, 35, 'free', E'Hebrews 11:35 — *Women received their dead raised to life again: and others were tortured, not accepting deliverance; that they might obtain a better resurrection:* The brothers slain in 1-maccabees 13:4 are among those tortured who looked past deliverance to the better resurrection.'),
  ('apocrypha', '1-maccabees', 13, 4, 'apocrypha', '2-maccabees', 7, 9, 'extras', E'2 Maccabees 7:9 — *And when he was at the last gasp, he said, You like a fury takest us out of this present life, but the King of the world shall raise us up, who have died for his laws, to everlasting life.* The hope behind the brothers'' deaths in 1-maccabees 13:4 is voiced plainly by the martyr brother under the same persecution.'),
  ('apocrypha', '1-maccabees', 13, 4, 'canon', 'daniel', 12, 2, 'free', E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* Daniel had already sealed the everlasting life that crowns the brothers fallen for Israel in 1-maccabees 13:4.'),
  -- thread: 1-maccabees-13-yoke-removed-first-year
  ('apocrypha', '1-maccabees', 13, 42, 'canon', 'leviticus', 25, 10, 'free', E'Leviticus 25:10 — *And ye shall hallow the fiftieth year, and proclaim liberty throughout all the land unto all the inhabitants thereof: it shall be a jubile unto you; and ye shall return every man unto his possession, and ye shall return every man unto his family.* Israel''s new reckoning from the first year of Simon in 1-maccabees 13:42 is the jubilee proclamation of liberty written into their dating itself.'),
  ('apocrypha', '1-maccabees', 13, 41, 'canon', 'isaiah', 9, 4, 'free', E'Isaiah 9:4 — *For thou hast broken the yoke of his burden, and the staff of his shoulder, the rod of his oppressor, as in the day of Midian.* The heathen yoke taken away in 1-maccabees 13:41 is the broken yoke Isaiah sang of in the day of the Child to be born.'),
  ('apocrypha', '1-maccabees', 13, 41, 'canon', 'isaiah', 10, 27, 'free', E'Isaiah 10:27 — *And it shall come to pass in that day, that his burden shall be taken away from off thy shoulder, and his yoke from off thy neck, and the yoke shall be destroyed because of the anointing.* The yoke destroyed because of the anointing answers the heathen yoke lifted from Israel in 1-maccabees 13:41.'),
  ('apocrypha', '1-maccabees', 13, 41, 'canon', 'isaiah', 14, 25, 'free', E'Isaiah 14:25 — *That I will break the Assyrian in my land, and upon my mountains tread him under foot: then shall his yoke depart from off them, and his burden depart from off their shoulders.* Yahuah''s pledge to break the oppressor and lift the burden from the shoulder is realized when the yoke departs from Israel in 1-maccabees 13:41.'),
  -- thread: 1-maccabees-13-cleansed-citadel-feast
  ('apocrypha', '1-maccabees', 13, 52, 'canon', 'john', 10, 22, 'free', E'John 10:22 — *And it was at Jerusalem the feast of the dedication, and it was winter.* Simon''s ordaining the day of the cleansed citadel to be kept every year in 1-maccabees 13:52 belongs to the same feast of dedication the Messiah Himself kept in Jerusalem.'),
  ('apocrypha', '1-maccabees', 13, 47, 'canon', 'ezekiel', 36, 25, 'free', E'Ezekiel 36:25 — *Then will I sprinkle clean water upon you, and ye shall be clean: from all your filthiness, and from all your idols, will I cleanse you.* Simon cleansing the houses of the idols in 1-maccabees 13:47 enacts the promised cleansing of the covenant people from their idols.'),
  ('apocrypha', '1-maccabees', 13, 48, 'canon', 'isaiah', 52, 1, 'free', E'Isaiah 52:1 — *Awake, awake; put on thy strength, O Zion; put on thy beautiful garments, O Jerusalem, the holy city: for henceforth there shall no more come into thee the uncircumcised and the unclean.* Simon putting all uncleanness out and setting law-keepers there in 1-maccabees 13:48 is the holy city into which the unclean shall come no more.'),
  ('apocrypha', '1-maccabees', 13, 48, 'canon', 'zechariah', 14, 21, 'free', E'Zechariah 14:21 — *Yea, every pot in Jerusalem and in Yahudah (Judah) shall be holiness unto Yahuah Tseva''ot (LORD of hosts): and all they that sacrifice shall come and take of them, and seethe therein: and in that day there shall be no more the Canaanite in the house of Yahuah Tseva''ot (LORD of hosts).* Simon''s purged stronghold of law-keepers in 1-maccabees 13:48 foreshadows the day when all Jerusalem is holiness and no defiled thing remains.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1mac13_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1mac13_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-13-simon-chosen-leader',
       E'They chose Simon: be thou our leader',
       E'When Tryphon comes up to destroy Judea and the people quail, Simon stands in the gap and they raise him over them: *And they answered with a loud voice, saying, You shall be our leader instead of Judas and Jonathan your brother.* (1 Maccabees 13:8) — *Fight you our battles, and whatsoever, you commandest us, that will we do.* (1 Maccabees 13:9). This is the same covenant cry the brethren had raised over Jonathan when Judas fell — *Now therefore we have chosen you this day to be our prince and captain in his stead, that you may fight our battles.* (1 Maccabees 9:30): the leadership of the faithful remnant passes brother to brother, never broken, the seed kept against the kingdom-of-man. And Simon does not spare himself — he will spend his own life for the nation, which is the very measure the Messiah names: *Greater love hath no man than this, that a man lay down his life for his friends.* (John 15:13). The little flock of Yahudah is bent like a bow against Greece exactly as the prophet foresaw: *When I have bent Yahudah (Judah) for me, filled the bow with Ephraim, and raised up thy sons, O Zion, against thy sons, O Greece, and made thee as the sword of a mighty man.* (Zechariah 9:13).',
       sv.verse_id, ev.verse_id, 'extras', 61800
  FROM _session253_1mac13_lookup sv, _session253_1mac13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=13 AND sv.verse_number=5
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=13 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-13-brothers-slain-better-resurrection',
       E'All my brothers are slain for Israel''s sake',
       E'Simon counts the cost his house has paid for the laws and the sanctuary: *By reason of which all my brothers are slain for Yashar''el (Israel)''s sake, and I am left alone.* (1 Maccabees 13:4) — the Torah-faithful giving their lives rather than surrender the covenant, the charge their father laid on them: *Now therefore, my sons, be you zealous for the law, and give your lives for the covenant of your fathers.* (1 Maccabees 2:50). It is the priestly zeal of Phinehas, who stood for Yahuah and turned wrath away: *Phinehas, the son of Eleazar, the son of Aaron the priest, hath turned my wrath away from the children of Yashar''el (Israel), while he was zealous for my sake among them, that I consumed not the children of Yashar''el (Israel) in my jealousy.* (Numbers 25:11). And the hope under that dying is never the grave but the rising: *Women received their dead raised to life again: and others were tortured, not accepting deliverance; that they might obtain a better resurrection:* (Hebrews 11:35) — the very faith confessed by the brother under Antiochus'' torments, *the King of the world shall raise us up, who have died for his laws, to everlasting life.* (2 Maccabees 7:9), which the prophet Daniel had already sealed: *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* (Daniel 12:2).',
       sv.verse_id, ev.verse_id, 'extras', 61803
  FROM _session253_1mac13_lookup sv, _session253_1mac13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=13 AND sv.verse_number=3
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=13 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-13-yoke-removed-first-year',
       E'The yoke taken away: the first year of Simon',
       E'The deliverance is reckoned not as conquest but as release: *Thus the yoke of the heathen was taken away from Yashar''el (Israel) in the hundred and seventieth year.* (1 Maccabees 13:41) — *Then the people of Yashar''el (Israel) began to write in their instruments and contracts, In the first year of Simon the high priest, the governor and leader of the Yahudim (Jews).* (1 Maccabees 13:42). A new reckoning of years, a first year — this is the language of the jubilee, the year of liberty: *And ye shall hallow the fiftieth year, and proclaim liberty throughout all the land unto all the inhabitants thereof: it shall be a jubile unto you; and ye shall return every man unto his possession, and ye shall return every man unto his family.* (Leviticus 25:10). The breaking of the heathen yoke is the very deliverance Yeshayahu sang of the Messiah''s day: *For thou hast broken the yoke of his burden, and the staff of his shoulder, the rod of his oppressor, as in the day of Midian.* (Isaiah 9:4) — *And it shall come to pass in that day, that his burden shall be taken away from off thy shoulder, and his yoke from off thy neck, and the yoke shall be destroyed because of the anointing.* (Isaiah 10:27). The oppressor''s kingdom is dismantled and the burden lifted from the shoulder: *That I will break the Assyrian in my land, and upon my mountains tread him under foot: then shall his yoke depart from off them, and his burden depart from off their shoulders.* (Isaiah 14:25).',
       sv.verse_id, ev.verse_id, 'extras', 61806
  FROM _session253_1mac13_lookup sv, _session253_1mac13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=13 AND sv.verse_number=41
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=13 AND ev.verse_number=42
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-13-cleansed-citadel-feast',
       E'He cleansed the houses of idols and kept the day',
       E'Simon takes Gaza, then at last the citadel that had defiled Jerusalem, and enters not with plunder but with purging: *but put them out of the city, and cleansed the houses in which the idols were, and so entered into it with songs and thanksgiving.* (1 Maccabees 13:47) — *Yea, he put all uncleanness out of it, and placed such men there as would keep the law, and made it stronger than it was before, and built in it a dwellingplace for himself.* (1 Maccabees 13:48). He enters the tower with palm branches and harps and hymns, and *ordained also that that day should be kept every year with gladness* (1 Maccabees 13:52) — a feast born of cleansing the sanctuary, the kind the Messiah Himself would keep: *And it was at Jerusalem the feast of the dedication, and it was winter.* (John 10:22). The casting out of idols is the promised cleansing of the covenant people: *Then will I sprinkle clean water upon you, and ye shall be clean: from all your filthiness, and from all your idols, will I cleanse you.* (Ezekiel 36:25) — until the holy city holds nothing unclean: *Awake, awake; put on thy strength, O Zion; put on thy beautiful garments, O Jerusalem, the holy city: for henceforth there shall no more come into thee the uncircumcised and the unclean.* (Isaiah 52:1), every vessel made holiness to Yahuah: *Yea, every pot in Jerusalem and in Yahudah (Judah) shall be holiness unto Yahuah Tseva''ot (LORD of hosts): and all they that sacrifice shall come and take of them, and seethe therein: and in that day there shall be no more the Canaanite in the house of Yahuah Tseva''ot (LORD of hosts).* (Zechariah 14:21).',
       sv.verse_id, ev.verse_id, 'extras', 61809
  FROM _session253_1mac13_lookup sv, _session253_1mac13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=13 AND sv.verse_number=47
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=13 AND ev.verse_number=52
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-maccabees-13-simon-chosen-leader
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Maccabees 9:30 — *Now therefore we have chosen you this day to be our prince and captain in his stead, that you may fight our battles.* The same acclamation once given to Jonathan now passes to Simon in 1-maccabees 13:8 — the remnant''s leadership handed brother to brother, unbroken.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac13_lookup sv, _session253_1mac13_lookup tv
 WHERE t.slug='1-maccabees-13-simon-chosen-leader'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=13 AND sv.verse_number=8
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=9 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 15:13 — *Greater love hath no man than this, that a man lay down his life for his friends.* Simon''s refusal to spare his own life for the nation in 1-maccabees 13:5 is the shape of the love the Messiah names and then perfects.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac13_lookup sv, _session253_1mac13_lookup tv
 WHERE t.slug='1-maccabees-13-simon-chosen-leader'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=13 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=15 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Zechariah 9:13 — *When I have bent Yahudah (Judah) for me, filled the bow with Ephraim, and raised up thy sons, O Zion, against thy sons, O Greece, and made thee as the sword of a mighty man.* The people pledging Simon to fight their battles in 1-maccabees 13:9 is the prophet''s bow of Judah bent against the sons of Greece.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac13_lookup sv, _session253_1mac13_lookup tv
 WHERE t.slug='1-maccabees-13-simon-chosen-leader'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=13 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=9 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-13-brothers-slain-better-resurrection
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Maccabees 2:50 — *Now therefore, my sons, be you zealous for the law, and give your lives for the covenant of your fathers.* Simon''s reckoning in 1-maccabees 13:3 of all the house has done for the laws and the sanctuary is the fulfilment of Mattathias'' dying charge.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac13_lookup sv, _session253_1mac13_lookup tv
 WHERE t.slug='1-maccabees-13-brothers-slain-better-resurrection'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=13 AND sv.verse_number=3
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=2 AND tv.verse_number=50
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 25:11 — *Phinehas, the son of Eleazar, the son of Aaron the priest, hath turned my wrath away from the children of Yashar''el (Israel), while he was zealous for my sake among them, that I consumed not the children of Yashar''el (Israel) in my jealousy.* The brothers slain for Israel''s sake in 1-maccabees 13:4 carry the priestly zeal of Phinehas, who stood for the covenant.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac13_lookup sv, _session253_1mac13_lookup tv
 WHERE t.slug='1-maccabees-13-brothers-slain-better-resurrection'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=13 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=25 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 11:35 — *Women received their dead raised to life again: and others were tortured, not accepting deliverance; that they might obtain a better resurrection:* The brothers slain in 1-maccabees 13:4 are among those tortured who looked past deliverance to the better resurrection.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac13_lookup sv, _session253_1mac13_lookup tv
 WHERE t.slug='1-maccabees-13-brothers-slain-better-resurrection'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=13 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Maccabees 7:9 — *And when he was at the last gasp, he said, You like a fury takest us out of this present life, but the King of the world shall raise us up, who have died for his laws, to everlasting life.* The hope behind the brothers'' deaths in 1-maccabees 13:4 is voiced plainly by the martyr brother under the same persecution.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac13_lookup sv, _session253_1mac13_lookup tv
 WHERE t.slug='1-maccabees-13-brothers-slain-better-resurrection'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=13 AND sv.verse_number=4
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* Daniel had already sealed the everlasting life that crowns the brothers fallen for Israel in 1-maccabees 13:4.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac13_lookup sv, _session253_1mac13_lookup tv
 WHERE t.slug='1-maccabees-13-brothers-slain-better-resurrection'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=13 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-13-yoke-removed-first-year
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 25:10 — *And ye shall hallow the fiftieth year, and proclaim liberty throughout all the land unto all the inhabitants thereof: it shall be a jubile unto you; and ye shall return every man unto his possession, and ye shall return every man unto his family.* Israel''s new reckoning from the first year of Simon in 1-maccabees 13:42 is the jubilee proclamation of liberty written into their dating itself.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac13_lookup sv, _session253_1mac13_lookup tv
 WHERE t.slug='1-maccabees-13-yoke-removed-first-year'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=13 AND sv.verse_number=42
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=25 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 9:4 — *For thou hast broken the yoke of his burden, and the staff of his shoulder, the rod of his oppressor, as in the day of Midian.* The heathen yoke taken away in 1-maccabees 13:41 is the broken yoke Isaiah sang of in the day of the Child to be born.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac13_lookup sv, _session253_1mac13_lookup tv
 WHERE t.slug='1-maccabees-13-yoke-removed-first-year'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=13 AND sv.verse_number=41
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=9 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 10:27 — *And it shall come to pass in that day, that his burden shall be taken away from off thy shoulder, and his yoke from off thy neck, and the yoke shall be destroyed because of the anointing.* The yoke destroyed because of the anointing answers the heathen yoke lifted from Israel in 1-maccabees 13:41.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac13_lookup sv, _session253_1mac13_lookup tv
 WHERE t.slug='1-maccabees-13-yoke-removed-first-year'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=13 AND sv.verse_number=41
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=10 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 14:25 — *That I will break the Assyrian in my land, and upon my mountains tread him under foot: then shall his yoke depart from off them, and his burden depart from off their shoulders.* Yahuah''s pledge to break the oppressor and lift the burden from the shoulder is realized when the yoke departs from Israel in 1-maccabees 13:41.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac13_lookup sv, _session253_1mac13_lookup tv
 WHERE t.slug='1-maccabees-13-yoke-removed-first-year'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=13 AND sv.verse_number=41
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=14 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-13-cleansed-citadel-feast
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 10:22 — *And it was at Jerusalem the feast of the dedication, and it was winter.* Simon''s ordaining the day of the cleansed citadel to be kept every year in 1-maccabees 13:52 belongs to the same feast of dedication the Messiah Himself kept in Jerusalem.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac13_lookup sv, _session253_1mac13_lookup tv
 WHERE t.slug='1-maccabees-13-cleansed-citadel-feast'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=13 AND sv.verse_number=52
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=10 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 36:25 — *Then will I sprinkle clean water upon you, and ye shall be clean: from all your filthiness, and from all your idols, will I cleanse you.* Simon cleansing the houses of the idols in 1-maccabees 13:47 enacts the promised cleansing of the covenant people from their idols.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac13_lookup sv, _session253_1mac13_lookup tv
 WHERE t.slug='1-maccabees-13-cleansed-citadel-feast'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=13 AND sv.verse_number=47
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 52:1 — *Awake, awake; put on thy strength, O Zion; put on thy beautiful garments, O Jerusalem, the holy city: for henceforth there shall no more come into thee the uncircumcised and the unclean.* Simon putting all uncleanness out and setting law-keepers there in 1-maccabees 13:48 is the holy city into which the unclean shall come no more.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac13_lookup sv, _session253_1mac13_lookup tv
 WHERE t.slug='1-maccabees-13-cleansed-citadel-feast'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=13 AND sv.verse_number=48
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=52 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Zechariah 14:21 — *Yea, every pot in Jerusalem and in Yahudah (Judah) shall be holiness unto Yahuah Tseva''ot (LORD of hosts): and all they that sacrifice shall come and take of them, and seethe therein: and in that day there shall be no more the Canaanite in the house of Yahuah Tseva''ot (LORD of hosts).* Simon''s purged stronghold of law-keepers in 1-maccabees 13:48 foreshadows the day when all Jerusalem is holiness and no defiled thing remains.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac13_lookup sv, _session253_1mac13_lookup tv
 WHERE t.slug='1-maccabees-13-cleansed-citadel-feast'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=13 AND sv.verse_number=48
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=14 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

