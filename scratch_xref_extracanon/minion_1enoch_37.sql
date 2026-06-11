-- ----- fragment: minion_1enoch_37.sql (session250 1-enoch 37) -----
-- Source anchor: enoch/1-enoch ch37. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en37 (view _session250_en37_lookup). Sort band base 50900, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en37_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-37-wisdom-hidden-from-former-generations
  ('enoch', '1-enoch', 37, 4, 'canon', 'matthew', 13, 35, 'free', E'Matthew 13:35 — *That it might be fulfilled which was spoken by the prophet, saying, I will open my mouth in parables; I will utter things which have been kept secret from the foundation of the world.* Yahusha''s parable-speech unveils what was kept secret, exactly as Enoch''s vision of wisdom is reserved ''not for this generation'' (1 Enoch 37:4).'),
  ('enoch', '1-enoch', 37, 4, 'canon', 'deuteronomy', 29, 29, 'free', E'Deuteronomy 29:29 — *The secret things belong unto Yahuah Eloheinu (the LORD our God): but those things which are revealed belong unto us and to our children for ever, that we may do all the words of this law.* The Torah''s sealed-versus-revealed line is the very frame of Enoch''s wisdom withheld from former generations and granted to the elect (1 Enoch 37:4).'),
  ('enoch', '1-enoch', 37, 5, 'canon', 'matthew', 11, 25, 'free', E'Matthew 11:25 — *At that time Yahusha (Jesus) answered and said, I thank thee, O Father, Yahuah (Lord) of heaven and earth, because thou hast hid these things from the wise and prudent, and hast revealed them unto babes.* The Father''s selective unveiling to the chosen is Enoch''s parable spoken ''concerning the elect'' (1 Enoch 37:5).'),
  ('enoch', '1-enoch', 37, 4, 'canon', '1-corinthians', 2, 7, 'free', E'1 Corinthians 2:7 — *But we speak the wisdom of Elohim (God) in a mystery, even the hidden wisdom, which Elohim (God) ordained before the world unto our glory.* Paul''s hidden wisdom ordained before the world matches Enoch''s vision of wisdom held back for the generation ''which is for to come'' (1 Enoch 37:4).'),
  ('enoch', '1-enoch', 37, 2, 'apocrypha', 'the-wisdom-of-solomon', 7, 27, 'extras', E'Wisdom of Solomon 7:27 — *And being but one, she can do all things: and remaining in herself, she makes all things new: and in all ages entering into holy souls, she makes them friends of Yahuah (God), and prophets.* The personified Wisdom that enters holy souls is the very ''words of wisdom'' Enoch lifts his voice to speak (1 Enoch 37:2).'),
  -- thread: 1-enoch-37-holy-great-one-comes-forth-sinai
  ('enoch', '1-enoch', 37, 6, 'canon', 'deuteronomy', 33, 2, 'free', E'Deuteronomy 33:2 — *And he said, Yahuah (LORD) came from Sinai, and rose up from Seir unto them; he shined forth from mount Paran, and he came with ten thousands of saints: from his right hand went a fiery law for them.* Moses'' Sinai-theophany with the myriads is the same advent Enoch announces, ''even on Mount Sinai'' (1 Enoch 37:6).'),
  ('enoch', '1-enoch', 37, 5, 'canon', 'micah', 1, 3, 'free', E'Micah 1:3 — *For, behold, Yahuah (LORD) cometh forth out of his place, and will come down, and tread upon the high places of the earth.* Micah''s coming-forth to tread the earth is Enoch''s ''will come forth from His dwelling... will tread upon the earth'' (1 Enoch 37:5).'),
  ('enoch', '1-enoch', 37, 6, 'canon', 'jude', 1, 14, 'free', E'Jude 1:14 — *And Enoch also, the seventh from Adam, prophesied of these, saying, Behold, Yahuah (Lord) cometh with ten thousands of his saints.* Jude lifts the very advent of this book — the Holy Great One coming forth in His might to judge — straight from Enoch (1 Enoch 37:6).'),
  -- thread: 1-enoch-37-mountains-melt-like-wax-judgement-on-all
  ('enoch', '1-enoch', 37, 8, 'canon', 'psalms', 97, 5, 'free', E'Psalm 97:5 — *The hills melted like wax at the presence of Yahuah (LORD), at the presence of Yahuah (Lord) of the whole earth.* The wax-melting hills are exactly Enoch''s ''high hills... shall melt like wax before the flame'' (1 Enoch 37:8).'),
  ('enoch', '1-enoch', 37, 8, 'canon', 'micah', 1, 4, 'free', E'Micah 1:4 — *And the mountains shall be molten under him, and the valleys shall be cleft, as wax before the fire, and as the waters that are poured down a steep place.* Micah''s molten mountains and cleft valleys mirror Enoch''s mountains shaken and the earth rent in sunder (1 Enoch 37:8).'),
  ('enoch', '1-enoch', 37, 7, 'canon', 'nahum', 1, 5, 'free', E'Nahum 1:5 — *The mountains quake at him, and the hills melt, and the earth is burned at his presence, yea, the world, and all that dwell therein.* The quaking and the universal terror at His presence answer Enoch''s ''all shall be smitten with fear'' and the Watchers'' quaking (1 Enoch 37:7).'),
  ('enoch', '1-enoch', 37, 9, 'canon', 'isaiah', 64, 1, 'free', E'Isaiah 64:1 — *Oh that thou wouldest rend the heavens, that thou wouldest come down, that the mountains might flow down at thy presence.* Isaiah longs for the very rending and coming-down Enoch sees, when ''the earth shall be wholly rent in sunder'' (1 Enoch 37:9).'),
  ('enoch', '1-enoch', 37, 9, 'enoch', '1-enoch', 1, 9, 'extras', E'1 Enoch 1:9 — *And behold! He cometh with ten thousands of His set-apart ones To execute judgement upon all, And to destroy all the ungodly: And to convict all flesh Of all the works of their ungodliness which they have ungodly committed, And of all the hard things which ungodly sinners have spoken against Him.* Enoch''s first parable already declared the ''judgement upon all'' that chapter 37 reopens (1 Enoch 37:9).'),
  -- thread: 1-enoch-37-peace-with-the-righteous-light-on-the-elect
  ('enoch', '1-enoch', 37, 10, 'canon', 'isaiah', 60, 1, 'free', E'Isaiah 60:1 — *Arise, shine; for thy light is come, and the glory of Yahuah (LORD) is risen upon thee.* Isaiah''s dawning glory upon the chosen is Enoch''s ''light shall appear unto them'' (1 Enoch 37:10).'),
  ('enoch', '1-enoch', 37, 10, 'canon', 'ephesians', 1, 4, 'free', E'Ephesians 1:4 — *According as he hath chosen us in him before the foundation of the world, that we should be holy and without blame before him in love.* The choosing before the foundation grounds Enoch''s ''protect the elect'' as election preceding any confession (1 Enoch 37:10).'),
  ('enoch', '1-enoch', 37, 10, 'canon', 'romans', 8, 33, 'free', E'Romans 8:33 — *Who shall lay any thing to the charge of Elohim''s (God''s) elect? It is Elohim (God) that justifieth.* Paul''s unanswerable defense of the elect matches Enoch''s promise that mercy and protection rest upon the elect in judgement (1 Enoch 37:10).'),
  ('enoch', '1-enoch', 37, 10, 'enoch', '1-enoch', 48, 7, 'extras', E'1 Enoch 48:7 — *And the wisdom of Yahuah (God) of Spirits hath revealed him to the holy and righteous; For he hath preserved the lot of the righteous, Because they have hated and despised this world of unrighteousness, And have hated all its works and ways in the name of Yahuah (God) of Spirits: For in his name they are saved, And according to his good pleasure hath it been in regard to their life.* The preserved lot of the righteous saved in His name is the same protected elect Enoch promises peace and mercy here (1 Enoch 37:10).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en37_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en37_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-37-wisdom-hidden-from-former-generations',
       E'Wisdom kept secret, revealed to the elect — not to this generation',
       E'The Book of Parables opens with a vision deliberately withheld from the past and reserved for those whom Yahuah has chosen: *And I heard everything, and from them I understood as I saw, but not for this generation, but for a remote one which is for to come* (1 Enoch 37:4). This is the canon''s own pattern — wisdom hidden, then disclosed to the elect at the appointed time. Yahusha quotes a Psalm as the very rationale of His parable-speech: *That it might be fulfilled which was spoken by the prophet, saying, I will open my mouth in parables; I will utter things which have been kept secret from the foundation of the world* (Matthew 13:35), and He blesses the Father precisely for the selective unveiling — *because thou hast hid these things from the wise and prudent, and hast revealed them unto babes* (Matthew 11:25). The Torah already drew the line between what is sealed and what is given: *The secret things belong unto Yahuah Eloheinu (the LORD our God): but those things which are revealed belong unto us and to our children for ever, that we may do all the words of this law* (Deuteronomy 29:29) — revelation issues in obedience, not speculation. Paul names the same withheld-then-disclosed mystery — *we speak the wisdom of Elohim (God) in a mystery, even the hidden wisdom, which Elohim (God) ordained before the world unto our glory* (1 Corinthians 2:7) — and *the mystery which hath been hid from ages and from generations, but now is made manifest to his saints* (Colossians 1:26). And the apocrypha echoes the personified Wisdom that Enoch lifts up his voice to speak: *And being but one, she can do all things: and remaining in herself, she makes all things new: and in all ages entering into holy souls, she makes them friends of Yahuah (God), and prophets* (Wisdom of Solomon 7:27). Election precedes the hearing: Enoch speaks *concerning the elect* before the parable is even uttered (37:5).',
       sv.verse_id, ev.verse_id, 'extras', 50900
  FROM _session250_en37_lookup sv, _session250_en37_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=37 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=37 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-37-holy-great-one-comes-forth-sinai',
       E'The Holy Great One comes forth from His dwelling to tread the earth at Sinai',
       E'Enoch''s parable announces the advent of the Father — the formless Head of Days — descending in theophany: *The Holy Great One will come forth from His dwelling, And the eternal Elohim (God) will tread upon the earth, (even) on Mount Sinai, [And appear from His camp] And appear in the strength of His might from the heaven of heavens* (1 Enoch 37:5-6). This is the Sinai-coming of the Torah and the prophets, word for word. Moses'' blessing opens with it: *Yahuah (LORD) came from Sinai, and rose up from Seir unto them; he shined forth from mount Paran, and he came with ten thousands of saints: from his right hand went a fiery law for them* (Deuteronomy 33:2). Micah sees the same coming-forth and treading: *For, behold, Yahuah (LORD) cometh forth out of his place, and will come down, and tread upon the high places of the earth* (Micah 1:3). And the prophecy Jude attributes to Enoch himself draws on this very advent — the coming with the myriads to judge: *And Enoch also, the seventh from Adam, prophesied of these, saying, Behold, Yahuah (Lord) cometh with ten thousands of his saints* (Jude 1:14). Note the order of the Godhead the framework keeps: the One who comes forth here is the Holy Great One, the Father in His own might from the heaven of heavens — the Formed Son, the Elect One, is not yet named in this opening parable; that naming waits for chapters 46 and 48. It ain''t new: Enoch''s Sinai-advent is Moses'' Sinai-advent and Micah''s, and it is the judgment-coming Jude lifts straight off this book.',
       sv.verse_id, ev.verse_id, 'extras', 50903
  FROM _session250_en37_lookup sv, _session250_en37_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=37 AND sv.verse_number=5
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=37 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-37-mountains-melt-like-wax-judgement-on-all',
       E'The mountains melt like wax; the earth is rent; judgement upon all',
       E'Before His presence the whole created order convulses, and judgement falls: *And all shall be smitten with fear And the Watchers shall quake... And the high mountains shall be shaken, And the high hills shall be made low, And shall melt like wax before the flame And the earth shall be wholly rent in sunder, And all that is upon the earth shall perish, And there shall be a judgement upon all (men)* (1 Enoch 37:7-9). The wax-melting mountains are lifted straight from the Psalms — *The hills melted like wax at the presence of Yahuah (LORD), at the presence of Yahuah (Lord) of the whole earth* (Psalm 97:5) — and from Micah''s parallel to the Sinai-advent above: *And the mountains shall be molten under him, and the valleys shall be cleft, as wax before the fire, and as the waters that are poured down a steep place* (Micah 1:4). Nahum names the same quaking and burning at His presence: *The mountains quake at him, and the hills melt, and the earth is burned at his presence, yea, the world, and all that dwell therein* (Nahum 1:5), and Isaiah cries for the very rending Enoch foresees — *Oh that thou wouldest rend the heavens, that thou wouldest come down, that the mountains might flow down at thy presence* (Isaiah 64:1). That the Watchers themselves quake ties this judgement to the seed-war this book carries from Genesis 6: the same advent that levels the mountains terrifies the rebel Watchers. And Enoch''s own opening parable in chapter 1 frames the judgement-coming this chapter reopens: *And behold! He cometh with ten thousands of His set-apart ones To execute judgement upon all, And to destroy all the ungodly* (1 Enoch 1:9). Torah stands: the judgement is upon all who broke the covenant order, not upon the law itself.',
       sv.verse_id, ev.verse_id, 'extras', 50906
  FROM _session250_en37_lookup sv, _session250_en37_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=37 AND sv.verse_number=7
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=37 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-37-peace-with-the-righteous-light-on-the-elect',
       E'Peace with the righteous; the elect protected; light appears unto them',
       E'The same advent that rends the earth turns to mercy for the chosen: *But with the righteous He will make peace. And will protect the elect, And mercy shall be upon them. And they shall all belong to Elohim (God)... And light shall appear unto them, And He will make peace with them* (1 Enoch 37:10). The light dawning on the elect is Isaiah''s rising glory upon the chosen people: *Arise, shine; for thy light is come, and the glory of Yahuah (LORD) is risen upon thee* (Isaiah 60:1). Their belonging to Elohim is the election the framework insists precedes any confession — chosen before the foundation, not self-selected: *According as he hath chosen us in him before the foundation of the world, that we should be holy and without blame before him in love* (Ephesians 1:4); and no charge can stand against them — *Who shall lay any thing to the charge of Elohim''s (God''s) elect? It is Elohim (God) that justifieth* (Romans 8:33). Within Enoch''s own Parables the same protected lot is named and saved: *And the wisdom of Yahuah (God) of Spirits hath revealed him to the holy and righteous; For he hath preserved the lot of the righteous... For in his name they are saved* (1 Enoch 48:7). These elect are a people kept and gathered — the regathered righteous of the two-house hope, not a church displacing them. It ain''t new: Enoch''s peace-with-the-righteous and light-upon-the-elect is Isaiah''s risen glory and Paul''s election before the world.',
       sv.verse_id, ev.verse_id, 'extras', 50909
  FROM _session250_en37_lookup sv, _session250_en37_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=37 AND sv.verse_number=10
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=37 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-37-wisdom-hidden-from-former-generations
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 13:35 — *That it might be fulfilled which was spoken by the prophet, saying, I will open my mouth in parables; I will utter things which have been kept secret from the foundation of the world.* Yahusha''s parable-speech unveils what was kept secret, exactly as Enoch''s vision of wisdom is reserved ''not for this generation'' (1 Enoch 37:4).'
  FROM cross_reference_threads t, cross_references x, _session250_en37_lookup sv, _session250_en37_lookup tv
 WHERE t.slug='1-enoch-37-wisdom-hidden-from-former-generations'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=37 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=13 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 29:29 — *The secret things belong unto Yahuah Eloheinu (the LORD our God): but those things which are revealed belong unto us and to our children for ever, that we may do all the words of this law.* The Torah''s sealed-versus-revealed line is the very frame of Enoch''s wisdom withheld from former generations and granted to the elect (1 Enoch 37:4).'
  FROM cross_reference_threads t, cross_references x, _session250_en37_lookup sv, _session250_en37_lookup tv
 WHERE t.slug='1-enoch-37-wisdom-hidden-from-former-generations'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=37 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=29 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 11:25 — *At that time Yahusha (Jesus) answered and said, I thank thee, O Father, Yahuah (Lord) of heaven and earth, because thou hast hid these things from the wise and prudent, and hast revealed them unto babes.* The Father''s selective unveiling to the chosen is Enoch''s parable spoken ''concerning the elect'' (1 Enoch 37:5).'
  FROM cross_reference_threads t, cross_references x, _session250_en37_lookup sv, _session250_en37_lookup tv
 WHERE t.slug='1-enoch-37-wisdom-hidden-from-former-generations'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=37 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=11 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Corinthians 2:7 — *But we speak the wisdom of Elohim (God) in a mystery, even the hidden wisdom, which Elohim (God) ordained before the world unto our glory.* Paul''s hidden wisdom ordained before the world matches Enoch''s vision of wisdom held back for the generation ''which is for to come'' (1 Enoch 37:4).'
  FROM cross_reference_threads t, cross_references x, _session250_en37_lookup sv, _session250_en37_lookup tv
 WHERE t.slug='1-enoch-37-wisdom-hidden-from-former-generations'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=37 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Wisdom of Solomon 7:27 — *And being but one, she can do all things: and remaining in herself, she makes all things new: and in all ages entering into holy souls, she makes them friends of Yahuah (God), and prophets.* The personified Wisdom that enters holy souls is the very ''words of wisdom'' Enoch lifts his voice to speak (1 Enoch 37:2).'
  FROM cross_reference_threads t, cross_references x, _session250_en37_lookup sv, _session250_en37_lookup tv
 WHERE t.slug='1-enoch-37-wisdom-hidden-from-former-generations'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=37 AND sv.verse_number=2
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=7 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-37-holy-great-one-comes-forth-sinai
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 33:2 — *And he said, Yahuah (LORD) came from Sinai, and rose up from Seir unto them; he shined forth from mount Paran, and he came with ten thousands of saints: from his right hand went a fiery law for them.* Moses'' Sinai-theophany with the myriads is the same advent Enoch announces, ''even on Mount Sinai'' (1 Enoch 37:6).'
  FROM cross_reference_threads t, cross_references x, _session250_en37_lookup sv, _session250_en37_lookup tv
 WHERE t.slug='1-enoch-37-holy-great-one-comes-forth-sinai'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=37 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=33 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Micah 1:3 — *For, behold, Yahuah (LORD) cometh forth out of his place, and will come down, and tread upon the high places of the earth.* Micah''s coming-forth to tread the earth is Enoch''s ''will come forth from His dwelling... will tread upon the earth'' (1 Enoch 37:5).'
  FROM cross_reference_threads t, cross_references x, _session250_en37_lookup sv, _session250_en37_lookup tv
 WHERE t.slug='1-enoch-37-holy-great-one-comes-forth-sinai'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=37 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jude 1:14 — *And Enoch also, the seventh from Adam, prophesied of these, saying, Behold, Yahuah (Lord) cometh with ten thousands of his saints.* Jude lifts the very advent of this book — the Holy Great One coming forth in His might to judge — straight from Enoch (1 Enoch 37:6).'
  FROM cross_reference_threads t, cross_references x, _session250_en37_lookup sv, _session250_en37_lookup tv
 WHERE t.slug='1-enoch-37-holy-great-one-comes-forth-sinai'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=37 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-37-mountains-melt-like-wax-judgement-on-all
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 97:5 — *The hills melted like wax at the presence of Yahuah (LORD), at the presence of Yahuah (Lord) of the whole earth.* The wax-melting hills are exactly Enoch''s ''high hills... shall melt like wax before the flame'' (1 Enoch 37:8).'
  FROM cross_reference_threads t, cross_references x, _session250_en37_lookup sv, _session250_en37_lookup tv
 WHERE t.slug='1-enoch-37-mountains-melt-like-wax-judgement-on-all'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=37 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=97 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Micah 1:4 — *And the mountains shall be molten under him, and the valleys shall be cleft, as wax before the fire, and as the waters that are poured down a steep place.* Micah''s molten mountains and cleft valleys mirror Enoch''s mountains shaken and the earth rent in sunder (1 Enoch 37:8).'
  FROM cross_reference_threads t, cross_references x, _session250_en37_lookup sv, _session250_en37_lookup tv
 WHERE t.slug='1-enoch-37-mountains-melt-like-wax-judgement-on-all'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=37 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=1 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Nahum 1:5 — *The mountains quake at him, and the hills melt, and the earth is burned at his presence, yea, the world, and all that dwell therein.* The quaking and the universal terror at His presence answer Enoch''s ''all shall be smitten with fear'' and the Watchers'' quaking (1 Enoch 37:7).'
  FROM cross_reference_threads t, cross_references x, _session250_en37_lookup sv, _session250_en37_lookup tv
 WHERE t.slug='1-enoch-37-mountains-melt-like-wax-judgement-on-all'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=37 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='nahum' AND tv.chapter_number=1 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 64:1 — *Oh that thou wouldest rend the heavens, that thou wouldest come down, that the mountains might flow down at thy presence.* Isaiah longs for the very rending and coming-down Enoch sees, when ''the earth shall be wholly rent in sunder'' (1 Enoch 37:9).'
  FROM cross_reference_threads t, cross_references x, _session250_en37_lookup sv, _session250_en37_lookup tv
 WHERE t.slug='1-enoch-37-mountains-melt-like-wax-judgement-on-all'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=37 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=64 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Enoch 1:9 — *And behold! He cometh with ten thousands of His set-apart ones To execute judgement upon all, And to destroy all the ungodly: And to convict all flesh Of all the works of their ungodliness which they have ungodly committed, And of all the hard things which ungodly sinners have spoken against Him.* Enoch''s first parable already declared the ''judgement upon all'' that chapter 37 reopens (1 Enoch 37:9).'
  FROM cross_reference_threads t, cross_references x, _session250_en37_lookup sv, _session250_en37_lookup tv
 WHERE t.slug='1-enoch-37-mountains-melt-like-wax-judgement-on-all'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=37 AND sv.verse_number=9
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=1 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-37-peace-with-the-righteous-light-on-the-elect
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 60:1 — *Arise, shine; for thy light is come, and the glory of Yahuah (LORD) is risen upon thee.* Isaiah''s dawning glory upon the chosen is Enoch''s ''light shall appear unto them'' (1 Enoch 37:10).'
  FROM cross_reference_threads t, cross_references x, _session250_en37_lookup sv, _session250_en37_lookup tv
 WHERE t.slug='1-enoch-37-peace-with-the-righteous-light-on-the-elect'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=37 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=60 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ephesians 1:4 — *According as he hath chosen us in him before the foundation of the world, that we should be holy and without blame before him in love.* The choosing before the foundation grounds Enoch''s ''protect the elect'' as election preceding any confession (1 Enoch 37:10).'
  FROM cross_reference_threads t, cross_references x, _session250_en37_lookup sv, _session250_en37_lookup tv
 WHERE t.slug='1-enoch-37-peace-with-the-righteous-light-on-the-elect'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=37 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=1 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 8:33 — *Who shall lay any thing to the charge of Elohim''s (God''s) elect? It is Elohim (God) that justifieth.* Paul''s unanswerable defense of the elect matches Enoch''s promise that mercy and protection rest upon the elect in judgement (1 Enoch 37:10).'
  FROM cross_reference_threads t, cross_references x, _session250_en37_lookup sv, _session250_en37_lookup tv
 WHERE t.slug='1-enoch-37-peace-with-the-righteous-light-on-the-elect'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=37 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 48:7 — *And the wisdom of Yahuah (God) of Spirits hath revealed him to the holy and righteous; For he hath preserved the lot of the righteous, Because they have hated and despised this world of unrighteousness, And have hated all its works and ways in the name of Yahuah (God) of Spirits: For in his name they are saved, And according to his good pleasure hath it been in regard to their life.* The preserved lot of the righteous saved in His name is the same protected elect Enoch promises peace and mercy here (1 Enoch 37:10).'
  FROM cross_reference_threads t, cross_references x, _session250_en37_lookup sv, _session250_en37_lookup tv
 WHERE t.slug='1-enoch-37-peace-with-the-righteous-light-on-the-elect'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=37 AND sv.verse_number=10
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=48 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

