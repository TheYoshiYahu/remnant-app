-- ----- fragment: minion_ignatiustrallians_01.sql (session253 ignatius-trallians 1) -----
-- Source anchor: lightfoot-apostolic-fathers/ignatius-trallians ch1. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: igtra1 (view _session253_igtra1_lookup). Sort band base 70400, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_igtra1_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ignatius-trallians-1-truly-born-truly-suffered
  ('lightfoot-apostolic-fathers', 'ignatius-trallians', 1, 9, 'canon', '1-john', 4, 2, 'free', E'1 John 4:2 — *Hereby know ye the Spirit of Elohim (God): Every spirit that confesseth that Yahusha HaMashiach (Jesus Christ) is come in the flesh is of Elohim (God):* John''s test of the spirits is the very root of Ignatius''s insistence that the Messiah was truly born and truly in the flesh.'),
  ('lightfoot-apostolic-fathers', 'ignatius-trallians', 1, 9, 'canon', '1-john', 4, 3, 'free', E'1 John 4:3 — *And every spirit that confesseth not that Yahusha HaMashiach (Jesus Christ) is come in the flesh is not of Elohim (God): and this is that spirit of antichrist, whereof ye have heard that it should come; and even now already is it in the world.* The docetism Ignatius warns the Trallians against is named by John the spirit of antichrist.'),
  ('lightfoot-apostolic-fathers', 'ignatius-trallians', 1, 9, 'canon', 'luke', 24, 39, 'free', E'Luke 24:39 — *Behold my hands and my feet, that it is I myself: handle me, and see; for a spirit hath not flesh and bones, as ye see me have.* The risen Messiah refutes the semblance-doctrine in His own words, vindicating Ignatius''s ''truly raised from the dead.'''),
  ('lightfoot-apostolic-fathers', 'ignatius-trallians', 1, 9, 'canon', '1-corinthians', 15, 3, 'free', E'1 Corinthians 15:3 — *For I delivered unto you first of all that which I also received, how that Messiah (Christ) died for our sins according to the scriptures;* Paul''s received deposit is the same creed Ignatius hands the Trallians: died, buried, raised.'),
  ('lightfoot-apostolic-fathers', 'ignatius-trallians', 1, 9, 'canon', 'john', 19, 34, 'free', E'John 19:34 — *But one of the soldiers with a spear pierced his side, and forthwith came there out blood and water.* The pierced side under Pilate is the bodily proof that He was truly crucified and died, not in semblance only.'),
  -- thread: ignatius-trallians-1-not-in-vain-i-die
  ('lightfoot-apostolic-fathers', 'ignatius-trallians', 1, 9, 'canon', '1-corinthians', 15, 32, 'free', E'1 Corinthians 15:32 — *If after the manner of men I have fought with beasts at Ephesus, what advantageth it me, if the dead rise not? let us eat and drink; for to morrow we die.* Paul''s beast-fighting logic is precisely Ignatius''s: a martyrdom for a Messiah who only seemed to suffer would be in vain.'),
  ('lightfoot-apostolic-fathers', 'ignatius-trallians', 1, 9, 'canon', '1-corinthians', 15, 14, 'free', E'1 Corinthians 15:14 — *And if Messiah (Christ) be not risen, then is our preaching vain, and your faith is also vain.* If the docetists are right, Ignatius dies for nothing — the same ''vain'' Paul names.'),
  ('lightfoot-apostolic-fathers', 'ignatius-trallians', 1, 9, 'canon', '1-peter', 5, 1, 'free', E'1 Peter 5:1 — *The elders which are among you I exhort, who am also an elder, and a witness of the sufferings of Messiah (Christ), and also a partaker of the glory that shall be revealed:* Peter the witness of the real sufferings undergirds Ignatius the bishop who eagerly shares them in his bonds.'),
  -- thread: ignatius-trallians-1-strange-herbage-poison-heresy
  ('lightfoot-apostolic-fathers', 'ignatius-trallians', 1, 11, 'canon', 'matthew', 15, 13, 'free', E'Matthew 15:13 — *But he answered and said, Every plant, which my heavenly Father hath not planted, shall be rooted up.* Ignatius''s ''these men are not the Father''s planting'' is a direct echo of the Messiah''s word on every plant the Father planted not.'),
  ('lightfoot-apostolic-fathers', 'ignatius-trallians', 1, 6, 'canon', '2-peter', 2, 1, 'free', E'2 Peter 2:1 — *But there were false prophets also among the people, even as there shall be false teachers among you, who privily shall bring in damnable heresies, even denying Yahuah (Lord) that bought them, and bring upon themselves swift destruction.* Peter''s privily-smuggled heresies are the very poison-mingled-with-honied-wine Ignatius bids the Trallians refuse.'),
  ('lightfoot-apostolic-fathers', 'ignatius-trallians', 1, 6, 'canon', '2-peter', 2, 19, 'free', E'2 Peter 2:19 — *While they promise them liberty, they themselves are the servants of corruption: for of whom a man is overcome, of the same is he brought in bondage.* The heretics'' ''show of honesty'' is Peter''s false promise of liberty masking corruption.'),
  -- thread: ignatius-trallians-1-subject-to-presbytery-one-body
  ('lightfoot-apostolic-fathers', 'ignatius-trallians', 1, 2, 'canon', 'ephesians', 4, 4, 'free', E'Ephesians 4:4 — *There is one body, and one Spirit, even as ye are called in one hope of your calling;* Paul''s one body grounds Ignatius''s call to be subject to the presbytery ''as to the Apostles of our hope.'''),
  ('lightfoot-apostolic-fathers', 'ignatius-trallians', 1, 2, 'canon', 'ephesians', 4, 5, 'free', E'Ephesians 4:5 — *One Yahuah (Lord), one faith, one baptism,* The single faith and Lord is the unity Ignatius guards against the schismatic poison of heresy.'),
  ('lightfoot-apostolic-fathers', 'ignatius-trallians', 1, 3, 'canon', '1-peter', 5, 3, 'free', E'1 Peter 5:3 — *Neither as being lords over Elohim''s (God''s) heritage, but being ensamples to the flock.* Peter''s ensample-not-lordship is the gentle, exemplary bishop whose demeanour Ignatius calls a great lesson.'),
  ('lightfoot-apostolic-fathers', 'ignatius-trallians', 1, 3, 'canon', '1-peter', 5, 5, 'free', E'1 Peter 5:5 — *Likewise, ye younger, submit yourselves unto the elder. Yea, all of you be subject one to another, and be clothed with humility: for Elohim (God) resisteth the proud, and giveth grace to the humble.* Mutual submission clothed with humility is the order Ignatius commends to the Trallians.'),
  -- thread: ignatius-trallians-1-my-name-blasphemed
  ('lightfoot-apostolic-fathers', 'ignatius-trallians', 1, 8, 'canon', 'isaiah', 52, 5, 'free', E'Isaiah 52:5 — *Now therefore, what have I here, saith Yahuah (LORD), that my people is taken away for nought? they that rule over them make them to howl, saith Yahuah (LORD); and my name continually every day is blasphemed.* Ignatius''s ''Woe unto him through whom My name is vainly blasphemed'' draws straight from Yahuah''s complaint in Isaiah.'),
  ('lightfoot-apostolic-fathers', 'ignatius-trallians', 1, 8, 'canon', 'romans', 2, 24, 'free', E'Romans 2:24 — *For the name of Elohim (God) is blasphemed among the Gentiles through you, as it is written.* Paul applies the same Isaiah-rooted warning Ignatius gives: a careless few cause the Name to be blasphemed among the Gentiles.'),
  ('lightfoot-apostolic-fathers', 'ignatius-trallians', 1, 8, 'canon', '1-john', 4, 21, 'free', E'1 John 4:21 — *And this commandment have we from him, That he who loveth Elohim (God) love his brother also.* The grudge Ignatius forbids is countered by the abiding commandment to love the brother.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_igtra1_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_igtra1_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ignatius-trallians-1-truly-born-truly-suffered',
       E'Truly Born, Truly Crucified, Truly Raised — Against the Semblance',
       E'Ignatius arms the Trallians against the docetic lie: *Be ye deaf therefore, when any man speaketh to you apart from Yahusha HaMashiach, who was of the race of David, who was the Son of Mary, who was truly born and ate and drank, was truly persecuted under Pontius Pilate, was truly crucified and died... who moreover was truly raised from the dead, His Father having raised Him* (Ignatius to the Trallians 1:9). It ain''t new — John laid the test first: *Hereby know ye the Spirit of Elohim: Every spirit that confesseth that Yahusha HaMashiach is come in the flesh is of Elohim* (1 John 4:2), and *every spirit that confesseth not that Yahusha HaMashiach is come in the flesh is not of Elohim: and this is that spirit of antichrist* (1 John 4:3). The risen Messiah Himself overthrew the *semblance* charge: *handle me, and see; for a spirit hath not flesh and bones, as ye see me have* (Luke 24:39), and *he took it, and did eat before them* (Luke 24:43) — He truly ate, as Ignatius says. Paul delivers the same deposit: *how that Messiah died for our sins according to the scriptures; And that he was buried, and that he rose again the third day according to the scriptures* (1 Corinthians 15:3-4). And the spear under Pilate proves the real flesh: *one of the soldiers with a spear pierced his side, and forthwith came there out blood and water* (John 19:34).',
       sv.verse_id, ev.verse_id, 'extras', 70400
  FROM _session253_igtra1_lookup sv, _session253_igtra1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-trallians' AND sv.chapter_number=1 AND sv.verse_number=9
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='ignatius-trallians' AND ev.chapter_number=1 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ignatius-trallians-1-not-in-vain-i-die',
       E'If He Suffered Only in Semblance, Why Am I in Bonds?',
       E'Ignatius answers docetism with his own chains: *But if it were as certain persons who are godless... say, that He suffered only in semblance, being themselves mere semblance, why am I in bonds? And why also do I desire to fight with wild beasts? So I die in vain* (Ignatius to the Trallians 1:9-10). A martyrdom for a phantom-Messiah would be empty — and Paul reasoned exactly so: *If after the manner of men I have fought with beasts at Ephesus, what advantageth it me, if the dead rise not?* (1 Corinthians 15:32). The whole hope hangs on a real death and a real rising: *And if Messiah be not risen, then is our preaching vain, and your faith is also vain* (1 Corinthians 15:14). Ignatius''s longing to suffer rests on the chief Shepherd who truly suffered before him: *who am also an elder, and a witness of the sufferings of Messiah, and also a partaker of the glory that shall be revealed* (1 Peter 5:1).',
       sv.verse_id, ev.verse_id, 'extras', 70403
  FROM _session253_igtra1_lookup sv, _session253_igtra1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-trallians' AND sv.chapter_number=1 AND sv.verse_number=9
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='ignatius-trallians' AND ev.chapter_number=1 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ignatius-trallians-1-strange-herbage-poison-heresy',
       E'Abstain From the Strange Herbage — the Poison of Heresy',
       E'Ignatius warns of the deadly drug mingled with honied wine: *take ye only Christian food, and abstain from strange herbage, which is heresy: for these men do even mingle poison with Yahusha HaMashiach, imposing upon others by a show of honesty* (Ignatius to the Trallians 1:6), and *Shun ye therefore those vile offshoots that gender a deadly fruit... For these men are not the Father''s planting* (Ignatius to the Trallians 1:11). It ain''t new — the Messiah named the standard: *Every plant, which my heavenly Father hath not planted, shall be rooted up* (Matthew 15:13). Peter foretold the smuggled poison: *there shall be false teachers among you, who privily shall bring in damnable heresies, even denying Yahuah that bought them* (2 Peter 2:1) — denying the Master is the very docetism Ignatius fights. And the *show of honesty* is exposed: *For when they speak great swelling words of vanity, they allure through the lusts of the flesh... While they promise them liberty, they themselves are the servants of corruption* (2 Peter 2:18-19).',
       sv.verse_id, ev.verse_id, 'extras', 70406
  FROM _session253_igtra1_lookup sv, _session253_igtra1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-trallians' AND sv.chapter_number=1 AND sv.verse_number=6
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='ignatius-trallians' AND ev.chapter_number=1 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ignatius-trallians-1-subject-to-presbytery-one-body',
       E'Subject as to the Apostles — One Body, One Hope',
       E'Ignatius binds the Trallians into ordered unity: *be ye obedient also to the presbytery, as to the Apostles of Yahusha HaMashiach our hope; for if we live in Him, we shall also be found in Him* (Ignatius to the Trallians 1:2), for *Apart from these there is not even the name of a church* (Ignatius to the Trallians 1:3). It ain''t new — Paul set the one-body charge: *There is one body, and one Spirit, even as ye are called in one hope of your calling* (Ephesians 4:4), *One Yahuah, one faith, one baptism* (Ephesians 4:5). The under-shepherds are to lead not as lords: *Feed the flock of Elohim which is among you, taking the oversight thereof... Neither as being lords over Elohim''s heritage, but being ensamples to the flock* (1 Peter 5:2-3) — the gentle bishop Ignatius praises, *whose very demeanour is a great lesson, while his gentleness is power.* And the younger submit in humility: *Likewise, ye younger, submit yourselves unto the elder* (1 Peter 5:5).',
       sv.verse_id, ev.verse_id, 'extras', 70409
  FROM _session253_igtra1_lookup sv, _session253_igtra1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-trallians' AND sv.chapter_number=1 AND sv.verse_number=2
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='ignatius-trallians' AND ev.chapter_number=1 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ignatius-trallians-1-my-name-blasphemed',
       E'Give No Occasion — Lest the Name Be Blasphemed',
       E'Ignatius exhorts to love that guards the witness: *Let none of you bear a grudge against his neighbour. Give no occasion to the Gentiles, lest by reason of a few foolish men the godly multitude be blasphemed: for Woe unto him through whom My name is vainly blasphemed before some* (Ignatius to the Trallians 1:8). It ain''t new — the saying is Isaiah''s, spoken by Yahuah Himself: *they that rule over them make them to howl, saith Yahuah; and my name continually every day is blasphemed* (Isaiah 52:5). Paul lays the same charge on those whose walk dishonors the Name: *For the name of Elohim is blasphemed among the Gentiles through you, as it is written* (Romans 2:24). The forbidden grudge is answered by the love-the-neighbour commandment kept whole: *And this commandment have we from him, That he who loveth Elohim love his brother also* (1 John 4:21).',
       sv.verse_id, ev.verse_id, 'extras', 70412
  FROM _session253_igtra1_lookup sv, _session253_igtra1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-trallians' AND sv.chapter_number=1 AND sv.verse_number=8
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='ignatius-trallians' AND ev.chapter_number=1 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ignatius-trallians-1-truly-born-truly-suffered
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 John 4:2 — *Hereby know ye the Spirit of Elohim (God): Every spirit that confesseth that Yahusha HaMashiach (Jesus Christ) is come in the flesh is of Elohim (God):* John''s test of the spirits is the very root of Ignatius''s insistence that the Messiah was truly born and truly in the flesh.'
  FROM cross_reference_threads t, cross_references x, _session253_igtra1_lookup sv, _session253_igtra1_lookup tv
 WHERE t.slug='ignatius-trallians-1-truly-born-truly-suffered'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-trallians' AND sv.chapter_number=1 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=4 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 John 4:3 — *And every spirit that confesseth not that Yahusha HaMashiach (Jesus Christ) is come in the flesh is not of Elohim (God): and this is that spirit of antichrist, whereof ye have heard that it should come; and even now already is it in the world.* The docetism Ignatius warns the Trallians against is named by John the spirit of antichrist.'
  FROM cross_reference_threads t, cross_references x, _session253_igtra1_lookup sv, _session253_igtra1_lookup tv
 WHERE t.slug='ignatius-trallians-1-truly-born-truly-suffered'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-trallians' AND sv.chapter_number=1 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=4 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Luke 24:39 — *Behold my hands and my feet, that it is I myself: handle me, and see; for a spirit hath not flesh and bones, as ye see me have.* The risen Messiah refutes the semblance-doctrine in His own words, vindicating Ignatius''s ''truly raised from the dead.'''
  FROM cross_reference_threads t, cross_references x, _session253_igtra1_lookup sv, _session253_igtra1_lookup tv
 WHERE t.slug='ignatius-trallians-1-truly-born-truly-suffered'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-trallians' AND sv.chapter_number=1 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=24 AND tv.verse_number=39
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Corinthians 15:3 — *For I delivered unto you first of all that which I also received, how that Messiah (Christ) died for our sins according to the scriptures;* Paul''s received deposit is the same creed Ignatius hands the Trallians: died, buried, raised.'
  FROM cross_reference_threads t, cross_references x, _session253_igtra1_lookup sv, _session253_igtra1_lookup tv
 WHERE t.slug='ignatius-trallians-1-truly-born-truly-suffered'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-trallians' AND sv.chapter_number=1 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'John 19:34 — *But one of the soldiers with a spear pierced his side, and forthwith came there out blood and water.* The pierced side under Pilate is the bodily proof that He was truly crucified and died, not in semblance only.'
  FROM cross_reference_threads t, cross_references x, _session253_igtra1_lookup sv, _session253_igtra1_lookup tv
 WHERE t.slug='ignatius-trallians-1-truly-born-truly-suffered'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-trallians' AND sv.chapter_number=1 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=19 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ignatius-trallians-1-not-in-vain-i-die
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Corinthians 15:32 — *If after the manner of men I have fought with beasts at Ephesus, what advantageth it me, if the dead rise not? let us eat and drink; for to morrow we die.* Paul''s beast-fighting logic is precisely Ignatius''s: a martyrdom for a Messiah who only seemed to suffer would be in vain.'
  FROM cross_reference_threads t, cross_references x, _session253_igtra1_lookup sv, _session253_igtra1_lookup tv
 WHERE t.slug='ignatius-trallians-1-not-in-vain-i-die'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-trallians' AND sv.chapter_number=1 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Corinthians 15:14 — *And if Messiah (Christ) be not risen, then is our preaching vain, and your faith is also vain.* If the docetists are right, Ignatius dies for nothing — the same ''vain'' Paul names.'
  FROM cross_reference_threads t, cross_references x, _session253_igtra1_lookup sv, _session253_igtra1_lookup tv
 WHERE t.slug='ignatius-trallians-1-not-in-vain-i-die'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-trallians' AND sv.chapter_number=1 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Peter 5:1 — *The elders which are among you I exhort, who am also an elder, and a witness of the sufferings of Messiah (Christ), and also a partaker of the glory that shall be revealed:* Peter the witness of the real sufferings undergirds Ignatius the bishop who eagerly shares them in his bonds.'
  FROM cross_reference_threads t, cross_references x, _session253_igtra1_lookup sv, _session253_igtra1_lookup tv
 WHERE t.slug='ignatius-trallians-1-not-in-vain-i-die'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-trallians' AND sv.chapter_number=1 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ignatius-trallians-1-strange-herbage-poison-heresy
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 15:13 — *But he answered and said, Every plant, which my heavenly Father hath not planted, shall be rooted up.* Ignatius''s ''these men are not the Father''s planting'' is a direct echo of the Messiah''s word on every plant the Father planted not.'
  FROM cross_reference_threads t, cross_references x, _session253_igtra1_lookup sv, _session253_igtra1_lookup tv
 WHERE t.slug='ignatius-trallians-1-strange-herbage-poison-heresy'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-trallians' AND sv.chapter_number=1 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=15 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Peter 2:1 — *But there were false prophets also among the people, even as there shall be false teachers among you, who privily shall bring in damnable heresies, even denying Yahuah (Lord) that bought them, and bring upon themselves swift destruction.* Peter''s privily-smuggled heresies are the very poison-mingled-with-honied-wine Ignatius bids the Trallians refuse.'
  FROM cross_reference_threads t, cross_references x, _session253_igtra1_lookup sv, _session253_igtra1_lookup tv
 WHERE t.slug='ignatius-trallians-1-strange-herbage-poison-heresy'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-trallians' AND sv.chapter_number=1 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Peter 2:19 — *While they promise them liberty, they themselves are the servants of corruption: for of whom a man is overcome, of the same is he brought in bondage.* The heretics'' ''show of honesty'' is Peter''s false promise of liberty masking corruption.'
  FROM cross_reference_threads t, cross_references x, _session253_igtra1_lookup sv, _session253_igtra1_lookup tv
 WHERE t.slug='ignatius-trallians-1-strange-herbage-poison-heresy'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-trallians' AND sv.chapter_number=1 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ignatius-trallians-1-subject-to-presbytery-one-body
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ephesians 4:4 — *There is one body, and one Spirit, even as ye are called in one hope of your calling;* Paul''s one body grounds Ignatius''s call to be subject to the presbytery ''as to the Apostles of our hope.'''
  FROM cross_reference_threads t, cross_references x, _session253_igtra1_lookup sv, _session253_igtra1_lookup tv
 WHERE t.slug='ignatius-trallians-1-subject-to-presbytery-one-body'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-trallians' AND sv.chapter_number=1 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ephesians 4:5 — *One Yahuah (Lord), one faith, one baptism,* The single faith and Lord is the unity Ignatius guards against the schismatic poison of heresy.'
  FROM cross_reference_threads t, cross_references x, _session253_igtra1_lookup sv, _session253_igtra1_lookup tv
 WHERE t.slug='ignatius-trallians-1-subject-to-presbytery-one-body'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-trallians' AND sv.chapter_number=1 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=4 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Peter 5:3 — *Neither as being lords over Elohim''s (God''s) heritage, but being ensamples to the flock.* Peter''s ensample-not-lordship is the gentle, exemplary bishop whose demeanour Ignatius calls a great lesson.'
  FROM cross_reference_threads t, cross_references x, _session253_igtra1_lookup sv, _session253_igtra1_lookup tv
 WHERE t.slug='ignatius-trallians-1-subject-to-presbytery-one-body'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-trallians' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Peter 5:5 — *Likewise, ye younger, submit yourselves unto the elder. Yea, all of you be subject one to another, and be clothed with humility: for Elohim (God) resisteth the proud, and giveth grace to the humble.* Mutual submission clothed with humility is the order Ignatius commends to the Trallians.'
  FROM cross_reference_threads t, cross_references x, _session253_igtra1_lookup sv, _session253_igtra1_lookup tv
 WHERE t.slug='ignatius-trallians-1-subject-to-presbytery-one-body'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-trallians' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ignatius-trallians-1-my-name-blasphemed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 52:5 — *Now therefore, what have I here, saith Yahuah (LORD), that my people is taken away for nought? they that rule over them make them to howl, saith Yahuah (LORD); and my name continually every day is blasphemed.* Ignatius''s ''Woe unto him through whom My name is vainly blasphemed'' draws straight from Yahuah''s complaint in Isaiah.'
  FROM cross_reference_threads t, cross_references x, _session253_igtra1_lookup sv, _session253_igtra1_lookup tv
 WHERE t.slug='ignatius-trallians-1-my-name-blasphemed'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-trallians' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=52 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 2:24 — *For the name of Elohim (God) is blasphemed among the Gentiles through you, as it is written.* Paul applies the same Isaiah-rooted warning Ignatius gives: a careless few cause the Name to be blasphemed among the Gentiles.'
  FROM cross_reference_threads t, cross_references x, _session253_igtra1_lookup sv, _session253_igtra1_lookup tv
 WHERE t.slug='ignatius-trallians-1-my-name-blasphemed'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-trallians' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=2 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 John 4:21 — *And this commandment have we from him, That he who loveth Elohim (God) love his brother also.* The grudge Ignatius forbids is countered by the abiding commandment to love the brother.'
  FROM cross_reference_threads t, cross_references x, _session253_igtra1_lookup sv, _session253_igtra1_lookup tv
 WHERE t.slug='ignatius-trallians-1-my-name-blasphemed'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-trallians' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=4 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

