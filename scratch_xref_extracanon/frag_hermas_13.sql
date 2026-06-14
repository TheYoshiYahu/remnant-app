-- ----- fragment: minion_hermas_13.sql (session253 hermas 13) -----
-- Source anchor: lightfoot-apostolic-fathers/hermas ch13. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: herm13 (view _session253_herm13_lookup). Sort band base 71800, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_herm13_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: hermas-13-twofold-temperance-two-ways
  ('lightfoot-apostolic-fathers', 'hermas', 13, 1, 'canon', 'psalms', 34, 14, 'free', E'Psalm 34:14 — *Depart from evil, and do good; seek peace, and pursue it.* The Shepherd''s twofold temperance — abstain from the evil, do the good — is David''s own two-way path of the righteous, word for word.'),
  ('lightfoot-apostolic-fathers', 'hermas', 13, 1, 'canon', 'amos', 5, 15, 'free', E'Amos 5:15 — *Hate the evil, and love the good, and establish judgment in the gate: it may be that Yahuah Elohim (the LORD God) of hosts will be gracious unto the remnant of Joseph.* Refrain from wickedness and do righteousness is the prophet''s own summons to the remnant — it ain''t new.'),
  ('lightfoot-apostolic-fathers', 'hermas', 13, 1, 'canon', 'amos', 5, 14, 'free', E'Amos 5:14 — *Seek good, and not evil, that ye may live: and so Yahuah (LORD), the Elohim (God) of hosts, shall be with you, as ye have spoken.* The Shepherd binds the doing of good to life unto Elohim, just as Amos binds seeking good to living.'),
  ('lightfoot-apostolic-fathers', 'hermas', 13, 1, 'canon', 'romans', 12, 9, 'free', E'Romans 12:9 — *Let love be without dissimulation. Abhor that which is evil; cleave to that which is good.* Sha''ul folds the two ways into one charge — hate the evil, hold to the good — the very twofold temperance the Shepherd commands.'),
  -- thread: hermas-13-abstain-from-wickedness
  ('lightfoot-apostolic-fathers', 'hermas', 13, 1, 'canon', 'isaiah', 1, 16, 'free', E'Isaiah 1:16 — *Wash you, make you clean; put away the evil of your doings from before mine eyes; cease to do evil;* the Shepherd''s call to be temperate as to evil and abstain from it is the prophet''s own cease-to-do-evil, spoken to a people he would cleanse.'),
  ('lightfoot-apostolic-fathers', 'hermas', 13, 1, 'canon', '1-thessalonians', 5, 22, 'free', E'1 Thessalonians 5:22 — *Abstain from all appearance of evil.* The whole charge to refrain from every wickedness is Sha''ul''s plain word to the children of the day, gathered into one line.'),
  ('lightfoot-apostolic-fathers', 'hermas', 13, 1, 'canon', '1-thessalonians', 5, 21, 'free', E'1 Thessalonians 5:21 — *Prove all things; hold fast that which is good.* Before bidding the faithful flee evil, Sha''ul bids them weigh and cleave to the good — the same twofold discernment the Shepherd teaches.'),
  -- thread: hermas-13-works-of-the-good
  ('lightfoot-apostolic-fathers', 'hermas', 13, 1, 'canon', 'isaiah', 1, 17, 'free', E'Isaiah 1:17 — *Learn to do well; seek judgment, relieve the oppressed, judge the fatherless, plead for the widow.* The Shepherd''s works of the good — righteousness, mercy, doing well — are the prophet''s own learn-to-do-well, the godly deeds that follow the washing clean.'),
  ('lightfoot-apostolic-fathers', 'hermas', 13, 1, 'canon', 'romans', 12, 12, 'free', E'Romans 12:12 — *Rejoicing in hope; patient in tribulation; continuing instant in prayer;* the patience and steadfast goodness the Shepherd lists among the works of the good are Sha''ul''s own marks of the living sacrifice.'),
  ('lightfoot-apostolic-fathers', 'hermas', 13, 1, 'canon', 'james', 1, 25, 'free', E'James 1:25 — *But whoso looketh into the perfect law of liberty, and continueth therein, he being not a forgetful hearer, but a doer of the work, this man shall be blessed in his deed.* The Shepherd''s promise that the one who keeps the good becomes blessed in his life is the doer''s blessing James pronounces over the keeper of the perfect law.'),
  -- thread: hermas-13-minister-to-widows-orphans
  ('lightfoot-apostolic-fathers', 'hermas', 13, 1, 'canon', 'james', 1, 27, 'free', E'James 1:27 — *Pure religion and undefiled before Elohim (God) and the Father is this, To visit the fatherless and widows in their affliction, and to keep himself unspotted from the world.* The Shepherd''s ministering to widows and visiting the orphans, while abstaining from all wickedness, is the very pure-and-undefiled religion James defines.'),
  ('lightfoot-apostolic-fathers', 'hermas', 13, 1, 'canon', 'romans', 12, 13, 'free', E'Romans 12:13 — *Distributing to the necessity of saints; given to hospitality.* The Shepherd''s charge to relieve the needy and to be hospitable is Sha''ul''s own word to the body of Messiah — the good works that build up the saints.'),
  ('lightfoot-apostolic-fathers', 'hermas', 13, 1, 'canon', 'romans', 12, 10, 'free', E'Romans 12:10 — *Be kindly affectioned one to another with brotherly love; in honour preferring one another;* the brotherly feeling, the reverence for the aged, and the bearing of no grudge that the Shepherd commends are Sha''ul''s own brotherly love that prefers another before self.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_herm13_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_herm13_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-13-twofold-temperance-two-ways',
       E'Refrain from evil, do the good — the two ways',
       E'The Shepherd opens Mandate Eight: *‘Be temperate as to what is evil, and do it not; but be not temperate as to what is good, but do it... Be temperate therefore in abstaining from all wickedness, and do that which is good.’* (Hermas 13:1) It ain''t new — this is the ancient two-fold path of the righteous, set down by David himself: *Depart from evil, and do good; seek peace, and pursue it.* (Psalm 34:14) Amos preaches the same turning to the house of Yashar''el: *Hate the evil, and love the good, and establish judgment in the gate* (Amos 5:15), and *Seek good, and not evil, that ye may live* (Amos 5:14). Sha''ul gathers the whole counsel into one breath: *Abhor that which is evil; cleave to that which is good* (Romans 12:9), and *overcome evil with good* (Romans 12:21). The two ways the Shepherd lays out are the old, well-worn path of the covenant.',
       sv.verse_id, ev.verse_id, 'extras', 71800
  FROM _session253_herm13_lookup sv, _session253_herm13_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=13 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=13 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-13-abstain-from-wickedness',
       E'Abstain from all wickedness — the works the servant must refuse',
       E'The Shepherd names the evils from which the servant of Elohim must be temperate: *‘from adultery and fornication, from the lawlessness of drunkenness, from wicked luxury... and vaunting and haughtiness and pride, and from falsehood and evil-speaking and hypocrisy, malice and all blasphemy.’* (Hermas 13:1) It ain''t new — this is the catalog the prophets and apostles already kept. Yeshayahu cries to a guilty people, *Wash you, make you clean; put away the evil of your doings from before mine eyes; cease to do evil* (Isaiah 1:16). Sha''ul lays the same standing charge upon the watchful, *Abstain from all appearance of evil* (1 Thessalonians 5:22), having first said, *Prove all things; hold fast that which is good* (1 Thessalonians 5:21). The list of wickedness is no new severity but the old refusal of the faithful.',
       sv.verse_id, ev.verse_id, 'extras', 71803
  FROM _session253_herm13_lookup sv, _session253_herm13_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=13 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=13 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-13-works-of-the-good',
       E'The works of the good — faith, fear of Yahuah, love, truth, patience',
       E'Then the Shepherd turns to the good in which no restraint is to be shown but only doing: *‘First of all, there is faith, fear of Yahuah (Lord), love, concord, words of righteousness, truth, patience; nothing is better than these in the life of men. If a man keep these... he becomes blessed in his life.’* (Hermas 13:1) It ain''t new — this is the prophet''s lesson and the apostle''s litany. Yeshayahu: *Learn to do well; seek judgment, relieve the oppressed, judge the fatherless, plead for the widow* (Isaiah 1:17). Sha''ul names the same virtues for the renewed mind, *Rejoicing in hope; patient in tribulation; continuing instant in prayer* (Romans 12:12), and the love that crowns them, *Let love be without dissimulation* (Romans 12:9). The works of the good are the doer''s blessing James proclaims: *but a doer of the work, this man shall be blessed in his deed* (James 1:25). The good path is the old path.',
       sv.verse_id, ev.verse_id, 'extras', 71806
  FROM _session253_herm13_lookup sv, _session253_herm13_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=13 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=13 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-13-minister-to-widows-orphans',
       E'Minister to widows, visit the orphans and the needy — pure religion',
       E'The Shepherd makes the good concrete: *‘to minister to widows, to visit the orphans and the needy, to ransom the servants of Elohim (God) from their afflictions, to be hospitable... to reverence the aged, to practise righteousness, to observe brotherly feeling, to endure injury, to be long-suffering, to bear no grudge.’* (Hermas 13:1) It ain''t new — this is the very heart of pure religion James names: *Pure religion and undefiled before Elohim (God) and the Father is this, To visit the fatherless and widows in their affliction, and to keep himself unspotted from the world* (James 1:27). Sha''ul bids the saints the same, *Distributing to the necessity of saints; given to hospitality* (Romans 12:13), and *Be kindly affectioned one to another with brotherly love; in honour preferring one another* (Romans 12:10). The mercy to the widow and orphan is the standing demand of the covenant, doing the good unto life.',
       sv.verse_id, ev.verse_id, 'extras', 71809
  FROM _session253_herm13_lookup sv, _session253_herm13_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=13 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=13 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: hermas-13-twofold-temperance-two-ways
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 34:14 — *Depart from evil, and do good; seek peace, and pursue it.* The Shepherd''s twofold temperance — abstain from the evil, do the good — is David''s own two-way path of the righteous, word for word.'
  FROM cross_reference_threads t, cross_references x, _session253_herm13_lookup sv, _session253_herm13_lookup tv
 WHERE t.slug='hermas-13-twofold-temperance-two-ways'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=34 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Amos 5:15 — *Hate the evil, and love the good, and establish judgment in the gate: it may be that Yahuah Elohim (the LORD God) of hosts will be gracious unto the remnant of Joseph.* Refrain from wickedness and do righteousness is the prophet''s own summons to the remnant — it ain''t new.'
  FROM cross_reference_threads t, cross_references x, _session253_herm13_lookup sv, _session253_herm13_lookup tv
 WHERE t.slug='hermas-13-twofold-temperance-two-ways'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=5 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Amos 5:14 — *Seek good, and not evil, that ye may live: and so Yahuah (LORD), the Elohim (God) of hosts, shall be with you, as ye have spoken.* The Shepherd binds the doing of good to life unto Elohim, just as Amos binds seeking good to living.'
  FROM cross_reference_threads t, cross_references x, _session253_herm13_lookup sv, _session253_herm13_lookup tv
 WHERE t.slug='hermas-13-twofold-temperance-two-ways'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=5 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 12:9 — *Let love be without dissimulation. Abhor that which is evil; cleave to that which is good.* Sha''ul folds the two ways into one charge — hate the evil, hold to the good — the very twofold temperance the Shepherd commands.'
  FROM cross_reference_threads t, cross_references x, _session253_herm13_lookup sv, _session253_herm13_lookup tv
 WHERE t.slug='hermas-13-twofold-temperance-two-ways'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=12 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-13-abstain-from-wickedness
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 1:16 — *Wash you, make you clean; put away the evil of your doings from before mine eyes; cease to do evil;* the Shepherd''s call to be temperate as to evil and abstain from it is the prophet''s own cease-to-do-evil, spoken to a people he would cleanse.'
  FROM cross_reference_threads t, cross_references x, _session253_herm13_lookup sv, _session253_herm13_lookup tv
 WHERE t.slug='hermas-13-abstain-from-wickedness'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=1 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Thessalonians 5:22 — *Abstain from all appearance of evil.* The whole charge to refrain from every wickedness is Sha''ul''s plain word to the children of the day, gathered into one line.'
  FROM cross_reference_threads t, cross_references x, _session253_herm13_lookup sv, _session253_herm13_lookup tv
 WHERE t.slug='hermas-13-abstain-from-wickedness'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-thessalonians' AND tv.chapter_number=5 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Thessalonians 5:21 — *Prove all things; hold fast that which is good.* Before bidding the faithful flee evil, Sha''ul bids them weigh and cleave to the good — the same twofold discernment the Shepherd teaches.'
  FROM cross_reference_threads t, cross_references x, _session253_herm13_lookup sv, _session253_herm13_lookup tv
 WHERE t.slug='hermas-13-abstain-from-wickedness'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-thessalonians' AND tv.chapter_number=5 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-13-works-of-the-good
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 1:17 — *Learn to do well; seek judgment, relieve the oppressed, judge the fatherless, plead for the widow.* The Shepherd''s works of the good — righteousness, mercy, doing well — are the prophet''s own learn-to-do-well, the godly deeds that follow the washing clean.'
  FROM cross_reference_threads t, cross_references x, _session253_herm13_lookup sv, _session253_herm13_lookup tv
 WHERE t.slug='hermas-13-works-of-the-good'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=1 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 12:12 — *Rejoicing in hope; patient in tribulation; continuing instant in prayer;* the patience and steadfast goodness the Shepherd lists among the works of the good are Sha''ul''s own marks of the living sacrifice.'
  FROM cross_reference_threads t, cross_references x, _session253_herm13_lookup sv, _session253_herm13_lookup tv
 WHERE t.slug='hermas-13-works-of-the-good'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=12 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'James 1:25 — *But whoso looketh into the perfect law of liberty, and continueth therein, he being not a forgetful hearer, but a doer of the work, this man shall be blessed in his deed.* The Shepherd''s promise that the one who keeps the good becomes blessed in his life is the doer''s blessing James pronounces over the keeper of the perfect law.'
  FROM cross_reference_threads t, cross_references x, _session253_herm13_lookup sv, _session253_herm13_lookup tv
 WHERE t.slug='hermas-13-works-of-the-good'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-13-minister-to-widows-orphans
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'James 1:27 — *Pure religion and undefiled before Elohim (God) and the Father is this, To visit the fatherless and widows in their affliction, and to keep himself unspotted from the world.* The Shepherd''s ministering to widows and visiting the orphans, while abstaining from all wickedness, is the very pure-and-undefiled religion James defines.'
  FROM cross_reference_threads t, cross_references x, _session253_herm13_lookup sv, _session253_herm13_lookup tv
 WHERE t.slug='hermas-13-minister-to-widows-orphans'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 12:13 — *Distributing to the necessity of saints; given to hospitality.* The Shepherd''s charge to relieve the needy and to be hospitable is Sha''ul''s own word to the body of Messiah — the good works that build up the saints.'
  FROM cross_reference_threads t, cross_references x, _session253_herm13_lookup sv, _session253_herm13_lookup tv
 WHERE t.slug='hermas-13-minister-to-widows-orphans'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=12 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 12:10 — *Be kindly affectioned one to another with brotherly love; in honour preferring one another;* the brotherly feeling, the reverence for the aged, and the bearing of no grudge that the Shepherd commends are Sha''ul''s own brotherly love that prefers another before self.'
  FROM cross_reference_threads t, cross_references x, _session253_herm13_lookup sv, _session253_herm13_lookup tv
 WHERE t.slug='hermas-13-minister-to-widows-orphans'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=12 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

