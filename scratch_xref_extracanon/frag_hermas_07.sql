-- ----- fragment: minion_hermas_07.sql (session253 hermas 7) -----
-- Source anchor: lightfoot-apostolic-fathers/hermas ch7. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: herm7 (view _session253_herm7_lookup). Sort band base 71650, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_herm7_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: hermas-7-speak-evil-of-no-man
  ('lightfoot-apostolic-fathers', 'hermas', 7, 1, 'canon', 'leviticus', 19, 16, 'free', E'Leviticus 19:16 — *Thou shalt not go up and down as a talebearer among thy people: neither shalt thou stand against the blood of thy neighbour: I am Yahuah (LORD).* The Torah''s ban on the talebearer is the very commandment Hermas 7:1 calls keeping, naming slander a restless demon.'),
  ('lightfoot-apostolic-fathers', 'hermas', 7, 1, 'canon', 'psalms', 15, 3, 'free', E'Psalms 15:3 — *He that backbiteth not with his tongue, nor doeth evil to his neighbour, nor taketh up a reproach against his neighbour.* The one who dwells in Yahuah''s holy hill refuses the backbiting that Hermas 7:1 calls the home of factions.'),
  ('lightfoot-apostolic-fathers', 'hermas', 7, 1, 'canon', 'james', 4, 11, 'free', E'James 4:11 — *Speak not evil one of another, brethren. He that speaketh evil of his brother, and judgeth his brother, speaketh evil of the law, and judgeth the law: but if thou judge the law, thou art not a doer of the law, but a judge.* James binds the slanderer to the standing law, the same Torah-honoring guard Hermas 7:1 lays on the tongue.'),
  ('lightfoot-apostolic-fathers', 'hermas', 7, 1, 'canon', 'ephesians', 4, 29, 'free', E'Ephesians 4:29 — *Let no corrupt communication proceed out of your mouth, but that which is good to the use of edifying, that it may minister grace unto the hearers.* Paul''s clean speech is the positive of Hermas 7:1''s refraining from slander, the mouth made smooth and gladsome.'),
  -- thread: hermas-7-grudge-against-thy-brother
  ('lightfoot-apostolic-fathers', 'hermas', 7, 1, 'canon', 'leviticus', 19, 18, 'free', E'Leviticus 19:18 — *Thou shalt not avenge, nor bear any grudge against the children of thy people, but thou shalt love thy neighbour as thyself: I am Yahuah (LORD).* Hermas 7:1 warns that the believed slander breeds a grudge against thy brother — the exact thing Torah forbids, commanding love instead.'),
  ('lightfoot-apostolic-fathers', 'hermas', 7, 1, 'canon', 'leviticus', 19, 17, 'free', E'Leviticus 19:17 — *Thou shalt not hate thy brother in thine heart: thou shalt in any wise rebuke thy neighbour, and not suffer sin upon him.* The heart-level guard against hating a brother answers Hermas 7:1''s caution that listening to slander makes thee responsible for the sin.'),
  ('lightfoot-apostolic-fathers', 'hermas', 7, 1, 'canon', 'romans', 14, 10, 'free', E'Romans 14:10 — *But why dost thou judge thy brother? or why dost thou set at nought thy brother? for we shall all stand before the judgment seat of Messiah (Christ).* Paul forbids the brother-judging a believed slander produces, the grudge Hermas 7:1 calls sin in the hearer.'),
  ('lightfoot-apostolic-fathers', 'hermas', 7, 1, 'canon', 'matthew', 7, 1, 'free', E'Matthew 7:1 — *Judge not, that ye be not judged.* The Master''s word against judging undergirds Hermas 7:1''s refusal to take up a grudge against a brother on a slanderer''s word.'),
  -- thread: hermas-7-give-to-all-freely
  ('lightfoot-apostolic-fathers', 'hermas', 7, 1, 'canon', 'deuteronomy', 15, 10, 'free', E'Deuteronomy 15:10 — *Thou shalt surely give him, and thine heart shall not be grieved when thou givest unto him: because that for this thing Yahuah Elohayka (the LORD thy God) shall bless thee in all thy works, and in all that thou puttest thine hand unto.* The Torah''s ungrudging open hand is the freely-give commandment Hermas 7:1 calls glorious in the sight of Elohim.'),
  ('lightfoot-apostolic-fathers', 'hermas', 7, 1, 'canon', 'luke', 6, 30, 'free', E'Luke 6:30 — *Give to every man that asketh of thee; and of him that taketh away thy goods ask them not again.* The Master''s unmeasured giving matches Hermas 7:1''s charge to give to all in want, making no distinction to whom.'),
  ('lightfoot-apostolic-fathers', 'hermas', 7, 1, 'canon', '2-corinthians', 9, 7, 'free', E'2 Corinthians 9:7 — *Every man according as he purposeth in his heart, so let him give; not grudgingly, or of necessity: for Elohim (God) loveth a cheerful giver.* Paul names the sincere, ungrudging heart Hermas 7:1 calls the ministration glorious before Elohim.'),
  ('lightfoot-apostolic-fathers', 'hermas', 7, 1, 'canon', 'luke', 6, 38, 'free', E'Luke 6:38 — *Give, and it shall be given unto you; good measure, pressed down, and shaken together, and running over, shall men give into your bosom. For with the same measure that ye mete withal it shall be measured to you again.* The Master''s promise of overflowing return crowns Hermas 7:1''s call to give freely of Elohim''s own bounties.'),
  -- thread: hermas-7-render-an-account
  ('lightfoot-apostolic-fathers', 'hermas', 7, 1, 'canon', 'romans', 14, 12, 'free', E'Romans 14:12 — *So then every one of us shall give account of himself to Elohim (God).* Paul''s universal reckoning is the account Hermas 7:1 says both giver and receiver shall render to Elohim.'),
  ('lightfoot-apostolic-fathers', 'hermas', 7, 1, 'canon', 'matthew', 7, 17, 'free', E'Matthew 7:17 — *Even so every good tree bringeth forth good fruit; but a corrupt tree bringeth forth evil fruit.* The good fruit of a pure heart answers Hermas 7:1''s call to work that which is good and keep the commandment sincerely.'),
  ('lightfoot-apostolic-fathers', 'hermas', 7, 1, 'canon', 'matthew', 7, 24, 'free', E'Matthew 7:24 — *Therefore whosoever heareth these sayings of mine, and doeth them, I will liken him unto a wise man, which built his house upon a rock.* The Master commends the doer, not the hearer only, just as Hermas 7:1 charges to keep this commandment as told.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_herm7_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_herm7_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-7-speak-evil-of-no-man',
       E'Slander the restless demon — speak evil of no man',
       E'The Shepherd''s Second Mandate sets a guard on the tongue: *‘First of all, speak evil of no man, neither take pleasure in listening to a slanderer... Slander is evil; it is a restless demon, never at peace, but always having its home among factions. Refrain from it therefore, and thou shalt have success at all times with all men.’* It ain''t new — the Torah forbade the talebearer long before: *Thou shalt not go up and down as a talebearer among thy people: neither shalt thou stand against the blood of thy neighbour: I am Yahuah (LORD)* (Leviticus 19:16), and barred the backbiter from the holy hill: *He that backbiteth not with his tongue, nor doeth evil to his neighbour, nor taketh up a reproach against his neighbour* (Psalms 15:3). James carries the same everlasting commandment into the assembly, binding the tongue to the standing law: *Speak not evil one of another, brethren. He that speaketh evil of his brother, and judgeth his brother, speaketh evil of the law, and judgeth the law* (James 4:11), and Paul echoes the clean mouth: *Let no corrupt communication proceed out of your mouth, but that which is good to the use of edifying, that it may minister grace unto the hearers* (Ephesians 4:29). The commandment stands.',
       sv.verse_id, ev.verse_id, 'extras', 71650
  FROM _session253_herm7_lookup sv, _session253_herm7_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=7 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=7 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-7-grudge-against-thy-brother',
       E'Believe not the slander — bear no grudge against thy brother',
       E'Hermas warns that the hearer shares the slanderer''s sin: *‘Otherwise thou that hearest too shalt be responsible for the sin of him that speaketh the evil, if thou believest the slander, which thou hearest; for in believing it thou thyself also wilt have a grudge against thy brother.’* The Torah already joined the inward grudge to the outward duty of love: *Thou shalt not avenge, nor bear any grudge against the children of thy people, but thou shalt love thy neighbour as thyself: I am Yahuah (LORD)* (Leviticus 19:18); and *Thou shalt not hate thy brother in thine heart: thou shalt in any wise rebuke thy neighbour, and not suffer sin upon him* (Leviticus 19:17). Paul forbids the very judging that a believed slander breeds: *But why dost thou judge thy brother? or why dost thou set at nought thy brother? for we shall all stand before the judgment seat of Messiah (Christ)* (Romans 14:10), as the Master taught: *Judge not, that ye be not judged* (Matthew 7:1). It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 71653
  FROM _session253_herm7_lookup sv, _session253_herm7_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=7 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=7 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-7-give-to-all-freely',
       E'Give to all freely — the cheerful giver and the account',
       E'The Mandate turns to almsgiving: *‘Work that which is good, and of thy labours, which Elohim (God) giveth thee, give to all that are in want freely, not questioning to whom thou shalt give... Give to all; for to all Elohim (God) desireth that there should be given of His own bounties... He then that giveth is guiltless... in sincerity, by making no distinction to whom to give or not to give.’* This is no new ethic. The Torah commanded the open hand: *Thou shalt surely give him, and thine heart shall not be grieved when thou givest unto him: because that for this thing Yahuah Elohayka (the LORD thy God) shall bless thee in all thy works* (Deuteronomy 15:10). The Master taught the same unmeasured giving: *Give to every man that asketh of thee; and of him that taketh away thy goods ask them not again* (Luke 6:30), with the promise *Give, and it shall be given unto you; good measure, pressed down, and shaken together, and running over, shall men give into your bosom* (Luke 6:38). And Paul names the heart Hermas commends: *Every man according as he purposeth in his heart, so let him give; not grudgingly, or of necessity: for Elohim (God) loveth a cheerful giver* (2 Corinthians 9:7). It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 71656
  FROM _session253_herm7_lookup sv, _session253_herm7_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=7 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=7 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-7-render-an-account',
       E'They shall render an account — keep this commandment, repent sincerely',
       E'Hermas grounds giving in the coming reckoning and seals the Mandate with repentance: *‘They then that receive shall render an account to Elohim (God) why they received it, and to what end; for they that receive in distress shall not be judged, but they that receive by false pretence shall pay the penalty... Therefore keep this commandment, as I have told thee, that thine own repentance and that of thy household may be found to be sincere, and [thy] heart pure and undefiled.’* Paul speaks the same universal account: *So then every one of us shall give account of himself to Elohim (God)* (Romans 14:12). The good tree must bear good fruit: *Even so every good tree bringeth forth good fruit; but a corrupt tree bringeth forth evil fruit* (Matthew 7:17). And keeping the commandment is the path of the doers, not the mere hearers: *Therefore whosoever heareth these sayings of mine, and doeth them, I will liken him unto a wise man, which built his house upon a rock* (Matthew 7:24). The commandment stands, and the heart pure and undefiled is the fruit of sincere repentance.',
       sv.verse_id, ev.verse_id, 'extras', 71659
  FROM _session253_herm7_lookup sv, _session253_herm7_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=7 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=7 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: hermas-7-speak-evil-of-no-man
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 19:16 — *Thou shalt not go up and down as a talebearer among thy people: neither shalt thou stand against the blood of thy neighbour: I am Yahuah (LORD).* The Torah''s ban on the talebearer is the very commandment Hermas 7:1 calls keeping, naming slander a restless demon.'
  FROM cross_reference_threads t, cross_references x, _session253_herm7_lookup sv, _session253_herm7_lookup tv
 WHERE t.slug='hermas-7-speak-evil-of-no-man'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 15:3 — *He that backbiteth not with his tongue, nor doeth evil to his neighbour, nor taketh up a reproach against his neighbour.* The one who dwells in Yahuah''s holy hill refuses the backbiting that Hermas 7:1 calls the home of factions.'
  FROM cross_reference_threads t, cross_references x, _session253_herm7_lookup sv, _session253_herm7_lookup tv
 WHERE t.slug='hermas-7-speak-evil-of-no-man'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=15 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'James 4:11 — *Speak not evil one of another, brethren. He that speaketh evil of his brother, and judgeth his brother, speaketh evil of the law, and judgeth the law: but if thou judge the law, thou art not a doer of the law, but a judge.* James binds the slanderer to the standing law, the same Torah-honoring guard Hermas 7:1 lays on the tongue.'
  FROM cross_reference_threads t, cross_references x, _session253_herm7_lookup sv, _session253_herm7_lookup tv
 WHERE t.slug='hermas-7-speak-evil-of-no-man'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=4 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ephesians 4:29 — *Let no corrupt communication proceed out of your mouth, but that which is good to the use of edifying, that it may minister grace unto the hearers.* Paul''s clean speech is the positive of Hermas 7:1''s refraining from slander, the mouth made smooth and gladsome.'
  FROM cross_reference_threads t, cross_references x, _session253_herm7_lookup sv, _session253_herm7_lookup tv
 WHERE t.slug='hermas-7-speak-evil-of-no-man'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=4 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-7-grudge-against-thy-brother
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 19:18 — *Thou shalt not avenge, nor bear any grudge against the children of thy people, but thou shalt love thy neighbour as thyself: I am Yahuah (LORD).* Hermas 7:1 warns that the believed slander breeds a grudge against thy brother — the exact thing Torah forbids, commanding love instead.'
  FROM cross_reference_threads t, cross_references x, _session253_herm7_lookup sv, _session253_herm7_lookup tv
 WHERE t.slug='hermas-7-grudge-against-thy-brother'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 19:17 — *Thou shalt not hate thy brother in thine heart: thou shalt in any wise rebuke thy neighbour, and not suffer sin upon him.* The heart-level guard against hating a brother answers Hermas 7:1''s caution that listening to slander makes thee responsible for the sin.'
  FROM cross_reference_threads t, cross_references x, _session253_herm7_lookup sv, _session253_herm7_lookup tv
 WHERE t.slug='hermas-7-grudge-against-thy-brother'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 14:10 — *But why dost thou judge thy brother? or why dost thou set at nought thy brother? for we shall all stand before the judgment seat of Messiah (Christ).* Paul forbids the brother-judging a believed slander produces, the grudge Hermas 7:1 calls sin in the hearer.'
  FROM cross_reference_threads t, cross_references x, _session253_herm7_lookup sv, _session253_herm7_lookup tv
 WHERE t.slug='hermas-7-grudge-against-thy-brother'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=14 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 7:1 — *Judge not, that ye be not judged.* The Master''s word against judging undergirds Hermas 7:1''s refusal to take up a grudge against a brother on a slanderer''s word.'
  FROM cross_reference_threads t, cross_references x, _session253_herm7_lookup sv, _session253_herm7_lookup tv
 WHERE t.slug='hermas-7-grudge-against-thy-brother'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-7-give-to-all-freely
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 15:10 — *Thou shalt surely give him, and thine heart shall not be grieved when thou givest unto him: because that for this thing Yahuah Elohayka (the LORD thy God) shall bless thee in all thy works, and in all that thou puttest thine hand unto.* The Torah''s ungrudging open hand is the freely-give commandment Hermas 7:1 calls glorious in the sight of Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_herm7_lookup sv, _session253_herm7_lookup tv
 WHERE t.slug='hermas-7-give-to-all-freely'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=15 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 6:30 — *Give to every man that asketh of thee; and of him that taketh away thy goods ask them not again.* The Master''s unmeasured giving matches Hermas 7:1''s charge to give to all in want, making no distinction to whom.'
  FROM cross_reference_threads t, cross_references x, _session253_herm7_lookup sv, _session253_herm7_lookup tv
 WHERE t.slug='hermas-7-give-to-all-freely'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=6 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Corinthians 9:7 — *Every man according as he purposeth in his heart, so let him give; not grudgingly, or of necessity: for Elohim (God) loveth a cheerful giver.* Paul names the sincere, ungrudging heart Hermas 7:1 calls the ministration glorious before Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_herm7_lookup sv, _session253_herm7_lookup tv
 WHERE t.slug='hermas-7-give-to-all-freely'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=9 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Luke 6:38 — *Give, and it shall be given unto you; good measure, pressed down, and shaken together, and running over, shall men give into your bosom. For with the same measure that ye mete withal it shall be measured to you again.* The Master''s promise of overflowing return crowns Hermas 7:1''s call to give freely of Elohim''s own bounties.'
  FROM cross_reference_threads t, cross_references x, _session253_herm7_lookup sv, _session253_herm7_lookup tv
 WHERE t.slug='hermas-7-give-to-all-freely'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=6 AND tv.verse_number=38
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-7-render-an-account
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 14:12 — *So then every one of us shall give account of himself to Elohim (God).* Paul''s universal reckoning is the account Hermas 7:1 says both giver and receiver shall render to Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_herm7_lookup sv, _session253_herm7_lookup tv
 WHERE t.slug='hermas-7-render-an-account'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=14 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 7:17 — *Even so every good tree bringeth forth good fruit; but a corrupt tree bringeth forth evil fruit.* The good fruit of a pure heart answers Hermas 7:1''s call to work that which is good and keep the commandment sincerely.'
  FROM cross_reference_threads t, cross_references x, _session253_herm7_lookup sv, _session253_herm7_lookup tv
 WHERE t.slug='hermas-7-render-an-account'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 7:24 — *Therefore whosoever heareth these sayings of mine, and doeth them, I will liken him unto a wise man, which built his house upon a rock.* The Master commends the doer, not the hearer only, just as Hermas 7:1 charges to keep this commandment as told.'
  FROM cross_reference_threads t, cross_references x, _session253_herm7_lookup sv, _session253_herm7_lookup tv
 WHERE t.slug='hermas-7-render-an-account'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

