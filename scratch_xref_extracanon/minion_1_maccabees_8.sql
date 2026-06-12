-- ----- fragment: minion_1maccabees_08.sql (session253 1-maccabees 8) -----
-- Source anchor: apocrypha/1-maccabees ch8. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1mac8 (view _session253_1mac8_lookup). Sort band base 61675, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1mac8_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-maccabees-8-fourth-kingdom
  ('apocrypha', '1-maccabees', 8, 4, 'canon', 'daniel', 2, 40, 'free', E'Daniel 2:40 — *And the fourth kingdom shall be strong as iron: forasmuch as iron breaketh in pieces and subdueth all things: and as iron that breaketh all these, shall it break in pieces and bruise.* The Rome whose conquests 1 Maccabees 8:4 rehearses is Daniel''s iron fourth kingdom that subdues all the earth.'),
  ('apocrypha', '1-maccabees', 8, 11, 'canon', 'daniel', 7, 7, 'free', E'Daniel 7:7 — *After this I saw in the night visions, and behold a fourth beast, dreadful and terrible, and strong exceedingly; and it had great iron teeth: it devoured and brake in pieces, and stamped the residue with the feet of it: and it was diverse from all the beasts that were before it; and it had ten horns.* The empire that 1 Maccabees 8:11 says destroyed and brought under its dominion all kingdoms is Daniel''s iron-toothed beast.'),
  ('apocrypha', '1-maccabees', 8, 13, 'canon', 'daniel', 7, 25, 'free', E'Daniel 7:25 — *And he shall speak great words against the El Elyon (most High), and shall wear out the saints of the El Elyon (most High), and think to change times and laws: and they shall be given into his hand until a time and times and the dividing of time.* The power of 1 Maccabees 8:13 that sets up and displaces kings at pleasure is the self-exalting horn that wears out the saints.'),
  -- thread: 1-maccabees-8-arm-of-flesh
  ('apocrypha', '1-maccabees', 8, 17, 'canon', 'jeremiah', 17, 5, 'free', E'Jeremiah 17:5 — *Thus saith Yahuah (LORD); Cursed be the man that trusteth in man, and maketh flesh his arm, and whose heart departeth from Yahuah (LORD).* To send to Rome and make it Israel''s arm, as in 1 Maccabees 8:17, is exactly the leaning Jeremiah warns against.'),
  ('apocrypha', '1-maccabees', 8, 17, 'canon', 'psalms', 146, 3, 'free', E'Psalm 146:3 — *Put not your trust in princes, nor in the son of Adam, in whom there is no help.* The Roman senate Judas courts in 1 Maccabees 8:17 are the princes in whom there is no lasting help.'),
  ('apocrypha', '1-maccabees', 8, 6, 'canon', 'psalms', 33, 16, 'free', E'Psalm 33:16 — *There is no king saved by the multitude of an host: a mighty man is not delivered by much strength.* The hundred-and-twenty elephants and great army of 1 Maccabees 8:6 are the multitude of an host that cannot save.'),
  ('apocrypha', '1-maccabees', 8, 18, 'canon', 'isaiah', 31, 1, 'free', E'Isaiah 31:1 — *Woe to them that go down to Egypt for help; and stay on horses, and trust in chariots, because they are many; and in horsemen, because they are very strong; but they look not unto the Holy One of Yashar''el (Israel), neither seek Yahuah (LORD)!* The plea to Rome to take off the yoke in 1 Maccabees 8:18 is the new going-down-to-Egypt for help.'),
  -- thread: 1-maccabees-8-deliverance-from-heaven
  ('apocrypha', '1-maccabees', 8, 20, 'apocrypha', '1-maccabees', 4, 10, 'extras', E'1 Maccabees 4:10 — *Now therefore let us cry to heaven, if perhaps Yahuah (God) will have mercy upon us, and remember the covenant of our fathers, and destroy this host before our face this day:* Judas'' own counsel before Emmaus shows the truer recourse than the Roman confederacy he seeks in 1 Maccabees 8:20.'),
  ('apocrypha', '1-maccabees', 8, 20, 'apocrypha', '1-maccabees', 4, 30, 'extras', E'1 Maccabees 4:30 — *And when he saw that mighty army, he prayed and said, Blessed art you, O Saviour of Yashar''el (Israel), who did quell the violence of the mighty man by the hand of your servant David, and gavest the host of strangers into the hands of Jonathan the son of Saul, and his armourbearer;* The Saviour of Israel who felled Goliath, not the senate of 1 Maccabees 8:20, is Israel''s deliverer.'),
  ('apocrypha', '1-maccabees', 8, 19, 'canon', 'psalms', 20, 7, 'free', E'Psalm 20:7 — *Some trust in chariots, and some in horses: but we will remember the name of Yahuah Eloheinu (the LORD our God).* The long journey to Rome in 1 Maccabees 8:19 is a trust in chariots when the name of God is the surer shield.'),
  ('apocrypha', '1-maccabees', 8, 20, 'canon', 'psalms', 118, 8, 'free', E'Psalm 118:8 — *It is better to trust in Yahuah (LORD) than to put confidence in man.* The confederacy and friendship sought in 1 Maccabees 8:20 is the confidence in man the psalm sets second to trust in Yahuah.'),
  -- thread: 1-maccabees-8-kingdom-that-stands
  ('apocrypha', '1-maccabees', 8, 15, 'canon', 'daniel', 2, 44, 'free', E'Daniel 2:44 — *And in the days of these kings shall the Elohim (God) of heaven set up a kingdom, which shall never be destroyed: and the kingdom shall not be left to other people, but it shall break in pieces and consume all these kingdoms, and it shall stand for ever.* The well-ordered Roman senate of 1 Maccabees 8:15 is one of the kingdoms that the everlasting Kingdom will break in pieces.'),
  ('apocrypha', '1-maccabees', 8, 16, 'canon', 'daniel', 7, 27, 'free', E'Daniel 7:27 — *And the kingdom and dominion, and the greatness of the kingdom under the whole heaven, shall be given to the people of the saints of the El Elyon (most High), whose kingdom is an everlasting kingdom, and all dominions shall serve and obey him.* The single yearly ruler all obey in 1 Maccabees 8:16 foreshadows by contrast the dominion given to the saints, whom all kingdoms shall serve.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1mac8_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1mac8_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-8-fourth-kingdom',
       E'The Fourth Beast: Israel turns from one world-empire to another',
       E'Judas, having driven back the Greek, now hears of a mightier arm to lean upon: *Now Judas had heard of the Romans, that they were mighty and valiant men, and such as would lovingly accept all that joined themselves to them, and make a league of amity with all that came to them;* (1 Maccabees 8:1) — *Also that, whom they would help to a kingdom, those reign; and whom again they would, they displace: finally, that they were greatly exalted:* (1 Maccabees 8:13). The chronicler is honest about Rome''s reach, and the reader who knows Daniel hears the warning under the praise: this is the next head of the kingdom-of-man, the iron empire that breaks all. *And the fourth kingdom shall be strong as iron: forasmuch as iron breaketh in pieces and subdueth all things: and as iron that breaketh all these, shall it break in pieces and bruise.* (Daniel 2:40) — Rome is the iron Daniel foresaw, and Judas is reaching to take its yoke upon his neck. *After this I saw in the night visions, and behold a fourth beast, dreadful and terrible, and strong exceedingly; and it had great iron teeth: it devoured and brake in pieces, and stamped the residue with the feet of it: and it was diverse from all the beasts that were before it; and it had ten horns.* (Daniel 7:7) — the very empire whose teeth would one day tread Jerusalem is the friend Israel now seeks. Antiochus was the abomination dismantled; Rome is the dreadful beast rising. *And he shall speak great words against the El Elyon (most High), and shall wear out the saints of the El Elyon (most High), and think to change times and laws: and they shall be given into his hand until a time and times and the dividing of time.* (Daniel 7:25) — the spirit that exalts itself and wears out the saints does not die with one tyrant; it changes its dress and offers a league.',
       sv.verse_id, ev.verse_id, 'extras', 61675
  FROM _session253_1mac8_lookup sv, _session253_1mac8_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=8 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=8 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-8-arm-of-flesh',
       E'Trust not in the arm of flesh: the league as a leaning',
       E'The chapter''s pivot is a turning of the eyes — from heaven, which had already given the victories, to a distant arm of flesh: *In consideration of these things, Judas chose Eupolemus the son of John, the son of Accos, and Jason the son of Eleazar, and sent them to Rome, to make a league of amity and confederacy with them,* (1 Maccabees 8:17) — *And to intreat them that they would take the yoke from them; for they saw that the kingdom of the Grecians did oppress Yashar''el (Israel) with servitude.* (1 Maccabees 8:18). The text invites the old caution, and we weave it honestly. *Thus saith Yahuah (LORD); Cursed be the man that trusteth in man, and maketh flesh his arm, and whose heart departeth from Yahuah (LORD).* (Jeremiah 17:5) — to make Rome the arm is the very thing the prophet names. *Put not your trust in princes, nor in the son of Adam, in whom there is no help.* (Psalm 146:3) — the Roman senate is princes, and their help is the help of dust. *There is no king saved by the multitude of an host: a mighty man is not delivered by much strength.* (Psalm 33:16) — Rome''s hundred-and-twenty elephants and great army do not save. *Woe to them that go down to Egypt for help; and stay on horses, and trust in chariots, because they are many; and in horsemen, because they are very strong; but they look not unto the Holy One of Yashar''el (Israel), neither seek Yahuah (LORD)!* (Isaiah 31:1) — the embassy to Rome is the new going-down-to-Egypt. This is not to condemn Judas, whose zeal for the covenant was true; it is the reader''s quiet warning, that even the faithful are tempted to lean where they should kneel.',
       sv.verse_id, ev.verse_id, 'extras', 61678
  FROM _session253_1mac8_lookup sv, _session253_1mac8_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=8 AND sv.verse_number=17
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=8 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-8-deliverance-from-heaven',
       E'By whom Israel is delivered: cry to heaven, not to a senate',
       E'Set against the embassy to Rome stands the witness of this very book a few chapters back, where deliverance came not from a league but from the covenant God. The envoys carry Israel''s plea to the senate: *Judas Maccabeus with his brothers, and the people of the Yahudim (Jews), have sent us to you, to make a confederacy and peace with you, and that we might be registered your confederates and friends.* (1 Maccabees 8:20). But Judas himself had taught the truer recourse before Emmaus: *Now therefore let us cry to heaven, if perhaps Yahuah (God) will have mercy upon us, and remember the covenant of our fathers, and destroy this host before our face this day:* (1 Maccabees 4:10) — the covenant of the fathers, not a confederacy of brass, was the wall. *And when he saw that mighty army, he prayed and said, Blessed art you, O Saviour of Yashar''el (Israel), who did quell the violence of the mighty man by the hand of your servant David, and gavest the host of strangers into the hands of Jonathan the son of Saul, and his armourbearer;* (1 Maccabees 4:30) — the One who felled Goliath and routed the Philistines is the Saviour of Israel, who needs no senate. The Psalms know the contrast by heart: *Some trust in chariots, and some in horses: but we will remember the name of Yahuah Eloheinu (the LORD our God).* (Psalm 20:7) — and *It is better to trust in Yahuah (LORD) than to put confidence in man.* (Psalm 118:8). The seed kept is kept by the covenant, not by the kingdom-of-man''s friendship.',
       sv.verse_id, ev.verse_id, 'extras', 61681
  FROM _session253_1mac8_lookup sv, _session253_1mac8_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=8 AND sv.verse_number=19
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=8 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-8-kingdom-that-stands',
       E'No crown, no purple, a senate of brass: the order that cannot stand',
       E'The chronicler marvels at Rome''s polity — its restraint, its yearly rule, its tireless council: *Yet for all this none of them wore a crown or was clothed in purple, to be magnified thereby:* (1 Maccabees 8:14) — *Moreover how they had made for themselves a senate house, in which three hundred and twenty men sat in council daily, consulting alway for the people, to the end they might be well ordered:* (1 Maccabees 8:15) — *And that they committed their government to one man every year, who ruled over all their country, and that all were obedient to that one, and that there was neither envy nor emmulation among them.* (1 Maccabees 8:16). It is the kingdom-of-man at its most admirable, ordering itself wisely — and yet it is still the fourth kingdom, mortal as iron mixed with clay. Daniel sets over against every such order the one Kingdom that will not pass: *And in the days of these kings shall the Elohim (God) of heaven set up a kingdom, which shall never be destroyed: and the kingdom shall not be left to other people, but it shall break in pieces and consume all these kingdoms, and it shall stand for ever.* (Daniel 2:44) — Rome''s brass tables are a memorial of peace, but this Kingdom alone stands for ever. *And the kingdom and dominion, and the greatness of the kingdom under the whole heaven, shall be given to the people of the saints of the El Elyon (most High), whose kingdom is an everlasting kingdom, and all dominions shall serve and obey him.* (Daniel 7:27) — the dominion is not Rome''s senate but the saints'', and all the well-ordered empires of men shall at last serve and obey Him.',
       sv.verse_id, ev.verse_id, 'extras', 61684
  FROM _session253_1mac8_lookup sv, _session253_1mac8_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=8 AND sv.verse_number=14
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=8 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-maccabees-8-fourth-kingdom
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 2:40 — *And the fourth kingdom shall be strong as iron: forasmuch as iron breaketh in pieces and subdueth all things: and as iron that breaketh all these, shall it break in pieces and bruise.* The Rome whose conquests 1 Maccabees 8:4 rehearses is Daniel''s iron fourth kingdom that subdues all the earth.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac8_lookup sv, _session253_1mac8_lookup tv
 WHERE t.slug='1-maccabees-8-fourth-kingdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=8 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=2 AND tv.verse_number=40
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:7 — *After this I saw in the night visions, and behold a fourth beast, dreadful and terrible, and strong exceedingly; and it had great iron teeth: it devoured and brake in pieces, and stamped the residue with the feet of it: and it was diverse from all the beasts that were before it; and it had ten horns.* The empire that 1 Maccabees 8:11 says destroyed and brought under its dominion all kingdoms is Daniel''s iron-toothed beast.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac8_lookup sv, _session253_1mac8_lookup tv
 WHERE t.slug='1-maccabees-8-fourth-kingdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=8 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 7:25 — *And he shall speak great words against the El Elyon (most High), and shall wear out the saints of the El Elyon (most High), and think to change times and laws: and they shall be given into his hand until a time and times and the dividing of time.* The power of 1 Maccabees 8:13 that sets up and displaces kings at pleasure is the self-exalting horn that wears out the saints.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac8_lookup sv, _session253_1mac8_lookup tv
 WHERE t.slug='1-maccabees-8-fourth-kingdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=8 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-8-arm-of-flesh
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 17:5 — *Thus saith Yahuah (LORD); Cursed be the man that trusteth in man, and maketh flesh his arm, and whose heart departeth from Yahuah (LORD).* To send to Rome and make it Israel''s arm, as in 1 Maccabees 8:17, is exactly the leaning Jeremiah warns against.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac8_lookup sv, _session253_1mac8_lookup tv
 WHERE t.slug='1-maccabees-8-arm-of-flesh'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=8 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=17 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 146:3 — *Put not your trust in princes, nor in the son of Adam, in whom there is no help.* The Roman senate Judas courts in 1 Maccabees 8:17 are the princes in whom there is no lasting help.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac8_lookup sv, _session253_1mac8_lookup tv
 WHERE t.slug='1-maccabees-8-arm-of-flesh'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=8 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=146 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 33:16 — *There is no king saved by the multitude of an host: a mighty man is not delivered by much strength.* The hundred-and-twenty elephants and great army of 1 Maccabees 8:6 are the multitude of an host that cannot save.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac8_lookup sv, _session253_1mac8_lookup tv
 WHERE t.slug='1-maccabees-8-arm-of-flesh'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=8 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=33 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 31:1 — *Woe to them that go down to Egypt for help; and stay on horses, and trust in chariots, because they are many; and in horsemen, because they are very strong; but they look not unto the Holy One of Yashar''el (Israel), neither seek Yahuah (LORD)!* The plea to Rome to take off the yoke in 1 Maccabees 8:18 is the new going-down-to-Egypt for help.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac8_lookup sv, _session253_1mac8_lookup tv
 WHERE t.slug='1-maccabees-8-arm-of-flesh'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=8 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=31 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-8-deliverance-from-heaven
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Maccabees 4:10 — *Now therefore let us cry to heaven, if perhaps Yahuah (God) will have mercy upon us, and remember the covenant of our fathers, and destroy this host before our face this day:* Judas'' own counsel before Emmaus shows the truer recourse than the Roman confederacy he seeks in 1 Maccabees 8:20.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac8_lookup sv, _session253_1mac8_lookup tv
 WHERE t.slug='1-maccabees-8-deliverance-from-heaven'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=8 AND sv.verse_number=20
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=4 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Maccabees 4:30 — *And when he saw that mighty army, he prayed and said, Blessed art you, O Saviour of Yashar''el (Israel), who did quell the violence of the mighty man by the hand of your servant David, and gavest the host of strangers into the hands of Jonathan the son of Saul, and his armourbearer;* The Saviour of Israel who felled Goliath, not the senate of 1 Maccabees 8:20, is Israel''s deliverer.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac8_lookup sv, _session253_1mac8_lookup tv
 WHERE t.slug='1-maccabees-8-deliverance-from-heaven'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=8 AND sv.verse_number=20
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=4 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 20:7 — *Some trust in chariots, and some in horses: but we will remember the name of Yahuah Eloheinu (the LORD our God).* The long journey to Rome in 1 Maccabees 8:19 is a trust in chariots when the name of God is the surer shield.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac8_lookup sv, _session253_1mac8_lookup tv
 WHERE t.slug='1-maccabees-8-deliverance-from-heaven'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=8 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=20 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 118:8 — *It is better to trust in Yahuah (LORD) than to put confidence in man.* The confederacy and friendship sought in 1 Maccabees 8:20 is the confidence in man the psalm sets second to trust in Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac8_lookup sv, _session253_1mac8_lookup tv
 WHERE t.slug='1-maccabees-8-deliverance-from-heaven'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=8 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=118 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-8-kingdom-that-stands
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 2:44 — *And in the days of these kings shall the Elohim (God) of heaven set up a kingdom, which shall never be destroyed: and the kingdom shall not be left to other people, but it shall break in pieces and consume all these kingdoms, and it shall stand for ever.* The well-ordered Roman senate of 1 Maccabees 8:15 is one of the kingdoms that the everlasting Kingdom will break in pieces.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac8_lookup sv, _session253_1mac8_lookup tv
 WHERE t.slug='1-maccabees-8-kingdom-that-stands'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=8 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=2 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:27 — *And the kingdom and dominion, and the greatness of the kingdom under the whole heaven, shall be given to the people of the saints of the El Elyon (most High), whose kingdom is an everlasting kingdom, and all dominions shall serve and obey him.* The single yearly ruler all obey in 1 Maccabees 8:16 foreshadows by contrast the dominion given to the saints, whom all kingdoms shall serve.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac8_lookup sv, _session253_1mac8_lookup tv
 WHERE t.slug='1-maccabees-8-kingdom-that-stands'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=8 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

