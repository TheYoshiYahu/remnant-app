-- ----- fragment: minion_2maccabees_07.sql (session253 2-maccabees 7) -----
-- Source anchor: apocrypha/2-maccabees ch7. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2mac7 (view _session253_2mac7_lookup). Sort band base 62150, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2mac7_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-maccabees-7-better-resurrection
  ('apocrypha', '2-maccabees', 7, 9, 'canon', 'hebrews', 11, 35, 'free', E'Hebrews 11:35 — *Women received their dead raised to life again: and others were tortured, not accepting deliverance; that they might obtain a better resurrection:* This is the very passage that looks back to the brothers of 2 Maccabees 7:9, who would not accept deliverance for the sake of a better rising.'),
  ('apocrypha', '2-maccabees', 7, 14, 'canon', 'daniel', 12, 2, 'free', E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The fourth brother''s hope of being raised up again in 2 Maccabees 7:14 rests on this prophesied awakening to everlasting life.'),
  ('apocrypha', '2-maccabees', 7, 9, 'canon', 'john', 5, 28, 'free', E'John 5:28 — *Marvel not at this: for the hour is coming, in the which all that are in the graves shall hear his voice,* The King of the world who shall raise them up in 2 Maccabees 7:9 is the One whose voice the graves will hear.'),
  ('apocrypha', '2-maccabees', 7, 14, 'canon', 'john', 5, 29, 'free', E'John 5:29 — *And shall come forth; they that have done good, unto the resurrection of life; and they that have done evil, unto the resurrection of damnation.* The brother''s word that the tyrant shall have no resurrection to life (2 Maccabees 7:14) is this same parting of the two resurrections.'),
  -- thread: 2-maccabees-7-first-resurrection-thrones
  ('apocrypha', '2-maccabees', 7, 36, 'canon', 'revelation', 20, 4, 'free', E'Revelation 20:4 — *And I saw thrones, and they sat upon them, and judgment was given unto them: and I saw the souls of them that were beheaded for the witness of Yahusha (Jesus), and for the word of Elohim (God), and which had not worshipped the beast, neither his image, neither had received his mark upon their foreheads, or in their hands; and they lived and reigned with Messiah (Christ) a thousand years.* The brothers dead under the covenant of everlasting life in 2 Maccabees 7:36 are these enthroned souls slain for the word of Elohim.'),
  ('apocrypha', '2-maccabees', 7, 9, 'canon', 'revelation', 20, 6, 'free', E'Revelation 20:6 — *Blessed and holy is he that hath part in the first resurrection: on such the second death hath no power, but they shall be priests of Elohim (God) and of Messiah (Christ), and shall reign with him a thousand years.* The raising up to everlasting life confessed in 2 Maccabees 7:9 is a share in this first resurrection over which the second death has no power.'),
  -- thread: 2-maccabees-7-mother-gives-life-again
  ('apocrypha', '2-maccabees', 7, 23, 'canon', '2-corinthians', 4, 14, 'free', E'2 Corinthians 4:14 — *Knowing that he which raised up the Lord Yahusha (Lord Jesus) shall raise up us also by Yahusha (Jesus), and shall present us with you.* The Creator who gives breath and life again in 2 Maccabees 7:23 is the One who raises and presents His own.'),
  ('apocrypha', '2-maccabees', 7, 22, 'canon', 'deuteronomy', 32, 39, 'free', E'Deuteronomy 32:39 — *See now that I, even I, am he, and there is no god with me: I kill, and I make alive; I wound, and I heal: neither is there any that can deliver out of my hand.* The mother''s confession that she neither gave breath nor formed the members (2 Maccabees 7:22) leans on this God who alone kills and makes alive.'),
  -- thread: 2-maccabees-7-ex-nihilo
  ('apocrypha', '2-maccabees', 7, 28, 'canon', 'hebrews', 11, 3, 'free', E'Hebrews 11:3 — *Through faith we understand that the worlds were framed by the word of Elohim (God), so that things which are seen were not made of things which do appear.* The mother''s teaching that Elohim made all of things that were not (2 Maccabees 7:28) is this same faith that the seen was not made of what appears.'),
  ('apocrypha', '2-maccabees', 7, 28, 'canon', 'romans', 4, 17, 'free', E'Romans 4:17 — *(As it is written, I have made thee a father of many nations,) before him whom he believed, even Elohim (God), who quickeneth the dead, and calleth those things which be not as though they were.* The God who made all of things that were not in 2 Maccabees 7:28 is the same who quickens the dead and calls the things which be not.'),
  -- thread: 2-maccabees-7-die-for-the-laws
  ('apocrypha', '2-maccabees', 7, 6, 'canon', 'deuteronomy', 32, 36, 'free', E'Deuteronomy 32:36 — *For Yahuah (LORD) shall judge his people, and repent himself for his servants, when he seeth that their power is gone, and there is none shut up, or left.* The brothers cite Moses'' song that He shall be comforted in His servants (2 Maccabees 7:6), and this is the verse of that comfort.'),
  ('apocrypha', '2-maccabees', 7, 2, 'apocrypha', '2-maccabees', 6, 19, 'extras', E'2 Maccabees 6:19 — *But he, choosing rather to die gloriously, than to live stained with such an abomination, spit it forth, and came of his own accord to the torment,* Eleazar''s choice to die rather than taste swine is the same covenant-faithfulness the brothers swear in 2 Maccabees 7:2.'),
  -- thread: 2-maccabees-7-judgment-on-the-tyrant
  ('apocrypha', '2-maccabees', 7, 35, 'canon', 'deuteronomy', 32, 35, 'free', E'Deuteronomy 32:35 — *To me belongeth vengeance, and recompence; their foot shall slide in due time: for the day of their calamity is at hand, and the things that shall come upon them make haste.* The judgment of Almighty Yahuah that the tyrant has not escaped in 2 Maccabees 7:35 is the recompense Moses says belongs to God alone.'),
  ('apocrypha', '2-maccabees', 7, 19, 'canon', 'romans', 12, 19, 'free', E'Romans 12:19 — *Dearly beloved, avenge not yourselves, but rather give place unto wrath: for it is written, Vengeance is mine; I will repay, saith Yahuah (Lord).* The warning that Antiochus shall not escape unpunished (2 Maccabees 7:19) leaves vengeance to the God who says He will repay.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2mac7_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2mac7_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-7-better-resurrection',
       E'The seven brothers and the better resurrection',
       E'Seven brothers and their mother are tortured for refusing swine''s flesh, and one after another they confess the hope no tyrant can touch: *And when he was at the last gasp, he said, You like a fury takest us out of this present life, but the King of the world shall raise us up, who have died for his laws, to everlasting life* (2 Maccabees 7:9), and the fourth, *It is good, being put to death by men, to look for hope from Yahuah (God) to be raised up again by him* (2 Maccabees 7:14). It ain''t new, and it ain''t a later church doctrine: when Hebrews names the cloud of witnesses it points straight back to these very martyrs — *Women received their dead raised to life again: and others were tortured, not accepting deliverance; that they might obtain a better resurrection* (Hebrews 11:35). The Spirit of prophecy long before had laid the foundation: *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt* (Daniel 12:2), and the Messiah sealed it: *Marvel not at this: for the hour is coming, in the which all that are in the graves shall hear his voice* (John 5:28). Come and see — the brothers died for the laws of their fathers in the sure hope of standing again.',
       sv.verse_id, ev.verse_id, 'extras', 62150
  FROM _session253_2mac7_lookup sv, _session253_2mac7_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=7 AND sv.verse_number=9
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=7 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-7-first-resurrection-thrones',
       E'Slain for the witness, reigning in the first resurrection',
       E'These youths are killed for keeping the covenant, and they die looking past the executioner: *but the King of the world shall raise us up, who have died for his laws, to everlasting life* (2 Maccabees 7:9), and the seventh, *For our brothers, who now have suffered a short pain, are dead under the covenant of Yahuah (God) of everlasting life* (2 Maccabees 7:36). John sees the end of their hope — the souls slain for the witness, raised and enthroned: *and I saw the souls of them that were beheaded for the witness of Yahusha (Jesus), and for the word of Elohim (God)... and they lived and reigned with Messiah (Christ) a thousand years* (Revelation 20:4), *Blessed and holy is he that hath part in the first resurrection: on such the second death hath no power* (Revelation 20:6). Come and see — the death these brothers died is the very martyrdom John crowns, and the resurrection they confessed is the first resurrection.',
       sv.verse_id, ev.verse_id, 'extras', 62153
  FROM _session253_2mac7_lookup sv, _session253_2mac7_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=7 AND sv.verse_number=9
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=7 AND ev.verse_number=36
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-7-mother-gives-life-again',
       E'The mother and the Creator who gives breath again',
       E'The mother, marvellous above all, watches seven sons die in one day and answers torture with the doctrine of creation and resurrection together: *I cannot tell how you came into my womb: for I neither gave you breath nor life, neither was it I that formed the members of every one of you; But doubtless the Creator of the world, who formed the generation of man... will also of his own mercy give you breath and life again* (2 Maccabees 7:22-23). The God who first gave the breath can give it back — *Knowing that he which raised up the Lord Yahusha (Lord Jesus) shall raise up us also by Yahusha (Jesus), and shall present us with you* (2 Corinthians 4:14). And Moses set this Creator''s two-handed power in his song: *See now that I, even I, am he, and there is no god with me: I kill, and I make alive; I wound, and I heal: neither is there any that can deliver out of my hand* (Deuteronomy 32:39). Come and see — the same hand that formed the members gives life again.',
       sv.verse_id, ev.verse_id, 'extras', 62156
  FROM _session253_2mac7_lookup sv, _session253_2mac7_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=7 AND sv.verse_number=22
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=7 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-7-ex-nihilo',
       E'Elohim made them of things that were not',
       E'The mother''s last word to her youngest is creation out of nothing, set as the very ground of resurrection: *I beseech you, my son, look upon the heaven and the earth, and all that is in it, and consider that Yahuah (God) made them of things that were not; and so was mankind made likewise* (2 Maccabees 7:28). It ain''t new — Hebrews speaks the same mystery: *Through faith we understand that the worlds were framed by the word of Elohim (God), so that things which are seen were not made of things which do appear* (Hebrews 11:3), and Paul names the God of resurrection by this very power: *even Elohim (God), who quickeneth the dead, and calleth those things which be not as though they were* (Romans 4:17). The God who made what was not from nothing can raise the dead from the grave. Come and see — ex nihilo and resurrection are one faith.',
       sv.verse_id, ev.verse_id, 'extras', 62159
  FROM _session253_2mac7_lookup sv, _session253_2mac7_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=7 AND sv.verse_number=28
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=7 AND ev.verse_number=29
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-7-die-for-the-laws',
       E'Torah-faithful unto death; the song of Moses witnessed',
       E'These are not law-cursed men but covenant-keepers who will die before they break the commandment: *we are ready to die, rather than to transgress the laws of our fathers* (2 Maccabees 7:2), and the youngest, *I will not obey the king''s commandment: but I will obey the commandment of the law that was given to our fathers by Moses* (2 Maccabees 7:30). They die comforted by Moses'' own song: *as Moses in his song, which witnessed to their faces, declared, saying, And he shall be comforted in his servants* (2 Maccabees 7:6) — *For Yahuah (LORD) shall judge his people, and repent himself for his servants* (Deuteronomy 32:36). And their elder Eleazar had gone the same way before them, refusing the same swine: *But he, choosing rather to die gloriously, than to live stained with such an abomination, spit it forth, and came of his own accord to the torment* (2 Maccabees 6:19). Come and see — Torah-faithfulness unto death, never law as curse.',
       sv.verse_id, ev.verse_id, 'extras', 62162
  FROM _session253_2mac7_lookup sv, _session253_2mac7_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=7 AND sv.verse_number=2
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=7 AND ev.verse_number=30
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-7-judgment-on-the-tyrant',
       E'Vengeance belongs to Elohim; the tyrant shall not escape',
       E'Antiochus rages as the man of lawlessness, the abomination who would dismantle the covenant — but the dying brothers hand his judgment up to heaven: *abide a while, and behold his great power, how he will torment you and your seed* (2 Maccabees 7:17), and *think not... that you shall escape unpunished* (2 Maccabees 7:19), *For you have not yet escaped the judgment of Almighty Yahuah (God), who seeth all things* (2 Maccabees 7:35). This is no private revenge but the Torah''s own verdict: *To me belongeth vengeance, and recompence; their foot shall slide in due time: for the day of their calamity is at hand* (Deuteronomy 32:35), which Paul repeats: *Vengeance is mine; I will repay, saith Yahuah (Lord)* (Romans 12:19). Come and see — the kingdom of man falls under the judgment of Almighty Yahuah who seeth all things.',
       sv.verse_id, ev.verse_id, 'extras', 62165
  FROM _session253_2mac7_lookup sv, _session253_2mac7_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=7 AND sv.verse_number=17
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=7 AND ev.verse_number=35
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-maccabees-7-better-resurrection
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 11:35 — *Women received their dead raised to life again: and others were tortured, not accepting deliverance; that they might obtain a better resurrection:* This is the very passage that looks back to the brothers of 2 Maccabees 7:9, who would not accept deliverance for the sake of a better rising.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac7_lookup sv, _session253_2mac7_lookup tv
 WHERE t.slug='2-maccabees-7-better-resurrection'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=7 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The fourth brother''s hope of being raised up again in 2 Maccabees 7:14 rests on this prophesied awakening to everlasting life.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac7_lookup sv, _session253_2mac7_lookup tv
 WHERE t.slug='2-maccabees-7-better-resurrection'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=7 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 5:28 — *Marvel not at this: for the hour is coming, in the which all that are in the graves shall hear his voice,* The King of the world who shall raise them up in 2 Maccabees 7:9 is the One whose voice the graves will hear.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac7_lookup sv, _session253_2mac7_lookup tv
 WHERE t.slug='2-maccabees-7-better-resurrection'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=7 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=5 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'John 5:29 — *And shall come forth; they that have done good, unto the resurrection of life; and they that have done evil, unto the resurrection of damnation.* The brother''s word that the tyrant shall have no resurrection to life (2 Maccabees 7:14) is this same parting of the two resurrections.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac7_lookup sv, _session253_2mac7_lookup tv
 WHERE t.slug='2-maccabees-7-better-resurrection'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=7 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=5 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-7-first-resurrection-thrones
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 20:4 — *And I saw thrones, and they sat upon them, and judgment was given unto them: and I saw the souls of them that were beheaded for the witness of Yahusha (Jesus), and for the word of Elohim (God), and which had not worshipped the beast, neither his image, neither had received his mark upon their foreheads, or in their hands; and they lived and reigned with Messiah (Christ) a thousand years.* The brothers dead under the covenant of everlasting life in 2 Maccabees 7:36 are these enthroned souls slain for the word of Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac7_lookup sv, _session253_2mac7_lookup tv
 WHERE t.slug='2-maccabees-7-first-resurrection-thrones'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=7 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 20:6 — *Blessed and holy is he that hath part in the first resurrection: on such the second death hath no power, but they shall be priests of Elohim (God) and of Messiah (Christ), and shall reign with him a thousand years.* The raising up to everlasting life confessed in 2 Maccabees 7:9 is a share in this first resurrection over which the second death has no power.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac7_lookup sv, _session253_2mac7_lookup tv
 WHERE t.slug='2-maccabees-7-first-resurrection-thrones'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=7 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-7-mother-gives-life-again
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Corinthians 4:14 — *Knowing that he which raised up the Lord Yahusha (Lord Jesus) shall raise up us also by Yahusha (Jesus), and shall present us with you.* The Creator who gives breath and life again in 2 Maccabees 7:23 is the One who raises and presents His own.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac7_lookup sv, _session253_2mac7_lookup tv
 WHERE t.slug='2-maccabees-7-mother-gives-life-again'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=7 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=4 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 32:39 — *See now that I, even I, am he, and there is no god with me: I kill, and I make alive; I wound, and I heal: neither is there any that can deliver out of my hand.* The mother''s confession that she neither gave breath nor formed the members (2 Maccabees 7:22) leans on this God who alone kills and makes alive.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac7_lookup sv, _session253_2mac7_lookup tv
 WHERE t.slug='2-maccabees-7-mother-gives-life-again'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=7 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=39
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-7-ex-nihilo
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 11:3 — *Through faith we understand that the worlds were framed by the word of Elohim (God), so that things which are seen were not made of things which do appear.* The mother''s teaching that Elohim made all of things that were not (2 Maccabees 7:28) is this same faith that the seen was not made of what appears.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac7_lookup sv, _session253_2mac7_lookup tv
 WHERE t.slug='2-maccabees-7-ex-nihilo'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=7 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 4:17 — *(As it is written, I have made thee a father of many nations,) before him whom he believed, even Elohim (God), who quickeneth the dead, and calleth those things which be not as though they were.* The God who made all of things that were not in 2 Maccabees 7:28 is the same who quickens the dead and calls the things which be not.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac7_lookup sv, _session253_2mac7_lookup tv
 WHERE t.slug='2-maccabees-7-ex-nihilo'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=7 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=4 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-7-die-for-the-laws
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 32:36 — *For Yahuah (LORD) shall judge his people, and repent himself for his servants, when he seeth that their power is gone, and there is none shut up, or left.* The brothers cite Moses'' song that He shall be comforted in His servants (2 Maccabees 7:6), and this is the verse of that comfort.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac7_lookup sv, _session253_2mac7_lookup tv
 WHERE t.slug='2-maccabees-7-die-for-the-laws'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=7 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Maccabees 6:19 — *But he, choosing rather to die gloriously, than to live stained with such an abomination, spit it forth, and came of his own accord to the torment,* Eleazar''s choice to die rather than taste swine is the same covenant-faithfulness the brothers swear in 2 Maccabees 7:2.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac7_lookup sv, _session253_2mac7_lookup tv
 WHERE t.slug='2-maccabees-7-die-for-the-laws'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=7 AND sv.verse_number=2
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=6 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-7-judgment-on-the-tyrant
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 32:35 — *To me belongeth vengeance, and recompence; their foot shall slide in due time: for the day of their calamity is at hand, and the things that shall come upon them make haste.* The judgment of Almighty Yahuah that the tyrant has not escaped in 2 Maccabees 7:35 is the recompense Moses says belongs to God alone.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac7_lookup sv, _session253_2mac7_lookup tv
 WHERE t.slug='2-maccabees-7-judgment-on-the-tyrant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=7 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 12:19 — *Dearly beloved, avenge not yourselves, but rather give place unto wrath: for it is written, Vengeance is mine; I will repay, saith Yahuah (Lord).* The warning that Antiochus shall not escape unpunished (2 Maccabees 7:19) leaves vengeance to the God who says He will repay.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac7_lookup sv, _session253_2mac7_lookup tv
 WHERE t.slug='2-maccabees-7-judgment-on-the-tyrant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=7 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=12 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

