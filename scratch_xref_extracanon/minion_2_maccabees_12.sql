-- ----- fragment: minion_2maccabees_12.sql (session253 2-maccabees 12) -----
-- Source anchor: apocrypha/2-maccabees ch12. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2mac12 (view _session253_2mac12_lookup). Sort band base 62275, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2mac12_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-maccabees-12-mindful-of-the-resurrection
  ('apocrypha', '2-maccabees', 12, 43, 'canon', 'hebrews', 11, 35, 'free', E'Hebrews 11:35 — *Women received their dead raised to life again: and others were tortured, not accepting deliverance; that they might obtain a better resurrection:* the Maccabean martyrs are precisely the *others* in view, so when Judas is *mindful of the resurrection* he holds the same better hope Hebrews honours.'),
  ('apocrypha', '2-maccabees', 12, 44, 'canon', 'daniel', 12, 2, 'free', E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* Judas hopes *they that were slain should have risen again* on the strength of this promised awaking of the dead.'),
  ('apocrypha', '2-maccabees', 12, 44, 'canon', '1-corinthians', 15, 29, 'free', E'1 Corinthians 15:29 — *Else what shall they do which are baptized for the dead, if the dead rise not at all? why are they then baptized for the dead?* Paul argues exactly as Judas does — an act on behalf of the dead is *superfluous and vain* unless the dead rise.'),
  ('apocrypha', '2-maccabees', 12, 45, 'canon', 'revelation', 20, 12, 'free', E'Revelation 20:12 — *And I saw the dead, small and great, stand before Elohim; and the books were opened: and another book was opened, which is the book of life: and the dead were judged out of those things which were written in the books, according to their works.* The *great favour laid up for those that died godly* is the standing-up John witnesses at the throne.'),
  ('apocrypha', '2-maccabees', 12, 43, 'apocrypha', '2-maccabees', 7, 9, 'extras', E'2 Maccabees 7:9 — *And when he was at the last gasp, he said, You like a fury takest us out of this present life, but the King of the world shall raise us up, who have died for his laws, to everlasting life.* The resurrection Judas is *mindful of* is the same one the seven brothers confessed under torture — those who *died godly* die for the laws.'),
  -- thread: 2-maccabees-12-accursed-thing-under-the-coats
  ('apocrypha', '2-maccabees', 12, 40, 'canon', 'joshua', 7, 11, 'free', E'Joshua 7:11 — *Yashar''el hath sinned, and they have also transgressed my covenant which I commanded them: for they have even taken of the accursed thing, and have also stolen, and dissembled also, and they have put it even among their own stuff.* The idol-tokens hidden *under the coats* are Achan''s accursed thing hidden among the stuff — the same covenant breach by the same concealment.'),
  ('apocrypha', '2-maccabees', 12, 40, 'canon', 'joshua', 7, 12, 'free', E'Joshua 7:12 — *Therefore the children of Yashar''el could not stand before their enemies, but turned their backs before their enemies, because they were accursed: neither will I be with you any more, except ye destroy the accursed from among you.* This is why the slain fell — like Achan''s Israel, they *could not stand* while the accursed thing was carried among them.'),
  ('apocrypha', '2-maccabees', 12, 40, 'canon', 'deuteronomy', 7, 25, 'free', E'Deuteronomy 7:25 — *The graven images of their gods shall ye burn with fire: thou shalt not desire the silver or gold that is on them, nor take it unto thee, lest thou be snared therein: for it is an abomination to Yahuah Elohayka.* The *things consecrated to the idols* are exactly the snare the law forbade — taking the idol''s silver was the abomination that slew them.'),
  ('apocrypha', '2-maccabees', 12, 42, 'canon', 'leviticus', 27, 28, 'free', E'Leviticus 27:28 — *Notwithstanding no devoted thing, that a man shall devote unto Yahuah of all that he hath, both of man and beast, and of the field of his possession, shall be sold or redeemed: every devoted thing is most holy unto Yahuah.* The devoted spoil belonged to Yahuah, not the soldier''s coat — Judas''s call to purge the sin restores the holy thing to its place.'),
  -- thread: 2-maccabees-12-sin-offering-for-reconciliation
  ('apocrypha', '2-maccabees', 12, 43, 'canon', 'leviticus', 4, 26, 'free', E'Leviticus 4:26 — *And he shall burn all his fat upon the altar, as the fat of the sacrifice of peace offerings: and the priest shall make an atonement for him as concerning his sin, and it shall be forgiven him.* Judas''s *sin offering* at Jerusalem follows the very ordinance Torah gave for atonement — the means of being *delivered from sin*.'),
  ('apocrypha', '2-maccabees', 12, 45, 'canon', '1-corinthians', 15, 20, 'free', E'1 Corinthians 15:20 — *But now is Messiah risen from the dead, and become the firstfruits of them that slept.* The *reconciliation for the dead* rests on a resurrection that has a firstfruits — the godly slain follow where the firstfruits has gone.'),
  -- thread: 2-maccabees-12-jericho-who-seeth-all-things
  ('apocrypha', '2-maccabees', 12, 15, 'canon', 'joshua', 6, 20, 'free', E'Joshua 6:20 — *So the people shouted when the priests blew with the trumpets: and it came to pass, when the people heard the sound of the trumpet, and the people shouted with a great shout, that the wall fell down flat, so that the people went up into the city, every man straight before him, and they took the city.* Judas pleads this very fall — the One who cast down Jericho *without rams or engines* casts down Caspis''s walls too.'),
  ('apocrypha', '2-maccabees', 12, 22, 'canon', 'exodus', 14, 13, 'free', E'Exodus 14:13 — *And Moses said unto the people, Fear ye not, stand still, and see the salvation of Yahuah, which he will shew to you to day: for the Egyptians whom ye have seen to day, ye shall see them again no more for ever.* The enemy *struck with fear and terror through the appearing of him who seeth all things* is routed by the same warrior-God who fought at the sea.'),
  -- thread: 2-maccabees-12-feast-of-weeks-kept
  ('apocrypha', '2-maccabees', 12, 31, 'canon', 'leviticus', 23, 21, 'free', E'Leviticus 23:21 — *And ye shall proclaim on the selfsame day, that it may be an holy convocation unto you: ye shall do no servile work therein: it shall be a statute for ever in all your dwellings throughout your generations.* The *feast of the weeks* the warriors come to Jerusalem to keep is this *statute for ever* — the appointed time honoured even in war.'),
  ('apocrypha', '2-maccabees', 12, 32, 'canon', 'acts', 2, 1, 'free', E'Acts 2:1 — *And when the day of Pentecost was fully come, they were all with one accord in one place.* The same *feast, called Pentecost* the Maccabees keep is the day the gathered people stand together with one accord — one feast across the covenant.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2mac12_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2mac12_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-12-mindful-of-the-resurrection',
       E'Mindful of the resurrection — the hope laid up for those that died godly',
       E'Judas gathers an offering for the slain and sends it to Jerusalem, *And when he had made a gathering throughout the company to the sum of two thousand drachms of silver, he sent it to Jerusalem to offer a sin offering, doing in it very well and honestly, in that he was mindful of the resurrection* (2 Maccabees 12:43) — and the text says plainly why: *For if he had not hoped that they that were slain should have risen again, it had been superfluous and vain to pray for the dead* (2 Maccabees 12:44). The deed is honest only because the resurrection is real; *he perceived that there was great favour laid up for those that died godly* (2 Maccabees 12:45). This is the same hope the seven brothers held under Antiochus — *the King of the world shall raise us up, who have died for his laws, to everlasting life* (2 Maccabees 7:9) — and it is the very hope Hebrews names when it points back to *others* who *were tortured, not accepting deliverance; that they might obtain a better resurrection* (Hebrews 11:35). The prophets carried it before them: *And many of them that sleep in the dust of the earth shall awake, some to everlasting life* (Daniel 12:2). Paul reasons exactly as Judas does — that to act for the dead is empty unless the dead rise (1 Corinthians 15:29) — and John sees the day arrive: *And I saw the dead, small and great, stand before Elohim* (Revelation 20:12). It ain''t new: the covenant people died godly because they knew the dust would give them back.',
       sv.verse_id, ev.verse_id, 'extras', 62275
  FROM _session253_2mac12_lookup sv, _session253_2mac12_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=12 AND sv.verse_number=43
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=12 AND ev.verse_number=45
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-12-accursed-thing-under-the-coats',
       E'The accursed thing under their coats — why they were slain',
       E'When the bodies are gathered, the cause of their fall is uncovered: *Now under the coats of every one that was slain they found things consecrated to the idols of the Jamnites, which is forbidden the Yahudim by the law. Then every man saw that this was the cause wherefore they were slain* (2 Maccabees 12:40). This is Achan retold — *Yashar''el hath sinned, and they have also transgressed my covenant which I commanded them: for they have even taken of the accursed thing* (Joshua 7:11) — and as with Achan, the host *could not stand before their enemies* (Joshua 7:12) until the devoted thing was purged. The Torah had warned exactly this concerning the silver and gold of idols: *thou shalt not desire the silver or gold that is on them, nor take it unto thee, lest thou be snared therein: for it is an abomination to Yahuah Elohayka* (Deuteronomy 7:25); the spoil of the herem is *most holy unto Yahuah* and not for private keeping (Leviticus 27:28). So Judas leads the people to *besought him that the sin committed might wholly be put out of remembrance* (2 Maccabees 12:42) — Torah-faithfulness, not law-as-curse: the covenant stands, and the people keep it.',
       sv.verse_id, ev.verse_id, 'extras', 62278
  FROM _session253_2mac12_lookup sv, _session253_2mac12_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=12 AND sv.verse_number=40
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=12 AND ev.verse_number=42
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-12-sin-offering-for-reconciliation',
       E'A sin offering sent to Jerusalem — reconciliation for the dead',
       E'Judas *sent it to Jerusalem to offer a sin offering* (2 Maccabees 12:43), and *Whereupon he made a reconciliation for the dead, that they might be delivered from sin* (2 Maccabees 12:45). The pattern is the altar Torah appointed: *the priest shall make an atonement for him as concerning his sin, and it shall be forgiven him* (Leviticus 4:26) — sin is covered by an offering brought to the sanctuary, not invented but commanded. Read honestly, the deliverance from sin is grounded in the resurrection-hope, for the slain are reckoned among those who will rise — and Messiah is the firstfruits of that rising: *But now is Messiah risen from the dead, and become the firstfruits of them that slept* (1 Corinthians 15:20). The sin offering at Jerusalem looks toward the day the dead in the dust are gathered and the godly find favour; the reconciliation is real because the resurrection is sure.',
       sv.verse_id, ev.verse_id, 'extras', 62281
  FROM _session253_2mac12_lookup sv, _session253_2mac12_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=12 AND sv.verse_number=43
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=12 AND ev.verse_number=45
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-12-jericho-who-seeth-all-things',
       E'Who cast down Jericho — the warrior who seeth all things',
       E'Before the walls of Caspis, Judas calls *upon the great Yahuah of the world, who without rams or engines of war did cast down Jericho in the time of Joshua* (2 Maccabees 12:15) — pleading the founding deliverance: *the wall fell down flat... and they took the city* (Joshua 6:20), where no siege-engine but the trumpet and the LORD brought the walls down. So too here *they found him not... having left a very strong garrison* is undone, and the enemy flees *through the appearing of him who seeth all things* (2 Maccabees 12:22) — the same Captain who told Israel at the sea, *Fear ye not, stand still, and see the salvation of Yahuah, which he will shew to you to day* (Exodus 14:13). Antiochus''s officers are the kingdom of man with all its *engines and darts*; the victory is not in the engines but in the One who sees and fights for His people.',
       sv.verse_id, ev.verse_id, 'extras', 62284
  FROM _session253_2mac12_lookup sv, _session253_2mac12_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=12 AND sv.verse_number=15
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=12 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-12-feast-of-weeks-kept',
       E'The feast of weeks approaching — the appointed time kept in war',
       E'Even in the press of campaign the fighters keep the moed: *so they came to Jerusalem, the feast of the weeks approaching* (2 Maccabees 12:31), *And after the feast, called Pentecost, they went forth against Gorgias* (2 Maccabees 12:32). The covenant calendar governs the warriors — the Torah-appointed day stands: *And ye shall proclaim on the selfsame day, that it may be an holy convocation unto you: ye shall do no servile work therein: it shall be a statute for ever* (Leviticus 23:21). It is the feast the faithful kept — and the very day on which, generations on, the people would again be gathered with one accord: *And when the day of Pentecost was fully come, they were all with one accord in one place* (Acts 2:1). The Maccabees keep the feast first, then fight; the appointed times are not abolished but honoured.',
       sv.verse_id, ev.verse_id, 'extras', 62287
  FROM _session253_2mac12_lookup sv, _session253_2mac12_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=12 AND sv.verse_number=31
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=12 AND ev.verse_number=32
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-maccabees-12-mindful-of-the-resurrection
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 11:35 — *Women received their dead raised to life again: and others were tortured, not accepting deliverance; that they might obtain a better resurrection:* the Maccabean martyrs are precisely the *others* in view, so when Judas is *mindful of the resurrection* he holds the same better hope Hebrews honours.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac12_lookup sv, _session253_2mac12_lookup tv
 WHERE t.slug='2-maccabees-12-mindful-of-the-resurrection'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=12 AND sv.verse_number=43
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* Judas hopes *they that were slain should have risen again* on the strength of this promised awaking of the dead.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac12_lookup sv, _session253_2mac12_lookup tv
 WHERE t.slug='2-maccabees-12-mindful-of-the-resurrection'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=12 AND sv.verse_number=44
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Corinthians 15:29 — *Else what shall they do which are baptized for the dead, if the dead rise not at all? why are they then baptized for the dead?* Paul argues exactly as Judas does — an act on behalf of the dead is *superfluous and vain* unless the dead rise.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac12_lookup sv, _session253_2mac12_lookup tv
 WHERE t.slug='2-maccabees-12-mindful-of-the-resurrection'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=12 AND sv.verse_number=44
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 20:12 — *And I saw the dead, small and great, stand before Elohim; and the books were opened: and another book was opened, which is the book of life: and the dead were judged out of those things which were written in the books, according to their works.* The *great favour laid up for those that died godly* is the standing-up John witnesses at the throne.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac12_lookup sv, _session253_2mac12_lookup tv
 WHERE t.slug='2-maccabees-12-mindful-of-the-resurrection'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=12 AND sv.verse_number=45
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'2 Maccabees 7:9 — *And when he was at the last gasp, he said, You like a fury takest us out of this present life, but the King of the world shall raise us up, who have died for his laws, to everlasting life.* The resurrection Judas is *mindful of* is the same one the seven brothers confessed under torture — those who *died godly* die for the laws.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac12_lookup sv, _session253_2mac12_lookup tv
 WHERE t.slug='2-maccabees-12-mindful-of-the-resurrection'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=12 AND sv.verse_number=43
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-12-accursed-thing-under-the-coats
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 7:11 — *Yashar''el hath sinned, and they have also transgressed my covenant which I commanded them: for they have even taken of the accursed thing, and have also stolen, and dissembled also, and they have put it even among their own stuff.* The idol-tokens hidden *under the coats* are Achan''s accursed thing hidden among the stuff — the same covenant breach by the same concealment.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac12_lookup sv, _session253_2mac12_lookup tv
 WHERE t.slug='2-maccabees-12-accursed-thing-under-the-coats'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=12 AND sv.verse_number=40
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=7 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joshua 7:12 — *Therefore the children of Yashar''el could not stand before their enemies, but turned their backs before their enemies, because they were accursed: neither will I be with you any more, except ye destroy the accursed from among you.* This is why the slain fell — like Achan''s Israel, they *could not stand* while the accursed thing was carried among them.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac12_lookup sv, _session253_2mac12_lookup tv
 WHERE t.slug='2-maccabees-12-accursed-thing-under-the-coats'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=12 AND sv.verse_number=40
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=7 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 7:25 — *The graven images of their gods shall ye burn with fire: thou shalt not desire the silver or gold that is on them, nor take it unto thee, lest thou be snared therein: for it is an abomination to Yahuah Elohayka.* The *things consecrated to the idols* are exactly the snare the law forbade — taking the idol''s silver was the abomination that slew them.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac12_lookup sv, _session253_2mac12_lookup tv
 WHERE t.slug='2-maccabees-12-accursed-thing-under-the-coats'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=12 AND sv.verse_number=40
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Leviticus 27:28 — *Notwithstanding no devoted thing, that a man shall devote unto Yahuah of all that he hath, both of man and beast, and of the field of his possession, shall be sold or redeemed: every devoted thing is most holy unto Yahuah.* The devoted spoil belonged to Yahuah, not the soldier''s coat — Judas''s call to purge the sin restores the holy thing to its place.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac12_lookup sv, _session253_2mac12_lookup tv
 WHERE t.slug='2-maccabees-12-accursed-thing-under-the-coats'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=12 AND sv.verse_number=42
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=27 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-12-sin-offering-for-reconciliation
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 4:26 — *And he shall burn all his fat upon the altar, as the fat of the sacrifice of peace offerings: and the priest shall make an atonement for him as concerning his sin, and it shall be forgiven him.* Judas''s *sin offering* at Jerusalem follows the very ordinance Torah gave for atonement — the means of being *delivered from sin*.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac12_lookup sv, _session253_2mac12_lookup tv
 WHERE t.slug='2-maccabees-12-sin-offering-for-reconciliation'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=12 AND sv.verse_number=43
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=4 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Corinthians 15:20 — *But now is Messiah risen from the dead, and become the firstfruits of them that slept.* The *reconciliation for the dead* rests on a resurrection that has a firstfruits — the godly slain follow where the firstfruits has gone.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac12_lookup sv, _session253_2mac12_lookup tv
 WHERE t.slug='2-maccabees-12-sin-offering-for-reconciliation'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=12 AND sv.verse_number=45
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-12-jericho-who-seeth-all-things
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 6:20 — *So the people shouted when the priests blew with the trumpets: and it came to pass, when the people heard the sound of the trumpet, and the people shouted with a great shout, that the wall fell down flat, so that the people went up into the city, every man straight before him, and they took the city.* Judas pleads this very fall — the One who cast down Jericho *without rams or engines* casts down Caspis''s walls too.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac12_lookup sv, _session253_2mac12_lookup tv
 WHERE t.slug='2-maccabees-12-jericho-who-seeth-all-things'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=12 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=6 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 14:13 — *And Moses said unto the people, Fear ye not, stand still, and see the salvation of Yahuah, which he will shew to you to day: for the Egyptians whom ye have seen to day, ye shall see them again no more for ever.* The enemy *struck with fear and terror through the appearing of him who seeth all things* is routed by the same warrior-God who fought at the sea.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac12_lookup sv, _session253_2mac12_lookup tv
 WHERE t.slug='2-maccabees-12-jericho-who-seeth-all-things'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=12 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=14 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-12-feast-of-weeks-kept
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 23:21 — *And ye shall proclaim on the selfsame day, that it may be an holy convocation unto you: ye shall do no servile work therein: it shall be a statute for ever in all your dwellings throughout your generations.* The *feast of the weeks* the warriors come to Jerusalem to keep is this *statute for ever* — the appointed time honoured even in war.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac12_lookup sv, _session253_2mac12_lookup tv
 WHERE t.slug='2-maccabees-12-feast-of-weeks-kept'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=12 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Acts 2:1 — *And when the day of Pentecost was fully come, they were all with one accord in one place.* The same *feast, called Pentecost* the Maccabees keep is the day the gathered people stand together with one accord — one feast across the covenant.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac12_lookup sv, _session253_2mac12_lookup tv
 WHERE t.slug='2-maccabees-12-feast-of-weeks-kept'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=12 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=2 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

