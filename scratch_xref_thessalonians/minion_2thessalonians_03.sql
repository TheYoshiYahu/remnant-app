-- ----- fragment: minion_2thessalonians_03.sql (S234 2 Thessalonians 3) -----
-- =====================================================================
-- S234 minion — 2 THESSALONIANS 3 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 2 THESSALONIANS 3 (18 verses) — the closing practical-instruction chapter:
--   pray the word run free, Yahuah is faithful, withdraw from the disorderly, work and eat
--   your own bread, be not weary in well doing.
-- Tag: t203 (temp view _s234_t203_lookup).
-- Sort band: floor 8250, step 3 (8250, 8253, 8256, 8259 used; under 8275).
-- Source is ALWAYS the canon 2 Thessalonians verse; targets span Tanakh + NT (no extras warranted).
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME: a chapter of apostolic order, not eschatology. Paul, Silvanus and Timotheus
-- close the letter with the practical Torah of the assembly — the word running free, the Faithful
-- One who keeps his own from evil, the diligence that eats its own bread, the well-doing that does
-- not grow weary. These are not new ethics severed from Israel''s Scriptures: every charge re-speaks
-- the Tanakh — the swift word of Psalm 147, the Keeper of Psalm 121, the sweat-of-the-face and the
-- ant-and-the-sluggard of Genesis and Proverbs, the wait-upon-Yahuah who runs and is not weary of
-- Isaiah 40. No replacement theology, no law-vs-grace antithesis: the apostolic *tradition which he
-- received of us* (3:6) is the same instruction Yahuah (Lord) gave from the beginning. Christology
-- stays the Formed — the charges come *in the name of our Lord Yahusha HaMashiach (Lord Jesus
-- Christ)* (3:6,12), the sent Son through whom the Father is served.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-2   pray that the word of Yahuah may have free course, and be glorified
--           Tanakh: Psalm 147:15 (his word runneth very swiftly), Psalm 147:18 (he sendeth out his
--                   word), Psalm 147:19 (he sheweth his word unto Jacob)
--           Extras: none warranted   NT: none warranted (the swift-word root is the Tanakh)
--   v.3-5   Yahuah is faithful, who shall stablish you, and keep you from evil
--           Tanakh: Psalm 121:7 (Yahuah shall preserve thee from all evil), Psalm 121:4 (he that
--                   keepeth Yashar'el shall neither slumber nor sleep)
--           Extras: none warranted   NT: Matthew 6:13 (deliver us from evil)
--   v.6-9   withdraw from the disorderly; we wrought with labour night and day, an ensample
--           Tanakh: none warranted (the eat-your-own-bread weight carried at v.10-12 / Psalm 128)
--           Extras: none warranted   NT: none warranted
--   v.10-12 if any would not work, neither should he eat; work, and eat their own bread
--           Tanakh: Genesis 3:19 (in the sweat of thy face shalt thou eat bread), Proverbs 10:4
--                   (the hand of the diligent maketh rich), Proverbs 6:6-11 (go to the ant, thou
--                   sluggard), Psalm 128:2 (thou shalt eat the labour of thine hands)
--           Extras: none warranted   NT: none warranted
--   v.13    be not weary in well doing
--           Tanakh: Isaiah 40:31 (they that wait upon Yahuah... shall run, and not be weary)
--           Extras: none warranted   NT: Galatians 6:9 (let us not be weary in well doing)
--   v.14-18 note the disobedient, admonish as a brother, Yahuah of peace, the salutation, the grace
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted
--
-- THREADS (slug -> target libraries):
--   8250 2-thessalonians-3-pray-that-the-word-of-yahuah-run-free-psalm-147   (Tanakh)
--   8253 2-thessalonians-3-yahuah-is-faithful-who-shall-keep-you-from-evil-psalm-121   (Tanakh + NT)
--   8256 2-thessalonians-3-if-any-would-not-work-neither-should-he-eat-genesis-3-proverbs-6   (Tanakh)
--   8259 2-thessalonians-3-be-not-weary-in-well-doing-isaiah-40-galatians-6   (Tanakh + NT)
-- =====================================================================

CREATE TEMP VIEW _s234_t203_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-thessalonians-3-pray-that-the-word-of-yahuah-run-free-psalm-147
  ('canon', '2-thessalonians', 3, 1, 'canon', 'psalms', 147, 15, 'free', E'*He sendeth forth his commandment upon earth: his word runneth very swiftly.* (Psalm 147:15). When Paul asks the assembly to *pray for us, that the word of Yahuah (Lord) may have free course, and be glorified* (2 Thessalonians 3:1), he is asking that the word do what the Psalm says it does: run. The *free course* of the word is the swift running of Psalm 147 — Yahuah (Lord) sends forth his commandment and *his word runneth very swiftly,* outpacing every hindrance. The prayer is not for a new thing but that the same swift word of Yahuah (Lord) run unhindered among the nations as it has always run upon the earth.'),
  ('canon', '2-thessalonians', 3, 1, 'canon', 'psalms', 147, 18, 'free', E'*He sendeth out his word, and melteth them: he causeth his wind to blow, and the waters flow.* (Psalm 147:18). The Psalm shows the word of Yahuah (Lord) as the agent that accomplishes his will — *he sendeth out his word, and melteth them.* This is the word Paul would have run free and *be glorified* (2 Thessalonians 3:1): the sent word that does the sending One''s work, melting the frost, freeing the waters. To pray the word have *free course* is to pray that the effectual word of Yahuah (Lord), which never returns void, be glorified in its running among men.'),
  ('canon', '2-thessalonians', 3, 1, 'canon', 'psalms', 147, 19, 'free', E'*He sheweth his word unto Jacob, his statutes and his judgments unto Yashar''el (Israel).* (Psalm 147:19). The word Yahuah (Lord) sends running swiftly upon the earth is the word he first *sheweth unto Jacob, his statutes and his judgments unto Yashar''el (Israel).* It is no other word that Paul would see glorified — *that the word of Yahuah (Lord) may have free course, and be glorified* (2 Thessalonians 3:1) — than the word given to Yashar''el (Israel), now running out to the grafted-in nations. The free course of the gospel is the statutes and judgments of Yahuah (Lord) carried to the ends of the earth, not a different word replacing the old.'),
  -- thread: 2-thessalonians-3-yahuah-is-faithful-who-shall-keep-you-from-evil-psalm-121
  ('canon', '2-thessalonians', 3, 3, 'canon', 'psalms', 121, 7, 'free', E'*Yahuah (LORD) shall preserve thee from all evil: he shall preserve thy soul.* (Psalm 121:7). Paul''s assurance — *Yahuah (Lord) is faithful, who shall stablish you, and keep you from evil* (2 Thessalonians 3:3) — is the very promise of the Psalm of ascents: *Yahuah (LORD) shall preserve thee from all evil; he shall preserve thy soul.* The keeping from evil is not a hope Paul invents; it is the covenant fidelity of the Keeper of Yashar''el (Israel), who *shall preserve thy going out and thy coming in.* Because Yahuah (Lord) *is faithful,* the keeping is sure.'),
  ('canon', '2-thessalonians', 3, 3, 'canon', 'psalms', 121, 4, 'free', E'*Behold, he that keepeth Yashar''el (Israel) shall neither slumber nor sleep.* (Psalm 121:4). The One who *shall stablish you, and keep you from evil* (2 Thessalonians 3:3) is the sleepless Keeper of the Psalm: *he that keepeth Yashar''el (Israel) shall neither slumber nor sleep.* The faithfulness Paul names is this unwearying watch — the Keeper who never closes his eyes over his people. To be kept from evil is to be kept by the One who keeps Yashar''el (Israel), the same vigilant Yahuah (Lord) over the gathered assembly at Thessalonica.'),
  ('canon', '2-thessalonians', 3, 3, 'canon', 'matthew', 6, 13, 'free', E'*And lead us not into temptation, but deliver us from evil: For thine is the kingdom, and the power, and the glory, for ever. Amen.* (Matthew 6:13). The prayer Yahusha (Jesus) taught ends with the petition Paul declares already answered in the faithful Yahuah (Lord): *deliver us from evil.* Where the disciples pray *deliver us from evil,* Paul assures the assembly that *Yahuah (Lord) is faithful, who shall stablish you, and keep you from evil* (2 Thessalonians 3:3). The deliverance asked in the Master''s prayer is the keeping the faithful One performs; the petition and the promise are one.'),
  -- thread: 2-thessalonians-3-if-any-would-not-work-neither-should-he-eat-genesis-3-proverbs-6
  ('canon', '2-thessalonians', 3, 10, 'canon', 'genesis', 3, 19, 'free', E'*In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return.* (Genesis 3:19). Paul''s rule — *if any would not work, neither should he eat* (2 Thessalonians 3:10) — stands on the word spoken to Adam at the gate of the world: *in the sweat of thy face shalt thou eat bread.* Bread comes to man by labour from the beginning; the one who will not labour has cut himself off from the ordained way bread is eaten. The apostle is not laying a harsh new burden but holding the assembly to the order Yahuah (Lord) set over the earth — bread is the fruit of the sweat of the face.'),
  ('canon', '2-thessalonians', 3, 10, 'canon', 'proverbs', 10, 4, 'free', E'*He becometh poor that dealeth with a slack hand: but the hand of the diligent maketh rich.* (Proverbs 10:4). The wisdom of Proverbs draws the same line Paul draws: *the hand of the diligent maketh rich,* but the slack hand brings poverty. *If any would not work, neither should he eat* (2 Thessalonians 3:10) is the sharp edge of the same teaching — the diligent hand eats its own bread, the slack hand has no claim on another''s table. The apostle speaks the proverb into the assembly: let none deal with a slack hand among the brethren.'),
  ('canon', '2-thessalonians', 3, 11, 'canon', 'proverbs', 6, 6, 'free', E'*Go to the ant, thou sluggard; consider her ways, and be wise:* (Proverbs 6:6). Of the *busybodies* who *walk among you disorderly, working not at all* (2 Thessalonians 3:11), Proverbs has long had the answer: *Go to the ant, thou sluggard.* The ant *provideth her meat in the summer, and gathereth her food in the harvest* (Proverbs 6:8), needing *no guide, overseer, or ruler* — a rebuke to the idle who must be commanded. The sluggard of Proverbs is the disorderly brother of Thessalonica; the wisdom that sends him to the ant is the wisdom Paul presses upon the assembly.'),
  ('canon', '2-thessalonians', 3, 11, 'canon', 'proverbs', 6, 10, 'free', E'*Yet a little sleep, a little slumber, a little folding of the hands to sleep:* (Proverbs 6:10). Proverbs paints the sluggard whose idleness ends in ruin — *a little folding of the hands to sleep: So shall thy poverty come as one that travelleth, and thy want as an armed man* (Proverbs 6:10-11). These are the *working not at all, but are busybodies* (2 Thessalonians 3:11) whom Paul charges to *work, and eat their own bread* (2 Thessalonians 3:12). The folded hands of the sluggard are the working-not-at-all of the disorderly; the apostle calls them out of the slumber Proverbs warned against, into honest labour.'),
  ('canon', '2-thessalonians', 3, 12, 'canon', 'psalms', 128, 2, 'free', E'*For thou shalt eat the labour of thine hands: happy shalt thou be, and it shall be well with thee.* (Psalm 128:2). Paul''s charge that the brethren *work, and eat their own bread* (2 Thessalonians 3:12) is the blessing of the Psalm: *thou shalt eat the labour of thine hands: happy shalt thou be.* To eat one''s own bread is not mere duty but the happiness pronounced on every one *that feareth Yahuah (LORD); that walketh in his ways* (Psalm 128:1). The apostolic order and the Psalm''s blessing meet in the same place — the bread of one''s own labour, eaten with quietness, is the well-being Yahuah (Lord) appoints for the diligent.'),
  -- thread: 2-thessalonians-3-be-not-weary-in-well-doing-isaiah-40-galatians-6
  ('canon', '2-thessalonians', 3, 13, 'canon', 'galatians', 6, 9, 'free', E'*And let us not be weary in well doing: for in due season we shall reap, if we faint not.* (Galatians 6:9). Paul writes the same charge to two assemblies in the same words: *be not weary in well doing* (2 Thessalonians 3:13) and *let us not be weary in well doing* (Galatians 6:9). The reason is the harvest — *in due season we shall reap, if we faint not.* The well-doing is sowing; the not-being-weary is the patience that waits for the reaping. The apostle steadies the gathered against the fainting that lets go before the season of reaping comes.'),
  ('canon', '2-thessalonians', 3, 13, 'canon', 'isaiah', 40, 31, 'free', E'*But they that wait upon Yahuah (LORD) shall renew their strength; they shall mount up with wings as eagles; they shall run, and not be weary; and they shall walk, and not faint.* (Isaiah 40:31). The strength to *be not weary in well doing* (2 Thessalonians 3:13) is the strength Isaiah promises the waiting: *they that wait upon Yahuah (LORD) shall renew their strength... they shall run, and not be weary.* The well-doer does not draw on his own endurance, which fails — *even the youths shall faint and be weary* — but on the renewing strength of the One who *fainteth not, neither is weary* (Isaiah 40:28). To not grow weary in well doing is to wait upon Yahuah (Lord), who gives power to the faint.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s234_t203_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s234_t203_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-thessalonians-3-pray-that-the-word-of-yahuah-run-free-psalm-147',
       E'Pray that the word of Yahuah (Lord) may have free course (Psalm 147)',
       E'Paul opens the closing charge with a request for prayer: *Finally, brethren, pray for us, that the word of Yahuah (Lord) may have free course, and be glorified, even as it is with you* (2 Thessalonians 3:1). The *free course* of the word is the swift running the Psalm sings — *He sendeth forth his commandment upon earth: his word runneth very swiftly* (Psalm 147:15). To pray the word run free is to pray it do what Yahuah (Lord) has always made it do: run, unhindered, upon the earth. And it is the effectual word that accomplishes the sending One''s will — *He sendeth out his word, and melteth them: he causeth his wind to blow, and the waters flow* (Psalm 147:18) — the word that never returns void, now to *be glorified* in its running among men. Nor is it some new word severed from Israel''s Scriptures: it is the word Yahuah (Lord) first *sheweth unto Jacob, his statutes and his judgments unto Yashar''el (Israel)* (Psalm 147:19), now carried out to the grafted-in nations. The prayer Paul asks is that the same swift, effectual, covenant word run free and be glorified, as it had already run among the Thessalonians.',
       sv.verse_id, ev.verse_id, 'free', 8250
  FROM _s234_t203_lookup sv, _s234_t203_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=3 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='2-thessalonians' AND ev.chapter_number=3 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-thessalonians-3-yahuah-is-faithful-who-shall-keep-you-from-evil-psalm-121',
       E'Yahuah (Lord) is faithful, who shall stablish you, and keep you from evil (Psalm 121)',
       E'*But Yahuah (Lord) is faithful, who shall stablish you, and keep you from evil* (2 Thessalonians 3:3). The keeping from evil is no fresh assurance of the apostle''s own making; it is the covenant promise of the Psalm of ascents: *Yahuah (LORD) shall preserve thee from all evil: he shall preserve thy soul* (Psalm 121:7). The One who keeps is the sleepless Keeper — *Behold, he that keepeth Yashar''el (Israel) shall neither slumber nor sleep* (Psalm 121:4) — whose unwearying watch over his people Paul leans on when he says Yahuah (Lord) is *faithful.* The faithfulness and the keeping are the same divine fidelity that guarded Yashar''el (Israel) and now guards the gathered assembly. And the petition the Master taught his disciples — *lead us not into temptation, but deliver us from evil* (Matthew 6:13) — is here declared already answered in the faithful Yahuah (Lord): what the disciples pray, *deliver us from evil,* the Keeper performs, *who shall stablish you, and keep you from evil.* The prayer of the gospel and the promise of the Psalm meet in the one faithful Yahuah (Lord).',
       sv.verse_id, ev.verse_id, 'free', 8253
  FROM _s234_t203_lookup sv, _s234_t203_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=3 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='2-thessalonians' AND ev.chapter_number=3 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-thessalonians-3-if-any-would-not-work-neither-should-he-eat-genesis-3-proverbs-6',
       E'If any would not work, neither should he eat (Genesis 3, Proverbs 6)',
       E'*For even when we were with you, this we commanded you, that if any would not work, neither should he eat* (2 Thessalonians 3:10). The rule is not a harsh apostolic invention but the order Yahuah (Lord) set over the world from the beginning, spoken to Adam at the gate of Eden: *In the sweat of thy face shalt thou eat bread, till thou return unto the ground* (Genesis 3:19). Bread comes to man by labour; the one who will not labour has stepped outside the ordained way bread is eaten. The wisdom of Proverbs draws the same line — *He becometh poor that dealeth with a slack hand: but the hand of the diligent maketh rich* (Proverbs 10:4). And to the *busybodies* who *walk among you disorderly, working not at all* (2 Thessalonians 3:11), Proverbs has long sent its answer: *Go to the ant, thou sluggard; consider her ways, and be wise* (Proverbs 6:6) — the ant who *provideth her meat in the summer* with no overseer to drive her, a rebuke to the idle. The sluggard''s ruin is the *little folding of the hands to sleep* whose end is that *poverty come as one that travelleth* (Proverbs 6:10-11). Against this Paul charges the disorderly to *work, and eat their own bread* (2 Thessalonians 3:12) — and that bread, the Psalm says, is itself a blessing: *thou shalt eat the labour of thine hands: happy shalt thou be, and it shall be well with thee* (Psalm 128:2). The apostolic order and the wisdom of the Tanakh meet in one place: the bread of one''s own labour, eaten with quietness, is the well-being Yahuah (Lord) appoints for the diligent.',
       sv.verse_id, ev.verse_id, 'free', 8256
  FROM _s234_t203_lookup sv, _s234_t203_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=3 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='2-thessalonians' AND ev.chapter_number=3 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-thessalonians-3-be-not-weary-in-well-doing-isaiah-40-galatians-6',
       E'Be not weary in well doing (Isaiah 40, Galatians 6)',
       E'*But ye, brethren, be not weary in well doing* (2 Thessalonians 3:13). Paul writes the same charge to two assemblies in nearly the same words — to the Galatians, *let us not be weary in well doing: for in due season we shall reap, if we faint not* (Galatians 6:9). The well-doing is a sowing, and the not-being-weary is the patience that waits for the reaping; the apostle steadies the gathered against the fainting that lets go before the harvest comes. And the strength to endure is not the well-doer''s own, which fails — *even the youths shall faint and be weary* — but the renewing strength of Yahuah (Lord) himself, who *fainteth not, neither is weary* (Isaiah 40:28): *they that wait upon Yahuah (LORD) shall renew their strength; they shall mount up with wings as eagles; they shall run, and not be weary; and they shall walk, and not faint* (Isaiah 40:31). To not grow weary in well doing is to wait upon Yahuah (Lord), who gives power to the faint. The apostolic exhortation and the prophet''s promise are one: the well-doer who waits on Yahuah (Lord) runs and is not weary, and in due season reaps, if he faint not.',
       sv.verse_id, ev.verse_id, 'free', 8259
  FROM _s234_t203_lookup sv, _s234_t203_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=3 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='2-thessalonians' AND ev.chapter_number=3 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-thessalonians-3-pray-that-the-word-of-yahuah-run-free-psalm-147
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 147:15 — *his word runneth very swiftly* the swift-running word behind the *free course* Paul prays for; *that the word of Yahuah (Lord) may have free course, and be glorified* (2 Thessalonians 3:1).'
  FROM cross_reference_threads t, cross_references x, _s234_t203_lookup sv, _s234_t203_lookup tv
 WHERE t.slug='2-thessalonians-3-pray-that-the-word-of-yahuah-run-free-psalm-147'
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=3 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=147 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 147:18 — *He sendeth out his word, and melteth them* the effectual word that does Yahuah (Lord)''s work, which Paul would see glorified in its free course (2 Thessalonians 3:1).'
  FROM cross_reference_threads t, cross_references x, _s234_t203_lookup sv, _s234_t203_lookup tv
 WHERE t.slug='2-thessalonians-3-pray-that-the-word-of-yahuah-run-free-psalm-147'
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=3 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=147 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 147:19 — *He sheweth his word unto Jacob, his statutes and his judgments unto Yashar''el (Israel)* the word given to Yashar''el (Israel), now running out to the nations; no other word has *free course* (2 Thessalonians 3:1).'
  FROM cross_reference_threads t, cross_references x, _s234_t203_lookup sv, _s234_t203_lookup tv
 WHERE t.slug='2-thessalonians-3-pray-that-the-word-of-yahuah-run-free-psalm-147'
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=3 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=147 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-thessalonians-3-yahuah-is-faithful-who-shall-keep-you-from-evil-psalm-121
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 121:7 — *Yahuah (LORD) shall preserve thee from all evil: he shall preserve thy soul* the covenant promise behind Paul''s assurance; *Yahuah (Lord) is faithful, who shall stablish you, and keep you from evil* (2 Thessalonians 3:3).'
  FROM cross_reference_threads t, cross_references x, _s234_t203_lookup sv, _s234_t203_lookup tv
 WHERE t.slug='2-thessalonians-3-yahuah-is-faithful-who-shall-keep-you-from-evil-psalm-121'
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=3 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=121 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 121:4 — *he that keepeth Yashar''el (Israel) shall neither slumber nor sleep* the sleepless Keeper whose unwearying watch is the faithfulness Paul names (2 Thessalonians 3:3).'
  FROM cross_reference_threads t, cross_references x, _s234_t203_lookup sv, _s234_t203_lookup tv
 WHERE t.slug='2-thessalonians-3-yahuah-is-faithful-who-shall-keep-you-from-evil-psalm-121'
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=3 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=121 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 6:13 — *deliver us from evil* the petition the Master taught, declared already answered in the faithful Yahuah (Lord) who shall *keep you from evil* (2 Thessalonians 3:3).'
  FROM cross_reference_threads t, cross_references x, _s234_t203_lookup sv, _s234_t203_lookup tv
 WHERE t.slug='2-thessalonians-3-yahuah-is-faithful-who-shall-keep-you-from-evil-psalm-121'
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=3 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=6 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-thessalonians-3-if-any-would-not-work-neither-should-he-eat-genesis-3-proverbs-6
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:19 — *In the sweat of thy face shalt thou eat bread* the ordained order that bread comes by labour, behind *if any would not work, neither should he eat* (2 Thessalonians 3:10).'
  FROM cross_reference_threads t, cross_references x, _s234_t203_lookup sv, _s234_t203_lookup tv
 WHERE t.slug='2-thessalonians-3-if-any-would-not-work-neither-should-he-eat-genesis-3-proverbs-6'
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=3 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 10:4 — *the hand of the diligent maketh rich* the diligent-vs-slack line that is the sharp edge of Paul''s rule (2 Thessalonians 3:10).'
  FROM cross_reference_threads t, cross_references x, _s234_t203_lookup sv, _s234_t203_lookup tv
 WHERE t.slug='2-thessalonians-3-if-any-would-not-work-neither-should-he-eat-genesis-3-proverbs-6'
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=3 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=10 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 6:6 — *Go to the ant, thou sluggard; consider her ways, and be wise* the answer to the *busybodies, working not at all* (2 Thessalonians 3:11).'
  FROM cross_reference_threads t, cross_references x, _s234_t203_lookup sv, _s234_t203_lookup tv
 WHERE t.slug='2-thessalonians-3-if-any-would-not-work-neither-should-he-eat-genesis-3-proverbs-6'
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=3 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=6 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 6:10 — *a little folding of the hands to sleep* the sluggard''s idleness whose end is poverty, the working-not-at-all of the disorderly (2 Thessalonians 3:11).'
  FROM cross_reference_threads t, cross_references x, _s234_t203_lookup sv, _s234_t203_lookup tv
 WHERE t.slug='2-thessalonians-3-if-any-would-not-work-neither-should-he-eat-genesis-3-proverbs-6'
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=3 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=6 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Psalm 128:2 — *thou shalt eat the labour of thine hands: happy shalt thou be* the blessing on the bread of one''s own labour, behind *work, and eat their own bread* (2 Thessalonians 3:12).'
  FROM cross_reference_threads t, cross_references x, _s234_t203_lookup sv, _s234_t203_lookup tv
 WHERE t.slug='2-thessalonians-3-if-any-would-not-work-neither-should-he-eat-genesis-3-proverbs-6'
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=3 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=128 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-thessalonians-3-be-not-weary-in-well-doing-isaiah-40-galatians-6
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Galatians 6:9 — *let us not be weary in well doing: for in due season we shall reap, if we faint not* the same charge Paul writes to two assemblies; *be not weary in well doing* (2 Thessalonians 3:13).'
  FROM cross_reference_threads t, cross_references x, _s234_t203_lookup sv, _s234_t203_lookup tv
 WHERE t.slug='2-thessalonians-3-be-not-weary-in-well-doing-isaiah-40-galatians-6'
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=3 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=6 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 40:31 — *they that wait upon Yahuah (LORD) shall renew their strength... they shall run, and not be weary* the renewing strength of the One who fainteth not, behind *be not weary in well doing* (2 Thessalonians 3:13).'
  FROM cross_reference_threads t, cross_references x, _s234_t203_lookup sv, _s234_t203_lookup tv
 WHERE t.slug='2-thessalonians-3-be-not-weary-in-well-doing-isaiah-40-galatians-6'
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=3 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=40 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
