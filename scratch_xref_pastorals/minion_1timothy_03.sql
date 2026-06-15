-- ----- fragment: minion_1timothy_03.sql (S235 1 Timothy 3) -----
-- =====================================================================
-- S235 minion — 1 TIMOTHY 3 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 1 TIMOTHY 3 (16 verses) — the qualifications of overseers and deacons,
-- the house of Elohim, and the great mystery of godliness.
-- Tag: t235c3 (temp view _s235_t235c3_lookup).
-- Sort band: floor 8450, 25-wide (8450, 8451, 8452 used; under 8475).
-- Source is ALWAYS the canon 1 Timothy verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME — Paul charges Timothy how men ought to *behave in the house of Elohim (God),
-- which is the church of the living Elohim (God), the pillar and ground of the truth* (3:15), and
-- then names that truth's heart: *great is the mystery of godliness: Elohim (God) was manifest in
-- the flesh* (3:16). ★★ 3:16 is the Formed Son made manifest — the invisible Father made visible in
-- the Son who bears his Name and glory, the twin of *the image of the invisible Elohim (God)*
-- (Colossians 1:15) and of the kenosis hymn (Philippians 2:6-9) and of *the Word was made flesh*
-- (John 1:14). The Father is the one invisible Elohim; the Son is the Formed in whom he is made
-- manifest. *Received up into glory* is the exaltation BY the Father. This is NOT proof of a
-- co-equal-persons trinity and NOT a modalist collapse — it is the mystery of the invisible Elohim
-- made manifest in his Formed Son. The Hebrew library held the same: the Elect One / Son of Adam
-- *chosen and hidden before Him, before the creation of the world,* whom *the wisdom of Yahuah (God)
-- of Spirits hath revealed* (1 Enoch 48:6-7), *the light of the Gentiles* (48:4) — hidden, then
-- manifest, exactly the mystery Paul confesses. And Daniel saw *one like the Son of Adam* given
-- *dominion, and glory, and a kingdom* (Daniel 7:13-14) — received up into glory.
-- The overseer/deacon qualifications (3:2-3,8) are no innovation either: they re-speak the Torah's
-- own standard for the men set over the people — *able men, such as fear Elohim (God), men of truth,
-- hating covetousness* (Exodus 18:21).
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-3   the office of a bishop; blameless, apt to teach, not greedy of filthy lucre, not covetous
--           Tanakh: Exodus 18:21 (able men, such as fear Elohim, men of truth, hating covetousness)
--           Extras: none warranted   NT: none warranted (carried in the integrity thread)
--   v.4-5   ruling well his own house, that he may take care of the church of Elohim (God)
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted
--   v.6-7   not a novice; the condemnation and snare of the devil; a good report of them without
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted
--   v.8     the deacons grave, not doubletongued, not given to much wine, not greedy of filthy lucre
--           Tanakh: Exodus 18:21 (men of truth, hating covetousness) [folded into the integrity thread]
--           Extras: none warranted   NT: none warranted
--   v.9-13  the mystery of the faith in a pure conscience; proved; a good degree, boldness in faith
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted
--   v.14-15 the house of Elohim, the church of the living Elohim, the pillar and ground of the truth
--           Tanakh: none warranted (the on-ramp to the mystery thread; v.16 carries the weight)
--           Extras: none warranted   NT: none warranted
--   v.16    ★★ great is the mystery of godliness: Elohim was manifest in the flesh... received up
--           Tanakh: Daniel 7:13 (one like the Son of Adam came with the clouds), Daniel 7:14
--                   (there was given him dominion, and glory, and a kingdom)
--           Extras: 1 Enoch 48:6 (chosen and hidden before the creation of the world),
--                   1 Enoch 48:7 (the wisdom of Yahuah of Spirits hath revealed him),
--                   1 Enoch 48:4 (he shall be the light of the Gentiles)
--           NT: Colossians 1:15 (the image of the invisible Elohim), Colossians 1:26 (the mystery
--                   hid... now is made manifest), Philippians 2:6-9 (made himself of no reputation...
--                   highly exalted), John 1:14 (the Word was made flesh, and dwelt among us),
--                   John 1:18 (no man hath seen Elohim... the only begotten Son... hath declared him)
--
-- THREADS (slug -> target libraries):
--   8450 1-timothy-3-the-mystery-of-godliness-elohim-manifest-in-the-flesh-the-formed  (Tanakh + Extras + NT)  [BLESSING CENTERPIECE]
--   8451 1-timothy-3-the-overseer-and-deacon-able-men-that-fear-elohim-hating-covetousness-exodus-18  (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s235_t235c3_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-timothy-3-the-mystery-of-godliness-elohim-manifest-in-the-flesh-the-formed  [BLESSING CENTERPIECE]
  ('canon', '1-timothy', 3, 16, 'canon', 'colossians', 1, 15, 'free', E'*Who is the image of the invisible Elohim (God), the firstborn of every creature:* (Colossians 1:15). Paul confesses *great is the mystery of godliness: Elohim (God) was manifest in the flesh* (1 Timothy 3:16) — and here is its twin. The Father is the *invisible Elohim (God)*; the Son is his *image,* the One in whom the unseen Father is made visible. To say *Elohim (God) was manifest in the flesh* is to say the same thing the Colossian hymn says: the invisible is imaged in the Formed Son, not a second co-equal person but the very glory of the Father borne in his firstborn.'),
  ('canon', '1-timothy', 3, 16, 'canon', 'colossians', 1, 26, 'free', E'*Even the mystery which hath been hid from ages and from generations, but now is made manifest to his saints:* (Colossians 1:26). Paul names *the mystery of godliness* (1 Timothy 3:16) with the same word he uses of *the mystery which hath been hid from ages and from generations, but now is made manifest.* The pattern of the gospel is hidden-then-manifest: the eternal purpose, concealed through the generations, is now unveiled in the Son — *Elohim (God) was manifest in the flesh.* The mystery is not a riddle but a revealing: the invisible Father made manifest in his Formed Son.'),
  ('canon', '1-timothy', 3, 16, 'canon', 'philippians', 2, 7, 'free', E'*But made himself of no reputation, and took upon him the form of a servant, and was made in the likeness of men:* (Philippians 2:7). The mystery that *Elohim (God) was manifest in the flesh* (1 Timothy 3:16) is the descent the kenosis hymn sings: the One *being in the form of Elohim (God)* (Philippians 2:6) *made himself of no reputation... and was made in the likeness of men.* The flesh in which Elohim (God) was manifest is this very emptying — the Formed Son taking the servant''s form, the invisible glory veiled in true humanity.'),
  ('canon', '1-timothy', 3, 16, 'canon', 'philippians', 2, 9, 'free', E'*Wherefore Elohim (God) also hath highly exalted him, and given him a name which is above every name:* (Philippians 2:9). Paul ends the mystery with *received up into glory* (1 Timothy 3:16), and the kenosis hymn names that same lifting: *Elohim (God) also hath highly exalted him, and given him a name which is above every name.* Mark the grammar in both — it is the Father who exalts the Son, *Elohim (God) also hath highly exalted him.* The Son is *received up into glory* by the Father; the exaltation is given, not self-grasped, the Formed lifted by the One who formed him.'),
  ('canon', '1-timothy', 3, 16, 'canon', 'john', 1, 14, 'free', E'*And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* (John 1:14). *Elohim (God) was manifest in the flesh* (1 Timothy 3:16) is the same confession as *the Word was made flesh, and dwelt among us.* And John keeps the order Paul keeps: the glory beheld is *the glory as of the only begotten of the Father* — the Son''s glory is the Father''s glory shown forth in him. The Word made flesh is the invisible Elohim (God) made manifest, the Formed Son full of grace and truth.'),
  ('canon', '1-timothy', 3, 16, 'canon', 'john', 1, 18, 'free', E'*No man hath seen Elohim (God) at any time; the only begotten Son, which is in the bosom of the Father, he hath declared him.* (John 1:18). This is the hinge of the mystery. *No man hath seen Elohim (God) at any time* — the Father is the invisible Elohim (God); yet *the only begotten Son... hath declared him.* So when Paul says *Elohim (God) was manifest in the flesh* (1 Timothy 3:16), he means the unseen Father is *declared,* made manifest, in his Formed Son. The Son does not replace the Father nor stand as a second co-equal; he is the One in whose flesh the invisible Father is at last beheld.'),
  ('canon', '1-timothy', 3, 16, 'canon', 'daniel', 7, 13, 'free', E'*I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him.* (Daniel 7:13). Daniel saw *one like the Son of Adam* brought near before the Ancient of days. The mystery Paul confesses — *Elohim (God) was manifest in the flesh... seen of angels... received up into glory* (1 Timothy 3:16) — is this figure made flesh and then borne back into the presence from which he came. The Son of Adam who *came with the clouds of heaven* and was *brought near before him* is the Formed One manifested and *received up into glory.*'),
  ('canon', '1-timothy', 3, 16, 'canon', 'daniel', 7, 14, 'free', E'*And there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him: his dominion is an everlasting dominion, which shall not pass away, and his kingdom that which shall not be destroyed.* (Daniel 7:14). To the Son of Adam *there was given him dominion, and glory, and a kingdom,* that *all people, nations, and languages, should serve him.* Paul''s mystery runs the same course: *preached unto the Gentiles, believed on in the world, received up into glory* (1 Timothy 3:16). The glory and kingdom *given him* in Daniel are the *received up into glory* of the confession; mark the giving — the dominion and glory are bestowed on the Son by the Ancient of days, the Formed exalted by the Father.'),
  ('canon', '1-timothy', 3, 16, 'enoch', '1-enoch', 48, 6, 'extras', E'*And for this reason hath he been chosen and hidden before Him, Before the creation of the world and for evermore.* (1 Enoch 48:6). The Hebrew library held the very shape of Paul''s mystery. The Son of Adam, the Elect One, *hath been chosen and hidden before Him, Before the creation of the world* — hidden first, as Paul''s mystery is *hid from ages.* The *mystery of godliness: Elohim (God) was manifest in the flesh* (1 Timothy 3:16) is the unveiling of the One long hidden in the Father''s purpose: chosen and concealed before the world was, then made manifest in due time.'),
  ('canon', '1-timothy', 3, 16, 'enoch', '1-enoch', 48, 7, 'extras', E'*And the wisdom of Yahuah (God) of Spirits hath revealed him to the holy and righteous; For he hath preserved the lot of the righteous, Because they have hated and despised this world of unrighteousness... For in his name they are saved.* (1 Enoch 48:7). The One hidden before the world is now *revealed* — *the wisdom of Yahuah (God) of Spirits hath revealed him to the holy and righteous.* This is the hidden-then-manifest pattern of Paul''s confession: *Elohim (God) was manifest in the flesh... believed on in the world* (1 Timothy 3:16). The Elect One revealed, in whose name *they are saved,* is the Formed Son made manifest and believed on — the same mystery, the invisible One''s chosen Son unveiled.'),
  ('canon', '1-timothy', 3, 16, 'enoch', '1-enoch', 48, 4, 'extras', E'*He shall be a staff to the righteous whereon to stay themselves and not fall, And he shall be the light of the Gentiles, And the hope of those who are troubled of heart.* (1 Enoch 48:4). Paul''s mystery moves outward: *preached unto the Gentiles, believed on in the world* (1 Timothy 3:16). The library foresaw it: the Son of Adam *shall be the light of the Gentiles, And the hope of those who are troubled of heart.* The One manifest in the flesh and received up into glory is the very *light of the Gentiles* Enoch named — the hidden Elect One revealed, preached to the nations and believed on in the world.'),
  -- thread: 1-timothy-3-the-overseer-and-deacon-able-men-that-fear-elohim-hating-covetousness-exodus-18
  ('canon', '1-timothy', 3, 2, 'canon', 'exodus', 18, 21, 'free', E'*Moreover thou shalt provide out of all the people able men, such as fear Elohim (God), men of truth, hating covetousness; and place such over them, to be rulers of thousands, and rulers of hundreds, rulers of fifties, and rulers of tens:* (Exodus 18:21). When Jethro counselled Moses how to set men over Yashar''el (Israel), the standard was the same one Paul lays on the overseer: *A bishop then must be blameless... vigilant, sober, of good behaviour... apt to teach* (1 Timothy 3:2). The Torah''s qualifications — *able men, such as fear Elohim (God), men of truth, hating covetousness* — are the root of Paul''s; the apostle does not invent a new order but binds on the assembly the proven measure of those who lead Elohim (God)''s people.'),
  ('canon', '1-timothy', 3, 3, 'canon', 'exodus', 18, 21, 'free', E'*Moreover thou shalt provide out of all the people able men, such as fear Elohim (God), men of truth, hating covetousness; and place such over them...* (Exodus 18:21). Paul presses the same nerve the Torah pressed: the man set over Elohim (God)''s people must be *not greedy of filthy lucre... not covetous* (1 Timothy 3:3). Jethro''s charge to choose *men of truth, hating covetousness* is precisely this — the leader who loves money cannot be trusted with the flock. The overseer''s freedom from greed is no new rule but the ancient standard for the rulers of thousands and of tens.'),
  ('canon', '1-timothy', 3, 8, 'canon', 'exodus', 18, 21, 'free', E'*Likewise must the deacons be grave, not doubletongued, not given to much wine, not greedy of filthy lucre;* (1 Timothy 3:8). The deacons too are held to the Torah''s measure for those who serve the people. *Men of truth, hating covetousness* (Exodus 18:21) is what *not doubletongued* and *not greedy of filthy lucre* spell out — a single, honest tongue and hands clean of greed. The same standard Jethro gave Moses for the rulers of Yashar''el (Israel) governs both overseer and deacon in the house of Elohim (God).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s235_t235c3_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s235_t235c3_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-timothy-3-the-mystery-of-godliness-elohim-manifest-in-the-flesh-the-formed',
       E'The mystery of godliness: Elohim (God) manifest in the flesh — the Formed (Colossians 1, Philippians 2, John 1, Daniel 7, 1 Enoch 48)',
       E'Paul tells Timothy how men ought *to behave... in the house of Elohim (God), which is the church of the living Elohim (God), the pillar and ground of the truth* (1 Timothy 3:15) — and then names the truth that house is pillar to: *And without controversy great is the mystery of godliness: Elohim (God) was manifest in the flesh, justified in the Spirit, seen of angels, preached unto the Gentiles, believed on in the world, received up into glory* (1 Timothy 3:16). This is the heart of the confession, and it must be read for what it is: the invisible Father made manifest in his Formed Son. It is the twin of the Colossian hymn — *Who is the image of the invisible Elohim (God), the firstborn of every creature* (Colossians 1:15): the Father is the *invisible Elohim (God),* the Son is his *image,* the One in whom the unseen is made visible. To say *Elohim (God) was manifest in the flesh* is to say the same thing, no more and no less — not a second co-equal person, but the very glory of the invisible Father borne in his Formed Son. John keeps the same order: *the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father)* (John 1:14), and most plainly, *No man hath seen Elohim (God) at any time; the only begotten Son, which is in the bosom of the Father, he hath declared him* (John 1:18). The Father is the unseen One; the Son *declares* him — made him manifest. The mystery is hidden-then-revealed: *the mystery which hath been hid from ages and from generations, but now is made manifest to his saints* (Colossians 1:26). And *received up into glory* is the exaltation BY the Father — the descent and lifting of the kenosis hymn: the One *being in the form of Elohim (God)... made himself of no reputation, and took upon him the form of a servant, and was made in the likeness of men* (Philippians 2:6-7), wherefore *Elohim (God) also hath highly exalted him, and given him a name which is above every name* (Philippians 2:9). Mark the grammar — it is the Father who exalts; the Son is received up, not self-grasping. The Hebrew library held the very shape of this mystery. The Son of Adam, the Elect One, *hath been chosen and hidden before Him, Before the creation of the world* (1 Enoch 48:6) — hidden, as Paul''s mystery is hid from ages; and then *the wisdom of Yahuah (God) of Spirits hath revealed him to the holy and righteous* (1 Enoch 48:7), made manifest, *for in his name they are saved.* He *shall be the light of the Gentiles* (1 Enoch 48:4) — *preached unto the Gentiles, believed on in the world.* And Daniel saw the end of it: *one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days* (Daniel 7:13), to whom *there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him* (Daniel 7:14) — the glory *given him,* the Formed *received up into glory* by the Ancient of days. Harmonized: the great mystery of godliness is the one invisible Father made manifest in his Formed Son — emptied into flesh, justified in the Spirit, preached to the nations, and received up into the glory the Father gave him. It is no proof of co-equal persons and no modalist collapse; it is the unveiling of the long-hidden Elect One, the image of the invisible Elohim (God).',
       sv.verse_id, ev.verse_id, 'extras', 8450
  FROM _s235_t235c3_lookup sv, _s235_t235c3_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=3 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='1-timothy' AND ev.chapter_number=3 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-timothy-3-the-overseer-and-deacon-able-men-that-fear-elohim-hating-covetousness-exodus-18',
       E'The overseer and deacon: able men that fear Elohim (God), hating covetousness (Exodus 18)',
       E'The qualifications Paul lays on overseer and deacon are not an apostolic novelty but the Torah''s own measure for the men set over Elohim (God)''s people. *A bishop then must be blameless... vigilant, sober, of good behaviour, given to hospitality, apt to teach; Not given to wine, no striker, not greedy of filthy lucre... not covetous* (1 Timothy 3:2-3); and *Likewise must the deacons be grave, not doubletongued, not given to much wine, not greedy of filthy lucre* (1 Timothy 3:8). When Jethro counselled Moses how to set rulers over Yashar''el (Israel), he gave the same standard: *Moreover thou shalt provide out of all the people able men, such as fear Elohim (God), men of truth, hating covetousness; and place such over them, to be rulers of thousands, and rulers of hundreds, rulers of fifties, and rulers of tens* (Exodus 18:21). *Able men* — apt, capable, blameless; *such as fear Elohim (God)* — of good behaviour and sober; *men of truth* — not doubletongued; *hating covetousness* — not greedy of filthy lucre, not covetous. The leader who loves money cannot be trusted with the flock, and the man with a divided tongue cannot guard the truth. Paul binds on the house of Elohim (God) the proven measure given to Moses at the mountain: the same character required of those who judged Yashar''el (Israel) is required of those who shepherd the assembly — one continuous standard for the rulers of the people of Elohim (God).',
       sv.verse_id, ev.verse_id, 'free', 8451
  FROM _s235_t235c3_lookup sv, _s235_t235c3_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=3 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='1-timothy' AND ev.chapter_number=3 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-timothy-3-the-mystery-of-godliness-elohim-manifest-in-the-flesh-the-formed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Colossians 1:15 — *Who is the image of the invisible Elohim (God), the firstborn of every creature* the twin confession; the invisible Father imaged in the Formed Son, *Elohim (God)... manifest in the flesh* (1 Timothy 3:16).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c3_lookup sv, _s235_t235c3_lookup tv
 WHERE t.slug='1-timothy-3-the-mystery-of-godliness-elohim-manifest-in-the-flesh-the-formed'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=3 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=1 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Colossians 1:26 — *the mystery which hath been hid from ages and from generations, but now is made manifest* the same hidden-then-manifest pattern as *the mystery of godliness* (1 Timothy 3:16).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c3_lookup sv, _s235_t235c3_lookup tv
 WHERE t.slug='1-timothy-3-the-mystery-of-godliness-elohim-manifest-in-the-flesh-the-formed'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=3 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=1 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Philippians 2:7 — *made himself of no reputation, and took upon him the form of a servant, and was made in the likeness of men* the descent into the flesh in which *Elohim (God) was manifest* (1 Timothy 3:16).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c3_lookup sv, _s235_t235c3_lookup tv
 WHERE t.slug='1-timothy-3-the-mystery-of-godliness-elohim-manifest-in-the-flesh-the-formed'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=3 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Philippians 2:9 — *Elohim (God) also hath highly exalted him, and given him a name which is above every name* the Father''s exaltation behind *received up into glory* (1 Timothy 3:16); the Son lifted by the One who formed him.'
  FROM cross_reference_threads t, cross_references x, _s235_t235c3_lookup sv, _s235_t235c3_lookup tv
 WHERE t.slug='1-timothy-3-the-mystery-of-godliness-elohim-manifest-in-the-flesh-the-formed'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=3 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'John 1:14 — *the Word was made flesh, and dwelt among us... the glory as of the only begotten of the Father* the same confession as *Elohim (God) was manifest in the flesh* (1 Timothy 3:16); the Son''s glory is the Father''s glory shown forth.'
  FROM cross_reference_threads t, cross_references x, _s235_t235c3_lookup sv, _s235_t235c3_lookup tv
 WHERE t.slug='1-timothy-3-the-mystery-of-godliness-elohim-manifest-in-the-flesh-the-formed'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=3 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'John 1:18 — *No man hath seen Elohim (God) at any time; the only begotten Son... hath declared him* the hinge: the invisible Father declared, made manifest, in his Formed Son (1 Timothy 3:16).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c3_lookup sv, _s235_t235c3_lookup tv
 WHERE t.slug='1-timothy-3-the-mystery-of-godliness-elohim-manifest-in-the-flesh-the-formed'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=3 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Daniel 7:13 — *one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days* the Formed One made flesh and borne back to the presence; *received up into glory* (1 Timothy 3:16).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c3_lookup sv, _s235_t235c3_lookup tv
 WHERE t.slug='1-timothy-3-the-mystery-of-godliness-elohim-manifest-in-the-flesh-the-formed'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=3 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'Daniel 7:14 — *there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him* the glory GIVEN the Son by the Ancient of days; *preached unto the Gentiles... received up into glory* (1 Timothy 3:16).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c3_lookup sv, _s235_t235c3_lookup tv
 WHERE t.slug='1-timothy-3-the-mystery-of-godliness-elohim-manifest-in-the-flesh-the-formed'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=3 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 9, E'1 Enoch 48:6 — *for this reason hath he been chosen and hidden before Him, Before the creation of the world* the Elect One hidden, as the mystery is *hid from ages* before it is *manifest in the flesh* (1 Timothy 3:16).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c3_lookup sv, _s235_t235c3_lookup tv
 WHERE t.slug='1-timothy-3-the-mystery-of-godliness-elohim-manifest-in-the-flesh-the-formed'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=3 AND sv.verse_number=16
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=48 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 10, E'1 Enoch 48:7 — *the wisdom of Yahuah (God) of Spirits hath revealed him to the holy and righteous... For in his name they are saved* the One hidden now revealed; *Elohim (God) was manifest in the flesh... believed on in the world* (1 Timothy 3:16).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c3_lookup sv, _s235_t235c3_lookup tv
 WHERE t.slug='1-timothy-3-the-mystery-of-godliness-elohim-manifest-in-the-flesh-the-formed'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=3 AND sv.verse_number=16
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=48 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 11, E'1 Enoch 48:4 — *he shall be the light of the Gentiles, And the hope of those who are troubled of heart* the Elect One foreseen for the nations; *preached unto the Gentiles, believed on in the world* (1 Timothy 3:16).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c3_lookup sv, _s235_t235c3_lookup tv
 WHERE t.slug='1-timothy-3-the-mystery-of-godliness-elohim-manifest-in-the-flesh-the-formed'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=3 AND sv.verse_number=16
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=48 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-timothy-3-the-overseer-and-deacon-able-men-that-fear-elohim-hating-covetousness-exodus-18
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 18:21 — *able men, such as fear Elohim (God), men of truth, hating covetousness* the Torah''s measure for the rulers of the people, behind *A bishop then must be blameless... apt to teach* (1 Timothy 3:2).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c3_lookup sv, _s235_t235c3_lookup tv
 WHERE t.slug='1-timothy-3-the-overseer-and-deacon-able-men-that-fear-elohim-hating-covetousness-exodus-18'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=3 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=18 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 18:21 — *men of truth, hating covetousness* the leader who loves money cannot be trusted; behind *not greedy of filthy lucre... not covetous* (1 Timothy 3:3).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c3_lookup sv, _s235_t235c3_lookup tv
 WHERE t.slug='1-timothy-3-the-overseer-and-deacon-able-men-that-fear-elohim-hating-covetousness-exodus-18'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=3 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=18 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 18:21 — *men of truth, hating covetousness* the same standard for the deacons: *not doubletongued... not greedy of filthy lucre* (1 Timothy 3:8).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c3_lookup sv, _s235_t235c3_lookup tv
 WHERE t.slug='1-timothy-3-the-overseer-and-deacon-able-men-that-fear-elohim-hating-covetousness-exodus-18'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=3 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=18 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
