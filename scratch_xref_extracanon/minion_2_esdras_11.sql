-- ----- fragment: minion_2esdras_11.sql (session253 2-esdras 11) -----
-- Source anchor: apocrypha/2-esdras ch11. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2esd11 (view _session253_2esd11_lookup). Sort band base 63250, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2esd11_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-esdras-11-eagle-from-the-sea
  ('apocrypha', '2-esdras', 11, 1, 'canon', 'daniel', 7, 3, 'free', E'Daniel 7:3 — *And four great beasts came up from the sea, diverse one from another.* The eagle of 2 Esdras 11:1 rises from the same sea as Daniel''s four beasts, the same vision of empire reworked for Ezra.'),
  ('apocrypha', '2-esdras', 11, 1, 'canon', 'revelation', 13, 1, 'free', E'Revelation 13:1 — *And I stood upon the sand of the sea, and saw a beast rise up out of the sea, having seven heads and ten horns, and upon his horns ten crowns, and upon his heads the name of blasphemy.* John''s beast and Ezra''s eagle both ascend from the sea, the kingdom-of-man surfacing out of the nations.'),
  -- thread: 2-esdras-11-reigned-over-all-the-earth
  ('apocrypha', '2-esdras', 11, 6, 'canon', 'daniel', 7, 23, 'free', E'Daniel 7:23 — *Thus he said, The fourth beast shall be the fourth kingdom upon earth, which shall be diverse from all kingdoms, and shall devour the whole earth, and shall tread it down, and break it in pieces.* The eagle to whom all things under heaven are subject (2 Esdras 11:6) is Daniel''s whole-earth-devouring fourth kingdom.'),
  ('apocrypha', '2-esdras', 11, 6, 'canon', 'revelation', 13, 7, 'free', E'Revelation 13:7 — *And it was given unto him to make war with the saints, and to overcome them: and power was given him over all kindreds, and tongues, and nations.* The beast''s power over all nations matches the eagle whom no creature upon earth dares speak against (2 Esdras 11:6).'),
  -- thread: 2-esdras-11-three-heads-seven-kings
  ('apocrypha', '2-esdras', 11, 23, 'canon', 'revelation', 17, 9, 'free', E'Revelation 17:9 — *And here is the mind which hath wisdom. The seven heads are seven mountains, on which the woman sitteth.* The eagle''s three heads (2 Esdras 11:23) belong to the same head-counting apocalyptic that John''s angel reads as kings and mountains.'),
  ('apocrypha', '2-esdras', 11, 23, 'canon', 'revelation', 17, 12, 'free', E'Revelation 17:12 — *And the ten horns which thou sawest are ten kings, which have received no kingdom as yet; but receive power as kings one hour with the beast.* The eagle''s wings that rise and reign and appear no more (2 Esdras 11:23) are the same short-lived kings John numbers as the ten horns.'),
  -- thread: 2-esdras-11-much-oppression
  ('apocrypha', '2-esdras', 11, 32, 'canon', 'daniel', 7, 7, 'free', E'Daniel 7:7 — *After this I saw in the night visions, and behold a fourth beast, dreadful and terrible, and strong exceedingly; and it had great iron teeth: it devoured and brake in pieces, and stamped the residue with the feet of it: and it was diverse from all the beasts that were before it; and it had ten horns.* The head that put the whole earth in fear (2 Esdras 11:32) is Daniel''s dreadful fourth beast that devours and tramples.'),
  ('apocrypha', '2-esdras', 11, 32, 'canon', 'daniel', 7, 25, 'free', E'Daniel 7:25 — *And he shall speak great words against the El Elyon (most High), and shall wear out the saints of the El Elyon (most High), and think to change times and laws: and they shall be given into his hand until a time and times and the dividing of time.* The head ruling with much oppression (2 Esdras 11:32) wears the face of Daniel''s little horn that grinds the saints and presumes to change the times and law.'),
  -- thread: 2-esdras-11-lion-out-of-the-wood
  ('apocrypha', '2-esdras', 11, 37, 'canon', 'revelation', 5, 5, 'free', E'Revelation 5:5 — *And one of the elders saith unto me, Weep not: behold, the Lion of the tribe of Juda, the Root of David, hath prevailed to open the book, and to loose the seven seals thereof.* The roaring lion who sends a man''s voice against the eagle (2 Esdras 11:37) is the Messiah-Lion of Judah, Yahusha enthroned to judge the kingdom-of-man.'),
  ('apocrypha', '2-esdras', 11, 37, 'canon', 'revelation', 17, 14, 'free', E'Revelation 17:14 — *These shall make war with the Lamb, and the Lamb shall overcome them: for he is Lord of lords, and King of kings: and they that are with him are called, and chosen, and faithful.* The Lion who confronts the eagle (2 Esdras 11:37) overthrows the beast-system just as the Lamb overcomes the kings who war against him.'),
  -- thread: 2-esdras-11-fourth-beast-judged
  ('apocrypha', '2-esdras', 11, 39, 'canon', 'daniel', 7, 26, 'free', E'Daniel 7:26 — *But the judgment shall sit, and they shall take away his dominion, to consume and to destroy it unto the end.* The Lion''s verdict that the fourth beast''s time ends through it (2 Esdras 11:39) is Daniel''s seated judgment stripping the beast of its dominion.'),
  ('apocrypha', '2-esdras', 11, 46, 'canon', 'daniel', 7, 27, 'free', E'Daniel 7:27 — *And the kingdom and dominion, and the greatness of the kingdom under the whole heaven, shall be given to the people of the saints of the El Elyon (most High), whose kingdom is an everlasting kingdom, and all dominions shall serve and obey him.* When the eagle vanishes and the earth is refreshed (2 Esdras 11:46), the dominion passes to the saints of the Most High in Daniel''s everlasting kingdom.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2esd11_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2esd11_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-11-eagle-from-the-sea',
       E'The eagle out of the sea — the fourth beast',
       E'Ezra dreams: *Then saw I a dream, and, behold, there came up from the sea an eagle, which had twelve feathered wings, and three heads.* (2 Esdras 11:1) It ain''t new — Daniel had already seen the four beasts rise from the same waters: *And four great beasts came up from the sea, diverse one from another.* (Daniel 7:3) And John stood where Ezra stood: *And I stood upon the sand of the sea, and saw a beast rise up out of the sea, having seven heads and ten horns, and upon his horns ten crowns, and upon his heads the name of blasphemy.* (Revelation 13:1) The sea is the churning of the nations, and out of it comes the kingdom-of-man that wears the wings of empire.',
       sv.verse_id, ev.verse_id, 'extras', 63250
  FROM _session253_2esd11_lookup sv, _session253_2esd11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=11 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=11 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-11-reigned-over-all-the-earth',
       E'Subject to her — dominion over all the earth',
       E'The eagle''s reach is total: *And I saw that all things under heaven were subject to her, and no man spoke against her, no, not one creature upon earth.* (2 Esdras 11:6) Daniel said it of the fourth kingdom: *the fourth beast shall be the fourth kingdom upon earth, which shall be diverse from all kingdoms, and shall devour the whole earth, and shall tread it down, and break it in pieces.* (Daniel 7:23) And Revelation: *And it was given unto him to make war with the saints, and to overcome them: and power was given him over all kindreds, and tongues, and nations.* (Revelation 13:7) The empire claims the whole compass of the earth — but it is *given*, on a leash, and the Most High will call in the lease.',
       sv.verse_id, ev.verse_id, 'extras', 63253
  FROM _session253_2esd11_lookup sv, _session253_2esd11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=11 AND sv.verse_number=5
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=11 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-11-three-heads-seven-kings',
       E'The three heads and the wings — heads, horns, kings',
       E'The structure of the beast is counted out: *And there was no more upon the eagle''s body, but three heads that rested, and six little wings.* (2 Esdras 11:23) John''s angel decodes the same anatomy: *And here is the mind which hath wisdom. The seven heads are seven mountains, on which the woman sitteth.* (Revelation 17:9) *And the ten horns which thou sawest are ten kings, which have received no kingdom as yet; but receive power as kings one hour with the beast.* (Revelation 17:12) Heads and wings, heads and horns — the apocalyptists count the kings of the kingdom-of-man system, each rising for its hour and passing away.',
       sv.verse_id, ev.verse_id, 'extras', 63256
  FROM _session253_2esd11_lookup sv, _session253_2esd11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=11 AND sv.verse_number=22
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=11 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-11-much-oppression',
       E'Much oppression — the head that put the earth in fear',
       E'The midmost head wakes and devours: *But this head put the whole earth in fear, and bare rule in it over all those that dwelt upon the earth with much oppression; and it had the governance of the world more than all the wings that had been.* (2 Esdras 11:32) Daniel saw this terror exactly: *After this I saw in the night visions, and behold a fourth beast, dreadful and terrible, and strong exceedingly; and it had great iron teeth: it devoured and brake in pieces, and stamped the residue with the feet of it: and it was diverse from all the beasts that were before it; and it had ten horns.* (Daniel 7:7) And the little horn that grows out of it speaks against the Most High: *And he shall speak great words against the El Elyon (most High), and shall wear out the saints of the El Elyon (most High), and think to change times and laws.* (Daniel 7:25) The system rules by fear and oppression — and that is precisely its indictment.',
       sv.verse_id, ev.verse_id, 'extras', 63259
  FROM _session253_2esd11_lookup sv, _session253_2esd11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=11 AND sv.verse_number=32
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=11 AND ev.verse_number=32
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-11-lion-out-of-the-wood',
       E'The roaring lion — the Lion of Judah judges the eagle',
       E'Against the eagle a deliverer rises: *And I beheld, and lo, as it were a roaring lion chased out of the wood: and I saw that he sent out a man''s voice to the eagle, and said,* (2 Esdras 11:37) *Hear you, I will talk with you, and the Highest shall say to you,* (2 Esdras 11:38) This Lion is the Messiah of 4 Ezra — the same Lion John sees enthroned to open the sealed book and bring the kingdom-of-man to judgment: *behold, the Lion of the tribe of Juda, the Root of David, hath prevailed to open the book, and to loose the seven seals thereof.* (Revelation 5:5) These shall make war with the Lamb — and the Lamb wins: *These shall make war with the Lamb, and the Lamb shall overcome them: for he is Lord of lords, and King of kings: and they that are with him are called, and chosen, and faithful.* (Revelation 17:14) The eagle terrifies the earth; the Lion speaks with a man''s voice and ends it.',
       sv.verse_id, ev.verse_id, 'extras', 63262
  FROM _session253_2esd11_lookup sv, _session253_2esd11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=11 AND sv.verse_number=37
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=11 AND ev.verse_number=38
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-11-fourth-beast-judged',
       E'Art not thou the fourth beast — judgment and refreshing',
       E'The Lion names the eagle plainly and pronounces its end: *Art not you it that remainest of the four beasts, whom I made to reign in my world, that the end of their times might come through them?* (2 Esdras 11:39) Daniel had already seen the dominion stripped and given to the saints: *But the judgment shall sit, and they shall take away his dominion, to consume and to destroy it unto the end.* (Daniel 7:26) The eagle is told to vanish *that all the earth may be refreshed, and may return, being delivered from your violence, and that she may hope for the judgment and mercy of him that made her.* (2 Esdras 11:46) And the kingdom passes to the people of Elohim: *And the kingdom and dominion, and the greatness of the kingdom under the whole heaven, shall be given to the people of the saints of the El Elyon (most High), whose kingdom is an everlasting kingdom, and all dominions shall serve and obey him.* (Daniel 7:27) Dismantle the system — and the meek inherit the refreshed earth.',
       sv.verse_id, ev.verse_id, 'extras', 63265
  FROM _session253_2esd11_lookup sv, _session253_2esd11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=11 AND sv.verse_number=39
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=11 AND ev.verse_number=46
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-esdras-11-eagle-from-the-sea
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:3 — *And four great beasts came up from the sea, diverse one from another.* The eagle of 2 Esdras 11:1 rises from the same sea as Daniel''s four beasts, the same vision of empire reworked for Ezra.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd11_lookup sv, _session253_2esd11_lookup tv
 WHERE t.slug='2-esdras-11-eagle-from-the-sea'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=11 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 13:1 — *And I stood upon the sand of the sea, and saw a beast rise up out of the sea, having seven heads and ten horns, and upon his horns ten crowns, and upon his heads the name of blasphemy.* John''s beast and Ezra''s eagle both ascend from the sea, the kingdom-of-man surfacing out of the nations.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd11_lookup sv, _session253_2esd11_lookup tv
 WHERE t.slug='2-esdras-11-eagle-from-the-sea'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=11 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=13 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-11-reigned-over-all-the-earth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:23 — *Thus he said, The fourth beast shall be the fourth kingdom upon earth, which shall be diverse from all kingdoms, and shall devour the whole earth, and shall tread it down, and break it in pieces.* The eagle to whom all things under heaven are subject (2 Esdras 11:6) is Daniel''s whole-earth-devouring fourth kingdom.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd11_lookup sv, _session253_2esd11_lookup tv
 WHERE t.slug='2-esdras-11-reigned-over-all-the-earth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=11 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 13:7 — *And it was given unto him to make war with the saints, and to overcome them: and power was given him over all kindreds, and tongues, and nations.* The beast''s power over all nations matches the eagle whom no creature upon earth dares speak against (2 Esdras 11:6).'
  FROM cross_reference_threads t, cross_references x, _session253_2esd11_lookup sv, _session253_2esd11_lookup tv
 WHERE t.slug='2-esdras-11-reigned-over-all-the-earth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=11 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=13 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-11-three-heads-seven-kings
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 17:9 — *And here is the mind which hath wisdom. The seven heads are seven mountains, on which the woman sitteth.* The eagle''s three heads (2 Esdras 11:23) belong to the same head-counting apocalyptic that John''s angel reads as kings and mountains.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd11_lookup sv, _session253_2esd11_lookup tv
 WHERE t.slug='2-esdras-11-three-heads-seven-kings'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=11 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=17 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 17:12 — *And the ten horns which thou sawest are ten kings, which have received no kingdom as yet; but receive power as kings one hour with the beast.* The eagle''s wings that rise and reign and appear no more (2 Esdras 11:23) are the same short-lived kings John numbers as the ten horns.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd11_lookup sv, _session253_2esd11_lookup tv
 WHERE t.slug='2-esdras-11-three-heads-seven-kings'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=11 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=17 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-11-much-oppression
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:7 — *After this I saw in the night visions, and behold a fourth beast, dreadful and terrible, and strong exceedingly; and it had great iron teeth: it devoured and brake in pieces, and stamped the residue with the feet of it: and it was diverse from all the beasts that were before it; and it had ten horns.* The head that put the whole earth in fear (2 Esdras 11:32) is Daniel''s dreadful fourth beast that devours and tramples.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd11_lookup sv, _session253_2esd11_lookup tv
 WHERE t.slug='2-esdras-11-much-oppression'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=11 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:25 — *And he shall speak great words against the El Elyon (most High), and shall wear out the saints of the El Elyon (most High), and think to change times and laws: and they shall be given into his hand until a time and times and the dividing of time.* The head ruling with much oppression (2 Esdras 11:32) wears the face of Daniel''s little horn that grinds the saints and presumes to change the times and law.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd11_lookup sv, _session253_2esd11_lookup tv
 WHERE t.slug='2-esdras-11-much-oppression'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=11 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-11-lion-out-of-the-wood
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 5:5 — *And one of the elders saith unto me, Weep not: behold, the Lion of the tribe of Juda, the Root of David, hath prevailed to open the book, and to loose the seven seals thereof.* The roaring lion who sends a man''s voice against the eagle (2 Esdras 11:37) is the Messiah-Lion of Judah, Yahusha enthroned to judge the kingdom-of-man.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd11_lookup sv, _session253_2esd11_lookup tv
 WHERE t.slug='2-esdras-11-lion-out-of-the-wood'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=11 AND sv.verse_number=37
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=5 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 17:14 — *These shall make war with the Lamb, and the Lamb shall overcome them: for he is Lord of lords, and King of kings: and they that are with him are called, and chosen, and faithful.* The Lion who confronts the eagle (2 Esdras 11:37) overthrows the beast-system just as the Lamb overcomes the kings who war against him.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd11_lookup sv, _session253_2esd11_lookup tv
 WHERE t.slug='2-esdras-11-lion-out-of-the-wood'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=11 AND sv.verse_number=37
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=17 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-11-fourth-beast-judged
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:26 — *But the judgment shall sit, and they shall take away his dominion, to consume and to destroy it unto the end.* The Lion''s verdict that the fourth beast''s time ends through it (2 Esdras 11:39) is Daniel''s seated judgment stripping the beast of its dominion.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd11_lookup sv, _session253_2esd11_lookup tv
 WHERE t.slug='2-esdras-11-fourth-beast-judged'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=11 AND sv.verse_number=39
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:27 — *And the kingdom and dominion, and the greatness of the kingdom under the whole heaven, shall be given to the people of the saints of the El Elyon (most High), whose kingdom is an everlasting kingdom, and all dominions shall serve and obey him.* When the eagle vanishes and the earth is refreshed (2 Esdras 11:46), the dominion passes to the saints of the Most High in Daniel''s everlasting kingdom.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd11_lookup sv, _session253_2esd11_lookup tv
 WHERE t.slug='2-esdras-11-fourth-beast-judged'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=11 AND sv.verse_number=46
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

