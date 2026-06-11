-- ----- fragment: minion_1enoch_49.sql (session250 1-enoch 49) -----
-- Source anchor: enoch/1-enoch ch49. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en49 (view _session250_en49_lookup). Sort band base 51200, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en49_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-49-spirit-of-wisdom-rests
  ('enoch', '1-enoch', 49, 3, 'canon', 'isaiah', 11, 2, 'free', E'Isaiah 11:2 — *And the spirit of Yahuah (LORD) shall rest upon him, the spirit of wisdom and understanding, the spirit of counsel and might, the spirit of knowledge and of the fear of Yahuah (LORD);* the very sevenfold Spirit Enoch sees dwelling in the Elect One is Isaiah''s Spirit resting on the branch of Jesse.'),
  ('enoch', '1-enoch', 49, 2, 'canon', 'isaiah', 42, 1, 'free', E'Isaiah 42:1 — *Behold my servant, whom I uphold; mine elect, in whom my soul delighteth; I have put my spirit upon him: he shall bring forth judgment to the Gentiles.* Isaiah''s ''mine elect'' on whom the Spirit is put is Enoch''s named ''Elect One'' standing before Yahuah of Spirits.'),
  ('enoch', '1-enoch', 49, 3, 'canon', 'john', 3, 34, 'free', E'John 3:34 — *For he whom Elohim (God) hath sent speaketh the words of Elohim (God): for Elohim (God) giveth not the Spirit by measure unto him.* When the Elect One came in flesh as Yahusha, the Spirit that dwells in Him was given without measure, exactly as Enoch saw it indwelling Him in full.'),
  ('enoch', '1-enoch', 49, 2, 'canon', 'matthew', 12, 18, 'free', E'Matthew 12:18 — *Behold my servant, whom I have chosen; my beloved, in whom my soul is well pleased: I will put my spirit upon him, and he shall shew judgment to the Gentiles.* Matthew reads Isaiah''s elect-servant straight onto Yahusha — the same chosen One Enoch names standing before Yahuah of Spirits.'),
  -- thread: 1-enoch-49-treasures-of-wisdom-hidden
  ('enoch', '1-enoch', 49, 1, 'canon', 'colossians', 2, 3, 'free', E'Colossians 2:3 — *In whom are hid all the treasures of wisdom and knowledge.* The wisdom Enoch sees poured out like water from the Elect One is, in Paul, the whole treasury hidden in the Messiah.'),
  ('enoch', '1-enoch', 49, 1, 'canon', '1-corinthians', 1, 24, 'free', E'1 Corinthians 1:24 — *But unto them which are called, both Yahudim (Jews) and Greeks, Messiah (Christ) the power of Elohim (God), and the wisdom of Elohim (God).* The wisdom flowing from the Elect One is named in the Messiah Himself, who is the wisdom of Elohim.'),
  ('enoch', '1-enoch', 49, 1, 'canon', 'proverbs', 8, 12, 'free', E'Proverbs 8:12 — *I wisdom dwell with prudence, and find out knowledge of witty inventions.* The Wisdom Proverbs personifies as present from the beginning is the same wisdom Enoch sees poured out without fail from the Elect One.'),
  ('enoch', '1-enoch', 49, 1, 'enoch', '1-enoch', 48, 1, 'extras', E'1 Enoch 48:1 — *And in that place I saw the fountain of righteousness Which was inexhaustible: And around it were many fountains of wisdom: And all the thirsty drank of them, And were filled with wisdom, And their dwellings were with the righteous and holy and elect.* Enoch''s own fountains of wisdom in ch48 are here gathered into the Elect One, from whom wisdom is poured out like water.'),
  -- thread: 1-enoch-49-elect-one-judges-secret-things
  ('enoch', '1-enoch', 49, 4, 'canon', 'daniel', 7, 13, 'free', E'Daniel 7:13 — *I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him.* Daniel sees one LIKE the Son of Adam (the kaph-comparative — he resembles mortal-man because he took flesh); Enoch names that same Elect One who judges before Yahuah of Spirits.'),
  ('enoch', '1-enoch', 49, 4, 'canon', 'daniel', 7, 14, 'free', E'Daniel 7:14 — *And there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him: his dominion is an everlasting dominion, which shall not pass away, and his kingdom that which shall not be destroyed.* The everlasting dominion given to the Son of Adam is the judging authority Enoch sees vested in the Elect One forever.'),
  ('enoch', '1-enoch', 49, 4, 'canon', 'isaiah', 11, 4, 'free', E'Isaiah 11:4 — *But with righteousness shall he judge the poor, and reprove with equity for the meek of the earth: and he shall smite the earth with the rod of his mouth, and with the breath of his lips shall he slay the wicked.* The Spirit-anointed branch judges in righteousness, not by sight — the very judging of secret things Enoch ascribes to the Elect One.'),
  ('enoch', '1-enoch', 49, 4, 'enoch', '1-enoch', 62, 1, 'extras', E'1 Enoch 62:1 — *And thus Yahuah (God) of Spirits named the Elect One, And seated him on the throne of His glory, And he shall judge all the works of the holy in heaven above, And weigh their deeds in the balance.* Enoch''s own ch62 enthrones the Elect One to judge — the office of judging the secret things named here in 49:4.'),
  -- thread: 1-enoch-49-elect-one-stands-glory-forever
  ('enoch', '1-enoch', 49, 3, 'canon', 'isaiah', 26, 19, 'free', E'Isaiah 26:19 — *Thy dead men shall live, together with my dead body shall they arise. Awake and sing, ye that dwell in dust: for thy dew is as the dew of herbs, and the earth shall cast out the dead.* The ''spirit of those who have fallen asleep in righteousness'' resting on the Elect One points to Isaiah''s dust-dwellers waking — the earth casting out its dead.'),
  ('enoch', '1-enoch', 49, 3, 'canon', 'daniel', 12, 2, 'free', E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The fallen-asleep-in-righteousness whose spirit rests with the Elect One are Daniel''s sleepers in the dust who awake to everlasting life.'),
  ('enoch', '1-enoch', 49, 3, 'canon', 'john', 5, 28, 'free', E'John 5:28 — *Marvel not at this: for the hour is coming, in the which all that are in the graves shall hear his voice,* Yahusha names Himself the voice that wakes the graves — the Elect One whose might over the sleeping righteous Enoch sees in 49:3.'),
  ('enoch', '1-enoch', 49, 3, 'enoch', '1-enoch', 51, 1, 'extras', E'1 Enoch 51:1 — *And in those days shall the earth also give back that which has been entrusted to it, And Sheol also shall give back that which it has received, And hell shall give back that which it owes. 5a. For in those days the Elect One shall arise,* Enoch''s own ch51 makes the Elect One the agent of resurrection — the rising of the righteous who fell asleep in Him.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en49_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en49_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-49-spirit-of-wisdom-rests',
       E'The Spirit of Wisdom Rests on the Elect One',
       E'Enoch sees the sevenfold Spirit poured out on the chosen One: *And in him dwells the spirit of wisdom, And the spirit which gives insight, And the spirit of understanding and of might, And the spirit of those who have fallen asleep in righteousness.* (1 Enoch 49:3). This is no new revelation — it is Isaiah''s branch from Jesse, on whom the same Spirit settles in the same registers: *And the spirit of Yahuah (LORD) shall rest upon him, the spirit of wisdom and understanding, the spirit of counsel and might, the spirit of knowledge and of the fear of Yahuah (LORD)* (Isaiah 11:2). Yahuah''s own voice names the same servant and the same anointing: *Behold my servant, whom I uphold; mine elect, in whom my soul delighteth; I have put my spirit upon him: he shall bring forth judgment to the Gentiles* (Isaiah 42:1) — and Enoch''s title ''the Elect One'' is precisely Isaiah''s ''mine elect.'' When this Elect One came in flesh as Yahusha, the measure was the whole: *For he whom Elohim (God) hath sent speaketh the words of Elohim (God): for Elohim (God) giveth not the Spirit by measure unto him* (John 3:34). The Spirit rests on the Formed Son, ordered under the Head of Days who is its source — the Father gives, the Son bears it without measure; named before creation, the same One across every page.',
       sv.verse_id, ev.verse_id, 'extras', 51200
  FROM _session250_en49_lookup sv, _session250_en49_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=49 AND sv.verse_number=2
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=49 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-49-treasures-of-wisdom-hidden',
       E'Wisdom Poured Out, Treasures Hidden in Him',
       E'The chapter opens with wisdom overflowing from the Elect One: *For wisdom is poured out like water, And glory faileth not before him for evermore* (1 Enoch 49:1). This is the fountain of 1 Enoch 48 made personal — in the Son of Adam the wells of wisdom run inexhaustible. The Tanakh''s Wisdom speaks as the companion at creation: *I wisdom dwell with prudence, and find out knowledge of witty inventions* (Proverbs 8:12). And the New Testament gathers it into one Person: the crucified Messiah is *Messiah (Christ) the power of Elohim (God), and the wisdom of Elohim (God)* (1 Corinthians 1:24), who *of Elohim (God) is made unto us wisdom, and righteousness, and sanctification, and redemption* (1 Corinthians 1:30) — so that all the stores Enoch sees overflowing are sealed up in Him: *In whom are hid all the treasures of wisdom and knowledge* (Colossians 2:3). It ain''t new: the Wisdom that Proverbs personifies, that Enoch sees poured out from the Elect One, is the Formed Son who came as Yahusha.',
       sv.verse_id, ev.verse_id, 'extras', 51203
  FROM _session250_en49_lookup sv, _session250_en49_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=49 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=49 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-49-elect-one-judges-secret-things',
       E'The Elect One Judges the Secret Things',
       E'The Spirit-bearing One is also the judge: *And he shall judge the secret things, And none shall be able to utter a lying word before him; For he is the Elect One before Yahuah (God) of Spirits according to His good pleasure* (1 Enoch 49:4). Isaiah''s Spirit-anointed branch judges in the same righteousness, not by appearance: *But with righteousness shall he judge the poor, and reprove with equity for the meek of the earth: and he shall smite the earth with the rod of his mouth, and with the breath of his lips shall he slay the wicked* (Isaiah 11:4). Daniel sees this same enthroned figure receive the dominion to judge — *one like the Son of Adam* (the kaph-comparative: he resembles mortal-man because he took flesh, while remaining the Formed cloud-rider): *I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him* (Daniel 7:13), *And there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him* (Daniel 7:14). Daniel sees one LIKE the Son of Adam; Enoch NAMES that same One as the Elect One — the constructions differ, but both land on Yahusha. Within Enoch this office is settled on the throne: *And thus Yahuah (God) of Spirits named the Elect One, And seated him on the throne of His glory, And he shall judge all the works of the holy in heaven above, And weigh their deeds in the balance* (1 Enoch 62:1). The Head of Days (the Father) seats and gives; the Elect One judges by His good pleasure — distinct from the Father, ordered under Him, never a co-equal-person nor a mere man.',
       sv.verse_id, ev.verse_id, 'extras', 51206
  FROM _session250_en49_lookup sv, _session250_en49_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=49 AND sv.verse_number=4
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=49 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-49-elect-one-stands-glory-forever',
       E'The Elect One Stands; Unrighteousness Vanishes Like a Shadow',
       E'Enoch sets the standing of the Elect One against the vanishing of evil: *For he is mighty in all the secrets of righteousness, And unrighteousness shall disappear as a shadow, And have no continuance; Because the Elect One standeth before Yahuah (God) of Spirits, And his glory is for ever and ever, And his might unto all generations* (1 Enoch 49:2). The Spirit that rests on Him includes *the spirit of those who have fallen asleep in righteousness* (1 Enoch 49:3) — and this points to the resurrection where the Elect One arises and the dead are given back. Isaiah''s dew wakes the sleepers: *Thy dead men shall live, together with my dead body shall they arise. Awake and sing, ye that dwell in dust: for thy dew is as the dew of herbs, and the earth shall cast out the dead* (Isaiah 26:19). Daniel sets the same waking: *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt* (Daniel 12:2). Yahusha gathers the chorus: *Marvel not at this: for the hour is coming, in the which all that are in the graves shall hear his voice* (John 5:28). And Enoch''s own ch51 makes the Elect One the agent of that rising: *And in those days shall the earth also give back that which has been entrusted to it, And Sheol also shall give back that which it has received... For in those days the Elect One shall arise* (1 Enoch 51:1). The same One whose righteousness makes evil a shadow without continuance is the One who raises the righteous who fell asleep in Him.',
       sv.verse_id, ev.verse_id, 'extras', 51209
  FROM _session250_en49_lookup sv, _session250_en49_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=49 AND sv.verse_number=2
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=49 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-49-spirit-of-wisdom-rests
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 11:2 — *And the spirit of Yahuah (LORD) shall rest upon him, the spirit of wisdom and understanding, the spirit of counsel and might, the spirit of knowledge and of the fear of Yahuah (LORD);* the very sevenfold Spirit Enoch sees dwelling in the Elect One is Isaiah''s Spirit resting on the branch of Jesse.'
  FROM cross_reference_threads t, cross_references x, _session250_en49_lookup sv, _session250_en49_lookup tv
 WHERE t.slug='1-enoch-49-spirit-of-wisdom-rests'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=49 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 42:1 — *Behold my servant, whom I uphold; mine elect, in whom my soul delighteth; I have put my spirit upon him: he shall bring forth judgment to the Gentiles.* Isaiah''s ''mine elect'' on whom the Spirit is put is Enoch''s named ''Elect One'' standing before Yahuah of Spirits.'
  FROM cross_reference_threads t, cross_references x, _session250_en49_lookup sv, _session250_en49_lookup tv
 WHERE t.slug='1-enoch-49-spirit-of-wisdom-rests'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=49 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=42 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 3:34 — *For he whom Elohim (God) hath sent speaketh the words of Elohim (God): for Elohim (God) giveth not the Spirit by measure unto him.* When the Elect One came in flesh as Yahusha, the Spirit that dwells in Him was given without measure, exactly as Enoch saw it indwelling Him in full.'
  FROM cross_reference_threads t, cross_references x, _session250_en49_lookup sv, _session250_en49_lookup tv
 WHERE t.slug='1-enoch-49-spirit-of-wisdom-rests'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=49 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=3 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 12:18 — *Behold my servant, whom I have chosen; my beloved, in whom my soul is well pleased: I will put my spirit upon him, and he shall shew judgment to the Gentiles.* Matthew reads Isaiah''s elect-servant straight onto Yahusha — the same chosen One Enoch names standing before Yahuah of Spirits.'
  FROM cross_reference_threads t, cross_references x, _session250_en49_lookup sv, _session250_en49_lookup tv
 WHERE t.slug='1-enoch-49-spirit-of-wisdom-rests'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=49 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=12 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-49-treasures-of-wisdom-hidden
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Colossians 2:3 — *In whom are hid all the treasures of wisdom and knowledge.* The wisdom Enoch sees poured out like water from the Elect One is, in Paul, the whole treasury hidden in the Messiah.'
  FROM cross_reference_threads t, cross_references x, _session250_en49_lookup sv, _session250_en49_lookup tv
 WHERE t.slug='1-enoch-49-treasures-of-wisdom-hidden'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=49 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=2 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Corinthians 1:24 — *But unto them which are called, both Yahudim (Jews) and Greeks, Messiah (Christ) the power of Elohim (God), and the wisdom of Elohim (God).* The wisdom flowing from the Elect One is named in the Messiah Himself, who is the wisdom of Elohim.'
  FROM cross_reference_threads t, cross_references x, _session250_en49_lookup sv, _session250_en49_lookup tv
 WHERE t.slug='1-enoch-49-treasures-of-wisdom-hidden'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=49 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=1 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 8:12 — *I wisdom dwell with prudence, and find out knowledge of witty inventions.* The Wisdom Proverbs personifies as present from the beginning is the same wisdom Enoch sees poured out without fail from the Elect One.'
  FROM cross_reference_threads t, cross_references x, _session250_en49_lookup sv, _session250_en49_lookup tv
 WHERE t.slug='1-enoch-49-treasures-of-wisdom-hidden'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=49 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=8 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 48:1 — *And in that place I saw the fountain of righteousness Which was inexhaustible: And around it were many fountains of wisdom: And all the thirsty drank of them, And were filled with wisdom, And their dwellings were with the righteous and holy and elect.* Enoch''s own fountains of wisdom in ch48 are here gathered into the Elect One, from whom wisdom is poured out like water.'
  FROM cross_reference_threads t, cross_references x, _session250_en49_lookup sv, _session250_en49_lookup tv
 WHERE t.slug='1-enoch-49-treasures-of-wisdom-hidden'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=49 AND sv.verse_number=1
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=48 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-49-elect-one-judges-secret-things
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:13 — *I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him.* Daniel sees one LIKE the Son of Adam (the kaph-comparative — he resembles mortal-man because he took flesh); Enoch names that same Elect One who judges before Yahuah of Spirits.'
  FROM cross_reference_threads t, cross_references x, _session250_en49_lookup sv, _session250_en49_lookup tv
 WHERE t.slug='1-enoch-49-elect-one-judges-secret-things'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=49 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:14 — *And there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him: his dominion is an everlasting dominion, which shall not pass away, and his kingdom that which shall not be destroyed.* The everlasting dominion given to the Son of Adam is the judging authority Enoch sees vested in the Elect One forever.'
  FROM cross_reference_threads t, cross_references x, _session250_en49_lookup sv, _session250_en49_lookup tv
 WHERE t.slug='1-enoch-49-elect-one-judges-secret-things'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=49 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 11:4 — *But with righteousness shall he judge the poor, and reprove with equity for the meek of the earth: and he shall smite the earth with the rod of his mouth, and with the breath of his lips shall he slay the wicked.* The Spirit-anointed branch judges in righteousness, not by sight — the very judging of secret things Enoch ascribes to the Elect One.'
  FROM cross_reference_threads t, cross_references x, _session250_en49_lookup sv, _session250_en49_lookup tv
 WHERE t.slug='1-enoch-49-elect-one-judges-secret-things'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=49 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 62:1 — *And thus Yahuah (God) of Spirits named the Elect One, And seated him on the throne of His glory, And he shall judge all the works of the holy in heaven above, And weigh their deeds in the balance.* Enoch''s own ch62 enthrones the Elect One to judge — the office of judging the secret things named here in 49:4.'
  FROM cross_reference_threads t, cross_references x, _session250_en49_lookup sv, _session250_en49_lookup tv
 WHERE t.slug='1-enoch-49-elect-one-judges-secret-things'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=49 AND sv.verse_number=4
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=62 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-49-elect-one-stands-glory-forever
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 26:19 — *Thy dead men shall live, together with my dead body shall they arise. Awake and sing, ye that dwell in dust: for thy dew is as the dew of herbs, and the earth shall cast out the dead.* The ''spirit of those who have fallen asleep in righteousness'' resting on the Elect One points to Isaiah''s dust-dwellers waking — the earth casting out its dead.'
  FROM cross_reference_threads t, cross_references x, _session250_en49_lookup sv, _session250_en49_lookup tv
 WHERE t.slug='1-enoch-49-elect-one-stands-glory-forever'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=49 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=26 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The fallen-asleep-in-righteousness whose spirit rests with the Elect One are Daniel''s sleepers in the dust who awake to everlasting life.'
  FROM cross_reference_threads t, cross_references x, _session250_en49_lookup sv, _session250_en49_lookup tv
 WHERE t.slug='1-enoch-49-elect-one-stands-glory-forever'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=49 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 5:28 — *Marvel not at this: for the hour is coming, in the which all that are in the graves shall hear his voice,* Yahusha names Himself the voice that wakes the graves — the Elect One whose might over the sleeping righteous Enoch sees in 49:3.'
  FROM cross_reference_threads t, cross_references x, _session250_en49_lookup sv, _session250_en49_lookup tv
 WHERE t.slug='1-enoch-49-elect-one-stands-glory-forever'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=49 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=5 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 51:1 — *And in those days shall the earth also give back that which has been entrusted to it, And Sheol also shall give back that which it has received, And hell shall give back that which it owes. 5a. For in those days the Elect One shall arise,* Enoch''s own ch51 makes the Elect One the agent of resurrection — the rising of the righteous who fell asleep in Him.'
  FROM cross_reference_threads t, cross_references x, _session250_en49_lookup sv, _session250_en49_lookup tv
 WHERE t.slug='1-enoch-49-elect-one-stands-glory-forever'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=49 AND sv.verse_number=3
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=51 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

