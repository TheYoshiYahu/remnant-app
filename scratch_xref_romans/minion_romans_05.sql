-- ----- fragment: minion_romans_05.sql (S219 Romans 5) -----
-- =====================================================================
-- S219 minion — ROMANS 5 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: ROMANS 5.  Tag: r05 (temp view _s219_r05_lookup).  Sort band: 6100, step 3 (<6125).
-- Source is ALWAYS the canon Romans verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
-- Thread tier_required = 'extras' if any member is extras, else 'free'.
--
-- WATCHPOINTS (Red Lines, Christology, false-inclusion diagnostic):
--  * THE SECOND ADAM (5:12-19): *as by one man sin entered into the world, and death by sin*
--    (5:12) is undone by the one Man — the Formed drawn from the Formless, who took on flesh
--    and undoes the first Adam's fall. *The first man Adam was made a living soul; the last
--    Adam was made a quickening spirit … the second man is Yahuah (Lord) from heaven*
--    (1 Corinthians 15:45,47): the second Adam is the Formed who came down, not a created
--    co-equal third person and not the Father — Yahusha who is Yahuah and has a Father.
--  * GRACE THROUGH RIGHTEOUSNESS (5:20-21): grace reigns *through righteousness* (5:21), NEVER
--    through lawlessness. The law that *entered, that the offence might abound* (5:20) is the
--    law's exposing work — not its condemnation as a thing to discard. Grace is the means of
--    return to right standing, the homecoming, not a release from the commandments (Red Line #10).
--  * RECONCILIATION (5:6-11): *while we were yet sinners, Messiah (Christ) died for us* (5:8) —
--    the chastisement of our peace upon him (Isaiah 53:5), the iniquity of us all laid on him
--    (Isaiah 53:6); reconciliation by the death of his Son, not a flesh-credential confession.
--  * EXTRAS ON ADAM: Wisdom 2:23-24 (death entered through the envy of the devil); 2 Esdras
--    (4 Ezra) 3:7,21-22 and 7:11-12,46-48,118 (the first Adam's wicked heart; in Adam all that
--    come of him fall) — the Second-Temple witness to the very fall Paul names.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (Tanakh/Extras/NT weighed for every block):
--  v.1-2   justified by faith, peace, access into grace
--          Tanakh: peace/healing carried in the reconciliation thread (Isaiah 53:5) — not re-added here
--          Extras: none warranted
--          NT:     1 Corinthians 15:1-2 (the gospel wherein ye stand, by which ye are saved)
--  v.3-5   tribulation worketh patience; hope; love shed abroad by the Spirit
--          Tanakh: none warranted (the Spirit/new-heart Tanakh roots belong to Romans 8, not added here)
--          Extras: 2 Esdras 7:14,18 (the strait things suffered, then the wide hoped for)
--          NT:     none warranted
--  v.6-11  while we were yet sinners reconciled by the death of his Son
--          Tanakh: Isaiah 53:5 (chastisement of our peace), Isaiah 53:6 (iniquity of us all laid on him)
--          Extras: none warranted
--          NT:     none added (the once-for-all reconciliation carried by the Tanakh servant-song here)
--  v.12-14 by one man sin entered, death passed upon all; death reigned from Adam to Moses
--          Tanakh: Genesis 2:17 (the day thou eatest thou shalt surely die), Genesis 3:19 (dust to dust)
--          Extras: Wisdom 2:23-24 (death entered through the devil's envy); 2 Esdras 3:7 (death appointed in Adam), 3:21 (the first Adam's wicked heart)
--          NT:     1 Corinthians 15:21-22 (by man came death; as in Adam all die)
--  v.15-19 the free gift, the one Man Yahusha, the obedience of one made many righteous
--          Tanakh: none warranted (the Adamic root carried in the 5:12 thread)
--          Extras: 2 Esdras 7:48 (O Adam, thou art not fallen alone, but we all that come of thee)
--          NT:     1 Corinthians 15:45 (the last Adam a quickening spirit), 15:47 (the second man, Lord from heaven)
--  v.20-21 the law entered that the offence might abound; grace reigns through righteousness
--          Tanakh: none warranted (the law's exposing work carried by the extras heart-witness)
--          Extras: 2 Esdras 3:20 (the wicked heart not taken away, that the law might bring forth fruit), 3:22 (the law in the heart with the malignity of the root)
--          NT:     none warranted
--
-- THREADS (slug -> target libraries):
--   6100 romans-5-being-justified-by-faith-we-have-peace-access-into-this-grace   (NT)
--   6103 romans-5-tribulation-worketh-patience-the-strait-then-the-wide           (Extras)
--   6106 romans-5-while-we-were-yet-sinners-reconciled-by-the-death-of-his-son    (Tanakh)
--   6109 romans-5-by-one-man-sin-entered-death-passed-upon-all-the-first-adam-fell (Tanakh + Extras + NT)
--   6112 romans-5-the-free-gift-the-one-man-and-the-last-adam-a-quickening-spirit (Extras + NT)
--   6115 romans-5-the-law-entered-that-the-offence-might-abound-grace-through-righteousness (Extras)
-- =====================================================================

CREATE TEMP VIEW _s219_r05_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: romans-5-being-justified-by-faith-we-have-peace-access-into-this-grace
  ('canon', 'romans', 5, 1, 'canon', '1-corinthians', 15, 1, 'free', E'*Moreover, brethren, I declare unto you the gospel which I preached unto you, which also ye have received, and wherein ye stand;* (1 Corinthians 15:1). *Therefore being justified by faith, we have peace with Elohim (God) through our Lord Yahusha HaMashiach (Lord Jesus Christ)* (Romans 5:1), and *by whom also we have access by faith into this grace wherein we stand* (Romans 5:2). The same grace *wherein we stand* in Romans is the gospel *wherein ye stand* in Corinth — not a mental assent that purchases entry, but the faithful brought into the standing where they may now walk. The faith is the door home; the standing is the place of the gathered.'),
  ('canon', 'romans', 5, 2, 'canon', '1-corinthians', 15, 2, 'free', E'*By which also ye are saved, if ye keep in memory what I preached unto you, unless ye have believed in vain.* (1 Corinthians 15:2). *We have access by faith into this grace wherein we stand, and rejoice in hope of the glory of Elohim (God)* (Romans 5:2). The salvation is held by those who *keep in memory* and do not believe *in vain* — the standing in grace is a standing to be kept, the hope of the glory of Elohim (God) the destination of those who endure in it. Grace is the entrance and the walk, not a release from the keeping.'),
  -- thread: romans-5-tribulation-worketh-patience-the-strait-then-the-wide
  ('canon', 'romans', 5, 3, 'apocrypha', '2-esdras', 7, 18, 'extras', E'*Nevertheless the righteous shall suffer strait things, and hope for wide: for they that have done wickedly have suffered the strait things, and yet shall not see the wide.* (2 Esdras 7:18). *We glory in tribulations also: knowing that tribulation worketh patience* (Romans 5:3). The same shape stands in the older witness: the righteous *suffer strait things, and hope for wide* — the narrow pressure now is the very road to the breadth hoped for. The tribulation is not the contradiction of the hope but the working of it.'),
  ('canon', 'romans', 5, 4, 'apocrypha', '2-esdras', 7, 14, 'extras', E'*If then they that live labour not to enter these strait and vain things, they can never receive those that are laid up for them.* (2 Esdras 7:14). *And patience, experience; and experience, hope* (Romans 5:4). The older word makes the same demand: there is no receiving the things *laid up* without labouring to enter through *these strait* things. Patience tried in the strait becomes the experience that bears hope — the pressure endured is the path to the inheritance.'),
  -- thread: romans-5-while-we-were-yet-sinners-reconciled-by-the-death-of-his-son
  ('canon', 'romans', 5, 8, 'canon', 'isaiah', 53, 5, 'free', E'*But he was wounded for our transgressions, he was bruised for our iniquities: the chastisement of our peace was upon him; and with his stripes we are healed.* (Isaiah 53:5). *Elohim (God) commendeth his love toward us, in that, while we were yet sinners, Messiah (Christ) died for us* (Romans 5:8). The love commended *while we were yet sinners* is the very thing Isaiah saw: the *chastisement of our peace* laid upon him, the wounding for transgressions not yet repented of. The peace we now have (Romans 5:1) was bought by his stripes before we sought it.'),
  ('canon', 'romans', 5, 10, 'canon', 'isaiah', 53, 6, 'free', E'*All we like sheep have gone astray; we have turned every one to his own way; and Yahuah (LORD) hath laid on him the iniquity of us all.* (Isaiah 53:6). *For if, when we were enemies, we were reconciled to Elohim (God) by the death of his Son, much more, being reconciled, we shall be saved by his life* (Romans 5:10). We were the sheep gone astray, every one turned to his own way — enemies — yet *the iniquity of us all* was laid on him. The reconciliation by the death of his Son is the laying-on Isaiah named; and being reconciled, we are kept by his life.'),
  -- thread: romans-5-by-one-man-sin-entered-death-passed-upon-all-the-first-adam-fell
  ('canon', 'romans', 5, 12, 'canon', 'genesis', 2, 17, 'free', E'*But of the tree of the knowledge of good and evil, thou shalt not eat of it: for in the day that thou eatest thereof thou shalt surely die.* (Genesis 2:17). *Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned* (Romans 5:12). The one man is Adam, and the death is the sentence spoken at the tree: *in the day that thou eatest thereof thou shalt surely die.* Sin entered, and death by sin, exactly where Yahuah Elohim (the LORD God) said it would — and it passed upon all who came of him.'),
  ('canon', 'romans', 5, 12, 'canon', 'genesis', 3, 19, 'free', E'*In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return.* (Genesis 3:19). *Death passed upon all men, for that all have sinned* (Romans 5:12). The death that passed upon all is the dust-return spoken over Adam: *dust thou art, and unto dust shalt thou return.* Paul names the entrance of the thing Genesis enacts — the ground cursed, the man returned to the dust he was taken from, the whole race carried into the sentence.'),
  ('canon', 'romans', 5, 12, 'apocrypha', 'the-wisdom-of-solomon', 2, 24, 'extras', E'*Nevertheless through envy of the devil came death into the world: and they that do hold of his side do find it.* (Wisdom of Solomon 2:24). *By one man sin entered into the world, and death by sin* (Romans 5:12). The older witness names the deeper root: death came into the world *through envy of the devil* — for *Elohim (God) created man to be immortal, and made him to be an image of his own eternity* (Wisdom of Solomon 2:23). The serpent of the garden is the envy behind the one man''s fall; death is the intruder, not the Maker''s design.'),
  ('canon', 'romans', 5, 14, 'apocrypha', '2-esdras', 3, 7, 'extras', E'*And to him you gavest commandment to love your way: which he transgressed, and immediately you appointedst death in him and in his generations, of whom came nations, tribes, people, and kindreds, out of number.* (2 Esdras 3:7). *Nevertheless death reigned from Adam to Moses, even over them that had not sinned after the similitude of Adam''s transgression* (Romans 5:14). The reign of death from Adam is what the older word already saw: death *appointed in him and in his generations,* spreading to the nations and tribes *out of number.* The transgression of the one set death reigning over all his seed.'),
  ('canon', 'romans', 5, 14, 'apocrypha', '2-esdras', 3, 21, 'extras', E'*For the first Adam bearing a wicked heart transgressed, and was overcome; and so be all they that are born of him.* (2 Esdras 3:21). *Death reigned from Adam to Moses … who is the figure of him that was to come* (Romans 5:14). The first Adam *bearing a wicked heart transgressed … and so be all they that are born of him* — the very inheritance Paul names, the figure of the one to come who would reverse it. Adam is the figure; the wicked-hearted seed is the field the second Adam comes to redeem.'),
  ('canon', 'romans', 5, 12, 'canon', '1-corinthians', 15, 21, 'free', E'*For since by man came death, by man came also the resurrection of the dead.* (1 Corinthians 15:21). *By one man sin entered into the world, and death by sin* (Romans 5:12). The same hand that wrote Romans wrote this: death by one man, life by one Man. *For as in Adam all die, even so in Messiah (Christ) shall all be made alive* (1 Corinthians 15:22). The reign of death entered by the first man is met and undone by the resurrection that comes by the second.'),
  -- thread: romans-5-the-free-gift-the-one-man-and-the-last-adam-a-quickening-spirit
  ('canon', 'romans', 5, 15, 'canon', '1-corinthians', 15, 45, 'free', E'*And so it is written, The first man Adam was made a living soul; the last Adam was made a quickening spirit.* (1 Corinthians 15:45). *For if through the offence of one many be dead, much more the grace of Elohim (God), and the gift by grace, which is by one man, Yahusha HaMashiach (Jesus Christ), hath abounded unto many* (Romans 5:15). The one man whose gift abounds is *the last Adam,* the *quickening spirit* — over against *the first man Adam … made a living soul.* The two Adams stand at the head of two races: the first carrying death, the last carrying the gift of life.'),
  ('canon', 'romans', 5, 17, 'canon', '1-corinthians', 15, 47, 'free', E'*The first man is of the earth, earthy: the second man is Yahuah (Lord) from heaven.* (1 Corinthians 15:47). *They which receive abundance of grace and of the gift of righteousness shall reign in life by one, Yahusha HaMashiach (Jesus Christ)* (Romans 5:17). The one by whom they reign in life is *the second man … Yahuah (Lord) from heaven* — the Formed drawn from the Formless, who came down and took on flesh. The first Adam is *of the earth, earthy;* the second is from heaven, and those who bear his image reign in life by him.'),
  ('canon', 'romans', 5, 18, 'apocrypha', '2-esdras', 7, 48, 'extras', E'*O you Adam, what have you done? for though it was you that sinned, you are not fallen alone, but we all that come of you.* (2 Esdras 7:48). *Therefore as by the offence of one judgment came upon all men to condemnation; even so by the righteousness of one the free gift came upon all men unto justification of life* (Romans 5:18). The older lament names the offence of the one upon all: *you are not fallen alone, but we all that come of you.* Against that whole fallen race stands *the righteousness of one* — the free gift that came upon all unto justification of life, the second Adam answering the first.'),
  -- thread: romans-5-the-law-entered-that-the-offence-might-abound-grace-through-righteousness
  ('canon', 'romans', 5, 20, 'apocrypha', '2-esdras', 3, 20, 'extras', E'*And yet tookest you not away from them a wicked heart, that your law might bring forth fruit in them.* (2 Esdras 3:20). *Moreover the law entered, that the offence might abound. But where sin abounded, grace did much more abound* (Romans 5:20). The law given at Sinai met a heart not yet taken away — the law could not *bring forth fruit* in the wicked heart, but only make the offence visible. The law entered to expose the abounding sin, that grace might abound the more; the heart still wanting the new heart the prophets promised.'),
  ('canon', 'romans', 5, 20, 'apocrypha', '2-esdras', 3, 22, 'extras', E'*Thus infirmity was made permanent; and the law (also) in the heart of the people with the malignity of the root; so that the good departed away, and the evil abode still.* (2 Esdras 3:22). *The law entered, that the offence might abound* (Romans 5:20). The older word names the very condition: the law standing *in the heart of the people with the malignity of the root,* the offence laid bare while the evil *abode still.* The law is holy and the law exposes — but the law atop the wicked heart only makes the offence abound, until grace abounds more and the root itself is dealt with.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s219_r05_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s219_r05_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-5-being-justified-by-faith-we-have-peace-access-into-this-grace',
       E'Being justified by faith — we have peace, access into this grace',
       E'*Therefore being justified by faith, we have peace with Elohim (God) through our Lord Yahusha HaMashiach (Lord Jesus Christ): by whom also we have access by faith into this grace wherein we stand* (Romans 5:1-2). The faith here is not a mental assent that purchases entry; it is the faithfulness by which the brought-home are set in their standing — *this grace wherein we stand.* Paul says the same of the gospel to the assembly at Corinth: *the gospel which I preached unto you, which also ye have received, and wherein ye stand* (1 Corinthians 15:1), *by which also ye are saved, if ye keep in memory what I preached unto you, unless ye have believed in vain* (1 Corinthians 15:2). The standing is a standing to be kept — those who *keep in memory* and do not believe *in vain.* Grace is the door home and the place of the gathered; the access is into a standing where they may now walk, rejoicing *in hope of the glory of Elohim (God)* (Romans 5:2). Faith opens the door; the keeping is the walk within.',
       sv.verse_id, ev.verse_id, 'free', 6100
  FROM _s219_r05_lookup sv, _s219_r05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=5 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=5 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-5-tribulation-worketh-patience-the-strait-then-the-wide',
       E'Tribulation worketh patience — the strait, then the wide',
       E'*And not only so, but we glory in tribulations also: knowing that tribulation worketh patience; and patience, experience; and experience, hope* (Romans 5:3-4). The pressure is not the contradiction of the hope but the working of it. The older witness saw the same shape in the road of the righteous: *the righteous shall suffer strait things, and hope for wide: for they that have done wickedly have suffered the strait things, and yet shall not see the wide* (2 Esdras 7:18). The narrow pressure now is the very road to the breadth hoped for — and there is no shortcut around it: *if then they that live labour not to enter these strait and vain things, they can never receive those that are laid up for them* (2 Esdras 7:14). Patience tried in the strait becomes the experience that bears hope; and *hope maketh not ashamed; because the love of Elohim (God) is shed abroad in our hearts by the Ruach HaKodesh (Holy Spirit) which is given unto us* (Romans 5:5). The tribulation endured is the path to the inheritance laid up — the strait that opens into the wide.',
       sv.verse_id, ev.verse_id, 'extras', 6103
  FROM _s219_r05_lookup sv, _s219_r05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=5 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=5 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-5-while-we-were-yet-sinners-reconciled-by-the-death-of-his-son',
       E'While we were yet sinners — reconciled by the death of his Son',
       E'*For when we were yet without strength, in due time Messiah (Christ) died for the ungodly* (Romans 5:6), and *Elohim (God) commendeth his love toward us, in that, while we were yet sinners, Messiah (Christ) died for us* (Romans 5:8). The love is commended before the turning — *while we were yet sinners,* *when we were enemies* (Romans 5:10). This is the very thing Isaiah saw long before: *he was wounded for our transgressions, he was bruised for our iniquities: the chastisement of our peace was upon him; and with his stripes we are healed* (Isaiah 53:5). The peace we now have through our Lord Yahusha HaMashiach (Lord Jesus Christ) (Romans 5:1) was bought by his stripes before we sought it. And the reconciliation is the laying-on the prophet named: *all we like sheep have gone astray; we have turned every one to his own way; and Yahuah (LORD) hath laid on him the iniquity of us all* (Isaiah 53:6). We were the sheep gone astray, every one turned to his own way, enemies — yet the iniquity of us all was laid on him. *Being reconciled, we shall be saved by his life* (Romans 5:10): the death reconciled the enemy; the life keeps the reconciled.',
       sv.verse_id, ev.verse_id, 'free', 6106
  FROM _s219_r05_lookup sv, _s219_r05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=5 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=5 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-5-by-one-man-sin-entered-death-passed-upon-all-the-first-adam-fell',
       E'By one man sin entered — death passed upon all, the first Adam fell',
       E'*Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned* (Romans 5:12). The one man is Adam, and the death is the sentence spoken at the tree: *of the tree of the knowledge of good and evil, thou shalt not eat of it: for in the day that thou eatest thereof thou shalt surely die* (Genesis 2:17), enacted in the dust-return over the fallen man — *dust thou art, and unto dust shalt thou return* (Genesis 3:19). The older witnesses saw the same fall and named its deeper root: *Elohim (God) created man to be immortal, and made him to be an image of his own eternity. Nevertheless through envy of the devil came death into the world* (Wisdom of Solomon 2:23-24) — the serpent of the garden the envy behind the one man''s fall. And the reign of death over all his seed was already lamented: death *appointed in him and in his generations, of whom came nations, tribes, people, and kindreds, out of number* (2 Esdras 3:7), for *the first Adam bearing a wicked heart transgressed, and was overcome; and so be all they that are born of him* (2 Esdras 3:21). So *death reigned from Adam to Moses … who is the figure of him that was to come* (Romans 5:14). Adam is the figure; and the figure is answered, for the same hand wrote: *since by man came death, by man came also the resurrection of the dead. For as in Adam all die, even so in Messiah (Christ) shall all be made alive* (1 Corinthians 15:21-22). Death by one man; life by one Man.',
       sv.verse_id, ev.verse_id, 'extras', 6109
  FROM _s219_r05_lookup sv, _s219_r05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=5 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=5 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-5-the-free-gift-the-one-man-and-the-last-adam-a-quickening-spirit',
       E'The free gift — the one Man, and the last Adam a quickening spirit',
       E'*For if through the offence of one many be dead, much more the grace of Elohim (God), and the gift by grace, which is by one man, Yahusha HaMashiach (Jesus Christ), hath abounded unto many* (Romans 5:15). The one man whose gift abounds is the second Adam, and Paul names him plainly elsewhere: *the first man Adam was made a living soul; the last Adam was made a quickening spirit* (1 Corinthians 15:45). The two Adams stand at the head of two races — the first carrying death, the last carrying the gift of life. And the last Adam is not another earthy man: *the first man is of the earth, earthy: the second man is Yahuah (Lord) from heaven* (1 Corinthians 15:47) — the Formed drawn from the Formless, who came down and took on flesh, who is Yahuah and has a Father. By him *they which receive abundance of grace and of the gift of righteousness shall reign in life* (Romans 5:17). Against the whole fallen race the older lament cried — *O you Adam, what have you done? for though it was you that sinned, you are not fallen alone, but we all that come of you* (2 Esdras 7:48) — stands *the righteousness of one,* for *as by one man''s disobedience many were made sinners, so by the obedience of one shall many be made righteous* (Romans 5:18-19). The first Adam''s disobedience; the second Adam''s obedience. One free gift answering one offence.',
       sv.verse_id, ev.verse_id, 'extras', 6112
  FROM _s219_r05_lookup sv, _s219_r05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=5 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=5 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-5-the-law-entered-that-the-offence-might-abound-grace-through-righteousness',
       E'The law entered that the offence might abound — grace reigns through righteousness',
       E'*Moreover the law entered, that the offence might abound. But where sin abounded, grace did much more abound* (Romans 5:20). This is not the law''s condemnation as a thing to be discarded; it is the law''s exposing work upon a heart not yet made new. The older witness names the very condition: at Sinai the law was given, *and yet tookest you not away from them a wicked heart, that your law might bring forth fruit in them* (2 Esdras 3:20) — so *the law (also) in the heart of the people with the malignity of the root; so that the good departed away, and the evil abode still* (2 Esdras 3:22). The law atop the wicked heart could not bring forth fruit; it could only make the offence visible, that grace might abound the more and the root itself at last be dealt with by the new heart the prophets promised. And the grace that abounds does not reign by lawlessness: *that as sin hath reigned unto death, even so might grace reign through righteousness unto eternal life by Yahusha HaMashiach (Jesus Christ) our Lord* (Romans 5:21). Grace reigns *through righteousness* — the means of return to right standing and to the walk, never a release from the commandments. The offence abounded that grace might abound; and grace reigns that righteousness might stand.',
       sv.verse_id, ev.verse_id, 'extras', 6115
  FROM _s219_r05_lookup sv, _s219_r05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=5 AND sv.verse_number=20
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=5 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: romans-5-being-justified-by-faith-we-have-peace-access-into-this-grace
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Corinthians 15:1 — *the gospel which I preached unto you … wherein ye stand* the same standing in grace into which faith gives access (Romans 5:1-2).'
  FROM cross_reference_threads t, cross_references x, _s219_r05_lookup sv, _s219_r05_lookup tv
 WHERE t.slug='romans-5-being-justified-by-faith-we-have-peace-access-into-this-grace'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Corinthians 15:2 — *by which also ye are saved, if ye keep in memory … unless ye have believed in vain* the standing in grace is a standing to be kept, not a release (Romans 5:2).'
  FROM cross_reference_threads t, cross_references x, _s219_r05_lookup sv, _s219_r05_lookup tv
 WHERE t.slug='romans-5-being-justified-by-faith-we-have-peace-access-into-this-grace'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=5 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-5-tribulation-worketh-patience-the-strait-then-the-wide
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Esdras 7:18 — *the righteous shall suffer strait things, and hope for wide* the narrow pressure now is the road to the breadth hoped for (Romans 5:3).'
  FROM cross_reference_threads t, cross_references x, _s219_r05_lookup sv, _s219_r05_lookup tv
 WHERE t.slug='romans-5-tribulation-worketh-patience-the-strait-then-the-wide'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=5 AND sv.verse_number=3
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=7 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Esdras 7:14 — *if then they that live labour not to enter these strait … things, they can never receive those that are laid up* no inheritance without the strait endured (Romans 5:4).'
  FROM cross_reference_threads t, cross_references x, _s219_r05_lookup sv, _s219_r05_lookup tv
 WHERE t.slug='romans-5-tribulation-worketh-patience-the-strait-then-the-wide'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=5 AND sv.verse_number=4
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-5-while-we-were-yet-sinners-reconciled-by-the-death-of-his-son
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 53:5 — *the chastisement of our peace was upon him; and with his stripes we are healed* the love commended while we were yet sinners (Romans 5:8).'
  FROM cross_reference_threads t, cross_references x, _s219_r05_lookup sv, _s219_r05_lookup tv
 WHERE t.slug='romans-5-while-we-were-yet-sinners-reconciled-by-the-death-of-his-son'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=5 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 53:6 — *Yahuah (LORD) hath laid on him the iniquity of us all* the reconciliation of the enemy by the death of his Son (Romans 5:10).'
  FROM cross_reference_threads t, cross_references x, _s219_r05_lookup sv, _s219_r05_lookup tv
 WHERE t.slug='romans-5-while-we-were-yet-sinners-reconciled-by-the-death-of-his-son'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=5 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-5-by-one-man-sin-entered-death-passed-upon-all-the-first-adam-fell
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:17 — *in the day that thou eatest thereof thou shalt surely die* the death-sentence at the tree, entered by the one man (Romans 5:12).'
  FROM cross_reference_threads t, cross_references x, _s219_r05_lookup sv, _s219_r05_lookup tv
 WHERE t.slug='romans-5-by-one-man-sin-entered-death-passed-upon-all-the-first-adam-fell'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=5 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:19 — *dust thou art, and unto dust shalt thou return* the death that passed upon all men enacted over the fallen Adam (Romans 5:12).'
  FROM cross_reference_threads t, cross_references x, _s219_r05_lookup sv, _s219_r05_lookup tv
 WHERE t.slug='romans-5-by-one-man-sin-entered-death-passed-upon-all-the-first-adam-fell'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=5 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Wisdom of Solomon 2:24 — *through envy of the devil came death into the world* the deeper root behind the one man''s fall; death the intruder, not the Maker''s design (Romans 5:12).'
  FROM cross_reference_threads t, cross_references x, _s219_r05_lookup sv, _s219_r05_lookup tv
 WHERE t.slug='romans-5-by-one-man-sin-entered-death-passed-upon-all-the-first-adam-fell'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=5 AND sv.verse_number=12
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=2 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Esdras 3:7 — death *appointed in him and in his generations, of whom came nations, tribes, people … out of number* the reign of death from Adam over all his seed (Romans 5:14).'
  FROM cross_reference_threads t, cross_references x, _s219_r05_lookup sv, _s219_r05_lookup tv
 WHERE t.slug='romans-5-by-one-man-sin-entered-death-passed-upon-all-the-first-adam-fell'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=5 AND sv.verse_number=14
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=3 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'2 Esdras 3:21 — *the first Adam bearing a wicked heart transgressed … and so be all they that are born of him* the inherited fall, the figure of the one to come (Romans 5:14).'
  FROM cross_reference_threads t, cross_references x, _s219_r05_lookup sv, _s219_r05_lookup tv
 WHERE t.slug='romans-5-by-one-man-sin-entered-death-passed-upon-all-the-first-adam-fell'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=5 AND sv.verse_number=14
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=3 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'1 Corinthians 15:21 — *by man came death, by man came also the resurrection … as in Adam all die, even so in Messiah (Christ) shall all be made alive* the first Adam answered by the second (Romans 5:12).'
  FROM cross_reference_threads t, cross_references x, _s219_r05_lookup sv, _s219_r05_lookup tv
 WHERE t.slug='romans-5-by-one-man-sin-entered-death-passed-upon-all-the-first-adam-fell'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=5 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-5-the-free-gift-the-one-man-and-the-last-adam-a-quickening-spirit
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Corinthians 15:45 — *the first man Adam was made a living soul; the last Adam was made a quickening spirit* the two Adams at the head of two races (Romans 5:15).'
  FROM cross_reference_threads t, cross_references x, _s219_r05_lookup sv, _s219_r05_lookup tv
 WHERE t.slug='romans-5-the-free-gift-the-one-man-and-the-last-adam-a-quickening-spirit'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=5 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=45
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Corinthians 15:47 — *the second man is Yahuah (Lord) from heaven* the one Man is the Formed who came down and took on flesh (Romans 5:17).'
  FROM cross_reference_threads t, cross_references x, _s219_r05_lookup sv, _s219_r05_lookup tv
 WHERE t.slug='romans-5-the-free-gift-the-one-man-and-the-last-adam-a-quickening-spirit'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=5 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=47
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Esdras 7:48 — *O you Adam … you are not fallen alone, but we all that come of you* the whole fallen race answered by the righteousness of one (Romans 5:18).'
  FROM cross_reference_threads t, cross_references x, _s219_r05_lookup sv, _s219_r05_lookup tv
 WHERE t.slug='romans-5-the-free-gift-the-one-man-and-the-last-adam-a-quickening-spirit'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=5 AND sv.verse_number=18
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=7 AND tv.verse_number=48
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-5-the-law-entered-that-the-offence-might-abound-grace-through-righteousness
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Esdras 3:20 — *tookest you not away from them a wicked heart, that your law might bring forth fruit* the law atop the unchanged heart, exposing not fruiting (Romans 5:20).'
  FROM cross_reference_threads t, cross_references x, _s219_r05_lookup sv, _s219_r05_lookup tv
 WHERE t.slug='romans-5-the-law-entered-that-the-offence-might-abound-grace-through-righteousness'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=5 AND sv.verse_number=20
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=3 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Esdras 3:22 — *the law … in the heart of the people with the malignity of the root; so that the good departed away, and the evil abode still* the offence laid bare until the root is dealt with (Romans 5:20).'
  FROM cross_reference_threads t, cross_references x, _s219_r05_lookup sv, _s219_r05_lookup tv
 WHERE t.slug='romans-5-the-law-entered-that-the-offence-might-abound-grace-through-righteousness'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=5 AND sv.verse_number=20
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=3 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
