-- ----- fragment: minion_apocalypseofabraham_29.sql (session253 apocalypse-of-abraham 29) -----
-- Source anchor: apocalypse-of-abraham/apocalypse-of-abraham ch29. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: aoa29 (view _session253_aoa29_lookup). Sort band base 67700, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_aoa29_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: apocalypse-of-abraham-29-the-twelfth-hour-of-the-age
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 29, 3, 'canon', 'daniel', 7, 12, 'free', E'Daniel 7:12 — *As concerning the rest of the beasts, they had their dominion taken away: yet their lives were prolonged for a season and time.* As the ungodly Age is ordained to rule only for a measured span among the heathen, so Daniel''s beasts hold dominion only for a season and time before it is taken away (apocalypse-of-abraham 29:3).'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 29, 3, 'canon', 'daniel', 7, 14, 'free', E'Daniel 7:14 — *And there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him: his dominion is an everlasting dominion, which shall not pass away, and his kingdom that which shall not be destroyed.* The end of the twelve-hour Age is the handing of the everlasting, indestructible kingdom to the Son of Adam, the rule the heathen Age could only counterfeit for a season (apocalypse-of-abraham 29:3).'),
  -- thread: apocalypse-of-abraham-29-the-man-insulted-and-worshipped
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 29, 6, 'canon', 'isaiah', 53, 3, 'free', E'Isaiah 53:3 — *He is despised and rejected of men; a man of sorrows, and acquainted with grief: and we hid as it were our faces from him; he was despised, and we esteemed him not.* Abraham''s vision of the man insulted and struck by his own is the same despised and rejected one Isaiah set before Israel''s seed (apocalypse-of-abraham 29:6).'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 29, 6, 'canon', 'psalms', 22, 7, 'free', E'Psalm 22:7 — *All they that see me laugh me to scorn: they shoot out the lip, they shake the head, saying.* The insulting and striking that Abraham watches fall on the man is the very scorn of the watching crowd in the Psalm of the pierced one (apocalypse-of-abraham 29:6).'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 29, 13, 'canon', 'matthew', 24, 10, 'free', E'Matthew 24:10 — *And then shall many be offended, and shall betray one another, and shall hate one another.* That many of Abraham''s own seed shall be offended at the man matches Messiah''s word that in the last days many shall be offended (apocalypse-of-abraham 29:13).'),
  -- thread: apocalypse-of-abraham-29-azazel-bows-down
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 29, 7, 'enoch', '1-enoch', 10, 4, 'extras', E'1 Enoch 10:4 — *And again Yahuah (God) said to Raphael: ''Bind Azâzêl hand and foot, and cast him into the darkness: and make an opening in the desert, which is in Dûdâêl, and cast him therein.* The Azazel who runs and kisses the man''s face in Abraham''s vision is the same fallen chief whom the LORD bound and cast into the desert-darkness for judgment (apocalypse-of-abraham 29:7).'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 29, 7, 'enoch', '1-enoch', 10, 8, 'extras', E'1 Enoch 10:8 — *And the whole earth has been corrupted through the works that were taught by Azâzêl: to him ascribe all sin.''* The Azazel whose false homage Abraham sees is the one to whom all sin is ascribed, the corrupter of the whole earth (apocalypse-of-abraham 29:7).'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 29, 7, 'canon', 'leviticus', 16, 10, 'free', E'Leviticus 16:10 — *But the goat, on which the lot fell to be the scapegoat, shall be presented alive before Yahuah (LORD), to make an atonement with him, and to let him go for a scapegoat into the wilderness.* Azazel, who turns and stands behind the man, bears the name of the scapegoat-lot sent out into the wilderness on the Day of Atonement (apocalypse-of-abraham 29:7).'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 29, 7, 'canon', 'jude', 1, 6, 'free', E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Azazel''s false worship is the homage of a fallen angel already reserved in chains of darkness for the great day of judgment (apocalypse-of-abraham 29:7).'),
  -- thread: apocalypse-of-abraham-29-the-right-side-and-the-left
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 29, 13, 'canon', 'genesis', 25, 23, 'free', E'Genesis 25:23 — *And Yahuah (LORD) said unto her, Two nations are in thy womb, and two manner of people shall be separated from thy bowels; and the one people shall be stronger than the other people; and the elder shall serve the younger.* The left side of the heathen and the right side of Abraham''s seed are the two manner of people divided since the womb of Rebekah (apocalypse-of-abraham 29:13).'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 29, 13, 'canon', 'deuteronomy', 30, 15, 'free', E'Deuteronomy 30:15 — *See, I have set before thee this day life and good, and death and evil.* The vision''s two sides, the right and the left, set the same two ways before the seed that Moses set before Israel (apocalypse-of-abraham 29:13).'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 29, 12, 'canon', 'isaiah', 11, 10, 'free', E'Isaiah 11:10 — *And in that day there shall be a root of Jesse, which shall stand for an ensign of the people; to it shall the Gentiles seek: and his rest shall be glorious.* The man set up from Abraham''s generation whom many of the heathen follow is the ensign of Jesse to whom the Gentiles seek (apocalypse-of-abraham 29:12).'),
  -- thread: apocalypse-of-abraham-29-ten-plagues-judgment-on-the-heathen
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 29, 14, 'canon', 'matthew', 24, 22, 'free', E'Matthew 24:22 — *And except those days should be shortened, there should no flesh be saved: but for the elect''s sake those days shall be shortened.* The shortening of the Age of ungodliness for the sake of those who worshipped of Abraham''s seed is the very shortening of days for the elect''s sake (apocalypse-of-abraham 29:14).'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 29, 15, 'canon', 'joel', 3, 2, 'free', E'Joel 3:2 — *I will also gather all nations, and will bring them down into the valley of Jehoshaphat, and will plead with them there for my people and for my heritage Yashar''el (Israel), whom they have scattered among the nations, and parted my land.* The judgment that comes upon the lawless heathen through the separated seed is the LORD''s pleading with the nations for His scattered heritage (apocalypse-of-abraham 29:15).'),
  -- thread: apocalypse-of-abraham-29-the-remnant-gathered-to-the-prepared-place
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 29, 18, 'canon', 'isaiah', 27, 13, 'free', E'Isaiah 27:13 — *And it shall come to pass in that day, that the great trumpet shall be blown, and they shall come which were ready to perish in the land of Assyria, and the outcasts in the land of Egypt, and shall worship Yahuah (LORD) in the holy mount at Jerusalem.* The righteous of Abraham''s seed left and hastening to the prepared place are the outcasts gathered at the great trumpet to worship in the holy mount (apocalypse-of-abraham 29:18).'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 29, 18, 'canon', 'isaiah', 11, 11, 'free', E'Isaiah 11:11 — *And it shall come to pass in that day, that Yahuah (Lord) shall set his hand again the second time to recover the remnant of his people, which shall be left, from Assyria, and from Egypt, and from Pathros, and from Cush, and from Elam, and from Shinar, and from Hamath, and from the islands of the sea.* The righteous of the seed left in the secret number are the two-house remnant the LORD recovers the second time (apocalypse-of-abraham 29:18).'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 29, 18, 'canon', 'matthew', 24, 31, 'free', E'Matthew 24:31 — *And he shall send his angels with a great sound of a trumpet, and they shall gather together his elect from the four winds, from one end of heaven to the other.* The hastening of the kept seed to the prepared place is the gathering of the elect by the angels at the great trumpet (apocalypse-of-abraham 29:18).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_aoa29_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_aoa29_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-29-the-twelfth-hour-of-the-age',
       E'The Twelfth Hour of the Age of Ungodliness',
       E'Abraham asks the measure of the times, and the Eternal answers: *Twelve years have I ordained of this ungodly Age to rule among the heathen and in thy seed; and until the end of the times it shall be as thou sawest.* It ain''t new — the apportioned hours of the Age, the rule of the heathen suffered for a season before judgment, is the same reckoning Daniel beheld: *As concerning the rest of the beasts, they had their dominion taken away: yet their lives were prolonged for a season and time* (Daniel 7:12). And the End that the hour points toward is the Son of Adam taking the everlasting kingdom: *And there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him: his dominion is an everlasting dominion, which shall not pass away, and his kingdom that which shall not be destroyed* (Daniel 7:14). The twelfth hour is not the heathen''s triumph but the boundary of the appointed time.',
       sv.verse_id, ev.verse_id, 'extras', 67700
  FROM _session253_aoa29_lookup sv, _session253_aoa29_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=29 AND sv.verse_number=2
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=29 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-29-the-man-insulted-and-worshipped',
       E'The Man Insulted and Beaten and Worshipped',
       E'Abraham sees a man who is at once reviled and adored: *And while I still looked, there came out from the right side many, and some insulted that man, while some struck him; others, however, worshipped him.* It ain''t new — Isaiah long before set this very figure before the eyes of the seed: *He is despised and rejected of men; a man of sorrows, and acquainted with grief: and we hid as it were our faces from him; he was despised, and we esteemed him not* (Isaiah 53:3). And the Psalm of the pierced one shows the same scorn from the watching crowd: *All they that see me laugh me to scorn: they shoot out the lip, they shake the head, saying* (Psalm 22:7). The man set up from Abraham''s generation, *whom thou sawest issue from my people*, is the despised-yet-followed one — and many of his own seed are *offended at him*, even as Messiah foretold: *And then shall many be offended, and shall betray one another, and shall hate one another* (Matthew 24:10).',
       sv.verse_id, ev.verse_id, 'extras', 67703
  FROM _session253_aoa29_lookup sv, _session253_aoa29_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=29 AND sv.verse_number=6
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=29 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-29-azazel-bows-down',
       E'Azazel Runs and Worships',
       E'The vision turns sinister: *And I saw how these worshipped him, and Azazel ran and worshipped him, and, having kissed his face, he turned and stood behind him.* It ain''t new — Azazel is the chief of the fallen Watchers whom the LORD bound at the dawn of judgment: *And again Yahuah (God) said to Raphael: ''Bind Azâzêl hand and foot, and cast him into the darkness: and make an opening in the desert, which is in Dûdâêl, and cast him therein* (1 Enoch 10:4), the one to whom all sin is ascribed: *And the whole earth has been corrupted through the works that were taught by Azâzêl: to him ascribe all sin.''* (1 Enoch 10:8). He is the goat sent out in the Day of Atonement, separated unto the wilderness: *But the goat, on which the lot fell to be the scapegoat, shall be presented alive before Yahuah (LORD), to make an atonement with him, and to let him go for a scapegoat into the wilderness* (Leviticus 16:10). His kiss and false worship is the homage of the fallen one reserved for judgment: *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day* (Jude 1:6).',
       sv.verse_id, ev.verse_id, 'extras', 67706
  FROM _session253_aoa29_lookup sv, _session253_aoa29_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=29 AND sv.verse_number=7
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=29 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-29-the-right-side-and-the-left',
       E'The Two Peoples, the Right and the Left',
       E'The picture is divided: a man going out *from the left side of the heathen* drawing the hosts of the nations, and the seed of Abraham *on the right side*. The Eternal interprets: *And those whom thou sawest emerge from the left side of the picture — the meaning is: there shall be many from the heathen who set their hopes upon him.* It ain''t new — the two peoples were divided in Rebekah''s womb: *And Yahuah (LORD) said unto her, Two nations are in thy womb, and two manner of people shall be separated from thy bowels; and the one people shall be stronger than the other people; and the elder shall serve the younger* (Genesis 25:23). The right hand is the place of the elect at the gathering: the Son of Adam *shall set the sheep on his right hand, but the goats on the left* is Yoshi''s same two-ways set before the seed by Moses — *See, I have set before thee this day life and good, and death and evil* (Deuteronomy 30:15). This is election of Abraham''s seed, the heathen brought in to set their hope upon the one issued from that seed — not a people replacing Israel, but the nations grafted to the right side.',
       sv.verse_id, ev.verse_id, 'extras', 67709
  FROM _session253_aoa29_lookup sv, _session253_aoa29_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=29 AND sv.verse_number=5
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=29 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-29-ten-plagues-judgment-on-the-heathen',
       E'The Ten Plagues and Judgment on the Lawless Heathen',
       E'Before the Age of the righteous can grow, judgment falls: *Before the Age of the righteous beginneth to grow, my judgement shall come upon the lawless heathen through the people of thy seed who have been separated for me.* And the means is plagues: *In those days I will bring upon all creatures of the earth ten plagues, through misfortune and disease and sighing of the grief of their soul.* It ain''t new — the days are shortened for the elect''s sake, just as Messiah foretold: *And except those days should be shortened, there should no flesh be saved: but for the elect''s sake those days shall be shortened* (Matthew 24:22). The judgment is upon all nations gathered, pled for the sake of the scattered seed: *I will also gather all nations, and will bring them down into the valley of Jehoshaphat, and will plead with them there for my people and for my heritage Yashar''el (Israel), whom they have scattered among the nations, and parted my land* (Joel 3:2). The separated seed, kept secret in number, is the channel of the LORD''s reckoning upon the lawless.',
       sv.verse_id, ev.verse_id, 'extras', 67712
  FROM _session253_aoa29_lookup sv, _session253_aoa29_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=29 AND sv.verse_number=14
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=29 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-29-the-remnant-gathered-to-the-prepared-place',
       E'The Righteous Remnant Gathered to the Place Prepared',
       E'The vision closes with the kept seed: *And then shall righteous men of thy seed be left, in the number which is kept secret by me, hastening in the glory of My Name to the place prepared beforehand for them, which thou sawest devastated in the picture; and they shall live and be established through sacrifices and gifts of righteousness and truth in the Age of the righteous.* It ain''t new — the remnant left, gathered one by one at the trumpet, is the prophets'' own hope: *And it shall come to pass in that day, that the great trumpet shall be blown, and they shall come which were ready to perish in the land of Assyria, and the outcasts in the land of Egypt, and shall worship Yahuah (LORD) in the holy mount at Jerusalem* (Isaiah 27:13). It is the second-time recovery of the two-house remnant: *And it shall come to pass in that day, that Yahuah (Lord) shall set his hand again the second time to recover the remnant of his people, which shall be left* (Isaiah 11:11). The Son of Adam gathers His elect from the four winds at the great trumpet: *And he shall send his angels with a great sound of a trumpet, and they shall gather together his elect from the four winds, from one end of heaven to the other* (Matthew 24:31). The devastated place is restored, the seed established with the sacrifices of righteousness.',
       sv.verse_id, ev.verse_id, 'extras', 67715
  FROM _session253_aoa29_lookup sv, _session253_aoa29_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=29 AND sv.verse_number=18
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=29 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: apocalypse-of-abraham-29-the-twelfth-hour-of-the-age
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:12 — *As concerning the rest of the beasts, they had their dominion taken away: yet their lives were prolonged for a season and time.* As the ungodly Age is ordained to rule only for a measured span among the heathen, so Daniel''s beasts hold dominion only for a season and time before it is taken away (apocalypse-of-abraham 29:3).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa29_lookup sv, _session253_aoa29_lookup tv
 WHERE t.slug='apocalypse-of-abraham-29-the-twelfth-hour-of-the-age'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=29 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:14 — *And there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him: his dominion is an everlasting dominion, which shall not pass away, and his kingdom that which shall not be destroyed.* The end of the twelve-hour Age is the handing of the everlasting, indestructible kingdom to the Son of Adam, the rule the heathen Age could only counterfeit for a season (apocalypse-of-abraham 29:3).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa29_lookup sv, _session253_aoa29_lookup tv
 WHERE t.slug='apocalypse-of-abraham-29-the-twelfth-hour-of-the-age'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=29 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-29-the-man-insulted-and-worshipped
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 53:3 — *He is despised and rejected of men; a man of sorrows, and acquainted with grief: and we hid as it were our faces from him; he was despised, and we esteemed him not.* Abraham''s vision of the man insulted and struck by his own is the same despised and rejected one Isaiah set before Israel''s seed (apocalypse-of-abraham 29:6).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa29_lookup sv, _session253_aoa29_lookup tv
 WHERE t.slug='apocalypse-of-abraham-29-the-man-insulted-and-worshipped'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=29 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 22:7 — *All they that see me laugh me to scorn: they shoot out the lip, they shake the head, saying.* The insulting and striking that Abraham watches fall on the man is the very scorn of the watching crowd in the Psalm of the pierced one (apocalypse-of-abraham 29:6).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa29_lookup sv, _session253_aoa29_lookup tv
 WHERE t.slug='apocalypse-of-abraham-29-the-man-insulted-and-worshipped'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=29 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=22 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 24:10 — *And then shall many be offended, and shall betray one another, and shall hate one another.* That many of Abraham''s own seed shall be offended at the man matches Messiah''s word that in the last days many shall be offended (apocalypse-of-abraham 29:13).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa29_lookup sv, _session253_aoa29_lookup tv
 WHERE t.slug='apocalypse-of-abraham-29-the-man-insulted-and-worshipped'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=29 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-29-azazel-bows-down
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 10:4 — *And again Yahuah (God) said to Raphael: ''Bind Azâzêl hand and foot, and cast him into the darkness: and make an opening in the desert, which is in Dûdâêl, and cast him therein.* The Azazel who runs and kisses the man''s face in Abraham''s vision is the same fallen chief whom the LORD bound and cast into the desert-darkness for judgment (apocalypse-of-abraham 29:7).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa29_lookup sv, _session253_aoa29_lookup tv
 WHERE t.slug='apocalypse-of-abraham-29-azazel-bows-down'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=29 AND sv.verse_number=7
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 10:8 — *And the whole earth has been corrupted through the works that were taught by Azâzêl: to him ascribe all sin.''* The Azazel whose false homage Abraham sees is the one to whom all sin is ascribed, the corrupter of the whole earth (apocalypse-of-abraham 29:7).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa29_lookup sv, _session253_aoa29_lookup tv
 WHERE t.slug='apocalypse-of-abraham-29-azazel-bows-down'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=29 AND sv.verse_number=7
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 16:10 — *But the goat, on which the lot fell to be the scapegoat, shall be presented alive before Yahuah (LORD), to make an atonement with him, and to let him go for a scapegoat into the wilderness.* Azazel, who turns and stands behind the man, bears the name of the scapegoat-lot sent out into the wilderness on the Day of Atonement (apocalypse-of-abraham 29:7).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa29_lookup sv, _session253_aoa29_lookup tv
 WHERE t.slug='apocalypse-of-abraham-29-azazel-bows-down'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=29 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=16 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Azazel''s false worship is the homage of a fallen angel already reserved in chains of darkness for the great day of judgment (apocalypse-of-abraham 29:7).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa29_lookup sv, _session253_aoa29_lookup tv
 WHERE t.slug='apocalypse-of-abraham-29-azazel-bows-down'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=29 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-29-the-right-side-and-the-left
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 25:23 — *And Yahuah (LORD) said unto her, Two nations are in thy womb, and two manner of people shall be separated from thy bowels; and the one people shall be stronger than the other people; and the elder shall serve the younger.* The left side of the heathen and the right side of Abraham''s seed are the two manner of people divided since the womb of Rebekah (apocalypse-of-abraham 29:13).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa29_lookup sv, _session253_aoa29_lookup tv
 WHERE t.slug='apocalypse-of-abraham-29-the-right-side-and-the-left'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=29 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=25 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 30:15 — *See, I have set before thee this day life and good, and death and evil.* The vision''s two sides, the right and the left, set the same two ways before the seed that Moses set before Israel (apocalypse-of-abraham 29:13).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa29_lookup sv, _session253_aoa29_lookup tv
 WHERE t.slug='apocalypse-of-abraham-29-the-right-side-and-the-left'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=29 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 11:10 — *And in that day there shall be a root of Jesse, which shall stand for an ensign of the people; to it shall the Gentiles seek: and his rest shall be glorious.* The man set up from Abraham''s generation whom many of the heathen follow is the ensign of Jesse to whom the Gentiles seek (apocalypse-of-abraham 29:12).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa29_lookup sv, _session253_aoa29_lookup tv
 WHERE t.slug='apocalypse-of-abraham-29-the-right-side-and-the-left'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=29 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-29-ten-plagues-judgment-on-the-heathen
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 24:22 — *And except those days should be shortened, there should no flesh be saved: but for the elect''s sake those days shall be shortened.* The shortening of the Age of ungodliness for the sake of those who worshipped of Abraham''s seed is the very shortening of days for the elect''s sake (apocalypse-of-abraham 29:14).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa29_lookup sv, _session253_aoa29_lookup tv
 WHERE t.slug='apocalypse-of-abraham-29-ten-plagues-judgment-on-the-heathen'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=29 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joel 3:2 — *I will also gather all nations, and will bring them down into the valley of Jehoshaphat, and will plead with them there for my people and for my heritage Yashar''el (Israel), whom they have scattered among the nations, and parted my land.* The judgment that comes upon the lawless heathen through the separated seed is the LORD''s pleading with the nations for His scattered heritage (apocalypse-of-abraham 29:15).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa29_lookup sv, _session253_aoa29_lookup tv
 WHERE t.slug='apocalypse-of-abraham-29-ten-plagues-judgment-on-the-heathen'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=29 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=3 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-29-the-remnant-gathered-to-the-prepared-place
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 27:13 — *And it shall come to pass in that day, that the great trumpet shall be blown, and they shall come which were ready to perish in the land of Assyria, and the outcasts in the land of Egypt, and shall worship Yahuah (LORD) in the holy mount at Jerusalem.* The righteous of Abraham''s seed left and hastening to the prepared place are the outcasts gathered at the great trumpet to worship in the holy mount (apocalypse-of-abraham 29:18).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa29_lookup sv, _session253_aoa29_lookup tv
 WHERE t.slug='apocalypse-of-abraham-29-the-remnant-gathered-to-the-prepared-place'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=29 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=27 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 11:11 — *And it shall come to pass in that day, that Yahuah (Lord) shall set his hand again the second time to recover the remnant of his people, which shall be left, from Assyria, and from Egypt, and from Pathros, and from Cush, and from Elam, and from Shinar, and from Hamath, and from the islands of the sea.* The righteous of the seed left in the secret number are the two-house remnant the LORD recovers the second time (apocalypse-of-abraham 29:18).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa29_lookup sv, _session253_aoa29_lookup tv
 WHERE t.slug='apocalypse-of-abraham-29-the-remnant-gathered-to-the-prepared-place'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=29 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 24:31 — *And he shall send his angels with a great sound of a trumpet, and they shall gather together his elect from the four winds, from one end of heaven to the other.* The hastening of the kept seed to the prepared place is the gathering of the elect by the angels at the great trumpet (apocalypse-of-abraham 29:18).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa29_lookup sv, _session253_aoa29_lookup tv
 WHERE t.slug='apocalypse-of-abraham-29-the-remnant-gathered-to-the-prepared-place'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=29 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

