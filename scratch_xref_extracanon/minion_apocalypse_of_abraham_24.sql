-- ----- fragment: minion_apocalypseofabraham_24.sql (session253 apocalypse-of-abraham 24) -----
-- Source anchor: apocalypse-of-abraham/apocalypse-of-abraham ch24. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: aoa24 (view _session253_aoa24_lookup). Sort band base 67575, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_aoa24_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: apocalypse-of-abraham-24-the-cunning-adversary
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 24, 3, 'canon', 'genesis', 3, 1, 'free', E'Genesis 3:1 — *Now the serpent was more subtil than any beast of the field which Yahuah Elohim (the LORD God) had made. And he said unto the woman, Yea, hath Elohim (God) said, Ye shall not eat of every tree of the garden?* Abraham''s "cunning Adversary" beside Adam and Eve is the subtil serpent of the garden, the same fallen one.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 24, 3, 'canon', 'john', 8, 44, 'free', E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* Yahusha names the Adversary "a murderer from the beginning" — exactly the one through whom Cain "acted lawlessly" in Abraham''s vision.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 24, 3, 'canon', '1-john', 3, 12, 'free', E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* The apostle reads Cain just as Abraham sees him: slaughtering Abel "through the Adversary," the works of the wicked one against the righteous.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 24, 3, 'canon', 'romans', 5, 12, 'free', E'Romans 5:12 — *Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned.* The destruction Abraham sees brought upon Abel through the lawless one is the one death that, entering in Eden, "passed upon all men."'),
  -- thread: apocalypse-of-abraham-24-impurity-and-desire
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 24, 7, 'canon', 'james', 1, 15, 'free', E'James 1:15 — *Then when lust hath conceived, it bringeth forth sin: and sin, when it is finished, bringeth forth death.* Abraham''s Desire holding "the head of every kind of lawlessness" and her "waste assigned to perdition" is exactly lust conceiving and bringing forth death.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 24, 4, 'canon', 'romans', 1, 24, 'free', E'Romans 1:24 — *Wherefore Elohim (God) also gave them up to uncleanness through the lusts of their own hearts, to dishonour their own bodies between themselves.* The "Impurity, and those who lust after it, and its pollution" that Abraham sees is the same uncleanness men are given up to through the lust of their hearts.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 24, 4, 'enoch', '1-enoch', 8, 2, 'extras', E'1 Enoch 8:2 — *And there arose much godlessness, and they committed fornication, and they were led astray, and became corrupt in all their ways.* The now-restored Watchers'' corruption of the earth is the same fountain of "Impurity" and "the fire of their corruption" Abraham beholds laid up in the lowest parts of the earth.'),
  -- thread: apocalypse-of-abraham-24-theft-and-the-broken-law
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 24, 5, 'canon', 'exodus', 20, 15, 'free', E'Exodus 20:15 — *Thou shalt not steal.* The "Theft, and those who hasten after it" that Abraham sees set for the Great Assize is the open breach of the eighth word spoken at Sinai.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 24, 6, 'canon', 'exodus', 20, 14, 'free', E'Exodus 20:14 — *Thou shalt not commit adultery.* The "naked men... and their passion which they had against each other" arrayed for retribution are the trespass of the seventh word; Torah stands and the breaking of it is judged.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 24, 5, 'canon', 'matthew', 15, 19, 'free', E'Matthew 15:19 — *For out of the heart proceed evil thoughts, murders, adulteries, fornications, thefts, false witness, blasphemies.* Yahusha''s catalogue of what defiles a man is the same roll of Theft and lawless passion Abraham sees handed to the Great Assize.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_aoa24_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_aoa24_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-24-the-cunning-adversary',
       E'The Cunning Adversary in the Picture of Creation',
       E'Abraham, lifted to the throne, is shown the whole sweep of the ages in one picture: *And I looked and saw there what was before me in creation: I saw Adam, and Eve existing with him, and with them the cunning Adversary, and Cain who acted lawlessly through the Adversary, and the slaughtered Abel, and the destruction brought and caused upon him through the lawless one.* (Apocalypse of Abraham 24:3). It ain''t new — this is Eden itself unrolled. The cunning Adversary is the serpent of the garden: *Now the serpent was more subtil than any beast of the field which Yahuah Elohim (the LORD God) had made* (Genesis 3:1). Yahusha named that same one the father of the first murder: *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth* (John 8:44). And the apostle reads Cain exactly as Abraham sees him — slaying through the wicked one: *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous* (1 John 3:12). The one death loosed in Eden is the death loosed on all: *Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned* (Romans 5:12).',
       sv.verse_id, ev.verse_id, 'extras', 67575
  FROM _session253_aoa24_lookup sv, _session253_aoa24_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=24 AND sv.verse_number=3
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=24 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-24-impurity-and-desire',
       E'Impurity, Lust, and the Daughter Desire',
       E'The picture turns to the powers that breed in men: *I saw there also Impurity, and those who lust after it, and its pollution, and their jealousy, and the fire of their corruption in the lowest parts of the earth* (Apocalypse of Abraham 24:4); and at the end of the catalogue, *I saw there Desire, and in her hand the head of every kind of lawlessness, and her scorn and her waste assigned to perdition* (Apocalypse of Abraham 24:7). Desire holding "the head of every kind of lawlessness" is the very anatomy James draws of sin''s birth: *But every man is tempted, when he is drawn away of his own lust, and enticed. Then when lust hath conceived, it bringeth forth sin: and sin, when it is finished, bringeth forth death* (James 1:14-15). It ain''t new — Sha''ul saw the same handing-over to uncleanness: *Wherefore Elohim (God) also gave them up to uncleanness through the lusts of their own hearts, to dishonour their own bodies between themselves* (Romans 1:24). And the Watchers'' lesson in lawlessness, now restored, names the root: *And there arose much godlessness, and they committed fornication, and they were led astray, and became corrupt in all their ways* (1 Enoch 8:2).',
       sv.verse_id, ev.verse_id, 'extras', 67578
  FROM _session253_aoa24_lookup sv, _session253_aoa24_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=24 AND sv.verse_number=4
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=24 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-24-theft-and-the-broken-law',
       E'Theft, Nakedness, and the Great Assize',
       E'Abraham sees the breaches of Torah arrayed for judgment: *I saw there Theft, and those who hasten after it, and the arrangement of their retribution, the judgement of the Great Assize* (Apocalypse of Abraham 24:5); *I saw there naked men, the foreheads against each other, and their disgrace, and their passion which they had against each other, and their retribution* (Apocalypse of Abraham 24:6). These are not abstractions — they are the very words spoken from Sinai: *Thou shalt not commit adultery* (Exodus 20:14) and *Thou shalt not steal* (Exodus 20:15). Torah stands; what Abraham sees catalogued is the breaking of it, set for the Great Assize. It ain''t new — Yahusha located the same flood in the heart: *For out of the heart proceed evil thoughts, murders, adulteries, fornications, thefts, false witness, blasphemies* (Matthew 15:19). The retribution Abraham sees "arranged" is the just recompense of a covenant defied.',
       sv.verse_id, ev.verse_id, 'extras', 67581
  FROM _session253_aoa24_lookup sv, _session253_aoa24_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=24 AND sv.verse_number=5
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=24 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: apocalypse-of-abraham-24-the-cunning-adversary
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:1 — *Now the serpent was more subtil than any beast of the field which Yahuah Elohim (the LORD God) had made. And he said unto the woman, Yea, hath Elohim (God) said, Ye shall not eat of every tree of the garden?* Abraham''s "cunning Adversary" beside Adam and Eve is the subtil serpent of the garden, the same fallen one.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa24_lookup sv, _session253_aoa24_lookup tv
 WHERE t.slug='apocalypse-of-abraham-24-the-cunning-adversary'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=24 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* Yahusha names the Adversary "a murderer from the beginning" — exactly the one through whom Cain "acted lawlessly" in Abraham''s vision.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa24_lookup sv, _session253_aoa24_lookup tv
 WHERE t.slug='apocalypse-of-abraham-24-the-cunning-adversary'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=24 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* The apostle reads Cain just as Abraham sees him: slaughtering Abel "through the Adversary," the works of the wicked one against the righteous.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa24_lookup sv, _session253_aoa24_lookup tv
 WHERE t.slug='apocalypse-of-abraham-24-the-cunning-adversary'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=24 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 5:12 — *Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned.* The destruction Abraham sees brought upon Abel through the lawless one is the one death that, entering in Eden, "passed upon all men."'
  FROM cross_reference_threads t, cross_references x, _session253_aoa24_lookup sv, _session253_aoa24_lookup tv
 WHERE t.slug='apocalypse-of-abraham-24-the-cunning-adversary'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=24 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=5 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-24-impurity-and-desire
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'James 1:15 — *Then when lust hath conceived, it bringeth forth sin: and sin, when it is finished, bringeth forth death.* Abraham''s Desire holding "the head of every kind of lawlessness" and her "waste assigned to perdition" is exactly lust conceiving and bringing forth death.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa24_lookup sv, _session253_aoa24_lookup tv
 WHERE t.slug='apocalypse-of-abraham-24-impurity-and-desire'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=24 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 1:24 — *Wherefore Elohim (God) also gave them up to uncleanness through the lusts of their own hearts, to dishonour their own bodies between themselves.* The "Impurity, and those who lust after it, and its pollution" that Abraham sees is the same uncleanness men are given up to through the lust of their hearts.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa24_lookup sv, _session253_aoa24_lookup tv
 WHERE t.slug='apocalypse-of-abraham-24-impurity-and-desire'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=24 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=1 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 8:2 — *And there arose much godlessness, and they committed fornication, and they were led astray, and became corrupt in all their ways.* The now-restored Watchers'' corruption of the earth is the same fountain of "Impurity" and "the fire of their corruption" Abraham beholds laid up in the lowest parts of the earth.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa24_lookup sv, _session253_aoa24_lookup tv
 WHERE t.slug='apocalypse-of-abraham-24-impurity-and-desire'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=24 AND sv.verse_number=4
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=8 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-24-theft-and-the-broken-law
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 20:15 — *Thou shalt not steal.* The "Theft, and those who hasten after it" that Abraham sees set for the Great Assize is the open breach of the eighth word spoken at Sinai.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa24_lookup sv, _session253_aoa24_lookup tv
 WHERE t.slug='apocalypse-of-abraham-24-theft-and-the-broken-law'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=24 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 20:14 — *Thou shalt not commit adultery.* The "naked men... and their passion which they had against each other" arrayed for retribution are the trespass of the seventh word; Torah stands and the breaking of it is judged.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa24_lookup sv, _session253_aoa24_lookup tv
 WHERE t.slug='apocalypse-of-abraham-24-theft-and-the-broken-law'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=24 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 15:19 — *For out of the heart proceed evil thoughts, murders, adulteries, fornications, thefts, false witness, blasphemies.* Yahusha''s catalogue of what defiles a man is the same roll of Theft and lawless passion Abraham sees handed to the Great Assize.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa24_lookup sv, _session253_aoa24_lookup tv
 WHERE t.slug='apocalypse-of-abraham-24-theft-and-the-broken-law'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=24 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=15 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

