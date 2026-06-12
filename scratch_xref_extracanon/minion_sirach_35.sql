-- ----- fragment: minion_ecclesiasticus_35.sql (session253 ecclesiasticus 35) -----
-- Source anchor: apocrypha/ecclesiasticus ch35. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: sir35 (view _session253_sir35_lookup). Sort band base 59150, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_sir35_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ecclesiasticus-35-obedience-above-sacrifice
  ('apocrypha', 'ecclesiasticus', 35, 1, 'canon', '1-samuel', 15, 22, 'free', E'1 Samuel 15:22 — *And Samuel said, Hath Yahuah (LORD) as great delight in burnt offerings and sacrifices, as in obeying the voice of Yahuah (LORD)? Behold, to obey is better than sacrifice, and to hearken than the fat of rams.* Samuel''s verdict to Saul is the seed of Sirach 35:1 — keeping the commandment already offers the peace offering.'),
  ('apocrypha', 'ecclesiasticus', 35, 1, 'canon', 'hosea', 6, 6, 'free', E'Hosea 6:6 — *For I desired mercy, and not sacrifice; and the knowledge of Elohim (God) more than burnt offerings.* Yahuah''s own preference ranks obedience and mercy above the altar, exactly as Sirach 35:1 frames law-keeping as offering enough.'),
  ('apocrypha', 'ecclesiasticus', 35, 1, 'canon', 'proverbs', 21, 3, 'free', E'Proverbs 21:3 — *To do justice and judgment is more acceptable to Yahuah (LORD) than sacrifice.* Solomon''s proverb is the wisdom-twin of Sirach 35:1, justice weighed heavier than the offering itself.'),
  ('apocrypha', 'ecclesiasticus', 35, 3, 'canon', 'psalms', 51, 17, 'free', E'Psalm 51:17 — *The sacrifices of Elohim (God) are a broken spirit: a broken and a contrite heart, O Elohim (God), thou wilt not despise.* David names the contrite heart as the true sacrifice, matching Sirach 35:3 that forsaking unrighteousness is itself a propitiation.'),
  -- thread: ecclesiasticus-35-appear-not-empty-firstfruits-feasts
  ('apocrypha', 'ecclesiasticus', 35, 4, 'canon', 'deuteronomy', 16, 16, 'free', E'Deuteronomy 16:16 — *Three times in a year shall all thy males appear before Yahuah Elohayka (the LORD thy God) in the place which he shall choose; in the feast of unleavened bread, and in the feast of weeks, and in the feast of tabernacles: and they shall not appear before Yahuah (LORD) empty:* Sirach 35:4 lifts this pilgrimage-feast command nearly word for word — none appears empty at the appointed times.'),
  ('apocrypha', 'ecclesiasticus', 35, 4, 'canon', 'deuteronomy', 16, 17, 'free', E'Deuteronomy 16:17 — *Every man shall give as he is able, according to the blessing of Yahuah Elohayka (the LORD thy God) which he hath given thee.* The Torah measure of giving — according to the blessing received — undergirds Sirach 35:4-8 and anticipates 35:10''s give as he has enriched you.'),
  ('apocrypha', 'ecclesiasticus', 35, 8, 'apocrypha', 'ecclesiasticus', 7, 31, 'extras', E'Ecclesiasticus 7:31 — *Fear Yahuah (God), and honor the priest; and give him his portion, as it is commanded you; the firstfruits, and the trespass offering, and the gift of the shoulders, and the sacrifice of sanctification, and the firstfruits of the holy things.* Sirach self-links: the firstfruits not to be diminished in 35:8 are the same firstfruits commanded earlier in the book.'),
  -- thread: ecclesiasticus-35-cheerful-giver-yahuah-recompenseth
  ('apocrypha', 'ecclesiasticus', 35, 10, 'canon', '2-corinthians', 9, 7, 'free', E'2 Corinthians 9:7 — *Every man according as he purposeth in his heart, so let him give; not grudgingly, or of necessity: for Elohim (God) loveth a cheerful giver.* Paul''s cheerful giver is the cheerful eye of Sirach 35:10, the heart''s gladness making the gift acceptable.'),
  ('apocrypha', 'ecclesiasticus', 35, 11, 'canon', 'proverbs', 19, 17, 'free', E'Proverbs 19:17 — *He that hath pity upon the poor lendeth unto Yahuah (LORD); and that which he hath given will he pay him again.* The repayment Sirach 35:11 names — Yahuah recompenseth seven times — is Solomon''s proverb that giving to the poor is a loan Yahuah repays.'),
  ('apocrypha', 'ecclesiasticus', 35, 10, 'apocrypha', 'tobit', 4, 8, 'extras', E'Tobit 4:8 — *If you have abundance give alms accordingly: if you have but a little, be not afraid to give according to that little:* Tobit''s counsel to give in proportion to what one has is the sister-wisdom of Sirach 35:10''s give according as he has enriched you.'),
  -- thread: ecclesiasticus-35-no-respect-of-persons-prayer-of-the-poor
  ('apocrypha', 'ecclesiasticus', 35, 13, 'canon', 'isaiah', 1, 17, 'free', E'Isaiah 1:17 — *Learn to do well; seek judgment, relieve the oppressed, judge the fatherless, plead for the widow.* Isaiah''s charge to defend the fatherless and widow is exactly the company Sirach 35:13-14 says Yahuah will not despise.'),
  ('apocrypha', 'ecclesiasticus', 35, 12, 'canon', 'isaiah', 1, 11, 'free', E'Isaiah 1:11 — *To what purpose is the multitude of your sacrifices unto me? saith Yahuah (LORD): I am full of the burnt offerings of rams, and the fat of fed beasts; and I delight not in the blood of bullocks, or of lambs, or of he goats.* Yahuah rejects the multiplied unjust sacrifice, the very corrupting gift Sirach 35:12 warns He will not receive.'),
  ('apocrypha', 'ecclesiasticus', 35, 14, 'canon', 'james', 5, 4, 'free', E'James 5:4 — *Behold, the hire of the labourers who have reaped down your fields, which is of you kept back by fraud, crieth: and the cries of them which have reaped are entered into the ears of Yahuah (Lord) of sabaoth.* James echoes Sirach 35:14 — the cry of the wronged reaches the ears of Yahuah, no respecter of persons.'),
  ('apocrypha', 'ecclesiasticus', 35, 13, 'canon', 'psalms', 9, 9, 'free', E'Psalm 9:9 — *Yahuah (LORD) also will be a refuge for the oppressed, a refuge in times of trouble.* David''s refuge for the oppressed is the same hearing ear Sirach 35:13 promises to the poor man''s prayer.'),
  -- thread: ecclesiasticus-35-vengeance-to-the-heathen-judge-his-people
  ('apocrypha', 'ecclesiasticus', 35, 19, 'canon', 'luke', 18, 7, 'free', E'Luke 18:7 — *And shall not Elohim (God) avenge his own elect, which cry day and night unto him, though he bear long with them?* The Messiah''s parable of the persistent widow resolves Sirach 35:19 — Yahuah will judge the cause of His people who cry to Him.'),
  ('apocrypha', 'ecclesiasticus', 35, 18, 'canon', 'luke', 18, 8, 'free', E'Luke 18:8 — *I tell you that he will avenge them speedily. Nevertheless when the Son of Adam cometh, shall he find faith on the earth?* The speedy avenging answers Sirach 35:18''s promise that Yahuah will not be slack to repay vengeance and break the sceptre of the unrighteous.'),
  ('apocrypha', 'ecclesiasticus', 35, 18, 'canon', 'psalms', 9, 8, 'free', E'Psalm 9:8 — *And he shall judge the world in righteousness, he shall minister judgment to the people in uprightness.* David''s righteous Judge of the world is the One Sirach 35:18-19 waits on to render to every man according to his deeds.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_sir35_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_sir35_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-35-obedience-above-sacrifice',
       E'He that keepeth the law brings offerings enough',
       E'Sirach opens this chapter by collapsing the whole sacrificial system into Torah-obedience: *He that keepeth the law brings offerings enough: he that takes heed to the commandment offers a peace offering.* (Ecclesiasticus 35:1) — and *To depart from wickedness is a thing pleasing to Yahuah (God); and to forsake unrighteousness is a propitiation.* (Ecclesiasticus 35:3). This is the oldest word in the prophets, not a new ethic. Samuel says it to Saul: *Behold, to obey is better than sacrifice, and to hearken than the fat of rams.* (1 Samuel 15:22). Yahuah Himself frames it through Hosea — *For I desired mercy, and not sacrifice; and the knowledge of Elohim (God) more than burnt offerings.* (Hosea 6:6) — and through Solomon — *To do justice and judgment is more acceptable to Yahuah (LORD) than sacrifice.* (Proverbs 21:3). David, having no animal to bring, names the true altar: *The sacrifices of Elohim (God) are a broken spirit: a broken and a contrite heart, O Elohim (God), thou wilt not despise.* (Psalm 51:17). It ain''t new: the deuterocanon carries the same covenant witness — obedience is the offering Yahuah was always after.',
       sv.verse_id, ev.verse_id, 'extras', 59150
  FROM _session253_sir35_lookup sv, _session253_sir35_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=35 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=35 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-35-appear-not-empty-firstfruits-feasts',
       E'You shall not appear empty before Yahuah',
       E'*You shall not appear empty before Yahuah (God).* (Ecclesiasticus 35:4) — Sirach is quoting Torah directly. The pilgrimage law commands: *Three times in a year shall all thy males appear before Yahuah Elohayka (the LORD thy God)... in the feast of unleavened bread, and in the feast of weeks, and in the feast of tabernacles: and they shall not appear before Yahuah (LORD) empty.* (Deuteronomy 16:16), and the very next breath sets the measure — *Every man shall give as he is able, according to the blessing of Yahuah Elohayka (the LORD thy God) which he hath given thee.* (Deuteronomy 16:17). So when Sirach adds *diminish not the firstfruits of yours hands* (Ecclesiasticus 35:8), he is restating the appointed-times offering of the law, not inventing a piety. The feast calendar stands, and the firstfruit is brought to it.',
       sv.verse_id, ev.verse_id, 'extras', 59153
  FROM _session253_sir35_lookup sv, _session253_sir35_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=35 AND sv.verse_number=4
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=35 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-35-cheerful-giver-yahuah-recompenseth',
       E'Give with a cheerful eye, for Yahuah recompenseth',
       E'*In all your gifts shew a cheerful countenance, and dedicate your tithes with gladness.* (Ecclesiasticus 35:9), *Give to the Most High according as he has enriched you; and as you have gotten, give with a cheerful eye.* (Ecclesiasticus 35:10), *For Yahuah (God) recompenseth, and will give you seven times as much.* (Ecclesiasticus 35:11). Paul preaches this same cheerfulness almost verbatim two centuries later: *Every man according as he purposeth in his heart, so let him give; not grudgingly, or of necessity: for Elohim (God) loveth a cheerful giver.* (2 Corinthians 9:7). And the recompense is the oldest promise — *He that hath pity upon the poor lendeth unto Yahuah (LORD); and that which he hath given will he pay him again.* (Proverbs 19:17). Tobit teaches his son the same hand: *If you have abundance give alms accordingly: if you have but a little, be not afraid to give according to that little.* (Tobit 4:8). It ain''t new: the cheerful giver of the gospel is the cheerful eye of the wisdom books.',
       sv.verse_id, ev.verse_id, 'extras', 59156
  FROM _session253_sir35_lookup sv, _session253_sir35_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=35 AND sv.verse_number=9
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=35 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-35-no-respect-of-persons-prayer-of-the-poor',
       E'No respect of persons; the prayer of the oppressed pierceth the clouds',
       E'Sirach forbids buying off the Judge and lifts up the cry of the powerless: *Do not think to corrupt with gifts; for such he will not receive... for Yahuah (God) is judge, and with him is no respect of persons.* (Ecclesiasticus 35:12), *He will not accept any person against a poor man, but will hear the prayer of the oppressed.* (Ecclesiasticus 35:13), *He will not despise the supplication of the fatherless; nor the widow, when she poureth out her complaint.* (Ecclesiasticus 35:14), and *The prayer of the humble pierces the clouds.* (Ecclesiasticus 35:17). The prophets carry the same charge — empty sacrifice rejected, the oppressed defended: *To what purpose is the multitude of your sacrifices unto me? saith Yahuah (LORD)...* (Isaiah 1:11), *Learn to do well; seek judgment, relieve the oppressed, judge the fatherless, plead for the widow.* (Isaiah 1:17). James hears the same cry against fraud: *the cries of them which have reaped are entered into the ears of Yahuah (Lord) of sabaoth.* (James 5:4). And the Refuge stands over the crushed — *Yahuah (LORD) also will be a refuge for the oppressed, a refuge in times of trouble.* (Psalm 9:9). The God who takes no bribe hears the widow''s tears.',
       sv.verse_id, ev.verse_id, 'extras', 59159
  FROM _session253_sir35_lookup sv, _session253_sir35_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=35 AND sv.verse_number=12
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=35 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-35-vengeance-to-the-heathen-judge-his-people',
       E'He will repay vengeance, and judge the cause of his people',
       E'The chapter closes in apocalyptic judgment: Yahuah *will not be slack... till he have struck in sunder the loins of the unmerciful, and repayed vengeance to the heathen; till he have taken away the multitude of the proud, and broken the sceptre of the unrighteous* (Ecclesiasticus 35:18), *Till he have rendered to every man according to his deeds... till he have judged the cause of his people, and made them to rejoice in his mercy* (Ecclesiasticus 35:19). This is the unjust-judge parable''s resolution before its time: *And shall not Elohim (God) avenge his own elect, which cry day and night unto him, though he bear long with them?* (Luke 18:7) — *I tell you that he will avenge them speedily.* (Luke 18:8). The righteous Judge of all the earth will not stay slack — *And he shall judge the world in righteousness, he shall minister judgment to the people in uprightness.* (Psalm 9:8). The humble prayer that pierced the clouds (35:17) is answered when Yahuah arises to judge His people''s cause.',
       sv.verse_id, ev.verse_id, 'extras', 59162
  FROM _session253_sir35_lookup sv, _session253_sir35_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=35 AND sv.verse_number=18
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=35 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ecclesiasticus-35-obedience-above-sacrifice
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Samuel 15:22 — *And Samuel said, Hath Yahuah (LORD) as great delight in burnt offerings and sacrifices, as in obeying the voice of Yahuah (LORD)? Behold, to obey is better than sacrifice, and to hearken than the fat of rams.* Samuel''s verdict to Saul is the seed of Sirach 35:1 — keeping the commandment already offers the peace offering.'
  FROM cross_reference_threads t, cross_references x, _session253_sir35_lookup sv, _session253_sir35_lookup tv
 WHERE t.slug='ecclesiasticus-35-obedience-above-sacrifice'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=35 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=15 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hosea 6:6 — *For I desired mercy, and not sacrifice; and the knowledge of Elohim (God) more than burnt offerings.* Yahuah''s own preference ranks obedience and mercy above the altar, exactly as Sirach 35:1 frames law-keeping as offering enough.'
  FROM cross_reference_threads t, cross_references x, _session253_sir35_lookup sv, _session253_sir35_lookup tv
 WHERE t.slug='ecclesiasticus-35-obedience-above-sacrifice'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=35 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=6 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 21:3 — *To do justice and judgment is more acceptable to Yahuah (LORD) than sacrifice.* Solomon''s proverb is the wisdom-twin of Sirach 35:1, justice weighed heavier than the offering itself.'
  FROM cross_reference_threads t, cross_references x, _session253_sir35_lookup sv, _session253_sir35_lookup tv
 WHERE t.slug='ecclesiasticus-35-obedience-above-sacrifice'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=35 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=21 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 51:17 — *The sacrifices of Elohim (God) are a broken spirit: a broken and a contrite heart, O Elohim (God), thou wilt not despise.* David names the contrite heart as the true sacrifice, matching Sirach 35:3 that forsaking unrighteousness is itself a propitiation.'
  FROM cross_reference_threads t, cross_references x, _session253_sir35_lookup sv, _session253_sir35_lookup tv
 WHERE t.slug='ecclesiasticus-35-obedience-above-sacrifice'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=35 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=51 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-35-appear-not-empty-firstfruits-feasts
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 16:16 — *Three times in a year shall all thy males appear before Yahuah Elohayka (the LORD thy God) in the place which he shall choose; in the feast of unleavened bread, and in the feast of weeks, and in the feast of tabernacles: and they shall not appear before Yahuah (LORD) empty:* Sirach 35:4 lifts this pilgrimage-feast command nearly word for word — none appears empty at the appointed times.'
  FROM cross_reference_threads t, cross_references x, _session253_sir35_lookup sv, _session253_sir35_lookup tv
 WHERE t.slug='ecclesiasticus-35-appear-not-empty-firstfruits-feasts'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=35 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=16 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 16:17 — *Every man shall give as he is able, according to the blessing of Yahuah Elohayka (the LORD thy God) which he hath given thee.* The Torah measure of giving — according to the blessing received — undergirds Sirach 35:4-8 and anticipates 35:10''s give as he has enriched you.'
  FROM cross_reference_threads t, cross_references x, _session253_sir35_lookup sv, _session253_sir35_lookup tv
 WHERE t.slug='ecclesiasticus-35-appear-not-empty-firstfruits-feasts'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=35 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=16 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ecclesiasticus 7:31 — *Fear Yahuah (God), and honor the priest; and give him his portion, as it is commanded you; the firstfruits, and the trespass offering, and the gift of the shoulders, and the sacrifice of sanctification, and the firstfruits of the holy things.* Sirach self-links: the firstfruits not to be diminished in 35:8 are the same firstfruits commanded earlier in the book.'
  FROM cross_reference_threads t, cross_references x, _session253_sir35_lookup sv, _session253_sir35_lookup tv
 WHERE t.slug='ecclesiasticus-35-appear-not-empty-firstfruits-feasts'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=35 AND sv.verse_number=8
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=7 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-35-cheerful-giver-yahuah-recompenseth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Corinthians 9:7 — *Every man according as he purposeth in his heart, so let him give; not grudgingly, or of necessity: for Elohim (God) loveth a cheerful giver.* Paul''s cheerful giver is the cheerful eye of Sirach 35:10, the heart''s gladness making the gift acceptable.'
  FROM cross_reference_threads t, cross_references x, _session253_sir35_lookup sv, _session253_sir35_lookup tv
 WHERE t.slug='ecclesiasticus-35-cheerful-giver-yahuah-recompenseth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=35 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=9 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 19:17 — *He that hath pity upon the poor lendeth unto Yahuah (LORD); and that which he hath given will he pay him again.* The repayment Sirach 35:11 names — Yahuah recompenseth seven times — is Solomon''s proverb that giving to the poor is a loan Yahuah repays.'
  FROM cross_reference_threads t, cross_references x, _session253_sir35_lookup sv, _session253_sir35_lookup tv
 WHERE t.slug='ecclesiasticus-35-cheerful-giver-yahuah-recompenseth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=35 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=19 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Tobit 4:8 — *If you have abundance give alms accordingly: if you have but a little, be not afraid to give according to that little:* Tobit''s counsel to give in proportion to what one has is the sister-wisdom of Sirach 35:10''s give according as he has enriched you.'
  FROM cross_reference_threads t, cross_references x, _session253_sir35_lookup sv, _session253_sir35_lookup tv
 WHERE t.slug='ecclesiasticus-35-cheerful-giver-yahuah-recompenseth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=35 AND sv.verse_number=10
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=4 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-35-no-respect-of-persons-prayer-of-the-poor
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 1:17 — *Learn to do well; seek judgment, relieve the oppressed, judge the fatherless, plead for the widow.* Isaiah''s charge to defend the fatherless and widow is exactly the company Sirach 35:13-14 says Yahuah will not despise.'
  FROM cross_reference_threads t, cross_references x, _session253_sir35_lookup sv, _session253_sir35_lookup tv
 WHERE t.slug='ecclesiasticus-35-no-respect-of-persons-prayer-of-the-poor'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=35 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=1 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 1:11 — *To what purpose is the multitude of your sacrifices unto me? saith Yahuah (LORD): I am full of the burnt offerings of rams, and the fat of fed beasts; and I delight not in the blood of bullocks, or of lambs, or of he goats.* Yahuah rejects the multiplied unjust sacrifice, the very corrupting gift Sirach 35:12 warns He will not receive.'
  FROM cross_reference_threads t, cross_references x, _session253_sir35_lookup sv, _session253_sir35_lookup tv
 WHERE t.slug='ecclesiasticus-35-no-respect-of-persons-prayer-of-the-poor'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=35 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=1 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'James 5:4 — *Behold, the hire of the labourers who have reaped down your fields, which is of you kept back by fraud, crieth: and the cries of them which have reaped are entered into the ears of Yahuah (Lord) of sabaoth.* James echoes Sirach 35:14 — the cry of the wronged reaches the ears of Yahuah, no respecter of persons.'
  FROM cross_reference_threads t, cross_references x, _session253_sir35_lookup sv, _session253_sir35_lookup tv
 WHERE t.slug='ecclesiasticus-35-no-respect-of-persons-prayer-of-the-poor'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=35 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=5 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 9:9 — *Yahuah (LORD) also will be a refuge for the oppressed, a refuge in times of trouble.* David''s refuge for the oppressed is the same hearing ear Sirach 35:13 promises to the poor man''s prayer.'
  FROM cross_reference_threads t, cross_references x, _session253_sir35_lookup sv, _session253_sir35_lookup tv
 WHERE t.slug='ecclesiasticus-35-no-respect-of-persons-prayer-of-the-poor'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=35 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=9 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-35-vengeance-to-the-heathen-judge-his-people
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Luke 18:7 — *And shall not Elohim (God) avenge his own elect, which cry day and night unto him, though he bear long with them?* The Messiah''s parable of the persistent widow resolves Sirach 35:19 — Yahuah will judge the cause of His people who cry to Him.'
  FROM cross_reference_threads t, cross_references x, _session253_sir35_lookup sv, _session253_sir35_lookup tv
 WHERE t.slug='ecclesiasticus-35-vengeance-to-the-heathen-judge-his-people'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=35 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=18 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 18:8 — *I tell you that he will avenge them speedily. Nevertheless when the Son of Adam cometh, shall he find faith on the earth?* The speedy avenging answers Sirach 35:18''s promise that Yahuah will not be slack to repay vengeance and break the sceptre of the unrighteous.'
  FROM cross_reference_threads t, cross_references x, _session253_sir35_lookup sv, _session253_sir35_lookup tv
 WHERE t.slug='ecclesiasticus-35-vengeance-to-the-heathen-judge-his-people'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=35 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=18 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 9:8 — *And he shall judge the world in righteousness, he shall minister judgment to the people in uprightness.* David''s righteous Judge of the world is the One Sirach 35:18-19 waits on to render to every man according to his deeds.'
  FROM cross_reference_threads t, cross_references x, _session253_sir35_lookup sv, _session253_sir35_lookup tv
 WHERE t.slug='ecclesiasticus-35-vengeance-to-the-heathen-judge-his-people'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=35 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=9 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

