-- ----- fragment: minion_2maccabees_14.sql (session253 2-maccabees 14) -----
-- Source anchor: apocrypha/2-maccabees ch14. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2mac14 (view _session253_2mac14_lookup). Sort band base 62325, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2mac14_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-maccabees-14-razis-restore-bowels
  ('apocrypha', '2-maccabees', 14, 46, 'apocrypha', '2-maccabees', 7, 9, 'extras', E'2 Maccabees 7:9 — *And when he was at the last gasp, he said, You like a fury takest us out of this present life, but the King of the world shall raise us up, who have died for his laws, to everlasting life.* The seven brothers and Razis share one confession — the King of the world will raise up those who die for His laws, so 2 Maccabees 14:46 can hand back its very bowels in faith.'),
  ('apocrypha', '2-maccabees', 14, 46, 'apocrypha', '2-maccabees', 7, 11, 'extras', E'2 Maccabees 7:11 — *And said courageously, These I had from heaven; and for his laws I despise them; and from him I hope to receive them again.* The brother''s words over his own severed hands and tongue are Razis'' words over his own cast-out bowels in 2 Maccabees 14:46 — received from heaven, surrendered for the law, hoped back from the same hand.'),
  ('apocrypha', '2-maccabees', 14, 46, 'canon', 'job', 19, 25, 'free', E'Job 19:25 — *For I know that my redeemer liveth, and that he shall stand at the latter day upon the earth:* Razis dies on this ancient certainty — that the living Redeemer stands at the latter day to restore what the grave takes, so 2 Maccabees 14:46 entrusts the flesh itself to Him.'),
  ('apocrypha', '2-maccabees', 14, 46, 'canon', 'daniel', 12, 2, 'free', E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The awaking from the dust that Daniel saw under this same Greek kingdom is the restoration Razis calls upon at 2 Maccabees 14:46.'),
  ('apocrypha', '2-maccabees', 14, 46, 'canon', 'john', 5, 29, 'free', E'John 5:29 — *And shall come forth; they that have done good, unto the resurrection of life; and they that have done evil, unto the resurrection of damnation.* The Messiah names the very hour Razis reached for — the resurrection of life that gives back the body — confirming the hope of 2 Maccabees 14:46 is no novelty.'),
  -- thread: 2-maccabees-14-die-rather-than-defiled
  ('apocrypha', '2-maccabees', 14, 42, 'canon', 'hebrews', 11, 35, 'free', E'Hebrews 11:35 — *Women received their dead raised to life again: and others were tortured, not accepting deliverance; that they might obtain a better resurrection:* The faith roll''s tortured who refused deliverance for a better resurrection are these very Maccabean martyrs, so Razis'' choice to die rather than be taken at 2 Maccabees 14:42 is the apostle''s own example of faith.'),
  ('apocrypha', '2-maccabees', 14, 38, 'apocrypha', '2-maccabees', 7, 14, 'extras', E'2 Maccabees 7:14 — *So when he was ready to die he said thus, It is good, being put to death by men, to look for hope from Yahuah (God) to be raised up again by him: as for you, you shall have no resurrection to life.* Razis'' lifelong jeopardy of body and life for the religion of the Yahudim at 2 Maccabees 14:38 rests on the same hope the dying brother named — put to death by men, raised again by Yahuah.'),
  -- thread: 2-maccabees-14-nicanor-blasphemes-temple
  ('apocrypha', '2-maccabees', 14, 33, 'canon', '2-kings', 19, 22, 'free', E'2 Kings 19:22 — *Whom hast thou reproached and blasphemed? and against whom hast thou exalted thy voice, and lifted up thine eyes on high? even against the Holy One of Yashar''el (Israel).* Nicanor''s hand raised against the temple at 2 Maccabees 14:33 is Sennacherib''s exalted voice all over again — the reproach falls not on Israel but on the Holy One who defends His house.'),
  ('apocrypha', '2-maccabees', 14, 33, 'canon', 'psalms', 74, 7, 'free', E'Psalm 74:7 — *They have cast fire into thy sanctuary, they have defiled by casting down the dwelling place of thy name to the ground.* The very threat Nicanor swears at 2 Maccabees 14:33 — to lay the temple even with the ground — is the desolation Asaph already mourned and laid before Yahuah.'),
  ('apocrypha', '2-maccabees', 14, 33, 'canon', 'psalms', 74, 10, 'free', E'Psalm 74:10 — *O Elohim (God), how long shall the adversary reproach? shall the enemy blaspheme thy name for ever?* The blaspheming adversary of the psalm is Nicanor swearing against the house at 2 Maccabees 14:33 — and the cry ''how long'' is answered when Yahuah strikes him down in the next chapter.'),
  -- thread: 2-maccabees-14-keep-this-house-undefiled
  ('apocrypha', '2-maccabees', 14, 36, 'canon', 'john', 10, 22, 'free', E'John 10:22 — *And it was at Jerusalem the feast of the dedication, and it was winter.* The house ''lately cleansed'' that the priests beg to keep undefiled at 2 Maccabees 14:36 is the Maccabean rededication — the feast of dedication the Messiah Himself kept in Jerusalem.'),
  ('apocrypha', '2-maccabees', 14, 35, 'canon', 'psalms', 74, 10, 'free', E'Psalm 74:10 — *O Elohim (God), how long shall the adversary reproach? shall the enemy blaspheme thy name for ever?* The priests'' plea that Yahuah dwell among them at 2 Maccabees 14:35 is the answer to Asaph''s ''how long'' — the God who chose this habitation will not let the blasphemer''s mouth go unstopped.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2mac14_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2mac14_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-14-razis-restore-bowels',
       E'Razis casts himself down, calling on the Lord of life to restore him',
       E'Noble Razis, hemmed in on every side rather than fall into the hand of the wicked, makes his own body the witness of the resurrection: *When as his blood was now quite gone, he plucked out his bowels, and taking them in both his hands, he cast them upon the throng, and calling upon Yahuah (God) of life and spirit to restore him those again, he thus died.* (2 Maccabees 14:46). This is the same hope the seven brothers of chapter 7 confessed before the same persecuting kingdom: *And when he was at the last gasp, he said, You like a fury takest us out of this present life, but the King of the world shall raise us up, who have died for his laws, to everlasting life.* (2 Maccabees 7:9), and *And said courageously, These I had from heaven; and for his laws I despise them; and from him I hope to receive them again.* (2 Maccabees 7:11) — the very bowels and limbs given back. Iyob (Job) had seen it long before from his ash-heap: *For I know that my redeemer liveth, and that he shall stand at the latter day upon the earth:* (Job 19:25), *And though after my skin worms destroy this body, yet in my flesh shall I see Elohim (God):* (Job 19:26). Daniel sealed it: *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* (Daniel 12:2). And the Messiah Himself named the hour Razis was reaching for: *And shall come forth; they that have done good, unto the resurrection of life; and they that have done evil, unto the resurrection of damnation.* (John 5:29). It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 62325
  FROM _session253_2mac14_lookup sv, _session253_2mac14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=14 AND sv.verse_number=46
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=14 AND ev.verse_number=46
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-14-die-rather-than-defiled',
       E'Choosing to die manfully rather than fall into the hands of the wicked',
       E'Razis, a father of the Yahudim accused of his Torah-faithfulness, refuses the enemy''s hand: *Choosing rather to die manfully, than to come into the hands of the wicked, to be abused otherwise than beseemed his noble birth:* (2 Maccabees 14:42). He had long before *jeopard his body and life with all vehemency for the religion of the Yahudim (Jews).* (2 Maccabees 14:38) — covenant kept unto death, never the law as a curse but the law as life worth dying for. This is the witness the writer to the Hebrews names: *Women received their dead raised to life again: and others were tortured, not accepting deliverance; that they might obtain a better resurrection:* (Hebrews 11:35). The tortured who would not accept deliverance ARE the Maccabean martyrs — Eleazar, the seven brothers, and Razis — and the *better resurrection* they refused deliverance to obtain is the very restoration of the body he prays for as he dies.',
       sv.verse_id, ev.verse_id, 'extras', 62328
  FROM _session253_2mac14_lookup sv, _session253_2mac14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=14 AND sv.verse_number=42
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=14 AND ev.verse_number=42
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-14-nicanor-blasphemes-temple',
       E'Nicanor stretches out his hand against the temple — the blasphemer''s reproach',
       E'Nicanor lifts his right hand against the house of Yahuah and threatens to set up an idol in its place: *He stretched out his right hand toward the temple, and made an oath in this manner: If you will not deliver me Judas as a prisoner, I will lay this temple of Yahuah (God) even with the ground, and I will break down the altar, and erect a notable temple to Bacchus.* (2 Maccabees 14:33). It is the proud voice raised against the Holy One — the same Assyrian arrogance Yahuah answered through Yeshayahu (Isaiah) against Sennacherib: *Whom hast thou reproached and blasphemed? and against whom hast thou exalted thy voice, and lifted up thine eyes on high? even against the Holy One of Yashar''el (Israel).* (2 Kings 19:22). Asaph had wept over the very desolation Nicanor threatens: *They have cast fire into thy sanctuary, they have defiled by casting down the dwelling place of thy name to the ground.* (Psalm 74:7), crying *O Elohim (God), how long shall the adversary reproach? shall the enemy blaspheme thy name for ever?* (Psalm 74:10). Antiochus'' kingdom is the system of the man who exalts his voice against heaven — and heaven, not the sword, brings it down.',
       sv.verse_id, ev.verse_id, 'extras', 62331
  FROM _session253_2mac14_lookup sv, _session253_2mac14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=14 AND sv.verse_number=33
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=14 AND ev.verse_number=33
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-14-keep-this-house-undefiled',
       E'The priests plead: keep this house ever undefiled, lately cleansed',
       E'Against the threatened abomination the priests appeal to the Defender of the nation to guard the house newly rededicated: *Therefore now, O holy Yahuah (God) of all holiness, keep this house ever undefiled, which lately was cleansed, and stop every unrighteous mouth.* (2 Maccabees 14:36), pleading with *You, O Yahuah (God) of all things, who have need of nothing, were pleased that the temple of yours habitation should be among us:* (2 Maccabees 14:35). The cleansing ''lately'' done is the rededication the Messiah Himself would keep — *And it was at Jerusalem the feast of the dedication, and it was winter.* (John 10:22) — and the One who has need of nothing yet chose to dwell among His people is the same Elohim whose name the enemy blasphemes. The temple kept undefiled here points past the desolation Daniel foresaw to the day the prayer is fully answered, the unrighteous mouth at last stopped.',
       sv.verse_id, ev.verse_id, 'extras', 62334
  FROM _session253_2mac14_lookup sv, _session253_2mac14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=14 AND sv.verse_number=36
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=14 AND ev.verse_number=36
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-maccabees-14-razis-restore-bowels
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Maccabees 7:9 — *And when he was at the last gasp, he said, You like a fury takest us out of this present life, but the King of the world shall raise us up, who have died for his laws, to everlasting life.* The seven brothers and Razis share one confession — the King of the world will raise up those who die for His laws, so 2 Maccabees 14:46 can hand back its very bowels in faith.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac14_lookup sv, _session253_2mac14_lookup tv
 WHERE t.slug='2-maccabees-14-razis-restore-bowels'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=14 AND sv.verse_number=46
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Maccabees 7:11 — *And said courageously, These I had from heaven; and for his laws I despise them; and from him I hope to receive them again.* The brother''s words over his own severed hands and tongue are Razis'' words over his own cast-out bowels in 2 Maccabees 14:46 — received from heaven, surrendered for the law, hoped back from the same hand.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac14_lookup sv, _session253_2mac14_lookup tv
 WHERE t.slug='2-maccabees-14-razis-restore-bowels'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=14 AND sv.verse_number=46
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=7 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Job 19:25 — *For I know that my redeemer liveth, and that he shall stand at the latter day upon the earth:* Razis dies on this ancient certainty — that the living Redeemer stands at the latter day to restore what the grave takes, so 2 Maccabees 14:46 entrusts the flesh itself to Him.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac14_lookup sv, _session253_2mac14_lookup tv
 WHERE t.slug='2-maccabees-14-razis-restore-bowels'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=14 AND sv.verse_number=46
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=19 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The awaking from the dust that Daniel saw under this same Greek kingdom is the restoration Razis calls upon at 2 Maccabees 14:46.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac14_lookup sv, _session253_2mac14_lookup tv
 WHERE t.slug='2-maccabees-14-razis-restore-bowels'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=14 AND sv.verse_number=46
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'John 5:29 — *And shall come forth; they that have done good, unto the resurrection of life; and they that have done evil, unto the resurrection of damnation.* The Messiah names the very hour Razis reached for — the resurrection of life that gives back the body — confirming the hope of 2 Maccabees 14:46 is no novelty.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac14_lookup sv, _session253_2mac14_lookup tv
 WHERE t.slug='2-maccabees-14-razis-restore-bowels'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=14 AND sv.verse_number=46
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=5 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-14-die-rather-than-defiled
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 11:35 — *Women received their dead raised to life again: and others were tortured, not accepting deliverance; that they might obtain a better resurrection:* The faith roll''s tortured who refused deliverance for a better resurrection are these very Maccabean martyrs, so Razis'' choice to die rather than be taken at 2 Maccabees 14:42 is the apostle''s own example of faith.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac14_lookup sv, _session253_2mac14_lookup tv
 WHERE t.slug='2-maccabees-14-die-rather-than-defiled'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=14 AND sv.verse_number=42
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Maccabees 7:14 — *So when he was ready to die he said thus, It is good, being put to death by men, to look for hope from Yahuah (God) to be raised up again by him: as for you, you shall have no resurrection to life.* Razis'' lifelong jeopardy of body and life for the religion of the Yahudim at 2 Maccabees 14:38 rests on the same hope the dying brother named — put to death by men, raised again by Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac14_lookup sv, _session253_2mac14_lookup tv
 WHERE t.slug='2-maccabees-14-die-rather-than-defiled'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=14 AND sv.verse_number=38
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-14-nicanor-blasphemes-temple
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Kings 19:22 — *Whom hast thou reproached and blasphemed? and against whom hast thou exalted thy voice, and lifted up thine eyes on high? even against the Holy One of Yashar''el (Israel).* Nicanor''s hand raised against the temple at 2 Maccabees 14:33 is Sennacherib''s exalted voice all over again — the reproach falls not on Israel but on the Holy One who defends His house.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac14_lookup sv, _session253_2mac14_lookup tv
 WHERE t.slug='2-maccabees-14-nicanor-blasphemes-temple'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=14 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=19 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 74:7 — *They have cast fire into thy sanctuary, they have defiled by casting down the dwelling place of thy name to the ground.* The very threat Nicanor swears at 2 Maccabees 14:33 — to lay the temple even with the ground — is the desolation Asaph already mourned and laid before Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac14_lookup sv, _session253_2mac14_lookup tv
 WHERE t.slug='2-maccabees-14-nicanor-blasphemes-temple'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=14 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=74 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 74:10 — *O Elohim (God), how long shall the adversary reproach? shall the enemy blaspheme thy name for ever?* The blaspheming adversary of the psalm is Nicanor swearing against the house at 2 Maccabees 14:33 — and the cry ''how long'' is answered when Yahuah strikes him down in the next chapter.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac14_lookup sv, _session253_2mac14_lookup tv
 WHERE t.slug='2-maccabees-14-nicanor-blasphemes-temple'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=14 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=74 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-14-keep-this-house-undefiled
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 10:22 — *And it was at Jerusalem the feast of the dedication, and it was winter.* The house ''lately cleansed'' that the priests beg to keep undefiled at 2 Maccabees 14:36 is the Maccabean rededication — the feast of dedication the Messiah Himself kept in Jerusalem.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac14_lookup sv, _session253_2mac14_lookup tv
 WHERE t.slug='2-maccabees-14-keep-this-house-undefiled'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=14 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=10 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 74:10 — *O Elohim (God), how long shall the adversary reproach? shall the enemy blaspheme thy name for ever?* The priests'' plea that Yahuah dwell among them at 2 Maccabees 14:35 is the answer to Asaph''s ''how long'' — the God who chose this habitation will not let the blasphemer''s mouth go unstopped.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac14_lookup sv, _session253_2mac14_lookup tv
 WHERE t.slug='2-maccabees-14-keep-this-house-undefiled'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=14 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=74 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

