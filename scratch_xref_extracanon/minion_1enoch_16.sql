-- ----- fragment: minion_1enoch_16.sql (session250 1-enoch 16) -----
-- Source anchor: enoch/1-enoch ch16. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en16 (view _session250_en16_lookup). Sort band base 50375, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en16_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-16-watchers-union-genesis-6
  ('enoch', '1-enoch', 16, 2, 'canon', 'genesis', 6, 2, 'free', E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* The Watchers'' "union" with women in Enoch 16:2 is Moses'' sons-of-Elohim taking wives of the daughters of men.'),
  ('enoch', '1-enoch', 16, 2, 'canon', 'genesis', 6, 4, 'free', E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* The defilement Enoch names in 16:2 is the very union that produced the giants of Genesis 6.'),
  ('enoch', '1-enoch', 16, 2, 'canon', 'jude', 1, 6, 'free', E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude reads the Watchers'' crossing of the heaven-flesh boundary in Enoch 16:2 as angels abandoning their first estate, reserved for judgment.'),
  ('enoch', '1-enoch', 16, 2, 'jubilees', 'jubilees', 7, 21, 'extras', E'Jubilees 7:21 — *owing to the fornication wherein the Watchers against the law of their ordinances went a whoring after the daughters of men, and took themselves wives of all which they chose: and they made the beginning of uncleanness.* Jubilees names the same union of Enoch 16:2 as the Watchers breaking the law of their ordinances — the beginning of uncleanness on the earth.'),
  -- thread: 1-enoch-16-forbidden-mysteries-corruption
  ('enoch', '1-enoch', 16, 3, 'apocrypha', 'the-wisdom-of-solomon', 14, 12, 'extras', E'the Wisdom of Solomon 14:12 — *For the devising of idols was the beginning of spiritual fornication, and the invention of them the corruption of life.* The mysteries the Watchers showed to women in Enoch 16:3 are this same devised corruption that ruins life on earth.'),
  ('enoch', '1-enoch', 16, 3, 'apocrypha', 'the-wisdom-of-solomon', 14, 23, 'extras', E'the Wisdom of Solomon 14:23 — *For while they slew their children in sacrifices, or used secret ceremonies, or made revellings of strange rites.* The "secret ceremonies" of Wisdom mirror the destroying mysteries the Watchers passed to women in Enoch 16:3.'),
  ('enoch', '1-enoch', 16, 3, 'canon', '2-peter', 2, 1, 'free', E'2 Peter 2:1 — *But there were false prophets also among the people, even as there shall be false teachers among you, who privily shall bring in damnable heresies, even denying Yahuah (Lord) that bought them, and bring upon themselves swift destruction.* The forbidden teaching of Enoch 16:3 is the same privily-brought ruin Peter warns will work destruction in the last days.'),
  -- thread: 1-enoch-16-origin-evil-spirits-no-rest
  ('enoch', '1-enoch', 16, 1, 'canon', 'matthew', 12, 43, 'free', E'Matthew 12:43 — *When the unclean spirit is gone out of a man, he walketh through dry places, seeking rest, and findeth none.* The restless, bodiless wanderer Yahusha describes is the giant-spirit Enoch 16 inherits from the slain Watchers'' offspring, hungering without flesh of its own.'),
  ('enoch', '1-enoch', 16, 3, 'canon', 'matthew', 12, 45, 'free', E'Matthew 12:45 — *Then goeth he, and taketh with himself seven other spirits more wicked than himself, and they enter in and dwell there: and the last state of that man is worse than the first. Even so shall it be also unto this wicked generation.* The destruction the spirits work in Enoch 16:3 is the same evil-spirit campaign Yahusha says worsens the one it inhabits.'),
  ('enoch', '1-enoch', 16, 1, 'canon', '2-peter', 2, 4, 'free', E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment.* Peter affirms the Watchers'' binding that stands behind Enoch 16''s loosed evil spirits — the fallen ones chained, reserved unto the great judgment.'),
  -- thread: 1-enoch-16-no-peace-petition-refused
  ('enoch', '1-enoch', 16, 4, 'canon', 'genesis', 6, 3, 'free', E'Genesis 6:3 — *And Yahuah (LORD) said, My spirit shall not always strive with man, for that he also is flesh: yet his days shall be an hundred and twenty years.* The "no peace" verdict of Enoch 16:4 is the closing door of Genesis 6:3 — a fixed term granted, then judgement, with no reprieve for corrupted flesh.'),
  ('enoch', '1-enoch', 16, 4, 'canon', 'jude', 1, 14, 'free', E'Jude 1:14 — *And Enoch also, the seventh from Adam, prophesied of these, saying, Behold, Yahuah (Lord) cometh with ten thousands of his saints.* Jude cites Enoch by name; the "no peace" of 16:4 is the near edge of the coming-in-judgement Enoch prophesied.'),
  ('enoch', '1-enoch', 16, 4, 'canon', 'jude', 1, 15, 'free', E'Jude 1:15 — *To execute judgment upon all, and to convince all that are ungodly among them of all their ungodly deeds which they have ungodly committed, and of all their hard speeches which ungodly sinners have spoken against him.* The refused petition of Enoch 16:4 anticipates this executed judgment Jude draws straight from Enoch''s own words.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en16_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en16_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-16-watchers-union-genesis-6',
       E'The union the Watchers should never have made',
       E'Enoch''s commission closes by naming the crime once more: *With the spiritual ones have ye had union, with the women have ye defiled yourselves, and with the blood of women have ye lusted, and with the flesh and blood of men have ye drunk wine* (1 Enoch 16:2). This is not a new myth grafted onto Scripture — it is the canon''s own Genesis 6 unfolded. Moses wrote it plainly: *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose* (Genesis 6:2), and *There were giants in the earth in those days* (Genesis 6:4). The sin is rebellion against the Creator''s ordered boundaries — heaven''s spiritual ones leaving their estate to mingle with flesh — which is exactly how Jude reads it: *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day* (Jude 1:6). Jubilees keeps the same testimony, that *the Watchers against the law of their ordinances went a whoring after the daughters of men, and took themselves wives of all which they chose: and they made the beginning of uncleanness* (Jubilees 7:21). One descent, one defilement, witnessed across Genesis, Enoch, Jude, and Jubilees alike.',
       sv.verse_id, ev.verse_id, 'extras', 50375
  FROM _session250_en16_lookup sv, _session250_en16_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=16 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=16 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-16-forbidden-mysteries-corruption',
       E'The mysteries that work destruction',
       E'The Watchers did not only defile themselves; they handed down forbidden knowledge: *And these things have ye shown to women, and through these mysteries women and men work much destruction on earth* (1 Enoch 16:3). This is the seed-war sown — corrupting arts taught against the Creator''s order, multiplying ruin. The Wisdom of Solomon traces the same chain, that *the devising of idols was the beginning of spiritual fornication, and the invention of them the corruption of life* (the Wisdom of Solomon 14:12), and that those who *used secret ceremonies, or made revellings of strange rites* thereby *kept neither lives nor marriages any longer undefiled* (the Wisdom of Solomon 14:23-24). Peter sets the same pattern in the last days: false teachers *who privily shall bring in damnable heresies* (2 Peter 2:1), so that *by reason of whom the way of truth shall be evil spoken of* (2 Peter 2:2). Forbidden mysteries shown to the unguarded are how destruction has always spread — and the Torah still stands as the boundary the rebels crossed.',
       sv.verse_id, ev.verse_id, 'extras', 50378
  FROM _session250_en16_lookup sv, _session250_en16_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=16 AND sv.verse_number=3
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=16 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-16-origin-evil-spirits-no-rest',
       E'Evil spirits from the giants, seeking rest',
       E'Chapter 16 follows directly from the judgement just declared, that the slain giants leave behind spirits who *destroy without incurring judgement* until the consummation (1 Enoch 15:11) — disembodied, restless, hungering yet without flesh. Yahusha names exactly these wandering spirits: *When the unclean spirit is gone out of a man, he walketh through dry places, seeking rest, and findeth none* (Matthew 12:43). The dry-place wanderer with no body to dwell in is the giant-spirit of Enoch''s account — and the warning that *the last state of that man is worse than the first* (Matthew 12:45) shows the same campaign of destruction Enoch describes still running. Peter confirms the binding that holds the fallen Watchers behind these spirits: *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment* (2 Peter 2:4). The Watchers chained; their giant-offspring''s spirits loosed for a time — the origin of the evil spirits is not invented by the Gospels but carried into them.',
       sv.verse_id, ev.verse_id, 'extras', 50381
  FROM _session250_en16_lookup sv, _session250_en16_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=16 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=16 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-16-no-peace-petition-refused',
       E'"You have no peace" — the petition refused',
       E'Enoch''s commission ends with a verdict, not a reprieve: *Say to them therefore: "You have no peace."* (1 Enoch 16:4). The Watchers had sent Enoch up to intercede for them; the answer comes back that there is no peace for those who broke heaven''s order. Genesis records the same sentence on flesh that has corrupted its way: *And Yahuah (LORD) said, My spirit shall not always strive with man, for that he also is flesh: yet his days shall be an hundred and twenty years* (Genesis 6:3) — a closing door, a fixed term before judgement. Jude, quoting Enoch the seventh from Adam, declares the verdict''s full reach: *Behold, Yahuah (Lord) cometh with ten thousands of his saints, To execute judgment upon all, and to convince all that are ungodly among them of all their ungodly deeds which they have ungodly committed* (Jude 1:14-15). The refused petition of the Watchers and the announced coming-with-judgement are one continuous word — no peace for the rebel, while the way of righteousness stands open for those who keep it.',
       sv.verse_id, ev.verse_id, 'extras', 50384
  FROM _session250_en16_lookup sv, _session250_en16_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=16 AND sv.verse_number=4
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=16 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-16-watchers-union-genesis-6
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* The Watchers'' "union" with women in Enoch 16:2 is Moses'' sons-of-Elohim taking wives of the daughters of men.'
  FROM cross_reference_threads t, cross_references x, _session250_en16_lookup sv, _session250_en16_lookup tv
 WHERE t.slug='1-enoch-16-watchers-union-genesis-6'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=16 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* The defilement Enoch names in 16:2 is the very union that produced the giants of Genesis 6.'
  FROM cross_reference_threads t, cross_references x, _session250_en16_lookup sv, _session250_en16_lookup tv
 WHERE t.slug='1-enoch-16-watchers-union-genesis-6'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=16 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude reads the Watchers'' crossing of the heaven-flesh boundary in Enoch 16:2 as angels abandoning their first estate, reserved for judgment.'
  FROM cross_reference_threads t, cross_references x, _session250_en16_lookup sv, _session250_en16_lookup tv
 WHERE t.slug='1-enoch-16-watchers-union-genesis-6'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=16 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 7:21 — *owing to the fornication wherein the Watchers against the law of their ordinances went a whoring after the daughters of men, and took themselves wives of all which they chose: and they made the beginning of uncleanness.* Jubilees names the same union of Enoch 16:2 as the Watchers breaking the law of their ordinances — the beginning of uncleanness on the earth.'
  FROM cross_reference_threads t, cross_references x, _session250_en16_lookup sv, _session250_en16_lookup tv
 WHERE t.slug='1-enoch-16-watchers-union-genesis-6'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=16 AND sv.verse_number=2
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=7 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-16-forbidden-mysteries-corruption
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'the Wisdom of Solomon 14:12 — *For the devising of idols was the beginning of spiritual fornication, and the invention of them the corruption of life.* The mysteries the Watchers showed to women in Enoch 16:3 are this same devised corruption that ruins life on earth.'
  FROM cross_reference_threads t, cross_references x, _session250_en16_lookup sv, _session250_en16_lookup tv
 WHERE t.slug='1-enoch-16-forbidden-mysteries-corruption'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=16 AND sv.verse_number=3
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=14 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'the Wisdom of Solomon 14:23 — *For while they slew their children in sacrifices, or used secret ceremonies, or made revellings of strange rites.* The "secret ceremonies" of Wisdom mirror the destroying mysteries the Watchers passed to women in Enoch 16:3.'
  FROM cross_reference_threads t, cross_references x, _session250_en16_lookup sv, _session250_en16_lookup tv
 WHERE t.slug='1-enoch-16-forbidden-mysteries-corruption'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=16 AND sv.verse_number=3
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=14 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Peter 2:1 — *But there were false prophets also among the people, even as there shall be false teachers among you, who privily shall bring in damnable heresies, even denying Yahuah (Lord) that bought them, and bring upon themselves swift destruction.* The forbidden teaching of Enoch 16:3 is the same privily-brought ruin Peter warns will work destruction in the last days.'
  FROM cross_reference_threads t, cross_references x, _session250_en16_lookup sv, _session250_en16_lookup tv
 WHERE t.slug='1-enoch-16-forbidden-mysteries-corruption'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=16 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-16-origin-evil-spirits-no-rest
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 12:43 — *When the unclean spirit is gone out of a man, he walketh through dry places, seeking rest, and findeth none.* The restless, bodiless wanderer Yahusha describes is the giant-spirit Enoch 16 inherits from the slain Watchers'' offspring, hungering without flesh of its own.'
  FROM cross_reference_threads t, cross_references x, _session250_en16_lookup sv, _session250_en16_lookup tv
 WHERE t.slug='1-enoch-16-origin-evil-spirits-no-rest'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=16 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=12 AND tv.verse_number=43
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 12:45 — *Then goeth he, and taketh with himself seven other spirits more wicked than himself, and they enter in and dwell there: and the last state of that man is worse than the first. Even so shall it be also unto this wicked generation.* The destruction the spirits work in Enoch 16:3 is the same evil-spirit campaign Yahusha says worsens the one it inhabits.'
  FROM cross_reference_threads t, cross_references x, _session250_en16_lookup sv, _session250_en16_lookup tv
 WHERE t.slug='1-enoch-16-origin-evil-spirits-no-rest'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=16 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=12 AND tv.verse_number=45
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment.* Peter affirms the Watchers'' binding that stands behind Enoch 16''s loosed evil spirits — the fallen ones chained, reserved unto the great judgment.'
  FROM cross_reference_threads t, cross_references x, _session250_en16_lookup sv, _session250_en16_lookup tv
 WHERE t.slug='1-enoch-16-origin-evil-spirits-no-rest'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=16 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-16-no-peace-petition-refused
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:3 — *And Yahuah (LORD) said, My spirit shall not always strive with man, for that he also is flesh: yet his days shall be an hundred and twenty years.* The "no peace" verdict of Enoch 16:4 is the closing door of Genesis 6:3 — a fixed term granted, then judgement, with no reprieve for corrupted flesh.'
  FROM cross_reference_threads t, cross_references x, _session250_en16_lookup sv, _session250_en16_lookup tv
 WHERE t.slug='1-enoch-16-no-peace-petition-refused'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=16 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jude 1:14 — *And Enoch also, the seventh from Adam, prophesied of these, saying, Behold, Yahuah (Lord) cometh with ten thousands of his saints.* Jude cites Enoch by name; the "no peace" of 16:4 is the near edge of the coming-in-judgement Enoch prophesied.'
  FROM cross_reference_threads t, cross_references x, _session250_en16_lookup sv, _session250_en16_lookup tv
 WHERE t.slug='1-enoch-16-no-peace-petition-refused'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=16 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jude 1:15 — *To execute judgment upon all, and to convince all that are ungodly among them of all their ungodly deeds which they have ungodly committed, and of all their hard speeches which ungodly sinners have spoken against him.* The refused petition of Enoch 16:4 anticipates this executed judgment Jude draws straight from Enoch''s own words.'
  FROM cross_reference_threads t, cross_references x, _session250_en16_lookup sv, _session250_en16_lookup tv
 WHERE t.slug='1-enoch-16-no-peace-petition-refused'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=16 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

