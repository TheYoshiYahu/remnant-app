-- =====================================================================
-- Session 253 — The History of Susanna FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py ../data-schema/migrations/session253_susanna_extracanon_cross_references.sql
-- =====================================================================

\echo 'session253 — The History of Susanna cross-references starting...'
BEGIN;

-- ----- fragment: minion_thehistoryofsusanna_01.sql (session253 the-history-of-susanna 1) -----
-- Source anchor: apocrypha/the-history-of-susanna ch1. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: sus1 (view _session253_sus1_lookup). Sort band base 61100, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_sus1_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: susanna-1-taught-in-the-law
  ('apocrypha', 'the-history-of-susanna', 1, 3, 'canon', 'deuteronomy', 6, 6, 'free', E'Deuteronomy 6:6 — *And these words, which I command thee this day, shall be in thine heart:* the law Susanna''s parents taught her was meant to live in the heart, which is exactly where her resolve is found in 1:3.'),
  ('apocrypha', 'the-history-of-susanna', 1, 3, 'canon', 'deuteronomy', 6, 7, 'free', E'Deuteronomy 6:7 — *And thou shalt teach them diligently unto thy children, and shalt talk of them when thou sittest in thine house, and when thou walkest by the way, and when thou liest down, and when thou risest up.* the diligent teaching of children that Moses commands is precisely what Susanna 1:3 records her righteous parents doing.'),
  ('apocrypha', 'the-history-of-susanna', 1, 3, 'canon', 'psalms', 1, 2, 'free', E'Psalm 1:2 — *But his delight is in the law of Yahuah; and in his law doth he meditate day and night.* the blessed one of the Psalter is the law-delighting soul, the very mould in which Susanna 1:3 says she was formed.'),
  -- thread: susanna-1-elders-eyes-from-heaven
  ('apocrypha', 'the-history-of-susanna', 1, 9, 'canon', 'proverbs', 6, 25, 'free', E'Proverbs 6:25 — *Lust not after her beauty in thine heart; neither let her take thee with her eyelids.* the wisdom-warning against being captured by beauty is the exact snare the elders fall into when their lust was inflamed in 1:8-9.'),
  ('apocrypha', 'the-history-of-susanna', 1, 9, 'canon', 'job', 31, 1, 'free', E'Job 31:1 — *I made a covenant with mine eyes; why then should I think upon a maid?* Job''s vow to guard the eyes is the righteous opposite of the elders who in 1:9 deliberately turned their eyes away from heaven.'),
  ('apocrypha', 'the-history-of-susanna', 1, 9, 'canon', 'matthew', 5, 28, 'free', E'Matthew 5:28 — *But I say unto you, That whosoever looketh on a woman to lust after her hath committed adultery with her already in his heart.* the Master traces adultery back to the lustful look, which is where Susanna 1:9 already locates the elders'' guilt before any deed.'),
  -- thread: susanna-1-better-to-fall-than-sin
  ('apocrypha', 'the-history-of-susanna', 1, 23, 'canon', 'genesis', 39, 9, 'free', E'Genesis 39:9 — *There is none greater in this house than I; neither hath he kept back any thing from me but thee, because thou art his wife: how then can I do this great wickedness, and sin against Elohim?* Joseph''s refusal to sin against Elohim is the same conscience that speaks in Susanna 1:23, the fear of Yahuah outweighing the fear of death.'),
  ('apocrypha', 'the-history-of-susanna', 1, 22, 'apocrypha', 'the-wisdom-of-solomon', 2, 19, 'extras', E'Wisdom of Solomon 2:19 — *Let us examine him with despitefulness and torture, that we may know his meekness, and prove his patience.* the ungodly resolve to test the just man''s endurance is the very strait in which Susanna is set on every side in 1:22.'),
  ('apocrypha', 'the-history-of-susanna', 1, 23, 'apocrypha', 'the-wisdom-of-solomon', 2, 20, 'extras', E'Wisdom of Solomon 2:20 — *Let us condemn him with a shameful death: for by his own saying he shall be respected.* the shameful death plotted against the righteous in Wisdom is the death Susanna accepts rather than sin in 1:23.'),
  -- thread: susanna-1-false-witness
  ('apocrypha', 'the-history-of-susanna', 1, 43, 'canon', 'exodus', 20, 16, 'free', E'Exodus 20:16 — *Thou shalt not bear false witness against thy neighbour.* the ninth commandment is the very law the elders break against Susanna in 1:43.'),
  ('apocrypha', 'the-history-of-susanna', 1, 21, 'canon', 'exodus', 23, 1, 'free', E'Exodus 23:1 — *Thou shalt not raise a false report: put not thine hand with the wicked to be an unrighteous witness.* the statute against the unrighteous witness names exactly the false report the elders threaten in 1:21.'),
  ('apocrypha', 'the-history-of-susanna', 1, 43, 'canon', 'psalms', 27, 12, 'free', E'Psalm 27:12 — *Deliver me not over unto the will of mine enemies: for false witnesses are risen up against me, and such as breathe out cruelty.* the Psalmist''s plea against risen false witnesses is the cry Susanna lifts in 1:43 as she is condemned.'),
  ('apocrypha', 'the-history-of-susanna', 1, 21, 'canon', 'proverbs', 21, 28, 'free', E'Proverbs 21:28 — *A false witness shall perish: but the man that heareth speaketh constantly.* wisdom''s verdict that the false witness perishes is fulfilled upon the elders whose threatened lie begins in 1:21.'),
  -- thread: susanna-1-she-trusted-in-yahuah
  ('apocrypha', 'the-history-of-susanna', 1, 35, 'canon', 'psalms', 37, 32, 'free', E'Psalm 37:32 — *The wicked watcheth the righteous, and seeketh to slay him.* the wicked who watch to slay the righteous are the two elders who watched Susanna from day to day, against whom she lifts her eyes in 1:35.'),
  ('apocrypha', 'the-history-of-susanna', 1, 35, 'canon', 'psalms', 37, 33, 'free', E'Psalm 37:33 — *Yahuah will not leave him in his hand, nor condemn him when he is judged.* the promise that Yahuah will not leave the righteous condemned is the ground of the trust Susanna shows when she looks to heaven in 1:35.'),
  ('apocrypha', 'the-history-of-susanna', 1, 42, 'canon', '2-peter', 2, 9, 'free', E'2 Peter 2:9 — *Yahuah knoweth how to deliver the godly out of temptations, and to reserve the unjust unto the day of judgment to be punished:* the Lord who delivers the godly and reserves the unjust is the everlasting Judge that knoweth secrets to whom Susanna prays in 1:42.'),
  -- thread: susanna-1-daniel-vindicates-innocent
  ('apocrypha', 'the-history-of-susanna', 1, 53, 'canon', 'exodus', 23, 7, 'free', E'Exodus 23:7 — *Keep thee far from a false matter; and the innocent and righteous slay thou not: for I will not justify the wicked.* Daniel quotes this very statute in 1:53, naming the false matter and the innocent that the corrupt judges were about to slay.'),
  ('apocrypha', 'the-history-of-susanna', 1, 62, 'canon', 'deuteronomy', 19, 19, 'free', E'Deuteronomy 19:19 — *Then shall ye do unto him, as he had thought to have done unto his brother: so shalt thou put the evil away from among you.* the lex talionis for false witnesses is the law of Moses by which the elders are repaid in kind in 1:62.'),
  ('apocrypha', 'the-history-of-susanna', 1, 45, 'canon', 'psalms', 37, 33, 'free', E'Psalm 37:33 — *Yahuah will not leave him in his hand, nor condemn him when he is judged.* the promise that Yahuah will not let the righteous be condemned is made good when He raises up Daniel''s spirit to deliver Susanna in 1:45.'),
  -- thread: susanna-1-righteous-falsely-condemned-passion
  ('apocrypha', 'the-history-of-susanna', 1, 43, 'apocrypha', 'the-wisdom-of-solomon', 2, 20, 'extras', E'Wisdom of Solomon 2:20 — *Let us condemn him with a shameful death: for by his own saying he shall be respected.* the Apocrypha''s own portrait of the righteous condemned to a shameful death is the frame in which Susanna 1:43 declares she must die innocent.'),
  ('apocrypha', 'the-history-of-susanna', 1, 43, 'canon', 'matthew', 27, 43, 'free', E'Matthew 27:43 — *He trusted in Elohim; let him deliver him now, if he will have him: for he said, I am the Son of Elohim.* the mockery hurled at the crucified Righteous answers the false condemnation Susanna endures in 1:43, both vindicated by the Father who delivers.'),
  ('apocrypha', 'the-history-of-susanna', 1, 42, 'canon', 'isaiah', 53, 9, 'free', E'Isaiah 53:9 — *And he made his grave with the wicked, and with the rich in his death; because he had done no violence, neither was any deceit in his mouth.* the Servant condemned without violence or deceit is the pattern of the innocent Susanna who in 1:42 calls on the Judge that knoweth all secrets.'),
  ('apocrypha', 'the-history-of-susanna', 1, 42, 'canon', '2-peter', 2, 9, 'free', E'2 Peter 2:9 — *Yahuah knoweth how to deliver the godly out of temptations, and to reserve the unjust unto the day of judgment to be punished:* the Lord who delivers the godly and judges the unjust is the everlasting Judge of secrets whom Susanna invokes in 1:42 and who vindicates her that same day.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_sus1_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_sus1_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'susanna-1-taught-in-the-law',
       E'Taught according to the law of Moses',
       E'Before ever the trial comes, the source of Susanna''s standing is named: *Her parents also were righteous, and taught their daughter according to the law of Moses* (Susanna 1:3). Her courage in the garden is no accident of temperament — it was catechised into her from childhood, the Torah written on the heart, *And these words, which I command thee this day, shall be in thine heart* (Deuteronomy 6:6), *And thou shalt teach them diligently unto thy children... when thou sittest in thine house, and when thou walkest by the way* (Deuteronomy 6:7). This is the blessed life of Psalm 1, the one whose root holds in the drought: *Blessed is the man that walketh not in the counsel of the ungodly, nor standeth in the way of sinners* (Psalm 1:1), *But his delight is in the law of Yahuah; and in his law doth he meditate day and night* (Psalm 1:2). The Torah-faithful household is the seedbed of the righteous who will not bend. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 61100
  FROM _session253_sus1_lookup sv, _session253_sus1_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-history-of-susanna' AND sv.chapter_number=1 AND sv.verse_number=3
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-history-of-susanna' AND ev.chapter_number=1 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'susanna-1-elders-eyes-from-heaven',
       E'They turned away their eyes from heaven',
       E'The corruption of the judges is diagnosed at its root: *And they perverted their own mind, and turned away their eyes, that they might not look to heaven, nor remember just judgments* (Susanna 1:9). Lust is here a deliberate refusal to look up — a self-blinding. The Torah had already located adultery''s seed in the eye and the heart: *Lust not after her beauty in thine heart; neither let her take thee with her eyelids* (Proverbs 6:25). Job had made the opposite covenant with the eyes the elders unmade: *I made a covenant with mine eyes; why then should I think upon a maid?* (Job 31:1). And the Master reaches behind the deed to the look itself: *But I say unto you, That whosoever looketh on a woman to lust after her hath committed adultery with her already in his heart* (Matthew 5:28). The elders had committed their sin long before the garden; they only awaited their chance.',
       sv.verse_id, ev.verse_id, 'extras', 61103
  FROM _session253_sus1_lookup sv, _session253_sus1_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-history-of-susanna' AND sv.chapter_number=1 AND sv.verse_number=8
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-history-of-susanna' AND ev.chapter_number=1 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'susanna-1-better-to-fall-than-sin',
       E'Better to fall into your hands than to sin',
       E'Cornered, threatened with a lie that means death either way, Susanna chooses death over sin: *Then Susanna sighed, and said, I am straitened on every side: for if I do this thing, it is death to me: and if I do it not I cannot escape your hands* (Susanna 1:22), *It is better for me to fall into your hands, and not do it, than to sin in the sight of Yahuah* (Susanna 1:23). This is Joseph''s word over again, the slave who fled rather than betray his master and his Elohim: *There is none greater in this house than I... how then can I do this great wickedness, and sin against Elohim?* (Genesis 39:9). And it is the suffering-righteous of the Apocrypha''s own Wisdom, the just man the ungodly resolve to break: *Let us examine him with despitefulness and torture, that we may know his meekness, and prove his patience* (Wisdom of Solomon 2:19), *Let us condemn him with a shameful death: for by his own saying he shall be respected* (Wisdom of Solomon 2:20). The covenant-keeper would rather die clean than live defiled. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 61106
  FROM _session253_sus1_lookup sv, _session253_sus1_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-history-of-susanna' AND sv.chapter_number=1 AND sv.verse_number=22
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-history-of-susanna' AND ev.chapter_number=1 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'susanna-1-false-witness',
       E'False witness against the innocent',
       E'The whole machinery of the elders is the sin Sinai forbade by name: they bear false witness to a capital charge. *If you will not, we will bear witness against you, that a young man was with you* (Susanna 1:21); and again *You know that they have borne false witness against me* (Susanna 1:43). Against this stands the ninth word: *Thou shalt not bear false witness against thy neighbour* (Exodus 20:16), and the statute that guards the court itself: *Thou shalt not raise a false report: put not thine hand with the wicked to be an unrighteous witness* (Exodus 23:1). The Psalmist''s cry under the same assault is Susanna''s prayer before it is answered: *Deliver me not over unto the will of mine enemies: for false witnesses are risen up against me, and such as breathe out cruelty* (Psalm 27:12). And wisdom pronounces the sentence the chapter will execute: *A false witness shall perish: but the man that heareth speaketh constantly* (Proverbs 21:28).',
       sv.verse_id, ev.verse_id, 'extras', 61109
  FROM _session253_sus1_lookup sv, _session253_sus1_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-history-of-susanna' AND sv.chapter_number=1 AND sv.verse_number=21
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-history-of-susanna' AND ev.chapter_number=1 AND ev.verse_number=43
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'susanna-1-she-trusted-in-yahuah',
       E'Her heart trusted in Yahuah',
       E'Condemned and led toward death, Susanna does not curse but commits herself to the Judge who sees in secret: *And she weeping looked up toward heaven: for her heart trusted in Yahuah* (Susanna 1:35), and she prays *O everlasting Yahuah, that knowest the secrets, and knowest all things before they be* (Susanna 1:42). This is the wicked-watch-the-righteous pattern, and its promised deliverance: *The wicked watcheth the righteous, and seeketh to slay him* (Psalm 37:32) — the elders watching her every day in 1:8 — *Yahuah will not leave him in his hand, nor condemn him when he is judged* (Psalm 37:33). It is the Apocrypha''s own confidence that *Yahuah knoweth how to deliver the godly out of temptations, and to reserve the unjust unto the day of judgment to be punished* (2 Peter 2:9). She looks up where the elders refused to look; the eyes turned heavenward are heard.',
       sv.verse_id, ev.verse_id, 'extras', 61112
  FROM _session253_sus1_lookup sv, _session253_sus1_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-history-of-susanna' AND sv.chapter_number=1 AND sv.verse_number=35
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-history-of-susanna' AND ev.chapter_number=1 AND ev.verse_number=42
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'susanna-1-daniel-vindicates-innocent',
       E'Daniel: the innocent and righteous shall you not slay',
       E'Yahuah answers by a raised-up spirit: *Yahuah raised up the holy spirit of a young youth whose name was Daniel* (Susanna 1:45). Daniel separates the witnesses and the lie unravels, charging the judge: *For you have pronounced false judgment and have condemned the innocent and have let the guilty go free; albeit Yahuah says, The innocent and righteous shall you not slay* (Susanna 1:53) — a direct citation of the Torah''s own court-law, *Keep thee far from a false matter; and the innocent and righteous slay thou not: for I will not justify the wicked* (Exodus 23:7). Then the lex talionis falls on the false witnesses exactly as Moses commanded: *And according to the law of Moses they did to them in such sort as they maliciously intended to do to their neighbour* (Susanna 1:62) — *Then shall ye do unto him, as he had thought to have done unto his brother: so shalt thou put the evil away from among you* (Deuteronomy 19:19). The innocent blood is saved; the false witness perishes by his own measure. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 61115
  FROM _session253_sus1_lookup sv, _session253_sus1_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-history-of-susanna' AND sv.chapter_number=1 AND sv.verse_number=45
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-history-of-susanna' AND ev.chapter_number=1 AND ev.verse_number=62
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'susanna-1-righteous-falsely-condemned-passion',
       E'The righteous falsely condemned — a Passion sibling',
       E'Susanna led to death on a lie, who trusts Yahuah to deliver and is vindicated, is a sister of the suffering Servant. *And she weeping looked up toward heaven: for her heart trusted in Yahuah* (Susanna 1:35); *You know that they have borne false witness against me, and, behold, I must die; whereas I never did such things as these men have maliciously invented against me* (Susanna 1:43). Hear Wisdom''s prophecy of the just man the ungodly hate: *Let us condemn him with a shameful death: for by his own saying he shall be respected* (Wisdom of Solomon 2:20), and its fulfilment at the cross, *He trusted in Elohim; let him deliver him now, if he will have him: for he said, I am the Son of Elohim* (Matthew 27:43). The Servant of Isaiah stands silent under false judgment as Susanna stands accused: *He was taken from prison and from judgment... because he had done no violence, neither was any deceit in his mouth* (Isaiah 53:8-9). Susanna is delivered the same day; the greater Righteous is delivered on the third — and both are saved because *Yahuah knoweth how to deliver the godly* (2 Peter 2:9). Not a new mercy; the same covenant faithfulness, foreshadowed.',
       sv.verse_id, ev.verse_id, 'extras', 61118
  FROM _session253_sus1_lookup sv, _session253_sus1_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-history-of-susanna' AND sv.chapter_number=1 AND sv.verse_number=42
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-history-of-susanna' AND ev.chapter_number=1 AND ev.verse_number=43
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: susanna-1-taught-in-the-law
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 6:6 — *And these words, which I command thee this day, shall be in thine heart:* the law Susanna''s parents taught her was meant to live in the heart, which is exactly where her resolve is found in 1:3.'
  FROM cross_reference_threads t, cross_references x, _session253_sus1_lookup sv, _session253_sus1_lookup tv
 WHERE t.slug='susanna-1-taught-in-the-law'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-history-of-susanna' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 6:7 — *And thou shalt teach them diligently unto thy children, and shalt talk of them when thou sittest in thine house, and when thou walkest by the way, and when thou liest down, and when thou risest up.* the diligent teaching of children that Moses commands is precisely what Susanna 1:3 records her righteous parents doing.'
  FROM cross_reference_threads t, cross_references x, _session253_sus1_lookup sv, _session253_sus1_lookup tv
 WHERE t.slug='susanna-1-taught-in-the-law'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-history-of-susanna' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 1:2 — *But his delight is in the law of Yahuah; and in his law doth he meditate day and night.* the blessed one of the Psalter is the law-delighting soul, the very mould in which Susanna 1:3 says she was formed.'
  FROM cross_reference_threads t, cross_references x, _session253_sus1_lookup sv, _session253_sus1_lookup tv
 WHERE t.slug='susanna-1-taught-in-the-law'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-history-of-susanna' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=1 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: susanna-1-elders-eyes-from-heaven
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 6:25 — *Lust not after her beauty in thine heart; neither let her take thee with her eyelids.* the wisdom-warning against being captured by beauty is the exact snare the elders fall into when their lust was inflamed in 1:8-9.'
  FROM cross_reference_threads t, cross_references x, _session253_sus1_lookup sv, _session253_sus1_lookup tv
 WHERE t.slug='susanna-1-elders-eyes-from-heaven'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-history-of-susanna' AND sv.chapter_number=1 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=6 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Job 31:1 — *I made a covenant with mine eyes; why then should I think upon a maid?* Job''s vow to guard the eyes is the righteous opposite of the elders who in 1:9 deliberately turned their eyes away from heaven.'
  FROM cross_reference_threads t, cross_references x, _session253_sus1_lookup sv, _session253_sus1_lookup tv
 WHERE t.slug='susanna-1-elders-eyes-from-heaven'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-history-of-susanna' AND sv.chapter_number=1 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=31 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 5:28 — *But I say unto you, That whosoever looketh on a woman to lust after her hath committed adultery with her already in his heart.* the Master traces adultery back to the lustful look, which is where Susanna 1:9 already locates the elders'' guilt before any deed.'
  FROM cross_reference_threads t, cross_references x, _session253_sus1_lookup sv, _session253_sus1_lookup tv
 WHERE t.slug='susanna-1-elders-eyes-from-heaven'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-history-of-susanna' AND sv.chapter_number=1 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: susanna-1-better-to-fall-than-sin
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 39:9 — *There is none greater in this house than I; neither hath he kept back any thing from me but thee, because thou art his wife: how then can I do this great wickedness, and sin against Elohim?* Joseph''s refusal to sin against Elohim is the same conscience that speaks in Susanna 1:23, the fear of Yahuah outweighing the fear of death.'
  FROM cross_reference_threads t, cross_references x, _session253_sus1_lookup sv, _session253_sus1_lookup tv
 WHERE t.slug='susanna-1-better-to-fall-than-sin'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-history-of-susanna' AND sv.chapter_number=1 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=39 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Wisdom of Solomon 2:19 — *Let us examine him with despitefulness and torture, that we may know his meekness, and prove his patience.* the ungodly resolve to test the just man''s endurance is the very strait in which Susanna is set on every side in 1:22.'
  FROM cross_reference_threads t, cross_references x, _session253_sus1_lookup sv, _session253_sus1_lookup tv
 WHERE t.slug='susanna-1-better-to-fall-than-sin'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-history-of-susanna' AND sv.chapter_number=1 AND sv.verse_number=22
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=2 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Wisdom of Solomon 2:20 — *Let us condemn him with a shameful death: for by his own saying he shall be respected.* the shameful death plotted against the righteous in Wisdom is the death Susanna accepts rather than sin in 1:23.'
  FROM cross_reference_threads t, cross_references x, _session253_sus1_lookup sv, _session253_sus1_lookup tv
 WHERE t.slug='susanna-1-better-to-fall-than-sin'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-history-of-susanna' AND sv.chapter_number=1 AND sv.verse_number=23
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=2 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: susanna-1-false-witness
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 20:16 — *Thou shalt not bear false witness against thy neighbour.* the ninth commandment is the very law the elders break against Susanna in 1:43.'
  FROM cross_reference_threads t, cross_references x, _session253_sus1_lookup sv, _session253_sus1_lookup tv
 WHERE t.slug='susanna-1-false-witness'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-history-of-susanna' AND sv.chapter_number=1 AND sv.verse_number=43
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 23:1 — *Thou shalt not raise a false report: put not thine hand with the wicked to be an unrighteous witness.* the statute against the unrighteous witness names exactly the false report the elders threaten in 1:21.'
  FROM cross_reference_threads t, cross_references x, _session253_sus1_lookup sv, _session253_sus1_lookup tv
 WHERE t.slug='susanna-1-false-witness'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-history-of-susanna' AND sv.chapter_number=1 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=23 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 27:12 — *Deliver me not over unto the will of mine enemies: for false witnesses are risen up against me, and such as breathe out cruelty.* the Psalmist''s plea against risen false witnesses is the cry Susanna lifts in 1:43 as she is condemned.'
  FROM cross_reference_threads t, cross_references x, _session253_sus1_lookup sv, _session253_sus1_lookup tv
 WHERE t.slug='susanna-1-false-witness'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-history-of-susanna' AND sv.chapter_number=1 AND sv.verse_number=43
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=27 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 21:28 — *A false witness shall perish: but the man that heareth speaketh constantly.* wisdom''s verdict that the false witness perishes is fulfilled upon the elders whose threatened lie begins in 1:21.'
  FROM cross_reference_threads t, cross_references x, _session253_sus1_lookup sv, _session253_sus1_lookup tv
 WHERE t.slug='susanna-1-false-witness'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-history-of-susanna' AND sv.chapter_number=1 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=21 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: susanna-1-she-trusted-in-yahuah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 37:32 — *The wicked watcheth the righteous, and seeketh to slay him.* the wicked who watch to slay the righteous are the two elders who watched Susanna from day to day, against whom she lifts her eyes in 1:35.'
  FROM cross_reference_threads t, cross_references x, _session253_sus1_lookup sv, _session253_sus1_lookup tv
 WHERE t.slug='susanna-1-she-trusted-in-yahuah'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-history-of-susanna' AND sv.chapter_number=1 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=37 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 37:33 — *Yahuah will not leave him in his hand, nor condemn him when he is judged.* the promise that Yahuah will not leave the righteous condemned is the ground of the trust Susanna shows when she looks to heaven in 1:35.'
  FROM cross_reference_threads t, cross_references x, _session253_sus1_lookup sv, _session253_sus1_lookup tv
 WHERE t.slug='susanna-1-she-trusted-in-yahuah'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-history-of-susanna' AND sv.chapter_number=1 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=37 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Peter 2:9 — *Yahuah knoweth how to deliver the godly out of temptations, and to reserve the unjust unto the day of judgment to be punished:* the Lord who delivers the godly and reserves the unjust is the everlasting Judge that knoweth secrets to whom Susanna prays in 1:42.'
  FROM cross_reference_threads t, cross_references x, _session253_sus1_lookup sv, _session253_sus1_lookup tv
 WHERE t.slug='susanna-1-she-trusted-in-yahuah'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-history-of-susanna' AND sv.chapter_number=1 AND sv.verse_number=42
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: susanna-1-daniel-vindicates-innocent
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 23:7 — *Keep thee far from a false matter; and the innocent and righteous slay thou not: for I will not justify the wicked.* Daniel quotes this very statute in 1:53, naming the false matter and the innocent that the corrupt judges were about to slay.'
  FROM cross_reference_threads t, cross_references x, _session253_sus1_lookup sv, _session253_sus1_lookup tv
 WHERE t.slug='susanna-1-daniel-vindicates-innocent'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-history-of-susanna' AND sv.chapter_number=1 AND sv.verse_number=53
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=23 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 19:19 — *Then shall ye do unto him, as he had thought to have done unto his brother: so shalt thou put the evil away from among you.* the lex talionis for false witnesses is the law of Moses by which the elders are repaid in kind in 1:62.'
  FROM cross_reference_threads t, cross_references x, _session253_sus1_lookup sv, _session253_sus1_lookup tv
 WHERE t.slug='susanna-1-daniel-vindicates-innocent'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-history-of-susanna' AND sv.chapter_number=1 AND sv.verse_number=62
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=19 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 37:33 — *Yahuah will not leave him in his hand, nor condemn him when he is judged.* the promise that Yahuah will not let the righteous be condemned is made good when He raises up Daniel''s spirit to deliver Susanna in 1:45.'
  FROM cross_reference_threads t, cross_references x, _session253_sus1_lookup sv, _session253_sus1_lookup tv
 WHERE t.slug='susanna-1-daniel-vindicates-innocent'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-history-of-susanna' AND sv.chapter_number=1 AND sv.verse_number=45
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=37 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: susanna-1-righteous-falsely-condemned-passion
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Wisdom of Solomon 2:20 — *Let us condemn him with a shameful death: for by his own saying he shall be respected.* the Apocrypha''s own portrait of the righteous condemned to a shameful death is the frame in which Susanna 1:43 declares she must die innocent.'
  FROM cross_reference_threads t, cross_references x, _session253_sus1_lookup sv, _session253_sus1_lookup tv
 WHERE t.slug='susanna-1-righteous-falsely-condemned-passion'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-history-of-susanna' AND sv.chapter_number=1 AND sv.verse_number=43
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=2 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 27:43 — *He trusted in Elohim; let him deliver him now, if he will have him: for he said, I am the Son of Elohim.* the mockery hurled at the crucified Righteous answers the false condemnation Susanna endures in 1:43, both vindicated by the Father who delivers.'
  FROM cross_reference_threads t, cross_references x, _session253_sus1_lookup sv, _session253_sus1_lookup tv
 WHERE t.slug='susanna-1-righteous-falsely-condemned-passion'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-history-of-susanna' AND sv.chapter_number=1 AND sv.verse_number=43
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=27 AND tv.verse_number=43
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 53:9 — *And he made his grave with the wicked, and with the rich in his death; because he had done no violence, neither was any deceit in his mouth.* the Servant condemned without violence or deceit is the pattern of the innocent Susanna who in 1:42 calls on the Judge that knoweth all secrets.'
  FROM cross_reference_threads t, cross_references x, _session253_sus1_lookup sv, _session253_sus1_lookup tv
 WHERE t.slug='susanna-1-righteous-falsely-condemned-passion'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-history-of-susanna' AND sv.chapter_number=1 AND sv.verse_number=42
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Peter 2:9 — *Yahuah knoweth how to deliver the godly out of temptations, and to reserve the unjust unto the day of judgment to be punished:* the Lord who delivers the godly and judges the unjust is the everlasting Judge of secrets whom Susanna invokes in 1:42 and who vindicates her that same day.'
  FROM cross_reference_threads t, cross_references x, _session253_sus1_lookup sv, _session253_sus1_lookup tv
 WHERE t.slug='susanna-1-righteous-falsely-condemned-passion'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-history-of-susanna' AND sv.chapter_number=1 AND sv.verse_number=42
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session253 — The History of Susanna cross-references complete.'
