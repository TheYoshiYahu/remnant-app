-- ----- fragment: minion_1maccabees_09.sql (session253 1-maccabees 9) -----
-- Source anchor: apocrypha/1-maccabees ch9. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1mac9 (view _session253_1mac9_lookup). Sort band base 61700, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1mac9_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-maccabees-9-how-is-the-valiant-fallen
  ('apocrypha', '1-maccabees', 9, 21, 'canon', '2-samuel', 1, 19, 'free', E'2 Samuel 1:19 — *The beauty of Yashar''el (Israel) is slain upon thy high places: how are the mighty fallen!* David''s opening lament over Saul and Jonathan supplies the very cry Israel raises over Judas, the valiant man fallen that delivered Israel.'),
  ('apocrypha', '1-maccabees', 9, 21, 'canon', '2-samuel', 1, 25, 'free', E'2 Samuel 1:25 — *How are the mighty fallen in the midst of the battle! O Jonathan, thou wast slain in thine high places.* The mighty falling in the midst of the battle is exactly Judas''s end at Eleasa, the same dirge for a fallen captain of Israel.'),
  ('apocrypha', '1-maccabees', 9, 21, 'canon', '2-samuel', 1, 27, 'free', E'2 Samuel 1:27 — *How are the mighty fallen, and the weapons of war perished!* The closing refrain of David''s song echoes in Israel''s lament for Judas, whose noble acts were too many to be written.'),
  ('apocrypha', '1-maccabees', 9, 20, 'canon', '2-samuel', 3, 38, 'free', E'2 Samuel 3:38 — *And the king said unto his servants, Know ye not that there is a prince and a great man fallen this day in Yashar''el (Israel)?* As David named the loss of a great man in Israel, so Jonathan and Simon bury their brother and Israel mourns a prince fallen.'),
  -- thread: 1-maccabees-9-die-manfully-for-our-brothers
  ('apocrypha', '1-maccabees', 9, 10, 'canon', 'john', 15, 13, 'free', E'John 15:13 — *Greater love hath no man than this, that a man lay down his life for his friends.* Judas''s resolve to die manfully for his brothers rather than flee is this very love made flesh in the field.'),
  ('apocrypha', '1-maccabees', 9, 10, 'canon', 'hebrews', 11, 34, 'free', E'Hebrews 11:34 — *Quenched the violence of fire, escaped the edge of the sword, out of weakness were made strong, waxed valiant in fight, turned to flight the armies of the aliens.* The faith chapter enrolls the Maccabean valiant who, like Judas at Eleasa, were made strong out of weakness.'),
  ('apocrypha', '1-maccabees', 9, 10, 'apocrypha', '1-maccabees', 3, 18, 'extras', E'1 Maccabees 3:18 — *To whom Judas answered, It is no hard matter for many to be shut up in the hands of a few; and with Yahuah (God) of heaven it is all one, to deliver with a great multitude, or a small company:* The same Judas who once heartened the few now will not flee, choosing to die manfully with his brothers.'),
  -- thread: 1-maccabees-9-save-by-many-or-by-few
  ('apocrypha', '1-maccabees', 9, 6, 'canon', '1-samuel', 14, 6, 'free', E'1 Samuel 14:6 — *And Jonathan said to the young man that bare his armour, Come, and let us go over unto the garrison of these uncircumcised: it may be that Yahuah (LORD) will work for us: for there is no restraint to Yahuah (LORD) to save by many or by few.* The eight hundred who stayed with Judas embody Jonathan''s faith that the LORD saves by many or by few.'),
  ('apocrypha', '1-maccabees', 9, 9, 'apocrypha', '1-maccabees', 3, 19, 'extras', E'1 Maccabees 3:19 — *For the victory of battle stands not in the multitude of an host; but strength comes from heaven.* Against the counsel to flee because they were but few, Judas''s own creed answers that the victory is not in numbers but from heaven.'),
  ('apocrypha', '1-maccabees', 9, 6, 'canon', 'zechariah', 4, 6, 'free', E'Zechariah 4:6 — *Then he answered and spake unto me, saying, This is the word of Yahuah (LORD) unto Zerubbabel, saying, Not by might, nor by power, but by my spirit, saith Yahuah Tseva''ot (LORD of hosts).* The prophet''s word grounds the courage of the few: deliverance is by the Spirit, not by the size of the host.'),
  -- thread: 1-maccabees-9-cry-ye-now-to-heaven
  ('apocrypha', '1-maccabees', 9, 46, 'canon', 'psalms', 79, 9, 'free', E'Psalm 79:9 — *Help us, O Elohim (God) of our salvation, for the glory of thy name: and deliver us, and purge away our sins, for thy name''s sake.* The psalm of the defiled temple is exactly the cry Jonathan commands his trapped company to raise to heaven for deliverance.'),
  ('apocrypha', '1-maccabees', 9, 46, 'apocrypha', '1-maccabees', 3, 19, 'extras', E'1 Maccabees 3:19 — *For the victory of battle stands not in the multitude of an host; but strength comes from heaven.* Jonathan''s order to cry to heaven rests on the family creed that the strength to be delivered comes down from heaven, not from their own number.'),
  -- thread: 1-maccabees-9-the-sword-ceased-the-seed-kept
  ('apocrypha', '1-maccabees', 9, 73, 'canon', 'numbers', 25, 11, 'free', E'Numbers 25:11 — *Phinehas, the son of Eleazar, the son of Aaron the priest, hath turned my wrath away from the children of Yashar''el (Israel), while he was zealous for my sake among them, that I consumed not the children of Yashar''el (Israel) in my jealousy.* Jonathan destroying the ungodly out of Israel carries forward Phinehas''s zeal that turns away wrath and keeps the people.'),
  ('apocrypha', '1-maccabees', 9, 73, 'canon', 'numbers', 25, 13, 'free', E'Numbers 25:13 — *And he shall have it, and his seed after him, even the covenant of an everlasting priesthood; because he was zealous for his Elohim (God), and made an atonement for the children of Yashar''el (Israel).* The Maccabean zeal that purges Israel is rewarded as Phinehas''s was, the covenant kept through the zealous seed.'),
  ('apocrypha', '1-maccabees', 9, 42, 'canon', 'psalms', 79, 10, 'free', E'Psalm 79:10 — *Wherefore should the heathen say, Where is their Elohim (God)? let him be known among the heathen in our sight by the revenging of the blood of thy servants which is shed.* When the brothers avenged fully the blood of John their brother, they enacted the psalm''s plea for the revenging of the blood of His servants.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1mac9_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1mac9_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-9-how-is-the-valiant-fallen',
       E'How is the valiant man fallen',
       E'Judas Maccabeus, who broke the abomination''s host and cleansed the sanctuary, falls in battle, and all Israel takes up the lament: *Judas also was killed, and the remnant fled* (1 Maccabees 9:18), *Moreover they bewailed him, and all Yashar''el (Israel) made great lamentation for him, and mourned many days, saying,* (1 Maccabees 9:20), *How is the valiant man fallen, that delivered Yashar''el (Israel)!* (1 Maccabees 9:21). It ain''t new — the dirge is David''s over the fallen of the LORD''s people: *The beauty of Yashar''el (Israel) is slain upon thy high places: how are the mighty fallen!* (2 Samuel 1:19), *How are the mighty fallen in the midst of the battle! O Jonathan, thou wast slain in thine high places.* (2 Samuel 1:25), and the refrain that closes the song, *How are the mighty fallen, and the weapons of war perished!* (2 Samuel 1:27). And as David honoured even Abner — *Know ye not that there is a prince and a great man fallen this day in Yashar''el (Israel)?* (2 Samuel 3:38) — so the covenant people honour the deliverer who spent himself for them. The mourning is not despair but covenant memory; the hope of such a man is the resurrection (2 Maccabees 7) to which all Israel''s fallen look.',
       sv.verse_id, ev.verse_id, 'extras', 61700
  FROM _session253_1mac9_lookup sv, _session253_1mac9_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=9 AND sv.verse_number=18
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=9 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-9-die-manfully-for-our-brothers',
       E'Let us die manfully for our brothers',
       E'Forsaken by all but eight hundred, Judas will not flee: *Then Judas said, Yahuah (God) forbid that I should do this thing, and flee away from them: if our time be come, let us die manfully for our brothers, and let us not stain our honour.* (1 Maccabees 9:10). This is the Torah-faithful courage that lays down life for the covenant brethren, the very love the Messiah names: *Greater love hath no man than this, that a man lay down his life for his friends.* (John 15:13). Judas had spoken the same faith before, when the host was small against a multitude — *To whom Judas answered, It is no hard matter for many to be shut up in the hands of a few; and with Yahuah (God) of heaven it is all one, to deliver with a great multitude, or a small company:* (1 Maccabees 3:18). And the faith roll of Hebrews gathers up these very Maccabean fighters who *out of weakness were made strong, waxed valiant in fight, turned to flight the armies of the aliens.* (Hebrews 11:34). It ain''t new: to die rather than abandon the brethren is covenant faithfulness, not law-as-curse.',
       sv.verse_id, ev.verse_id, 'extras', 61703
  FROM _session253_1mac9_lookup sv, _session253_1mac9_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=9 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=9 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-9-save-by-many-or-by-few',
       E'No restraint to save by many or by few',
       E'When the few saw the great army, they would have fled — *Who seeing the multitude of the other army to be so great were sore afraid; whereupon many conveyed themselves out of the host, insomuch as abode of them no more but eight hundred men.* (1 Maccabees 9:6) — yet Judas held to a faith that does not count heads. It is Jonathan''s faith at Michmash: *And Jonathan said to the young man that bare his armour, Come, and let us go over unto the garrison of these uncircumcised: it may be that Yahuah (LORD) will work for us: for there is no restraint to Yahuah (LORD) to save by many or by few.* (1 Samuel 14:6). Judas himself had confessed it — *For the victory of battle stands not in the multitude of an host; but strength comes from heaven.* (1 Maccabees 3:19) — and the prophets seal it: *Not by might, nor by power, but by my spirit, saith Yahuah Tseva''ot (LORD of hosts).* (Zechariah 4:6). It ain''t new: deliverance was never in numbers but in heaven.',
       sv.verse_id, ev.verse_id, 'extras', 61706
  FROM _session253_1mac9_lookup sv, _session253_1mac9_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=9 AND sv.verse_number=6
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=9 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-9-cry-ye-now-to-heaven',
       E'Cry ye now to heaven, that ye may be delivered',
       E'Hemmed by Jordan and the marsh, Jonathan turns the trapped remnant to prayer: *Wherefore cry you now to heaven, that you may be delivered from the hand of your enemies.* (1 Maccabees 9:46), and then *With that they joined battle, and Jonathan stretched forth his hand to smite Bacchides* (1 Maccabees 9:47). It ain''t new — this is the afflicted covenant people''s plea in the Psalms: *Help us, O Elohim (God) of our salvation, for the glory of thy name: and deliver us, and purge away our sins, for thy name''s sake.* (Psalm 79:9), a psalm written over the very temple Antiochus had defiled. And the cry rests on the same faith Judas confessed, that *strength comes from heaven* (1 Maccabees 3:19). The remnant is not delivered by its own arm but by crying to heaven and then standing in faith.',
       sv.verse_id, ev.verse_id, 'extras', 61709
  FROM _session253_1mac9_lookup sv, _session253_1mac9_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=9 AND sv.verse_number=44
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=9 AND ev.verse_number=47
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-9-the-sword-ceased-the-seed-kept',
       E'The sword ceased; the ungodly purged',
       E'The chapter closes with the covenant seed kept and the land at rest: *Thus the sword ceased from Yashar''el (Israel): but Jonathan dwelt at Machmas, and began to govern the people; and he destroyed the ungodly men out of Yashar''el (Israel).* (1 Maccabees 9:73). Jonathan''s zeal to purge the ungodly out of Israel is the zeal of Phinehas, who turned away wrath by standing for the LORD: *Phinehas, the son of Eleazar, the son of Aaron the priest, hath turned my wrath away from the children of Yashar''el (Israel), while he was zealous for my sake among them, that I consumed not the children of Yashar''el (Israel) in my jealousy.* (Numbers 25:11), and for it received *the covenant of an everlasting priesthood; because he was zealous for his Elohim (God), and made an atonement for the children of Yashar''el (Israel).* (Numbers 25:13). And the avenging of the brethren''s blood answers the psalm''s plea: *let him be known among the heathen in our sight by the revenging of the blood of thy servants which is shed.* (Psalm 79:10). It ain''t new: the covenant people are kept, the ungodly purged, the seed preserved — not a church replacing Israel but Israel held to the covenant.',
       sv.verse_id, ev.verse_id, 'extras', 61712
  FROM _session253_1mac9_lookup sv, _session253_1mac9_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=9 AND sv.verse_number=73
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=9 AND ev.verse_number=73
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-maccabees-9-how-is-the-valiant-fallen
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Samuel 1:19 — *The beauty of Yashar''el (Israel) is slain upon thy high places: how are the mighty fallen!* David''s opening lament over Saul and Jonathan supplies the very cry Israel raises over Judas, the valiant man fallen that delivered Israel.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac9_lookup sv, _session253_1mac9_lookup tv
 WHERE t.slug='1-maccabees-9-how-is-the-valiant-fallen'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=9 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=1 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Samuel 1:25 — *How are the mighty fallen in the midst of the battle! O Jonathan, thou wast slain in thine high places.* The mighty falling in the midst of the battle is exactly Judas''s end at Eleasa, the same dirge for a fallen captain of Israel.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac9_lookup sv, _session253_1mac9_lookup tv
 WHERE t.slug='1-maccabees-9-how-is-the-valiant-fallen'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=9 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=1 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Samuel 1:27 — *How are the mighty fallen, and the weapons of war perished!* The closing refrain of David''s song echoes in Israel''s lament for Judas, whose noble acts were too many to be written.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac9_lookup sv, _session253_1mac9_lookup tv
 WHERE t.slug='1-maccabees-9-how-is-the-valiant-fallen'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=9 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=1 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Samuel 3:38 — *And the king said unto his servants, Know ye not that there is a prince and a great man fallen this day in Yashar''el (Israel)?* As David named the loss of a great man in Israel, so Jonathan and Simon bury their brother and Israel mourns a prince fallen.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac9_lookup sv, _session253_1mac9_lookup tv
 WHERE t.slug='1-maccabees-9-how-is-the-valiant-fallen'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=9 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=3 AND tv.verse_number=38
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-9-die-manfully-for-our-brothers
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 15:13 — *Greater love hath no man than this, that a man lay down his life for his friends.* Judas''s resolve to die manfully for his brothers rather than flee is this very love made flesh in the field.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac9_lookup sv, _session253_1mac9_lookup tv
 WHERE t.slug='1-maccabees-9-die-manfully-for-our-brothers'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=9 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=15 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 11:34 — *Quenched the violence of fire, escaped the edge of the sword, out of weakness were made strong, waxed valiant in fight, turned to flight the armies of the aliens.* The faith chapter enrolls the Maccabean valiant who, like Judas at Eleasa, were made strong out of weakness.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac9_lookup sv, _session253_1mac9_lookup tv
 WHERE t.slug='1-maccabees-9-die-manfully-for-our-brothers'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=9 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Maccabees 3:18 — *To whom Judas answered, It is no hard matter for many to be shut up in the hands of a few; and with Yahuah (God) of heaven it is all one, to deliver with a great multitude, or a small company:* The same Judas who once heartened the few now will not flee, choosing to die manfully with his brothers.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac9_lookup sv, _session253_1mac9_lookup tv
 WHERE t.slug='1-maccabees-9-die-manfully-for-our-brothers'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=9 AND sv.verse_number=10
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=3 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-9-save-by-many-or-by-few
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Samuel 14:6 — *And Jonathan said to the young man that bare his armour, Come, and let us go over unto the garrison of these uncircumcised: it may be that Yahuah (LORD) will work for us: for there is no restraint to Yahuah (LORD) to save by many or by few.* The eight hundred who stayed with Judas embody Jonathan''s faith that the LORD saves by many or by few.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac9_lookup sv, _session253_1mac9_lookup tv
 WHERE t.slug='1-maccabees-9-save-by-many-or-by-few'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=9 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=14 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Maccabees 3:19 — *For the victory of battle stands not in the multitude of an host; but strength comes from heaven.* Against the counsel to flee because they were but few, Judas''s own creed answers that the victory is not in numbers but from heaven.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac9_lookup sv, _session253_1mac9_lookup tv
 WHERE t.slug='1-maccabees-9-save-by-many-or-by-few'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=9 AND sv.verse_number=9
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=3 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Zechariah 4:6 — *Then he answered and spake unto me, saying, This is the word of Yahuah (LORD) unto Zerubbabel, saying, Not by might, nor by power, but by my spirit, saith Yahuah Tseva''ot (LORD of hosts).* The prophet''s word grounds the courage of the few: deliverance is by the Spirit, not by the size of the host.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac9_lookup sv, _session253_1mac9_lookup tv
 WHERE t.slug='1-maccabees-9-save-by-many-or-by-few'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=9 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=4 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-9-cry-ye-now-to-heaven
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 79:9 — *Help us, O Elohim (God) of our salvation, for the glory of thy name: and deliver us, and purge away our sins, for thy name''s sake.* The psalm of the defiled temple is exactly the cry Jonathan commands his trapped company to raise to heaven for deliverance.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac9_lookup sv, _session253_1mac9_lookup tv
 WHERE t.slug='1-maccabees-9-cry-ye-now-to-heaven'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=9 AND sv.verse_number=46
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=79 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Maccabees 3:19 — *For the victory of battle stands not in the multitude of an host; but strength comes from heaven.* Jonathan''s order to cry to heaven rests on the family creed that the strength to be delivered comes down from heaven, not from their own number.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac9_lookup sv, _session253_1mac9_lookup tv
 WHERE t.slug='1-maccabees-9-cry-ye-now-to-heaven'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=9 AND sv.verse_number=46
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=3 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-9-the-sword-ceased-the-seed-kept
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 25:11 — *Phinehas, the son of Eleazar, the son of Aaron the priest, hath turned my wrath away from the children of Yashar''el (Israel), while he was zealous for my sake among them, that I consumed not the children of Yashar''el (Israel) in my jealousy.* Jonathan destroying the ungodly out of Israel carries forward Phinehas''s zeal that turns away wrath and keeps the people.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac9_lookup sv, _session253_1mac9_lookup tv
 WHERE t.slug='1-maccabees-9-the-sword-ceased-the-seed-kept'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=9 AND sv.verse_number=73
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=25 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 25:13 — *And he shall have it, and his seed after him, even the covenant of an everlasting priesthood; because he was zealous for his Elohim (God), and made an atonement for the children of Yashar''el (Israel).* The Maccabean zeal that purges Israel is rewarded as Phinehas''s was, the covenant kept through the zealous seed.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac9_lookup sv, _session253_1mac9_lookup tv
 WHERE t.slug='1-maccabees-9-the-sword-ceased-the-seed-kept'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=9 AND sv.verse_number=73
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=25 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 79:10 — *Wherefore should the heathen say, Where is their Elohim (God)? let him be known among the heathen in our sight by the revenging of the blood of thy servants which is shed.* When the brothers avenged fully the blood of John their brother, they enacted the psalm''s plea for the revenging of the blood of His servants.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac9_lookup sv, _session253_1mac9_lookup tv
 WHERE t.slug='1-maccabees-9-the-sword-ceased-the-seed-kept'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=9 AND sv.verse_number=42
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=79 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

