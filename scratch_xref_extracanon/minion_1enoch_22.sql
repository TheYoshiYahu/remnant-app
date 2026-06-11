-- ----- fragment: minion_1enoch_22.sql (session250 1-enoch 22) -----
-- Source anchor: enoch/1-enoch ch22. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en22 (view _session250_en22_lookup). Sort band base 50525, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en22_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-22-prison-of-the-angels
  ('enoch', '1-enoch', 22, 7, 'enoch', '1-enoch', 21, 5, 'extras', E'1 Enoch 21:5 — *’This place is the end of heaven and earth: this has become a prison for the stars and the host of heaven.* The chapter-21 cell Enoch toured is the same prison of the angels named in Enoch 22:7.'),
  ('enoch', '1-enoch', 22, 7, 'canon', '2-peter', 2, 4, 'free', E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* Peter''s chained, reserved angels are Enoch 22:7''s imprisoned host held for the great day.'),
  ('enoch', '1-enoch', 22, 7, 'canon', 'jude', 1, 6, 'free', E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude names the same bound rebel angels Enoch sees imprisoned until the judgement.'),
  ('enoch', '1-enoch', 22, 4, 'canon', 'jude', 1, 13, 'free', E'Jude 1:13 — *Raging waves of the sea, foaming out their own shame; wandering stars, to whom is reserved the blackness of darkness for ever.* Jude keeps Enoch''s very image of the bound seven stars as fallen luminaries reserved in darkness (Enoch 22:4).'),
  -- thread: 1-enoch-22-hollow-places-of-the-dead
  ('enoch', '1-enoch', 22, 10, 'canon', 'luke', 16, 22, 'free', E'Luke 16:22 — *And it came to pass, that the beggar died, and was carried by the angels into Abraham''s bosom: the rich man also died, and was buried;* the two dead men gathered into one waiting-place match Enoch''s hollow places where all the souls of the children of men assemble.'),
  ('enoch', '1-enoch', 22, 9, 'canon', 'luke', 16, 26, 'free', E'Luke 16:26 — *And beside all this, between us and you there is a great gulf fixed: so that they which would pass from hence to you cannot; neither can they pass to us, that would come from thence.* The fixed gulf in Sheol is Enoch''s separated hollow places, the righteous parted from the sinners (Enoch 22:9).'),
  -- thread: 1-enoch-22-abel-makes-his-suit
  ('enoch', '1-enoch', 22, 14, 'canon', 'genesis', 4, 10, 'free', E'Genesis 4:10 — *And he said, What hast thou done? the voice of thy brother''s blood crieth unto me from the ground.* Enoch 22:14 names the very spirit whose crying blood Genesis records — Abel''s suit against Cain, still going up to heaven.'),
  ('enoch', '1-enoch', 22, 12, 'canon', 'hebrews', 12, 24, 'free', E'Hebrews 12:24 — *And to Yahusha (Jesus) the mediator of the new covenant, and to the blood of sprinkling, that speaketh better things than that of Abel.* Hebrews knows Abel''s blood still speaks — the petition Enoch sees the dead making (Enoch 22:12) — and answers it with a better word.'),
  ('enoch', '1-enoch', 22, 12, 'canon', 'revelation', 6, 10, 'free', E'Revelation 6:10 — *And they cried with a loud voice, saying, How long, O Yahuah (Lord), holy and true, dost thou not judge and avenge our blood on them that dwell on the earth?* The martyrs'' cry for vengeance is Enoch''s suit of the dead going forth to heaven (Enoch 22:12), still awaiting the appointed reckoning.'),
  -- thread: 1-enoch-22-righteous-spring-sinners-apart
  ('enoch', '1-enoch', 22, 16, 'canon', 'luke', 16, 25, 'free', E'Luke 16:25 — *But Abraham said, Son, remember that thou in thy lifetime receivedst thy good things, and likewise Lazarus evil things: but now he is comforted, and thou art tormented.* Abraham''s divided estates — one comforted, one tormented — are Enoch''s separated hollows, the righteous at the bright spring and the sinner set apart (Enoch 22:16-17).'),
  ('enoch', '1-enoch', 22, 17, 'canon', 'numbers', 16, 30, 'free', E'Numbers 16:30 — *But if Yahuah (LORD) make a new thing, and the earth open her mouth, and swallow them up, with all that appertain unto them, and they go down quick into the pit; then ye shall understand that these men have provoked Yahuah (LORD).* The pit that swallows the rebels is the sinners'' portion Enoch sees set apart for those who provoked the Creator''s order (Enoch 22:17).'),
  ('enoch', '1-enoch', 22, 18, 'canon', 'numbers', 16, 33, 'free', E'Numbers 16:33 — *They, and all that appertained to them, went down alive into the pit, and the earth closed upon them: and they perished from among the congregation.* Korah''s company going down alive into the pit is the sinners shut away in pain till the great day Enoch describes (Enoch 22:18).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en22_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en22_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-22-prison-of-the-angels',
       E'The prison of the angels, reserved unto judgement',
       E'At the ends of the earth Enoch sees the holding-cell of the rebel host: *And there I saw seven stars of the heaven bound together like great mountains and burning with fire* (1 Enoch 22:4), and Uriel tells him, *This place is the prison of the angels, and here they will be imprisoned for ever* (1 Enoch 22:7). This is the same waste place Enoch had just toured a chapter before — *this has become a prison for the stars and the host of heaven* (1 Enoch 21:5) — the Watchers and transgressing stars bound until the reckoning. It ain''t new: the apostles carry the very same picture. Peter writes that *Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment* (2 Peter 2:4), and Jude that *the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day* (Jude 1:6) — even keeping Enoch''s image of fallen luminaries, *wandering stars, to whom is reserved the blackness of darkness for ever* (Jude 1:13). The rebel host that broke the Creator''s order is bound, not loosed; the binding is custody for the great-day judgement, not annihilation.',
       sv.verse_id, ev.verse_id, 'extras', 50525
  FROM _session250_en22_lookup sv, _session250_en22_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=22 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=22 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-22-hollow-places-of-the-dead',
       E'The hollow places where the dead are gathered till judgement',
       E'In the great mountain of the West Enoch finds the waiting-place of all the dead: *’These hollow places have been created for this very purpose, that the spirits of the souls of the dead should assemble therein, yea that all the souls of the children of men should assemble here* (1 Enoch 22:10), and they are held *until the day of their judgement and until their appointed period, till the great judgement comes upon them* (1 Enoch 22:11). The dead are not asleep in nothing nor already at the final verdict — they are gathered, conscious, and waiting. It ain''t new: Yahusha (Jesus) tells the same story. The beggar dies and *was carried by the angels into Abraham''s bosom: the rich man also died, and was buried* (Luke 16:22) — two estates in one holding-place — and between them runs Enoch''s very division: *between us and you there is a great gulf fixed: so that they which would pass from hence to you cannot; neither can they pass to us, that would come from thence* (Luke 16:26). Sheol holds the dead apart, each according to his way, until the appointed reckoning; the grave is custody, not the final word.',
       sv.verse_id, ev.verse_id, 'extras', 50528
  FROM _session250_en22_lookup sv, _session250_en22_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=22 AND sv.verse_number=8
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=22 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-22-abel-makes-his-suit',
       E'Abel''s spirit still making suit till judgement',
       E'Among the gathered dead one spirit will not be silent: *I saw (the spirits of) the dead making suit, and their petition went forth to heaven* (1 Enoch 22:12), and Raphael names him — *This is the spirit which went forth from Abel, whom his brother Cain slew, and he makes his suit against him till his seed is destroyed from the face of the earth* (1 Enoch 22:14). It ain''t new: this is Genesis pressed open. From the very ground Yahuah (LORD) had already said, *the voice of thy brother''s blood crieth unto me from the ground* (Genesis 4:10) — a cry that does not stop at death but goes up as a suit for justice. The whole book of Hebrews knows that crying blood, setting against it a better word: the new covenant brings *the blood of sprinkling, that speaketh better things than that of Abel* (Hebrews 12:24). And the cry is not Abel''s alone — under the altar the martyrs make the same suit: *the souls of them that were slain for the word of Elohim (God)... cried with a loud voice, saying, How long, O Yahuah (Lord), holy and true, dost thou not judge and avenge our blood on them that dwell on the earth?* (Revelation 6:9-10). The blood of the righteous is held in remembrance and pleads from the holding-place until the great day answers it.',
       sv.verse_id, ev.verse_id, 'extras', 50531
  FROM _session250_en22_lookup sv, _session250_en22_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=22 AND sv.verse_number=12
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=22 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-22-righteous-spring-sinners-apart',
       E'The bright spring for the righteous, the sinners set apart',
       E'The hollows are not one undivided pit — they are sorted by the way each one walked: *These three have been made that the spirits of the dead might be separated. And such a division has been made (for) the spirits of the righteous, in which there is the bright spring of water* (1 Enoch 22:16), while *Here their spirits shall be set apart in this great pain till the great day of judgement* (1 Enoch 22:18) is the lot of the sinners on whom *judgement has not been executed... in their lifetime* (1 Enoch 22:17). It ain''t new: Abraham draws the same line for the rich man — *Son, remember that thou in thy lifetime receivedst thy good things, and likewise Lazarus evil things: but now he is comforted, and thou art tormented* (Luke 16:25): the righteous comforted at the spring, the sinner in pain, divided by the way each kept. And the earth itself has swallowed the rebel living before — when Korah''s company *go down quick into the pit* (Numbers 16:30), they *went down alive into the pit, and the earth closed upon them: and they perished from among the congregation* (Numbers 16:33). The division is not arbitrary; it follows the covenant — the righteous who kept the way are held at the bright spring, the transgressors set apart in pain, all alike awaiting the great day of judgement.',
       sv.verse_id, ev.verse_id, 'extras', 50534
  FROM _session250_en22_lookup sv, _session250_en22_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=22 AND sv.verse_number=15
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=22 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-22-prison-of-the-angels
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 21:5 — *’This place is the end of heaven and earth: this has become a prison for the stars and the host of heaven.* The chapter-21 cell Enoch toured is the same prison of the angels named in Enoch 22:7.'
  FROM cross_reference_threads t, cross_references x, _session250_en22_lookup sv, _session250_en22_lookup tv
 WHERE t.slug='1-enoch-22-prison-of-the-angels'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=22 AND sv.verse_number=7
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=21 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* Peter''s chained, reserved angels are Enoch 22:7''s imprisoned host held for the great day.'
  FROM cross_reference_threads t, cross_references x, _session250_en22_lookup sv, _session250_en22_lookup tv
 WHERE t.slug='1-enoch-22-prison-of-the-angels'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=22 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude names the same bound rebel angels Enoch sees imprisoned until the judgement.'
  FROM cross_reference_threads t, cross_references x, _session250_en22_lookup sv, _session250_en22_lookup tv
 WHERE t.slug='1-enoch-22-prison-of-the-angels'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=22 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jude 1:13 — *Raging waves of the sea, foaming out their own shame; wandering stars, to whom is reserved the blackness of darkness for ever.* Jude keeps Enoch''s very image of the bound seven stars as fallen luminaries reserved in darkness (Enoch 22:4).'
  FROM cross_reference_threads t, cross_references x, _session250_en22_lookup sv, _session250_en22_lookup tv
 WHERE t.slug='1-enoch-22-prison-of-the-angels'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=22 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-22-hollow-places-of-the-dead
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Luke 16:22 — *And it came to pass, that the beggar died, and was carried by the angels into Abraham''s bosom: the rich man also died, and was buried;* the two dead men gathered into one waiting-place match Enoch''s hollow places where all the souls of the children of men assemble.'
  FROM cross_reference_threads t, cross_references x, _session250_en22_lookup sv, _session250_en22_lookup tv
 WHERE t.slug='1-enoch-22-hollow-places-of-the-dead'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=22 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=16 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 16:26 — *And beside all this, between us and you there is a great gulf fixed: so that they which would pass from hence to you cannot; neither can they pass to us, that would come from thence.* The fixed gulf in Sheol is Enoch''s separated hollow places, the righteous parted from the sinners (Enoch 22:9).'
  FROM cross_reference_threads t, cross_references x, _session250_en22_lookup sv, _session250_en22_lookup tv
 WHERE t.slug='1-enoch-22-hollow-places-of-the-dead'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=22 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=16 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-22-abel-makes-his-suit
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:10 — *And he said, What hast thou done? the voice of thy brother''s blood crieth unto me from the ground.* Enoch 22:14 names the very spirit whose crying blood Genesis records — Abel''s suit against Cain, still going up to heaven.'
  FROM cross_reference_threads t, cross_references x, _session250_en22_lookup sv, _session250_en22_lookup tv
 WHERE t.slug='1-enoch-22-abel-makes-his-suit'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=22 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 12:24 — *And to Yahusha (Jesus) the mediator of the new covenant, and to the blood of sprinkling, that speaketh better things than that of Abel.* Hebrews knows Abel''s blood still speaks — the petition Enoch sees the dead making (Enoch 22:12) — and answers it with a better word.'
  FROM cross_reference_threads t, cross_references x, _session250_en22_lookup sv, _session250_en22_lookup tv
 WHERE t.slug='1-enoch-22-abel-makes-his-suit'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=22 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 6:10 — *And they cried with a loud voice, saying, How long, O Yahuah (Lord), holy and true, dost thou not judge and avenge our blood on them that dwell on the earth?* The martyrs'' cry for vengeance is Enoch''s suit of the dead going forth to heaven (Enoch 22:12), still awaiting the appointed reckoning.'
  FROM cross_reference_threads t, cross_references x, _session250_en22_lookup sv, _session250_en22_lookup tv
 WHERE t.slug='1-enoch-22-abel-makes-his-suit'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=22 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=6 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-22-righteous-spring-sinners-apart
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Luke 16:25 — *But Abraham said, Son, remember that thou in thy lifetime receivedst thy good things, and likewise Lazarus evil things: but now he is comforted, and thou art tormented.* Abraham''s divided estates — one comforted, one tormented — are Enoch''s separated hollows, the righteous at the bright spring and the sinner set apart (Enoch 22:16-17).'
  FROM cross_reference_threads t, cross_references x, _session250_en22_lookup sv, _session250_en22_lookup tv
 WHERE t.slug='1-enoch-22-righteous-spring-sinners-apart'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=22 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=16 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 16:30 — *But if Yahuah (LORD) make a new thing, and the earth open her mouth, and swallow them up, with all that appertain unto them, and they go down quick into the pit; then ye shall understand that these men have provoked Yahuah (LORD).* The pit that swallows the rebels is the sinners'' portion Enoch sees set apart for those who provoked the Creator''s order (Enoch 22:17).'
  FROM cross_reference_threads t, cross_references x, _session250_en22_lookup sv, _session250_en22_lookup tv
 WHERE t.slug='1-enoch-22-righteous-spring-sinners-apart'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=22 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=16 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Numbers 16:33 — *They, and all that appertained to them, went down alive into the pit, and the earth closed upon them: and they perished from among the congregation.* Korah''s company going down alive into the pit is the sinners shut away in pain till the great day Enoch describes (Enoch 22:18).'
  FROM cross_reference_threads t, cross_references x, _session250_en22_lookup sv, _session250_en22_lookup tv
 WHERE t.slug='1-enoch-22-righteous-spring-sinners-apart'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=22 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=16 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

