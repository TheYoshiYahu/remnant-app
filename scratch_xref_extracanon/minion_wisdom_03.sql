-- ----- fragment: minion_thewisdomofsolomon_03.sql (session253 the-wisdom-of-solomon 3) -----
-- Source anchor: apocrypha/the-wisdom-of-solomon ch3. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: wis03 (view _session253_wis03_lookup). Sort band base 58050, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_wis03_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: wisdom-of-solomon-3-souls-in-the-hand-of-elohim
  ('apocrypha', 'the-wisdom-of-solomon', 3, 1, 'canon', 'revelation', 6, 9, 'free', E'Revelation 6:9 — *And when he had opened the fifth seal, I saw under the altar the souls of them that were slain for the word of Elohim (God), and for the testimony which they held:* the souls held in Elohim''s hand in Wisdom of Solomon 3:1 are the souls John sees under the altar, kept and awaiting their vindication.'),
  ('apocrypha', 'the-wisdom-of-solomon', 3, 3, 'canon', 'revelation', 14, 13, 'free', E'Revelation 14:13 — *And I heard a voice from heaven saying unto me, Write, Blessed are the dead which die in Yahuah (Lord) from henceforth: Yea, saith the Spirit, that they may rest from their labours; and their works do follow them.* What the unwise call destruction Wisdom of Solomon 3:3 calls peace, and heaven calls the faithful dead blessed and at rest.'),
  ('apocrypha', 'the-wisdom-of-solomon', 3, 1, 'enoch', '1-enoch', 103, 4, 'extras', E'1 Enoch 103:4 — *And the righteous shall be victorious in the name of Yahuah (God) of Spirits: And He will cause His light to appear on them, And He will make peace for them.* The watcher-book and Wisdom of Solomon 3:1 speak one tongue: the righteous souls are kept, lit, and given peace in Yahuah''s hand.'),
  -- thread: wisdom-of-solomon-3-tried-as-gold-in-the-furnace
  ('apocrypha', 'the-wisdom-of-solomon', 3, 6, 'canon', 'malachi', 3, 3, 'free', E'Malachi 3:3 — *And he shall sit as a refiner and purifier of silver: and he shall purify the sons of Levi, and purge them as gold and silver, that they may offer unto Yahuah (LORD) an offering in righteousness.* The gold tried in the furnace of Wisdom of Solomon 3:6 is the same refining by which Yahuah purges His own that they may be offered in righteousness.'),
  ('apocrypha', 'the-wisdom-of-solomon', 3, 6, 'apocrypha', 'ecclesiasticus', 2, 5, 'extras', E'Ecclesiasticus 2:5 — *For gold is tried in the fire, and acceptable men in the furnace of adversity.* Ben Sira''s proverb is Wisdom of Solomon 3:6 in miniature: the acceptable are assayed like gold in the furnace and found worthy for Elohim.'),
  -- thread: wisdom-of-solomon-3-they-shall-shine-and-judge-the-nations
  ('apocrypha', 'the-wisdom-of-solomon', 3, 7, 'canon', 'daniel', 12, 3, 'free', E'Daniel 12:3 — *And they that be wise shall shine as the brightness of the firmament; and they that turn many to righteousness as the stars for ever and ever.* The shining at the visitation in Wisdom of Solomon 3:7 is Daniel''s wise rising from the dust to shine as the firmament.'),
  ('apocrypha', 'the-wisdom-of-solomon', 3, 8, 'canon', 'matthew', 19, 28, 'free', E'Matthew 19:28 — *And Yahusha (Jesus) said unto them, Verily I say unto you, That ye which have followed me, in the regeneration when the Son of Adam shall sit in the throne of his glory, ye also shall sit upon twelve thrones, judging the twelve tribes of Yashar''el (Israel).* That the righteous shall judge the nations in Wisdom of Solomon 3:8 the Messiah seats on twelve thrones in the regeneration.'),
  -- thread: wisdom-of-solomon-3-faithful-in-love-shall-abide
  ('apocrypha', 'the-wisdom-of-solomon', 3, 9, 'apocrypha', '2-maccabees', 7, 9, 'extras', E'2 Maccabees 7:9 — *And when he was at the last gasp, he said, You like a fury takest us out of this present life, but the King of the world shall raise us up, who have died for his laws, to everlasting life.* The saints who abide with Him in Wisdom of Solomon 3:9 are the Torah-faithful martyrs whom the King of the world raises to everlasting life.'),
  ('apocrypha', 'the-wisdom-of-solomon', 3, 10, 'apocrypha', '2-maccabees', 7, 14, 'extras', E'2 Maccabees 7:14 — *So when he was ready to die he said thus, It is good, being put to death by men, to look for hope from Yahuah (God) to be raised up again by him: as for you, you shall have no resurrection to life.* The two destinies of Wisdom of Solomon 3:9-10 are the martyr''s own: resurrection-life for the faithful, no resurrection for those who forsook Yahuah.'),
  -- thread: wisdom-of-solomon-3-the-barren-and-the-eunuch-blessed
  ('apocrypha', 'the-wisdom-of-solomon', 3, 14, 'canon', 'isaiah', 56, 5, 'free', E'Isaiah 56:5 — *Even unto them will I give in mine house and within my walls a place and a name better than of sons and of daughters: I will give them an everlasting name, that shall not be cut off.* The eunuch''s inheritance in the temple of Yahuah in Wisdom of Solomon 3:14 is Isaiah''s place and name better than sons, an everlasting name that shall not be cut off.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_wis03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_wis03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-of-solomon-3-souls-in-the-hand-of-elohim',
       E'The souls of the righteous in the hand of Elohim',
       E'*But the souls of the righteous are in the hand of Yahuah (God), and there shall no torment touch them.* (Wisdom of Solomon 3:1) — *In the sight of the unwise they seemed to die: and their departure is taken for misery,* (Wisdom of Solomon 3:2) *And their going from us to be utter destruction: but they are in peace.* (Wisdom of Solomon 3:3). It ain''t new: the seer of the seals sees these very souls — *I saw under the altar the souls of them that were slain for the word of Elohim (God), and for the testimony which they held* (Revelation 6:9), and a voice from heaven seals it, *Blessed are the dead which die in Yahuah (Lord) from henceforth... that they may rest from their labours* (Revelation 14:13). And the restored watcher-book already named their portion: *the righteous shall be victorious in the name of Yahuah (God) of Spirits: And He will cause His light to appear on them, And He will make peace for them* (1 Enoch 103:4). The grave is not destruction but peace; the hand that holds them is Yahuah''s own.',
       sv.verse_id, ev.verse_id, 'extras', 58050
  FROM _session253_wis03_lookup sv, _session253_wis03_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=3 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=3 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-of-solomon-3-tried-as-gold-in-the-furnace',
       E'Tried as gold in the furnace, received as a burnt offering',
       E'*And having been a little chastised, they shall be greatly rewarded: for Yahuah (God) proved them, and found them worthy for himself.* (Wisdom of Solomon 3:5) *As gold in the furnace has he tried them, and received them as a burnt offering.* (Wisdom of Solomon 3:6). The chastening is not the curse of the law but the refiner''s love. Malachi saw the same fire: *And he shall sit as a refiner and purifier of silver: and he shall purify the sons of Levi, and purge them as gold and silver, that they may offer unto Yahuah (LORD) an offering in righteousness* (Malachi 3:3). And ben Sira, in the very next room of the library, sets the proverb beside it: *For gold is tried in the fire, and acceptable men in the furnace of adversity* (Ecclesiasticus 2:5). The furnace is not destruction; it is the assaying of the elect, who come out as gold and go up as a whole burnt offering pleasing to Elohim.',
       sv.verse_id, ev.verse_id, 'extras', 58053
  FROM _session253_wis03_lookup sv, _session253_wis03_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=3 AND sv.verse_number=5
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=3 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-of-solomon-3-they-shall-shine-and-judge-the-nations',
       E'In their visitation they shall shine and judge the nations',
       E'*And in the time of their visitation they shall shine, and run to and fro like sparks among the stubble.* (Wisdom of Solomon 3:7) *They shall judge the nations, and have dominion over the people, and their Elohim (God) shall reign for ever.* (Wisdom of Solomon 3:8). This is the resurrection-glory and the rule of the saints. Daniel saw the shining: *And many of them that sleep in the dust of the earth shall awake, some to everlasting life... And they that be wise shall shine as the brightness of the firmament* (Daniel 12:2-3). And the Messiah promised the dominion: *That ye which have followed me, in the regeneration when the Son of Adam shall sit in the throne of his glory, ye also shall sit upon twelve thrones, judging the twelve tribes of Yashar''el (Israel)* (Matthew 19:28). The righteous do not merely escape death — they wake, they shine, and they reign with their Elohim who reigns for ever.',
       sv.verse_id, ev.verse_id, 'extras', 58056
  FROM _session253_wis03_lookup sv, _session253_wis03_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=3 AND sv.verse_number=7
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=3 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-of-solomon-3-faithful-in-love-shall-abide',
       E'The faithful in love abide with Him; the ungodly forsake Yahuah',
       E'*They that put their trust in him shall understand the truth: and such as be faithful in love shall abide with him: for grace and mercy is to his saints, and he has care for his elect.* (Wisdom of Solomon 3:9) — set against *But the ungodly shall be punished according to their own imaginations, which have neglected the righteous, and forsaken Yahuah (God).* (Wisdom of Solomon 3:10). Election is not a church replacing Israel but Yahuah''s care for His elect who keep faith. The martyr-mother''s sons confessed the same hope under torture: *the King of the world shall raise us up, who have died for his laws, to everlasting life* (2 Maccabees 7:9), and *to look for hope from Yahuah (God) to be raised up again by him: as for you, you shall have no resurrection to life* (2 Maccabees 7:14) — the very two ends Wisdom sets side by side, abiding with Him or punished for forsaking Him.',
       sv.verse_id, ev.verse_id, 'extras', 58059
  FROM _session253_wis03_lookup sv, _session253_wis03_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=3 AND sv.verse_number=9
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=3 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-of-solomon-3-the-barren-and-the-eunuch-blessed',
       E'Blessed the barren and the eunuch who keep the covenant',
       E'*Wherefore blessed is the barren that is undefiled, which has not known the sinful bed: she shall have fruit in the visitation of souls.* (Wisdom of Solomon 3:13) *And blessed is the eunuch, which with his hands has wrought no iniquity, nor imagined wicked things against Yahuah (God): for to him shall be given the special gift of faith, and an inheritance in the temple of Yahuah (God) more acceptable to his mind.* (Wisdom of Solomon 3:14). It ain''t new: Isaiah had already overturned the reproach of the dry tree — *Even unto them will I give in mine house and within my walls a place and a name better than of sons and of daughters: I will give them an everlasting name, that shall not be cut off* (Isaiah 56:5). Fruitfulness is reckoned not by the bed but by faithfulness; the covenant-keeper, childless by men, is given an inheritance in Yahuah''s house and an everlasting name.',
       sv.verse_id, ev.verse_id, 'extras', 58062
  FROM _session253_wis03_lookup sv, _session253_wis03_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=3 AND sv.verse_number=13
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=3 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: wisdom-of-solomon-3-souls-in-the-hand-of-elohim
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 6:9 — *And when he had opened the fifth seal, I saw under the altar the souls of them that were slain for the word of Elohim (God), and for the testimony which they held:* the souls held in Elohim''s hand in Wisdom of Solomon 3:1 are the souls John sees under the altar, kept and awaiting their vindication.'
  FROM cross_reference_threads t, cross_references x, _session253_wis03_lookup sv, _session253_wis03_lookup tv
 WHERE t.slug='wisdom-of-solomon-3-souls-in-the-hand-of-elohim'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=3 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=6 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 14:13 — *And I heard a voice from heaven saying unto me, Write, Blessed are the dead which die in Yahuah (Lord) from henceforth: Yea, saith the Spirit, that they may rest from their labours; and their works do follow them.* What the unwise call destruction Wisdom of Solomon 3:3 calls peace, and heaven calls the faithful dead blessed and at rest.'
  FROM cross_reference_threads t, cross_references x, _session253_wis03_lookup sv, _session253_wis03_lookup tv
 WHERE t.slug='wisdom-of-solomon-3-souls-in-the-hand-of-elohim'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=3 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=14 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 103:4 — *And the righteous shall be victorious in the name of Yahuah (God) of Spirits: And He will cause His light to appear on them, And He will make peace for them.* The watcher-book and Wisdom of Solomon 3:1 speak one tongue: the righteous souls are kept, lit, and given peace in Yahuah''s hand.'
  FROM cross_reference_threads t, cross_references x, _session253_wis03_lookup sv, _session253_wis03_lookup tv
 WHERE t.slug='wisdom-of-solomon-3-souls-in-the-hand-of-elohim'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=3 AND sv.verse_number=1
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=103 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-of-solomon-3-tried-as-gold-in-the-furnace
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Malachi 3:3 — *And he shall sit as a refiner and purifier of silver: and he shall purify the sons of Levi, and purge them as gold and silver, that they may offer unto Yahuah (LORD) an offering in righteousness.* The gold tried in the furnace of Wisdom of Solomon 3:6 is the same refining by which Yahuah purges His own that they may be offered in righteousness.'
  FROM cross_reference_threads t, cross_references x, _session253_wis03_lookup sv, _session253_wis03_lookup tv
 WHERE t.slug='wisdom-of-solomon-3-tried-as-gold-in-the-furnace'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=3 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ecclesiasticus 2:5 — *For gold is tried in the fire, and acceptable men in the furnace of adversity.* Ben Sira''s proverb is Wisdom of Solomon 3:6 in miniature: the acceptable are assayed like gold in the furnace and found worthy for Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_wis03_lookup sv, _session253_wis03_lookup tv
 WHERE t.slug='wisdom-of-solomon-3-tried-as-gold-in-the-furnace'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=3 AND sv.verse_number=6
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=2 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-of-solomon-3-they-shall-shine-and-judge-the-nations
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 12:3 — *And they that be wise shall shine as the brightness of the firmament; and they that turn many to righteousness as the stars for ever and ever.* The shining at the visitation in Wisdom of Solomon 3:7 is Daniel''s wise rising from the dust to shine as the firmament.'
  FROM cross_reference_threads t, cross_references x, _session253_wis03_lookup sv, _session253_wis03_lookup tv
 WHERE t.slug='wisdom-of-solomon-3-they-shall-shine-and-judge-the-nations'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=3 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 19:28 — *And Yahusha (Jesus) said unto them, Verily I say unto you, That ye which have followed me, in the regeneration when the Son of Adam shall sit in the throne of his glory, ye also shall sit upon twelve thrones, judging the twelve tribes of Yashar''el (Israel).* That the righteous shall judge the nations in Wisdom of Solomon 3:8 the Messiah seats on twelve thrones in the regeneration.'
  FROM cross_reference_threads t, cross_references x, _session253_wis03_lookup sv, _session253_wis03_lookup tv
 WHERE t.slug='wisdom-of-solomon-3-they-shall-shine-and-judge-the-nations'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=3 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=19 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-of-solomon-3-faithful-in-love-shall-abide
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Maccabees 7:9 — *And when he was at the last gasp, he said, You like a fury takest us out of this present life, but the King of the world shall raise us up, who have died for his laws, to everlasting life.* The saints who abide with Him in Wisdom of Solomon 3:9 are the Torah-faithful martyrs whom the King of the world raises to everlasting life.'
  FROM cross_reference_threads t, cross_references x, _session253_wis03_lookup sv, _session253_wis03_lookup tv
 WHERE t.slug='wisdom-of-solomon-3-faithful-in-love-shall-abide'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=3 AND sv.verse_number=9
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Maccabees 7:14 — *So when he was ready to die he said thus, It is good, being put to death by men, to look for hope from Yahuah (God) to be raised up again by him: as for you, you shall have no resurrection to life.* The two destinies of Wisdom of Solomon 3:9-10 are the martyr''s own: resurrection-life for the faithful, no resurrection for those who forsook Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_wis03_lookup sv, _session253_wis03_lookup tv
 WHERE t.slug='wisdom-of-solomon-3-faithful-in-love-shall-abide'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=3 AND sv.verse_number=10
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-of-solomon-3-the-barren-and-the-eunuch-blessed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 56:5 — *Even unto them will I give in mine house and within my walls a place and a name better than of sons and of daughters: I will give them an everlasting name, that shall not be cut off.* The eunuch''s inheritance in the temple of Yahuah in Wisdom of Solomon 3:14 is Isaiah''s place and name better than sons, an everlasting name that shall not be cut off.'
  FROM cross_reference_threads t, cross_references x, _session253_wis03_lookup sv, _session253_wis03_lookup tv
 WHERE t.slug='wisdom-of-solomon-3-the-barren-and-the-eunuch-blessed'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=3 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=56 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

