-- ----- fragment: minion_tobit_08.sql (session253 tobit 8) -----
-- Source anchor: apocrypha/tobit ch8. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: tob8 (view _session253_tob8_lookup). Sort band base 59775, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_tob8_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: tobit-8-the-binding-of-the-enemy
  ('apocrypha', 'tobit', 8, 3, 'canon', 'revelation', 20, 2, 'free', E'Revelation 20:2 — *And he laid hold on the dragon, that old serpent, which is the Devil, and Satan, and bound him a thousand years,* the same word over the enemy that Tobit 8:3 sees in small — the angel bound him.'),
  ('apocrypha', 'tobit', 8, 3, 'canon', 'revelation', 20, 3, 'free', E'Revelation 20:3 — *And cast him into the bottomless pit, and shut him up, and set a seal upon him, that he should deceive the nations no more, till the thousand years should be fulfilled: and after that he must be loosed a little season.* As the demon is driven to the utmost parts and shut away, so the dragon is sealed in the pit (Tobit 8:3).'),
  ('apocrypha', 'tobit', 8, 3, 'canon', 'matthew', 12, 29, 'free', E'Matthew 12:29 — *Or else how can one enter into a strong man’s house, and spoil his goods, except he first bind the strong man? and then he will spoil his house.* The binding of the enemy must come first before the household is freed — Asmodeus bound, the marriage delivered (Tobit 8:3).'),
  ('apocrypha', 'tobit', 8, 3, 'canon', 'luke', 10, 19, 'free', E'Luke 10:19 — *Behold, I give unto you power to tread on serpents and scorpions, and over all the power of the enemy: and nothing shall by any means hurt you.* The authority that binds and treads the enemy is given to the faithful, as the angel exercised it for Tobias (Tobit 8:3).'),
  -- thread: tobit-8-arise-and-let-us-pray
  ('apocrypha', 'tobit', 8, 4, 'canon', 'ephesians', 5, 3, 'free', E'Ephesians 5:3 — *But fornication, and all uncleanness, or covetousness, let it not be once named among you, as becometh saints;* the very holiness Tobias guards when he rises to pray rather than to lust (Tobit 8:4).'),
  ('apocrypha', 'tobit', 8, 4, 'canon', 'ephesians', 5, 32, 'free', E'Ephesians 5:32 — *This is a great mystery: but I speak concerning Messiah (Christ) and the church.* The prayer-hallowed marriage of Tobias points beyond itself to the covenant union it figures (Tobit 8:4).'),
  -- thread: tobit-8-thou-madest-adam-and-eve
  ('apocrypha', 'tobit', 8, 6, 'canon', 'genesis', 2, 18, 'free', E'Genesis 2:18 — *And Yahuah Elohim (the LORD God) said, It is not good that the man should be alone; I will make him an help meet for him.* The very word Tobias prays back to Yahuah as the ground of his marriage (Tobit 8:6).'),
  ('apocrypha', 'tobit', 8, 6, 'canon', 'genesis', 2, 24, 'free', E'Genesis 2:24 — *Therefore shall a man leave his father and his mother, and shall cleave unto his wife: and they shall be one flesh.* The one-flesh covenant Tobias and Sarah enter is the creation ordinance Tobit 8:6 invokes.'),
  ('apocrypha', 'tobit', 8, 6, 'canon', 'genesis', 1, 27, 'free', E'Genesis 1:27 — *So Elohim (God) created man in his own image, in the image of Elohim (God) created he him; male and female created he them.* The making of Adam and Eve that Tobit 8:6 recalls as the pattern of his own marriage.'),
  -- thread: tobit-8-not-for-lust-but-uprightly
  ('apocrypha', 'tobit', 8, 7, 'canon', 'malachi', 2, 15, 'free', E'Malachi 2:15 — *And did not he make one? Yet had he the residue of the spirit. And wherefore one? That he might seek a godly seed. Therefore take heed to your spirit, and let none deal treacherously against the wife of his youth.* The godly-seed purpose of marriage is precisely Tobias’s not-for-lust-but-uprightly (Tobit 8:7).'),
  ('apocrypha', 'tobit', 8, 7, 'canon', 'malachi', 2, 14, 'free', E'Malachi 2:14 — *Yet ye say, Wherefore? Because Yahuah (LORD) hath been witness between thee and the wife of thy youth, against whom thou hast dealt treacherously: yet is she thy companion, and the wife of thy covenant.* Yahuah is the witness of the marriage covenant Tobias makes openly before him (Tobit 8:7).'),
  ('apocrypha', 'tobit', 8, 7, 'canon', 'ephesians', 5, 25, 'free', E'Ephesians 5:25 — *Husbands, love your wives, even as Messiah (Christ) also loved the church, and gave himself for it;* the sacrificial, lifelong love that Tobias prays to live out, to grow aged together (Tobit 8:7).'),
  -- thread: tobit-8-let-all-thy-creatures-praise-thee
  ('apocrypha', 'tobit', 8, 5, 'canon', 'psalms', 148, 2, 'free', E'Psalms 148:2 — *Praise ye him, all his angels: praise ye him, all his hosts.* The heavens and creatures Tobias bids bless Yahuah are the very hosts Psalm 148 musters (Tobit 8:5).'),
  ('apocrypha', 'tobit', 8, 5, 'canon', 'psalms', 148, 5, 'free', E'Psalms 148:5 — *Let them praise the name of Yahuah (LORD): for he commanded, and they were created.* All creatures praising their Maker is the ground of Tobias’s blessing of the holy and glorious name (Tobit 8:5).'),
  ('apocrypha', 'tobit', 8, 15, 'apocrypha', 'tobit', 13, 18, 'extras', E'Tobit 13:18 — *And all her streets shall say, Alleluia; and they shall praise him, saying, Blessed be Yahuah (God), which has extolled it for ever.* Raguel’s call for saints, angels, and elect to praise forever is taken up in Tobit’s hymn of the regathered Jerusalem (Tobit 8:15).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_tob8_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_tob8_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-8-the-binding-of-the-enemy',
       E'The angel bound him — the binding of the enemy',
       E'When the smoke of the heart and liver rose, *The which smell when the evil spirit had smelled, he fled into the utmost parts of Egypt, and the angel bound him.* (Tobit 8:3). It ain''t new — the seed-war of Eden runs to its end, and the enemy is not merely cast out but *bound*. John saw the same chain: *And he laid hold on the dragon, that old serpent, which is the Devil, and Satan, and bound him a thousand years,* (Revelation 20:2), and the angel *cast him into the bottomless pit, and shut him up, and set a seal upon him, that he should deceive the nations no more* (Revelation 20:3). The Messiah teaches that no house is spoiled till the strong man is first tied: *Or else how can one enter into a strong man’s house, and spoil his goods, except he first bind the strong man? and then he will spoil his house.* (Matthew 12:29). And He hands that authority to the gathered: *Behold, I give unto you power to tread on serpents and scorpions, and over all the power of the enemy: and nothing shall by any means hurt you.* (Luke 10:19). Asmodeus fleeing and bound is a sign of the whole — the dragon shut up, the bridal chamber kept.',
       sv.verse_id, ev.verse_id, 'extras', 59775
  FROM _session253_tob8_lookup sv, _session253_tob8_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=8 AND sv.verse_number=3
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=8 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-8-arise-and-let-us-pray',
       E'Arise, and let us pray — the marriage begun in prayer',
       E'Before the bridal night, Tobias does not turn to lust but to Yahuah: *And after that they were both shut in together, Tobias rose out of the bed, and said, Sister, arise, and let us pray that Yahuah (God) would have pity on us.* (Tobit 8:4). Marriage opened with prayer is the Torah pattern of the holy seed kept clean. Paul gives the same charge to the saints, that uncleanness be not once named among them: *But fornication, and all uncleanness, or covetousness, let it not be once named among you, as becometh saints;* (Ephesians 5:3). And he weds the one-flesh covenant to a higher mystery: *This is a great mystery: but I speak concerning Messiah (Christ) and the church.* (Ephesians 5:32). The chamber of Tobias and Sarah, hallowed by prayer, is a small window onto the marriage of the Lamb.',
       sv.verse_id, ev.verse_id, 'extras', 59778
  FROM _session253_tob8_lookup sv, _session253_tob8_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=8 AND sv.verse_number=4
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=8 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-8-thou-madest-adam-and-eve',
       E'Thou madest Adam, and gavest him Eve — marriage as the Edenic covenant',
       E'Tobias’s prayer reaches back past the Law to the garden itself: *You madest Adam, and gavest him Eve his wife for an helper and stay: of them came mankind: you have said, It is not good that man should be alone; let us make to him an aid like to himself.* (Tobit 8:6). He is quoting Genesis from memory in exile — the foundation of marriage in the creation ordinance. *And Yahuah Elohim (the LORD God) said, It is not good that the man should be alone; I will make him an help meet for him.* (Genesis 2:18). And the one-flesh decree: *Therefore shall a man leave his father and his mother, and shall cleave unto his wife: and they shall be one flesh.* (Genesis 2:24). At the first, *So Elohim (God) created man in his own image, in the image of Elohim (God) created he him; male and female created he them.* (Genesis 1:27). It ain’t new — the wedding at Ecbatana is the wedding of Eden renewed, the holy seed continued.',
       sv.verse_id, ev.verse_id, 'extras', 59781
  FROM _session253_tob8_lookup sv, _session253_tob8_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=8 AND sv.verse_number=6
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=8 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-8-not-for-lust-but-uprightly',
       E'Not for lust but uprightly — the godly seed',
       E'Tobias names his intent before Yahuah: *And now, O Yahuah (God), I take not this my sister for lust but uprightly: therefore mercifully ordain that we may become aged together.* (Tobit 8:7). This is Malachi’s purpose of marriage exactly — covenant faithfulness for the sake of a holy line. *And did not he make one? Yet had he the residue of the spirit. And wherefore one? That he might seek a godly seed. Therefore take heed to your spirit, and let none deal treacherously against the wife of his youth.* (Malachi 2:15), for *Yahuah (LORD) hath been witness between thee and the wife of thy youth, against whom thou hast dealt treacherously: yet is she thy companion, and the wife of thy covenant.* (Malachi 2:14). Paul charges husbands to that same self-giving love: *Husbands, love your wives, even as Messiah (Christ) also loved the church, and gave himself for it;* (Ephesians 5:25). To grow old together, not for lust but in truth — this is the seed kept faithful.',
       sv.verse_id, ev.verse_id, 'extras', 59784
  FROM _session253_tob8_lookup sv, _session253_tob8_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=8 AND sv.verse_number=7
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=8 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-8-let-all-thy-creatures-praise-thee',
       E'Let all thy creatures praise thee — the whole creation blesses Yahuah',
       E'Tobias opens his prayer summoning all creation to bless its Maker: *Then began Tobias to say, Blessed art you, O Yahuah (God) of our fathers, and blessed is your holy and glorious name for ever; let the heavens bless you, and all your creatures.* (Tobit 8:5). Raguel answers in kind: *Then Raguel praised Yahuah (God), and said, O Yahuah (God), you are worthy to be praised with all pure and holy praise; therefore let your saints praise you with all your creatures; and let all your angels and your elect praise you for ever.* (Tobit 8:15). This is the song of Psalm 148 — heaven, hosts, and every creature called to one chorus. *Praise ye him, all his angels: praise ye him, all his hosts.* (Psalms 148:2), *Let them praise the name of Yahuah (LORD): for he commanded, and they were created.* (Psalms 148:5). The same praise rises in Tobit’s own later song, when the scattered house is gathered home: *And all her streets shall say, Alleluia; and they shall praise him, saying, Blessed be Yahuah (God), which has extolled it for ever.* (Tobit 13:18).',
       sv.verse_id, ev.verse_id, 'extras', 59787
  FROM _session253_tob8_lookup sv, _session253_tob8_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=8 AND sv.verse_number=5
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=8 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: tobit-8-the-binding-of-the-enemy
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 20:2 — *And he laid hold on the dragon, that old serpent, which is the Devil, and Satan, and bound him a thousand years,* the same word over the enemy that Tobit 8:3 sees in small — the angel bound him.'
  FROM cross_reference_threads t, cross_references x, _session253_tob8_lookup sv, _session253_tob8_lookup tv
 WHERE t.slug='tobit-8-the-binding-of-the-enemy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=8 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 20:3 — *And cast him into the bottomless pit, and shut him up, and set a seal upon him, that he should deceive the nations no more, till the thousand years should be fulfilled: and after that he must be loosed a little season.* As the demon is driven to the utmost parts and shut away, so the dragon is sealed in the pit (Tobit 8:3).'
  FROM cross_reference_threads t, cross_references x, _session253_tob8_lookup sv, _session253_tob8_lookup tv
 WHERE t.slug='tobit-8-the-binding-of-the-enemy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=8 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 12:29 — *Or else how can one enter into a strong man’s house, and spoil his goods, except he first bind the strong man? and then he will spoil his house.* The binding of the enemy must come first before the household is freed — Asmodeus bound, the marriage delivered (Tobit 8:3).'
  FROM cross_reference_threads t, cross_references x, _session253_tob8_lookup sv, _session253_tob8_lookup tv
 WHERE t.slug='tobit-8-the-binding-of-the-enemy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=8 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=12 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Luke 10:19 — *Behold, I give unto you power to tread on serpents and scorpions, and over all the power of the enemy: and nothing shall by any means hurt you.* The authority that binds and treads the enemy is given to the faithful, as the angel exercised it for Tobias (Tobit 8:3).'
  FROM cross_reference_threads t, cross_references x, _session253_tob8_lookup sv, _session253_tob8_lookup tv
 WHERE t.slug='tobit-8-the-binding-of-the-enemy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=8 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=10 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-8-arise-and-let-us-pray
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ephesians 5:3 — *But fornication, and all uncleanness, or covetousness, let it not be once named among you, as becometh saints;* the very holiness Tobias guards when he rises to pray rather than to lust (Tobit 8:4).'
  FROM cross_reference_threads t, cross_references x, _session253_tob8_lookup sv, _session253_tob8_lookup tv
 WHERE t.slug='tobit-8-arise-and-let-us-pray'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=8 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=5 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ephesians 5:32 — *This is a great mystery: but I speak concerning Messiah (Christ) and the church.* The prayer-hallowed marriage of Tobias points beyond itself to the covenant union it figures (Tobit 8:4).'
  FROM cross_reference_threads t, cross_references x, _session253_tob8_lookup sv, _session253_tob8_lookup tv
 WHERE t.slug='tobit-8-arise-and-let-us-pray'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=8 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=5 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-8-thou-madest-adam-and-eve
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:18 — *And Yahuah Elohim (the LORD God) said, It is not good that the man should be alone; I will make him an help meet for him.* The very word Tobias prays back to Yahuah as the ground of his marriage (Tobit 8:6).'
  FROM cross_reference_threads t, cross_references x, _session253_tob8_lookup sv, _session253_tob8_lookup tv
 WHERE t.slug='tobit-8-thou-madest-adam-and-eve'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=8 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 2:24 — *Therefore shall a man leave his father and his mother, and shall cleave unto his wife: and they shall be one flesh.* The one-flesh covenant Tobias and Sarah enter is the creation ordinance Tobit 8:6 invokes.'
  FROM cross_reference_threads t, cross_references x, _session253_tob8_lookup sv, _session253_tob8_lookup tv
 WHERE t.slug='tobit-8-thou-madest-adam-and-eve'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=8 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 1:27 — *So Elohim (God) created man in his own image, in the image of Elohim (God) created he him; male and female created he them.* The making of Adam and Eve that Tobit 8:6 recalls as the pattern of his own marriage.'
  FROM cross_reference_threads t, cross_references x, _session253_tob8_lookup sv, _session253_tob8_lookup tv
 WHERE t.slug='tobit-8-thou-madest-adam-and-eve'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=8 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-8-not-for-lust-but-uprightly
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Malachi 2:15 — *And did not he make one? Yet had he the residue of the spirit. And wherefore one? That he might seek a godly seed. Therefore take heed to your spirit, and let none deal treacherously against the wife of his youth.* The godly-seed purpose of marriage is precisely Tobias’s not-for-lust-but-uprightly (Tobit 8:7).'
  FROM cross_reference_threads t, cross_references x, _session253_tob8_lookup sv, _session253_tob8_lookup tv
 WHERE t.slug='tobit-8-not-for-lust-but-uprightly'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=8 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=2 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Malachi 2:14 — *Yet ye say, Wherefore? Because Yahuah (LORD) hath been witness between thee and the wife of thy youth, against whom thou hast dealt treacherously: yet is she thy companion, and the wife of thy covenant.* Yahuah is the witness of the marriage covenant Tobias makes openly before him (Tobit 8:7).'
  FROM cross_reference_threads t, cross_references x, _session253_tob8_lookup sv, _session253_tob8_lookup tv
 WHERE t.slug='tobit-8-not-for-lust-but-uprightly'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=8 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=2 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ephesians 5:25 — *Husbands, love your wives, even as Messiah (Christ) also loved the church, and gave himself for it;* the sacrificial, lifelong love that Tobias prays to live out, to grow aged together (Tobit 8:7).'
  FROM cross_reference_threads t, cross_references x, _session253_tob8_lookup sv, _session253_tob8_lookup tv
 WHERE t.slug='tobit-8-not-for-lust-but-uprightly'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=8 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=5 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-8-let-all-thy-creatures-praise-thee
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalms 148:2 — *Praise ye him, all his angels: praise ye him, all his hosts.* The heavens and creatures Tobias bids bless Yahuah are the very hosts Psalm 148 musters (Tobit 8:5).'
  FROM cross_reference_threads t, cross_references x, _session253_tob8_lookup sv, _session253_tob8_lookup tv
 WHERE t.slug='tobit-8-let-all-thy-creatures-praise-thee'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=8 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=148 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 148:5 — *Let them praise the name of Yahuah (LORD): for he commanded, and they were created.* All creatures praising their Maker is the ground of Tobias’s blessing of the holy and glorious name (Tobit 8:5).'
  FROM cross_reference_threads t, cross_references x, _session253_tob8_lookup sv, _session253_tob8_lookup tv
 WHERE t.slug='tobit-8-let-all-thy-creatures-praise-thee'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=8 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=148 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Tobit 13:18 — *And all her streets shall say, Alleluia; and they shall praise him, saying, Blessed be Yahuah (God), which has extolled it for ever.* Raguel’s call for saints, angels, and elect to praise forever is taken up in Tobit’s hymn of the regathered Jerusalem (Tobit 8:15).'
  FROM cross_reference_threads t, cross_references x, _session253_tob8_lookup sv, _session253_tob8_lookup tv
 WHERE t.slug='tobit-8-let-all-thy-creatures-praise-thee'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=8 AND sv.verse_number=15
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=13 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

