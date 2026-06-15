-- ----- fragment: minion_james_03.sql (S239 James 3) -----
-- =====================================================================
-- S239 minion — JAMES 3 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: JAMES 3 (18 verses) — the wisdom-literature heart of the epistle: the bridled tongue,
-- the fire of an unruly member, the blessing-and-cursing mouth, the fountain and the fig-tree, and
-- the two wisdoms — the earthly and the wisdom that is from above.
-- Tag: j239c3 (temp view _s239_j239c3_lookup).
-- Sort band: floor 8860, step 3 (8860, 8863, 8866, 8869, 8872 used; under 8890).
-- Source is ALWAYS the canon James verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (James = the wisdom of the two-house remnant, Proverbs and Sirach made apostolic,
-- the perfect law of liberty kept; NO replacement theology, NO law-vs-grace antithesis). Chapter 3 is
-- the bridled-tongue chapter — Proverbs and Sirach are everywhere under its skin. The tongue is the
-- little member that boasts great things, the fire that defileth the whole body; with it men bless
-- Elohim (God) the Father and curse men made after his similitude (Genesis 1:26-27). A fountain sends
-- not sweet and bitter from one place; the fig-tree bears not olive berries — the mouth is known by
-- its fruit (Matthew 7:16-18). And the chapter closes on the two wisdoms: the earthly, sensual,
-- devilish; and *the wisdom that is from above* — *first pure, then peaceable, gentle... full of mercy
-- and good fruits*, a near-verbatim echo of the Wisdom of Solomon's hymn to wisdom *holy... undefiled...
-- pure... kind to man* (Wisdom 7:22-27), the fruit of righteousness sown in peace. No Christology
-- carve-out arises in this chapter (the Formed is not in view); the Father is named the One blessed
-- (3:9). Preserve the pull's sacred-name renderings exactly.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-2   be not many masters; if any offend not in word, the same is a perfect man
--           Tanakh: none warranted (carried in the tongue thread at v.5-8)
--           Extras: none warranted   NT: none warranted
--   v.3-4   bits in the horses' mouths; the ships turned with a small helm
--           Tanakh: none warranted (the figure feeds the tongue thread)   Extras: none warranted
--           NT: none warranted
--   v.5-8   the tongue a little member, a fire, a world of iniquity, an unruly evil, deadly poison
--           Tanakh: Proverbs 16:27 (in his lips there is as a burning fire), Proverbs 18:21 (death
--                   and life are in the power of the tongue), Psalm 39:1 (I will keep my mouth with a
--                   bridle), Psalm 140:3 (sharpened their tongues like a serpent; adders' poison)
--           Extras: Ecclesiasticus/Sirach 28:11-26 (the stroke of the tongue breaks the bones)
--           NT: none warranted
--   v.9-10  therewith bless we Elohim... and curse we men, made after the similitude of Elohim
--           Tanakh: Genesis 1:26-27 (in our image, after our likeness), Genesis 9:6 (in the image of
--                   Elohim made he man)
--           Extras: none warranted   NT: none warranted
--   v.11-12 the fountain sweet and bitter; the fig tree bear olive berries
--           Tanakh: none warranted   Extras: none warranted
--           NT: Matthew 7:16-18 (ye shall know them by their fruits; a good tree... a corrupt tree)
--   v.13-18 the two wisdoms; the wisdom from above first pure then peaceable; fruit of righteousness
--           Tanakh: Proverbs 2:6 (Yahuah giveth wisdom: out of his mouth cometh knowledge), Proverbs
--                   3:13,17-18 (her ways are ways of pleasantness... a tree of life), Job 28:28 (the
--                   fear of Yahuah, that is wisdom); Isaiah 32:17 (the work of righteousness shall be
--                   peace), Proverbs 11:18 (to him that soweth righteousness... a sure reward),
--                   Hosea 10:12 (sow to yourselves in righteousness, reap in mercy)
--           Extras: Wisdom of Solomon 7:22-27 (wisdom holy... undefiled... pure... kind to man — the
--                   near-verbatim parallel), Ecclesiasticus/Sirach 1:1-10 (all wisdom comes from Yahuah)
--           NT: none warranted (the wisdom-from-above root is the Tanakh + Wisdom hymn)
--
-- THREADS (slug -> target libraries):
--   8860 james-3-the-tongue-a-fire-and-an-unruly-evil-proverbs-18-psalm-39-sirach-28   (Tanakh + Extras)
--   8863 james-3-bless-and-curse-men-made-after-the-similitude-of-elohim-genesis-1     (Tanakh)
--   8866 james-3-the-fountain-and-the-fig-tree-known-by-their-fruit-matthew-7          (NT)
--   8869 james-3-the-wisdom-that-is-from-above-first-pure-then-peaceable-wisdom-7       (Tanakh + Extras)  [BLESSING]
--   8872 james-3-the-fruit-of-righteousness-sown-in-peace-isaiah-32-hosea-10           (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s239_j239c3_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: james-3-the-tongue-a-fire-and-an-unruly-evil-proverbs-18-psalm-39-sirach-28
  ('canon', 'james', 3, 6, 'canon', 'proverbs', 16, 27, 'free', E'*An ungodly man diggeth up evil: and in his lips there is as a burning fire.* (Proverbs 16:27). Proverbs already named the mouth a hearth of fire — *in his lips there is as a burning fire.* James takes up the figure and presses it home: *the tongue is a fire, a world of iniquity... and setteth on fire the course of nature; and it is set on fire of hell* (James 3:6). The little member that *boasteth great things,* the spark by which *how great a matter a little fire kindleth* (James 3:5), is the very burning lip the wise man warned of; the apostle of the dispersed tribes speaks Proverbs'' own wisdom on the tongue.'),
  ('canon', 'james', 3, 5, 'canon', 'proverbs', 18, 21, 'free', E'*Death and life are in the power of the tongue: and they that love it shall eat the fruit thereof.* (Proverbs 18:21). Proverbs weighs the tongue with the gravest scales — *death and life are in the power of the tongue.* James says the same of *a little member* that *boasteth great things* (James 3:5) and that *can no man tame; it is an unruly evil, full of deadly poison* (James 3:8). The power Proverbs set in the tongue is the power James warns is loosed for ruin; the bridled tongue is life, the unbridled is death, and the doer of the perfect law of liberty must master it.'),
  ('canon', 'james', 3, 2, 'canon', 'psalms', 39, 1, 'free', E'*I said, I will take heed to my ways, that I sin not with my tongue: I will keep my mouth with a bridle, while the wicked is before me.* (Psalm 39:1). David resolved to *keep my mouth with a bridle* — the very image James presses: *If any man offend not in word, the same is a perfect man, and able also to bridle the whole body* (James 3:2), as a man puts *bits in the horses'' mouths, that they may obey us* (James 3:3). The bridled mouth of the psalmist is the bridled tongue of the perfect man; to govern the tongue is to govern the whole body, the wisdom David sought and James commends.'),
  ('canon', 'james', 3, 8, 'canon', 'psalms', 140, 3, 'free', E'*They have sharpened their tongues like a serpent; adders'' poison is under their lips. Selah.* (Psalm 140:3). The psalmist names the wicked tongue with the very venom James names: *adders'' poison is under their lips.* James says *the tongue can no man tame; it is an unruly evil, full of deadly poison* (James 3:8). The serpent''s poison David found under the lips of the violent is the *deadly poison* of the untamed tongue — the one member of the body man cannot subdue, deadly as the adder, needing the bridle no man supplies of himself.'),
  ('canon', 'james', 3, 6, 'apocrypha', 'ecclesiasticus', 28, 17, 'extras', E'*The stroke of the whip makes marks in the flesh: but the stroke of the tongue breaks the bones.* (Ecclesiasticus 28:17). Sirach is James''s nearest companion on the tongue: *an hasty contention kindleth a fire* (Sirach 28:11), *the stroke of the tongue breaks the bones* (28:17), *many have fallen by the edge of the sword: but not so many as have fallen by the tongue* (28:18). James re-speaks the very same: *the tongue is a fire... it defileth the whole body* (James 3:6). The wisdom that bade men *weigh your words in a balance, and make a door and bar for your mouth* (Sirach 28:25) is the wisdom James presses on the scattered tribes — the bridle on the burning, bone-breaking tongue.'),
  -- thread: james-3-bless-and-curse-men-made-after-the-similitude-of-elohim-genesis-1
  ('canon', 'james', 3, 9, 'canon', 'genesis', 1, 26, 'free', E'*And Elohim (God) said, Let us make man in our image, after our likeness: and let them have dominion over the fish of the sea, and over the fowl of the air, and over the cattle, and over all the earth, and over every creeping thing that creepeth upon the earth.* (Genesis 1:26). James grounds the sin of the cursing tongue in the creation word: *Therewith bless we Elohim (God), even the Father; and therewith curse we men, which are made after the similitude of Elohim (God)* (James 3:9). The *similitude* is Genesis'' *likeness* — *in our image, after our likeness.* To curse a man is to revile the image of the One we bless; the same mouth cannot rightly bless the Father and curse the man who bears the Father''s likeness.'),
  ('canon', 'james', 3, 9, 'canon', 'genesis', 1, 27, 'free', E'*So Elohim (God) created man in his own image, in the image of Elohim (God) created he him; male and female created he them.* (Genesis 1:27). The creation word stands doubled for emphasis — *in the image of Elohim (God) created he him.* This is the *similitude of Elohim (God)* after which men are made (James 3:9), and which James says the cursing tongue assaults: *Out of the same mouth proceedeth blessing and cursing. My brethren, these things ought not so to be* (James 3:10). The image that Elohim (God) set on man at creation is the reason the blessing and the cursing cannot both rightly come from one mouth.'),
  ('canon', 'james', 3, 9, 'canon', 'genesis', 9, 6, 'free', E'*Whoso sheddeth man''s blood, by man shall his blood be shed: for in the image of Elohim (God) made he man.* (Genesis 9:6). After the flood the image is named again as the ground of man''s sacredness — *for in the image of Elohim (God) made he man.* James reasons by the same image: men *are made after the similitude of Elohim (God)* (James 3:9), and therefore the tongue that curses them sins against the One whose likeness they bear. As shedding a man''s blood violates the image, so does cursing the man who bears it; *these things ought not so to be* (James 3:10).'),
  -- thread: james-3-the-fountain-and-the-fig-tree-known-by-their-fruit-matthew-7
  ('canon', 'james', 3, 12, 'canon', 'matthew', 7, 16, 'free', E'*Ye shall know them by their fruits. Do men gather grapes of thorns, or figs of thistles?* (Matthew 7:16). The Sermon on the Mount is James''s twin, and here they speak as one. Yahusha (Jesus) asks *do men gather grapes of thorns, or figs of thistles?* — James asks *Can the fig tree, my brethren, bear olive berries? either a vine, figs?* (James 3:12). Each tree brings forth after its own kind, and *so can no fountain both yield salt water and fresh* (James 3:12). The mouth, like the tree, is known by what it bears — the heart''s wisdom shows in the fruit of the lips.'),
  ('canon', 'james', 3, 12, 'canon', 'matthew', 7, 17, 'free', E'*Even so every good tree bringeth forth good fruit; but a corrupt tree bringeth forth evil fruit.* (Matthew 7:17). The Master''s rule is James''s rule: *every good tree bringeth forth good fruit; but a corrupt tree bringeth forth evil fruit.* James presses it on the divided mouth — *Doth a fountain send forth at the same place sweet water and bitter?* (James 3:11), *Can the fig tree... bear olive berries?* (James 3:12). The blessing-and-cursing mouth is the tree at war with its own kind; the good tree and the good fountain bring forth one fruit, and by it the wise man is known.'),
  ('canon', 'james', 3, 11, 'canon', 'matthew', 7, 18, 'free', E'*A good tree cannot bring forth evil fruit, neither can a corrupt tree bring forth good fruit.* (Matthew 7:18). Yahusha (Jesus) lays the impossibility bare — *a good tree cannot bring forth evil fruit.* James sets the same impossibility in the fountain: *Doth a fountain send forth at the same place sweet water and bitter?... so can no fountain both yield salt water and fresh* (James 3:11-12). One source, one kind of water; one tree, one kind of fruit. The mixed mouth that blesses and curses (James 3:10) is the unnatural thing the Master''s parable forbids — the fountain and the fig-tree testify against it.'),
  -- thread: james-3-the-wisdom-that-is-from-above-first-pure-then-peaceable-wisdom-7  [BLESSING]
  ('canon', 'james', 3, 17, 'apocrypha', 'the-wisdom-of-solomon', 7, 22, 'extras', E'*For wisdom, which is the worker of all things, taught me: for in her is an understanding spirit holy, one only, manifold, subtil, lively, clear, undefiled, plain, not subject to hurt, loving the thing that is good quick, which cannot be letted, ready to do good,* (Wisdom of Solomon 7:22). Here is the near-verbatim parallel to James''s wisdom from above. Solomon''s hymn names the spirit of wisdom *holy... undefiled... loving the thing that is good... ready to do good* — and James says *the wisdom that is from above is first pure, then peaceable, gentle, and easy to be intreated, full of mercy and good fruits* (James 3:17). The *undefiled* of Solomon is the *pure* of James; the *ready to do good* is the *good fruits.* The two texts hymn one wisdom, descending from above, the gift the man who lacks must ask of Elohim (God).'),
  ('canon', 'james', 3, 17, 'apocrypha', 'the-wisdom-of-solomon', 7, 23, 'extras', E'*Kind to man, steadfast, sure, free from care, having all power, overseeing all things, and going through all understanding, pure, and most subtil, spirits.* (Wisdom of Solomon 7:23). Solomon''s wisdom is *kind to man... pure* — and James''s wisdom from above is *gentle, and easy to be intreated, full of mercy and good fruits, without partiality, and without hypocrisy* (James 3:17). The *kind to man* answers the *gentle* and *full of mercy*; the *pure* answers James''s *first pure.* This is the wisdom that is not *earthly, sensual, devilish* (James 3:15) but heavenly — peaceable, merciful, single-hearted, the very temper Solomon prized above sceptre and throne.'),
  ('canon', 'james', 3, 17, 'apocrypha', 'the-wisdom-of-solomon', 7, 25, 'extras', E'*For she is the breath of the power of Yahuah (God), and a pure influence flowing from the glory of the Almighty: therefore can no defiled thing fall into her.* (Wisdom of Solomon 7:25). Solomon names the source of wisdom from above: *the breath of the power of Yahuah (God), and a pure influence flowing from the glory of the Almighty.* This is why James can call it *the wisdom that is from above* and say it is *first pure* (James 3:17) — *therefore can no defiled thing fall into her.* The earthly wisdom rises from envy and strife (James 3:14-16); the heavenly descends from the glory of the Almighty, pure at its fountainhead, and so pure in all its fruits.'),
  ('canon', 'james', 3, 13, 'canon', 'proverbs', 2, 6, 'free', E'*For Yahuah (LORD) giveth wisdom: out of his mouth cometh knowledge and understanding.* (Proverbs 2:6). The root of the wisdom from above is Proverbs'' own confession — *Yahuah (LORD) giveth wisdom.* James opens the matter by asking *Who is a wise man and endued with knowledge among you? let him shew out of a good conversation his works with meekness of wisdom* (James 3:13), and answers it with *the wisdom that is from above* (James 3:17). The knowledge that comes *out of his mouth* is the gift descending from the Father of lights; true wisdom is shown not in boasting but in meek and good works.'),
  ('canon', 'james', 3, 17, 'canon', 'proverbs', 3, 17, 'free', E'*Her ways are ways of pleasantness, and all her paths are peace.* (Proverbs 3:17). Proverbs paints wisdom''s ways: *ways of pleasantness, and all her paths are peace* — *She is a tree of life to them that lay hold upon her* (Proverbs 3:18). James''s wisdom from above wears the same face: *first pure, then peaceable, gentle... full of mercy and good fruits* (James 3:17), and bears *the fruit of righteousness... sown in peace of them that make peace* (James 3:18). The peace that marks all wisdom''s paths in Proverbs is the peaceableness and the peace-sown fruit of the wisdom James commends.'),
  ('canon', 'james', 3, 13, 'canon', 'job', 28, 28, 'free', E'*And unto man he said, Behold, the fear of Yahuah (Lord), that is wisdom; and to depart from evil is understanding.* (Job 28:28). When Job had searched the deep places for wisdom, the answer was *the fear of Yahuah (Lord), that is wisdom; and to depart from evil is understanding.* James asks who is *a wise man and endued with knowledge* and bids him show it *with meekness of wisdom* (James 3:13), not with *bitter envying and strife* (James 3:14) — for that wisdom is *earthly, sensual, devilish* (James 3:15). To depart from evil, to be pure and peaceable, is the wisdom Job names and James seeks, the wisdom that fears Yahuah (Lord) and comes down from above.'),
  ('canon', 'james', 3, 17, 'apocrypha', 'ecclesiasticus', 1, 1, 'extras', E'*All wisdom comes from Yahuah (God), and is with him for ever.* (Ecclesiasticus 1:1). Sirach opens with the confession James assumes: *all wisdom comes from Yahuah (God).* It is *created before all things* (Sirach 1:4) and given *to them that love him* (Sirach 1:10). This is why James names the heavenly temper *the wisdom that is from above* (James 3:17) — not man''s envious cleverage but the gift descending from Elohim (God), pure and peaceable, full of mercy and good fruits. The wisdom Sirach says comes from Yahuah (God) is the wisdom James says comes down from above.'),
  -- thread: james-3-the-fruit-of-righteousness-sown-in-peace-isaiah-32-hosea-10
  ('canon', 'james', 3, 18, 'canon', 'isaiah', 32, 17, 'free', E'*And the work of righteousness shall be peace; and the effect of righteousness quietness and assurance for ever.* (Isaiah 32:17). Isaiah binds righteousness and peace as one: *the work of righteousness shall be peace.* James closes his wisdom-chapter with the same wedding: *the fruit of righteousness is sown in peace of them that make peace* (James 3:18). The wisdom from above, *peaceable... full of mercy and good fruits* (James 3:17), yields the harvest Isaiah foretold — righteousness whose work and effect is peace, sown by peacemakers and reaped in quietness and assurance.'),
  ('canon', 'james', 3, 18, 'canon', 'proverbs', 11, 18, 'free', E'*The wicked worketh a deceitful work: but to him that soweth righteousness shall be a sure reward.* (Proverbs 11:18). Proverbs sets the sowing of righteousness against the deceitful work of the wicked — *to him that soweth righteousness shall be a sure reward.* James names that same sowing the harvest of heavenly wisdom: *the fruit of righteousness is sown in peace of them that make peace* (James 3:18), over against the *confusion and every evil work* where *envying and strife is* (James 3:16). The sure reward Proverbs promises the sower of righteousness is the fruit James says is sown in peace.'),
  ('canon', 'james', 3, 18, 'canon', 'hosea', 10, 12, 'free', E'*Sow to yourselves in righteousness, reap in mercy; break up your fallow ground: for it is time to seek Yahuah (LORD), till he come and rain righteousness upon you.* (Hosea 10:12). Hosea calls Yashar''el (Israel) to the very sowing James commends: *Sow to yourselves in righteousness, reap in mercy.* James says *the fruit of righteousness is sown in peace of them that make peace* (James 3:18), the harvest of wisdom that is *full of mercy and good fruits* (James 3:17). To sow righteousness and reap mercy, to break up the fallow ground and seek Yahuah (LORD), is the peaceable work of the wise — and Yahuah (LORD) rains righteousness on the seed they sow.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s239_j239c3_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s239_j239c3_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'james-3-the-tongue-a-fire-and-an-unruly-evil-proverbs-18-psalm-39-sirach-28',
       E'The tongue a fire, an unruly evil full of deadly poison (Proverbs 18, Psalm 39, Sirach 28)',
       E'James turns the whole wisdom of the Hebrew library upon the tongue. *If any man offend not in word, the same is a perfect man, and able also to bridle the whole body* (James 3:2) — and the bridle is David''s own resolve: *I said, I will take heed to my ways, that I sin not with my tongue: I will keep my mouth with a bridle* (Psalm 39:1). As *bits in the horses'' mouths* turn the whole beast (James 3:3), so the bridled tongue governs the whole man. But unbridled it is fire: *Even so the tongue is a little member, and boasteth great things. Behold, how great a matter a little fire kindleth! And the tongue is a fire, a world of iniquity... and setteth on fire the course of nature; and it is set on fire of hell* (James 3:5-6) — Proverbs had said as much, *in his lips there is as a burning fire* (Proverbs 16:27). It deals in death and life: *Death and life are in the power of the tongue* (Proverbs 18:21). And no man masters it of himself — *the tongue can no man tame; it is an unruly evil, full of deadly poison* (James 3:8); *They have sharpened their tongues like a serpent; adders'' poison is under their lips* (Psalm 140:3). The Second-Temple library said the same with its own force: *an hasty contention kindleth a fire* (Sirach 28:11), *the stroke of the whip makes marks in the flesh: but the stroke of the tongue breaks the bones* (Sirach 28:17), *many have fallen by the edge of the sword: but not so many as have fallen by the tongue* (Sirach 28:18); and so the wise counsel, *weigh your words in a balance, and make a door and bar for your mouth* (Sirach 28:25). James, writing to the twelve tribes scattered abroad, gathers Proverbs, the Psalms, and Sirach into one warning: the little member is a burning, bone-breaking, serpent-poisoned fire, and the doer of the perfect law of liberty must put a bridle on it.',
       sv.verse_id, ev.verse_id, 'extras', 8860
  FROM _s239_j239c3_lookup sv, _s239_j239c3_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=3 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='james' AND ev.chapter_number=3 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'james-3-bless-and-curse-men-made-after-the-similitude-of-elohim-genesis-1',
       E'Blessing and cursing from one mouth: men made after the similitude of Elohim (God) (Genesis 1, 9)',
       E'James names the deepest scandal of the divided tongue: *Therewith bless we Elohim (God), even the Father; and therewith curse we men, which are made after the similitude of Elohim (God). Out of the same mouth proceedeth blessing and cursing. My brethren, these things ought not so to be* (James 3:9-10). The *similitude* is the creation word: *And Elohim (God) said, Let us make man in our image, after our likeness* (Genesis 1:26); *So Elohim (God) created man in his own image, in the image of Elohim (God) created he him; male and female created he them* (Genesis 1:27). To curse a man is to revile the very image of the One we bless — the same likeness Genesis names again as the ground of man''s sacredness after the flood: *Whoso sheddeth man''s blood, by man shall his blood be shed: for in the image of Elohim (God) made he man* (Genesis 9:6). As the shedding of blood violates the image, so does the cursing tongue. The mouth that blesses the Father cannot rightly curse the man who bears the Father''s likeness; *these things ought not so to be.* The wisdom from above honors the image of Elohim (God) in every man made after his similitude.',
       sv.verse_id, ev.verse_id, 'free', 8863
  FROM _s239_j239c3_lookup sv, _s239_j239c3_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=3 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='james' AND ev.chapter_number=3 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'james-3-the-fountain-and-the-fig-tree-known-by-their-fruit-matthew-7',
       E'The fountain and the fig-tree: every tree known by its own fruit (Matthew 7)',
       E'*Doth a fountain send forth at the same place sweet water and bitter? Can the fig tree, my brethren, bear olive berries? either a vine, figs? so can no fountain both yield salt water and fresh* (James 3:11-12). James reasons from nature against the blessing-and-cursing mouth of the verses before: each spring yields one water, each tree its own fruit. This is the Sermon on the Mount, James''s twin, spoken in another key. Yahusha (Jesus) said *Ye shall know them by their fruits. Do men gather grapes of thorns, or figs of thistles?* (Matthew 7:16); *Even so every good tree bringeth forth good fruit; but a corrupt tree bringeth forth evil fruit* (Matthew 7:17); *A good tree cannot bring forth evil fruit, neither can a corrupt tree bring forth good fruit* (Matthew 7:18). The Master''s rule and the apostle''s figure are one: the heart is known by the fruit of the lips. A mouth that blesses and curses, a fountain sweet and bitter, is the unnatural thing the parable forbids — the good tree and the pure spring bring forth one kind, and by that kind the wise man is known.',
       sv.verse_id, ev.verse_id, 'free', 8866
  FROM _s239_j239c3_lookup sv, _s239_j239c3_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=3 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='james' AND ev.chapter_number=3 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'james-3-the-wisdom-that-is-from-above-first-pure-then-peaceable-wisdom-7',
       E'The wisdom that is from above: first pure, then peaceable (Proverbs, Job, Wisdom of Solomon, Sirach)',
       E'James sets two wisdoms side by side. The one is *earthly, sensual, devilish,* rising from *bitter envying and strife,* and where it reigns *there is confusion and every evil work* (James 3:15-16). The other comes down from heaven: *But the wisdom that is from above is first pure, then peaceable, gentle, and easy to be intreated, full of mercy and good fruits, without partiality, and without hypocrisy* (James 3:17). Its root is Proverbs'' own confession — *For Yahuah (LORD) giveth wisdom: out of his mouth cometh knowledge and understanding* (Proverbs 2:6) — and its ways are Proverbs'' ways: *Her ways are ways of pleasantness, and all her paths are peace* (Proverbs 3:17). It is the wisdom Job found at the end of his searching: *Behold, the fear of Yahuah (Lord), that is wisdom; and to depart from evil is understanding* (Job 28:28). And it is the very wisdom the restored library had already hymned in words James echoes almost verbatim: *in her is an understanding spirit holy, one only, manifold, subtil, lively, clear, undefiled, plain, not subject to hurt, loving the thing that is good... ready to do good, Kind to man* (Wisdom of Solomon 7:22-23) — Solomon''s *undefiled* and *kind to man* are James''s *pure* and *gentle... full of mercy.* Its source is *the breath of the power of Yahuah (God), and a pure influence flowing from the glory of the Almighty: therefore can no defiled thing fall into her* (Wisdom of Solomon 7:25); and as Sirach confessed, *all wisdom comes from Yahuah (God), and is with him for ever* (Ecclesiasticus 1:1). This is why James calls it *from above* — not man''s envious leverage but the gift descending from the Father of lights, pure at its fountainhead and pure in all its fruits, shown not in boasting but in the *good conversation* and *works with meekness of wisdom* of the wise man (James 3:13).',
       sv.verse_id, ev.verse_id, 'extras', 8869
  FROM _s239_j239c3_lookup sv, _s239_j239c3_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=3 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='james' AND ev.chapter_number=3 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'james-3-the-fruit-of-righteousness-sown-in-peace-isaiah-32-hosea-10',
       E'The fruit of righteousness sown in peace of them that make peace (Isaiah 32, Proverbs 11, Hosea 10)',
       E'James closes the wisdom-chapter on a harvest: *And the fruit of righteousness is sown in peace of them that make peace* (James 3:18). It is the natural yield of the wisdom from above, which is *peaceable... full of mercy and good fruits* (James 3:17), over against the *confusion and every evil work* that envy and strife bring forth (James 3:16). The prophets had already wedded righteousness to peace: *And the work of righteousness shall be peace; and the effect of righteousness quietness and assurance for ever* (Isaiah 32:17). Proverbs had set the sowing of righteousness against the deceit of the wicked: *to him that soweth righteousness shall be a sure reward* (Proverbs 11:18). And Hosea had called Yashar''el (Israel) to that very sowing: *Sow to yourselves in righteousness, reap in mercy; break up your fallow ground: for it is time to seek Yahuah (LORD), till he come and rain righteousness upon you* (Hosea 10:12). The peacemakers who sow in peace reap the sure reward Proverbs promised, the peace Isaiah foretold, the mercy Hosea pledged — Yahuah (LORD) himself raining righteousness on the seed they sow. This is the end of heavenly wisdom: not strife, but a harvest of righteousness in peace.',
       sv.verse_id, ev.verse_id, 'free', 8872
  FROM _s239_j239c3_lookup sv, _s239_j239c3_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=3 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='james' AND ev.chapter_number=3 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: james-3-the-tongue-a-fire-and-an-unruly-evil-proverbs-18-psalm-39-sirach-28
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 39:1 — *I will keep my mouth with a bridle* David''s resolve, the very image of *bridle the whole body* / *bits in the horses'' mouths* (James 3:2-3).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c3_lookup sv, _s239_j239c3_lookup tv
 WHERE t.slug='james-3-the-tongue-a-fire-and-an-unruly-evil-proverbs-18-psalm-39-sirach-28'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=3 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=39 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 18:21 — *Death and life are in the power of the tongue* the gravest weight of the little member that *boasteth great things* (James 3:5).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c3_lookup sv, _s239_j239c3_lookup tv
 WHERE t.slug='james-3-the-tongue-a-fire-and-an-unruly-evil-proverbs-18-psalm-39-sirach-28'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=3 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=18 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 16:27 — *in his lips there is as a burning fire* the mouth a hearth of fire; *the tongue is a fire, a world of iniquity* (James 3:6).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c3_lookup sv, _s239_j239c3_lookup tv
 WHERE t.slug='james-3-the-tongue-a-fire-and-an-unruly-evil-proverbs-18-psalm-39-sirach-28'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=3 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=16 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Sirach 28:17 — *the stroke of the tongue breaks the bones* James''s nearest companion on the burning, bone-breaking tongue; *the tongue is a fire... it defileth the whole body* (James 3:6).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c3_lookup sv, _s239_j239c3_lookup tv
 WHERE t.slug='james-3-the-tongue-a-fire-and-an-unruly-evil-proverbs-18-psalm-39-sirach-28'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=3 AND sv.verse_number=6
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=28 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Psalm 140:3 — *adders'' poison is under their lips* the serpent-venom of the untamed tongue; *an unruly evil, full of deadly poison* (James 3:8).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c3_lookup sv, _s239_j239c3_lookup tv
 WHERE t.slug='james-3-the-tongue-a-fire-and-an-unruly-evil-proverbs-18-psalm-39-sirach-28'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=3 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=140 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: james-3-bless-and-curse-men-made-after-the-similitude-of-elohim-genesis-1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:26 — *Let us make man in our image, after our likeness* the *similitude of Elohim (God)* after which men are made (James 3:9).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c3_lookup sv, _s239_j239c3_lookup tv
 WHERE t.slug='james-3-bless-and-curse-men-made-after-the-similitude-of-elohim-genesis-1'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=3 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 1:27 — *in the image of Elohim (God) created he him* the image the cursing tongue assaults; *these things ought not so to be* (James 3:10).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c3_lookup sv, _s239_j239c3_lookup tv
 WHERE t.slug='james-3-bless-and-curse-men-made-after-the-similitude-of-elohim-genesis-1'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=3 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 9:6 — *for in the image of Elohim (God) made he man* the image the ground of man''s sacredness; as shedding blood violates it, so the cursing tongue (James 3:9-10).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c3_lookup sv, _s239_j239c3_lookup tv
 WHERE t.slug='james-3-bless-and-curse-men-made-after-the-similitude-of-elohim-genesis-1'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=3 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: james-3-the-fountain-and-the-fig-tree-known-by-their-fruit-matthew-7
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 7:18 — *A good tree cannot bring forth evil fruit* the impossibility set in the fountain: *Doth a fountain send forth... sweet water and bitter?* (James 3:11).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c3_lookup sv, _s239_j239c3_lookup tv
 WHERE t.slug='james-3-the-fountain-and-the-fig-tree-known-by-their-fruit-matthew-7'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=3 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 7:16 — *Do men gather grapes of thorns, or figs of thistles?* the twin of *Can the fig tree... bear olive berries? either a vine, figs?* (James 3:12).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c3_lookup sv, _s239_j239c3_lookup tv
 WHERE t.slug='james-3-the-fountain-and-the-fig-tree-known-by-their-fruit-matthew-7'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=3 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 7:17 — *every good tree bringeth forth good fruit; but a corrupt tree bringeth forth evil fruit* each tree after its own kind, as each fountain (James 3:11-12).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c3_lookup sv, _s239_j239c3_lookup tv
 WHERE t.slug='james-3-the-fountain-and-the-fig-tree-known-by-their-fruit-matthew-7'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=3 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: james-3-the-wisdom-that-is-from-above-first-pure-then-peaceable-wisdom-7
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 2:6 — *Yahuah (LORD) giveth wisdom: out of his mouth cometh knowledge* the root of the wisdom from above; the wise man shown *with meekness of wisdom* (James 3:13).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c3_lookup sv, _s239_j239c3_lookup tv
 WHERE t.slug='james-3-the-wisdom-that-is-from-above-first-pure-then-peaceable-wisdom-7'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=3 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=2 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Job 28:28 — *the fear of Yahuah (Lord), that is wisdom; and to depart from evil is understanding* the wisdom Job found, not envy and strife (James 3:13-15).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c3_lookup sv, _s239_j239c3_lookup tv
 WHERE t.slug='james-3-the-wisdom-that-is-from-above-first-pure-then-peaceable-wisdom-7'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=3 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=28 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Wisdom of Solomon 7:22 — *an understanding spirit holy... undefiled... loving the thing that is good... ready to do good* the near-verbatim parallel; *first pure... full of mercy and good fruits* (James 3:17).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c3_lookup sv, _s239_j239c3_lookup tv
 WHERE t.slug='james-3-the-wisdom-that-is-from-above-first-pure-then-peaceable-wisdom-7'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=3 AND sv.verse_number=17
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=7 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Wisdom of Solomon 7:23 — *Kind to man... pure* Solomon''s *kind to man* answers James''s *gentle... full of mercy*; the heavenly temper, not the *earthly, sensual, devilish* (James 3:15,17).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c3_lookup sv, _s239_j239c3_lookup tv
 WHERE t.slug='james-3-the-wisdom-that-is-from-above-first-pure-then-peaceable-wisdom-7'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=3 AND sv.verse_number=17
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=7 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Wisdom of Solomon 7:25 — *the breath of the power of Yahuah (God)... therefore can no defiled thing fall into her* the source that makes it *from above* and *first pure* (James 3:17).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c3_lookup sv, _s239_j239c3_lookup tv
 WHERE t.slug='james-3-the-wisdom-that-is-from-above-first-pure-then-peaceable-wisdom-7'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=3 AND sv.verse_number=17
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=7 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Proverbs 3:17 — *Her ways are ways of pleasantness, and all her paths are peace* the peace that marks all wisdom''s paths; *peaceable... the fruit of righteousness... sown in peace* (James 3:17-18).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c3_lookup sv, _s239_j239c3_lookup tv
 WHERE t.slug='james-3-the-wisdom-that-is-from-above-first-pure-then-peaceable-wisdom-7'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=3 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Ecclesiasticus/Sirach 1:1 — *All wisdom comes from Yahuah (God), and is with him for ever* the confession James assumes in calling it *from above* (James 3:17).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c3_lookup sv, _s239_j239c3_lookup tv
 WHERE t.slug='james-3-the-wisdom-that-is-from-above-first-pure-then-peaceable-wisdom-7'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=3 AND sv.verse_number=17
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: james-3-the-fruit-of-righteousness-sown-in-peace-isaiah-32-hosea-10
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 32:17 — *the work of righteousness shall be peace* the prophets'' wedding of righteousness and peace; *the fruit of righteousness is sown in peace* (James 3:18).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c3_lookup sv, _s239_j239c3_lookup tv
 WHERE t.slug='james-3-the-fruit-of-righteousness-sown-in-peace-isaiah-32-hosea-10'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=3 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=32 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 11:18 — *to him that soweth righteousness shall be a sure reward* the sower''s sure reward, over against *every evil work* (James 3:16,18).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c3_lookup sv, _s239_j239c3_lookup tv
 WHERE t.slug='james-3-the-fruit-of-righteousness-sown-in-peace-isaiah-32-hosea-10'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=3 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=11 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hosea 10:12 — *Sow to yourselves in righteousness, reap in mercy... till he come and rain righteousness upon you* Yashar''el (Israel) called to the very sowing of the peacemakers (James 3:18).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c3_lookup sv, _s239_j239c3_lookup tv
 WHERE t.slug='james-3-the-fruit-of-righteousness-sown-in-peace-isaiah-32-hosea-10'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=3 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=10 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
