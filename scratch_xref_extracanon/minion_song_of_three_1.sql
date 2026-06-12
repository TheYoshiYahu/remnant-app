-- ----- fragment: minion_thesongofthethreeholychildren_01.sql (session253 the-song-of-the-three-holy-children 1) -----
-- Source anchor: apocrypha/the-song-of-the-three-holy-children ch1. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: sng1 (view _session253_sng1_lookup). Sort band base 61000, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_sng1_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: song-of-three-1-azariah-confession
  ('apocrypha', 'the-song-of-the-three-holy-children', 1, 4, 'canon', 'daniel', 9, 4, 'free', E'Daniel 9:4 — *And I prayed unto Yahuah Elohai (the LORD my God), and made my confession, and said, O Yahuah (Lord), the great and dreadful Elohim (God), keeping the covenant and mercy to them that love him, and to them that keep his commandments;* Azariah blesses the same covenant-keeping LORD that Daniel addresses in his confession (Song of the Three 1:4).'),
  ('apocrypha', 'the-song-of-the-three-holy-children', 1, 6, 'canon', 'daniel', 9, 5, 'free', E'Daniel 9:5 — *We have sinned, and have committed iniquity, and have done wickedly, and have rebelled, even by departing from thy precepts and from thy judgments:* Azariah''s confession of sin and departing is word-for-word the burden of Daniel''s prayer (Song of the Three 1:6).'),
  ('apocrypha', 'the-song-of-the-three-holy-children', 1, 5, 'canon', 'daniel', 9, 7, 'free', E'Daniel 9:7 — *O Yahuah (Lord), righteousness belongeth unto thee, but unto us confusion of faces, as at this day; to the men of Yahudah (Judah), and to the inhabitants of Jerusalem...* Azariah likewise owns the LORD''s true judgment upon Jerusalem because of their sins (Song of the Three 1:5).'),
  ('apocrypha', 'the-song-of-the-three-holy-children', 1, 7, 'canon', 'daniel', 9, 10, 'free', E'Daniel 9:10 — *Neither have we obeyed the voice of Yahuah Eloheinu (the LORD our God), to walk in his laws, which he set before us by his servants the prophets.* The same charge of not obeying the commandments stands at the heart of Azariah''s confession (Song of the Three 1:7).'),
  -- thread: song-of-three-1-disannul-not-thy-covenant
  ('apocrypha', 'the-song-of-the-three-holy-children', 1, 11, 'canon', 'leviticus', 26, 44, 'free', E'Leviticus 26:44 — *And yet for all that, when they be in the land of their enemies, I will not cast them away, neither will I abhor them, to destroy them utterly, and to break my covenant with them: for I am Yahuah (LORD) their Elohim (God).* Azariah pleads exactly this Torah promise that the covenant is not disannulled in exile (Song of the Three 1:11).'),
  ('apocrypha', 'the-song-of-the-three-holy-children', 1, 12, 'canon', 'leviticus', 26, 45, 'free', E'Leviticus 26:45 — *But I will for their sakes remember the covenant of their ancestors, whom I brought forth out of the land of Egypt in the sight of the heathen, that I might be their Elohim (God): I am Yahuah (LORD).* Azariah appeals to that same remembered covenant for Abraham, Isaac and Israel''s sake (Song of the Three 1:12).'),
  ('apocrypha', 'the-song-of-the-three-holy-children', 1, 11, 'canon', 'psalms', 79, 9, 'free', E'Psalm 79:9 — *Help us, O Elohim (God) of our salvation, for the glory of thy name: and deliver us, and purge away our sins, for thy name''s sake.* Asaph''s plea for deliverance "for thy name''s sake" is the very ground of Azariah''s appeal (Song of the Three 1:11).'),
  ('apocrypha', 'the-song-of-the-three-holy-children', 1, 13, 'canon', 'daniel', 9, 4, 'free', E'Daniel 9:4 — *...O Yahuah (Lord), the great and dreadful Elohim (God), keeping the covenant and mercy to them that love him, and to them that keep his commandments;* the multiplied seed of the fathers rests on this covenant-keeping LORD whom Azariah invokes (Song of the Three 1:13).'),
  -- thread: song-of-three-1-contrite-heart-sacrifice
  ('apocrypha', 'the-song-of-the-three-holy-children', 1, 18, 'canon', 'daniel', 9, 5, 'free', E'Daniel 9:5 — *We have sinned, and have committed iniquity, and have done wickedly, and have rebelled, even by departing from thy precepts and from thy judgments:* the contrite turning back to follow the LORD with the whole heart answers this confession of rebellion (Song of the Three 1:18).'),
  ('apocrypha', 'the-song-of-the-three-holy-children', 1, 16, 'canon', 'psalms', 79, 8, 'free', E'Psalm 79:8 — *O remember not against us former iniquities: let thy tender mercies speedily prevent us: for we are brought very low.* The humble and contrite spirit "brought very low" is the same posture Azariah brings as his accepted sacrifice (Song of the Three 1:16).'),
  ('apocrypha', 'the-song-of-the-three-holy-children', 1, 17, 'canon', 'psalms', 19, 1, 'free', E'Psalm 19:1 — *The heavens declare the glory of Elohim (God); and the firmament sheweth his handywork.* Even stripped of altar and incense, creation itself offers the praise Azariah longs to bring before the LORD (Song of the Three 1:17).'),
  -- thread: song-of-three-1-let-the-enemies-be-confounded
  ('apocrypha', 'the-song-of-the-three-holy-children', 1, 22, 'canon', 'daniel', 3, 29, 'free', E'Daniel 3:29 — *Therefore I make a decree, That every people, nation, and language, which speak any thing amiss against the Elohim (God) of Shadrach, Meshach, and Abed-nego, shall be cut in pieces... because there is no other Elohim (God) that can deliver after this sort.* The king is driven to confess what Azariah prayed — that Yahuah alone is God (Song of the Three 1:22).'),
  ('apocrypha', 'the-song-of-the-three-holy-children', 1, 22, 'canon', 'isaiah', 37, 16, 'free', E'Isaiah 37:16 — *O Yahuah Tseva''ot (LORD of hosts), Elohim (God) of Yashar''el (Israel), that dwellest between the cherubims, thou art the Elohim (God), even thou alone, of all the kingdoms of the earth: thou hast made heaven and earth.* Hezekiah''s prayer over Assyria confesses the same "thou alone" that Azariah prays over Babylon (Song of the Three 1:22).'),
  ('apocrypha', 'the-song-of-the-three-holy-children', 1, 20, 'canon', 'psalms', 79, 9, 'free', E'Psalm 79:9 — *Help us, O Elohim (God) of our salvation, for the glory of thy name: and deliver us, and purge away our sins, for thy name''s sake.* Azariah''s plea to deliver and give glory to the Name echoes Asaph''s identical petition (Song of the Three 1:20).'),
  -- thread: song-of-three-1-fourth-like-the-son
  ('apocrypha', 'the-song-of-the-three-holy-children', 1, 27, 'canon', 'daniel', 3, 25, 'free', E'Daniel 3:25 — *He answered and said, Lo, I see four men loose, walking in the midst of the fire, and they have no hurt; and the form of the fourth is like the Son of Elohim (God).* What the Song reports from within the oven — the fire touching them not at all — Nebuchadnezzar sees as the unhurt four with the fourth like the Son (Song of the Three 1:27).'),
  ('apocrypha', 'the-song-of-the-three-holy-children', 1, 26, 'canon', 'daniel', 3, 28, 'free', E'Daniel 3:28 — *...Blessed be the Elohim (God) of Shadrach, Meshach, and Abed-nego, who hath sent his angel, and delivered his servants that trusted in him...* The angel of the LORD who came down into the oven in the Song is the very angel Nebuchadnezzar confesses was sent (Song of the Three 1:26).'),
  ('apocrypha', 'the-song-of-the-three-holy-children', 1, 27, 'canon', 'isaiah', 43, 2, 'free', E'Isaiah 43:2 — *When thou passest through the waters, I will be with thee... when thou walkest through the fire, thou shalt not be burned; neither shall the flame kindle upon thee.* The LORD''s covenant promise to Israel is fulfilled in the moist whistling wind that left the three untouched (Song of the Three 1:27).'),
  -- thread: song-of-three-1-benedicite-all-works-bless
  ('apocrypha', 'the-song-of-the-three-holy-children', 1, 35, 'canon', 'psalms', 103, 22, 'free', E'Psalm 103:22 — *Bless Yahuah (LORD), all his works in all places of his dominion: bless Yahuah (LORD), O my soul.* David''s summons of all the LORD''s works is the very opening of the Benedicite (Song of the Three 1:35).'),
  ('apocrypha', 'the-song-of-the-three-holy-children', 1, 40, 'canon', 'psalms', 148, 3, 'free', E'Psalm 148:3 — *Praise ye him, sun and moon: praise him, all ye stars of light.* The Song calls sun, moon and stars to bless the LORD in the same order as the Hallel (Song of the Three 1:40).'),
  ('apocrypha', 'the-song-of-the-three-holy-children', 1, 44, 'canon', 'psalms', 148, 8, 'free', E'Psalm 148:8 — *Fire, and hail; snow, and vapour; stormy wind fulfilling his word:* the very fire and heat the three call to bless the LORD is bidden to praise Him in the Psalm (Song of the Three 1:44).'),
  ('apocrypha', 'the-song-of-the-three-holy-children', 1, 36, 'canon', 'psalms', 148, 1, 'free', E'Psalm 148:1 — *Praise ye Yahuah (LORD). Praise ye Yahuah (LORD) from the heavens: praise him in the heights.* The Benedicite begins its descent from the heavens exactly as the Hallel does (Song of the Three 1:36).'),
  -- thread: song-of-three-1-israel-priests-souls-bless
  ('apocrypha', 'the-song-of-the-three-holy-children', 1, 62, 'canon', 'psalms', 103, 21, 'free', E'Psalm 103:21 — *Bless ye Yahuah (LORD), all ye his hosts; ye ministers of his, that do his pleasure.* The priests and servants of the LORD called to bless Him answer David''s summons of His ministering hosts (Song of the Three 1:62).'),
  ('apocrypha', 'the-song-of-the-three-holy-children', 1, 67, 'canon', 'psalms', 136, 1, 'free', E'Psalm 136:1 — *O give thanks unto Yahuah (LORD); for he is good: for his mercy endureth for ever.* The Song''s closing refrain is the opening line of the Great Hallel, word for word (Song of the Three 1:67).'),
  ('apocrypha', 'the-song-of-the-three-holy-children', 1, 68, 'canon', 'psalms', 136, 26, 'free', E'Psalm 136:26 — *O give thanks unto the Elohim (God) of heaven: for his mercy endureth for ever.* The Song bids all that worship the God of gods give thanks with the same enduring-mercy refrain that closes Psalm 136 (Song of the Three 1:68).'),
  ('apocrypha', 'the-song-of-the-three-holy-children', 1, 64, 'canon', 'daniel', 12, 2, 'free', E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The spirits and souls of the righteous called to bless the LORD are those awaiting the awakening unto everlasting life (Song of the Three 1:64).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_sng1_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_sng1_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'song-of-three-1-azariah-confession',
       E'We have sinned — Azariah''s confession in the fire',
       E'Azariah''s prayer opens not with a plea for rescue but with the LORD''s righteousness owned in the flame: *Blessed art you, O Yahuah (God) of our fathers: your name is worthy to be praised and glorified for evermore* (Song of the Three 1:3), *For we have sinned and committed iniquity, departing from you* (Song of the Three 1:6), *In all things have we trespassed, and not obeyed your commandments, nor kept them* (Song of the Three 1:7). It ain''t new — this is Daniel''s own posture three chapters on, the same confession in the same Babylon: *O Yahuah (Lord), the great and dreadful Elohim (God), keeping the covenant and mercy to them that love him, and to them that keep his commandments* (Daniel 9:4), *We have sinned, and have committed iniquity, and have done wickedly, and have rebelled, even by departing from thy precepts* (Daniel 9:5). The mercy never depends on the worshipper''s worth but on the covenant the LORD swore.',
       sv.verse_id, ev.verse_id, 'extras', 61000
  FROM _session253_sng1_lookup sv, _session253_sng1_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-song-of-the-three-holy-children' AND sv.chapter_number=1 AND sv.verse_number=3
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-song-of-the-three-holy-children' AND ev.chapter_number=1 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'song-of-three-1-disannul-not-thy-covenant',
       E'Deliver us not up wholly — for thy Name''s sake and the covenant',
       E'The hinge of the prayer is not the prisoners'' merit but the oath sworn to the fathers: *Yet deliver us not up wholly, for your name''s sake, neither disannul you your covenant* (Song of the Three 1:11), *And cause not your mercy to depart from us, for your beloved Abraham''s sake, for your servant Issac''s sake, and for your holy Yashar''el (Israel)''s sake* (Song of the Three 1:12). This is Torah''s own promise that exile is never the end of Israel: *And yet for all that, when they be in the land of their enemies, I will not cast them away... to break my covenant with them* (Leviticus 26:44), *But I will for their sakes remember the covenant of their ancestors* (Leviticus 26:45). And it is Asaph''s plea: *Help us, O Elohim (God) of our salvation, for the glory of thy name: and deliver us... for thy name''s sake* (Psalm 79:9). The mercy is real and the seed is kept — never disannulled.',
       sv.verse_id, ev.verse_id, 'extras', 61003
  FROM _session253_sng1_lookup sv, _session253_sng1_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-song-of-the-three-holy-children' AND sv.chapter_number=1 AND sv.verse_number=11
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-song-of-the-three-holy-children' AND ev.chapter_number=1 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'song-of-three-1-contrite-heart-sacrifice',
       E'A contrite heart for a sacrifice — no temple, yet accepted',
       E'With no temple, no altar, no offering left, the three offer the only sacrifice exile cannot take: *Neither is there at this time prince, or prophet, or leader, or burnt offering, or sacrifice, or oblation, or incense, or place to sacrifice before you* (Song of the Three 1:15), *Nevertheless in a contrite heart and an humble spirit let us be accepted* (Song of the Three 1:16), *Like as in the burnt offerings of rams and bullocks... so let our sacrifice be in your sight this day* (Song of the Three 1:17). This is David''s discovery that the LORD desires the broken heart above the slain bull, and the worship of those who fear Him and seek His face. The Torah-faithful in the furnace bring the sacrifice the heathen king cannot burn away.',
       sv.verse_id, ev.verse_id, 'extras', 61006
  FROM _session253_sng1_lookup sv, _session253_sng1_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-song-of-the-three-holy-children' AND sv.chapter_number=1 AND sv.verse_number=15
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-song-of-the-three-holy-children' AND ev.chapter_number=1 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'song-of-three-1-let-the-enemies-be-confounded',
       E'Let the system of dead gods be confounded — Thou alone art LORD',
       E'The prayer ends turning the fire back on the idol-system itself — not against persons but against the lie that any other god reigns: *Deliver us also according to your marvellous works, and give glory to your name, O Yahuah (God): and let all them that do your servants hurt be ashamed* (Song of the Three 1:20), *And let them be confounded in all their power and might, and let their strength be broken* (Song of the Three 1:21), *And let them know that you are Yahuah (God), the only Yahuah (God), and glorious over the whole world* (Song of the Three 1:22). This is the very confession Nebuchadnezzar is forced to make over the furnace, and the LORD of hosts who alone is God of all the kingdoms of the earth.',
       sv.verse_id, ev.verse_id, 'extras', 61009
  FROM _session253_sng1_lookup sv, _session253_sng1_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-song-of-the-three-holy-children' AND sv.chapter_number=1 AND sv.verse_number=20
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-song-of-the-three-holy-children' AND ev.chapter_number=1 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'song-of-three-1-fourth-like-the-son',
       E'The angel in the furnace — the fire as a moist whistling wind',
       E'The narrative seam tells what Daniel 3 saw from outside: *But the angel of Yahuah (God) came down into the oven together with Azarias and his fellows, and struck the flame of the fire out of the oven* (Song of the Three 1:26), *And made the midst of the furnace as it had been a moist whistling wind, so that the fire touched them not at all, neither hurt nor troubled them* (Song of the Three 1:27). Outside the oven Nebuchadnezzar beheld the fourth figure: *Lo, I see four men loose, walking in the midst of the fire... and the form of the fourth is like the Son of Elohim (God)* (Daniel 3:25), and blessed *the Elohim (God) of Shadrach, Meshach, and Abed-nego, who hath sent his angel, and delivered his servants that trusted in him* (Daniel 3:28). It ain''t new — the LORD''s own promise to Israel: *when thou walkest through the fire, thou shalt not be burned; neither shall the flame kindle upon thee* (Isaiah 43:2).',
       sv.verse_id, ev.verse_id, 'extras', 61012
  FROM _session253_sng1_lookup sv, _session253_sng1_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-song-of-the-three-holy-children' AND sv.chapter_number=1 AND sv.verse_number=26
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-song-of-the-three-holy-children' AND ev.chapter_number=1 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'song-of-three-1-benedicite-all-works-bless',
       E'O all ye works of the LORD, bless ye the LORD — the Benedicite',
       E'From within the flame the three turn the furnace into a sanctuary and summon all creation to praise: *O all you works of Yahuah (God), bless you Yahuah (God): praise and exalt him above all for ever* (Song of the Three 1:35), *O you heavens, bless you Yahuah (God)* (Song of the Three 1:36), *O you sun and moon, bless you Yahuah (God)* (Song of the Three 1:40), *O you fire and heat, bless you Yahuah (God): praise and exalt him above all for ever* (Song of the Three 1:44). It ain''t new — this is the Hallel''s own roll-call of the cosmos: *Praise ye him, sun and moon: praise him, all ye stars of light* (Psalm 148:3), *Fire, and hail; snow, and vapour; stormy wind fulfilling his word* (Psalm 148:8), and David''s closing summons: *Bless Yahuah (LORD), all his works in all places of his dominion* (Psalm 103:22). The fire itself is bidden to bless the One who made it.',
       sv.verse_id, ev.verse_id, 'extras', 61015
  FROM _session253_sng1_lookup sv, _session253_sng1_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-song-of-the-three-holy-children' AND sv.chapter_number=1 AND sv.verse_number=35
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-song-of-the-three-holy-children' AND ev.chapter_number=1 AND ev.verse_number=51
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'song-of-three-1-israel-priests-souls-bless',
       E'O Israel, O priests, O souls of the righteous — bless ye the LORD',
       E'The Benedicite descends from the cosmos to the covenant people and the righteous dead: *O Yashar''el (Israel), bless you Yahuah (God): praise and exalt him above all for ever* (Song of the Three 1:61), *O you priests of Yahuah (God), bless you Yahuah (God)* (Song of the Three 1:62), *O you spirits and souls of the righteous, bless you Yahuah (God): praise and exalt him above all for ever* (Song of the Three 1:64). It ends on the refrain that anchors the whole Hallel: *O give thanks to Yahuah (God), because he is gracious: for his mercy endureth for ever* (Song of the Three 1:67). This is the angels and ministers of Psalm 103, the everlasting-mercy refrain of Psalm 136, and the souls of the righteous who, even in death, bless the LORD and rest in His hand.',
       sv.verse_id, ev.verse_id, 'extras', 61018
  FROM _session253_sng1_lookup sv, _session253_sng1_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-song-of-the-three-holy-children' AND sv.chapter_number=1 AND sv.verse_number=61
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-song-of-the-three-holy-children' AND ev.chapter_number=1 AND ev.verse_number=68
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: song-of-three-1-azariah-confession
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 9:4 — *And I prayed unto Yahuah Elohai (the LORD my God), and made my confession, and said, O Yahuah (Lord), the great and dreadful Elohim (God), keeping the covenant and mercy to them that love him, and to them that keep his commandments;* Azariah blesses the same covenant-keeping LORD that Daniel addresses in his confession (Song of the Three 1:4).'
  FROM cross_reference_threads t, cross_references x, _session253_sng1_lookup sv, _session253_sng1_lookup tv
 WHERE t.slug='song-of-three-1-azariah-confession'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-song-of-the-three-holy-children' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=9 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 9:5 — *We have sinned, and have committed iniquity, and have done wickedly, and have rebelled, even by departing from thy precepts and from thy judgments:* Azariah''s confession of sin and departing is word-for-word the burden of Daniel''s prayer (Song of the Three 1:6).'
  FROM cross_reference_threads t, cross_references x, _session253_sng1_lookup sv, _session253_sng1_lookup tv
 WHERE t.slug='song-of-three-1-azariah-confession'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-song-of-the-three-holy-children' AND sv.chapter_number=1 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=9 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 9:7 — *O Yahuah (Lord), righteousness belongeth unto thee, but unto us confusion of faces, as at this day; to the men of Yahudah (Judah), and to the inhabitants of Jerusalem...* Azariah likewise owns the LORD''s true judgment upon Jerusalem because of their sins (Song of the Three 1:5).'
  FROM cross_reference_threads t, cross_references x, _session253_sng1_lookup sv, _session253_sng1_lookup tv
 WHERE t.slug='song-of-three-1-azariah-confession'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-song-of-the-three-holy-children' AND sv.chapter_number=1 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=9 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Daniel 9:10 — *Neither have we obeyed the voice of Yahuah Eloheinu (the LORD our God), to walk in his laws, which he set before us by his servants the prophets.* The same charge of not obeying the commandments stands at the heart of Azariah''s confession (Song of the Three 1:7).'
  FROM cross_reference_threads t, cross_references x, _session253_sng1_lookup sv, _session253_sng1_lookup tv
 WHERE t.slug='song-of-three-1-azariah-confession'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-song-of-the-three-holy-children' AND sv.chapter_number=1 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=9 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: song-of-three-1-disannul-not-thy-covenant
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 26:44 — *And yet for all that, when they be in the land of their enemies, I will not cast them away, neither will I abhor them, to destroy them utterly, and to break my covenant with them: for I am Yahuah (LORD) their Elohim (God).* Azariah pleads exactly this Torah promise that the covenant is not disannulled in exile (Song of the Three 1:11).'
  FROM cross_reference_threads t, cross_references x, _session253_sng1_lookup sv, _session253_sng1_lookup tv
 WHERE t.slug='song-of-three-1-disannul-not-thy-covenant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-song-of-the-three-holy-children' AND sv.chapter_number=1 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 26:45 — *But I will for their sakes remember the covenant of their ancestors, whom I brought forth out of the land of Egypt in the sight of the heathen, that I might be their Elohim (God): I am Yahuah (LORD).* Azariah appeals to that same remembered covenant for Abraham, Isaac and Israel''s sake (Song of the Three 1:12).'
  FROM cross_reference_threads t, cross_references x, _session253_sng1_lookup sv, _session253_sng1_lookup tv
 WHERE t.slug='song-of-three-1-disannul-not-thy-covenant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-song-of-the-three-holy-children' AND sv.chapter_number=1 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=45
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 79:9 — *Help us, O Elohim (God) of our salvation, for the glory of thy name: and deliver us, and purge away our sins, for thy name''s sake.* Asaph''s plea for deliverance "for thy name''s sake" is the very ground of Azariah''s appeal (Song of the Three 1:11).'
  FROM cross_reference_threads t, cross_references x, _session253_sng1_lookup sv, _session253_sng1_lookup tv
 WHERE t.slug='song-of-three-1-disannul-not-thy-covenant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-song-of-the-three-holy-children' AND sv.chapter_number=1 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=79 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Daniel 9:4 — *...O Yahuah (Lord), the great and dreadful Elohim (God), keeping the covenant and mercy to them that love him, and to them that keep his commandments;* the multiplied seed of the fathers rests on this covenant-keeping LORD whom Azariah invokes (Song of the Three 1:13).'
  FROM cross_reference_threads t, cross_references x, _session253_sng1_lookup sv, _session253_sng1_lookup tv
 WHERE t.slug='song-of-three-1-disannul-not-thy-covenant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-song-of-the-three-holy-children' AND sv.chapter_number=1 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=9 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: song-of-three-1-contrite-heart-sacrifice
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 9:5 — *We have sinned, and have committed iniquity, and have done wickedly, and have rebelled, even by departing from thy precepts and from thy judgments:* the contrite turning back to follow the LORD with the whole heart answers this confession of rebellion (Song of the Three 1:18).'
  FROM cross_reference_threads t, cross_references x, _session253_sng1_lookup sv, _session253_sng1_lookup tv
 WHERE t.slug='song-of-three-1-contrite-heart-sacrifice'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-song-of-the-three-holy-children' AND sv.chapter_number=1 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=9 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 79:8 — *O remember not against us former iniquities: let thy tender mercies speedily prevent us: for we are brought very low.* The humble and contrite spirit "brought very low" is the same posture Azariah brings as his accepted sacrifice (Song of the Three 1:16).'
  FROM cross_reference_threads t, cross_references x, _session253_sng1_lookup sv, _session253_sng1_lookup tv
 WHERE t.slug='song-of-three-1-contrite-heart-sacrifice'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-song-of-the-three-holy-children' AND sv.chapter_number=1 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=79 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 19:1 — *The heavens declare the glory of Elohim (God); and the firmament sheweth his handywork.* Even stripped of altar and incense, creation itself offers the praise Azariah longs to bring before the LORD (Song of the Three 1:17).'
  FROM cross_reference_threads t, cross_references x, _session253_sng1_lookup sv, _session253_sng1_lookup tv
 WHERE t.slug='song-of-three-1-contrite-heart-sacrifice'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-song-of-the-three-holy-children' AND sv.chapter_number=1 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: song-of-three-1-let-the-enemies-be-confounded
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 3:29 — *Therefore I make a decree, That every people, nation, and language, which speak any thing amiss against the Elohim (God) of Shadrach, Meshach, and Abed-nego, shall be cut in pieces... because there is no other Elohim (God) that can deliver after this sort.* The king is driven to confess what Azariah prayed — that Yahuah alone is God (Song of the Three 1:22).'
  FROM cross_reference_threads t, cross_references x, _session253_sng1_lookup sv, _session253_sng1_lookup tv
 WHERE t.slug='song-of-three-1-let-the-enemies-be-confounded'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-song-of-the-three-holy-children' AND sv.chapter_number=1 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=3 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 37:16 — *O Yahuah Tseva''ot (LORD of hosts), Elohim (God) of Yashar''el (Israel), that dwellest between the cherubims, thou art the Elohim (God), even thou alone, of all the kingdoms of the earth: thou hast made heaven and earth.* Hezekiah''s prayer over Assyria confesses the same "thou alone" that Azariah prays over Babylon (Song of the Three 1:22).'
  FROM cross_reference_threads t, cross_references x, _session253_sng1_lookup sv, _session253_sng1_lookup tv
 WHERE t.slug='song-of-three-1-let-the-enemies-be-confounded'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-song-of-the-three-holy-children' AND sv.chapter_number=1 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=37 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 79:9 — *Help us, O Elohim (God) of our salvation, for the glory of thy name: and deliver us, and purge away our sins, for thy name''s sake.* Azariah''s plea to deliver and give glory to the Name echoes Asaph''s identical petition (Song of the Three 1:20).'
  FROM cross_reference_threads t, cross_references x, _session253_sng1_lookup sv, _session253_sng1_lookup tv
 WHERE t.slug='song-of-three-1-let-the-enemies-be-confounded'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-song-of-the-three-holy-children' AND sv.chapter_number=1 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=79 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: song-of-three-1-fourth-like-the-son
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 3:25 — *He answered and said, Lo, I see four men loose, walking in the midst of the fire, and they have no hurt; and the form of the fourth is like the Son of Elohim (God).* What the Song reports from within the oven — the fire touching them not at all — Nebuchadnezzar sees as the unhurt four with the fourth like the Son (Song of the Three 1:27).'
  FROM cross_reference_threads t, cross_references x, _session253_sng1_lookup sv, _session253_sng1_lookup tv
 WHERE t.slug='song-of-three-1-fourth-like-the-son'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-song-of-the-three-holy-children' AND sv.chapter_number=1 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=3 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 3:28 — *...Blessed be the Elohim (God) of Shadrach, Meshach, and Abed-nego, who hath sent his angel, and delivered his servants that trusted in him...* The angel of the LORD who came down into the oven in the Song is the very angel Nebuchadnezzar confesses was sent (Song of the Three 1:26).'
  FROM cross_reference_threads t, cross_references x, _session253_sng1_lookup sv, _session253_sng1_lookup tv
 WHERE t.slug='song-of-three-1-fourth-like-the-son'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-song-of-the-three-holy-children' AND sv.chapter_number=1 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=3 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 43:2 — *When thou passest through the waters, I will be with thee... when thou walkest through the fire, thou shalt not be burned; neither shall the flame kindle upon thee.* The LORD''s covenant promise to Israel is fulfilled in the moist whistling wind that left the three untouched (Song of the Three 1:27).'
  FROM cross_reference_threads t, cross_references x, _session253_sng1_lookup sv, _session253_sng1_lookup tv
 WHERE t.slug='song-of-three-1-fourth-like-the-son'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-song-of-the-three-holy-children' AND sv.chapter_number=1 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=43 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: song-of-three-1-benedicite-all-works-bless
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 103:22 — *Bless Yahuah (LORD), all his works in all places of his dominion: bless Yahuah (LORD), O my soul.* David''s summons of all the LORD''s works is the very opening of the Benedicite (Song of the Three 1:35).'
  FROM cross_reference_threads t, cross_references x, _session253_sng1_lookup sv, _session253_sng1_lookup tv
 WHERE t.slug='song-of-three-1-benedicite-all-works-bless'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-song-of-the-three-holy-children' AND sv.chapter_number=1 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=103 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 148:3 — *Praise ye him, sun and moon: praise him, all ye stars of light.* The Song calls sun, moon and stars to bless the LORD in the same order as the Hallel (Song of the Three 1:40).'
  FROM cross_reference_threads t, cross_references x, _session253_sng1_lookup sv, _session253_sng1_lookup tv
 WHERE t.slug='song-of-three-1-benedicite-all-works-bless'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-song-of-the-three-holy-children' AND sv.chapter_number=1 AND sv.verse_number=40
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=148 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 148:8 — *Fire, and hail; snow, and vapour; stormy wind fulfilling his word:* the very fire and heat the three call to bless the LORD is bidden to praise Him in the Psalm (Song of the Three 1:44).'
  FROM cross_reference_threads t, cross_references x, _session253_sng1_lookup sv, _session253_sng1_lookup tv
 WHERE t.slug='song-of-three-1-benedicite-all-works-bless'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-song-of-the-three-holy-children' AND sv.chapter_number=1 AND sv.verse_number=44
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=148 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 148:1 — *Praise ye Yahuah (LORD). Praise ye Yahuah (LORD) from the heavens: praise him in the heights.* The Benedicite begins its descent from the heavens exactly as the Hallel does (Song of the Three 1:36).'
  FROM cross_reference_threads t, cross_references x, _session253_sng1_lookup sv, _session253_sng1_lookup tv
 WHERE t.slug='song-of-three-1-benedicite-all-works-bless'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-song-of-the-three-holy-children' AND sv.chapter_number=1 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=148 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: song-of-three-1-israel-priests-souls-bless
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 103:21 — *Bless ye Yahuah (LORD), all ye his hosts; ye ministers of his, that do his pleasure.* The priests and servants of the LORD called to bless Him answer David''s summons of His ministering hosts (Song of the Three 1:62).'
  FROM cross_reference_threads t, cross_references x, _session253_sng1_lookup sv, _session253_sng1_lookup tv
 WHERE t.slug='song-of-three-1-israel-priests-souls-bless'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-song-of-the-three-holy-children' AND sv.chapter_number=1 AND sv.verse_number=62
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=103 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 136:1 — *O give thanks unto Yahuah (LORD); for he is good: for his mercy endureth for ever.* The Song''s closing refrain is the opening line of the Great Hallel, word for word (Song of the Three 1:67).'
  FROM cross_reference_threads t, cross_references x, _session253_sng1_lookup sv, _session253_sng1_lookup tv
 WHERE t.slug='song-of-three-1-israel-priests-souls-bless'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-song-of-the-three-holy-children' AND sv.chapter_number=1 AND sv.verse_number=67
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=136 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 136:26 — *O give thanks unto the Elohim (God) of heaven: for his mercy endureth for ever.* The Song bids all that worship the God of gods give thanks with the same enduring-mercy refrain that closes Psalm 136 (Song of the Three 1:68).'
  FROM cross_reference_threads t, cross_references x, _session253_sng1_lookup sv, _session253_sng1_lookup tv
 WHERE t.slug='song-of-three-1-israel-priests-souls-bless'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-song-of-the-three-holy-children' AND sv.chapter_number=1 AND sv.verse_number=68
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=136 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The spirits and souls of the righteous called to bless the LORD are those awaiting the awakening unto everlasting life (Song of the Three 1:64).'
  FROM cross_reference_threads t, cross_references x, _session253_sng1_lookup sv, _session253_sng1_lookup tv
 WHERE t.slug='song-of-three-1-israel-priests-souls-bless'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-song-of-the-three-holy-children' AND sv.chapter_number=1 AND sv.verse_number=64
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

