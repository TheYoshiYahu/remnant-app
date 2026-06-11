-- ----- fragment: minion_jubilees_35.sql (session251 jubilees 35) -----
-- Source anchor: jubilees/jubilees ch35. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ju35 (view _session251_ju35_lookup). Sort band base 53850, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session251_ju35_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jubilees-35-honour-father-and-brother
  ('jubilees', 'jubilees', 35, 1, 'canon', 'exodus', 20, 12, 'free', E'Exodus 20:12 — *Honour thy father and thy mother: that thy days may be long upon the land which Yahuah Elohayka (the LORD thy God) giveth thee.* Rebekah''s charge that Jacob honour his father and brother all his days is the fifth commandment, kept by the patriarch generations before Sinai.'),
  ('jubilees', 'jubilees', 35, 2, 'canon', 'genesis', 35, 29, 'free', E'Genesis 35:29 — *And Isaac gave up the ghost, and died, and was gathered unto his people, being old and full of days: and his sons Esau and Jacob buried him.* Jacob''s vow to honour his parents as righteousness before Yahuah is fulfilled when he and Esau bury their father, the Genesis scene Jubilees retells.'),
  -- thread: jubilees-35-esau-perverse-from-youth
  ('jubilees', 'jubilees', 35, 9, 'canon', 'genesis', 27, 41, 'free', E'Genesis 27:41 — *And Esau hated Jacob because of the blessing wherewith his father blessed him: and Esau said in his heart, The days of mourning for my father are at hand; then will I slay my brother Jacob.* Rebekah''s fear that Esau desires after Isaac''s death to kill Jacob quotes Esau''s own murderous resolve from Genesis.'),
  ('jubilees', 'jubilees', 35, 9, 'canon', 'genesis', 25, 23, 'free', E'Genesis 25:23 — *Two nations are in thy womb, and two manner of people shall be separated from thy bowels; and the one people shall be stronger than the other people; and the elder shall serve the younger.* Esau''s enmity from his youth is the womb-prophecy of the two nations and the election in which the elder serves the younger.'),
  -- thread: jubilees-35-isaac-love-reversed-edom-rooted-out
  ('jubilees', 'jubilees', 35, 13, 'canon', 'genesis', 25, 28, 'free', E'Genesis 25:28 — *And Isaac loved Esau, because he did eat of his venison: but Rebekah loved Jacob.* Isaac''s confession that he formerly loved Esau more than Jacob recalls the divided parental love Genesis records at the brothers'' birth.'),
  ('jubilees', 'jubilees', 35, 14, 'canon', 'malachi', 1, 3, 'free', E'Malachi 1:3 — *And I hated Esau, and laid his mountains and his heritage waste for the dragons of the wilderness.* Isaac''s word that Esau''s seed will be rooted out from under heaven is the same election-and-judgement Yahuah declares over Edom through Malachi.'),
  ('jubilees', 'jubilees', 35, 14, 'canon', 'obadiah', 1, 10, 'free', E'Obadiah 1:10 — *For thy violence against thy brother Jacob shame shall cover thee, and thou shalt be cut off for ever.* Isaac''s verdict that Esau''s seed will be destroyed from the earth is Obadiah''s sentence on Edom for violence against his brother Jacob.'),
  -- thread: jubilees-35-love-one-another-not-as-cain
  ('jubilees', 'jubilees', 35, 20, 'canon', 'psalms', 133, 1, 'free', E'Psalm 133:1 — *Behold, how good and how pleasant it is for brethren to dwell together in unity!* Rebekah''s plea that Esau and Jacob love each other and prosper is the very brotherly unity David sings as good and pleasant.'),
  ('jubilees', 'jubilees', 35, 20, 'canon', 'leviticus', 19, 18, 'free', E'Leviticus 19:18 — *Thou shalt not avenge, nor bear any grudge against the children of thy people, but thou shalt love thy neighbour as thyself: I am Yahuah (LORD).* Rebekah''s charge of mutual love with no desire for evil is the love-thy-neighbour command, kept by the fathers before it was written at Sinai.'),
  ('jubilees', 'jubilees', 35, 26, 'canon', 'john', 13, 34, 'free', E'John 13:34 — *A new commandment I give unto you, That ye love one another; as I have loved you, that ye also love one another.* Jacob''s vow to be first in nothing save love only is the same love-one-another Messiah renews — old as the patriarchs, ever new.'),
  ('jubilees', 'jubilees', 35, 26, 'canon', '1-john', 3, 15, 'free', E'1 John 3:15 — *Whosoever hateth his brother is a murderer: and ye know that no murderer hath eternal life abiding in him.* Against Jacob''s mutual love stands Esau''s hatred — the apostle names brother-hatred as Cain''s murder, the seed-war Rebekah begged her sons to refuse.'),
  -- thread: jubilees-35-rebekah-buried-near-sarah
  ('jubilees', 'jubilees', 35, 20, 'canon', 'genesis', 23, 19, 'free', E'Genesis 23:19 — *And after this, Abraham buried Sarah his wife in the cave of the field of Machpelah before Mamre: the same is Hebron in the land of Canaan.* Rebekah''s request to be buried near Sarah points to Machpelah, the burying-place Abraham bought when he first laid Sarah there.'),
  ('jubilees', 'jubilees', 35, 26, 'canon', 'genesis', 35, 27, 'free', E'Genesis 35:27 — *And Jacob came unto Isaac his father unto Mamre, unto the city of Arbah, which is Hebron, where Abraham and Isaac sojourned.* The double cave near Sarah where Esau and Jacob bury Rebekah sits at Hebron-Mamre, the patriarchs'' dwelling in the Genesis account Jubilees retells.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session251_ju35_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session251_ju35_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-35-honour-father-and-brother',
       E'Rebekah''s charge: honour them all the days of your life',
       E'Rebekah''s last charge to Jacob is the fifth word of the Decalogue spoken before Sinai: *And in the first year of the first week of the forty-fifth jubilee Rebecca called Jacob, her son, and commanded him regarding his father and regarding his brother, that he should honour them all the days of his life* (Jubilees 35:1). Jacob answers that this honour is *righteousness before Yahuah (God)* (Jubilees 35:2). It ain''t new — the command was already engraved on the heavenly tablets and would later be cut in stone: *Honour thy father and thy mother: that thy days may be long upon the land which Yahuah Elohayka (the LORD thy God) giveth thee* (Exodus 20:12). And the Genesis source closes exactly where Jubilees points — with Jacob honouring his father to the grave: *And Isaac gave up the ghost, and died, and was gathered unto his people, being old and full of days: and his sons Esau and Jacob buried him* (Genesis 35:29).',
       sv.verse_id, ev.verse_id, 'extras', 53850
  FROM _session251_ju35_lookup sv, _session251_ju35_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=35 AND sv.verse_number=1
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=35 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-35-esau-perverse-from-youth',
       E'Esau''s thoughts are perverse from his youth — he desires to kill',
       E'Rebekah goes in to Isaac and names the danger plainly: *make Esau swear that he will not injure Jacob, nor pursue him with enmity; for you know Esau’s thoughts that they are perverse from his youth, and there is no goodness in him; for he desires after your death to kill him* (Jubilees 35:9). This is no slander — it is the verbatim resolve Genesis records: *And Esau hated Jacob because of the blessing wherewith his father blessed him: and Esau said in his heart, The days of mourning for my father are at hand; then will I slay my brother Jacob* (Genesis 27:41). The enmity runs deeper than two brothers; it was spoken in the womb as the seed-war and the election: *Two nations are in thy womb, and two manner of people shall be separated from thy bowels; and the one people shall be stronger than the other people; and the elder shall serve the younger* (Genesis 25:23).',
       sv.verse_id, ev.verse_id, 'extras', 53853
  FROM _session251_ju35_lookup sv, _session251_ju35_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=35 AND sv.verse_number=9
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=35 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-35-isaac-love-reversed-edom-rooted-out',
       E'Isaac''s love turns to Jacob; Esau''s seed rooted out from under heaven',
       E'Isaac, who once preferred Esau, now reverses his love with open eyes: *I loved Esau formerly more than Jacob, because he was the first-born; but now I love Jacob more than Esau, for he has done manifold evil deeds, and there is no righteousness in him* (Jubilees 35:13). Genesis records the old order Isaac confesses: *And Isaac loved Esau, because he did eat of his venison: but Rebekah loved Jacob* (Genesis 25:28). Then Isaac speaks the verdict of the seed-war over Edom: *neither he nor his seed is to be saved, for they are those who will be destroyed from the earth, and who will be rooted out from under heaven* (Jubilees 35:14). The prophets seal it as Yahuah''s own election and judgement: *Was not Esau Jacob’s brother? saith Yahuah (LORD): yet I loved Jacob* — *And I hated Esau, and laid his mountains and his heritage waste for the dragons of the wilderness* (Malachi 1:2-3), and *For thy violence against thy brother Jacob shame shall cover thee, and thou shalt be cut off for ever* (Obadiah 1:10).',
       sv.verse_id, ev.verse_id, 'extras', 53856
  FROM _session251_ju35_lookup sv, _session251_ju35_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=35 AND sv.verse_number=13
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=35 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-35-love-one-another-not-as-cain',
       E'Love each other, mutual love only — not Cain''s seed-war',
       E'Rebekah''s deathbed petition to Esau is the second great commandment cast as a family oath: *that you and Jacob will love each other, and that neither will desire evil against the other, but mutual love only, and (so) you will prosper, my sons* (Jubilees 35:20). Jacob answers in kind: *I shall be first in naught save in love only* (Jubilees 35:26). This is the heavenly-tablet love-of-neighbour engraved long before Sinai and renewed by Messiah: *Thou shalt not avenge, nor bear any grudge against the children of thy people, but thou shalt love thy neighbour as thyself: I am Yahuah (LORD)* (Leviticus 19:18); *A new commandment I give unto you, That ye love one another; as I have loved you, that ye also love one another* (John 13:34). And the apostle frames the alternative as the very seed-war Esau embodies: *For this is the message that ye heard from the beginning, that we should love one another* (1 John 3:11) — *Whosoever hateth his brother is a murderer: and ye know that no murderer hath eternal life abiding in him* (1 John 3:15). Brotherly love, or Cain''s road. It ain''t new. *Behold, how good and how pleasant it is for brethren to dwell together in unity!* (Psalm 133:1).',
       sv.verse_id, ev.verse_id, 'extras', 53859
  FROM _session251_ju35_lookup sv, _session251_ju35_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=35 AND sv.verse_number=20
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=35 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-35-rebekah-buried-near-sarah',
       E'Bury me near Sarah — Rebekah laid in the double cave',
       E'Rebekah''s one request for her body binds her to the matriarch before her: *I ask you that the day I die, you will take me in and bury me near Sarah, your father’s mother* (Jubilees 35:20), and at her death her sons obey: *her two sons, Esau and Jacob, buried her in the double cave near Sarah, their father’s mother* (Jubilees 35:26). The ''double cave'' is Machpelah, where Abraham first laid Sarah: *And after this, Abraham buried Sarah his wife in the cave of the field of Machpelah before Mamre: the same is Hebron in the land of Canaan* (Genesis 23:19). The same Hebron where the patriarchs sojourned and Isaac would be gathered: *And Jacob came unto Isaac his father unto Mamre, unto the city of Arbah, which is Hebron, where Abraham and Isaac sojourned* (Genesis 35:27).',
       sv.verse_id, ev.verse_id, 'extras', 53862
  FROM _session251_ju35_lookup sv, _session251_ju35_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=35 AND sv.verse_number=18
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=35 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jubilees-35-honour-father-and-brother
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 20:12 — *Honour thy father and thy mother: that thy days may be long upon the land which Yahuah Elohayka (the LORD thy God) giveth thee.* Rebekah''s charge that Jacob honour his father and brother all his days is the fifth commandment, kept by the patriarch generations before Sinai.'
  FROM cross_reference_threads t, cross_references x, _session251_ju35_lookup sv, _session251_ju35_lookup tv
 WHERE t.slug='jubilees-35-honour-father-and-brother'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=35 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 35:29 — *And Isaac gave up the ghost, and died, and was gathered unto his people, being old and full of days: and his sons Esau and Jacob buried him.* Jacob''s vow to honour his parents as righteousness before Yahuah is fulfilled when he and Esau bury their father, the Genesis scene Jubilees retells.'
  FROM cross_reference_threads t, cross_references x, _session251_ju35_lookup sv, _session251_ju35_lookup tv
 WHERE t.slug='jubilees-35-honour-father-and-brother'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=35 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=35 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-35-esau-perverse-from-youth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 27:41 — *And Esau hated Jacob because of the blessing wherewith his father blessed him: and Esau said in his heart, The days of mourning for my father are at hand; then will I slay my brother Jacob.* Rebekah''s fear that Esau desires after Isaac''s death to kill Jacob quotes Esau''s own murderous resolve from Genesis.'
  FROM cross_reference_threads t, cross_references x, _session251_ju35_lookup sv, _session251_ju35_lookup tv
 WHERE t.slug='jubilees-35-esau-perverse-from-youth'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=35 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=27 AND tv.verse_number=41
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 25:23 — *Two nations are in thy womb, and two manner of people shall be separated from thy bowels; and the one people shall be stronger than the other people; and the elder shall serve the younger.* Esau''s enmity from his youth is the womb-prophecy of the two nations and the election in which the elder serves the younger.'
  FROM cross_reference_threads t, cross_references x, _session251_ju35_lookup sv, _session251_ju35_lookup tv
 WHERE t.slug='jubilees-35-esau-perverse-from-youth'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=35 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=25 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-35-isaac-love-reversed-edom-rooted-out
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 25:28 — *And Isaac loved Esau, because he did eat of his venison: but Rebekah loved Jacob.* Isaac''s confession that he formerly loved Esau more than Jacob recalls the divided parental love Genesis records at the brothers'' birth.'
  FROM cross_reference_threads t, cross_references x, _session251_ju35_lookup sv, _session251_ju35_lookup tv
 WHERE t.slug='jubilees-35-isaac-love-reversed-edom-rooted-out'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=35 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=25 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Malachi 1:3 — *And I hated Esau, and laid his mountains and his heritage waste for the dragons of the wilderness.* Isaac''s word that Esau''s seed will be rooted out from under heaven is the same election-and-judgement Yahuah declares over Edom through Malachi.'
  FROM cross_reference_threads t, cross_references x, _session251_ju35_lookup sv, _session251_ju35_lookup tv
 WHERE t.slug='jubilees-35-isaac-love-reversed-edom-rooted-out'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=35 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Obadiah 1:10 — *For thy violence against thy brother Jacob shame shall cover thee, and thou shalt be cut off for ever.* Isaac''s verdict that Esau''s seed will be destroyed from the earth is Obadiah''s sentence on Edom for violence against his brother Jacob.'
  FROM cross_reference_threads t, cross_references x, _session251_ju35_lookup sv, _session251_ju35_lookup tv
 WHERE t.slug='jubilees-35-isaac-love-reversed-edom-rooted-out'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=35 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='obadiah' AND tv.chapter_number=1 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-35-love-one-another-not-as-cain
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 133:1 — *Behold, how good and how pleasant it is for brethren to dwell together in unity!* Rebekah''s plea that Esau and Jacob love each other and prosper is the very brotherly unity David sings as good and pleasant.'
  FROM cross_reference_threads t, cross_references x, _session251_ju35_lookup sv, _session251_ju35_lookup tv
 WHERE t.slug='jubilees-35-love-one-another-not-as-cain'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=35 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=133 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 19:18 — *Thou shalt not avenge, nor bear any grudge against the children of thy people, but thou shalt love thy neighbour as thyself: I am Yahuah (LORD).* Rebekah''s charge of mutual love with no desire for evil is the love-thy-neighbour command, kept by the fathers before it was written at Sinai.'
  FROM cross_reference_threads t, cross_references x, _session251_ju35_lookup sv, _session251_ju35_lookup tv
 WHERE t.slug='jubilees-35-love-one-another-not-as-cain'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=35 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 13:34 — *A new commandment I give unto you, That ye love one another; as I have loved you, that ye also love one another.* Jacob''s vow to be first in nothing save love only is the same love-one-another Messiah renews — old as the patriarchs, ever new.'
  FROM cross_reference_threads t, cross_references x, _session251_ju35_lookup sv, _session251_ju35_lookup tv
 WHERE t.slug='jubilees-35-love-one-another-not-as-cain'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=35 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=13 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 John 3:15 — *Whosoever hateth his brother is a murderer: and ye know that no murderer hath eternal life abiding in him.* Against Jacob''s mutual love stands Esau''s hatred — the apostle names brother-hatred as Cain''s murder, the seed-war Rebekah begged her sons to refuse.'
  FROM cross_reference_threads t, cross_references x, _session251_ju35_lookup sv, _session251_ju35_lookup tv
 WHERE t.slug='jubilees-35-love-one-another-not-as-cain'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=35 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-35-rebekah-buried-near-sarah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 23:19 — *And after this, Abraham buried Sarah his wife in the cave of the field of Machpelah before Mamre: the same is Hebron in the land of Canaan.* Rebekah''s request to be buried near Sarah points to Machpelah, the burying-place Abraham bought when he first laid Sarah there.'
  FROM cross_reference_threads t, cross_references x, _session251_ju35_lookup sv, _session251_ju35_lookup tv
 WHERE t.slug='jubilees-35-rebekah-buried-near-sarah'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=35 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=23 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 35:27 — *And Jacob came unto Isaac his father unto Mamre, unto the city of Arbah, which is Hebron, where Abraham and Isaac sojourned.* The double cave near Sarah where Esau and Jacob bury Rebekah sits at Hebron-Mamre, the patriarchs'' dwelling in the Genesis account Jubilees retells.'
  FROM cross_reference_threads t, cross_references x, _session251_ju35_lookup sv, _session251_ju35_lookup tv
 WHERE t.slug='jubilees-35-rebekah-buried-near-sarah'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=35 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=35 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

