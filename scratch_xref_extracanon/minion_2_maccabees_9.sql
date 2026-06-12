-- ----- fragment: minion_2maccabees_09.sql (session253 2-maccabees 9) -----
-- Source anchor: apocrypha/2-maccabees ch9. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2mac9 (view _session253_2mac9_lookup). Sort band base 62200, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2mac9_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-maccabees-9-worm-spread-under-thee
  ('apocrypha', '2-maccabees', 9, 9, 'canon', 'isaiah', 14, 11, 'free', E'Isaiah 14:11 — *Thy pomp is brought down to the grave, and the noise of thy viols: the worm is spread under thee, and the worms cover thee.* The same worm that buries Babylon''s proud king crawls up out of Antiochus'' living flesh in 2 Maccabees 9:9.'),
  ('apocrypha', '2-maccabees', 9, 9, 'canon', 'acts', 12, 23, 'free', E'Acts 12:23 — *And immediately the angel of Yahuah (Lord) smote him, because he gave not Elohim (God) the glory: and he was eaten of worms, and gave up the ghost.* Herod, like Antiochus in 2 Maccabees 9:9, is eaten of worms for stealing the glory that belongs to Yahuah alone.'),
  ('apocrypha', '2-maccabees', 9, 10, 'canon', 'isaiah', 66, 24, 'free', E'Isaiah 66:24 — *And they shall go forth, and look upon the carcases of the men that have transgressed against me: for their worm shall not die, neither shall their fire be quenched; and they shall be an abhorring unto all flesh.* The man who thought to reach the stars becomes the carcase no man can endure, an abhorring unto all flesh, in 2 Maccabees 9:10.'),
  -- thread: 2-maccabees-9-command-the-waves
  ('apocrypha', '2-maccabees', 9, 8, 'canon', 'isaiah', 14, 13, 'free', E'Isaiah 14:13 — *For thou hast said in thine heart, I will ascend into heaven, I will exalt my throne above the stars of Elohim (God): I will sit also upon the mount of the congregation, in the sides of the north.* Antiochus'' boast to command the sea and weigh the mountains in 2 Maccabees 9:8 is the same heart that says it will ascend above the stars.'),
  ('apocrypha', '2-maccabees', 9, 8, 'canon', 'ezekiel', 28, 2, 'free', E'Ezekiel 28:2 — *Son of Adam, say unto the prince of Tyrus, Thus saith Adonai Yahuah (the Lord GOD); Because thine heart is lifted up, and thou hast said, I am a Elohim (God), I sit in the seat of Elohim (God), in the midst of the seas; yet thou art a man, and not Elohim (God), though thou set thine heart as the heart of Elohim (God).* Like the prince of Tyrus enthroned in the midst of the seas, Antiochus thought he might command the waves yet was ''proud beyond the condition of man'' (2 Maccabees 9:8).'),
  ('apocrypha', '2-maccabees', 9, 10, 'canon', 'obadiah', 1, 4, 'free', E'Obadiah 1:4 — *Though thou exalt thyself as the eagle, and though thou set thy nest among the stars, thence will I bring thee down, saith Yahuah (LORD).* The man who ''thought a little afore he could reach to the stars of heaven'' (2 Maccabees 9:10) is brought down exactly as Edom is brought down from among the stars.'),
  -- thread: 2-maccabees-9-pride-before-the-fall
  ('apocrypha', '2-maccabees', 9, 7, 'canon', 'proverbs', 16, 18, 'free', E'Proverbs 16:18 — *Pride goeth before destruction, and an haughty spirit before a fall.* Antiochus, ''still filled with pride,'' falls headlong from his chariot in 2 Maccabees 9:7 — the proverb enacted to the letter.'),
  ('apocrypha', '2-maccabees', 9, 7, 'canon', 'james', 4, 6, 'free', E'James 4:6 — *But he giveth more grace. Wherefore he saith, Elohim (God) resisteth the proud, but giveth grace unto the humble.* The God who resists the proud breaks the bragging blasphemer of 2 Maccabees 9:7.'),
  ('apocrypha', '2-maccabees', 9, 7, 'canon', 'daniel', 4, 37, 'free', E'Daniel 4:37 — *Now I Nebuchadnezzar praise and extol and honour the King of heaven, all whose works are truth, and his ways judgment: and those that walk in pride he is able to abase.* The King of heaven who abased Nebuchadnezzar likewise abases Antiochus, who would not cease from his pride (2 Maccabees 9:7).'),
  -- thread: 2-maccabees-9-know-the-mighty-power
  ('apocrypha', '2-maccabees', 9, 12, 'canon', 'daniel', 4, 34, 'free', E'Daniel 4:34 — *And at the end of the days I Nebuchadnezzar lifted up mine eyes unto heaven, and mine understanding returned unto me, and I blessed the El Elyon (most High), and I praised and honoured him that liveth for ever, whose dominion is an everlasting dominion, and his kingdom is from generation to generation.* Antiochus'' words that a mortal should not think himself God (2 Maccabees 9:12) echo Nebuchadnezzar''s restored confession of the Most High''s everlasting dominion.'),
  ('apocrypha', '2-maccabees', 9, 12, 'canon', 'daniel', 4, 32, 'free', E'Daniel 4:32 — *And they shall drive thee from men, and thy dwelling shall be with the beasts of the field: they shall make thee to eat grass as oxen, and seven times shall pass over thee, until thou know that the El Elyon (most High) ruleth in the kingdom of men, and giveth it to whomsoever he will.* The very lesson Nebuchadnezzar was scourged to learn — that the Most High rules the kingdom of men — is what Antiochus is forced to own in 2 Maccabees 9:12.'),
  ('apocrypha', '2-maccabees', 9, 11, 'canon', 'luke', 18, 13, 'free', E'Luke 18:13 — *And the publican, standing afar off, would not lift up so much as his eyes unto heaven, but smote upon his breast, saying, Elohim (God) be merciful to me a sinner.* Antiochus comes ''to the knowledge of himself by the scourge of Yahuah'' (2 Maccabees 9:11), but unlike the publican his late humbling finds no mercy (9:13).'),
  -- thread: 2-maccabees-9-judgment-just-recompence
  ('apocrypha', '2-maccabees', 9, 6, 'canon', 'psalms', 9, 15, 'free', E'Psalm 9:15 — *The heathen are sunk down in the pit that they made: in the net which they hid is their own foot taken.* Antiochus is tormented in the bowels ''most justly'' (2 Maccabees 9:6), snared in the very torments he devised for others.'),
  ('apocrypha', '2-maccabees', 9, 28, 'apocrypha', '1-maccabees', 6, 12, 'extras', E'1 Maccabees 6:12 — *But now I remember the evils that I did at Jerusalem, and that I took all the vessels of gold and silver that were in it, and sent to destroy the inhabitants of Judea without a cause.* The companion book records the same blasphemer''s dying confession, that he perishes for what he did to Jerusalem — the death of 2 Maccabees 9:28 read from within.'),
  ('apocrypha', '2-maccabees', 9, 28, 'apocrypha', '2-maccabees', 7, 35, 'extras', E'2 Maccabees 7:35 — *For you have not yet escaped the judgment of Almighty Yahuah (God), who seeth all things.* The youngest brother''s warning to the persecutor is fulfilled when the murderer dies a miserable death (2 Maccabees 9:28); the martyrs'' resurrection-hope stands while their tormentor rots.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2mac9_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2mac9_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-9-worm-spread-under-thee',
       E'The worm spread under the proud blasphemer',
       E'Antiochus, the abomination-king who set up the desolation in the holy place, is struck in the bowels and rots while yet living: *So that the worms rose up out of the body of this wicked man, and whiles he lived in sorrow and pain, his flesh fell away, and the filthiness of his smell was noisome to all his army* (2 Maccabees 9:9). It ain''t new — Yahuah had already chanted this dirge over Babylon''s king: *Thy pomp is brought down to the grave, and the noise of thy viols: the worm is spread under thee, and the worms cover thee* (Isaiah 14:11). The same scourge falls on Herod, the next tyrant to take to himself the glory of God: *And immediately the angel of Yahuah (Lord) smote him, because he gave not Elohim (God) the glory: and he was eaten of worms, and gave up the ghost* (Acts 12:23). And the prophets seal the end of every such carcase: *And they shall go forth, and look upon the carcases of the men that have transgressed against me: for their worm shall not die, neither shall their fire be quenched; and they shall be an abhorring unto all flesh* (Isaiah 66:24). One worm, one judgment, on every man who exalts the kingdom of man against heaven.',
       sv.verse_id, ev.verse_id, 'extras', 62200
  FROM _session253_2mac9_lookup sv, _session253_2mac9_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=9 AND sv.verse_number=9
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=9 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-9-command-the-waves',
       E'He that thought to command the sea, cast on the ground',
       E'The towering boast of the man of sin: *And thus he that a little afore thought he might command the waves of the sea, (so proud was he beyond the condition of man) and weigh the high mountains in a balance, was now cast on the ground, and carried in an horselitter, shewing forth to all the manifest power of Yahuah (God)* (2 Maccabees 9:8). This is the very sin of Babel and of the covering cherub: *For thou hast said in thine heart, I will ascend into heaven, I will exalt my throne above the stars of Elohim (God): I will sit also upon the mount of the congregation, in the sides of the north* (Isaiah 14:13); *Son of Adam, say unto the prince of Tyrus, Thus saith Adonai Yahuah (the Lord GOD); Because thine heart is lifted up, and thou hast said, I am a Elohim (God), I sit in the seat of Elohim (God), in the midst of the seas; yet thou art a man, and not Elohim (God), though thou set thine heart as the heart of Elohim (God)* (Ezekiel 28:2). Edom heard the same word: *Though thou exalt thyself as the eagle, and though thou set thy nest among the stars, thence will I bring thee down, saith Yahuah (LORD)* (Obadiah 1:4). And so Antiochus, who reached for the stars (9:10), is cast on the ground.',
       sv.verse_id, ev.verse_id, 'extras', 62203
  FROM _session253_2mac9_lookup sv, _session253_2mac9_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=9 AND sv.verse_number=8
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=9 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-9-pride-before-the-fall',
       E'Pride goeth before destruction',
       E'The whole death of Antiochus is one proverb made flesh: *Howbeit he nothing at all ceased from his bragging, but still was filled with pride, breathing out fire in his rage against the Yahudim (Jews), and commanding to haste the journey: but it came to pass that he fell down from his chariot, carried violently; so that having a sore fall, all the members of his body were much pained* (2 Maccabees 9:7). Come and see how the wisdom-writings name it: *Pride goeth before destruction, and an haughty spirit before a fall* (Proverbs 16:18). The apostles preach the same law of the kingdom: *But he giveth more grace. Wherefore he saith, Elohim (God) resisteth the proud, but giveth grace unto the humble* (James 4:6); *For whosoever exalteth himself shall be abased; and he that humbleth himself shall be exalted* — the King of heaven *is able to abase* those that walk in pride (Daniel 4:37). The literal fall from the chariot is the figure of the everlasting fall of the kingdom of man.',
       sv.verse_id, ev.verse_id, 'extras', 62206
  FROM _session253_2mac9_lookup sv, _session253_2mac9_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=9 AND sv.verse_number=7
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=9 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-9-know-the-mighty-power',
       E'That a mortal man should not think himself God',
       E'Brought to the end of himself by his own stench, the tyrant confesses the lesson of every fallen king: *And when he himself could not abide his own smell, he said these words, It is meet to be subject to Yahuah (God), and that a man that is mortal should not proudly think of himself if he were Yahuah (God)* (2 Maccabees 9:12). This is Nebuchadnezzar''s confession after the seven times: *And at the end of the days I Nebuchadnezzar lifted up mine eyes unto heaven, and mine understanding returned unto me, and I blessed the El Elyon (most High), and I praised and honoured him that liveth for ever, whose dominion is an everlasting dominion, and his kingdom is from generation to generation* (Daniel 4:34); the scourge teaches him *that the El Elyon (most High) ruleth in the kingdom of men, and giveth it to whomsoever he will* (Daniel 4:32). It is the publican''s posture against the Pharisee''s: *And the publican, standing afar off, would not lift up so much as his eyes unto heaven, but smote upon his breast, saying, Elohim (God) be merciful to me a sinner* (Luke 18:13) — only Antiochus comes to it too late, for mercy ''now no more would have'' him (9:13).',
       sv.verse_id, ev.verse_id, 'extras', 62209
  FROM _session253_2mac9_lookup sv, _session253_2mac9_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=9 AND sv.verse_number=11
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=9 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-9-judgment-just-recompence',
       E'Most justly — tormented as he tormented',
       E'The narrator declares the death no accident but exact recompense: *And that most justly: for he had tormented other men''s bowels with many and strange torments* (2 Maccabees 9:6); *Thus the murderer and blasphemer having suffered most grievously, as he entreated other men, so died he a miserable death in a strange country in the mountains* (2 Maccabees 9:28). This is the measure-for-measure justice of the psalms: *The heathen are sunk down in the pit that they made: in the net which they hid is their own foot taken* (Psalm 9:15). His brother-tyrant in the other book of the war died the same way, confessing the same cause: *But now I remember the evils that I did at Jerusalem, and that I took all the vessels of gold and silver that were in it, and sent to destroy the inhabitants of Judea without a cause* (1 Maccabees 6:12). And the seven brethren had already prophesied this hour to the persecutor: *For you have not yet escaped the judgment of Almighty Yahuah (God), who seeth all things* (2 Maccabees 7:35) — the resurrection-hope of the martyrs is vindicated in the worm-eaten end of their tormentor.',
       sv.verse_id, ev.verse_id, 'extras', 62212
  FROM _session253_2mac9_lookup sv, _session253_2mac9_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=9 AND sv.verse_number=6
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=9 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-maccabees-9-worm-spread-under-thee
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 14:11 — *Thy pomp is brought down to the grave, and the noise of thy viols: the worm is spread under thee, and the worms cover thee.* The same worm that buries Babylon''s proud king crawls up out of Antiochus'' living flesh in 2 Maccabees 9:9.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac9_lookup sv, _session253_2mac9_lookup tv
 WHERE t.slug='2-maccabees-9-worm-spread-under-thee'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=9 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=14 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Acts 12:23 — *And immediately the angel of Yahuah (Lord) smote him, because he gave not Elohim (God) the glory: and he was eaten of worms, and gave up the ghost.* Herod, like Antiochus in 2 Maccabees 9:9, is eaten of worms for stealing the glory that belongs to Yahuah alone.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac9_lookup sv, _session253_2mac9_lookup tv
 WHERE t.slug='2-maccabees-9-worm-spread-under-thee'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=9 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=12 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 66:24 — *And they shall go forth, and look upon the carcases of the men that have transgressed against me: for their worm shall not die, neither shall their fire be quenched; and they shall be an abhorring unto all flesh.* The man who thought to reach the stars becomes the carcase no man can endure, an abhorring unto all flesh, in 2 Maccabees 9:10.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac9_lookup sv, _session253_2mac9_lookup tv
 WHERE t.slug='2-maccabees-9-worm-spread-under-thee'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=9 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=66 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-9-command-the-waves
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 14:13 — *For thou hast said in thine heart, I will ascend into heaven, I will exalt my throne above the stars of Elohim (God): I will sit also upon the mount of the congregation, in the sides of the north.* Antiochus'' boast to command the sea and weigh the mountains in 2 Maccabees 9:8 is the same heart that says it will ascend above the stars.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac9_lookup sv, _session253_2mac9_lookup tv
 WHERE t.slug='2-maccabees-9-command-the-waves'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=9 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=14 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 28:2 — *Son of Adam, say unto the prince of Tyrus, Thus saith Adonai Yahuah (the Lord GOD); Because thine heart is lifted up, and thou hast said, I am a Elohim (God), I sit in the seat of Elohim (God), in the midst of the seas; yet thou art a man, and not Elohim (God), though thou set thine heart as the heart of Elohim (God).* Like the prince of Tyrus enthroned in the midst of the seas, Antiochus thought he might command the waves yet was ''proud beyond the condition of man'' (2 Maccabees 9:8).'
  FROM cross_reference_threads t, cross_references x, _session253_2mac9_lookup sv, _session253_2mac9_lookup tv
 WHERE t.slug='2-maccabees-9-command-the-waves'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=9 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=28 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Obadiah 1:4 — *Though thou exalt thyself as the eagle, and though thou set thy nest among the stars, thence will I bring thee down, saith Yahuah (LORD).* The man who ''thought a little afore he could reach to the stars of heaven'' (2 Maccabees 9:10) is brought down exactly as Edom is brought down from among the stars.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac9_lookup sv, _session253_2mac9_lookup tv
 WHERE t.slug='2-maccabees-9-command-the-waves'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=9 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='obadiah' AND tv.chapter_number=1 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-9-pride-before-the-fall
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 16:18 — *Pride goeth before destruction, and an haughty spirit before a fall.* Antiochus, ''still filled with pride,'' falls headlong from his chariot in 2 Maccabees 9:7 — the proverb enacted to the letter.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac9_lookup sv, _session253_2mac9_lookup tv
 WHERE t.slug='2-maccabees-9-pride-before-the-fall'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=9 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=16 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'James 4:6 — *But he giveth more grace. Wherefore he saith, Elohim (God) resisteth the proud, but giveth grace unto the humble.* The God who resists the proud breaks the bragging blasphemer of 2 Maccabees 9:7.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac9_lookup sv, _session253_2mac9_lookup tv
 WHERE t.slug='2-maccabees-9-pride-before-the-fall'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=9 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=4 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 4:37 — *Now I Nebuchadnezzar praise and extol and honour the King of heaven, all whose works are truth, and his ways judgment: and those that walk in pride he is able to abase.* The King of heaven who abased Nebuchadnezzar likewise abases Antiochus, who would not cease from his pride (2 Maccabees 9:7).'
  FROM cross_reference_threads t, cross_references x, _session253_2mac9_lookup sv, _session253_2mac9_lookup tv
 WHERE t.slug='2-maccabees-9-pride-before-the-fall'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=9 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=4 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-9-know-the-mighty-power
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 4:34 — *And at the end of the days I Nebuchadnezzar lifted up mine eyes unto heaven, and mine understanding returned unto me, and I blessed the El Elyon (most High), and I praised and honoured him that liveth for ever, whose dominion is an everlasting dominion, and his kingdom is from generation to generation.* Antiochus'' words that a mortal should not think himself God (2 Maccabees 9:12) echo Nebuchadnezzar''s restored confession of the Most High''s everlasting dominion.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac9_lookup sv, _session253_2mac9_lookup tv
 WHERE t.slug='2-maccabees-9-know-the-mighty-power'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=9 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=4 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 4:32 — *And they shall drive thee from men, and thy dwelling shall be with the beasts of the field: they shall make thee to eat grass as oxen, and seven times shall pass over thee, until thou know that the El Elyon (most High) ruleth in the kingdom of men, and giveth it to whomsoever he will.* The very lesson Nebuchadnezzar was scourged to learn — that the Most High rules the kingdom of men — is what Antiochus is forced to own in 2 Maccabees 9:12.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac9_lookup sv, _session253_2mac9_lookup tv
 WHERE t.slug='2-maccabees-9-know-the-mighty-power'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=9 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=4 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Luke 18:13 — *And the publican, standing afar off, would not lift up so much as his eyes unto heaven, but smote upon his breast, saying, Elohim (God) be merciful to me a sinner.* Antiochus comes ''to the knowledge of himself by the scourge of Yahuah'' (2 Maccabees 9:11), but unlike the publican his late humbling finds no mercy (9:13).'
  FROM cross_reference_threads t, cross_references x, _session253_2mac9_lookup sv, _session253_2mac9_lookup tv
 WHERE t.slug='2-maccabees-9-know-the-mighty-power'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=9 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=18 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-9-judgment-just-recompence
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 9:15 — *The heathen are sunk down in the pit that they made: in the net which they hid is their own foot taken.* Antiochus is tormented in the bowels ''most justly'' (2 Maccabees 9:6), snared in the very torments he devised for others.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac9_lookup sv, _session253_2mac9_lookup tv
 WHERE t.slug='2-maccabees-9-judgment-just-recompence'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=9 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=9 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Maccabees 6:12 — *But now I remember the evils that I did at Jerusalem, and that I took all the vessels of gold and silver that were in it, and sent to destroy the inhabitants of Judea without a cause.* The companion book records the same blasphemer''s dying confession, that he perishes for what he did to Jerusalem — the death of 2 Maccabees 9:28 read from within.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac9_lookup sv, _session253_2mac9_lookup tv
 WHERE t.slug='2-maccabees-9-judgment-just-recompence'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=9 AND sv.verse_number=28
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=6 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Maccabees 7:35 — *For you have not yet escaped the judgment of Almighty Yahuah (God), who seeth all things.* The youngest brother''s warning to the persecutor is fulfilled when the murderer dies a miserable death (2 Maccabees 9:28); the martyrs'' resurrection-hope stands while their tormentor rots.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac9_lookup sv, _session253_2mac9_lookup tv
 WHERE t.slug='2-maccabees-9-judgment-just-recompence'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=9 AND sv.verse_number=28
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=7 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

