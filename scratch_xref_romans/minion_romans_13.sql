-- ----- fragment: minion_romans_13.sql (S219 Romans 13) -----
-- =====================================================================
-- S219 minion — ROMANS 13 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: ROMANS 13.  Tag: r13 (temp view _s219_r13_lookup).  Sort band: 6300-6324, step 3.
-- Source is ALWAYS the canon Romans verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (Red Lines #4/#5/#6/#10): the load-bearing turn of this chapter is
-- *he that loveth another hath fulfilled the law* (13:8) and *love is the fulfilling of the
-- law* (13:10). FULFILLED means kept, filled full, brought to its summary and doing — NEVER
-- abolished or replaced. Paul proves it himself: he immediately CITES the actual commandments
-- — *Thou shalt not commit adultery, Thou shalt not kill, Thou shalt not steal, Thou shalt
-- not bear false witness, Thou shalt not covet* (13:9 = Exodus 20:13-17 / Deuteronomy 5:17-21)
-- — and names the summary as *Thou shalt love thy neighbour as thyself* (Leviticus 19:18).
-- Love is not the cancellation of those commandments; love is their keeping. The man who
-- loves his neighbour does not kill, steal, lie, or covet against him — *love worketh no ill
-- to his neighbour.* The commandments are still standing; love is the doing of them. The
-- higher-powers passage (13:1-7) is read with Proverbs 8:15 and Daniel 2:21 (Yahuah sets up
-- and removes rulers) and Wisdom of Solomon 6:3 (power given of the Most High, who tries
-- their works) — authority is ordained and is itself judged. 13:11-14 (awake, the armour of
-- light, walk honestly) echoes Isaiah 26:9 and Isaiah 60:1 (arise, shine; the light is come).
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-7   higher powers / the sword     Tanakh: Proverbs 8:15, Daniel 2:21 (Yahuah sets up and removes rulers)  Extras: Wisdom of Solomon 6:3 (power given of the Most High, who tries their works)  NT: Matthew 22:21 (render unto Caesar)
--   v.8     he that loveth hath fulfilled  Tanakh: Leviticus 19:18 (love thy neighbour)  Extras: none warranted  NT: Galatians 5:14 (all the law fulfilled in one word), Matthew 22:39-40
--   v.9     the commandments cited         Tanakh: Exodus 20:13-17, Deuteronomy 5:17-21 (the Decalogue Paul quotes)  Extras: none warranted  NT: Matthew 22:37-40 (on these hang all the law and the prophets)
--   v.10    love is the fulfilling          Tanakh: Leviticus 19:18 (carried at v.8)  Extras: none warranted  NT: Galatians 5:14 (carried at v.8)
--   v.11-12 awake / put on the armour       Tanakh: Isaiah 26:9 (desired thee in the night, seek early), Isaiah 60:1 (arise, shine)  Extras: none warranted  NT: 1 Thessalonians 5:5-6
--   v.13-14 walk honestly as in the day     Tanakh: none added (carried at v.11-12)  Extras: none warranted  NT: 1 Thessalonians 5:8 (put on the breastplate, children of the day)
--
-- THREADS (slug -> target libraries):
--   6300 romans-13-the-higher-powers-ordained-of-elohim-and-judged-by-him               (Tanakh + Extras + NT)
--   6303 romans-13-he-that-loveth-another-hath-fulfilled-the-law                          (Tanakh + NT)
--   6306 romans-13-the-commandments-briefly-comprehended-thou-shalt-love-thy-neighbour    (Tanakh + NT)
--   6309 romans-13-the-night-far-spent-awake-and-put-on-the-armour-of-light               (Tanakh + NT)
-- =====================================================================

CREATE TEMP VIEW _s219_r13_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: romans-13-the-higher-powers-ordained-of-elohim-and-judged-by-him
  ('canon', 'romans', 13, 1, 'canon', 'proverbs', 8, 15, 'free', E'*By me kings reign, and princes decree justice.* (Proverbs 8:15). *Let every soul be subject unto the higher powers. For there is no power but of Elohim (God): the powers that be are ordained of Elohim (God)* (Romans 13:1). Paul does not invent a new doctrine of the state — he stands on wisdom''s own word: it is *by me* that *kings reign,* the power held by every ruler is power lent from above. The throne is ordained, never autonomous; the one who sits on it sits because Elohim set him there.'),
  ('canon', 'romans', 13, 1, 'canon', 'daniel', 2, 21, 'free', E'*And he changeth the times and the seasons: he removeth kings, and setteth up kings: he giveth wisdom unto the wise, and knowledge to them that know understanding:* (Daniel 2:21). *The powers that be are ordained of Elohim (God)* (Romans 13:1). Daniel blessed the Elohim of heaven who *removeth kings, and setteth up kings* — the same truth Paul presses on the assembly at Rome. No power stands but the one set up by the Most High, and the One who sets it up can also remove it; the ordaining and the un-ordaining are both his.'),
  ('canon', 'romans', 13, 4, 'apocrypha', 'the-wisdom-of-solomon', 6, 3, 'extras', E'*For power is given you of Yahuah (God), and sovereignty from the Highest, who shall try your works, and search out your counsels.* (Wisdom of Solomon 6:3). The ruler *is the minister of Elohim (God) to thee for good … he beareth not the sword in vain: for he is the minister of Elohim (God), a revenger to execute wrath upon him that doeth evil* (Romans 13:4). The wisdom-writer holds both halves Paul holds: power is *given you of Yahuah,* yet the One who gives it *shall try your works.* The sword is a delegated ministry — the ruler answers to the One who armed him, and a sharp judgment waits for the minister who does not judge aright.'),
  ('canon', 'romans', 13, 7, 'canon', 'matthew', 22, 21, 'free', E'*They say unto him, Cæsar''s. Then saith he unto them, Render therefore unto Cæsar the things which are Cæsar''s; and unto Elohim (God) the things that are Elohim''s (God''s).* (Matthew 22:21). *Render therefore to all their dues: tribute to whom tribute is due; custom to whom custom; fear to whom fear; honour to whom honour* (Romans 13:7). Paul echoes the Master''s own word with the same verb — *render.* The tribute owed to Caesar is rendered; but the rendering to Caesar never crowds out the rendering to Elohim, for the throne itself is on loan from him. Give the ruler his due, and give Elohim what is his.'),
  -- thread: romans-13-he-that-loveth-another-hath-fulfilled-the-law
  ('canon', 'romans', 13, 8, 'canon', 'leviticus', 19, 18, 'free', E'*Thou shalt not avenge, nor bear any grudge against the children of thy people, but thou shalt love thy neighbour as thyself: I am Yahuah (LORD).* (Leviticus 19:18). *Owe no man any thing, but to love one another: for he that loveth another hath fulfilled the law* (Romans 13:8). The commandment Paul calls the fulfilling of the law is not his own coinage — it is Moses'' word, *thou shalt love thy neighbour as thyself,* spoken from Sinai with *I am Yahuah* sealing it. To fulfil the law is to fill it full, to do it: the one who loves his neighbour keeps the very commandment the law gave. Love is the law''s own summary, never its cancellation.'),
  ('canon', 'romans', 13, 8, 'canon', 'galatians', 5, 14, 'free', E'*For all the law is fulfilled in one word, even in this; Thou shalt love thy neighbour as thyself.* (Galatians 5:14). *He that loveth another hath fulfilled the law* (Romans 13:8). Paul says the same thing twice, in two letters: the whole law is *fulfilled* — kept, brought to its fullness — *in one word,* the very word of Leviticus 19:18. Fulfilled does not mean abolished; it means done. The law is not emptied by love but filled by it, summed up and carried out in the one who loves his neighbour as himself.'),
  -- thread: romans-13-the-commandments-briefly-comprehended-thou-shalt-love-thy-neighbour
  ('canon', 'romans', 13, 9, 'canon', 'exodus', 20, 13, 'free', E'*Thou shalt not kill.* (Exodus 20:13). When Paul writes *for this, Thou shalt not commit adultery, Thou shalt not kill, Thou shalt not steal, Thou shalt not bear false witness, Thou shalt not covet* (Romans 13:9), he is quoting the very words Elohim spake from the mountain. *Thou shalt not kill* stands in the Ten as Elohim gave them. Paul does not loosen the commandment by naming it — he establishes it, sets it down word for word as the content of the love that does no ill to a neighbour.'),
  ('canon', 'romans', 13, 9, 'canon', 'exodus', 20, 14, 'free', E'*Thou shalt not commit adultery.* (Exodus 20:14). Paul''s list — *Thou shalt not commit adultery, Thou shalt not kill, Thou shalt not steal* (Romans 13:9) — is the Decalogue itself, the commandments written *in two tables of stone.* He cites *Thou shalt not commit adultery* exactly as it was spoken at Sinai. The apostle who is said to have abolished the law here recites it from memory as the standing, binding word that love keeps.'),
  ('canon', 'romans', 13, 9, 'canon', 'exodus', 20, 15, 'free', E'*Thou shalt not steal.* (Exodus 20:15). *Thou shalt not steal* (Romans 13:9) is lifted straight from the Ten. Paul names commandment after commandment from the Sinai tablets and then gathers them: *if there be any other commandment, it is briefly comprehended in this saying, namely, Thou shalt love thy neighbour as thyself.* The commandments are comprehended in love — summed up, held together — not set aside. The thief does ill to his neighbour; love does none.'),
  ('canon', 'romans', 13, 9, 'canon', 'exodus', 20, 17, 'free', E'*Thou shalt not covet thy neighbour''s house, thou shalt not covet thy neighbour''s wife, nor his manservant, nor his maidservant, nor his ox, nor his ass, nor any thing that is thy neighbour''s.* (Exodus 20:17). Paul closes his citation with *Thou shalt not covet* (Romans 13:9) — the tenth word, reaching to the heart''s desire against a neighbour. He names it as the standing commandment it is, and then declares it *briefly comprehended in this saying, namely, Thou shalt love thy neighbour as thyself.* Covetousness is ill toward a neighbour; love works no ill, and so love keeps even this.'),
  ('canon', 'romans', 13, 9, 'canon', 'deuteronomy', 5, 21, 'free', E'*Neither shalt thou desire thy neighbour''s wife, neither shalt thou covet thy neighbour''s house, his field, or his manservant, or his maidservant, his ox, or his ass, or any thing that is thy neighbour''s.* (Deuteronomy 5:21). The commandments Paul quotes — *Thou shalt not commit adultery, Thou shalt not kill, Thou shalt not steal, Thou shalt not bear false witness, Thou shalt not covet* (Romans 13:9) — stand in Moses'' second giving of the Ten just as in the first, the words Yahuah *spake unto all your assembly in the mount … and he added no more.* These are the commandments love comprehends; Paul rehearses the Decalogue as the abiding instruction the loving heart fulfils.'),
  ('canon', 'romans', 13, 9, 'canon', 'matthew', 22, 39, 'free', E'*And the second is like unto it, Thou shalt love thy neighbour as thyself.* (Matthew 22:39). Paul says the commandments are *briefly comprehended in this saying, namely, Thou shalt love thy neighbour as thyself* (Romans 13:9); the Master had already named that same word the second great commandment, *like unto* the first. And he sealed it: *on these two commandments hang all the law and the prophets* (Matthew 22:40). To hang the law on love is not to take the law down — it is to show what holds it up. Paul teaches exactly what his Master taught.'),
  -- thread: romans-13-the-night-far-spent-awake-and-put-on-the-armour-of-light
  ('canon', 'romans', 13, 11, 'canon', 'isaiah', 26, 9, 'free', E'*With my soul have I desired thee in the night; yea, with my spirit within me will I seek thee early: for when thy judgments are in the earth, the inhabitants of the world will learn righteousness.* (Isaiah 26:9). *Knowing the time, that now it is high time to awake out of sleep: for now is our salvation nearer than when we believed* (Romans 13:11). Isaiah''s soul *desired thee in the night* and rose to *seek thee early* — the very posture Paul calls for, to awake while it is yet night because the morning of salvation draws near. The watcher in the dark is the one who learns righteousness when the day breaks.'),
  ('canon', 'romans', 13, 12, 'canon', 'isaiah', 60, 1, 'free', E'*Arise, shine; for thy light is come, and the glory of Yahuah (LORD) is risen upon thee.* (Isaiah 60:1). *The night is far spent, the day is at hand: let us therefore cast off the works of darkness, and let us put on the armour of light* (Romans 13:12). Isaiah''s call to the gathered is the same summons Paul presses: the darkness covers the earth, but the light *is come,* the glory *is risen* — so arise, shine, put on the armour of light. The night gives way to the day of Yahuah, and those who are his are clothed in his light.'),
  ('canon', 'romans', 13, 12, 'canon', '1-thessalonians', 5, 5, 'free', E'*Ye are all the children of light, and the children of the day: we are not of the night, nor of darkness.* (1 Thessalonians 5:5). *The night is far spent, the day is at hand: let us therefore cast off the works of darkness, and let us put on the armour of light* (Romans 13:12). Paul writes the same charge to two assemblies: those who belong to the coming day are *children of light,* not of the night. The casting off of the works of darkness and the putting on of light is the walk of the day-people while the dawn is still breaking.'),
  ('canon', 'romans', 13, 13, 'canon', '1-thessalonians', 5, 8, 'free', E'*But let us, who are of the day, be sober, putting on the breastplate of faith and love; and for an helmet, the hope of salvation.* (1 Thessalonians 5:8). *Let us walk honestly, as in the day; not in rioting and drunkenness, not in chambering and wantonness, not in strife and envying* (Romans 13:13). The walk *as in the day* is the sober walk of the one who has put on the armour — the breastplate of faith and love, the helmet of hope. The drunkenness and wantonness and strife are the works of the night; the day-walker casts them off and puts the armour of light on instead.'),
  ('canon', 'romans', 13, 11, 'canon', '1-thessalonians', 5, 6, 'free', E'*Therefore let us not sleep, as do others; but let us watch and be sober.* (1 Thessalonians 5:6). *Knowing the time, that now it is high time to awake out of sleep: for now is our salvation nearer than when we believed* (Romans 13:11). The same word in both letters: *let us not sleep … let us watch.* To awake out of sleep is to take up the watch, sober and ready, because the day of salvation is nearer now than at the first believing. The sleeper is overtaken; the watcher is found ready.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s219_r13_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s219_r13_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-13-the-higher-powers-ordained-of-elohim-and-judged-by-him',
       E'The higher powers — ordained of Elohim (God) and judged by him',
       E'*Let every soul be subject unto the higher powers. For there is no power but of Elohim (God): the powers that be are ordained of Elohim (God)* (Romans 13:1). Paul does not announce a new theory of the state; he stands on what the Tanakh already declared. Wisdom cried it from the gates: *by me kings reign, and princes decree justice* (Proverbs 8:15) — the power any ruler holds is power lent from above. Daniel blessed the One who *changeth the times and the seasons: he removeth kings, and setteth up kings* (Daniel 2:21) — the throne is set up by the Most High, and the same hand can take it down. But ordination is not a blank cheque: the ruler *is the minister of Elohim (God) to thee for good … he beareth not the sword in vain: for he is the minister of Elohim (God), a revenger to execute wrath upon him that doeth evil* (Romans 13:4), and the wisdom-writer holds the other half — *power is given you of Yahuah (God), and sovereignty from the Highest, who shall try your works, and search out your counsels* (Wisdom of Solomon 6:3). The sword is a delegated ministry, and the one who bears it answers to the One who armed him. So the believer renders what is owed: *render therefore to all their dues: tribute to whom tribute is due … fear to whom fear; honour to whom honour* (Romans 13:7) — the Master''s own word, *render therefore unto Cæsar the things which are Cæsar''s; and unto Elohim (God) the things that are Elohim''s (God''s)* (Matthew 22:21). Give the ruler his due; give Elohim what is his — for the throne itself is on loan from him.',
       sv.verse_id, ev.verse_id, 'extras', 6300
  FROM _s219_r13_lookup sv, _s219_r13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=13 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=13 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-13-he-that-loveth-another-hath-fulfilled-the-law',
       E'He that loveth another hath fulfilled the law',
       E'*Owe no man any thing, but to love one another: for he that loveth another hath fulfilled the law* (Romans 13:8), and *love worketh no ill to his neighbour: therefore love is the fulfilling of the law* (Romans 13:10). The word is *fulfilled* — filled full, kept, done — never abolished. Paul is not setting love against the law; he is naming love as the law''s own doing, and he proves it by quoting the law itself. The commandment he calls the fulfilling is Moses'' word: *thou shalt love thy neighbour as thyself: I am Yahuah (LORD)* (Leviticus 19:18), spoken from Sinai and sealed with the divine name. And Paul says the very same thing in another letter: *for all the law is fulfilled in one word, even in this; Thou shalt love thy neighbour as thyself* (Galatians 5:14). The whole law fulfilled *in one word* does not mean the law emptied; it means the law filled — summed up and carried out. The man who loves his neighbour does him no ill: he does not kill him, steal from him, lie against him, or covet what is his. Love is not the cancellation of the commandments. Love is the keeping of them.',
       sv.verse_id, ev.verse_id, 'free', 6303
  FROM _s219_r13_lookup sv, _s219_r13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=13 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=13 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-13-the-commandments-briefly-comprehended-thou-shalt-love-thy-neighbour',
       E'The commandments briefly comprehended — Thou shalt love thy neighbour',
       E'Here is the proof that *fulfilled* never meant *abolished*: when Paul reaches for what love does, he recites the Ten Commandments word for word. *For this, Thou shalt not commit adultery, Thou shalt not kill, Thou shalt not steal, Thou shalt not bear false witness, Thou shalt not covet; and if there be any other commandment, it is briefly comprehended in this saying, namely, Thou shalt love thy neighbour as thyself* (Romans 13:9). Every clause is lifted straight from the tablets — *Thou shalt not kill* (Exodus 20:13), *Thou shalt not commit adultery* (Exodus 20:14), *Thou shalt not steal* (Exodus 20:15), *Thou shalt not covet thy neighbour''s house … nor any thing that is thy neighbour''s* (Exodus 20:17) — the same words Moses gave a second time, *neither shalt thou desire thy neighbour''s wife, neither shalt thou covet thy neighbour''s house … or any thing that is thy neighbour''s* (Deuteronomy 5:21). The apostle the systems say abolished the law here rehearses it from memory as the standing, binding word. To *briefly comprehend* the commandments in love is to gather them up, to hold them together — not to throw them out. And this is exactly what the Master taught: *the second is like unto it, Thou shalt love thy neighbour as thyself* (Matthew 22:39), *on these two commandments hang all the law and the prophets* (Matthew 22:40). To hang the law on love is to show what holds it up, not to take it down. Love does no ill to a neighbour, and so love keeps every commandment that guards him.',
       sv.verse_id, ev.verse_id, 'free', 6306
  FROM _s219_r13_lookup sv, _s219_r13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=13 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=13 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-13-the-night-far-spent-awake-and-put-on-the-armour-of-light',
       E'The night far spent — awake, and put on the armour of light',
       E'*And that, knowing the time, that now it is high time to awake out of sleep: for now is our salvation nearer than when we believed. The night is far spent, the day is at hand: let us therefore cast off the works of darkness, and let us put on the armour of light* (Romans 13:11-12). The prophet had already taken this posture in the dark: *with my soul have I desired thee in the night; yea, with my spirit within me will I seek thee early: for when thy judgments are in the earth, the inhabitants of the world will learn righteousness* (Isaiah 26:9) — the watcher who seeks early while it is yet night, because the morning is coming. And Isaiah named the dawn: *arise, shine; for thy light is come, and the glory of Yahuah (LORD) is risen upon thee* (Isaiah 60:1) — the very arming-in-light Paul calls for. Paul presses the same charge on the Thessalonians: *ye are all the children of light, and the children of the day: we are not of the night, nor of darkness* (1 Thessalonians 5:5); *therefore let us not sleep, as do others; but let us watch and be sober* (1 Thessalonians 5:6); *let us, who are of the day, be sober, putting on the breastplate of faith and love; and for an helmet, the hope of salvation* (1 Thessalonians 5:8). So the day-walker casts off the works of the night — *not in rioting and drunkenness, not in chambering and wantonness, not in strife and envying* (Romans 13:13) — and is clothed instead in the light: awake, sober, watching, because the day of Yahuah is at hand.',
       sv.verse_id, ev.verse_id, 'free', 6309
  FROM _s219_r13_lookup sv, _s219_r13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=13 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=13 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: romans-13-the-higher-powers-ordained-of-elohim-and-judged-by-him
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 8:15 — *by me kings reign, and princes decree justice* wisdom''s word: the power a ruler holds is lent from above, the throne ordained not autonomous (Romans 13:1).'
  FROM cross_reference_threads t, cross_references x, _s219_r13_lookup sv, _s219_r13_lookup tv
 WHERE t.slug='romans-13-the-higher-powers-ordained-of-elohim-and-judged-by-him'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=8 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 2:21 — *he removeth kings, and setteth up kings* the Most High sets up the throne and can take it down; the ordaining and un-ordaining are both his (Romans 13:1).'
  FROM cross_reference_threads t, cross_references x, _s219_r13_lookup sv, _s219_r13_lookup tv
 WHERE t.slug='romans-13-the-higher-powers-ordained-of-elohim-and-judged-by-him'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=2 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Wisdom of Solomon 6:3 — *power is given you of Yahuah (God) … who shall try your works* the sword is delegated; the ruler answers to the One who armed him (Romans 13:4).'
  FROM cross_reference_threads t, cross_references x, _s219_r13_lookup sv, _s219_r13_lookup tv
 WHERE t.slug='romans-13-the-higher-powers-ordained-of-elohim-and-judged-by-him'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=13 AND sv.verse_number=4
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=6 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 22:21 — *render therefore unto Cæsar the things which are Cæsar''s; and unto Elohim (God) the things that are Elohim''s (God''s)* the Master''s own *render*; the ruler''s due never crowds out Elohim''s (Romans 13:7).'
  FROM cross_reference_threads t, cross_references x, _s219_r13_lookup sv, _s219_r13_lookup tv
 WHERE t.slug='romans-13-the-higher-powers-ordained-of-elohim-and-judged-by-him'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=13 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=22 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-13-he-that-loveth-another-hath-fulfilled-the-law
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 19:18 — *thou shalt love thy neighbour as thyself: I am Yahuah (LORD)* the commandment Paul calls the fulfilling of the law is Moses'' own word, sealed with the divine name (Romans 13:8).'
  FROM cross_reference_threads t, cross_references x, _s219_r13_lookup sv, _s219_r13_lookup tv
 WHERE t.slug='romans-13-he-that-loveth-another-hath-fulfilled-the-law'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=13 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Galatians 5:14 — *all the law is fulfilled in one word … Thou shalt love thy neighbour as thyself* Paul says it twice: the law filled full in love, not emptied (Romans 13:8).'
  FROM cross_reference_threads t, cross_references x, _s219_r13_lookup sv, _s219_r13_lookup tv
 WHERE t.slug='romans-13-he-that-loveth-another-hath-fulfilled-the-law'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=13 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=5 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-13-the-commandments-briefly-comprehended-thou-shalt-love-thy-neighbour
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 20:13 — *Thou shalt not kill* the sixth word from Sinai, cited by Paul word for word as the content of love (Romans 13:9).'
  FROM cross_reference_threads t, cross_references x, _s219_r13_lookup sv, _s219_r13_lookup tv
 WHERE t.slug='romans-13-the-commandments-briefly-comprehended-thou-shalt-love-thy-neighbour'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=13 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 20:14 — *Thou shalt not commit adultery* the Decalogue itself; Paul recites it as the standing, binding word that love keeps (Romans 13:9).'
  FROM cross_reference_threads t, cross_references x, _s219_r13_lookup sv, _s219_r13_lookup tv
 WHERE t.slug='romans-13-the-commandments-briefly-comprehended-thou-shalt-love-thy-neighbour'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=13 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 20:15 — *Thou shalt not steal* lifted straight from the Ten; the commandments are comprehended in love, not set aside (Romans 13:9).'
  FROM cross_reference_threads t, cross_references x, _s219_r13_lookup sv, _s219_r13_lookup tv
 WHERE t.slug='romans-13-the-commandments-briefly-comprehended-thou-shalt-love-thy-neighbour'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=13 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Exodus 20:17 — *Thou shalt not covet thy neighbour''s house … nor any thing that is thy neighbour''s* the tenth word, reaching to the heart; love works no ill and so keeps it (Romans 13:9).'
  FROM cross_reference_threads t, cross_references x, _s219_r13_lookup sv, _s219_r13_lookup tv
 WHERE t.slug='romans-13-the-commandments-briefly-comprehended-thou-shalt-love-thy-neighbour'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=13 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Deuteronomy 5:21 — *neither shalt thou desire thy neighbour''s wife … or any thing that is thy neighbour''s* the same Decalogue in Moses'' second giving; Paul rehearses the abiding instruction (Romans 13:9).'
  FROM cross_reference_threads t, cross_references x, _s219_r13_lookup sv, _s219_r13_lookup tv
 WHERE t.slug='romans-13-the-commandments-briefly-comprehended-thou-shalt-love-thy-neighbour'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=13 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=5 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Matthew 22:39 — *the second is like unto it, Thou shalt love thy neighbour as thyself* the Master''s own teaching: *on these two commandments hang all the law and the prophets* — what holds the law up, not what takes it down (Romans 13:9).'
  FROM cross_reference_threads t, cross_references x, _s219_r13_lookup sv, _s219_r13_lookup tv
 WHERE t.slug='romans-13-the-commandments-briefly-comprehended-thou-shalt-love-thy-neighbour'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=13 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=22 AND tv.verse_number=39
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-13-the-night-far-spent-awake-and-put-on-the-armour-of-light
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 26:9 — *with my soul have I desired thee in the night … will I seek thee early* the watcher''s posture: seeking early while it is yet night because the morning comes (Romans 13:11).'
  FROM cross_reference_threads t, cross_references x, _s219_r13_lookup sv, _s219_r13_lookup tv
 WHERE t.slug='romans-13-the-night-far-spent-awake-and-put-on-the-armour-of-light'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=13 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=26 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 60:1 — *arise, shine; for thy light is come, and the glory of Yahuah (LORD) is risen upon thee* the dawn Paul names: the night gives way, put on the armour of light (Romans 13:12).'
  FROM cross_reference_threads t, cross_references x, _s219_r13_lookup sv, _s219_r13_lookup tv
 WHERE t.slug='romans-13-the-night-far-spent-awake-and-put-on-the-armour-of-light'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=13 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=60 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Thessalonians 5:5 — *ye are all the children of light, and the children of the day: we are not of the night* the day-people clothed in light cast off the works of darkness (Romans 13:12).'
  FROM cross_reference_threads t, cross_references x, _s219_r13_lookup sv, _s219_r13_lookup tv
 WHERE t.slug='romans-13-the-night-far-spent-awake-and-put-on-the-armour-of-light'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=13 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='1-thessalonians' AND tv.chapter_number=5 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Thessalonians 5:6 — *let us not sleep, as do others; but let us watch and be sober* the same charge: awake out of sleep, take up the watch, ready (Romans 13:11).'
  FROM cross_reference_threads t, cross_references x, _s219_r13_lookup sv, _s219_r13_lookup tv
 WHERE t.slug='romans-13-the-night-far-spent-awake-and-put-on-the-armour-of-light'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=13 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='1-thessalonians' AND tv.chapter_number=5 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Thessalonians 5:8 — *putting on the breastplate of faith and love; and for an helmet, the hope of salvation* the armour of light is the sober day-walk against the works of the night (Romans 13:13).'
  FROM cross_reference_threads t, cross_references x, _s219_r13_lookup sv, _s219_r13_lookup tv
 WHERE t.slug='romans-13-the-night-far-spent-awake-and-put-on-the-armour-of-light'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=13 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='1-thessalonians' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
