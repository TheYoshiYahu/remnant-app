-- ----- fragment: minion_genesis_23.sql (Genesis 23) -----
-- Chapter: Genesis 23 (Sarah dies at an hundred and seven and twenty years in Kirjath-arba, the same is Hebron in the land of Canaan; Abraham comes to mourn and to weep for her; he stands before the sons of Heth — "I am a stranger and a sojourner with you" — and asks a possession of a buryingplace; the courteous bargaining with Ephron the Hittite for the cave of Machpelah and the field; the 400 shekels of silver weighed, current money with the merchant; the field, the cave, and all the trees made sure unto Abraham for a possession of a buryingplace; Sarah buried there in the cave of Machpelah before Mamre)
-- Tag: ge23   Temp view: _s301_ge23_lookup
-- Sort band: base 20550, step 3 -> threads at 20550, 20553, 20556, 20559 (4 threads)
-- Source of EVERY row: 'canon','genesis',23,v
--
-- Genesis 23 coverage:
--   v.1-2 (Sarah was an hundred and seven and twenty years old... and Sarah died in Kirjath-arba; the same is Hebron in the land of Canaan: and Abraham came to mourn for Sarah, and to weep for her)
--        NT:     none warranted distinct (the death-in-faith / strangers-and-pilgrims weave belongs to v.4, THREAD 1; the mourning itself has no clean NT member)
--        Extras: Jubilees 19:2 (the days of the life of Sarah were accomplished, and she died in Hebron); Jubilees 19:3 (Abraham went to mourn over her and bury her, and we tried him... he was found patient); Jasher 24:15 (the days of Sarah were one hundred and twenty-seven years and she died, and Abraham made a great and heavy mourning... seven days) — THREAD 4
--        Tanakh: none warranted distinct (the 127 years / Hebron data is carried by the extras parallels at THREAD 4; no other Tanakh passage re-narrates Sarah's death)
--   ★ v.4 (I am a stranger and a sojourner with you: give me a possession of a buryingplace with you, that I may bury my dead out of my sight)
--        NT:     Hebrews 11:13 (These all died in faith, not having received the promises... and confessed that they were strangers and pilgrims on the earth); Hebrews 11:9 (By faith he sojourned in the land of promise, as in a strange country, dwelling in tabernacles...); Hebrews 11:10 (For he looked for a city which hath foundations, whose builder and maker is Elohim) — THREAD 1 (load-bearing)
--        Extras: Jubilees 19:9 (he said not a single word regarding the rumour... how that Elohim had said that He would give it to him and to his seed after him, and he begged a place there to bury his dead; for he was found faithful... the friend of Elohim) — THREAD 1
--        Tanakh: Genesis 17:8 (I will give unto thee, and to thy seed after thee... all the land of Canaan, for an everlasting possession) — the FUTURE land-oath against which the present grave is held — THREAD 1
--   v.5-15 (the sons of Heth: thou art a mighty prince among us; the bargaining; Ephron the Hittite offers the field and cave for nothing; Abraham insists on full price; the land worth four hundred shekels of silver)
--        NT:     none warranted (the legal courtesy/bargaining has no NT member; the substance — the purchase made sure — is carried at THREAD 2)
--        Extras: Jubilees 19:5 (they gave him the land of the double cave over against Mamre, that is Hebron, for four hundred pieces of silver); Jubilees 19:6 ("We shall give it to you for nothing"; but he would not take it... he gave the price... and he bowed down before them twice); Jasher 24:5 (No, but I will buy the cave and the field... for value... for a possession of a burial place for ever); Jasher 24:6 (Only at full value will I buy it from your hand... and from the hand of your seed for ever) — THREAD 2
--        Tanakh: none warranted distinct (no other Tanakh passage re-narrates the bargaining; the purchase is bound forward to Gen 25/49/50 at THREADS 2-3)
--   ★ v.16 (Abraham weighed to Ephron the silver... four hundred shekels of silver, current money with the merchant)
--        NT:     none warranted (Acts 7:16 conflates the Shechem/Hamor purchase with Machpelah — see framing note; recorded "none warranted" rather than force a mismatched quote)
--        Extras: Jasher 24:7 (Abraham weighed to Ephron four hundred shekels of silver... and Abraham wrote this transaction, and testified it with four witnesses) — THREAD 2
--        Tanakh: none warranted distinct (the weighed price is carried at THREAD 2)
--   ★ v.17-18,20 (the field of Ephron, the field, and the cave which was therein, and all the trees... were made sure unto Abraham for a possession in the presence of the children of Heth)
--        NT:     none warranted (Acts 7:16 conflated — see framing note)
--        Extras: Jasher 24:11 (the field and the cave that was in it and all that place were made sure to Abraham and to his seed after him, from the children of Heth) — THREAD 2
--        Tanakh: Genesis 25:9-10 (Isaac and Ishmael buried Abraham in the cave of Machpelah... the field which Abraham purchased of the sons of Heth) — THREAD 3
--   ★ v.19 (Abraham buried Sarah his wife in the cave of the field of Machpelah before Mamre: the same is Hebron in the land of Canaan)
--        NT:     none warranted (see Acts 7:16 framing note)
--        Extras: Jasher 24:12 (after this Abraham buried his wife Sarah there, and that place... became to Abraham and to his seed for a possession of a burial place) — THREAD 2
--        Tanakh: Genesis 25:9 (Abraham buried in Machpelah); Genesis 49:29-31 (Jacob's charge: bury me with my fathers... there they buried Abraham and Sarah... Isaac and Rebekah... and there I buried Leah); Genesis 50:13 (his sons carried Jacob into Canaan, and buried him in the cave of the field of Machpelah) — THREAD 3
--
-- Threads (slug — target libraries):
--   1. genesis-23-a-stranger-and-a-sojourner-in-a-strange-land — NT (Hebrews) + Tanakh (Genesis 17:8 land-oath) + Extras (Jubilees) [extras] (★ load-bearing: the only land Abraham owned was a grave)
--   2. genesis-23-the-cave-of-machpelah-the-four-hundred-shekels — Extras (Jubilees, Jasher) [extras] (the purchase made sure at full price)
--   3. genesis-23-machpelah-the-gathering-of-the-fathers — Tanakh (Genesis 25, 49, 50) [free] (the patriarchal burying place)
--   4. genesis-23-abraham-mourned-and-wept-for-sarah — Extras (Jubilees, Jasher) [extras] (Sarah's death and Abraham's mourning)
--
-- Framing notes:
--   ★ GENESIS 23:4 — "I am a stranger and a sojourner with you" (THREAD 1, load-bearing). The only ground Abraham
--   ever OWNED in the land of promise was a grave. The land-oath is REAL but FUTURE — Genesis 17:8 swears *all the
--   land of Canaan, for an everlasting possession*, yet here the patriarch must BUY a single cave to bury his dead,
--   confessing himself *a stranger and a sojourner*. Hebrews reads this exactly: *These all died in faith, not
--   having received the promises, but having seen them afar off... and confessed that they were strangers and
--   pilgrims on the earth* (Hebrews 11:13); Abraham *sojourned in the land of promise, as in a strange country*
--   (Hebrews 11:9), *for he looked for a city which hath foundations, whose builder and maker is Elohim (God)*
--   (Hebrews 11:10). The promise is possessed now only as a down-payment held by resurrection-hope — the Akedah's
--   faith (Hebrews 11:19) carried into the grave-purchase. NO replacement reading: the land-promise is not
--   spiritualized away; it is real, sworn, FUTURE, awaited in faith. Jubilees 19:9 makes the trial explicit —
--   Abraham *said not a single word regarding the rumour... how that Elohim had said that He would give it to him
--   and to his seed after him, and he begged a place there to bury his dead; for he was found faithful... the friend
--   of Elohim* — the patriarch begs ground in the very land deeded to his seed, and holds his peace by faith.
--   ★ ACTS 7:16 — DELIBERATELY OMITTED as a member. Stephen's text reads *laid in the sepulchre that Abraham bought
--   for a sum of money of the sons of Emmor the father of Sychem* (Acts 7:16) — this conflates the Shechem ground
--   Jacob bought from the sons of Hamor (Genesis 33:19) with the Machpelah cave Abraham bought from Ephron the
--   Hittite at Hebron (Genesis 23). The buyer, the seller, and the SITE do not match Genesis 23; per the brief, a
--   mismatched/conflated parse is recorded "none warranted" rather than forced. NT coverage of Genesis 23 is carried
--   wholly by the Hebrews 11 strangers-and-pilgrims weave at THREAD 1.
--   ★ MACHPELAH — THE GATHERING OF THE FATHERS (THREAD 3). The one purchased ground in the land of promise becomes
--   the covenant family's gathering-place: Abraham (Genesis 25:9), Sarah, Isaac and Rebekah, Leah, and Jacob himself
--   (Genesis 49:29-31; 50:13) are all laid in the double cave. The seed gathered in the one cave Abraham bought —
--   the down-payment of the land-inheritance, held by the resurrection until the promise is possessed in full.
--   EXTRAS: Jubilees 19:2-9 and Jasher 24:1-15 both narrate Genesis 23 closely (clean parses). Jubilees DOUBLE-
--   WRITTEN 'jubilees','jubilees'; Jasher DOUBLE-WRITTEN 'jasher','jasher'. Jubilees 19:6/7 numbering: the parse
--   folds v.6-7 together under "6" (the "give it for nothing / full price / bowed twice / days of Sarah 127 years"
--   block) and skips a bare "7"; only present clean verses used. Jasher 24 verses used: 2,5,6,7,11,12,15 — all clean.

CREATE TEMP VIEW _s301_ge23_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: I am a stranger and a sojourner — the only land owned was a grave
    ('canon','genesis',23,4,'canon','hebrews',11,13,'free',
      E'*These all died in faith, not having received the promises, but having seen them afar off, and were persuaded of them, and embraced them, and confessed that they were strangers and pilgrims on the earth* (Hebrews 11:13). When Abraham stands before the sons of Heth and says *I am a stranger and a sojourner with you* (Genesis 23:4), he is confessing the very thing Hebrews names of the whole line of the fathers: they *died in faith, not having received the promises*, *strangers and pilgrims on the earth*. Sarah is dead, and the only ground Abraham owns in the land deeded to his seed is the grave he must buy.'),
    ('canon','genesis',23,4,'canon','hebrews',11,9,'free',
      E'*By faith he sojourned in the land of promise, as in a strange country, dwelling in tabernacles with Isaac and Jacob, the heirs with him of the same promise* (Hebrews 11:9). Abraham''s own words — *I am a stranger and a sojourner with you* (Genesis 23:4) — are read forward exactly: he *sojourned in the land of promise, as in a strange country*. The land is his by oath and not yet by possession; he dwells in it as a sojourner, an heir who has not yet inherited.'),
    ('canon','genesis',23,4,'canon','hebrews',11,10,'free',
      E'*For he looked for a city which hath foundations, whose builder and maker is Elohim (God)* (Hebrews 11:10). Why would the man to whom *all the land of Canaan* was sworn confess himself *a stranger and a sojourner* (Genesis 23:4) and beg a single cave to bury his dead? Because *he looked for a city which hath foundations, whose builder and maker is Elohim* — the land-promise is real and future, held now only as a grave, the down-payment awaited in resurrection-hope.'),
    ('canon','genesis',23,4,'canon','genesis',17,8,'free',
      E'*And I will give unto thee, and to thy seed after thee, the land wherein thou art a stranger, all the land of Canaan, for an everlasting possession; and I will be their Elohim (God)* (Genesis 17:8). The oath itself names Abraham *a stranger* in the land it gives him — *the land wherein thou art a stranger, all the land of Canaan, for an everlasting possession*. So when he says *I am a stranger and a sojourner with you... give me a possession of a buryingplace* (Genesis 23:4), the only *possession* he takes in the everlasting-possession land is a grave. The promise is sworn and future; the grave is the first deed held by faith.'),
    ('canon','genesis',23,4,'jubilees','jubilees',19,9,'extras',
      E'*And he said not a single word regarding the rumour in the land how that Elohim (God) had said that He would give it to him and to his seed after him, and he begged a place there to bury his dead; for he was found faithful, and was recorded on the heavenly tables as the friend of Elohim (God)* (Jubilees 19:9). The restored witness makes the trial plain: the whole land was promised to Abraham and his seed, yet he *begged a place there to bury his dead* and *said not a single word* of complaint. This is the faith behind *I am a stranger and a sojourner with you* (Genesis 23:4) — the heir who owns nothing but a grave, and is named *the friend of Elohim*.'),

    -- THREAD 2: The cave of Machpelah, the four hundred shekels — the purchase made sure
    ('canon','genesis',23,9,'jubilees','jubilees',19,5,'extras',
      E'*And Yahuah (God) gave him grace before all who saw him, and he besought in gentleness the sons of Heth, and they gave him the land of the double cave over against Mamre, that is Hebron, for four hundred pieces of silver* (Jubilees 19:5). The restored witness keeps the purchase whole: Abraham besought the sons of Heth for *the cave of Machpelah, which he hath, which is in the end of his field... for a possession of a buryingplace* (Genesis 23:9), and received *the land of the double cave over against Mamre... for four hundred pieces of silver* — Machpelah meaning the double cave, the very price of Genesis 23:15-16.'),
    ('canon','genesis',23,11,'jubilees','jubilees',19,6,'extras',
      E'*And they besought him, saying, "We shall give it to you for nothing"; but he would not take it from their hands for nothing, for he gave the price of the place, the money in full, and he bowed down before them twice; and after this he buried his dead in the double cave* (Jubilees 19:6). Ephron had said *the field give I thee, and the cave that is therein, I give it thee... bury thy dead* (Genesis 23:11), but Abraham *would not take it... for nothing* — *he gave the price of the place, the money in full*. The grave is bought outright, a true deed, not a gift to be reclaimed.'),
    ('canon','genesis',23,13,'jasher','jasher',24,5,'extras',
      E'*And Abraham said, No, but I will buy the cave and the field which you have for value, In order that it may be for a possession of a burial place for ever* (Jasher 24:5). When Ephron offered the ground freely, Abraham insisted — *if thou wilt give it, I pray thee, hear me: I will give thee money for the field; take it of me* (Genesis 23:13) — *No, but I will buy the cave and the field... for value... for a possession of a burial place for ever*. The full-price purchase makes the grave a sure and everlasting possession.'),
    ('canon','genesis',23,13,'jasher','jasher',24,6,'extras',
      E'*And Abraham said, Only at full value will I buy it from your hand, and from the hands of those that go in at the gate of your city, and from the hand of your seed for ever* (Jasher 24:6). The restored witness draws out the whole intent of *I will give thee money for the field; take it of me* (Genesis 23:13): *Only at full value will I buy it... from the hand of your seed for ever*. Nothing is left for any heir of Ephron to dispute — the cave is Abraham''s by full price, secured against every later claim.'),
    ('canon','genesis',23,16,'jasher','jasher',24,7,'extras',
      E'*And Ephron and all his brethren heard this, and Abraham weighed to Ephron four hundred shekels of silver in the hands of Ephron and in the hands of all his brethren; and Abraham wrote this transaction, and he wrote it and testified it with four witnesses* (Jasher 24:7). The weighing of Genesis 23:16 — *Abraham weighed to Ephron the silver... four hundred shekels of silver, current money with the merchant* — is kept in the restored witness, with the deed written and sealed before *four witnesses*: a binding, witnessed purchase.'),
    ('canon','genesis',23,17,'jasher','jasher',24,11,'extras',
      E'*And the field and the cave that was in it and all that place were made sure to Abraham and to his seed after him, from the children of Heth; behold it is before Mamre in Hebron, which is in the land of Canaan* (Jasher 24:11). The deed of Genesis 23:17-18 — *the field, and the cave which was therein... were made sure unto Abraham for a possession* — is carried entire: *the field and the cave... and all that place were made sure to Abraham and to his seed after him*. The grave passes not to Abraham only but *to his seed after him*.'),
    ('canon','genesis',23,19,'jasher','jasher',24,12,'extras',
      E'*And after this Abraham buried his wife Sarah there, and that place and all its boundary became to Abraham and to his seed for a possession of a burial place* (Jasher 24:12). The burial of Genesis 23:19 — *Abraham buried Sarah his wife in the cave of the field of Machpelah before Mamre* — is kept, and with it the deed: *that place and all its boundary became to Abraham and to his seed for a possession of a burial place*. The first ground held in the land of promise is a grave, and it is held for the seed.'),

    -- THREAD 3: Machpelah — the gathering of the fathers
    ('canon','genesis',23,19,'canon','genesis',25,9,'free',
      E'*And his sons Isaac and Ishmael buried him in the cave of Machpelah, in the field of Ephron the son of Zohar the Hittite, which is before Mamre* (Genesis 25:9). The cave Abraham bought to bury Sarah — *the cave of the field of Machpelah before Mamre* (Genesis 23:19) — receives Abraham himself: *Isaac and Ishmael buried him in the cave of Machpelah... in the field of Ephron... which is before Mamre*. Husband laid beside wife in the one ground bought in the land of promise.'),
    ('canon','genesis',23,19,'canon','genesis',49,29,'free',
      E'*And he charged them, and said unto them, I am to be gathered unto my people: bury me with my fathers in the cave that is in the field of Ephron the Hittite* (Genesis 49:29). On his deathbed Jacob charges his sons toward the cave Abraham bought from Ephron to bury Sarah — *the cave of the field of Machpelah before Mamre* (Genesis 23:19) — *bury me with my fathers in the cave that is in the field of Ephron the Hittite*. The grave-purchase becomes the gathering-place of the whole covenant line.'),
    ('canon','genesis',23,19,'canon','genesis',49,31,'free',
      E'*There they buried Abraham and Sarah his wife; there they buried Isaac and Rebekah his wife; and there I buried Leah* (Genesis 49:31). Jacob names the company already laid where Sarah was first buried — *the cave of the field of Machpelah before Mamre* (Genesis 23:19): *Abraham and Sarah... Isaac and Rebekah... and there I buried Leah*. The single cave Abraham bought gathers the fathers and the mothers of the promise into one ground.'),
    ('canon','genesis',23,19,'canon','genesis',50,13,'free',
      E'*For his sons carried him into the land of Canaan, and buried him in the cave of the field of Machpelah, which Abraham bought with the field for a possession of a buryingplace of Ephron the Hittite, before Mamre* (Genesis 50:13). Jacob''s sons carry him up out of Egypt to the very cave Abraham bought for Sarah — *the cave of the field of Machpelah before Mamre... in the land of Canaan* (Genesis 23:19) — *which Abraham bought... for a possession of a buryingplace*. The last of the patriarchs is gathered to the first purchased ground, the down-payment of the inheritance held until the resurrection.'),

    -- THREAD 4: Abraham mourned and wept for Sarah
    ('canon','genesis',23,2,'jubilees','jubilees',19,2,'extras',
      E'*And in the first year of the third week of this jubilee the days of the life of Sarah were accomplished, and she died in Hebron* (Jubilees 19:2). The restored witness keeps the death of Sarah at Hebron — *Sarah died in Kirjath-arba; the same is Hebron in the land of Canaan* (Genesis 23:2) — *the days of the life of Sarah were accomplished, and she died in Hebron*. The mother of the promised seed dies in the land sworn to that seed.'),
    ('canon','genesis',23,2,'jubilees','jubilees',19,3,'extras',
      E'*And Abraham went to mourn over her and bury her, and we tried him to see if his spirit were patient and he were not indignant in the words of his mouth; and he was found patient in this, and was not disturbed* (Jubilees 19:3). The mourning of Genesis 23:2 — *Abraham came to mourn for Sarah, and to weep for her* — is read in the restored witness as a trial of faith: *Abraham went to mourn over her and bury her... and he was found patient in this, and was not disturbed*. He grieves and trusts in the same breath.'),
    ('canon','genesis',23,2,'jasher','jasher',24,15,'extras',
      E'*And the days of Sarah were one hundred and twenty-seven years and she died, and Abraham made a great and heavy mourning, and he performed the rites of mourning for seven days* (Jasher 24:15). The count and the grief of Genesis 23:1-2 — *Sarah was an hundred and seven and twenty years old... and Abraham came to mourn for Sarah, and to weep for her* — are kept whole in the restored witness: *the days of Sarah were one hundred and twenty-seven years... and Abraham made a great and heavy mourning... seven days*.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s301_ge23_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s301_ge23_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-23-a-stranger-and-a-sojourner-in-a-strange-land',
       E'I am a stranger and a sojourner — the only land owned was a grave',
       E'Sarah is dead, and Abraham stands before the sons of Heth to ask for ground to bury her: *I am a stranger and a sojourner with you: give me a possession of a buryingplace with you, that I may bury my dead out of my sight* (Genesis 23:4). Hold this against the oath. Yahuah had sworn to Abraham *all the land of Canaan, for an everlasting possession* (Genesis 17:8) — and that same oath calls him *a stranger* in it: *the land wherein thou art a stranger*. So the only *possession* the patriarch ever takes in the everlasting-possession land is a grave he must buy. The land-promise is REAL and SWORN — and FUTURE; it is held now only as a burial cave, the first deed, the down-payment awaited in faith. Hebrews reads Genesis 23:4 exactly: *These all died in faith, not having received the promises, but having seen them afar off, and were persuaded of them, and embraced them, and confessed that they were strangers and pilgrims on the earth* (Hebrews 11:13). Abraham *sojourned in the land of promise, as in a strange country, dwelling in tabernacles with Isaac and Jacob, the heirs with him of the same promise* (Hebrews 11:9) — heirs who had not yet inherited. And the reason a man with a sworn land begs a single cave: *he looked for a city which hath foundations, whose builder and maker is Elohim (God)* (Hebrews 11:10). The grave is held by resurrection-hope — the same faith that, on Moriah, accounted *that Elohim (God) was able to raise him up, even from the dead* (Hebrews 11:19). The restored witness makes it a trial passed: Abraham *said not a single word regarding the rumour in the land how that Elohim (God) had said that He would give it to him and to his seed after him, and he begged a place there to bury his dead; for he was found faithful... the friend of Elohim (God)* (Jubilees 19:9). The heir owns nothing in the land but a grave — and holds his peace by faith. No promise is spiritualized away here; the land is sworn, future, and awaited.',
       sv.verse_id, ev.verse_id, 'extras', 20550
  FROM _s301_ge23_lookup sv, _s301_ge23_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=23 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=23 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-23-the-cave-of-machpelah-the-four-hundred-shekels',
       E'The cave of Machpelah, the four hundred shekels — the purchase made sure',
       E'Abraham will not be given the grave; he will buy it. He asks for *the cave of Machpelah, which he hath, which is in the end of his field; for as much money as it is worth he shall give it me for a possession of a buryingplace* (Genesis 23:9). Ephron the Hittite, in the gate of his city, offers it freely — *the field give I thee, and the cave that is therein, I give it thee... bury thy dead* (Genesis 23:11) — but Abraham presses for a price: *I will give thee money for the field; take it of me* (Genesis 23:13). And so *Abraham weighed to Ephron the silver... four hundred shekels of silver, current money with the merchant* (Genesis 23:16), and *the field, and the cave which was therein, and all the trees that were in the field... were made sure unto Abraham for a possession* (Genesis 23:17-18), and *Abraham buried Sarah his wife in the cave of the field of Machpelah before Mamre* (Genesis 23:19). The restored witnesses keep the purchase whole. Jubilees: they *gave him the land of the double cave over against Mamre, that is Hebron, for four hundred pieces of silver* (Jubilees 19:5) — Machpelah means the double cave — and though they said *"We shall give it to you for nothing... he would not take it from their hands for nothing, for he gave the price of the place, the money in full, and he bowed down before them twice* (Jubilees 19:6). Jasher draws out why the full price mattered: *No, but I will buy the cave and the field... for value, In order that it may be for a possession of a burial place for ever* (Jasher 24:5), *Only at full value will I buy it from your hand... and from the hand of your seed for ever* (Jasher 24:6) — the deed weighed out and *testified... with four witnesses* (Jasher 24:7), *made sure to Abraham and to his seed after him* (Jasher 24:11), so that *that place and all its boundary became to Abraham and to his seed for a possession of a burial place* (Jasher 24:12). The grave is bought outright, witnessed, and deeded to the seed — a sure and everlasting possession against every later claim.',
       sv.verse_id, ev.verse_id, 'extras', 20553
  FROM _s301_ge23_lookup sv, _s301_ge23_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=23 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=23 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-23-machpelah-the-gathering-of-the-fathers',
       E'Machpelah — the gathering of the fathers',
       E'*And after this, Abraham buried Sarah his wife in the cave of the field of Machpelah before Mamre: the same is Hebron in the land of Canaan* (Genesis 23:19). This one cave — the only ground Abraham bought in the land of promise — becomes the gathering-place of the whole covenant family. Abraham himself is laid there: *his sons Isaac and Ishmael buried him in the cave of Machpelah, in the field of Ephron the son of Zohar the Hittite, which is before Mamre* (Genesis 25:9), husband beside wife. And dying in Egypt, Jacob charges his sons toward the same ground: *I am to be gathered unto my people: bury me with my fathers in the cave that is in the field of Ephron the Hittite* (Genesis 49:29), naming the whole company already there — *There they buried Abraham and Sarah his wife; there they buried Isaac and Rebekah his wife; and there I buried Leah* (Genesis 49:31). The charge is kept: *his sons carried him into the land of Canaan, and buried him in the cave of the field of Machpelah, which Abraham bought with the field for a possession of a buryingplace of Ephron the Hittite, before Mamre* (Genesis 50:13). Abraham and Sarah, Isaac and Rebekah, Jacob and Leah — the fathers and mothers of the promise — all gathered into the single cave Abraham bought from the sons of Heth. The seed is laid up together in the down-payment of the land-inheritance, the one purchased ground in the land of promise, held by the resurrection-hope until the whole land is possessed in full.',
       sv.verse_id, ev.verse_id, 'free', 20556
  FROM _s301_ge23_lookup sv, _s301_ge23_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=23 AND sv.verse_number=19
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=23 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-23-abraham-mourned-and-wept-for-sarah',
       E'Abraham came to mourn for Sarah, and to weep for her',
       E'*And Sarah was an hundred and seven and twenty years old: these were the years of the life of Sarah. And Sarah died in Kirjath-arba; the same is Hebron in the land of Canaan: and Abraham came to mourn for Sarah, and to weep for her* (Genesis 23:1-2). The mother of the promised seed — the one who *received strength to conceive seed... because she judged him faithful who had promised* (Hebrews 11:11) — dies in Hebron, in the land sworn to that seed, and Abraham grieves. The restored witnesses keep the scene. Jubilees marks her death at the same place: *the days of the life of Sarah were accomplished, and she died in Hebron* (Jubilees 19:2), and reads Abraham''s mourning as a trial of faith — *Abraham went to mourn over her and bury her, and we tried him to see if his spirit were patient and he were not indignant in the words of his mouth; and he was found patient in this, and was not disturbed* (Jubilees 19:3): he grieves and trusts in the same breath. Jasher keeps the count and the weight of the grief: *the days of Sarah were one hundred and twenty-seven years and she died, and Abraham made a great and heavy mourning, and he performed the rites of mourning for seven days* (Jasher 24:15). The patriarch weeps for his wife — and then rises to buy her a grave in the land of promise, holding the future by faith over an open grave.',
       sv.verse_id, ev.verse_id, 'extras', 20559
  FROM _s301_ge23_lookup sv, _s301_ge23_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=23 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=23 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*These all died in faith, not having received the promises... and confessed that they were strangers and pilgrims on the earth* (Hebrews 11:13) — Abraham''s *I am a stranger and a sojourner with you* (23:4) is the fathers'' own confession, dying in faith without the promise yet in hand.'
  FROM cross_reference_threads t
  JOIN _s301_ge23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=23 AND sv.verse_number=4
  JOIN _s301_ge23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-23-a-stranger-and-a-sojourner-in-a-strange-land'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*By faith he sojourned in the land of promise, as in a strange country... the heirs with him of the same promise* (Hebrews 11:9) — *a stranger and a sojourner* (23:4) read forward: the heir who dwells in the sworn land without yet inheriting it.'
  FROM cross_reference_threads t
  JOIN _s301_ge23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=23 AND sv.verse_number=4
  JOIN _s301_ge23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-23-a-stranger-and-a-sojourner-in-a-strange-land'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*For he looked for a city which hath foundations, whose builder and maker is Elohim (God)* (Hebrews 11:10) — why a man with a sworn land begs a grave (23:4): the promise is future, held by resurrection-hope.'
  FROM cross_reference_threads t
  JOIN _s301_ge23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=23 AND sv.verse_number=4
  JOIN _s301_ge23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-23-a-stranger-and-a-sojourner-in-a-strange-land'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*all the land of Canaan, for an everlasting possession... the land wherein thou art a stranger* (Genesis 17:8) — the oath itself calls Abraham *a stranger* in the very land it gives him (23:4); the only possession he takes in the everlasting-possession land is a grave. The promise is real and FUTURE.'
  FROM cross_reference_threads t
  JOIN _s301_ge23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=23 AND sv.verse_number=4
  JOIN _s301_ge23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-23-a-stranger-and-a-sojourner-in-a-strange-land'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*he said not a single word regarding the rumour... how that Elohim had said that He would give it to him and to his seed... and he begged a place there to bury his dead; for he was found faithful... the friend of Elohim* (Jubilees 19:9) — the trial behind 23:4: the heir owns nothing but a grave and holds his peace by faith.'
  FROM cross_reference_threads t
  JOIN _s301_ge23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=23 AND sv.verse_number=4
  JOIN _s301_ge23_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=19 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-23-a-stranger-and-a-sojourner-in-a-strange-land'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*they gave him the land of the double cave over against Mamre, that is Hebron, for four hundred pieces of silver* (Jubilees 19:5) — Machpelah (the double cave) of 23:9 bought for the price of 23:15-16 in the restored witness.'
  FROM cross_reference_threads t
  JOIN _s301_ge23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=23 AND sv.verse_number=9
  JOIN _s301_ge23_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=19 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-23-the-cave-of-machpelah-the-four-hundred-shekels'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*"We shall give it to you for nothing"; but he would not take it... he gave the price of the place, the money in full, and he bowed down before them twice* (Jubilees 19:6) — against Ephron''s free offer (23:11), Abraham buys the grave outright.'
  FROM cross_reference_threads t
  JOIN _s301_ge23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=23 AND sv.verse_number=11
  JOIN _s301_ge23_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=19 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-23-the-cave-of-machpelah-the-four-hundred-shekels'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*No, but I will buy the cave and the field... for value, In order that it may be for a possession of a burial place for ever* (Jasher 24:5) — *I will give thee money for the field; take it of me* (23:13) drawn out: the full price makes the grave an everlasting possession.'
  FROM cross_reference_threads t
  JOIN _s301_ge23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=23 AND sv.verse_number=13
  JOIN _s301_ge23_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=24 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-23-the-cave-of-machpelah-the-four-hundred-shekels'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Only at full value will I buy it from your hand... and from the hand of your seed for ever* (Jasher 24:6) — the whole intent of 23:13: nothing left for Ephron''s heirs to dispute.'
  FROM cross_reference_threads t
  JOIN _s301_ge23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=23 AND sv.verse_number=13
  JOIN _s301_ge23_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=24 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-23-the-cave-of-machpelah-the-four-hundred-shekels'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Abraham weighed to Ephron four hundred shekels of silver... and Abraham wrote this transaction, and... testified it with four witnesses* (Jasher 24:7) — the weighing of 23:16 sealed before witnesses, a binding deed.'
  FROM cross_reference_threads t
  JOIN _s301_ge23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=23 AND sv.verse_number=16
  JOIN _s301_ge23_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=24 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-23-the-cave-of-machpelah-the-four-hundred-shekels'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*the field and the cave that was in it and all that place were made sure to Abraham and to his seed after him* (Jasher 24:11) — the deed of 23:17-18 carried entire: the grave passes to the seed.'
  FROM cross_reference_threads t
  JOIN _s301_ge23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=23 AND sv.verse_number=17
  JOIN _s301_ge23_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=24 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-23-the-cave-of-machpelah-the-four-hundred-shekels'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*after this Abraham buried his wife Sarah there, and that place... became to Abraham and to his seed for a possession of a burial place* (Jasher 24:12) — the burial of 23:19 and the deed to the seed in the restored witness.'
  FROM cross_reference_threads t
  JOIN _s301_ge23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=23 AND sv.verse_number=19
  JOIN _s301_ge23_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=24 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-23-the-cave-of-machpelah-the-four-hundred-shekels'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*his sons Isaac and Ishmael buried him in the cave of Machpelah... which is before Mamre* (Genesis 25:9) — the cave Abraham bought for Sarah (23:19) receives Abraham himself, husband beside wife.'
  FROM cross_reference_threads t
  JOIN _s301_ge23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=23 AND sv.verse_number=19
  JOIN _s301_ge23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=25 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-23-machpelah-the-gathering-of-the-fathers'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*bury me with my fathers in the cave that is in the field of Ephron the Hittite* (Genesis 49:29) — dying Jacob charges his sons toward the cave Abraham bought (23:19), the gathering-place of the line.'
  FROM cross_reference_threads t
  JOIN _s301_ge23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=23 AND sv.verse_number=19
  JOIN _s301_ge23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-23-machpelah-the-gathering-of-the-fathers'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*There they buried Abraham and Sarah his wife; there they buried Isaac and Rebekah his wife; and there I buried Leah* (Genesis 49:31) — the fathers and mothers of the promise gathered where Sarah was first laid (23:19).'
  FROM cross_reference_threads t
  JOIN _s301_ge23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=23 AND sv.verse_number=19
  JOIN _s301_ge23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-23-machpelah-the-gathering-of-the-fathers'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*his sons carried him into the land of Canaan, and buried him in the cave of the field of Machpelah, which Abraham bought... before Mamre* (Genesis 50:13) — the last patriarch carried up to the first purchased ground (23:19), held until the resurrection.'
  FROM cross_reference_threads t
  JOIN _s301_ge23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=23 AND sv.verse_number=19
  JOIN _s301_ge23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=50 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-23-machpelah-the-gathering-of-the-fathers'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*the days of the life of Sarah were accomplished, and she died in Hebron* (Jubilees 19:2) — Sarah''s death at Hebron of 23:2 in the restored witness; the mother of the seed dies in the land sworn to that seed.'
  FROM cross_reference_threads t
  JOIN _s301_ge23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=23 AND sv.verse_number=2
  JOIN _s301_ge23_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=19 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-23-abraham-mourned-and-wept-for-sarah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Abraham went to mourn over her and bury her... he was found patient in this, and was not disturbed* (Jubilees 19:3) — the mourning of 23:2 read as a trial of faith: he grieves and trusts in the same breath.'
  FROM cross_reference_threads t
  JOIN _s301_ge23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=23 AND sv.verse_number=2
  JOIN _s301_ge23_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=19 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-23-abraham-mourned-and-wept-for-sarah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the days of Sarah were one hundred and twenty-seven years and she died, and Abraham made a great and heavy mourning... seven days* (Jasher 24:15) — the count and grief of 23:1-2 kept whole in the restored witness.'
  FROM cross_reference_threads t
  JOIN _s301_ge23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=23 AND sv.verse_number=2
  JOIN _s301_ge23_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=24 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-23-abraham-mourned-and-wept-for-sarah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
