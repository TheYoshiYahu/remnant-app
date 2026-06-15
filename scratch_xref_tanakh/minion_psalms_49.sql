-- ----- fragment: minion_psalms_49.sql (Psalm 49) -----
-- Chapter: Psalm 49 — THE GREAT WISDOM PSALM, *none can redeem his brother*. The sons of Korah call
-- *all ye people... both low and high, rich and poor* (vv.1-2) to a parable on the limit of wealth and
-- the levelling of death. Its load-bearing weaves: ★★ vv.7-9 *None of them can by any means redeem his
-- brother, nor give to Elohim (God) a ransom for him... That he should still live for ever, and not see
-- corruption* — NO MAN can ransom another; only Elohim redeems (v.15), and the ransom that man cannot
-- give is the one Messiah alone gives (Matthew 20:28 / Mark 10:45, 1 Timothy 2:6, 1 Peter 1:18-19); the
-- *not see corruption* laterals to Psalm 16:10 (quoted Acts 2:27,31). ★★ v.15 *But Elohim (God) will
-- redeem my soul from the power of the grave: for he shall receive me* — the resurrection hope, redemption
-- from Sheol (Hosea 13:14, Psalm 30:3, 1 Corinthians 15:54-55). vv.10-14,20 the refrain *man being in
-- honour abideth not: he is like the beasts that perish* — mortality levels wise and fool alike (Ecclesiastes
-- 2:16, the rich fool Luke 12:20-21, James 1:10-11; restored wisdom Sirach 14, Wisdom of Solomon 5:8-9).
-- vv.16-19 *when he dieth he shall carry nothing away* — riches left behind (1 Timothy 6:7, Job 27:19,
-- Sirach 11:18-19). The psalm is the anti-mammon foundation: riches cannot buy the soul's redemption.
-- Tag: ps049   Temp view: _s302_ps049_lookup
-- Sort band: base 23200, step 3 -> threads at 23200, 23203, 23206, 23209 (4 threads)
-- Source of EVERY row: 'canon','psalms',49,v
--
-- Psalm 49 coverage:
--   v.1-6 (Hear this, all ye people... Both low and high, rich and poor... They that trust in their wealth,
--          and boast themselves in the multitude of their riches)
--        NT:     none warranted as separate (the universal-summons + boast-in-wealth is the lead-in to the
--                ransom parable; folded into THREAD 1's intro)
--        Extras: none warranted
--        Tanakh: none warranted as separate
--   ★★ v.7-9 (None of them can by any means redeem his brother, nor give to Elohim (God) a ransom for him:
--          (For the redemption of their soul is precious, and it ceaseth for ever:) That he should still
--          live for ever, and not see corruption)
--        NT:     ★★ Matthew 20:28 / Mark 10:45 (to give his life a ransom for many), 1 Timothy 2:6 (Who gave
--                himself a ransom for all), 1 Peter 1:18-19 (ye were not redeemed with corruptible things,
--                as silver and gold... but with the precious blood of Messiah) — THREAD 1 (load-bearing:
--                the ransom man CANNOT give is the one Messiah alone gives)
--        Extras: none warranted (the ransom-only-from-Elohim is carried cleaner by the canon NT + Psalm 16)
--        Tanakh: ★ Psalm 16:10 (neither wilt thou suffer thine Holy One to see corruption — quoted Acts
--                2:27,31; the *not see corruption* of 49:9 fulfilled in the One Elohim raised) — THREAD 1
--   v.10-13 (he seeth that wise men die, likewise the fool and the brutish person perish... their houses
--          shall continue for ever... they call their lands after their own names. This their way is their folly)
--        NT:     ★ Luke 12:20-21 (Thou fool, this night thy soul shall be required of thee — the rich fool) — THREAD 3
--        Extras: ★ Sirach 11:18-19 (he says, I have found rest... and yet he knoweth not what time shall come
--                upon him, and that he must leave those things to others, and die) — THREAD 4 (the houses-shall-
--                continue conceit answered); ★ Sirach 14:15-19 (Shall you not leave your travails to another?...
--                one comes to an end, and another is born) — THREAD 3
--        Tanakh: ★ Ecclesiastes 2:16 (how dieth the wise man? as the fool — wise and fool die alike) — THREAD 3
--   v.14 (Like sheep they are laid in the grave; death shall feed on them... the upright shall have dominion
--          over them in the morning)
--        NT/Extras/Tanakh: folded into THREAD 3 (the levelling of death) as the dark image; the *upright shall
--                have dominion... in the morning* hope is gathered into the redemption of THREAD 2
--   ★★ v.15 (But Elohim (God) will redeem my soul from the power of the grave: for he shall receive me)
--        NT:     ★★ 1 Corinthians 15:54-55 (Death is swallowed up in victory. O death, where is thy sting?
--                O grave, where is thy victory?) — THREAD 2 (load-bearing resurrection)
--        Extras: none warranted (the ransom-from-the-grave is carried cleaner by Hosea 13 + the canon witnesses)
--        Tanakh: ★★ Hosea 13:14 (I will ransom them from the power of the grave; I will redeem them from death:
--                O death, I will be thy plagues; O grave, I will be thy destruction), ★ Psalm 30:3 (O Yahuah
--                (LORD), thou hast brought up my soul from the grave) — THREAD 2
--   v.16-19 (Be not thou afraid when one is made rich... For when he dieth he shall carry nothing away: his
--          glory shall not descend after him... He shall go to the generation of his fathers; they shall
--          never see light)
--        NT:     ★ 1 Timothy 6:7 (we brought nothing into this world, and it is certain we can carry nothing out) — THREAD 4
--        Extras: ★ Sirach 11:18-19 (he must leave those things to others, and die) — THREAD 4
--        Tanakh: ★ Job 27:19 (The rich man shall lie down, but he shall not be gathered: he openeth his eyes,
--                and he is not) — THREAD 4
--   v.20 (Man that is in honour, and understandeth not, is like the beasts that perish)
--        NT/Extras/Tanakh: the closing refrain (echoes v.12); folded into THREAD 3 as the seal of the parable
--
-- Threads (slug — target libraries):
--   1. psalm-49-none-can-redeem-his-brother-only-elohim-ransoms — NT (Matthew 20, Mark 10, 1 Timothy 2,
--      1 Peter 1) + Tanakh (Psalm 16) [free] (★★ the ransom man cannot give = the one Messiah alone gives;
--      not-see-corruption laterals Psalm 16:10/Acts 2)
--   2. psalm-49-elohim-will-redeem-my-soul-from-the-grave — NT (1 Corinthians 15) + Tanakh (Hosea 13,
--      Psalm 30) [free] (★★ resurrection hope; redemption from Sheol — Elohim shall receive me)
--   3. psalm-49-like-the-beasts-that-perish-the-folly-of-riches — NT (Luke 12, James 1) + Tanakh
--      (Ecclesiastes 2) + Extras (Sirach 14, Wisdom of Solomon 5) [extras] (mortality levels wise and fool;
--      riches cannot deliver; the rich fool)
--   4. psalm-49-he-shall-carry-nothing-away — NT (1 Timothy 6) + Tanakh (Job 27) + Extras (Sirach 11)
--      [extras] (when he dieth he carries nothing away; his glory descends not after him)
--
-- Framing notes:
--   ★★ NONE CAN REDEEM HIS BROTHER (THREAD 1): *They that trust in their wealth, and boast themselves in the
--      multitude of their riches; None of them can by any means redeem his brother, nor give to Elohim (God) a
--      ransom for him: (For the redemption of their soul is precious, and it ceaseth for ever:) That he should
--      still live for ever, and not see corruption* (49:6-9). Riches buy nothing here: no man can ransom a
--      brother's soul. The ransom man cannot give is the one Messiah alone gives — *the Son of Adam came not to
--      be ministered unto, but to minister, and to give his life a ransom for many* (Matthew 20:28; Mark 10:45);
--      *Who gave himself a ransom for all* (1 Timothy 2:6). And it is paid not in the perishable wealth the psalm
--      names — *ye were not redeemed with corruptible things, as silver and gold... But with the precious blood
--      of Messiah (Christ)* (1 Peter 1:18-19). The *not see corruption* of 49:9, denied to the rich man, is
--      granted to the Holy One: *neither wilt thou suffer thine Holy One to see corruption* (Psalm 16:10).
--   ★★ ELOHIM WILL REDEEM MY SOUL FROM THE GRAVE (THREAD 2): against the rich man's helpless wealth stands the
--      psalmist's hope — *But Elohim (God) will redeem my soul from the power of the grave: for he shall receive
--      me* (49:15). What no brother's silver can do, Elohim does. Hosea sings the same ransom — *I will ransom
--      them from the power of the grave; I will redeem them from death: O death, I will be thy plagues; O grave,
--      I will be thy destruction* (Hosea 13:14) — which Paul takes up at the resurrection — *Death is swallowed
--      up in victory. O death, where is thy sting? O grave, where is thy victory?* (1 Corinthians 15:54-55) —
--      and David has tasted it already — *O Yahuah (LORD), thou hast brought up my soul from the grave* (Psalm 30:3).
--   THE FOLLY OF RICHES — LIKE THE BEASTS THAT PERISH (THREAD 3): the parable's verdict is that death levels all —
--      *he seeth that wise men die, likewise the fool and the brutish person perish, and leave their wealth to
--      others... Nevertheless man being in honour abideth not: he is like the beasts that perish* (49:10-12),
--      sealed by the refrain *Man that is in honour, and understandeth not, is like the beasts that perish*
--      (49:20). Solomon saw it — *how dieth the wise man? as the fool* (Ecclesiastes 2:16). Yahusha tells it as a
--      parable: the rich man who built greater barns hears, *Thou fool, this night thy soul shall be required of
--      thee... So is he that layeth up treasure for himself, and is not rich toward Elohim (God)* (Luke 12:20-21);
--      and James — *as the flower of the grass he shall pass away... so also shall the rich man fade away in his
--      ways* (James 1:10-11). The restored wisdom presses it: *Shall you not leave your travails to another?...
--      one comes to an end, and another is born* (Sirach 14:15-19); and the ungodly themselves confess too late,
--      *What has pride profited us? or what good has riches with our vaunting brought us? All those things are
--      passed away like a shadow* (Wisdom of Solomon 5:8-9).
--   HE SHALL CARRY NOTHING AWAY (THREAD 4): the comfort against envy is mortality itself — *Be not thou afraid
--      when one is made rich, when the glory of his house is increased; For when he dieth he shall carry nothing
--      away: his glory shall not descend after him* (49:16-17). Paul says it plainly — *we brought nothing into
--      this world, and it is certain we can carry nothing out* (1 Timothy 6:7). Job paints the end — *The rich
--      man shall lie down, but he shall not be gathered: he openeth his eyes, and he is not* (Job 27:19). And the
--      restored wisdom names the conceit of the houses-shall-continue thought — *he says, I have found rest, and
--      now will eat continually of my goods; and yet he knoweth not what time shall come upon him, and that he
--      must leave those things to others, and die* (Sirach 11:18-19).
--   VERSES WITH NO SEPARATE ADD: vv.1-6 (the universal summons + boast-in-wealth) are the lead-in to THREAD 1;
--      v.4's *parable... dark saying upon the harp* frames the whole; v.14 (laid in the grave like sheep) and
--      v.20 (the closing refrain) fold into THREAD 3; v.13,18 (the folly approved / blessing his own soul) carry
--      the parable's irony and are gathered under THREADS 3-4. The chapter's framework weight sits on the
--      ransom (vv.7-9), the redemption from the grave (v.15), and the levelling of death (vv.10-20).

CREATE TEMP VIEW _s302_ps049_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★): None can redeem his brother — only Elohim ransoms; the ransom Messiah alone gives
    ('canon','psalms',49,7,'canon','matthew',20,28,'free',
      E'*Even as the Son of Adam came not to be ministered unto, but to minister, and to give his life a ransom for many* (Matthew 20:28). *None of them can by any means redeem his brother, nor give to Elohim (God) a ransom for him* (Psalm 49:7): no man can ransom a brother''s soul — but the Son of Adam comes to give the very ransom man cannot. What the rich man''s wealth could never buy, the Formed Son gives with his own life.'),
    ('canon','psalms',49,7,'canon','mark',10,45,'free',
      E'*For even the Son of Adam came not to be ministered unto, but to minister, and to give his life a ransom for many* (Mark 10:45). *None of them can by any means redeem his brother, nor give to Elohim (God) a ransom for him* (Psalm 49:7): set against the rich who *trust in riches* (Mark 10:24), the ransom no brother''s silver can pay is paid by the Son of Adam''s own life, the one redemption-price that avails.'),
    ('canon','psalms',49,7,'canon','1-timothy',2,6,'free',
      E'*Who gave himself a ransom for all, to be testified in due time* (1 Timothy 2:6). *None of them can by any means redeem his brother, nor give to Elohim (God) a ransom for him* (Psalm 49:7): there is *one mediator between Elohim (God) and men, the man HaMashiach Yahusha* (1 Timothy 2:5), and he gives himself the ransom — the redemption the psalm says is *precious* (49:8), too dear for any man to pay, paid by the Mediator alone.'),
    ('canon','psalms',49,8,'canon','1-peter',1,18,'free',
      E'*Forasmuch as ye know that ye were not redeemed with corruptible things, as silver and gold, from your vain conversation received by tradition from your fathers* (1 Peter 1:18). *For the redemption of their soul is precious, and it ceaseth for ever* (Psalm 49:8): the redemption is not bought with the perishable wealth the rich trust in — *silver and gold* purchase nothing here. The soul''s ransom is too precious for corruptible coin.'),
    ('canon','psalms',49,8,'canon','1-peter',1,19,'free',
      E'*But with the precious blood of Messiah (Christ), as of a lamb without blemish and without spot* (1 Peter 1:19). *For the redemption of their soul is precious* (Psalm 49:8): the precious price the psalm says man cannot give is named — the *precious blood of Messiah*, the spotless Lamb. What riches could never ransom, the blood of the Formed Son redeems.'),
    ('canon','psalms',49,9,'canon','psalms',16,10,'free',
      E'*For thou wilt not leave my soul in hell; neither wilt thou suffer thine Holy One to see corruption* (Psalm 16:10). *That he should still live for ever, and not see corruption* (Psalm 49:9): the deathless life and the *not see corruption* the rich man cannot purchase is granted to the Holy One — the body Elohim would not suffer to see corruption, raised from the grave (Acts 2:27,31). What wealth cannot buy, resurrection gives.'),

    -- THREAD 2 (★★): But Elohim will redeem my soul from the power of the grave
    ('canon','psalms',49,15,'canon','hosea',13,14,'free',
      E'*I will ransom them from the power of the grave; I will redeem them from death: O death, I will be thy plagues; O grave, I will be thy destruction* (Hosea 13:14). *But Elohim (God) will redeem my soul from the power of the grave: for he shall receive me* (Psalm 49:15): what no brother''s silver can do (49:7), Elohim does — He ransoms from the grave and redeems from death. The same word, ransom and redeem from the power of the grave, is His own promise.'),
    ('canon','psalms',49,15,'canon','1-corinthians',15,54,'free',
      E'*So when this corruptible shall have put on incorruption, and this mortal shall have put on immortality, then shall be brought to pass the saying that is written, Death is swallowed up in victory* (1 Corinthians 15:54). *But Elohim (God) will redeem my soul from the power of the grave: for he shall receive me* (Psalm 49:15): the redemption from the grave the psalmist hoped becomes the resurrection — death swallowed up, the corruptible clothed in incorruption. Elohim receives His own out of the power of the grave.'),
    ('canon','psalms',49,15,'canon','1-corinthians',15,55,'free',
      E'*O death, where is thy sting? O grave, where is thy victory?* (1 Corinthians 15:55). *But Elohim (God) will redeem my soul from the power of the grave* (Psalm 49:15): Paul taunts the grave that has no final claim — the power of the grave broken, the redeemed soul received. The hope the psalm sets against the rich man''s helpless end is the empty grave.'),
    ('canon','psalms',49,15,'canon','psalms',30,3,'free',
      E'*O Yahuah (LORD), thou hast brought up my soul from the grave: thou hast kept me alive, that I should not go down to the pit* (Psalm 30:3). *But Elohim (God) will redeem my soul from the power of the grave: for he shall receive me* (Psalm 49:15): the same deliverance — Yahuah bringing the soul up from the grave. The psalter knows by experience the redemption Psalm 49 trusts: Elohim is the One who reaches into the pit and lifts out.'),

    -- THREAD 3: Like the beasts that perish — the folly of riches; death levels wise and fool
    ('canon','psalms',49,10,'canon','ecclesiastes',2,16,'free',
      E'*For there is no remembrance of the wise more than of the fool for ever... And how dieth the wise man? as the fool* (Ecclesiastes 2:16). *For he seeth that wise men die, likewise the fool and the brutish person perish, and leave their wealth to others* (Psalm 49:10): the preacher and the psalmist see the same levelling — the wise man dies as the fool, and the wealth is left behind. Death erases the difference riches and wisdom seemed to make.'),
    ('canon','psalms',49,12,'canon','luke',12,20,'free',
      E'*But Elohim (God) said unto him, Thou fool, this night thy soul shall be required of thee: then whose shall those things be, which thou hast provided?* (Luke 12:20). *Nevertheless man being in honour abideth not: he is like the beasts that perish* (Psalm 49:12): Yahusha tells the psalm as a parable — the rich man who said his soul had goods laid up for many years hears his soul required that night. The man in honour does not abide; his provided things pass to another.'),
    ('canon','psalms',49,12,'canon','luke',12,21,'free',
      E'*So is he that layeth up treasure for himself, and is not rich toward Elohim (God)* (Luke 12:21). *Nevertheless man being in honour abideth not: he is like the beasts that perish* (Psalm 49:12): the verdict of the parable is the verdict of the psalm — to hoard treasure for self and not toward Elohim is to abide not, to perish like the beasts. Riches toward self cannot redeem the soul.'),
    ('canon','psalms',49,12,'canon','james',1,11,'free',
      E'*For the sun is no sooner risen with a burning heat, but it withereth the grass, and the flower thereof falleth, and the grace of the fashion of it perisheth: so also shall the rich man fade away in his ways* (James 1:11). *Nevertheless man being in honour abideth not: he is like the beasts that perish* (Psalm 49:12): James fixes the same fading — the rich man wilts like the flower of the grass. The honour does not abide; the beauty consumes in the grave (49:14).'),
    ('canon','psalms',49,10,'apocrypha','ecclesiasticus',14,16,'extras',
      E'*Give, and take, and sanctify your soul; for there is no seeking of dainties in the grave* (Sirach 14:16). *Wise men die, likewise the fool and the brutish person perish, and leave their wealth to others* (Psalm 49:10): the restored wisdom presses the same — there is no enjoying of goods in the grave, and *Shall you not leave your travails to another?* (Sirach 14:15). The hoarded wealth is left; the grave seeks no dainties.'),
    ('canon','psalms',49,12,'apocrypha','the-wisdom-of-solomon',5,8,'extras',
      E'*What has pride profited us? or what good has riches with our vaunting brought us? All those things are passed away like a shadow* (Wisdom of Solomon 5:8-9). *Man being in honour abideth not: he is like the beasts that perish* (Psalm 49:12): the ungodly confess too late what the psalm taught — pride and riches profit nothing, all passed away like a shadow. The honour and the wealth abide not; only the verdict of the grave remains.'),

    -- THREAD 4: He shall carry nothing away — riches left behind
    ('canon','psalms',49,17,'canon','1-timothy',6,7,'free',
      E'*For we brought nothing into this world, and it is certain we can carry nothing out* (1 Timothy 6:7). *For when he dieth he shall carry nothing away: his glory shall not descend after him* (Psalm 49:17): Paul states the psalm''s law plainly — nothing brought in, nothing carried out. The glory of the rich man''s house does not follow him down; the wealth stays above the grave.'),
    ('canon','psalms',49,17,'canon','job',27,19,'free',
      E'*The rich man shall lie down, but he shall not be gathered: he openeth his eyes, and he is not* (Job 27:19). *For when he dieth he shall carry nothing away: his glory shall not descend after him* (Psalm 49:17): Job draws the same picture — the rich man lies down with his wealth and wakes to find himself gone, the riches not gathered after him. He carries nothing away.'),
    ('canon','psalms',49,17,'apocrypha','ecclesiasticus',11,19,'extras',
      E'*Whereas he says, I have found rest, and now will eat continually of my goods; and yet he knoweth not what time shall come upon him, and that he must leave those things to others, and die* (Sirach 11:19). *For when he dieth he shall carry nothing away* (Psalm 49:17), against the conceit that *their houses shall continue for ever* (49:11): the restored wisdom names the very thought — the man at rest among his goods who knows not he must leave them to others and die. He carries nothing away.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s302_ps049_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s302_ps049_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-49-none-can-redeem-his-brother-only-elohim-ransoms',
       E'None of them can redeem his brother — only Elohim ransoms; the ransom Messiah alone gives',
       E'The great wisdom psalm strips the rich of their last boast: *They that trust in their wealth, and boast themselves in the multitude of their riches; None of them can by any means redeem his brother, nor give to Elohim (God) a ransom for him: (For the redemption of their soul is precious, and it ceaseth for ever:) That he should still live for ever, and not see corruption* (Psalm 49:6-9). No man can ransom a brother''s soul; the price is too precious for any wealth. But the ransom man cannot give is the one the Formed Son comes to give: *Even as the Son of Adam came not to be ministered unto, but to minister, and to give his life a ransom for many* (Matthew 20:28; Mark 10:45); *Who gave himself a ransom for all* (1 Timothy 2:6), the *one mediator between Elohim (God) and men, the man HaMashiach Yahusha* (1 Timothy 2:5). And it is not bought with the perishable wealth the rich trust in: *ye were not redeemed with corruptible things, as silver and gold... But with the precious blood of Messiah (Christ), as of a lamb without blemish and without spot* (1 Peter 1:18-19). The deathless life and the *not see corruption* of 49:9, denied to the rich man, is granted to the Holy One: *neither wilt thou suffer thine Holy One to see corruption* (Psalm 16:10) — fulfilled when Elohim raised him and his flesh did not see corruption. What no man''s riches can purchase, the blood of the Formed Son redeems.',
       sv.verse_id, ev.verse_id, 'free', 23200
  FROM _s302_ps049_lookup sv, _s302_ps049_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=49 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=49 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-49-elohim-will-redeem-my-soul-from-the-grave',
       E'But Elohim will redeem my soul from the power of the grave',
       E'Against the rich man''s helpless wealth — which can ransom no one (49:7) — stands the psalmist''s hope: *But Elohim (God) will redeem my soul from the power of the grave: for he shall receive me* (Psalm 49:15). What no brother''s silver can buy, Elohim does. Hosea sings the same ransom in the same words: *I will ransom them from the power of the grave; I will redeem them from death: O death, I will be thy plagues; O grave, I will be thy destruction* (Hosea 13:14). Paul takes the promise up at the resurrection: *So when this corruptible shall have put on incorruption, and this mortal shall have put on immortality, then shall be brought to pass the saying that is written, Death is swallowed up in victory. O death, where is thy sting? O grave, where is thy victory?* (1 Corinthians 15:54-55). And David has already tasted it: *O Yahuah (LORD), thou hast brought up my soul from the grave: thou hast kept me alive, that I should not go down to the pit* (Psalm 30:3). The redemption riches cannot purchase is the redemption Elohim gives — He reaches into the power of the grave and receives His own.',
       sv.verse_id, ev.verse_id, 'free', 23203
  FROM _s302_ps049_lookup sv, _s302_ps049_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=49 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=49 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-49-like-the-beasts-that-perish-the-folly-of-riches',
       E'Man being in honour abideth not — he is like the beasts that perish',
       E'The parable''s verdict is that death levels all and riches deliver none: *For he seeth that wise men die, likewise the fool and the brutish person perish, and leave their wealth to others. Their inward thought is, that their houses shall continue for ever... Nevertheless man being in honour abideth not: he is like the beasts that perish* (Psalm 49:10-12), sealed by the closing refrain — *Man that is in honour, and understandeth not, is like the beasts that perish* (49:20). Solomon saw the same: *how dieth the wise man? as the fool* (Ecclesiastes 2:16). Yahusha tells it as a parable of the rich man who built greater barns: *Thou fool, this night thy soul shall be required of thee: then whose shall those things be, which thou hast provided?... So is he that layeth up treasure for himself, and is not rich toward Elohim (God)* (Luke 12:20-21); and James fixes the fading — *so also shall the rich man fade away in his ways* (James 1:11), like the flower of the grass that withers. The restored wisdom presses it too: *Give, and take, and sanctify your soul; for there is no seeking of dainties in the grave* (Sirach 14:16), for *Shall you not leave your travails to another?* (Sirach 14:15); and the ungodly confess too late, *What has pride profited us? or what good has riches with our vaunting brought us? All those things are passed away like a shadow* (Wisdom of Solomon 5:8-9). The man in honour does not abide; only the soul redeemed by Elohim (49:15) escapes the levelling.',
       sv.verse_id, ev.verse_id, 'extras', 23206
  FROM _s302_ps049_lookup sv, _s302_ps049_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=49 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=49 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-49-he-shall-carry-nothing-away',
       E'When he dieth he shall carry nothing away — his glory shall not descend after him',
       E'The psalm''s comfort against envy is mortality itself: *Be not thou afraid when one is made rich, when the glory of his house is increased; For when he dieth he shall carry nothing away: his glory shall not descend after him* (Psalm 49:16-17). Paul states the law plainly: *For we brought nothing into this world, and it is certain we can carry nothing out* (1 Timothy 6:7). Job draws the picture of the end: *The rich man shall lie down, but he shall not be gathered: he openeth his eyes, and he is not* (Job 27:19). And the restored wisdom names the very conceit the psalm rebukes — the thought that *their houses shall continue for ever* (49:11) — *Whereas he says, I have found rest, and now will eat continually of my goods; and yet he knoweth not what time shall come upon him, and that he must leave those things to others, and die* (Sirach 11:19). The glory of the house does not descend after the man; he carries nothing away, and his lands he called by his own name pass to others.',
       sv.verse_id, ev.verse_id, 'extras', 23209
  FROM _s302_ps049_lookup sv, _s302_ps049_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=49 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=49 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *the Son of Adam came... to give his life a ransom for many* (Matthew 20:28) — the ransom no man can give for his brother (49:7) is the one the Formed Son gives with his own life.'
  FROM cross_reference_threads t
  JOIN _s302_ps049_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=49 AND sv.verse_number=7
  JOIN _s302_ps049_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=20 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-49-none-can-redeem-his-brother-only-elohim-ransoms'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *to give his life a ransom for many* (Mark 10:45) — set against them that *trust in riches* (Mark 10:24): the ransom no silver can pay, paid by the Son of Adam''s life.'
  FROM cross_reference_threads t
  JOIN _s302_ps049_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=49 AND sv.verse_number=7
  JOIN _s302_ps049_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=10 AND tv.verse_number=45
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-49-none-can-redeem-his-brother-only-elohim-ransoms'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *Who gave himself a ransom for all* (1 Timothy 2:6) — the precious redemption (49:8) too dear for any man is paid by the one Mediator (1 Tim 2:5).'
  FROM cross_reference_threads t
  JOIN _s302_ps049_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=49 AND sv.verse_number=7
  JOIN _s302_ps049_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-timothy' AND tv.chapter_number=2 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-49-none-can-redeem-his-brother-only-elohim-ransoms'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *ye were not redeemed with corruptible things, as silver and gold* (1 Peter 1:18) — the soul''s ransom (49:8) is not bought with the perishable wealth the rich trust in.'
  FROM cross_reference_threads t
  JOIN _s302_ps049_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=49 AND sv.verse_number=8
  JOIN _s302_ps049_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=1 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-49-none-can-redeem-his-brother-only-elohim-ransoms'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *with the precious blood of Messiah (Christ), as of a lamb without blemish* (1 Peter 1:19) — the precious price (49:8) is the spotless Lamb''s blood; what riches cannot ransom, his blood redeems.'
  FROM cross_reference_threads t
  JOIN _s302_ps049_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=49 AND sv.verse_number=8
  JOIN _s302_ps049_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=1 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-49-none-can-redeem-his-brother-only-elohim-ransoms'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *neither wilt thou suffer thine Holy One to see corruption* (Psalm 16:10) — the *not see corruption* (49:9) denied the rich man is granted the Holy One, raised from the grave (Acts 2:27,31).'
  FROM cross_reference_threads t
  JOIN _s302_ps049_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=49 AND sv.verse_number=9
  JOIN _s302_ps049_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=16 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-49-none-can-redeem-his-brother-only-elohim-ransoms'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *I will ransom them from the power of the grave; I will redeem them from death* (Hosea 13:14) — the same ransom-and-redeem from the grave as 49:15: Elohim''s own promise.'
  FROM cross_reference_threads t
  JOIN _s302_ps049_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=49 AND sv.verse_number=15
  JOIN _s302_ps049_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=13 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-49-elohim-will-redeem-my-soul-from-the-grave'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *Death is swallowed up in victory* (1 Corinthians 15:54) — the redemption from the grave (49:15) become the resurrection: corruptible clothed in incorruption.'
  FROM cross_reference_threads t
  JOIN _s302_ps049_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=49 AND sv.verse_number=15
  JOIN _s302_ps049_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=54
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-49-elohim-will-redeem-my-soul-from-the-grave'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *O death, where is thy sting? O grave, where is thy victory?* (1 Corinthians 15:55) — the power of the grave (49:15) broken; the redeemed soul received.'
  FROM cross_reference_threads t
  JOIN _s302_ps049_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=49 AND sv.verse_number=15
  JOIN _s302_ps049_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=55
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-49-elohim-will-redeem-my-soul-from-the-grave'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *thou hast brought up my soul from the grave* (Psalm 30:3) — the psalter''s tasted experience of 49:15: Yahuah lifts the soul out of the pit.'
  FROM cross_reference_threads t
  JOIN _s302_ps049_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=49 AND sv.verse_number=15
  JOIN _s302_ps049_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=30 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-49-elohim-will-redeem-my-soul-from-the-grave'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*how dieth the wise man? as the fool* (Ecclesiastes 2:16) — the same levelling as 49:10: wise and fool die alike and leave their wealth to others.'
  FROM cross_reference_threads t
  JOIN _s302_ps049_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=49 AND sv.verse_number=10
  JOIN _s302_ps049_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=2 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-49-like-the-beasts-that-perish-the-folly-of-riches'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Thou fool, this night thy soul shall be required of thee* (Luke 12:20) — Yahusha tells 49:12 as a parable: the man in honour abides not; his goods pass to another.'
  FROM cross_reference_threads t
  JOIN _s302_ps049_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=49 AND sv.verse_number=12
  JOIN _s302_ps049_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=12 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-49-like-the-beasts-that-perish-the-folly-of-riches'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*is not rich toward Elohim (God)* (Luke 12:21) — to hoard for self is to perish like the beasts (49:12); riches toward self cannot redeem the soul.'
  FROM cross_reference_threads t
  JOIN _s302_ps049_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=49 AND sv.verse_number=12
  JOIN _s302_ps049_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=12 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-49-like-the-beasts-that-perish-the-folly-of-riches'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*so also shall the rich man fade away in his ways* (James 1:11) — the rich man wilts like the flower of the grass; the honour abides not (49:12), the beauty consumes in the grave (49:14).'
  FROM cross_reference_threads t
  JOIN _s302_ps049_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=49 AND sv.verse_number=12
  JOIN _s302_ps049_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-49-like-the-beasts-that-perish-the-folly-of-riches'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*there is no seeking of dainties in the grave* (Sirach 14:16) — *Shall you not leave your travails to another?* (14:15): the hoarded wealth (49:10) is left; the grave seeks no dainties.'
  FROM cross_reference_threads t
  JOIN _s302_ps049_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=49 AND sv.verse_number=10
  JOIN _s302_ps049_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=14 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-49-like-the-beasts-that-perish-the-folly-of-riches'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*what good has riches with our vaunting brought us? All those things are passed away like a shadow* (Wisdom of Solomon 5:8-9) — the ungodly confess too late what 49:12 taught: honour and wealth abide not.'
  FROM cross_reference_threads t
  JOIN _s302_ps049_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=49 AND sv.verse_number=12
  JOIN _s302_ps049_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=5 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-49-like-the-beasts-that-perish-the-folly-of-riches'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *we brought nothing into this world, and it is certain we can carry nothing out* (1 Timothy 6:7) — the law of 49:17 stated plainly: nothing carried out, the glory descends not after him.'
  FROM cross_reference_threads t
  JOIN _s302_ps049_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=49 AND sv.verse_number=17
  JOIN _s302_ps049_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-timothy' AND tv.chapter_number=6 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-49-he-shall-carry-nothing-away'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*The rich man shall lie down, but he shall not be gathered: he openeth his eyes, and he is not* (Job 27:19) — the same picture as 49:17: the rich man wakes to find himself gone, the wealth ungathered.'
  FROM cross_reference_threads t
  JOIN _s302_ps049_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=49 AND sv.verse_number=17
  JOIN _s302_ps049_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=27 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-49-he-shall-carry-nothing-away'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *he must leave those things to others, and die* (Sirach 11:19) — the houses-shall-continue conceit (49:11) named: the man at rest among his goods who carries nothing away (49:17).'
  FROM cross_reference_threads t
  JOIN _s302_ps049_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=49 AND sv.verse_number=17
  JOIN _s302_ps049_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=11 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-49-he-shall-carry-nothing-away'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
