-- =====================================================================
-- Session 134 — Matt 5 extras-tier cross-references
-- =====================================================================
-- Adds Matt 5's extras-tier rows + threads to the cross-reference
-- corpus. Continues the S131 (Matt 1-2), S132 (Matt 3), and S133
-- (Matt 4) extras-tier coverage onto Matt 5, the Sermon on the Mount.
--
-- The Matt 5 reading-target: the King ascending the mountain to teach
-- the heart-Torah in his own voice (the second-Sinai motif); the
-- Beatitudes as the roster of the citizens already in the kingdom
-- (not the ladder to enter it); the salt-and-light naming as
-- covenant-preservation and Yeshayahu (Isaiah) 49 gathering-light;
-- the load-bearing v.17-19 anti-antinomian declaration with *plēroō*
-- read as *bring-to-pass* (not exhaust-and-end); the v.20 contrast
-- with the Pharisaic-Sadducean counterfeit-righteousness; the six
-- antitheses as oral-tradition add-or-diminish correction (Mark 7 +
-- Deuteronomy 4:2 anchors), not Yahusha-vs-Mosheh; the closing
-- *tamim*-completion at v.48. The Hebrew library's extras-tier
-- witness carries the righteous-elect blessing register earlier
-- (1 Enoch, Wisdom of Solomon), the light-of-the-elect at the throne
-- of glory (1 Enoch's Parables section), the Torah-permanence at the
-- heavenly tablets (Jubilees 6), the woe-against-those-who-alter-and-
-- teach-men-so as direct architecture for Matt 5:19 (1 Enoch 82, 95,
-- 99), the oath-restraint register (Sirach 23), the love-replacing-
-- hatred and spirit-of-fornication catalogue in the Testaments of the
-- XII Patriarchs (T. Gad on hatred-to-love, T. Reuben on the spirit
-- of fornication), and the mercy-on-enemies-as-the-Father-pattern in
-- Wisdom of Solomon 12.
--
-- Editions used at S134: 1 Enoch (`enoch`), Jubilees (`jubilees`),
-- Apocrypha KJV 1611 (`apocrypha` — Wisdom of Solomon and
-- Ecclesiasticus / Sirach), Pseudepigrapha Charles vol 2
-- (`pseudepigrapha` — Testaments of the XII Patriarchs). The full
-- view filter retains every scripture-level extras edition seeded for
-- V1 for forward compatibility with future chapter migrations
-- (Jasher, Adam-Eve Conflict, Apocalypse of Abraham, Apocrypha
-- Charles vol 1, Sonnini Acts 29, Ascension of Isaiah) — these are
-- not targeted in S134 because the Matt 5 reading does not surface a
-- framework-bearing connection from those editions at the rigour the
-- migration requires. Historical-witness editions (Josephus, M.R.
-- James's apocryphal NT, Lightfoot's Apostolic Fathers) remain
-- deferred from V1 cross-refs per the historical-witness one-way
-- rule.
--
-- Brief scope notes: The Mark 7 and Deuteronomy 4:2 anchors for the
-- antitheses-as-oral-tradition-correction reading are canon-anchored
-- and walked in the short.md and long.md commentaries; no extras-
-- library parallel is targeted for those specific cross-references in
-- this migration. The new-heart promises of Yirmeyahu (Jeremiah)
-- 31:33 and Yechezk'el (Ezekiel) 36:26-27 underlying *the
-- righteousness exceeding* (Matt 5:20) are also canon-anchored.
-- Testament of Joseph 18 (do-good-to-enemies) is not in the parsed
-- pseudepigrapha edition (DB Joseph runs through ch 16); the love-
-- thy-enemy thread uses T. Gad 2 instead, which the standard text
-- carries at the same theological substance.
--
-- Seven new PROPOSED threads at extras-tier:
--   1. `beatitudes-as-righteous-elect-blessing-register` (sort 210)
--   2. `light-of-the-elect-and-the-throne-of-glory`      (sort 211)
--   3. `heavenly-tablets-and-torah-permanence`           (sort 212)
--   4. `woe-against-those-who-alter-and-teach-men-so`    (sort 213)
--   5. `oath-restraint-register`                          (sort 214)
--   6. `love-replacing-hatred-and-fornication-in-the-testaments` (sort 215)
--   7. `mercy-on-enemies-as-the-father-pattern`           (sort 216)
--
-- ~21 new cross_references rows, all at tier_required='extras'.
-- Every member-note passes the 12 Red Lines and the 12-point editorial
-- checklist.
--
-- Idempotent: ON CONFLICT DO NOTHING on every INSERT.
-- =====================================================================

\echo 'Session 134 — Matt 5 extras-tier cross-references migration starting...'
BEGIN;

-- Verse-lookup temp view. Same edition filter as S131-S133 — every
-- scripture-level extras edition seeded for V1, plus canon.
CREATE TEMP VIEW _s134_verse_lookup AS
SELECT
    e.slug AS edition_slug,
    b.slug AS book_slug,
    c.chapter_number,
    v.verse_number,
    v.id AS verse_id
  FROM verses v
  JOIN chapters c ON v.chapter_id = c.id
  JOIN books    b ON c.book_id    = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN (
       'canon',
       'enoch',
       'jubilees',
       'jasher',
       'apocrypha',
       'apocrypha-charles-vol1',
       'pseudepigrapha',
       'adam-eve-conflict',
       'apocalypse-of-abraham',
       'ascension-isaiah'
   );

-- ---------------------------------------------------------------------
-- Insert ~21 extras-tier cross_references rows.
-- ---------------------------------------------------------------------
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, note) AS (VALUES
  -- Thread 1: beatitudes-as-righteous-elect-blessing-register
  ('canon', 'matthew', 5, 3, 'enoch', '1-enoch', 5, 7,
   '*But to the righteous and holy He will grant peace, and He will protect the elect, and compassion shall be upon them; and they shall all belong to Elohim (God), and they shall be prospered, and they shall all be blessed.* 1 Enoch 5:7 names the Hebrew library''s righteous-elect blessing register the Beatitudes inherit. Matt 5:3''s *blessed are the poor in spirit: for theirs is the kingdom of heaven* is not the entry-condition into the kingdom; it is the Father''s own witness to the citizens he has already drawn. The Hebrew library carries the same register: blessing pronounced on the righteous and elect who are already such.'),
  ('canon', 'matthew', 5, 4, 'enoch', '1-enoch', 1, 8,
   '*But with the righteous He will make peace. And will protect the elect, And mercy shall be upon them. And they shall all belong to Elohim (God), And they shall be prospered, And they shall all be blessed. And He will help them all, And light shall appear unto them, And He will make peace with them.* 1 Enoch 1:8 names the comfort-and-light promise on the elect — the same register Matt 5:4''s *blessed are they that mourn: for they shall be comforted* carries into the Sermon. The Hebrew library lays down the comfort-of-the-righteous architecture the Beatitude inherits.'),
  ('canon', 'matthew', 5, 10, 'enoch', '1-enoch', 58, 2,
   '*Blessed are ye, ye righteous and elect, For glorious shall be your lot.* 1 Enoch 58:2 carries the direct *blessed-are-the-righteous-and-elect* register — beatitude-form pronounced over the gathered. Matt 5:10''s *blessed are they which are persecuted for righteousness'' sake: for theirs is the kingdom of heaven* is the gospel-form of the same Hebrew library declaration: the righteous and elect are pronounced blessed, and the kingdom is theirs.'),
  ('canon', 'matthew', 5, 10, 'apocrypha', 'the-wisdom-of-solomon', 3, 1,
   '*But the souls of the righteous are in the hand of Yahuah (God), and there shall no torment touch them.* Wisdom of Solomon 3:1 names the protection-of-the-righteous register the persecuted-for-righteousness Beatitude carries forward. Matt 5:10-12''s *blessed are they which are persecuted ... rejoice, and be exceeding glad: for great is your reward in heaven* walks the same architecture: the persecution lands on the body, the soul rests in the Father''s hand. The Hebrew library names the substance that Yahusha (Jesus) extends into the Beatitude.'),
  ('canon', 'matthew', 5, 12, 'apocrypha', 'the-wisdom-of-solomon', 3, 9,
   '*They that put their trust in him shall understand the truth: and such as be faithful in love shall abide with him: for grace and mercy is to his saints, and he has care for his elect.* Wisdom 3:9 names the great-is-your-reward register — *grace and mercy is to his saints, and he has care for his elect.* Matt 5:12''s *great is your reward in heaven: for so persecuted they the prophets which were before you* walks the same Hebrew library reward-and-care promise on the elect, extended to the disciples joining the prophetic-witness lineage.'),

  -- Thread 2: light-of-the-elect-and-the-throne-of-glory
  ('canon', 'matthew', 5, 14, 'enoch', '1-enoch', 58, 3,
   '*And the righteous shall be in the light of the sun, And the elect in the light of eternal life: The days of their life shall be unending, And the days of the holy and elect shall be without number.* 1 Enoch 58:3 names the light-of-the-elect register — the righteous in the light of the sun, the elect in the light of eternal life. Matt 5:14''s *ye are the light of the world* (Greek *este,* indicative not imperative — *you ARE*) is the gospel-form of the same Hebrew library declaration: the elect are named as the light they already are because the Father has drawn them into the light of the eternal age.'),
  ('canon', 'matthew', 5, 14, 'enoch', '1-enoch', 38, 4,
   '*And from henceforth they that possess the earth shall no longer be strong and exalted, nor shall they be able to look with contempt on the face of the holy, for Yahuah (God) of Spirits has appeared upon the throne of His glory, and all evil shall depart from before His face.* 1 Enoch 38:4 names the throne-of-glory architecture — the appearing of Yahuah (God) of Spirits at which the strong of the earth lose their exaltation and the holy stand revealed. Matt 5:14''s *a city that is set on an hill cannot be hid* names the present-age visibility of the gathered remnant in the same architecture: the disciples on the second-Sinai mountain are the foreshadowing of the throne-of-glory city the consummation will set on the height of the mountains.'),
  ('canon', 'matthew', 5, 16, 'enoch', '1-enoch', 38, 2,
   '*And the righteous shall be victorious in the name of Yahuah (God) of Spirits, and He will cause the sinners and the godless to be destroyed from the face of the earth, and those who have led the world astray shall be bound with chains, and in their assembling-place of destruction shall they be imprisoned.* 1 Enoch 38:2 names the righteous-shall-be-victorious-in-the-name architecture — the elect''s visible vindication in the name of Yahuah (God) of Spirits, with the glory ascending to Him. Matt 5:16''s *let your light so shine before men, that they may see your good works, and glorify your Father which is in heaven* walks the same name-glorifying architecture at the present-age level: the visible covenant-walk of the gathered draws the glory to the Father.'),

  -- Thread 3: heavenly-tablets-and-torah-permanence
  ('canon', 'matthew', 5, 18, 'jubilees', 'jubilees', 6, 35,
   '*For I know and from henceforth shall I declare it to you, and it is not of my own devising; for the book (lies) written before me, and on the heavenly tables the division of days is ordained, lest they forget the feasts of the covenant and walk according to the feasts of the nations after their error.* Jubilees 6:35 names the heavenly tablets — the Torah and the appointed times written before Yahuah (God) from the foundation of the world. Matt 5:18''s *till heaven and earth pass, one jot or one tittle shall in no wise pass from the law* binds the gospel to the same heavenly-tablet architecture: the Torah stands inscribed beyond the present heavens and earth, and the smallest mark on the page does not pass until the consummation.'),
  ('canon', 'matthew', 5, 18, 'jubilees', 'jubilees', 6, 37,
   '*For this reason the years will come upon them when they will disturb (the order), and make an abominable (day) the day of testimony, and an unclean day a feast day, and they will confound all the days, the holy with the unclean, and the unclean day with the holy; for they will go wrong as to the months and Sabbaths and feasts and jubilees.* Jubilees 6:37 names the prophetic warning against those who will *disturb the order* of the Torah-appointed times — abomination-protecting redaction that confounds the holy with the unclean. Matt 5:18''s *one jot or one tittle shall in no wise pass from the law* stands against the same disturbance the Hebrew library has already prophesied; the King binds himself to the heavenly-tablet order Jubilees named as standing inviolable.'),

  -- Thread 4: woe-against-those-who-alter-and-teach-men-so
  ('canon', 'matthew', 5, 19, 'enoch', '1-enoch', 99, 2,
   '*Woe to them who pervert the words of uprightness, And transgress the eternal law, And transform themselves into what they were not [into sinners]: They shall be trodden under foot upon the earth.* 1 Enoch 99:2 names the woe-pattern against those who pervert the words of uprightness and transgress the eternal law. Matt 5:19''s *whosoever therefore shall break one of these least commandments, and shall teach men so, shall be called the least in the kingdom of heaven* walks the same diagnostic at the kingdom-status level. The Hebrew library carries the woe-form; the gospel carries the kingdom-status-naming. Both name the same act — perverting the words, transgressing the eternal law — and both refuse to soften the diagnostic.'),
  ('canon', 'matthew', 5, 19, 'enoch', '1-enoch', 82, 13,
   '*And woe to those who alter these things, And lead the sons of men astray, And cause them to transgress the commandments of Yahuah (God) of Spirits.* 1 Enoch 82:13 names the two-clause diagnostic explicitly: *alter* + *lead the sons of men astray* + *cause them to transgress the commandments.* This is the direct architectural parallel to Matt 5:19''s *break* + *teach men so* — the Hebrew library carries the exact dual-clause diagnostic the gospel inherits. The institutional pulpit that voids the commandments and teaches the congregation to do the same is named by both registers: woe-form in the Hebrew library, least-in-the-kingdom in the gospel.'),
  ('canon', 'matthew', 5, 19, 'enoch', '1-enoch', 95, 2,
   '*Woe to you who alter the words of uprightness, And who write the words of unrighteousness and lying: They write their own judgment; For they shall suddenly be slain, And they shall have no peace.* 1 Enoch 95:2 carries the alter-the-words-of-uprightness woe in its sharpest form — *they write their own judgment.* Matt 5:19''s kingdom-status diagnostic walks the same architecture in gospel-grammar: the pulpit that teaches the breaking of the commandments writes its own kingdom-status by the teaching.'),

  -- Thread 5: oath-restraint-register
  ('canon', 'matthew', 5, 33, 'apocrypha', 'ecclesiasticus', 23, 9,
   '*Accustom not your mouth to swearing; neither use thyself to the naming of the Holy One.* Sirach (Ecclesiasticus) 23:9 names the oath-restraint register the Hebrew library carries — the wisdom-counsel against the casual oath-formula apparatus. Matt 5:33-37''s *swear not at all ... let your communication be, Yea, yea; Nay, nay* walks the same Hebrew library register at the heart-Torah level: cut the gradation-evasion apparatus, restore the integrity of speech the Torah commands.'),
  ('canon', 'matthew', 5, 34, 'apocrypha', 'ecclesiasticus', 23, 10,
   '*For as a servant that is continually beaten shall not be without a blue mark: so he that sweareth and nameth Yahuah (God) continually shall not be faultless.* Sirach 23:10 names the standing-consequence of habitual oath-taking — the moral-mark left by the practice. Matt 5:34''s *swear not at all; neither by heaven; for it is Elohim''s (God''s) throne* walks the same architecture: the casual invocation of the heavenly things in the oath-apparatus is the standing diminishment the Hebrew library has already named.'),
  ('canon', 'matthew', 5, 37, 'apocrypha', 'ecclesiasticus', 23, 11,
   '*A man that useth much swearing shall be filled with iniquity, and the plague shall never depart from his house: if he shall offend, his sin shall be upon him: and if he acknowledge not his sin, he maketh a double offence.* Sirach 23:11 names the cumulative-iniquity of the oath-apparatus user — the plague that does not depart. Matt 5:37''s *let your communication be, Yea, yea; Nay, nay: for whatsoever is more than these cometh of evil* lands the same diagnostic at the heart-Torah level: the gradation-evasion apparatus *cometh of evil* — the Hebrew library''s *filled with iniquity* in gospel-grammar.'),

  -- Thread 6: love-replacing-hatred-and-fornication-in-the-testaments
  ('canon', 'matthew', 5, 22, 'pseudepigrapha', 'testaments-xii', 62, 2,
   '*Love one another in deed, and in word, and in the inclination of the soul. For in the presence of my father I spake peaceably to Joseph; and when I had gone out, the spirit of hatred darkened my mind, and stirred up my soul to slay him.* Testament of Gad 2:2 (DB ch 62) names the spirit-of-hatred-to-the-act-of-murder architecture in the patriarch''s own testimony — the heart-root that the Torah always taught the murder-commandment named. Matt 5:22''s *whosoever is angry with his brother without a cause shall be in danger of the judgment* walks the same Hebrew library architecture at the antithesis-restoration level: the oral tradition stopped at the bodily act; the Torah and the testaments and the Beatitudes name the heart-substance the act follows from.'),
  ('canon', 'matthew', 5, 28, 'pseudepigrapha', 'testaments-xii', 3, 1,
   '*With these spirits are mingled the spirits of error. First, the spirit of fornication is seated in the nature and in the senses.* Testament of Reuben 3:1 (DB ch 3) names the *spirit of fornication* as a heart-seated reality preceding the bodily act — the heart-architecture the Torah''s tenth commandment also named. Matt 5:28''s *whosoever looketh on a woman to lust after her hath committed adultery with her already in his heart* walks the same heart-stake-architecture: the act follows the heart-spirit; the antithesis restores what the Torah and the testaments carried.'),
  ('canon', 'matthew', 5, 44, 'pseudepigrapha', 'testaments-xii', 62, 3,
   '*Love ye one another from the heart; and if a man sin against thee, cast forth the poison of hate and speak peaceably to him, and in thy soul hold not guile.* Testament of Gad 2:3 (DB ch 62) names the love-replacing-hatred ethic at the heart level — *cast forth the poison of hate and speak peaceably.* Matt 5:44''s *love your enemies, bless them that curse you, do good to them that hate you* walks the same Hebrew library ethic at the Sermon level. The antithesis is not a Yahusha (Jesus) innovation against Mosheh (Moses); the love-of-the-personal-enemy ethic was already taught in the patriarch''s own testimony to his sons.'),

  -- Thread 7: mercy-on-enemies-as-the-father-pattern
  ('canon', 'matthew', 5, 44, 'apocrypha', 'the-wisdom-of-solomon', 12, 19,
   '*But by such works have you taught your people that the just man should be merciful, and have made your children to be of a good hope that you give repentance for sins.* Wisdom of Solomon 12:19 names the Father''s mercy-pattern as the teaching-source of the just-man-should-be-merciful ethic. Matt 5:44-45''s *love your enemies, bless them that curse you ... that ye may be the children of your Father which is in heaven: for he maketh his sun to rise on the evil and on the good, and sendeth rain on the just and on the unjust* walks the same Father-pattern architecture: the Father''s mercy on enemies teaches the children the ethic the children walk.'),
  ('canon', 'matthew', 5, 45, 'apocrypha', 'the-wisdom-of-solomon', 12, 20,
   '*For if you did punish the enemies of your children, and the condemned to death, with such deliberation, giving them time and place, by which they might be delivered from their malice.* Wisdom 12:20 names the Father''s long-suffering-toward-enemies pattern — punishment carried with deliberation, time and place given for repentance. Matt 5:45''s *he maketh his sun to rise on the evil and on the good, and sendeth rain on the just and on the unjust* walks the same Hebrew library pattern: the Father''s standing mercy on the evil-still-given-time is the pattern the gathered children imitate when they love their personal enemies in the present age.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, 'extras'::content_tier
  FROM input i
  JOIN _s134_verse_lookup sv ON sv.edition_slug = i.src_edition
                            AND sv.book_slug    = i.src_slug
                            AND sv.chapter_number = i.src_ch
                            AND sv.verse_number  = i.src_v
  JOIN _s134_verse_lookup tv ON tv.edition_slug = i.tgt_edition
                            AND tv.book_slug    = i.tgt_slug
                            AND tv.chapter_number = i.tgt_ch
                            AND tv.verse_number  = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ---------------------------------------------------------------------
-- Insert 7 new extras-tier threads.
-- ---------------------------------------------------------------------

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'beatitudes-as-righteous-elect-blessing-register',
       'The Beatitudes as righteous-elect blessing-register',
       'Matt 5:3-12''s Beatitudes inherit the Hebrew library''s righteous-elect blessing-register — pronounced over the gathered, not enumerated as entry-conditions. 1 Enoch 5:7 names the peace-and-compassion-on-the-elect register the *blessed are the poor in spirit* Beatitude carries forward. 1 Enoch 1:8 names the comfort-and-light promise on the elect that Matt 5:4''s *they shall be comforted* walks. 1 Enoch 58:2 carries the direct *blessed-are-the-righteous-and-elect* form behind Matt 5:10''s *blessed are they which are persecuted.* Wisdom of Solomon 3:1 names the souls-of-the-righteous-in-the-hand-of-Elohim register the persecution-Beatitudes inherit; Wisdom 3:9 names the *grace and mercy is to his saints, and he has care for his elect* register Matt 5:12''s *great is your reward in heaven* walks. The Hebrew library makes plain what the Beatitudes carry forward: the blessing is pronounced on the elect because they are the elect; the Beatitudes describe the citizens already drawn, not the credentials by which the credentialed enter.',
       sv.verse_id, ev.verse_id, 'extras', 210
  FROM _s134_verse_lookup sv, _s134_verse_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 5 AND sv.verse_number = 3
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'matthew' AND ev.chapter_number = 5 AND ev.verse_number = 12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'light-of-the-elect-and-the-throne-of-glory',
       'The light of the elect and the throne of glory',
       'Matt 5:14-16''s salt-and-light naming — *ye are the light of the world ... a city that is set on an hill cannot be hid ... let your light so shine before men, that they may see your good works, and glorify your Father which is in heaven* — reads against 1 Enoch''s Parables section. 1 Enoch 58:3 names the architecture directly: *the righteous shall be in the light of the sun, And the elect in the light of eternal life.* The Greek *este* at Matt 5:14 is indicative not imperative — the disciples ARE the light because they ARE the elect. 1 Enoch 38:4 names the throne-of-glory appearing at which the strong of the earth lose their exaltation and the holy stand revealed — the present-age visibility of the gathered foreshadows the consummation-city set on the height of the mountains. 1 Enoch 38:2 names the *righteous-shall-be-victorious-in-the-name* architecture; Matt 5:16''s *that they may see your good works, and glorify your Father which is in heaven* walks the same name-glorifying pattern at the present-age level.',
       sv.verse_id, ev.verse_id, 'extras', 211
  FROM _s134_verse_lookup sv, _s134_verse_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 5 AND sv.verse_number = 14
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'matthew' AND ev.chapter_number = 5 AND ev.verse_number = 16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'heavenly-tablets-and-torah-permanence',
       'The heavenly tablets and the permanence of the Torah',
       'Matt 5:17-18''s load-bearing declaration — *think not that I am come to destroy the law, or the prophets: I am not come to destroy, but to fulfil. For verily I say unto you, Till heaven and earth pass, one jot or one tittle shall in no wise pass from the law* — binds the gospel to the Hebrew library''s heavenly-tablets architecture. Jubilees 6:35 names the architecture explicitly: *the book (lies) written before me, and on the heavenly tables the division of days is ordained.* The Torah and the appointed times are inscribed before Yahuah (God) from the foundation of the world; what Yahusha (Jesus) binds himself to at Matt 5:18 is what Jubilees named as already standing on the heavenly tables. Jubilees 6:37 names the prophetic warning against those who will *disturb the order* — abomination-protecting redaction that confounds the holy with the unclean. The King''s *one jot or one tittle shall in no wise pass* stands against the same disturbance the Hebrew library has already prophesied.',
       sv.verse_id, ev.verse_id, 'extras', 212
  FROM _s134_verse_lookup sv, _s134_verse_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 5 AND sv.verse_number = 17
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'matthew' AND ev.chapter_number = 5 AND ev.verse_number = 18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'woe-against-those-who-alter-and-teach-men-so',
       'Woe against those who alter the words and teach men so',
       'Matt 5:19 — *whosoever therefore shall break one of these least commandments, and shall teach men so, shall be called the least in the kingdom of heaven: but whosoever shall do and teach them, the same shall be called great in the kingdom of heaven* — reads against the Hebrew library''s woe-pattern against the alter-and-teach-men-so diagnostic. 1 Enoch 99:2 names the woe directly: *Woe to them who pervert the words of uprightness, And transgress the eternal law.* 1 Enoch 82:13 carries the exact two-clause architecture the gospel diagnostic walks: *woe to those who alter these things, And lead the sons of men astray, And cause them to transgress the commandments of Yahuah (God) of Spirits* — alter + lead astray + cause to transgress. The Hebrew library''s dual-clause woe is the direct architectural parallel to the gospel''s dual-clause diagnostic (*break* + *teach men so*). 1 Enoch 95:2 carries the alter-the-words-of-uprightness woe in its sharpest form: *they write their own judgment.* The institutional pulpit that voids the commandments and teaches the congregation to do the same is named by both registers — the Hebrew library''s woe and the gospel''s kingdom-status diagnostic.',
       sv.verse_id, ev.verse_id, 'extras', 213
  FROM _s134_verse_lookup sv, _s134_verse_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 5 AND sv.verse_number = 19
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'matthew' AND ev.chapter_number = 5 AND ev.verse_number = 19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'oath-restraint-register',
       'The oath-restraint register from Sirach',
       'Matt 5:33-37''s antithesis on oaths — *swear not at all ... let your communication be, Yea, yea; Nay, nay: for whatsoever is more than these cometh of evil* — walks the Hebrew library''s wisdom-stream oath-restraint register. Sirach (Ecclesiasticus) 23:9 names the counsel directly: *accustom not your mouth to swearing; neither use thyself to the naming of the Holy One.* Sirach 23:10 names the standing consequence of habitual oath-taking — the moral-mark left by the practice. Sirach 23:11 names the cumulative iniquity: *a man that useth much swearing shall be filled with iniquity, and the plague shall never depart from his house.* The Hebrew library carries the wisdom-counsel against the casual oath-formula apparatus; the gospel walks the same architecture at the heart-Torah level — cut the gradation-evasion apparatus, restore the integrity of speech the Torah commands.',
       sv.verse_id, ev.verse_id, 'extras', 214
  FROM _s134_verse_lookup sv, _s134_verse_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 5 AND sv.verse_number = 33
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'matthew' AND ev.chapter_number = 5 AND ev.verse_number = 37
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'love-replacing-hatred-and-fornication-in-the-testaments',
       'Love replacing hatred and the spirit of fornication in the Testaments',
       'The heart-Torah antitheses of Matt 5:21-48 walk the same heart-architecture the Testaments of the XII Patriarchs already carry in the patriarchs'' own testimony to their sons. Testament of Gad 2:2 names the spirit-of-hatred-to-the-act-of-murder architecture from Gad''s own confession: *the spirit of hatred darkened my mind, and stirred up my soul to slay him.* Matt 5:22''s *whosoever is angry with his brother without a cause shall be in danger of the judgment* walks the same heart-root the oral tradition had cut away. Testament of Reuben 3:1 names the *spirit of fornication ... seated in the nature and in the senses* — the heart-architecture preceding the bodily act, the same heart-stake the tenth commandment carried. Matt 5:28''s *whosoever looketh on a woman to lust after her hath committed adultery with her already in his heart* restores the heart-substance the antithesis names. Testament of Gad 2:3 names the love-replacing-hatred ethic in its sharpest form: *love ye one another from the heart; and if a man sin against thee, cast forth the poison of hate and speak peaceably to him.* Matt 5:44''s *love your enemies, bless them that curse you* is not a Yahusha (Jesus) innovation against Mosheh (Moses) — the love-of-the-personal-enemy ethic was already taught in the patriarch''s testimony to his sons.',
       sv.verse_id, ev.verse_id, 'extras', 215
  FROM _s134_verse_lookup sv, _s134_verse_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 5 AND sv.verse_number = 21
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'matthew' AND ev.chapter_number = 5 AND ev.verse_number = 48
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'mercy-on-enemies-as-the-father-pattern',
       'Mercy on enemies as the Father pattern',
       'Matt 5:43-48''s love-enemies antithesis grounds itself in the Father''s own pattern: *that ye may be the children of your Father which is in heaven: for he maketh his sun to rise on the evil and on the good, and sendeth rain on the just and on the unjust.* The Hebrew library''s Wisdom of Solomon names the same Father-pattern architecture. Wisdom 12:19 names the teaching directly: *by such works have you taught your people that the just man should be merciful, and have made your children to be of a good hope that you give repentance for sins.* Wisdom 12:20 names the Father''s long-suffering-toward-enemies pattern — punishment carried with deliberation, time and place given for repentance. The gathered children imitate the Father''s standing mercy on the evil-still-given-time when they love their personal enemies in the present age. The Hebrew library names the architecture the Sermon walks; the architecture is the Father''s own.',
       sv.verse_id, ev.verse_id, 'extras', 216
  FROM _s134_verse_lookup sv, _s134_verse_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 5 AND sv.verse_number = 43
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'matthew' AND ev.chapter_number = 5 AND ev.verse_number = 48
ON CONFLICT (slug) DO NOTHING;

-- ---------------------------------------------------------------------
-- Link cross_references to their threads.
-- ---------------------------------------------------------------------

-- Thread 1: beatitudes-as-righteous-elect-blessing-register
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, '1 Enoch 5:7 — *to the righteous and holy He will grant peace, and He will protect the elect, and compassion shall be upon them.* The Hebrew library''s righteous-elect blessing register; the Beatitudes inherit the architecture.'
  FROM cross_reference_threads t, cross_references x,
       _s134_verse_lookup sv, _s134_verse_lookup tv
 WHERE t.slug = 'beatitudes-as-righteous-elect-blessing-register'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 5 AND sv.verse_number = 3
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 5 AND tv.verse_number = 7
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, '1 Enoch 1:8 — *with the righteous He will make peace ... light shall appear unto them, And He will make peace with them.* The comfort-and-light promise on the elect; Matt 5:4''s *they shall be comforted* walks the same architecture.'
  FROM cross_reference_threads t, cross_references x,
       _s134_verse_lookup sv, _s134_verse_lookup tv
 WHERE t.slug = 'beatitudes-as-righteous-elect-blessing-register'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 5 AND sv.verse_number = 4
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 1 AND tv.verse_number = 8
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, '1 Enoch 58:2 — *Blessed are ye, ye righteous and elect, For glorious shall be your lot.* Beatitude-form pronounced over the gathered in the Hebrew library; Matt 5:10 walks the same.'
  FROM cross_reference_threads t, cross_references x,
       _s134_verse_lookup sv, _s134_verse_lookup tv
 WHERE t.slug = 'beatitudes-as-righteous-elect-blessing-register'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 5 AND sv.verse_number = 10
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 58 AND tv.verse_number = 2
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, 'Wisdom of Solomon 3:1 — *the souls of the righteous are in the hand of Yahuah (God), and there shall no torment touch them.* The protection-of-the-righteous register the persecution-Beatitudes carry forward.'
  FROM cross_reference_threads t, cross_references x,
       _s134_verse_lookup sv, _s134_verse_lookup tv
 WHERE t.slug = 'beatitudes-as-righteous-elect-blessing-register'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 5 AND sv.verse_number = 10
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'the-wisdom-of-solomon' AND tv.chapter_number = 3 AND tv.verse_number = 1
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, 'Wisdom 3:9 — *grace and mercy is to his saints, and he has care for his elect.* The great-is-your-reward register the Hebrew library names; Matt 5:12 extends it to the disciples joining the prophetic-witness lineage.'
  FROM cross_reference_threads t, cross_references x,
       _s134_verse_lookup sv, _s134_verse_lookup tv
 WHERE t.slug = 'beatitudes-as-righteous-elect-blessing-register'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 5 AND sv.verse_number = 12
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'the-wisdom-of-solomon' AND tv.chapter_number = 3 AND tv.verse_number = 9
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2: light-of-the-elect-and-the-throne-of-glory
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, '1 Enoch 58:3 — *the righteous shall be in the light of the sun, And the elect in the light of eternal life.* The Hebrew library''s direct light-of-the-elect architecture; Matt 5:14''s indicative *ye ARE the light* walks the same.'
  FROM cross_reference_threads t, cross_references x,
       _s134_verse_lookup sv, _s134_verse_lookup tv
 WHERE t.slug = 'light-of-the-elect-and-the-throne-of-glory'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 5 AND sv.verse_number = 14
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 58 AND tv.verse_number = 3
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, '1 Enoch 38:4 — *those that possess the earth shall no longer be strong and exalted ... for Yahuah (God) of Spirits has appeared upon the throne of His glory.* The throne-of-glory appearing; Matt 5:14''s *city set on an hill* foreshadows the consummation-city.'
  FROM cross_reference_threads t, cross_references x,
       _s134_verse_lookup sv, _s134_verse_lookup tv
 WHERE t.slug = 'light-of-the-elect-and-the-throne-of-glory'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 5 AND sv.verse_number = 14
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 38 AND tv.verse_number = 4
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, '1 Enoch 38:2 — *the righteous shall be victorious in the name of Yahuah (God) of Spirits.* The name-glorifying architecture; Matt 5:16''s *that they may see your good works, and glorify your Father which is in heaven* walks the same.'
  FROM cross_reference_threads t, cross_references x,
       _s134_verse_lookup sv, _s134_verse_lookup tv
 WHERE t.slug = 'light-of-the-elect-and-the-throne-of-glory'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 5 AND sv.verse_number = 16
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 38 AND tv.verse_number = 2
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3: heavenly-tablets-and-torah-permanence
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, 'Jubilees 6:35 — *the book (lies) written before me, and on the heavenly tables the division of days is ordained.* The Hebrew library''s heavenly-tablets architecture; Matt 5:18''s *one jot or one tittle shall in no wise pass* binds the gospel to it.'
  FROM cross_reference_threads t, cross_references x,
       _s134_verse_lookup sv, _s134_verse_lookup tv
 WHERE t.slug = 'heavenly-tablets-and-torah-permanence'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 5 AND sv.verse_number = 18
   AND tv.edition_slug = 'jubilees' AND tv.book_slug = 'jubilees' AND tv.chapter_number = 6 AND tv.verse_number = 35
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, 'Jubilees 6:37 — *the years will come upon them when they will disturb (the order) ... and they will confound all the days, the holy with the unclean.* The prophetic warning against abomination-protecting redaction; Matt 5:18''s *one jot or one tittle* stands against the same disturbance.'
  FROM cross_reference_threads t, cross_references x,
       _s134_verse_lookup sv, _s134_verse_lookup tv
 WHERE t.slug = 'heavenly-tablets-and-torah-permanence'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 5 AND sv.verse_number = 18
   AND tv.edition_slug = 'jubilees' AND tv.book_slug = 'jubilees' AND tv.chapter_number = 6 AND tv.verse_number = 37
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4: woe-against-those-who-alter-and-teach-men-so
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, '1 Enoch 99:2 — *Woe to them who pervert the words of uprightness, And transgress the eternal law.* The woe-pattern against the alter-and-transgress diagnostic; Matt 5:19''s kingdom-status diagnostic walks the same architecture.'
  FROM cross_reference_threads t, cross_references x,
       _s134_verse_lookup sv, _s134_verse_lookup tv
 WHERE t.slug = 'woe-against-those-who-alter-and-teach-men-so'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 5 AND sv.verse_number = 19
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 99 AND tv.verse_number = 2
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, '1 Enoch 82:13 — *woe to those who alter these things, And lead the sons of men astray, And cause them to transgress the commandments of Yahuah (God) of Spirits.* The dual-clause architecture — alter + cause-to-transgress — that Matt 5:19''s *break* + *teach men so* walks directly.'
  FROM cross_reference_threads t, cross_references x,
       _s134_verse_lookup sv, _s134_verse_lookup tv
 WHERE t.slug = 'woe-against-those-who-alter-and-teach-men-so'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 5 AND sv.verse_number = 19
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 82 AND tv.verse_number = 13
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, '1 Enoch 95:2 — *Woe to you who alter the words of uprightness, And who write the words of unrighteousness and lying: They write their own judgment.* The sharpest woe-form of the diagnostic; the pulpit teaching the breaking of the commandments writes its own kingdom-status.'
  FROM cross_reference_threads t, cross_references x,
       _s134_verse_lookup sv, _s134_verse_lookup tv
 WHERE t.slug = 'woe-against-those-who-alter-and-teach-men-so'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 5 AND sv.verse_number = 19
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 95 AND tv.verse_number = 2
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 5: oath-restraint-register
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, 'Sirach (Ecclesiasticus) 23:9 — *Accustom not your mouth to swearing; neither use thyself to the naming of the Holy One.* The wisdom-counsel against the casual oath-formula apparatus; Matt 5:33-37''s *swear not at all* walks the same.'
  FROM cross_reference_threads t, cross_references x,
       _s134_verse_lookup sv, _s134_verse_lookup tv
 WHERE t.slug = 'oath-restraint-register'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 5 AND sv.verse_number = 33
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 23 AND tv.verse_number = 9
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, 'Sirach 23:10 — *he that sweareth and nameth Yahuah (God) continually shall not be faultless.* The standing-consequence of habitual oath-taking; Matt 5:34''s *swear not at all; neither by heaven; for it is Elohim''s (God''s) throne* walks the same architecture.'
  FROM cross_reference_threads t, cross_references x,
       _s134_verse_lookup sv, _s134_verse_lookup tv
 WHERE t.slug = 'oath-restraint-register'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 5 AND sv.verse_number = 34
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 23 AND tv.verse_number = 10
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, 'Sirach 23:11 — *a man that useth much swearing shall be filled with iniquity, and the plague shall never depart from his house.* The cumulative-iniquity of the oath-apparatus user; Matt 5:37''s *whatsoever is more than these cometh of evil* lands the same diagnostic at the heart-Torah level.'
  FROM cross_reference_threads t, cross_references x,
       _s134_verse_lookup sv, _s134_verse_lookup tv
 WHERE t.slug = 'oath-restraint-register'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 5 AND sv.verse_number = 37
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 23 AND tv.verse_number = 11
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 6: love-replacing-hatred-and-fornication-in-the-testaments
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, 'Testament of Gad 2:2 — *the spirit of hatred darkened my mind, and stirred up my soul to slay him.* The spirit-of-hatred-to-the-act-of-murder architecture from Gad''s own confession; Matt 5:22''s *whosoever is angry with his brother* restores the heart-root the oral tradition had cut away.'
  FROM cross_reference_threads t, cross_references x,
       _s134_verse_lookup sv, _s134_verse_lookup tv
 WHERE t.slug = 'love-replacing-hatred-and-fornication-in-the-testaments'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 5 AND sv.verse_number = 22
   AND tv.edition_slug = 'pseudepigrapha' AND tv.book_slug = 'testaments-xii' AND tv.chapter_number = 62 AND tv.verse_number = 2
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, 'Testament of Reuben 3:1 — *the spirit of fornication is seated in the nature and in the senses.* The heart-architecture preceding the bodily act; Matt 5:28''s *whosoever looketh on a woman to lust after her hath committed adultery with her already in his heart* restores the heart-substance the antithesis names.'
  FROM cross_reference_threads t, cross_references x,
       _s134_verse_lookup sv, _s134_verse_lookup tv
 WHERE t.slug = 'love-replacing-hatred-and-fornication-in-the-testaments'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 5 AND sv.verse_number = 28
   AND tv.edition_slug = 'pseudepigrapha' AND tv.book_slug = 'testaments-xii' AND tv.chapter_number = 3 AND tv.verse_number = 1
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, 'Testament of Gad 2:3 — *love ye one another from the heart; and if a man sin against thee, cast forth the poison of hate and speak peaceably to him.* The love-replacing-hatred ethic at the heart level; Matt 5:44''s *love your enemies, bless them that curse you* is not Yahusha (Jesus) innovation against Mosheh (Moses) — the patriarch''s testimony already taught the ethic to his sons.'
  FROM cross_reference_threads t, cross_references x,
       _s134_verse_lookup sv, _s134_verse_lookup tv
 WHERE t.slug = 'love-replacing-hatred-and-fornication-in-the-testaments'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 5 AND sv.verse_number = 44
   AND tv.edition_slug = 'pseudepigrapha' AND tv.book_slug = 'testaments-xii' AND tv.chapter_number = 62 AND tv.verse_number = 3
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 7: mercy-on-enemies-as-the-father-pattern
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, 'Wisdom of Solomon 12:19 — *by such works have you taught your people that the just man should be merciful, and have made your children to be of a good hope that you give repentance for sins.* The Father''s mercy-pattern as the teaching-source of the just-man-should-be-merciful ethic; Matt 5:44-45''s *that ye may be the children of your Father which is in heaven* walks the same Father-pattern.'
  FROM cross_reference_threads t, cross_references x,
       _s134_verse_lookup sv, _s134_verse_lookup tv
 WHERE t.slug = 'mercy-on-enemies-as-the-father-pattern'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 5 AND sv.verse_number = 44
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'the-wisdom-of-solomon' AND tv.chapter_number = 12 AND tv.verse_number = 19
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, 'Wisdom 12:20 — *you did punish the enemies of your children, and the condemned to death, with such deliberation, giving them time and place, by which they might be delivered from their malice.* The Father''s long-suffering-toward-enemies pattern; Matt 5:45''s *he maketh his sun to rise on the evil and on the good* walks the same standing-mercy architecture.'
  FROM cross_reference_threads t, cross_references x,
       _s134_verse_lookup sv, _s134_verse_lookup tv
 WHERE t.slug = 'mercy-on-enemies-as-the-father-pattern'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 5 AND sv.verse_number = 45
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'the-wisdom-of-solomon' AND tv.chapter_number = 12 AND tv.verse_number = 20
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

DROP VIEW _s134_verse_lookup;

\echo 'Session 134 migration complete. Verifying row counts...'

SELECT
    (SELECT count(*) FROM cross_references x WHERE x.tier_required = 'extras') AS extras_xref_rows_total,
    (SELECT count(*) FROM cross_reference_threads t WHERE t.tier_required = 'extras') AS extras_threads_total,
    (SELECT count(*) FROM cross_reference_thread_members m
       JOIN cross_reference_threads t ON t.id = m.thread_id
      WHERE t.tier_required = 'extras') AS extras_members_total;

-- Per-thread member counts for S134's new threads
SELECT t.slug, count(m.*) AS member_count
  FROM cross_reference_threads t
  LEFT JOIN cross_reference_thread_members m ON m.thread_id = t.id
 WHERE t.slug IN (
       'beatitudes-as-righteous-elect-blessing-register',
       'light-of-the-elect-and-the-throne-of-glory',
       'heavenly-tablets-and-torah-permanence',
       'woe-against-those-who-alter-and-teach-men-so',
       'oath-restraint-register',
       'love-replacing-hatred-and-fornication-in-the-testaments',
       'mercy-on-enemies-as-the-father-pattern'
   )
 GROUP BY t.slug
 ORDER BY t.slug;

COMMIT;

\echo 'Session 134 — Matt 5 extras-tier cross-references migration done.'
