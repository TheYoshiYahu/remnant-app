-- ----- fragment: minion_romans_14.sql (S219 Romans 14) -----
-- =====================================================================
-- S219 minion — ROMANS 14 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: ROMANS 14.  Tag: r14 (temp view _s219_r14_lookup).  Sort band: 6325, step 3, <6350.
-- Source is ALWAYS the canon Romans verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (VOICE-RISK WATCHPOINT — Red Lines #4/#5/#6): Romans 14 is about DISPUTABLE
-- MATTERS within the gathered assembly — fast-days, food offered to idols, the weak conscience
-- eating only herbs — NOT the annulment of the commandments. The chapter is read here strictly
-- against the antichrist reading:
--   14:1-3  *another, who is weak, eateth herbs* — the WEAK conscience abstaining from
--           marketplace meat of uncertain slaughter / offered to idols (the same case Daniel
--           refused at Babylon, the same the captives of Tobit and Judith refused at the
--           heathen table), NOT a debate over the Torah''s clean/unclean distinction. NOT
--           "the clean-food law is abolished."
--   14:5    *One man esteemeth one day above another* — disputed fast-days / days of personal
--           devotion, NOT the Sabbath or the moedim. NO thread frames the Sabbath/feasts as
--           annulled.
--   14:14   *there is nothing unclean of itself* — food common/profane by association
--           (idol-meat, conscience); the koinos (common) sense, not the Torah''s tahor/tamei.
--           About not wounding the weak brother''s conscience, NOT a declaration that swine
--           is now food.
--   14:10-12 the judgment seat / *every knee shall bow* (Isaiah 45:23) — all give account to
--           Elohim, so judge not the brother. James 4:11 binds judging the brother to judging
--           THE LAW — the chapter forbids the judging, it does not loose the law.
-- The governing principle: *let every man be fully persuaded in his own mind* (14:5); *the
-- kingdom of Elohim (God) is not meat and drink; but righteousness, and peace, and joy in the
-- Ruach HaKodesh (Holy Spirit)* (14:17); *whatsoever is not of faith is sin* (14:23). Charity
-- toward the weak brother is the point.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-3   weak in faith eateth herbs        Tanakh: none warranted (the case is conscience, not a Torah dispute)  Extras: Tobit 1:10-11, Judith 12:1-2 (captives refusing the heathen table)  NT: 1 Corinthians 8:7, 8:8 (the weak conscience / meat commendeth us not)
--   v.4     another man''s servant             Tanakh: none warranted  Extras: none warranted  NT: James 4:11, Matthew 7:1 (judge not — and judging the brother is judging the law)
--   v.5-9   esteemeth the day / unto the Lord  Tanakh: none warranted (NOT the Sabbath/feasts)  Extras: none warranted  NT: none warranted (epistolary; the Lord-of-dead-and-living carried at 14:9)
--   v.10-12 the judgment seat / every knee     Tanakh: Isaiah 45:23 (every knee shall bow)  Extras: none warranted  NT: 2 Corinthians 5:10 (judgment seat), Philippians 2:10, 2:11 (every knee, every tongue)
--   v.13-16 stumblingblock / nothing common    Tanakh: none warranted  Extras: none warranted  NT: 1 Corinthians 8:11, 8:12 (the weak brother for whom Messiah died), 1 Corinthians 10:28 (eat not for conscience sake)
--   v.17-21 kingdom not meat and drink         Tanakh: none warranted  Extras: none warranted  NT: 1 Corinthians 8:8 (meat commendeth us not), 1 Corinthians 8:13 (eat no flesh lest I offend)
--   v.22-23 not of faith is sin                Tanakh: none warranted  Extras: none warranted  NT: none added (fully-persuaded conscience carried at 14:5)
--
-- THREADS (slug -> target libraries):
--   6325 romans-14-receive-him-that-is-weak-in-the-faith-the-weak-conscience          (Extras + NT)
--   6328 romans-14-to-his-own-master-he-standeth-or-falleth-judge-not-the-brother     (NT)
--   6331 romans-14-every-knee-shall-bow-the-judgment-seat-of-messiah                  (Tanakh + NT)
--   6334 romans-14-there-is-nothing-common-of-itself-the-weak-brother-and-idol-food   (NT)
--   6337 romans-14-the-kingdom-of-god-is-not-meat-and-drink                           (NT)
--   6340 romans-14-whatsoever-is-not-of-faith-is-sin-fully-persuaded                  (free, Romans-internal anchor only)
-- =====================================================================

CREATE TEMP VIEW _s219_r14_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: romans-14-receive-him-that-is-weak-in-the-faith-the-weak-conscience
  ('canon', 'romans', 14, 2, 'apocrypha', 'tobit', 1, 10, 'extras', E'*And when we were carried away captives to Nineve, all my brethren, and those that were of my kindred, did eat of the bread of the Gentiles.* (Tobit 1:10). *For one believeth that he may eat all things: another, who is weak, eateth herbs* (Romans 14:2). The weak brother who *eateth herbs* is doing in Rome what Tobit did in the captivity — refusing the meat of the heathen table, whose slaughter and offering could not be trusted. The abstaining is a conscience guarding itself from defilement by association, not a verdict that the Torah''s own clean food had changed.'),
  ('canon', 'romans', 14, 2, 'apocrypha', 'tobit', 1, 11, 'extras', E'*But I kept myself from eating;* (Tobit 1:11). The one who *eateth herbs* (Romans 14:2) keeps the same fence Tobit kept: *I kept myself from eating.* In a land of idol-tables and untrusted slaughter, the weak conscience withdraws to what it knows is safe — vegetables, the pulse Daniel asked for. Paul does not scold the abstainer; he tells the strong to *receive* him (Romans 14:1). The herbs are the mark of a careful conscience, not of a man who thinks the commandments have been loosed.'),
  ('canon', 'romans', 14, 2, 'apocrypha', 'judith', 12, 2, 'extras', E'*And Judith said, I will not eat thereof, lest there be an offence: but provision shall be made for me of the things that I have brought.* (Judith 12:2). The weak who *eateth herbs* (Romans 14:2) refuses the table of another exactly as Judith refused Holofernes'' meat — *lest there be an offence* — and ate only of her own provision. The case in Romans 14 is this same case: food set before a believer in a world full of idol-offerings, and a conscience that will not risk defilement. It is not a dispute about whether Yahuah''s (God''s) clean food is still clean.'),
  ('canon', 'romans', 14, 1, 'canon', '1-corinthians', 8, 7, 'free', E'*Howbeit there is not in every man that knowledge: for some with conscience of the idol unto this hour eat it as a thing offered unto an idol; and their conscience being weak is defiled.* (1 Corinthians 8:7). *Him that is weak in the faith receive ye, but not to doubtful disputations* (Romans 14:1). Paul names the same weak one in both letters: the brother whose *conscience being weak is defiled* by the idol-meat. The weakness is not ignorance of liberty to transgress the Torah — it is a tender conscience near the idol''s table. He is to be received, not despised.'),
  ('canon', 'romans', 14, 3, 'canon', '1-corinthians', 8, 8, 'free', E'*But meat commendeth us not to Elohim (God): for neither, if we eat, are we the better; neither, if we eat not, are we the worse.* (1 Corinthians 8:8). *Let not him that eateth despise him that eateth not; and let not him which eateth not judge him that eateth: for Elohim (God) hath received him* (Romans 14:3). The eater and the abstainer are forbidden to despise or judge one another because *meat commendeth us not to Elohim (God)* — the question between them is not righteousness but charity. Elohim has received them both; so must they receive each other.'),
  -- thread: romans-14-to-his-own-master-he-standeth-or-falleth-judge-not-the-brother
  ('canon', 'romans', 14, 4, 'canon', 'james', 4, 11, 'free', E'*Speak not evil one of another, brethren. He that speaketh evil of his brother, and judgeth his brother, speaketh evil of the law, and judgeth the law: but if thou judge the law, thou art not a doer of the law, but a judge.* (James 4:11). *Who art thou that judgest another man''s servant? to his own master he standeth or falleth* (Romans 14:4). The brother is not ours to judge — he stands or falls to his own Master. And the danger James names guards the watchpoint of the whole chapter: the one who sets himself up to judge his brother ends by judging *the law* itself, putting himself over it instead of under it as a doer. The chapter forbids the judging; it does not loose the commandment.'),
  ('canon', 'romans', 14, 4, 'canon', 'matthew', 7, 1, 'free', E'*Judge not, that ye be not judged.* (Matthew 7:1). *Who art thou that judgest another man''s servant?* (Romans 14:4). The Master''s own word stands behind Paul''s rebuke: *judge not.* The servant answers to his own Lord, who *is able to make him stand* (Romans 14:4); to seize the seat of judgment over a brother in a disputable matter is to take a seat that is not ours.'),
  -- thread: romans-14-every-knee-shall-bow-the-judgment-seat-of-messiah
  ('canon', 'romans', 14, 11, 'canon', 'isaiah', 45, 23, 'free', E'*I have sworn by myself, the word is gone out of my mouth in righteousness, and shall not return, That unto me every knee shall bow, every tongue shall swear.* (Isaiah 45:23). *For it is written, As I live, saith Yahuah (Lord), every knee shall bow to me, and every tongue shall confess to Elohim (God)* (Romans 14:11). Paul quotes the prophet word for word. The One who swore *by myself* — *a just Elohim (God) and a Saviour; there is none beside me* (Isaiah 45:21) — is the One before whom *every knee shall bow.* If all must bow and give account to him, no brother is fit to sit in judgment over another; the seat belongs to Elohim alone.'),
  ('canon', 'romans', 14, 10, 'canon', '2-corinthians', 5, 10, 'free', E'*For we must all appear before the judgment seat of Messiah (Christ); that every one may receive the things done in his body, according to that he hath done, whether it be good or bad.* (2 Corinthians 5:10). *But why dost thou judge thy brother? or why dost thou set at nought thy brother? for we shall all stand before the judgment seat of Messiah (Christ)* (Romans 14:10). The same judgment seat is named in both letters. Because *we must all appear* there and each give account, the brother who judges his brother usurps the place of the only Judge — the Formed who *both died, and rose, and revived, that he might be Yahuah (Lord) both of the dead and living* (Romans 14:9).'),
  ('canon', 'romans', 14, 11, 'canon', 'philippians', 2, 10, 'free', E'*That at the name of Yahusha (Jesus) every knee should bow, of things in heaven, and things in earth, and things under the earth;* (Philippians 2:10). *Every knee shall bow to me, and every tongue shall confess to Elohim (God)* (Romans 14:11). The bowing of every knee that Isaiah swore belongs to Yahusha (Jesus) — the Formed who *humbled himself, and became obedient unto death* and was therefore highly exalted (Philippians 2:8-9). The knee that bows to Yahuah in the prophet bows at the name of Yahusha in the apostle, for he is the Formed Yahuah come in flesh; and before him every account is given.'),
  ('canon', 'romans', 14, 11, 'canon', 'philippians', 2, 11, 'free', E'*And that every tongue should confess that Yahusha HaMashiach (Jesus Christ) is Lord, to the glory of Elohim (God) the Father.* (Philippians 2:11). *Every tongue shall confess to Elohim (God)* (Romans 14:11). The confessing tongue of Isaiah''s oath is the confessing tongue of Philippians: *every tongue should confess that Yahusha HaMashiach (Jesus Christ) is Lord, to the glory of Elohim (God) the Father.* The Son receives the homage the prophet swore to Yahuah, and it redounds to the glory of the Father — the Formed and the Formless, never against each other.'),
  -- thread: romans-14-there-is-nothing-common-of-itself-the-weak-brother-and-idol-food
  ('canon', 'romans', 14, 15, 'canon', '1-corinthians', 8, 11, 'free', E'*And through thy knowledge shall the weak brother perish, for whom Messiah (Christ) died?* (1 Corinthians 8:11). *But if thy brother be grieved with thy meat, now walkest thou not charitably. Destroy not him with thy meat, for whom Messiah (Christ) died* (Romans 14:15). The same warning, almost the same words: do not *destroy* with meat the brother *for whom Messiah (Christ) died.* The thing in dispute is meat near the idol''s table; the thing not in dispute is the brother''s soul. Charity will not trade a brother''s conscience for a plate of food.'),
  ('canon', 'romans', 14, 13, 'canon', '1-corinthians', 8, 12, 'free', E'*But when ye sin so against the brethren, and wound their weak conscience, ye sin against Messiah (Christ).* (1 Corinthians 8:12). *Judge this rather, that no man put a stumblingblock or an occasion to fall in his brother''s way* (Romans 14:13). To lay a stumblingblock before the weak brother is to *wound their weak conscience* — and Paul says plainly that to wound it is to *sin against Messiah (Christ).* The stumblingblock Romans forbids is not a Torah-keeping scruple to be mocked; it is a conscience the strong are bound to protect.'),
  ('canon', 'romans', 14, 14, 'canon', '1-corinthians', 10, 28, 'free', E'*But if any man say unto you, This is offered in sacrifice unto idols, eat not for his sake that shewed it, and for conscience sake: for the earth is Yahuah''s (Lord''s), and the fulness thereof:* (1 Corinthians 10:28). *I know, and am persuaded by the Lord Yahusha (Lord Jesus), that there is nothing unclean of itself: but to him that esteemeth any thing to be unclean, to him it is unclean* (Romans 14:14). The other letter shows exactly what the common-by-association case is: meat that is nothing in itself becomes off-limits the moment it is named *offered in sacrifice unto idols* — *eat not … for conscience sake.* The food is made common not by the Torah''s tahor/tamei line but by the idol-attachment and the brother''s conscience. That is the *unclean of itself* Paul means.'),
  -- thread: romans-14-the-kingdom-of-god-is-not-meat-and-drink
  ('canon', 'romans', 14, 17, 'canon', '1-corinthians', 8, 8, 'free', E'*But meat commendeth us not to Elohim (God): for neither, if we eat, are we the better; neither, if we eat not, are we the worse.* (1 Corinthians 8:8). *For the kingdom of Elohim (God) is not meat and drink; but righteousness, and peace, and joy in the Ruach HaKodesh (Holy Spirit)* (Romans 14:17). Because *meat commendeth us not to Elohim (God),* the kingdom is not weighed in what is eaten or refused. It is weighed in *righteousness, and peace, and joy in the Ruach HaKodesh (Holy Spirit)* — and so the strong are to spend their liberty on peace and edifying, never on wounding a brother over a plate.'),
  ('canon', 'romans', 14, 21, 'canon', '1-corinthians', 8, 13, 'free', E'*Wherefore, if meat make my brother to offend, I will eat no flesh while the world standeth, lest I make my brother to offend.* (1 Corinthians 8:13). *It is good neither to eat flesh, nor to drink wine, nor any thing whereby thy brother stumbleth, or is offended, or is made weak* (Romans 14:21). Paul lives out the very rule he gives Rome: he will *eat no flesh while the world standeth* sooner than make a brother stumble. The freedom is real, but love lays it down — the strong yields the disputable thing for the sake of the weak.'),
  -- thread: romans-14-whatsoever-is-not-of-faith-is-sin-fully-persuaded
  ('canon', 'romans', 14, 23, 'canon', '1-corinthians', 8, 7, 'free', E'*Howbeit there is not in every man that knowledge: for some with conscience of the idol unto this hour eat it as a thing offered unto an idol; and their conscience being weak is defiled.* (1 Corinthians 8:7). *And he that doubteth is damned if he eat, because he eateth not of faith: for whatsoever is not of faith is sin* (Romans 14:23). The doubting eater of Romans is the weak-conscienced eater of Corinth whose *conscience being weak is defiled.* To act against one''s own persuaded conscience — to eat while doubting — is itself the sin, *for whatsoever is not of faith is sin.* This is why each must be *fully persuaded in his own mind* (Romans 14:5), and why the strong must never push the weak past his conscience.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s219_r14_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s219_r14_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-14-receive-him-that-is-weak-in-the-faith-the-weak-conscience',
       E'Receive him that is weak in the faith — the weak conscience eating herbs',
       E'*Him that is weak in the faith receive ye, but not to doubtful disputations. For one believeth that he may eat all things: another, who is weak, eateth herbs* (Romans 14:1-2). The weak brother who eats only herbs is not a man who thinks the commandments are loosed; he is a careful conscience in a world full of idol-tables and untrusted slaughter, withdrawing to what he knows is safe. The captives did the same: *when we were carried away captives to Nineve, all my brethren … did eat of the bread of the Gentiles. But I kept myself from eating* (Tobit 1:10-11); and Judith, set before the heathen''s meat, answered, *I will not eat thereof, lest there be an offence: but provision shall be made for me of the things that I have brought* (Judith 12:2). The same weak one is named in Corinth: *some with conscience of the idol unto this hour eat it as a thing offered unto an idol; and their conscience being weak is defiled* (1 Corinthians 8:7). And the reason the eater and the abstainer must not despise or judge each other is that the question between them is charity, not righteousness: *meat commendeth us not to Elohim (God): for neither, if we eat, are we the better; neither, if we eat not, are we the worse* (1 Corinthians 8:8). *Elohim (God) hath received him* (Romans 14:3) — so must they receive one another.',
       sv.verse_id, ev.verse_id, 'extras', 6325
  FROM _s219_r14_lookup sv, _s219_r14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=14 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=14 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-14-to-his-own-master-he-standeth-or-falleth-judge-not-the-brother',
       E'To his own master he standeth or falleth — judge not the brother',
       E'*Who art thou that judgest another man''s servant? to his own master he standeth or falleth. Yea, he shall be holden up: for Elohim (God) is able to make him stand* (Romans 14:4). The brother in a disputable matter is not ours to judge; he answers to his own Master, who is able to hold him up. The Master himself set the rule: *Judge not, that ye be not judged* (Matthew 7:1). And there is a deeper danger that guards the whole watchpoint of this chapter: *he that speaketh evil of his brother, and judgeth his brother, speaketh evil of the law, and judgeth the law: but if thou judge the law, thou art not a doer of the law, but a judge* (James 4:11). The one who sets himself over his brother in these matters ends by setting himself over the law — taking a seat above it instead of standing under it as a doer. The chapter forbids the judging of the brother; it never looses the commandment. Both are kept by refusing the seat of judgment.',
       sv.verse_id, ev.verse_id, 'free', 6328
  FROM _s219_r14_lookup sv, _s219_r14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=14 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=14 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-14-every-knee-shall-bow-the-judgment-seat-of-messiah',
       E'Every knee shall bow — the judgment seat of Messiah (Christ)',
       E'*But why dost thou judge thy brother? or why dost thou set at nought thy brother? for we shall all stand before the judgment seat of Messiah (Christ)* (Romans 14:10). The ground for laying down judgment of the brother is that all alike must give account before the only Judge. Paul presses it with the prophet''s oath quoted word for word: *As I live, saith Yahuah (Lord), every knee shall bow to me, and every tongue shall confess to Elohim (God)* (Romans 14:11), which Isaiah swore — *I have sworn by myself … That unto me every knee shall bow, every tongue shall swear* (Isaiah 45:23), the oath of the One who is *a just Elohim (God) and a Saviour; there is none beside me* (Isaiah 45:21). That bowing belongs to Yahusha (Jesus), the Formed Yahuah come in flesh: *at the name of Yahusha (Jesus) every knee should bow … and that every tongue should confess that Yahusha HaMashiach (Jesus Christ) is Lord, to the glory of Elohim (God) the Father* (Philippians 2:10-11). And the seat is named again: *we must all appear before the judgment seat of Messiah (Christ); that every one may receive the things done in his body* (2 Corinthians 5:10). *So then every one of us shall give account of himself to Elohim (God)* (Romans 14:12) — which is exactly why no brother may take the judgment seat over another.',
       sv.verse_id, ev.verse_id, 'free', 6331
  FROM _s219_r14_lookup sv, _s219_r14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=14 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=14 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-14-there-is-nothing-common-of-itself-the-weak-brother-and-idol-food',
       E'There is nothing common of itself — the weak brother and idol-food',
       E'*Let us not therefore judge one another any more: but judge this rather, that no man put a stumblingblock or an occasion to fall in his brother''s way* (Romans 14:13). *I know, and am persuaded by the Lord Yahusha (Lord Jesus), that there is nothing unclean of itself: but to him that esteemeth any thing to be unclean, to him it is unclean* (Romans 14:14). The other letter shows precisely what this common-by-association case is. Meat that is nothing in itself becomes off-limits the moment it is named at the table: *if any man say unto you, This is offered in sacrifice unto idols, eat not for his sake that shewed it, and for conscience sake* (1 Corinthians 10:28). The food is made common not by the Torah''s clean/unclean line but by the idol-attachment and the brother''s wounded conscience. And to wound that conscience is no light thing: *when ye sin so against the brethren, and wound their weak conscience, ye sin against Messiah (Christ)* (1 Corinthians 8:12). So the warning is the same in both letters: *Destroy not him with thy meat, for whom Messiah (Christ) died* (Romans 14:15) — *through thy knowledge shall the weak brother perish, for whom Messiah (Christ) died?* (1 Corinthians 8:11). Charity will not trade a brother''s soul for a plate of food.',
       sv.verse_id, ev.verse_id, 'free', 6334
  FROM _s219_r14_lookup sv, _s219_r14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=14 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=14 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-14-the-kingdom-of-god-is-not-meat-and-drink',
       E'The kingdom of Elohim (God) is not meat and drink',
       E'*For the kingdom of Elohim (God) is not meat and drink; but righteousness, and peace, and joy in the Ruach HaKodesh (Holy Spirit)* (Romans 14:17). The whole weight of the dispute is lifted off the plate and set on the walk. Because *meat commendeth us not to Elohim (God): for neither, if we eat, are we the better; neither, if we eat not, are we the worse* (1 Corinthians 8:8), the kingdom is never weighed in what is eaten or refused — it is weighed in righteousness, peace, and joy in the Ruach HaKodesh (Holy Spirit). So the charge follows: *let us therefore follow after the things which make for peace, and things wherewith one may edify another. For meat destroy not the work of Elohim (God)* (Romans 14:19-20). And Paul models it: *it is good neither to eat flesh, nor to drink wine, nor any thing whereby thy brother stumbleth* (Romans 14:21) — *if meat make my brother to offend, I will eat no flesh while the world standeth, lest I make my brother to offend* (1 Corinthians 8:13). The liberty is real; love lays it down for the weak.',
       sv.verse_id, ev.verse_id, 'free', 6337
  FROM _s219_r14_lookup sv, _s219_r14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=14 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=14 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-14-whatsoever-is-not-of-faith-is-sin-fully-persuaded',
       E'Whatsoever is not of faith is sin — fully persuaded in his own mind',
       E'*Hast thou faith? have it to thyself before Elohim (God). Happy is he that condemneth not himself in that thing which he alloweth. And he that doubteth is damned if he eat, because he eateth not of faith: for whatsoever is not of faith is sin* (Romans 14:22-23). The governing principle of the chapter — *let every man be fully persuaded in his own mind* (Romans 14:5) — comes to its point here. The doubting eater is the weak-conscienced eater of Corinth: *some with conscience of the idol unto this hour eat it as a thing offered unto an idol; and their conscience being weak is defiled* (1 Corinthians 8:7). To act against one''s own persuaded conscience — to eat while doubting — is itself the sin, for whatsoever is not of faith is sin. This is why the strong must never drag the weak past his conscience, and why the matter must be settled before Elohim (God) in each man''s own persuasion, not by the judgment of his brother.',
       sv.verse_id, ev.verse_id, 'free', 6340
  FROM _s219_r14_lookup sv, _s219_r14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=14 AND sv.verse_number=22
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=14 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: romans-14-receive-him-that-is-weak-in-the-faith-the-weak-conscience
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Tobit 1:10 — *all my brethren … did eat of the bread of the Gentiles* the captive''s case behind the weak who eateth herbs: the heathen table refused (Romans 14:2).'
  FROM cross_reference_threads t, cross_references x, _s219_r14_lookup sv, _s219_r14_lookup tv
 WHERE t.slug='romans-14-receive-him-that-is-weak-in-the-faith-the-weak-conscience'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=14 AND sv.verse_number=2
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=1 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Tobit 1:11 — *But I kept myself from eating* the same fence the herb-eater keeps in a land of untrusted slaughter, a careful conscience not a loosed commandment (Romans 14:2).'
  FROM cross_reference_threads t, cross_references x, _s219_r14_lookup sv, _s219_r14_lookup tv
 WHERE t.slug='romans-14-receive-him-that-is-weak-in-the-faith-the-weak-conscience'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=14 AND sv.verse_number=2
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=1 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Judith 12:2 — *I will not eat thereof, lest there be an offence* the weak refuses another''s table exactly as Judith refused Holofernes'' meat (Romans 14:2).'
  FROM cross_reference_threads t, cross_references x, _s219_r14_lookup sv, _s219_r14_lookup tv
 WHERE t.slug='romans-14-receive-him-that-is-weak-in-the-faith-the-weak-conscience'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=14 AND sv.verse_number=2
   AND tv.edition_slug='apocrypha' AND tv.book_slug='judith' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Corinthians 8:7 — *their conscience being weak is defiled* the same weak one to be received, a tender conscience near the idol''s table (Romans 14:1).'
  FROM cross_reference_threads t, cross_references x, _s219_r14_lookup sv, _s219_r14_lookup tv
 WHERE t.slug='romans-14-receive-him-that-is-weak-in-the-faith-the-weak-conscience'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=14 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=8 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Corinthians 8:8 — *meat commendeth us not to Elohim (God)* the eater and abstainer forbidden to despise or judge; the question is charity, not righteousness (Romans 14:3).'
  FROM cross_reference_threads t, cross_references x, _s219_r14_lookup sv, _s219_r14_lookup tv
 WHERE t.slug='romans-14-receive-him-that-is-weak-in-the-faith-the-weak-conscience'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=14 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=8 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-14-to-his-own-master-he-standeth-or-falleth-judge-not-the-brother
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'James 4:11 — *he that … judgeth his brother … judgeth the law … not a doer of the law, but a judge* judging the brother ends by judging the law; the chapter forbids the judging, not the commandment (Romans 14:4).'
  FROM cross_reference_threads t, cross_references x, _s219_r14_lookup sv, _s219_r14_lookup tv
 WHERE t.slug='romans-14-to-his-own-master-he-standeth-or-falleth-judge-not-the-brother'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=14 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=4 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 7:1 — *Judge not, that ye be not judged* the Master''s own word behind Paul''s rebuke: the servant answers to his own Lord (Romans 14:4).'
  FROM cross_reference_threads t, cross_references x, _s219_r14_lookup sv, _s219_r14_lookup tv
 WHERE t.slug='romans-14-to-his-own-master-he-standeth-or-falleth-judge-not-the-brother'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=14 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-14-every-knee-shall-bow-the-judgment-seat-of-messiah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Corinthians 5:10 — *we must all appear before the judgment seat of Messiah (Christ)* the same seat: each gives account, so none may judge the brother (Romans 14:10).'
  FROM cross_reference_threads t, cross_references x, _s219_r14_lookup sv, _s219_r14_lookup tv
 WHERE t.slug='romans-14-every-knee-shall-bow-the-judgment-seat-of-messiah'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=14 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=5 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 45:23 — *unto me every knee shall bow, every tongue shall swear* the prophet''s oath Paul quotes word for word; the Saviour before whom all bow (Romans 14:11).'
  FROM cross_reference_threads t, cross_references x, _s219_r14_lookup sv, _s219_r14_lookup tv
 WHERE t.slug='romans-14-every-knee-shall-bow-the-judgment-seat-of-messiah'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=14 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=45 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Philippians 2:10 — *at the name of Yahusha (Jesus) every knee should bow* the bowing Isaiah swore to Yahuah belongs to Yahusha, the Formed Yahuah come in flesh (Romans 14:11).'
  FROM cross_reference_threads t, cross_references x, _s219_r14_lookup sv, _s219_r14_lookup tv
 WHERE t.slug='romans-14-every-knee-shall-bow-the-judgment-seat-of-messiah'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=14 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Philippians 2:11 — *every tongue should confess that Yahusha HaMashiach (Jesus Christ) is Lord, to the glory of Elohim (God) the Father* the confessing tongue of Isaiah''s oath, redounding to the Father''s glory (Romans 14:11).'
  FROM cross_reference_threads t, cross_references x, _s219_r14_lookup sv, _s219_r14_lookup tv
 WHERE t.slug='romans-14-every-knee-shall-bow-the-judgment-seat-of-messiah'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=14 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-14-there-is-nothing-common-of-itself-the-weak-brother-and-idol-food
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Corinthians 8:12 — *wound their weak conscience, ye sin against Messiah (Christ)* the stumblingblock is a conscience the strong are bound to protect (Romans 14:13).'
  FROM cross_reference_threads t, cross_references x, _s219_r14_lookup sv, _s219_r14_lookup tv
 WHERE t.slug='romans-14-there-is-nothing-common-of-itself-the-weak-brother-and-idol-food'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=14 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=8 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Corinthians 10:28 — *This is offered in sacrifice unto idols, eat not … for conscience sake* food made common by idol-attachment, not by the Torah''s clean/unclean line (Romans 14:14).'
  FROM cross_reference_threads t, cross_references x, _s219_r14_lookup sv, _s219_r14_lookup tv
 WHERE t.slug='romans-14-there-is-nothing-common-of-itself-the-weak-brother-and-idol-food'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=14 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=10 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Corinthians 8:11 — *through thy knowledge shall the weak brother perish, for whom Messiah (Christ) died?* the same warning: charity will not trade a brother''s soul for food (Romans 14:15).'
  FROM cross_reference_threads t, cross_references x, _s219_r14_lookup sv, _s219_r14_lookup tv
 WHERE t.slug='romans-14-there-is-nothing-common-of-itself-the-weak-brother-and-idol-food'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=14 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=8 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-14-the-kingdom-of-god-is-not-meat-and-drink
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Corinthians 8:8 — *meat commendeth us not to Elohim (God)* the kingdom is not weighed in what is eaten; it is righteousness, peace, and joy in the Ruach HaKodesh (Holy Spirit) (Romans 14:17).'
  FROM cross_reference_threads t, cross_references x, _s219_r14_lookup sv, _s219_r14_lookup tv
 WHERE t.slug='romans-14-the-kingdom-of-god-is-not-meat-and-drink'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=14 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=8 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Corinthians 8:13 — *I will eat no flesh while the world standeth, lest I make my brother to offend* Paul lives the rule he gives Rome: love lays down the liberty for the weak (Romans 14:21).'
  FROM cross_reference_threads t, cross_references x, _s219_r14_lookup sv, _s219_r14_lookup tv
 WHERE t.slug='romans-14-the-kingdom-of-god-is-not-meat-and-drink'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=14 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=8 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-14-whatsoever-is-not-of-faith-is-sin-fully-persuaded
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Corinthians 8:7 — *their conscience being weak is defiled* the doubting eater whose conscience is defiled; to act against it is the sin (Romans 14:23).'
  FROM cross_reference_threads t, cross_references x, _s219_r14_lookup sv, _s219_r14_lookup tv
 WHERE t.slug='romans-14-whatsoever-is-not-of-faith-is-sin-fully-persuaded'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=14 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=8 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
