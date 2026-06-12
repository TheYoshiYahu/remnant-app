-- ----- fragment: minion_ecclesiasticus_30.sql (session253 ecclesiasticus 30) -----
-- Source anchor: apocrypha/ecclesiasticus ch30. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: sir30 (view _session253_sir30_lookup). Sort band base 59025, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_sir30_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ecclesiasticus-30-spare-the-rod
  ('apocrypha', 'ecclesiasticus', 30, 1, 'canon', 'proverbs', 13, 24, 'free', E'Proverbs 13:24 — *He that spareth his rod hateth his son: but he that loveth him chasteneth him betimes.* Solomon''s headline is Ben Sira''s first verse: the father''s love is proved by the rod, not denied by it (Ecclesiasticus 30:1).'),
  ('apocrypha', 'ecclesiasticus', 30, 1, 'canon', 'proverbs', 22, 15, 'free', E'Proverbs 22:15 — *Foolishness is bound in the heart of a child; but the rod of correction shall drive it far from him.* The ''rod'' Ben Sira names in 30:1 is the same instrument that drives folly out of the young heart (Ecclesiasticus 30:1).'),
  ('apocrypha', 'ecclesiasticus', 30, 13, 'canon', 'proverbs', 23, 13, 'free', E'Proverbs 23:13 — *Withhold not correction from the child: for if thou beatest him with the rod, he shall not die.* Sirach''s ''Chastise your son'' is the Proverb verbatim in spirit: correction is not cruelty but the saving of his life (Ecclesiasticus 30:13).'),
  ('apocrypha', 'ecclesiasticus', 30, 13, 'canon', 'proverbs', 19, 18, 'free', E'Proverbs 19:18 — *Chasten thy son while there is hope, and let not thy soul spare for his crying.* The Tanakh and Ben Sira agree: chasten while youth is pliable, not after the heart has set (Ecclesiasticus 30:13).'),
  -- thread: ecclesiasticus-30-cocker-the-child
  ('apocrypha', 'ecclesiasticus', 30, 8, 'canon', 'proverbs', 29, 15, 'free', E'Proverbs 29:15 — *The rod and reproof give wisdom: but a child left to himself bringeth his mother to shame.* The exact phrase of Sirach 30:8 — the ''child left to himself'' who turns wilful — is lifted straight from Solomon (Ecclesiasticus 30:8).'),
  ('apocrypha', 'ecclesiasticus', 30, 9, 'canon', 'proverbs', 29, 17, 'free', E'Proverbs 29:17 — *Correct thy son, and he shall give thee rest; yea, he shall give delight unto thy soul.* Against the heaviness the cockered child brings (30:9), the corrected son brings rest and delight — the opposite outcome from the opposite cause (Ecclesiasticus 30:9).'),
  ('apocrypha', 'ecclesiasticus', 30, 12, 'canon', 'proverbs', 23, 14, 'free', E'Proverbs 23:14 — *Thou shalt beat him with the rod, and shalt deliver his soul from hell.* ''Beat him on the sides while he is a child'' (30:12) is Solomon''s deliverance of the soul from death, not mere severity (Ecclesiasticus 30:12).'),
  -- thread: ecclesiasticus-30-father-chasteneth
  ('apocrypha', 'ecclesiasticus', 30, 2, 'canon', 'deuteronomy', 8, 5, 'free', E'Deuteronomy 8:5 — *Thou shalt also consider in thine heart, that, as a man chasteneth his son, so Yahuah Elohayka (the LORD thy God) chasteneth thee.* The joy of the chastening father in 30:2 mirrors Yahuah''s own fatherly correction of Yashar''el (Ecclesiasticus 30:2).'),
  ('apocrypha', 'ecclesiasticus', 30, 2, 'canon', 'hebrews', 12, 7, 'free', E'Hebrews 12:7 — *If ye endure chastening, Elohim (God) dealeth with you as with sons; for what son is he whom the father chasteneth not?* Ben Sira''s rejoicing chastener (30:2) is the human picture Hebrews lifts to the Father of spirits (Ecclesiasticus 30:2).'),
  ('apocrypha', 'ecclesiasticus', 30, 1, 'canon', 'proverbs', 3, 12, 'free', E'Proverbs 3:12 — *For whom Yahuah (LORD) loveth he correcteth; even as a father the son in whom he delighteth.* Sirach 30:1''s loving father who applies the rod is the very image Solomon uses for Yahuah''s love (Ecclesiasticus 30:1).'),
  ('apocrypha', 'ecclesiasticus', 30, 2, 'canon', 'revelation', 3, 19, 'free', E'Revelation 3:19 — *As many as I love, I rebuke and chasten: be zealous therefore, and repent.* The Messiah to Laodicea speaks the same wisdom Ben Sira teaches the household: love rebukes (Ecclesiasticus 30:2).'),
  -- thread: ecclesiasticus-30-nurture-and-admonition
  ('apocrypha', 'ecclesiasticus', 30, 11, 'canon', 'ephesians', 6, 4, 'free', E'Ephesians 6:4 — *And, ye fathers, provoke not your children to wrath: but bring them up in the nurture and admonition of Yahuah (Lord).* Paul''s balance answers both of Sirach''s warnings — no liberty to folly (30:11) yet no provoking wound (30:7) (Ecclesiasticus 30:11).'),
  ('apocrypha', 'ecclesiasticus', 30, 7, 'canon', 'proverbs', 17, 21, 'free', E'Proverbs 17:21 — *He that begetteth a fool doeth it to his sorrow: and the father of a fool hath no joy.* The troubled bowels and grief of the over-indulgent father in 30:7 are Solomon''s sorrowing father of a fool (Ecclesiasticus 30:7).'),
  -- thread: ecclesiasticus-30-gladness-of-heart
  ('apocrypha', 'ecclesiasticus', 30, 22, 'canon', 'proverbs', 17, 22, 'free', E'Proverbs 17:22 — *A merry heart doeth good like a medicine: but a broken spirit drieth the bones.* ''The gladness of the heart is the life of man'' (30:22) is Solomon''s merry heart that heals like medicine, against the heaviness that shortens days (Ecclesiasticus 30:22).'),
  ('apocrypha', 'ecclesiasticus', 30, 24, 'canon', 'proverbs', 15, 13, 'free', E'Proverbs 15:13 — *A merry heart maketh a cheerful countenance: but by sorrow of the heart the spirit is broken.* Ben Sira''s envy and wrath that ''shorten the life'' (30:24) are Solomon''s sorrow of heart that breaks the spirit (Ecclesiasticus 30:24).'),
  ('apocrypha', 'ecclesiasticus', 30, 16, 'canon', 'proverbs', 15, 15, 'free', E'Proverbs 15:15 — *All the days of the afflicted are evil: but he that is of a merry heart hath a continual feast.* ''No joy above the joy of the heart'' (30:16) is the merry heart''s continual feast — wealth no body can buy (Ecclesiasticus 30:16).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_sir30_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_sir30_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-30-spare-the-rod',
       E'He that loveth his son causeth him oft to feel the rod',
       E'Ben Sira opens the chapter with the Proverb he learned at the feet of the Tanakh: *He that loves his son causeth him oft to feel the rod, that he may have joy of him in the end* (Ecclesiasticus 30:1), and again *Chastise your son, and hold him to labour, lest his lewd behaviour be an offence to you* (Ecclesiasticus 30:13). It ain''t new — Solomon said it first: *He that spareth his rod hateth his son: but he that loveth him chasteneth him betimes* (Proverbs 13:24), and *Foolishness is bound in the heart of a child; but the rod of correction shall drive it far from him* (Proverbs 22:15). The father who withholds the rod hates, not loves; the love is in the discipline. *Withhold not correction from the child: for if thou beatest him with the rod, he shall not die* (Proverbs 23:13); *Chasten thy son while there is hope, and let not thy soul spare for his crying* (Proverbs 19:18). The wisdom of Sirach is the wisdom of the Torah household: correction unto life.',
       sv.verse_id, ev.verse_id, 'extras', 59025
  FROM _session253_sir30_lookup sv, _session253_sir30_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=30 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=30 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-30-cocker-the-child',
       E'An horse not broken — cocker thy child and he makes thee afraid',
       E'Ben Sira turns to the cost of indulgence: *An horse not broken becometh headstrong: and a child left to himself will be wilful* (Ecclesiasticus 30:8); *Cocker your child, and he shall make you afraid: play with him, and he will bring you to heaviness* (Ecclesiasticus 30:9); *Bow down his neck while he is young, and beat him on the sides while he is a child, lest he wax stubborn, and be disobedient to you, and so bring sorrow to yours heart* (Ecclesiasticus 30:12). The unbroken colt and the unbroken child are one image. Solomon framed the same law: *The rod and reproof give wisdom: but a child left to himself bringeth his mother to shame* (Proverbs 29:15) — the very phrase ''left to himself'' stands in both. And the fruit of the discipline is rest: *Correct thy son, and he shall give thee rest; yea, he shall give delight unto thy soul* (Proverbs 29:17). It ain''t new — the sorrow of the spared rod was written in Israel''s Proverbs long before the deuterocanon copied it down.',
       sv.verse_id, ev.verse_id, 'extras', 59028
  FROM _session253_sir30_lookup sv, _session253_sir30_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=30 AND sv.verse_number=8
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=30 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-30-father-chasteneth',
       E'What son is he whom the father chasteneth not',
       E'Behind every earthly father with the rod stands the Father of spirits. Ben Sira''s *He that chastiseth his son shall have joy in him, and shall rejoice of him among his acquaintance* (Ecclesiasticus 30:2) opens onto the Torah''s deepest reading of discipline: *Thou shalt also consider in thine heart, that, as a man chasteneth his son, so Yahuah Elohayka (the LORD thy God) chasteneth thee* (Deuteronomy 8:5). Solomon, whom the writer of Hebrews quotes, said *My son, despise not the chastening of Yahuah (LORD); neither be weary of his correction: For whom Yahuah (LORD) loveth he correcteth; even as a father the son in whom he delighteth* (Proverbs 3:11-12). The Letter to the Hebrews gathers it all: *If ye endure chastening, Elohim (God) dealeth with you as with sons; for what son is he whom the father chasteneth not?* (Hebrews 12:7), for it *yieldeth the peaceable fruit of righteousness* (Hebrews 12:11). The risen Messiah speaks the same to His own: *As many as I love, I rebuke and chasten: be zealous therefore, and repent* (Revelation 3:19). It ain''t new — the disciplining love runs unbroken from Deuteronomy through Sirach to the throne.',
       sv.verse_id, ev.verse_id, 'extras', 59031
  FROM _session253_sir30_lookup sv, _session253_sir30_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=30 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=30 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-30-nurture-and-admonition',
       E'He that makes too much of his son — and he that loves not enough',
       E'Ben Sira holds a balance: the rod, yes, but also the warning against over-indulgence that wounds — *He that makes too much of his son shall bind up his wounds; and his bowels will be troubled at every cry* (Ecclesiasticus 30:7); *Give him no liberty in his youth, and wink not at his follies* (Ecclesiasticus 30:11). Paul gathers both edges into one charge to fathers: *And, ye fathers, provoke not your children to wrath: but bring them up in the nurture and admonition of Yahuah (Lord)* (Ephesians 6:4) — neither indulgence nor cruelty, but nurture and admonition together. Solomon weighs the cost of the spared rod from the parent''s side: *He that begetteth a fool doeth it to his sorrow: and the father of a fool hath no joy* (Proverbs 17:21) — the troubled bowels of Sirach 30:7. It ain''t new: the discipline of the Torah household is the discipline Paul lays on the assembly.',
       sv.verse_id, ev.verse_id, 'extras', 59034
  FROM _session253_sir30_lookup sv, _session253_sir30_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=30 AND sv.verse_number=7
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=30 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-30-gladness-of-heart',
       E'The gladness of the heart is the life of man',
       E'The chapter pivots from discipline to joy: *There is no riches above a sound body, and no joy above the joy of the heart* (Ecclesiasticus 30:16); *Give not over your mind to heaviness, and afflict not thyself in your own counsel* (Ecclesiasticus 30:21); *The gladness of the heart is the life of man, and the joyfulness of a man prolongeth his days* (Ecclesiasticus 30:22); and the warning, *Envy and wrath shorten the life, and carefulness brings age before the time* (Ecclesiasticus 30:24). It ain''t new — Solomon is the physician here: *A merry heart doeth good like a medicine: but a broken spirit drieth the bones* (Proverbs 17:22). The glad heart is the medicine; the heavy heart is the disease that shortens days. *A merry heart maketh a cheerful countenance: but by sorrow of the heart the spirit is broken* (Proverbs 15:13), and *he that is of a merry heart hath a continual feast* (Proverbs 15:15). The wisdom of Sirach and the wisdom of the Proverbs are one wisdom: gladness of heart is the life of man.',
       sv.verse_id, ev.verse_id, 'extras', 59037
  FROM _session253_sir30_lookup sv, _session253_sir30_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=30 AND sv.verse_number=16
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=30 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ecclesiasticus-30-spare-the-rod
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 13:24 — *He that spareth his rod hateth his son: but he that loveth him chasteneth him betimes.* Solomon''s headline is Ben Sira''s first verse: the father''s love is proved by the rod, not denied by it (Ecclesiasticus 30:1).'
  FROM cross_reference_threads t, cross_references x, _session253_sir30_lookup sv, _session253_sir30_lookup tv
 WHERE t.slug='ecclesiasticus-30-spare-the-rod'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=30 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=13 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 22:15 — *Foolishness is bound in the heart of a child; but the rod of correction shall drive it far from him.* The ''rod'' Ben Sira names in 30:1 is the same instrument that drives folly out of the young heart (Ecclesiasticus 30:1).'
  FROM cross_reference_threads t, cross_references x, _session253_sir30_lookup sv, _session253_sir30_lookup tv
 WHERE t.slug='ecclesiasticus-30-spare-the-rod'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=30 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=22 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 23:13 — *Withhold not correction from the child: for if thou beatest him with the rod, he shall not die.* Sirach''s ''Chastise your son'' is the Proverb verbatim in spirit: correction is not cruelty but the saving of his life (Ecclesiasticus 30:13).'
  FROM cross_reference_threads t, cross_references x, _session253_sir30_lookup sv, _session253_sir30_lookup tv
 WHERE t.slug='ecclesiasticus-30-spare-the-rod'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=30 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=23 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 19:18 — *Chasten thy son while there is hope, and let not thy soul spare for his crying.* The Tanakh and Ben Sira agree: chasten while youth is pliable, not after the heart has set (Ecclesiasticus 30:13).'
  FROM cross_reference_threads t, cross_references x, _session253_sir30_lookup sv, _session253_sir30_lookup tv
 WHERE t.slug='ecclesiasticus-30-spare-the-rod'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=30 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=19 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-30-cocker-the-child
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 29:15 — *The rod and reproof give wisdom: but a child left to himself bringeth his mother to shame.* The exact phrase of Sirach 30:8 — the ''child left to himself'' who turns wilful — is lifted straight from Solomon (Ecclesiasticus 30:8).'
  FROM cross_reference_threads t, cross_references x, _session253_sir30_lookup sv, _session253_sir30_lookup tv
 WHERE t.slug='ecclesiasticus-30-cocker-the-child'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=30 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=29 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 29:17 — *Correct thy son, and he shall give thee rest; yea, he shall give delight unto thy soul.* Against the heaviness the cockered child brings (30:9), the corrected son brings rest and delight — the opposite outcome from the opposite cause (Ecclesiasticus 30:9).'
  FROM cross_reference_threads t, cross_references x, _session253_sir30_lookup sv, _session253_sir30_lookup tv
 WHERE t.slug='ecclesiasticus-30-cocker-the-child'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=30 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=29 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 23:14 — *Thou shalt beat him with the rod, and shalt deliver his soul from hell.* ''Beat him on the sides while he is a child'' (30:12) is Solomon''s deliverance of the soul from death, not mere severity (Ecclesiasticus 30:12).'
  FROM cross_reference_threads t, cross_references x, _session253_sir30_lookup sv, _session253_sir30_lookup tv
 WHERE t.slug='ecclesiasticus-30-cocker-the-child'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=30 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=23 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-30-father-chasteneth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 8:5 — *Thou shalt also consider in thine heart, that, as a man chasteneth his son, so Yahuah Elohayka (the LORD thy God) chasteneth thee.* The joy of the chastening father in 30:2 mirrors Yahuah''s own fatherly correction of Yashar''el (Ecclesiasticus 30:2).'
  FROM cross_reference_threads t, cross_references x, _session253_sir30_lookup sv, _session253_sir30_lookup tv
 WHERE t.slug='ecclesiasticus-30-father-chasteneth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=30 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=8 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 12:7 — *If ye endure chastening, Elohim (God) dealeth with you as with sons; for what son is he whom the father chasteneth not?* Ben Sira''s rejoicing chastener (30:2) is the human picture Hebrews lifts to the Father of spirits (Ecclesiasticus 30:2).'
  FROM cross_reference_threads t, cross_references x, _session253_sir30_lookup sv, _session253_sir30_lookup tv
 WHERE t.slug='ecclesiasticus-30-father-chasteneth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=30 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 3:12 — *For whom Yahuah (LORD) loveth he correcteth; even as a father the son in whom he delighteth.* Sirach 30:1''s loving father who applies the rod is the very image Solomon uses for Yahuah''s love (Ecclesiasticus 30:1).'
  FROM cross_reference_threads t, cross_references x, _session253_sir30_lookup sv, _session253_sir30_lookup tv
 WHERE t.slug='ecclesiasticus-30-father-chasteneth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=30 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 3:19 — *As many as I love, I rebuke and chasten: be zealous therefore, and repent.* The Messiah to Laodicea speaks the same wisdom Ben Sira teaches the household: love rebukes (Ecclesiasticus 30:2).'
  FROM cross_reference_threads t, cross_references x, _session253_sir30_lookup sv, _session253_sir30_lookup tv
 WHERE t.slug='ecclesiasticus-30-father-chasteneth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=30 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=3 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-30-nurture-and-admonition
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ephesians 6:4 — *And, ye fathers, provoke not your children to wrath: but bring them up in the nurture and admonition of Yahuah (Lord).* Paul''s balance answers both of Sirach''s warnings — no liberty to folly (30:11) yet no provoking wound (30:7) (Ecclesiasticus 30:11).'
  FROM cross_reference_threads t, cross_references x, _session253_sir30_lookup sv, _session253_sir30_lookup tv
 WHERE t.slug='ecclesiasticus-30-nurture-and-admonition'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=30 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=6 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 17:21 — *He that begetteth a fool doeth it to his sorrow: and the father of a fool hath no joy.* The troubled bowels and grief of the over-indulgent father in 30:7 are Solomon''s sorrowing father of a fool (Ecclesiasticus 30:7).'
  FROM cross_reference_threads t, cross_references x, _session253_sir30_lookup sv, _session253_sir30_lookup tv
 WHERE t.slug='ecclesiasticus-30-nurture-and-admonition'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=30 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=17 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-30-gladness-of-heart
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 17:22 — *A merry heart doeth good like a medicine: but a broken spirit drieth the bones.* ''The gladness of the heart is the life of man'' (30:22) is Solomon''s merry heart that heals like medicine, against the heaviness that shortens days (Ecclesiasticus 30:22).'
  FROM cross_reference_threads t, cross_references x, _session253_sir30_lookup sv, _session253_sir30_lookup tv
 WHERE t.slug='ecclesiasticus-30-gladness-of-heart'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=30 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=17 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 15:13 — *A merry heart maketh a cheerful countenance: but by sorrow of the heart the spirit is broken.* Ben Sira''s envy and wrath that ''shorten the life'' (30:24) are Solomon''s sorrow of heart that breaks the spirit (Ecclesiasticus 30:24).'
  FROM cross_reference_threads t, cross_references x, _session253_sir30_lookup sv, _session253_sir30_lookup tv
 WHERE t.slug='ecclesiasticus-30-gladness-of-heart'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=30 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=15 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 15:15 — *All the days of the afflicted are evil: but he that is of a merry heart hath a continual feast.* ''No joy above the joy of the heart'' (30:16) is the merry heart''s continual feast — wealth no body can buy (Ecclesiasticus 30:16).'
  FROM cross_reference_threads t, cross_references x, _session253_sir30_lookup sv, _session253_sir30_lookup tv
 WHERE t.slug='ecclesiasticus-30-gladness-of-heart'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=30 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=15 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

