-- ----- fragment: minion_1maccabees_14.sql (session253 1-maccabees 14) -----
-- Source anchor: apocrypha/1-maccabees ch14. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1mac14 (view _session253_1mac14_lookup). Sort band base 61825, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1mac14_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-maccabees-14-vine-and-fig-tree
  ('apocrypha', '1-maccabees', 14, 12, 'canon', 'micah', 4, 4, 'free', E'Micah 4:4 — *But they shall sit every man under his vine and under his fig tree; and none shall make them afraid: for the mouth of Yahuah Tseva''ot (LORD of hosts) hath spoken it.* The very phrase 1 Maccabees 14:12 uses for Simon''s peace is Micah''s portrait of the last-days kingdom, none to fray them.'),
  ('apocrypha', '1-maccabees', 14, 12, 'canon', 'zechariah', 3, 10, 'free', E'Zechariah 3:10 — *In that day, saith Yahuah Tseva''ot (LORD of hosts), shall ye call every man his neighbour under the vine and under the fig tree.* Zechariah binds the vine-and-fig-tree rest to the day of the BRANCH, the same shalom Simon''s rule briefly foreshadows in 1 Maccabees 14:12.'),
  ('apocrypha', '1-maccabees', 14, 12, 'canon', '1-kings', 4, 25, 'free', E'1 Kings 4:25 — *And Yahudah (Judah) and Yashar''el (Israel) dwelt safely, every man under his vine and under his fig tree, from Dan even to Beer-sheba, all the days of Solomon.* Simon''s quiet land in 1 Maccabees 14:12 is Solomon''s golden peace recovered, a sign of the greater Son of David''s reign.'),
  ('apocrypha', '1-maccabees', 14, 8, 'canon', 'leviticus', 26, 4, 'free', E'Leviticus 26:4 — *Then I will give you rain in due season, and the land shall yield her increase, and the trees of the field shall yield their fruit.* The earth giving her increase and the trees their fruit in 1 Maccabees 14:8 is Torah''s own covenant blessing on a people who walk in the statutes — never law-as-curse, but obedience answered with fruit.'),
  -- thread: 1-maccabees-14-law-searched-sanctuary
  ('apocrypha', '1-maccabees', 14, 14, 'canon', 'leviticus', 26, 6, 'free', E'Leviticus 26:6 — *And I will give peace in the land, and ye shall lie down, and none shall make you afraid: and I will rid evil beasts out of the land, neither shall the sword go through your land.* Simon searching out the law and taking away every contemner in 1 Maccabees 14:14 is the covenant condition under which Yahuah promises this very peace and rest.'),
  ('apocrypha', '1-maccabees', 14, 14, 'canon', 'hebrews', 11, 35, 'free', E'Hebrews 11:35 — *Women received their dead raised to life again: and others were tortured, not accepting deliverance; that they might obtain a better resurrection.* The Torah-faithful Simon strengthened in 1 Maccabees 14:14 are the very people Hebrews crowns, who held the law unto a better resurrection rather than break the covenant.'),
  ('apocrypha', '1-maccabees', 14, 14, 'apocrypha', '2-maccabees', 7, 9, 'extras', E'2 Maccabees 7:9 — *And when he was at the last gasp, he said, You like a fury takest us out of this present life, but the King of the world shall raise us up, who have died for his laws, to everlasting life.* The law Simon searches out in 1 Maccabees 14:14 is the same law for which the seven brothers died, certain the King of the world would raise them up.'),
  ('apocrypha', '1-maccabees', 14, 14, 'canon', 'daniel', 12, 2, 'free', E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The seed kept faithful to the law in 1 Maccabees 14:14 looks to Daniel''s promised awakening, the resurrection that is the true hope of the covenant-keepers.'),
  -- thread: 1-maccabees-14-enduring-priesthood
  ('apocrypha', '1-maccabees', 14, 26, 'canon', 'numbers', 25, 13, 'free', E'Numbers 25:13 — *And he shall have it, and his seed after him, even the covenant of an everlasting priesthood; because he was zealous for his Elohim (God), and made an atonement for the children of Yashar''el (Israel).* The house confirmed to Simon and his sons in 1 Maccabees 14:26 stands in the line of Phinehas, whose zeal won the covenant of an everlasting priesthood for his seed.'),
  ('apocrypha', '1-maccabees', 14, 49, 'apocrypha', '1-maccabees', 2, 54, 'extras', E'1 Maccabees 2:54 — *Phinees our father in being zealous and fervent obtained the covenant of an everlasting priesthood.* Mattathias'' own deathbed roll-call names the very pattern fulfilled when Simon and his sons are given the enduring priesthood in 1 Maccabees 14:49.'),
  ('apocrypha', '1-maccabees', 14, 41, 'canon', 'zechariah', 3, 8, 'free', E'Zechariah 3:8 — *Hear now, O Joshua the high priest, thou, and thy fellows that sit before thee: for they are men wondered at: for, behold, I will bring forth my servant the BRANCH.* Simon holds the high priesthood only until a faithful prophet arise (1 Maccabees 14:41); Zechariah names the One it waits for, the BRANCH who is Priest and King.'),
  -- thread: 1-maccabees-14-house-established
  ('apocrypha', '1-maccabees', 14, 26, 'canon', 'micah', 4, 6, 'free', E'Micah 4:6 — *In that day, saith Yahuah (LORD), will I assemble her that halteth, and I will gather her that is driven out, and her that I have afflicted.* Simon establishing Yashar''el and strengthening the brought-low in 1 Maccabees 14:26 mirrors Yahuah''s own promise to assemble the afflicted and driven-out.'),
  ('apocrypha', '1-maccabees', 14, 26, 'canon', 'micah', 4, 7, 'free', E'Micah 4:7 — *And I will make her that halted a remnant, and her that was cast far off a strong nation: and Yahuah (LORD) shall reign over them in mount Zion from henceforth, even for ever.* The liberty Simon confirms to a re-established Israel in 1 Maccabees 14:26 foreshadows the remnant made a strong nation under Yahuah''s everlasting reign in Zion.'),
  -- thread: 1-maccabees-14-feast-rededication
  ('apocrypha', '1-maccabees', 14, 15, 'apocrypha', '1-maccabees', 4, 59, 'extras', E'1 Maccabees 4:59 — *Moreover Judas and his brothers with the whole congregation of Yashar''el (Israel) ordained, that the days of the dedication of the altar should be kept in their season from year to year by the space of eight days, from the five and twentieth day of the month Casleu, with mirth and gladness.* The sanctuary Simon beautifies in 1 Maccabees 14:15 is the one Judas first rededicated, founding the eight-day feast kept year by year.'),
  ('apocrypha', '1-maccabees', 14, 15, 'canon', 'john', 10, 22, 'free', E'John 10:22 — *And it was at Jerusalem the feast of the dedication, and it was winter.* Simon beautifying and guarding the cleansed sanctuary in 1 Maccabees 14:15 stands behind the feast of dedication that the Messiah himself kept in Jerusalem.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1mac14_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1mac14_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-14-vine-and-fig-tree',
       E'Every man under his vine and fig tree',
       E'When Simon''s hand held the land, Yashar''el tasted the messianic shalom: *Then did they till their ground in peace, and the earth gave her increase, and the trees of the field their fruit* (1 Maccabees 14:8), and *For every man sat under his vine and his fig tree, and there was none to fray them* (1 Maccabees 14:12). This is no new picture — it is the prophets'' very emblem of the kingdom. Micah set it in the last days: *But they shall sit every man under his vine and under his fig tree; and none shall make them afraid: for the mouth of Yahuah Tseva''ot (LORD of hosts) hath spoken it* (Micah 4:4). Zechariah hung it on the day of the BRANCH: *In that day, saith Yahuah Tseva''ot (LORD of hosts), shall ye call every man his neighbour under the vine and under the fig tree* (Zechariah 3:10). It was Solomon''s golden reign remembered: *And Yahudah (Judah) and Yashar''el (Israel) dwelt safely, every man under his vine and under his fig tree, from Dan even to Beer-sheba, all the days of Solomon* (1 Kings 4:25). And it is Torah''s own covenant promise to the obedient: *Then I will give you rain in due season, and the land shall yield her increase, and the trees of the field shall yield their fruit* (Leviticus 26:4). Simon''s peace is a firstfruits foretaste of the rest the Messiah brings — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 61825
  FROM _session253_1mac14_lookup sv, _session253_1mac14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=14 AND sv.verse_number=8
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=14 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-14-law-searched-sanctuary',
       E'The law he searched out, the sanctuary he beautified',
       E'Simon''s peace was no mere prosperity; it was covenant-keeping made visible: *Moreover he strengthened all those of his people that were brought low: the law he searched out; and every contemner of the law and wicked person he took away* (1 Maccabees 14:14), and *He beautified the sanctuary, and multiplied vessels of the temple* (1 Maccabees 14:15). This is the Torah-faithfulness that the whole Maccabean witness defends unto death. Leviticus tied the land''s safety to exactly such walking: *And I will give peace in the land, and ye shall lie down, and none shall make you afraid: and I will rid evil beasts out of the land, neither shall the sword go through your land* (Leviticus 26:6). And the hope of those who searched out the law and would not break it was resurrection — the same hope Hebrews honours: *Women received their dead raised to life again: and others were tortured, not accepting deliverance; that they might obtain a better resurrection* (Hebrews 11:35). Their own brothers had confessed it: *And when he was at the last gasp, he said, You like a fury takest us out of this present life, but the King of the world shall raise us up, who have died for his laws, to everlasting life* (2 Maccabees 7:9). The law searched out is the seed kept for the day Daniel foresaw: *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt* (Daniel 12:2).',
       sv.verse_id, ev.verse_id, 'extras', 61828
  FROM _session253_1mac14_lookup sv, _session253_1mac14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=14 AND sv.verse_number=14
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=14 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-14-enduring-priesthood',
       E'The covenant of an enduring priesthood',
       E'The nation cried, *What thanks shall we give to Simon and his sons? For he and his brothers and the house of his father have established Yashar''el (Israel)* (1 Maccabees 14:25-26), and they confirmed the high priesthood to his house: *Also that the Yahudim (Jews) and priests were well pleased that Simon should be their governor and high priest for ever, until there should arise a faithful prophet* (1 Maccabees 14:41), engraving it in brass that *Simon and his sons might have them* (1 Maccabees 14:49). This is the pattern of Phinehas, whose zeal won an enduring house: *And he shall have it, and his seed after him, even the covenant of an everlasting priesthood; because he was zealous for his Elohim (God), and made an atonement for the children of Yashar''el (Israel)* (Numbers 25:13). Their own fathers had named it so: *Phinees our father in being zealous and fervent obtained the covenant of an everlasting priesthood* (1 Maccabees 2:54). Yet the priesthood is held *until there should arise a faithful prophet* — it points beyond itself to Zechariah''s vision, where the high priest is reclothed and the true Priest-King is promised: *Hear now, O Joshua the high priest, thou, and thy fellows that sit before thee: for they are men wondered at: for, behold, I will bring forth my servant the BRANCH* (Zechariah 3:8).',
       sv.verse_id, ev.verse_id, 'extras', 61831
  FROM _session253_1mac14_lookup sv, _session253_1mac14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=14 AND sv.verse_number=25
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=14 AND ev.verse_number=49
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-14-house-established',
       E'He established Israel and gathered her low',
       E'The people''s thanksgiving was that Simon *established Yashar''el (Israel), and chased away in fight their enemies from them, and confirmed their liberty* (1 Maccabees 14:26), having *strengthened all those of his people that were brought low* (1 Maccabees 14:14). This is the covenant people kept and regathered — never a church replacing Yashar''el, but the very remnant the prophets promised to assemble. Micah set the gathering in the same kingdom-day as the vine and fig tree: *In that day, saith Yahuah (LORD), will I assemble her that halteth, and I will gather her that is driven out, and her that I have afflicted* (Micah 4:6), *And I will make her that halted a remnant, and her that was cast far off a strong nation: and Yahuah (LORD) shall reign over them in mount Zion from henceforth, even for ever* (Micah 4:7). The brought-low strengthened, the driven-out established — Simon''s work is a token of the Shepherd-King who gathers the scattered house.',
       sv.verse_id, ev.verse_id, 'extras', 61834
  FROM _session253_1mac14_lookup sv, _session253_1mac14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=14 AND sv.verse_number=26
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=14 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-14-feast-rededication',
       E'The sanctuary multiplied — the feast the Messiah kept',
       E'Simon *beautified the sanctuary, and multiplied vessels of the temple* (1 Maccabees 14:15) and took charge *over the sanctuary* (1 Maccabees 14:42), guarding the holy place the Maccabees had cleansed and rededicated. That rededication became a feast Yahusha himself kept: *And it was at Jerusalem the feast of the dedication, and it was winter* (John 10:22). The Messiah walked in Solomon''s porch at the very feast born of the Maccabean cleansing Simon now defends — it ain''t new; the One who fulfils the temple honoured the festival of its restoration.',
       sv.verse_id, ev.verse_id, 'extras', 61837
  FROM _session253_1mac14_lookup sv, _session253_1mac14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=14 AND sv.verse_number=15
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=14 AND ev.verse_number=42
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-maccabees-14-vine-and-fig-tree
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Micah 4:4 — *But they shall sit every man under his vine and under his fig tree; and none shall make them afraid: for the mouth of Yahuah Tseva''ot (LORD of hosts) hath spoken it.* The very phrase 1 Maccabees 14:12 uses for Simon''s peace is Micah''s portrait of the last-days kingdom, none to fray them.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac14_lookup sv, _session253_1mac14_lookup tv
 WHERE t.slug='1-maccabees-14-vine-and-fig-tree'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=14 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Zechariah 3:10 — *In that day, saith Yahuah Tseva''ot (LORD of hosts), shall ye call every man his neighbour under the vine and under the fig tree.* Zechariah binds the vine-and-fig-tree rest to the day of the BRANCH, the same shalom Simon''s rule briefly foreshadows in 1 Maccabees 14:12.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac14_lookup sv, _session253_1mac14_lookup tv
 WHERE t.slug='1-maccabees-14-vine-and-fig-tree'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=14 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=3 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Kings 4:25 — *And Yahudah (Judah) and Yashar''el (Israel) dwelt safely, every man under his vine and under his fig tree, from Dan even to Beer-sheba, all the days of Solomon.* Simon''s quiet land in 1 Maccabees 14:12 is Solomon''s golden peace recovered, a sign of the greater Son of David''s reign.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac14_lookup sv, _session253_1mac14_lookup tv
 WHERE t.slug='1-maccabees-14-vine-and-fig-tree'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=14 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=4 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Leviticus 26:4 — *Then I will give you rain in due season, and the land shall yield her increase, and the trees of the field shall yield their fruit.* The earth giving her increase and the trees their fruit in 1 Maccabees 14:8 is Torah''s own covenant blessing on a people who walk in the statutes — never law-as-curse, but obedience answered with fruit.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac14_lookup sv, _session253_1mac14_lookup tv
 WHERE t.slug='1-maccabees-14-vine-and-fig-tree'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=14 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-14-law-searched-sanctuary
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 26:6 — *And I will give peace in the land, and ye shall lie down, and none shall make you afraid: and I will rid evil beasts out of the land, neither shall the sword go through your land.* Simon searching out the law and taking away every contemner in 1 Maccabees 14:14 is the covenant condition under which Yahuah promises this very peace and rest.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac14_lookup sv, _session253_1mac14_lookup tv
 WHERE t.slug='1-maccabees-14-law-searched-sanctuary'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=14 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 11:35 — *Women received their dead raised to life again: and others were tortured, not accepting deliverance; that they might obtain a better resurrection.* The Torah-faithful Simon strengthened in 1 Maccabees 14:14 are the very people Hebrews crowns, who held the law unto a better resurrection rather than break the covenant.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac14_lookup sv, _session253_1mac14_lookup tv
 WHERE t.slug='1-maccabees-14-law-searched-sanctuary'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=14 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Maccabees 7:9 — *And when he was at the last gasp, he said, You like a fury takest us out of this present life, but the King of the world shall raise us up, who have died for his laws, to everlasting life.* The law Simon searches out in 1 Maccabees 14:14 is the same law for which the seven brothers died, certain the King of the world would raise them up.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac14_lookup sv, _session253_1mac14_lookup tv
 WHERE t.slug='1-maccabees-14-law-searched-sanctuary'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=14 AND sv.verse_number=14
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The seed kept faithful to the law in 1 Maccabees 14:14 looks to Daniel''s promised awakening, the resurrection that is the true hope of the covenant-keepers.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac14_lookup sv, _session253_1mac14_lookup tv
 WHERE t.slug='1-maccabees-14-law-searched-sanctuary'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=14 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-14-enduring-priesthood
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 25:13 — *And he shall have it, and his seed after him, even the covenant of an everlasting priesthood; because he was zealous for his Elohim (God), and made an atonement for the children of Yashar''el (Israel).* The house confirmed to Simon and his sons in 1 Maccabees 14:26 stands in the line of Phinehas, whose zeal won the covenant of an everlasting priesthood for his seed.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac14_lookup sv, _session253_1mac14_lookup tv
 WHERE t.slug='1-maccabees-14-enduring-priesthood'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=14 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=25 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Maccabees 2:54 — *Phinees our father in being zealous and fervent obtained the covenant of an everlasting priesthood.* Mattathias'' own deathbed roll-call names the very pattern fulfilled when Simon and his sons are given the enduring priesthood in 1 Maccabees 14:49.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac14_lookup sv, _session253_1mac14_lookup tv
 WHERE t.slug='1-maccabees-14-enduring-priesthood'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=14 AND sv.verse_number=49
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=2 AND tv.verse_number=54
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Zechariah 3:8 — *Hear now, O Joshua the high priest, thou, and thy fellows that sit before thee: for they are men wondered at: for, behold, I will bring forth my servant the BRANCH.* Simon holds the high priesthood only until a faithful prophet arise (1 Maccabees 14:41); Zechariah names the One it waits for, the BRANCH who is Priest and King.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac14_lookup sv, _session253_1mac14_lookup tv
 WHERE t.slug='1-maccabees-14-enduring-priesthood'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=14 AND sv.verse_number=41
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-14-house-established
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Micah 4:6 — *In that day, saith Yahuah (LORD), will I assemble her that halteth, and I will gather her that is driven out, and her that I have afflicted.* Simon establishing Yashar''el and strengthening the brought-low in 1 Maccabees 14:26 mirrors Yahuah''s own promise to assemble the afflicted and driven-out.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac14_lookup sv, _session253_1mac14_lookup tv
 WHERE t.slug='1-maccabees-14-house-established'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=14 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=4 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Micah 4:7 — *And I will make her that halted a remnant, and her that was cast far off a strong nation: and Yahuah (LORD) shall reign over them in mount Zion from henceforth, even for ever.* The liberty Simon confirms to a re-established Israel in 1 Maccabees 14:26 foreshadows the remnant made a strong nation under Yahuah''s everlasting reign in Zion.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac14_lookup sv, _session253_1mac14_lookup tv
 WHERE t.slug='1-maccabees-14-house-established'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=14 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=4 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-14-feast-rededication
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Maccabees 4:59 — *Moreover Judas and his brothers with the whole congregation of Yashar''el (Israel) ordained, that the days of the dedication of the altar should be kept in their season from year to year by the space of eight days, from the five and twentieth day of the month Casleu, with mirth and gladness.* The sanctuary Simon beautifies in 1 Maccabees 14:15 is the one Judas first rededicated, founding the eight-day feast kept year by year.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac14_lookup sv, _session253_1mac14_lookup tv
 WHERE t.slug='1-maccabees-14-feast-rededication'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=14 AND sv.verse_number=15
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=4 AND tv.verse_number=59
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 10:22 — *And it was at Jerusalem the feast of the dedication, and it was winter.* Simon beautifying and guarding the cleansed sanctuary in 1 Maccabees 14:15 stands behind the feast of dedication that the Messiah himself kept in Jerusalem.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac14_lookup sv, _session253_1mac14_lookup tv
 WHERE t.slug='1-maccabees-14-feast-rededication'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=14 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=10 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

