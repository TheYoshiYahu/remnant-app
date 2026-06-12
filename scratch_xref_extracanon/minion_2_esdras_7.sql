-- ----- fragment: minion_2esdras_07.sql (session253 2-esdras 7) -----
-- Source anchor: apocrypha/2-esdras ch7. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2esd7 (view _session253_2esd7_lookup). Sort band base 63150, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2esd7_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-esdras-7-strait-gate-inheritance
  ('apocrypha', '2-esdras', 7, 7, 'canon', 'matthew', 7, 13, 'free', E'Matthew 7:13 — *Enter ye in at the strait gate: for wide is the gate, and broad is the way, that leadeth to destruction, and many there be which go in thereat:* The broad way to destruction is Esdras''s wide door of the present world that brings not life.'),
  ('apocrypha', '2-esdras', 7, 8, 'canon', 'matthew', 7, 14, 'free', E'Matthew 7:14 — *Because strait is the gate, and narrow is the way, which leadeth unto life, and few there be that find it.* The one-man path between fire and water is Yahusha''s narrow way that few find.'),
  ('apocrypha', '2-esdras', 7, 14, 'canon', 'luke', 13, 24, 'free', E'Luke 13:24 — *Strive to enter in at the strait gate: for many, I say unto you, will seek to enter in, and shall not be able.* Those who labour not to enter the strait things can never receive what is laid up, exactly as Yahusha warns of the many who shall not be able.'),
  -- thread: 2-esdras-7-israel-portion-not-cast-away
  ('apocrypha', '2-esdras', 7, 10, 'canon', 'romans', 11, 1, 'free', E'Romans 11:1 — *I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin.* The narrow inheritance is still Israel''s portion — the remnant keeps it, the people are not cast away.'),
  ('apocrypha', '2-esdras', 7, 18, 'canon', 'deuteronomy', 30, 19, 'free', E'Deuteronomy 30:19 — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live:* The righteous who suffer strait things and hope for wide are the seed that chose life, just as Moses set it before Israel.'),
  -- thread: 2-esdras-7-my-son-the-messiah
  ('apocrypha', '2-esdras', 7, 28, 'canon', 'revelation', 20, 6, 'free', E'Revelation 20:6 — *Blessed and holy is he that hath part in the first resurrection: on such the second death hath no power, but they shall be priests of Elohim (God) and of Messiah (Christ), and shall reign with him a thousand years.* My son the Messiah revealed with those that be with him, rejoicing for an age, is the reign of the firstfruits in the first resurrection.'),
  ('apocrypha', '2-esdras', 7, 29, 'canon', '1-corinthians', 15, 22, 'free', E'1 Corinthians 15:22 — *For as in Adam all die, even so in Messiah (Christ) shall all be made alive.* That my son Messiah shall die, and all men that have life, is the very Adam-and-Messiah ordering Sha''ul preaches.'),
  ('apocrypha', '2-esdras', 7, 29, 'canon', '1-corinthians', 15, 23, 'free', E'1 Corinthians 15:23 — *But every man in his own order: Messiah (Christ) the firstfruits; afterward they that are Messiah''s (Christ''s) at his coming.* The Messiah dies first, then all that have life follow in their own order, as Esdras foretells.'),
  -- thread: 2-esdras-7-silence-and-the-raising
  ('apocrypha', '2-esdras', 7, 32, 'canon', 'daniel', 12, 2, 'free', E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The earth restoring those asleep in her, the dust giving up those in silence, is Daniel''s sleepers waking from the dust.'),
  ('apocrypha', '2-esdras', 7, 32, 'canon', 'john', 5, 28, 'free', E'John 5:28 — *Marvel not at this: for the hour is coming, in the which all that are in the graves shall hear his voice,* The secret places delivering up the committed souls is the hour when all in the graves hear His voice.'),
  ('apocrypha', '2-esdras', 7, 32, 'canon', 'revelation', 20, 13, 'free', E'Revelation 20:13 — *And the sea gave up the dead which were in it; and death and hell delivered up the dead which were in them: and they were judged every man according to their works.* The dust and the secret places yielding their dead is John''s sea, death, and hell giving up theirs for the judgment.'),
  -- thread: 2-esdras-7-seat-of-judgment-day-of-doom
  ('apocrypha', '2-esdras', 7, 33, 'canon', 'matthew', 25, 31, 'free', E'Matthew 25:31 — *When the Son of Adam shall come in his glory, and all the holy angels with him, then shall he sit upon the throne of his glory:* The Most High appearing on the seat of judgment is the Son of Adam taking the throne of His glory.'),
  ('apocrypha', '2-esdras', 7, 43, 'canon', 'matthew', 25, 46, 'free', E'Matthew 25:46 — *And these shall go away into everlasting punishment: but the righteous into life eternal.* The day of doom that begins the immortality to come is the parting of the cursed and the righteous at Yahusha''s judgment.'),
  ('apocrypha', '2-esdras', 7, 33, 'canon', 'revelation', 20, 11, 'free', E'Revelation 20:11 — *And I saw a great white throne, and him that sat on it, from whose face the earth and the heaven fled away; and there was found no place for them.* The Most High upon the seat of judgment, misery passing away, is John''s great white throne before which earth and heaven flee.'),
  -- thread: 2-esdras-7-in-adam-all-die
  ('apocrypha', '2-esdras', 7, 48, 'canon', 'romans', 5, 12, 'free', E'Romans 5:12 — *Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned:* That Adam fell not alone but all that come of him fall is Sha''ul''s one man by whom death passed upon all.'),
  ('apocrypha', '2-esdras', 7, 11, 'canon', 'romans', 5, 19, 'free', E'Romans 5:19 — *For as by one man''s disobedience many were made sinners, so by the obedience of one shall many be made righteous.* Adam''s transgression decreeing the death that now is done is answered by the obedience of the one who makes many righteous.'),
  -- thread: 2-esdras-7-choose-life-few-saved
  ('apocrypha', '2-esdras', 7, 59, 'canon', 'deuteronomy', 30, 15, 'free', E'Deuteronomy 30:15 — *See, I have set before thee this day life and good, and death and evil;* The life of which Moses spoke, choose life that you may live, is the very setting of life and good against death and evil.'),
  ('apocrypha', '2-esdras', 7, 58, 'canon', 'revelation', 14, 13, 'free', E'Revelation 14:13 — *And I heard a voice from heaven saying unto me, Write, Blessed are the dead which die in Yahuah (Lord) from henceforth: Yea, saith the Spirit, that they may rest from their labours; and their works do follow them.* He that gets the victory receives the thing the angel promised — the blessed rest of the dead who die in Yahuah, their works following.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2esd7_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2esd7_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-7-strait-gate-inheritance',
       E'The narrow path between fire and water — the strait gate',
       E'The angel sets before Esdras a city of all good things, but the way in is deadly: *The entrance thereof is narrow, and is set in a dangerous place to fall, like as if there were a fire on the right hand, and on the left a deep water* (2 Esdras 7:7), *And one only path between them both, even between the fire and the water, so small that there could but one man go there at once* (2 Esdras 7:8) — and the inheritance is only for the one who passes the danger set before it. Yahusha draws the same map: *Enter ye in at the strait gate: for wide is the gate, and broad is the way, that leadeth to destruction, and many there be which go in thereat* (Matthew 7:13), *Because strait is the gate, and narrow is the way, which leadeth unto life, and few there be that find it* (Matthew 7:14). When one asked whether few are saved, He answered the very thing: *Strive to enter in at the strait gate: for many, I say unto you, will seek to enter in, and shall not be able* (Luke 13:24). It ain''t new — the few-find-it road was already the witness of the elders.',
       sv.verse_id, ev.verse_id, 'extras', 63150
  FROM _session253_2esd7_lookup sv, _session253_2esd7_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=7 AND sv.verse_number=7
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=7 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-7-israel-portion-not-cast-away',
       E'Israel''s portion — the inheritance kept for the faithful remnant',
       E'The whole parable lands on one word: *Even so also is Yashar''el (Israel)''s portion* (2 Esdras 7:10) — the narrow inheritance is Israel''s inheritance, won by the faithful who pass the danger, not transferred away from the seed. The righteous walk the hard road in hope: *Nevertheless the righteous shall suffer strait things, and hope for wide* (2 Esdras 7:18). This is no church replacing Israel; it is the covenant standing while the unfaithful forfeit, and the elect remnant keeps the portion — *I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin* (Romans 11:1). The choice the angel presses was Moses''s own charge: *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live* (Deuteronomy 30:19) — the seed lives by choosing the covenant, not by being supplanted.',
       sv.verse_id, ev.verse_id, 'extras', 63153
  FROM _session253_2esd7_lookup sv, _session253_2esd7_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=7 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=7 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-7-my-son-the-messiah',
       E'My son the Messiah revealed — and the Messiah die',
       E'Here 4 Ezra speaks its own messianism plainly: *For my son the Messiah shall be revealed with those that be with him, and they that remain shall rejoice within four hundred years* (2 Esdras 7:28), *After these years shall my son Messiah (Christ) die, and all men that have life* (2 Esdras 7:29). A revealed Son called Messiah, who reigns with those that are His, and then dies — the death of Messiah is no NT novelty; it stands written here as Israel''s own expectation. Sha''ul preaches the same order of the ages: *For as in Adam all die, even so in Messiah (Christ) shall all be made alive* (1 Corinthians 15:22), *But every man in his own order: Messiah (Christ) the firstfruits; afterward they that are Messiah''s (Christ''s) at his coming* (1 Corinthians 15:23). And the reign with those that are His is John''s first resurrection: *Blessed and holy is he that hath part in the first resurrection: on such the second death hath no power, but they shall be priests of Elohim (God) and of Messiah (Christ), and shall reign with him a thousand years* (Revelation 20:6).',
       sv.verse_id, ev.verse_id, 'extras', 63156
  FROM _session253_2esd7_lookup sv, _session253_2esd7_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=7 AND sv.verse_number=28
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=7 AND ev.verse_number=29
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-7-silence-and-the-raising',
       E'The seven days'' silence and the raising of the dead',
       E'After the Messiah''s death the world returns to primal stillness, then wakes to resurrection: *And the world shall be turned into the old silence seven days, like as in the former judgments: so that no man shall remain* (2 Esdras 7:30), *And after seven days the world, that yet awakes not, shall be raised up, and that shall die that is corrupt* (2 Esdras 7:31), *And the earth shall restore those that are asleep in her, and so shall the dust those that dwell in silence, and the secret places shall deliver those souls that were committed to them* (2 Esdras 7:32). Daniel saw the same waking dust: *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt* (Daniel 12:2). Yahusha gathers it into one hour: *Marvel not at this: for the hour is coming, in the which all that are in the graves shall hear his voice* (John 5:28), *And shall come forth; they that have done good, unto the resurrection of life; and they that have done evil, unto the resurrection of damnation* (John 5:29). And John watched the sea and the dust give up their dead: *And the sea gave up the dead which were in it; and death and hell delivered up the dead which were in them: and they were judged every man according to their works* (Revelation 20:13).',
       sv.verse_id, ev.verse_id, 'extras', 63159
  FROM _session253_2esd7_lookup sv, _session253_2esd7_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=7 AND sv.verse_number=30
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=7 AND ev.verse_number=32
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-7-seat-of-judgment-day-of-doom',
       E'The seat of judgment — the day of doom',
       E'Then the Most High takes the throne and the verdict stands: *And the Most High shall appear upon the seat of judgment, and misery shall pass away, and the long suffering shall have an end* (2 Esdras 7:33), *But judgment only shall remain, truth shall stand, and faith shall wax strong* (2 Esdras 7:34) — *But the day of doom shall be the end of this time, and the beginning of the immortality for to come, in which corruption is past* (2 Esdras 7:43). Yahusha is the One on that seat, dividing the nations: *When the Son of Adam shall come in his glory, and all the holy angels with him, then shall he sit upon the throne of his glory* (Matthew 25:31), and the two ways part forever — *And these shall go away into everlasting punishment: but the righteous into life eternal* (Matthew 25:46). John saw the same throne: *And I saw a great white throne, and him that sat on it, from whose face the earth and the heaven fled away; and there was found no place for them* (Revelation 20:11).',
       sv.verse_id, ev.verse_id, 'extras', 63162
  FROM _session253_2esd7_lookup sv, _session253_2esd7_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=7 AND sv.verse_number=33
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=7 AND ev.verse_number=43
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-7-in-adam-all-die',
       E'O thou Adam, what hast thou done — we all that come of thee',
       E'Esdras grieves the fountainhead of death: *O you Adam, what have you done? for though it was you that sinned, you are not fallen alone, but we all that come of you* (2 Esdras 7:48) — and earlier, *Because for their sakes I made the world: and when Adam transgressed my statutes, then was decreed that now is done* (2 Esdras 7:11). This is the very gravity Sha''ul carries to the cross: *Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned* (Romans 5:12), *For as by one man''s disobedience many were made sinners, so by the obedience of one shall many be made righteous* (Romans 5:19). The one Adam''s fall that pulls down all who come of him is answered by the one Messiah''s obedience — the death decreed in Adam undone in Him.',
       sv.verse_id, ev.verse_id, 'extras', 63165
  FROM _session253_2esd7_lookup sv, _session253_2esd7_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=7 AND sv.verse_number=48
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=7 AND ev.verse_number=48
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-7-choose-life-few-saved',
       E'Choose life — the battle, and the few that win the victory',
       E'The angel frames the whole age as a contest with one prize: *This is the condition of the battle, which man that is born upon the earth shall fight* (2 Esdras 7:57), *For this is the life of which Moses spoke to the people while he lived, saying, Choose you life, that you may live* (2 Esdras 7:59) — yet *There should be very few left perhaps in an innumerable multitude* (2 Esdras 7:70). The summons is Moses''s own: *See, I have set before thee this day life and good, and death and evil* (Deuteronomy 30:15). And the winners of the victory are those who die in faithfulness — *And I heard a voice from heaven saying unto me, Write, Blessed are the dead which die in Yahuah (Lord) from henceforth: Yea, saith the Spirit, that they may rest from their labours; and their works do follow them* (Revelation 14:13). The narrow door and the few who find it close the chapter where it opened — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 63168
  FROM _session253_2esd7_lookup sv, _session253_2esd7_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=7 AND sv.verse_number=57
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=7 AND ev.verse_number=70
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-esdras-7-strait-gate-inheritance
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 7:13 — *Enter ye in at the strait gate: for wide is the gate, and broad is the way, that leadeth to destruction, and many there be which go in thereat:* The broad way to destruction is Esdras''s wide door of the present world that brings not life.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd7_lookup sv, _session253_2esd7_lookup tv
 WHERE t.slug='2-esdras-7-strait-gate-inheritance'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=7 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 7:14 — *Because strait is the gate, and narrow is the way, which leadeth unto life, and few there be that find it.* The one-man path between fire and water is Yahusha''s narrow way that few find.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd7_lookup sv, _session253_2esd7_lookup tv
 WHERE t.slug='2-esdras-7-strait-gate-inheritance'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=7 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Luke 13:24 — *Strive to enter in at the strait gate: for many, I say unto you, will seek to enter in, and shall not be able.* Those who labour not to enter the strait things can never receive what is laid up, exactly as Yahusha warns of the many who shall not be able.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd7_lookup sv, _session253_2esd7_lookup tv
 WHERE t.slug='2-esdras-7-strait-gate-inheritance'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=7 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=13 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-7-israel-portion-not-cast-away
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 11:1 — *I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin.* The narrow inheritance is still Israel''s portion — the remnant keeps it, the people are not cast away.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd7_lookup sv, _session253_2esd7_lookup tv
 WHERE t.slug='2-esdras-7-israel-portion-not-cast-away'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=7 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 30:19 — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live:* The righteous who suffer strait things and hope for wide are the seed that chose life, just as Moses set it before Israel.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd7_lookup sv, _session253_2esd7_lookup tv
 WHERE t.slug='2-esdras-7-israel-portion-not-cast-away'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=7 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-7-my-son-the-messiah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 20:6 — *Blessed and holy is he that hath part in the first resurrection: on such the second death hath no power, but they shall be priests of Elohim (God) and of Messiah (Christ), and shall reign with him a thousand years.* My son the Messiah revealed with those that be with him, rejoicing for an age, is the reign of the firstfruits in the first resurrection.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd7_lookup sv, _session253_2esd7_lookup tv
 WHERE t.slug='2-esdras-7-my-son-the-messiah'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=7 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Corinthians 15:22 — *For as in Adam all die, even so in Messiah (Christ) shall all be made alive.* That my son Messiah shall die, and all men that have life, is the very Adam-and-Messiah ordering Sha''ul preaches.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd7_lookup sv, _session253_2esd7_lookup tv
 WHERE t.slug='2-esdras-7-my-son-the-messiah'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=7 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Corinthians 15:23 — *But every man in his own order: Messiah (Christ) the firstfruits; afterward they that are Messiah''s (Christ''s) at his coming.* The Messiah dies first, then all that have life follow in their own order, as Esdras foretells.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd7_lookup sv, _session253_2esd7_lookup tv
 WHERE t.slug='2-esdras-7-my-son-the-messiah'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=7 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-7-silence-and-the-raising
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The earth restoring those asleep in her, the dust giving up those in silence, is Daniel''s sleepers waking from the dust.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd7_lookup sv, _session253_2esd7_lookup tv
 WHERE t.slug='2-esdras-7-silence-and-the-raising'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=7 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 5:28 — *Marvel not at this: for the hour is coming, in the which all that are in the graves shall hear his voice,* The secret places delivering up the committed souls is the hour when all in the graves hear His voice.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd7_lookup sv, _session253_2esd7_lookup tv
 WHERE t.slug='2-esdras-7-silence-and-the-raising'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=7 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=5 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 20:13 — *And the sea gave up the dead which were in it; and death and hell delivered up the dead which were in them: and they were judged every man according to their works.* The dust and the secret places yielding their dead is John''s sea, death, and hell giving up theirs for the judgment.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd7_lookup sv, _session253_2esd7_lookup tv
 WHERE t.slug='2-esdras-7-silence-and-the-raising'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=7 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-7-seat-of-judgment-day-of-doom
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 25:31 — *When the Son of Adam shall come in his glory, and all the holy angels with him, then shall he sit upon the throne of his glory:* The Most High appearing on the seat of judgment is the Son of Adam taking the throne of His glory.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd7_lookup sv, _session253_2esd7_lookup tv
 WHERE t.slug='2-esdras-7-seat-of-judgment-day-of-doom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=7 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 25:46 — *And these shall go away into everlasting punishment: but the righteous into life eternal.* The day of doom that begins the immortality to come is the parting of the cursed and the righteous at Yahusha''s judgment.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd7_lookup sv, _session253_2esd7_lookup tv
 WHERE t.slug='2-esdras-7-seat-of-judgment-day-of-doom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=7 AND sv.verse_number=43
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=46
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 20:11 — *And I saw a great white throne, and him that sat on it, from whose face the earth and the heaven fled away; and there was found no place for them.* The Most High upon the seat of judgment, misery passing away, is John''s great white throne before which earth and heaven flee.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd7_lookup sv, _session253_2esd7_lookup tv
 WHERE t.slug='2-esdras-7-seat-of-judgment-day-of-doom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=7 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-7-in-adam-all-die
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 5:12 — *Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned:* That Adam fell not alone but all that come of him fall is Sha''ul''s one man by whom death passed upon all.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd7_lookup sv, _session253_2esd7_lookup tv
 WHERE t.slug='2-esdras-7-in-adam-all-die'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=7 AND sv.verse_number=48
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=5 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 5:19 — *For as by one man''s disobedience many were made sinners, so by the obedience of one shall many be made righteous.* Adam''s transgression decreeing the death that now is done is answered by the obedience of the one who makes many righteous.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd7_lookup sv, _session253_2esd7_lookup tv
 WHERE t.slug='2-esdras-7-in-adam-all-die'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=7 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=5 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-7-choose-life-few-saved
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 30:15 — *See, I have set before thee this day life and good, and death and evil;* The life of which Moses spoke, choose life that you may live, is the very setting of life and good against death and evil.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd7_lookup sv, _session253_2esd7_lookup tv
 WHERE t.slug='2-esdras-7-choose-life-few-saved'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=7 AND sv.verse_number=59
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 14:13 — *And I heard a voice from heaven saying unto me, Write, Blessed are the dead which die in Yahuah (Lord) from henceforth: Yea, saith the Spirit, that they may rest from their labours; and their works do follow them.* He that gets the victory receives the thing the angel promised — the blessed rest of the dead who die in Yahuah, their works following.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd7_lookup sv, _session253_2esd7_lookup tv
 WHERE t.slug='2-esdras-7-choose-life-few-saved'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=7 AND sv.verse_number=58
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=14 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

