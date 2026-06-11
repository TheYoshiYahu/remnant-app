-- ----- fragment: minion_genesis_12.sql (Genesis 12) -----
-- Chapter: Genesis 12 (the call of Abram — the Abrahamic covenant inaugurated; get thee out; I will make of thee a great nation and in thee shall all families of the earth be blessed; Abram obeys and goes; the altars at Shechem and Bethel, calling on the Name; unto thy seed will I give this land; the famine, Egypt, Sarai taken by Pharaoh, Yahuah plagues Pharaoh's house)
-- Tag: ge12   Temp view: _s301_ge12_lookup
-- Sort band: base 20275, step 3 -> threads at 20275, 20278, 20281 (3 threads)
-- Source of EVERY row: 'canon','genesis',12,v
--
-- Genesis 12 coverage:
--   ★★ v.1-3 (Get thee out of thy country, and from thy kindred, and from thy father's house; I will make of thee a great nation, and I will bless thee, and make thy name great; and in thee shall all families of the earth be blessed) — the Abrahamic covenant, the seed-promise begun
--        NT:     Galatians 3:8 (the scripture, foreseeing that Elohim would justify the heathen through faith, preached before the gospel unto Abraham, In thee shall all nations be blessed); Galatians 3:16 (to thy seed... which is Messiah — the seed singular); Galatians 3:29 (if ye be Messiah's, then are ye Abraham's seed); Acts 3:25 (the children of the covenant... in thy seed shall all the kindreds of the earth be blessed); Hebrews 11:8 (by faith Abraham, when he was called... obeyed) — THREAD 1 (load-bearing)
--        Extras: Jubilees 12:22 (the call delivered through the angel: Get you up from your country... and in you will all families of the earth be blessed); Jasher 13:23 (Go forth from your land... in you shall the families of the earth be blessed) — THREAD 1
--        Tanakh: Isaiah 51:2 (Look unto Abraham your father, and unto Sarah... for I called him alone, and blessed him, and increased him); Jeremiah 31:10 (He that scattered Yashar'el will gather him — the seed scattered through the nations, gathered home: the mechanism of the all-families blessing) — THREAD 1
--   ★ v.4-9 (So Abram departed, as Yahuah had spoken; Lot went with him; into Canaan they came; Yahuah appeared, Unto thy seed will I give this land; he builded an altar at Sichem; removed to Beth-el, builded an altar, and called upon the name of Yahuah) — the obedience, the land-promise to the seed, the first altars, calling on the Name
--        NT:     Hebrews 11:9 (by faith he sojourned in the land of promise, as in a strange country, dwelling in tabernacles); Hebrews 11:10 (he looked for a city which hath foundations, whose builder and maker is Elohim); Acts 7:5 (he gave him none inheritance in it... yet he promised that he would give it to him for a possession, and to his seed after him) — THREAD 2
--        Extras: Jubilees 13:1 (Abram journeyed from Haran... and proceeded to Shechem); Jubilees 13:7 (he built an altar... and called on the name of Yahuah); Jasher 13:7 (This is the land which I gave to you and to your seed after you forever); Jasher 13:8 (Abram built an altar... and called upon the name of Yahuah); Jasher 13:28 (To your seed will I give this land; and he there built an altar) — THREAD 2
--        Tanakh: Genesis 15:18 (Unto thy seed have I given this land, from the river of Egypt unto the great river Euphrates — the land-grant confirmed by covenant-cutting); Genesis 22:18 (in thy seed shall all the nations of the earth be blessed; because thou hast obeyed my voice — the oath sealing the call); Psalm 105:8-11 (he hath remembered his covenant... Unto thee will I give the land of Canaan) — THREAD 2
--   v.10-20 (a famine in the land; Abram went down into Egypt; Sarai a fair woman, taken into Pharaoh's house; Yahuah plagued Pharaoh and his house with great plagues because of Sarai; Pharaoh sends them away) — the seed-bearer preserved; the foreshadow of the later Egypt descent and the exodus plagues
--        NT:     Hebrews 11:11 (through faith also Sara herself received strength to conceive seed... because she judged him faithful who had promised — the womb that carries the promise, here preserved in Pharaoh's house) — THREAD 3
--        Extras: Jubilees 13:11 (Abram went into Egypt... before his wife was torn away from him); Jubilees 13:12 (when Pharaoh seized Sarai... Yahuah plagued Pharaoh and his house with great plagues because of Sarai, Abram's wife) — THREAD 3
--        Tanakh: Psalm 105:13-15 (He suffered no man to do them wrong: yea, he reproved kings for their sakes; Touch not mine anointed, and do my prophets no harm — the covenant line shielded against kings, this very episode read as a pattern) — THREAD 3
--        Note: the Egypt-descent / Pharaoh-plagued episode is the SEED of the later Exodus pattern (the chosen line goes down to Egypt, is endangered, and Yahuah strikes Pharaoh with plagues to deliver them); framed here as the preservation of the promise against threat, not yet pulled forward to Exodus 12 as a member (that fulfilment belongs to the Genesis 15:13 / Exodus chapters proper). Recorded so no library is silently skipped.
--
-- Threads (slug — target libraries):
--   1. genesis-12-get-thee-out-the-call-of-abram-and-the-seed-in-whom-all-families-are-blessed — NT (Galatians, Acts, Hebrews) + Extras (Jubilees, Jasher) + Tanakh (Isaiah, Jeremiah) [extras] (CENTERPIECE)
--   2. genesis-12-unto-thy-seed-will-i-give-this-land-the-altars-and-the-name — NT (Hebrews, Acts) + Extras (Jubilees, Jasher) + Tanakh (Genesis, Psalm) [extras]
--   3. genesis-12-the-seed-bearer-preserved-sarai-pharaoh-and-the-plagues — NT (Hebrews) + Extras (Jubilees) + Tanakh (Psalm) [extras]
--
-- Framing notes:
--   ★★ THE CALL OF ABRAM — ALL FAMILIES BLESSED IN THE SEED (THREAD 1, load-bearing; the careful 12:3 framing):
--   The promise *in thee shall all families of the earth be blessed* (12:3) is NOT the false-inclusion graft
--   of non-seed peoples into Yashar'el by faith-confession. It is the seed-of-promise — narrowed to ONE,
--   *to thy seed... which is Messiah* (Galatians 3:16) — through whom the blessing flows out; the scattered
--   covenant line (*He that scattered Yashar'el will gather him*, Jeremiah 31:10) gathered home, and the
--   nations blessed THROUGH the seed. Galatians 3:8's *all nations be blessed* and Acts 3:25's *all the
--   kindreds of the earth* are read in exactly this register: the heathen blessed BY being brought into the
--   one seed (those who *be of faith are blessed with faithful Abraham*, Gal 3:9; *if ye be Messiah's, then
--   are ye Abraham's seed, and heirs according to the promise*, Gal 3:29) — incorporation into the seed-line,
--   never replacement of it, never a parallel people grafted in by confession alone. The seed is singular and
--   personal (Messiah), and through him the many. Abraham's part is FAITH-THAT-OBEYS: *by faith Abraham, when
--   he was called... obeyed* (Hebrews 11:8) — the obedience the brief's 1 John 2:3-4 filter requires, not
--   bare confession. "MAKE THY NAME GREAT" (12:2): Yahuah MAKES the name — the deliberate answer to Babel,
--   where men said *let us make us a name* (Genesis 11:4) and grasped it by their own brick; here the name is
--   GIVEN by promise to the one He calls (carried in this Genesis cross-pack at the Gen 11 thread; surfaced
--   again in the summary here).
--   ★ UNTO THY SEED THIS LAND — THE ALTARS AND THE NAME (THREAD 2): the land-promise is to the SEED
--   (*unto thy seed will I give this land*, 12:7), confirmed by covenant-cutting (Genesis 15:18) and sworn by
--   oath (Genesis 22:18); Abram receives *none inheritance in it* (Acts 7:5) and dwells as a sojourner
--   *looking for a city which hath foundations* (Hebrews 11:10) — the land-promise held by faith, not yet
--   possessed. The first altars and the *calling upon the name of Yahuah* (12:8) are the worship the wandering
--   covenant-man plants in the land.
--   THE SEED-BEARER PRESERVED (THREAD 3): Sarai — the womb that carries the promise (Hebrews 11:11) — is
--   protected in Pharaoh's house by the plagues Yahuah brings; Psalm 105:14-15 reads the very episode as the
--   pattern, *he reproved kings for their sakes; Touch not mine anointed*. The Egypt-descent and Pharaoh-
--   plagued deliverance are the SEED of the Exodus pattern (recorded in coverage; framed as preservation of
--   the covenant line against threat).
--   Jubilees double-written 'jubilees','jubilees'; Jasher double-written 'jasher','jasher'. All extras pulls
--   verified clean (Jubilees 12-13, Jasher 13 — no apparatus noise in the quoted verses).

CREATE TEMP VIEW _s301_ge12_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (CENTERPIECE): get thee out — the call of Abram and the seed in whom all families are blessed
    ('canon','genesis',12,3,'canon','galatians',3,8,'free',
      E'*And the scripture, foreseeing that Elohim (God) would justify the heathen through faith, preached before the gospel unto Abraham, saying, In thee shall all nations be blessed* (Galatians 3:8). The word over Abram — *in thee shall all families of the earth be blessed* (Genesis 12:3) — is named here as the gospel preached BEFOREHAND: the heathen are blessed by being justified through the faith of Abraham, brought INTO the one seed-line, not grafted in as a second people. The blessing of all families is the seed of promise flowing out to the nations, never a replacement of the seed by confession.'),
    ('canon','genesis',12,3,'canon','galatians',3,16,'free',
      E'*Now to Abraham and his seed were the promises made. He saith not, And to seeds, as of many; but as of one, And to thy seed, which is Messiah (Christ)* (Galatians 3:16). The *thee* of *in thee shall all families of the earth be blessed* (Genesis 12:3) is read with exact care: the promise runs to a SEED, and that seed is singular — *to thy seed, which is Messiah*. All families are blessed through the one seed, the personal Messiah drawn out of the covenant line, and not through any opening of the line to many seeds by another door.'),
    ('canon','genesis',12,3,'canon','galatians',3,29,'free',
      E'*And if ye be Messiah''s (Christ''s), then are ye Abraham''s seed, and heirs according to the promise* (Galatians 3:29). How the nations come into the blessing of *in thee shall all families of the earth be blessed* (Genesis 12:3) is told plainly: they become *Abraham''s seed* — incorporated INTO the one seed-line in Messiah, *heirs according to the promise*. The blessing of all families is membership in the seed, the scattered gathered and the heathen brought in, never a parallel people standing beside Yashar''el.'),
    ('canon','genesis',12,3,'canon','acts',3,25,'free',
      E'*Ye are the children of the prophets, and of the covenant which Elohim (God) made with our fathers, saying unto Abraham, And in thy seed shall all the kindreds of the earth be blessed* (Acts 3:25). Peter sets the covenant of Genesis 12:3 — *in thee shall all families of the earth be blessed* — before the children of the covenant, and reads it *in thy SEED*: the kindreds of the earth are blessed in the seed of Abraham, the covenant line carried forward to those who are its children, the blessing flowing through the seed to the nations.'),
    ('canon','genesis',12,1,'canon','hebrews',11,8,'free',
      E'*By faith Abraham, when he was called to go out into a place which he should after receive for an inheritance, obeyed; and he went out, not knowing whither he went* (Hebrews 11:8). The call of *Get thee out of thy country, and from thy kindred, and from thy father''s house, unto a land that I will shew thee* (Genesis 12:1) is answered by faith THAT OBEYS — Abraham *obeyed; and he went out*. The covenant is entered not by confession but by the obedience of faith: he left all and went, *not knowing whither he went*, on the bare word of Yahuah.'),
    ('canon','genesis',12,1,'jubilees','jubilees',12,22,'extras',
      E'*"Get you up from your country, and from your kindred and from the house of your father to a land which I shall show you, and I shall make you a great and numerous nation. And I shall bless you And I shall make your name great, And you will be blessed in the earth, And in you will all families of the earth be blessed..."* (Jubilees 12:22). The restored witness delivers the very call of Genesis 12:1-3 — *Get thee out of thy country... and in thee shall all families of the earth be blessed* — word for word, set after Abram has already turned from his fathers'' idols, so the call falls on a man already given wholly to Yahuah.'),
    ('canon','genesis',12,3,'jasher','jasher',13,23,'extras',
      E'*Behold, I spoke to you these twenty years back saying, Go forth from your land, from your birth-place and from your father''s house, to the land which I have shown you to give it to you and to your children, for there in that land will I bless you, and make you a great nation, and make your name great, and in you shall the families of the earth be blessed* (Jasher 13:23). The restored witness repeats the covenant of Genesis 12:1-3 and binds it to the SEED — *to give it to you and to your children* — the blessing of *the families of the earth* riding on the line of promise, the made name and the great nation given by Yahuah.'),
    ('canon','genesis',12,2,'canon','isaiah',51,2,'free',
      E'*Look unto Abraham your father, and unto Sarah that bare you: for I called him alone, and blessed him, and increased him* (Isaiah 51:2). The prophet sends the scattered remnant back to the call of Genesis 12:2 — *I will make of thee a great nation, and I will bless thee* — and reads it as their own origin: Abraham was *called alone* and *blessed and increased*. The great nation is not a metaphor for the world at large; it is the seed of the one man, the covenant people hewn from the rock of Abraham.'),
    ('canon','genesis',12,3,'canon','jeremiah',31,10,'free',
      E'*Hear the word of Yahuah (LORD), O ye nations, and declare it in the isles afar off, and say, He that scattered Yashar''el (Israel) will gather him, and keep him, as a shepherd doth his flock* (Jeremiah 31:10). This is the mechanism behind *in thee shall all families of the earth be blessed* (Genesis 12:3): the seed of promise is scattered THROUGH the nations and then gathered home — *He that scattered Yashar''el will gather him* — and the nations, who hear the word and see the gathering, are blessed in and through the regathered seed, not in place of it.')
    ,
    -- THREAD 2: unto thy seed will I give this land — the altars and the name
    ('canon','genesis',12,7,'canon','acts',7,5,'free',
      E'*And he gave him none inheritance in it, no, not so much as to set his foot on: yet he promised that he would give it to him for a possession, and to his seed after him, when as yet he had no child* (Acts 7:5). When Yahuah said *Unto thy seed will I give this land* (Genesis 12:7), Abram held not a foot of it; Stephen marks the gap — *he gave him none inheritance* — *yet he promised* it to him and *to his seed after him*. The land is the seed''s by promise long before it is possessed, given to a man who *as yet had no child*.'),
    ('canon','genesis',12,8,'canon','hebrews',11,9,'free',
      E'*By faith he sojourned in the land of promise, as in a strange country, dwelling in tabernacles with Isaac and Jacob, the heirs with him of the same promise* (Hebrews 11:9). Abram pitching his tent and building altars between Beth-el and Hai (Genesis 12:8) is read as faith''s sojourn: he dwelt *in the land of promise, as in a strange country*, in tents — a man who owned the promise and not the soil, the same promise his son and grandson would inherit.'),
    ('canon','genesis',12,8,'canon','hebrews',11,10,'free',
      E'*For he looked for a city which hath foundations, whose builder and maker is Elohim (God)* (Hebrews 11:10). The altar and the tent of Genesis 12:8 — *he builded an altar unto Yahuah (LORD), and called upon the name of Yahuah (LORD)* — belong to a man who looked past the land itself: *he looked for a city which hath foundations, whose builder and maker is Elohim*. The land-promise to the seed opens onto a deeper inheritance the wandering worshipper already sought.'),
    ('canon','genesis',12,7,'canon','genesis',15,18,'free',
      E'*In the same day Yahuah (LORD) made a covenant with Abram, saying, Unto thy seed have I given this land, from the river of Egypt unto the great river, the river Euphrates* (Genesis 15:18). The word *Unto thy seed will I give this land* (Genesis 12:7) is sealed three chapters on by covenant-cutting — *Yahuah made a covenant with Abram* — and the bounds are drawn out, *from the river of Egypt unto the great river Euphrates*. The land-grant to the seed, first spoken at the altar, is now sworn in blood between the pieces.'),
    ('canon','genesis',12,3,'canon','genesis',22,18,'free',
      E'*And in thy seed shall all the nations of the earth be blessed; because thou hast obeyed my voice* (Genesis 22:18). The covenant of Genesis 12:3 — *in thee shall all families of the earth be blessed* — is sworn by oath after the binding of Isaac, and now precisely *in thy SEED*: the blessing of all the nations runs through the seed, and the reason given is obedience — *because thou hast obeyed my voice* — the same faith-that-obeys the call began with.'),
    ('canon','genesis',12,7,'canon','psalms',105,11,'free',
      E'*Saying, Unto thee will I give the land of Canaan, the lot of your inheritance* (Psalm 105:11). The psalmist gathers the land-promise of Genesis 12:7 into the song of the covenant *remembered for ever* (Psalm 105:8): *Unto thee will I give the land of Canaan, the lot of your inheritance*. What was spoken to Abram at the altar is sung over Yashar''el as their settled, sworn inheritance.'),
    ('canon','genesis',12,1,'jubilees','jubilees',13,1,'extras',
      E'*And Abram journeyed from Haran, and he took Sarai, his wife, and Lot his brother Haran''s son, to the land of Canaan, and he came into Asshur, and proceeded to Shechem, and dwelt near a lofty oak* (Jubilees 13:1). The obedience of *So Abram departed, as Yahuah (LORD) had spoken unto him* (Genesis 12:4) and the arrival *unto the place of Sichem* (Genesis 12:6) are carried in the restored witness step for step — Abram journeys from Haran with Sarai and Lot and comes to Shechem.'),
    ('canon','genesis',12,7,'jubilees','jubilees',13,7,'extras',
      E'*And he blessed Yahuah (God) who had led him out of Ur of the Chaldees, and had brought him to this land... he built an altar on this mountain, and called on the name of Yahuah (God): "You, the eternal Elohim (God), are my Elohim (God)."* (Jubilees 13:7). The altar of Genesis 12:7-8 — *there builded he an altar unto Yahuah (LORD)... and called upon the name of Yahuah (LORD)* — is given voice in the restored witness: the worship is a confession, *You, the eternal Elohim, are my Elohim*, the covenant-man planting the Name in the land.'),
    ('canon','genesis',12,7,'jasher','jasher',13,7,'extras',
      E'*And Yahuah (the Lord) appeared to Abram when he came to the land of Canaan, and said to him, This is the land which I gave to you and to your seed after you forever, and I will make your seed like the stars of heaven, and I will give to your seed for an inheritance all the lands which you see* (Jasher 13:7). The restored witness expands *Unto thy seed will I give this land* (Genesis 12:7): the land is to the seed *forever*, and the seed itself is multiplied *like the stars of heaven* — the land-promise and the seed-promise spoken together at the entering of Canaan.'),
    ('canon','genesis',12,8,'jasher','jasher',13,8,'extras',
      E'*And Abram built an altar in the place where Elohim (God) had spoken to him, and Abram there called upon the name of Yahuah (the Lord)* (Jasher 13:8). The first altars and the *calling upon the name of Yahuah* of Genesis 12:7-8 are matched exactly in the restored witness — Abram builds the altar *in the place where Elohim had spoken to him* and calls upon the Name there.'),
    ('canon','genesis',12,7,'jasher','jasher',13,28,'extras',
      E'*And Yahuah (the Lord) again appeared to Abram and said, To your seed will I give this land; and he there built an altar to Yahuah (the Lord) who appeared to him, which is still to this day in the plains of Mamre* (Jasher 13:28). The restored witness echoes Genesis 12:7 nearly word for word — *To your seed will I give this land* followed by the building of an altar *to Yahuah who appeared to him* — the appearing, the land-word to the seed, and the altar bound together as in the canon.')
    ,
    -- THREAD 3: the seed-bearer preserved — Sarai, Pharaoh, and the plagues
    ('canon','genesis',12,17,'canon','hebrews',11,11,'free',
      E'*Through faith also Sara herself received strength to conceive seed, and was delivered of a child when she was past age, because she judged him faithful who had promised* (Hebrews 11:11). Sarai taken into Pharaoh''s house (Genesis 12:15) is the womb that must yet *conceive seed* — and when *Yahuah (LORD) plagued Pharaoh and his house with great plagues because of Sarai Abram''s wife* (Genesis 12:17), it is the seed-bearer being guarded: the promise hangs on this woman, and Yahuah strikes a king to keep her free for the child of promise.'),
    ('canon','genesis',12,11,'jubilees','jubilees',13,11,'extras',
      E'*And Abram went into Egypt in the third year of the week, and he dwelt in Egypt five years before his wife was torn away from him* (Jubilees 13:11). The descent of *Abram went down into Egypt to sojourn there* (Genesis 12:10) and the danger near Egypt''s border (Genesis 12:11-13) are carried in the restored witness — the sojourn in Egypt and the seizing of his wife, *before his wife was torn away from him* — the covenant household imperilled in a foreign land.'),
    ('canon','genesis',12,17,'jubilees','jubilees',13,12,'extras',
      E'*And it came to pass when Pharaoh seized Sarai, the wife of Abram, that Yahuah (God) plagued Pharaoh and his house with great plagues because of Sarai, Abram''s wife* (Jubilees 13:12). The restored witness preserves Genesis 12:17 almost verbatim — *Yahuah plagued Pharaoh and his house with great plagues because of Sarai* — confirming the episode as the protection of the seed-bearer: Pharaoh seizes her, and Yahuah''s plagues pry her loose, a first sketch of the Egypt-and-plagues deliverance to come.'),
    ('canon','genesis',12,17,'canon','psalms',105,14,'free',
      E'*He suffered no man to do them wrong: yea, he reproved kings for their sakes* (Psalm 105:14). The psalm reads this very episode — *Yahuah (LORD) plagued Pharaoh and his house... because of Sarai* (Genesis 12:17) — as the settled pattern of the covenant line''s protection: while they were *strangers* and *few* in the land, Yahuah *suffered no man to do them wrong* and *reproved kings for their sakes*, Pharaoh among them, struck for laying hold of the promise-bearer.'),
    ('canon','genesis',12,17,'canon','psalms',105,15,'free',
      E'*Saying, Touch not mine anointed, and do my prophets no harm* (Psalm 105:15). The plagues on Pharaoh''s house of Genesis 12:17 are the enforcement of this word: Abram and Sarai are *mine anointed* and *my prophets*, the carriers of the covenant, and the king who took the seed-bearer learns by great plagues that to *touch* them is to fall under Yahuah''s own hand.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s301_ge12_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s301_ge12_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (CENTERPIECE)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-12-get-thee-out-the-call-of-abram-and-the-seed-in-whom-all-families-are-blessed',
       E'Get thee out — the call of Abram and the seed in whom all families are blessed',
       E'The covenant of the whole library begins here. *Now Yahuah (LORD) had said unto Abram, Get thee out of thy country, and from thy kindred, and from thy father''s house, unto a land that I will shew thee* (Genesis 12:1); *And I will make of thee a great nation, and I will bless thee, and make thy name great; and thou shalt be a blessing* (Genesis 12:2); *And I will bless them that bless thee, and curse him that curseth thee: and in thee shall all families of the earth be blessed* (Genesis 12:3). Read *in thee shall all families of the earth be blessed* with care, against the false-inclusion reading. The blessing to all families is not a second people grafted into Yashar''el by confession; it is the seed of promise — *Now to Abraham and his seed were the promises made. He saith not, And to seeds, as of many; but as of one, And to thy seed, which is Messiah (Christ)* (Galatians 3:16). The seed is singular and personal, and through that one seed the many: *And the scripture, foreseeing that Elohim (God) would justify the heathen through faith, preached before the gospel unto Abraham, saying, In thee shall all nations be blessed* (Galatians 3:8), so that *if ye be Messiah''s (Christ''s), then are ye Abraham''s seed, and heirs according to the promise* (Galatians 3:29) — the heathen are blessed by being brought INTO the seed, not beside it. Peter says the same to the children of the covenant: *in thy seed shall all the kindreds of the earth be blessed* (Acts 3:25). And the mechanism is the scattering and the regathering: *He that scattered Yashar''el (Israel) will gather him, and keep him, as a shepherd doth his flock* (Jeremiah 31:10) — the covenant line dispersed through the nations and drawn home, the nations blessed in and through the gathered seed. Abram''s part is faith that obeys — *By faith Abraham, when he was called to go out into a place which he should after receive for an inheritance, obeyed; and he went out, not knowing whither he went* (Hebrews 11:8) — and the restored witnesses repeat the call as it fell: *"Get you up from your country... And in you will all families of the earth be blessed"* (Jubilees 12:22); *Go forth from your land... and in you shall the families of the earth be blessed* (Jasher 13:23). Note too the answer to Babel folded into verse 2: where the builders said *let us make us a name* (Genesis 11:4), Yahuah here says *make thy name great* — what man grasps at on a tower, Yahuah gives by promise to the one He calls. The prophet sends the remnant back to its root: *Look unto Abraham your father, and unto Sarah that bare you: for I called him alone, and blessed him, and increased him* (Isaiah 51:2).',
       sv.verse_id, ev.verse_id, 'extras', 20275
  FROM _s301_ge12_lookup sv, _s301_ge12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=12 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=12 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-12-unto-thy-seed-will-i-give-this-land-the-altars-and-the-name',
       E'Unto thy seed will I give this land — the altars and the name',
       E'Abram obeys and goes: *So Abram departed, as Yahuah (LORD) had spoken unto him; and Lot went with him* (Genesis 12:4), *and into the land of Canaan they came* (Genesis 12:5). At Sichem the word comes: *And Yahuah (LORD) appeared unto Abram, and said, Unto thy seed will I give this land: and there builded he an altar unto Yahuah (LORD), who appeared unto him* (Genesis 12:7); and at Beth-el *there he builded an altar unto Yahuah (LORD), and called upon the name of Yahuah (LORD)* (Genesis 12:8). The land is the seed''s by promise long before it is held. Stephen marks the gap: *And he gave him none inheritance in it, no, not so much as to set his foot on: yet he promised that he would give it to him for a possession, and to his seed after him, when as yet he had no child* (Acts 7:5). Abram dwells as a stranger on his own inheritance — *By faith he sojourned in the land of promise, as in a strange country, dwelling in tabernacles* (Hebrews 11:9) — because *he looked for a city which hath foundations, whose builder and maker is Elohim (God)* (Hebrews 11:10). The land-word at the altar is later sealed by covenant-cutting: *In the same day Yahuah (LORD) made a covenant with Abram, saying, Unto thy seed have I given this land, from the river of Egypt unto the great river, the river Euphrates* (Genesis 15:18); and sworn by oath after the binding of Isaac, *And in thy seed shall all the nations of the earth be blessed; because thou hast obeyed my voice* (Genesis 22:18); and sung over Yashar''el as their settled inheritance, *Saying, Unto thee will I give the land of Canaan, the lot of your inheritance* (Psalm 105:11). The restored witnesses walk the same ground: Abram *journeyed from Haran... and proceeded to Shechem* (Jubilees 13:1); he *built an altar... and called on the name of Yahuah (God): "You, the eternal Elohim (God), are my Elohim (God)"* (Jubilees 13:7); *To your seed will I give this land... and I will make your seed like the stars of heaven* (Jasher 13:7); *Abram built an altar in the place where Elohim (God) had spoken to him, and Abram there called upon the name of Yahuah (the Lord)* (Jasher 13:8); *To your seed will I give this land; and he there built an altar to Yahuah (the Lord) who appeared to him* (Jasher 13:28). The land-promise to the seed and the first worship in the land are one act of faith.',
       sv.verse_id, ev.verse_id, 'extras', 20278
  FROM _s301_ge12_lookup sv, _s301_ge12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=12 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=12 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-12-the-seed-bearer-preserved-sarai-pharaoh-and-the-plagues',
       E'The seed-bearer preserved — Sarai, Pharaoh, and the plagues',
       E'*And there was a famine in the land: and Abram went down into Egypt to sojourn there* (Genesis 12:10), and at the border he fears for his life because of Sarai''s beauty (Genesis 12:11-13). *The princes also of Pharaoh saw her, and commended her before Pharaoh: and the woman was taken into Pharaoh''s house* (Genesis 12:15). The promise now hangs on a woman inside a king''s house — and Yahuah moves to guard her: *And Yahuah (LORD) plagued Pharaoh and his house with great plagues because of Sarai Abram''s wife* (Genesis 12:17), and Pharaoh sends them away (Genesis 12:19-20). This is the preservation of the seed-bearer. Sarai is the womb that must yet bear the child of promise — *Through faith also Sara herself received strength to conceive seed, and was delivered of a child when she was past age, because she judged him faithful who had promised* (Hebrews 11:11) — and Yahuah strikes a king to keep her free for that seed. The restored witness confirms it: Abram *dwelt in Egypt five years before his wife was torn away from him* (Jubilees 13:11), and *when Pharaoh seized Sarai, the wife of Abram, that Yahuah (God) plagued Pharaoh and his house with great plagues because of Sarai, Abram''s wife* (Jubilees 13:12). The psalmist reads the episode as the fixed pattern of the covenant line''s shielding while it was *few* and *strangers*: *He suffered no man to do them wrong: yea, he reproved kings for their sakes* (Psalm 105:14), *Saying, Touch not mine anointed, and do my prophets no harm* (Psalm 105:15). Pharaoh laid hold of the promise-bearer and was struck — a first sketch of the greater Egypt-descent and the plagues that would one day pry the whole seed free.',
       sv.verse_id, ev.verse_id, 'extras', 20281
  FROM _s301_ge12_lookup sv, _s301_ge12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=12 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=12 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (CENTERPIECE)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*In thee shall all nations be blessed* (Galatians 3:8) — the gospel preached beforehand to Abraham: the heathen blessed by being justified into the one seed, the seed flowing out to the nations.'
  FROM cross_reference_threads t
  JOIN _s301_ge12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=12 AND sv.verse_number=3
  JOIN _s301_ge12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=3 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-12-get-thee-out-the-call-of-abram-and-the-seed-in-whom-all-families-are-blessed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*And to thy seed, which is Messiah (Christ)* (Galatians 3:16) — the *thee* of 12:3 is a SEED, and that seed is singular; all families blessed through the one personal Messiah.'
  FROM cross_reference_threads t
  JOIN _s301_ge12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=12 AND sv.verse_number=3
  JOIN _s301_ge12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=3 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-12-get-thee-out-the-call-of-abram-and-the-seed-in-whom-all-families-are-blessed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Then are ye Abraham''s seed, and heirs according to the promise* (Galatians 3:29) — the nations come into the blessing by being incorporated INTO the seed, never as a parallel people.'
  FROM cross_reference_threads t
  JOIN _s301_ge12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=12 AND sv.verse_number=3
  JOIN _s301_ge12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=3 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-12-get-thee-out-the-call-of-abram-and-the-seed-in-whom-all-families-are-blessed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*In thy seed shall all the kindreds of the earth be blessed* (Acts 3:25) — Peter reads the covenant to the children of the covenant: the blessing rides on the seed.'
  FROM cross_reference_threads t
  JOIN _s301_ge12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=12 AND sv.verse_number=3
  JOIN _s301_ge12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=3 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-12-get-thee-out-the-call-of-abram-and-the-seed-in-whom-all-families-are-blessed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*By faith Abraham, when he was called... obeyed; and he went out* (Hebrews 11:8) — the call of 12:1 answered by faith THAT OBEYS, not bare confession.'
  FROM cross_reference_threads t
  JOIN _s301_ge12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=12 AND sv.verse_number=1
  JOIN _s301_ge12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-12-get-thee-out-the-call-of-abram-and-the-seed-in-whom-all-families-are-blessed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*"Get you up from your country... And in you will all families of the earth be blessed"* (Jubilees 12:22) — the restored witness delivers the call word for word, after Abram has already left the idols.'
  FROM cross_reference_threads t
  JOIN _s301_ge12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=12 AND sv.verse_number=1
  JOIN _s301_ge12_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=12 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-12-get-thee-out-the-call-of-abram-and-the-seed-in-whom-all-families-are-blessed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*Go forth from your land... and in you shall the families of the earth be blessed* (Jasher 13:23) — the restored witness binds the blessing to the seed, *to you and to your children*.'
  FROM cross_reference_threads t
  JOIN _s301_ge12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=12 AND sv.verse_number=3
  JOIN _s301_ge12_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=13 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-12-get-thee-out-the-call-of-abram-and-the-seed-in-whom-all-families-are-blessed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*I called him alone, and blessed him, and increased him* (Isaiah 51:2) — the great nation of 12:2 is the seed of the one man, the rock the remnant is hewn from.'
  FROM cross_reference_threads t
  JOIN _s301_ge12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=12 AND sv.verse_number=2
  JOIN _s301_ge12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=51 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-12-get-thee-out-the-call-of-abram-and-the-seed-in-whom-all-families-are-blessed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'*He that scattered Yashar''el (Israel) will gather him* (Jeremiah 31:10) — the mechanism of 12:3: the seed scattered through the nations and gathered home, the nations blessed through the regathered seed.'
  FROM cross_reference_threads t
  JOIN _s301_ge12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=12 AND sv.verse_number=3
  JOIN _s301_ge12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-12-get-thee-out-the-call-of-abram-and-the-seed-in-whom-all-families-are-blessed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*He gave him none inheritance in it... yet he promised that he would give it to him... and to his seed after him* (Acts 7:5) — the land is the seed''s by promise before a foot of it is held.'
  FROM cross_reference_threads t
  JOIN _s301_ge12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=12 AND sv.verse_number=7
  JOIN _s301_ge12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-12-unto-thy-seed-will-i-give-this-land-the-altars-and-the-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*By faith he sojourned in the land of promise, as in a strange country, dwelling in tabernacles* (Hebrews 11:9) — the tent of 12:8: he owned the promise, not the soil.'
  FROM cross_reference_threads t
  JOIN _s301_ge12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=12 AND sv.verse_number=8
  JOIN _s301_ge12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-12-unto-thy-seed-will-i-give-this-land-the-altars-and-the-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*He looked for a city which hath foundations, whose builder and maker is Elohim (God)* (Hebrews 11:10) — the altar-builder of 12:8 looked past the land to a deeper inheritance.'
  FROM cross_reference_threads t
  JOIN _s301_ge12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=12 AND sv.verse_number=8
  JOIN _s301_ge12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-12-unto-thy-seed-will-i-give-this-land-the-altars-and-the-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Unto thy seed have I given this land, from the river of Egypt unto the great river Euphrates* (Genesis 15:18) — the land-word of 12:7 sealed by covenant-cutting, the bounds drawn out.'
  FROM cross_reference_threads t
  JOIN _s301_ge12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=12 AND sv.verse_number=7
  JOIN _s301_ge12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-12-unto-thy-seed-will-i-give-this-land-the-altars-and-the-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*In thy seed shall all the nations of the earth be blessed; because thou hast obeyed my voice* (Genesis 22:18) — the call of 12:3 sworn by oath, precisely *in thy SEED*, sealed by obedience.'
  FROM cross_reference_threads t
  JOIN _s301_ge12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=12 AND sv.verse_number=3
  JOIN _s301_ge12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-12-unto-thy-seed-will-i-give-this-land-the-altars-and-the-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*Unto thee will I give the land of Canaan, the lot of your inheritance* (Psalm 105:11) — the land-promise of 12:7 sung over Yashar''el as their settled inheritance.'
  FROM cross_reference_threads t
  JOIN _s301_ge12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=12 AND sv.verse_number=7
  JOIN _s301_ge12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=105 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-12-unto-thy-seed-will-i-give-this-land-the-altars-and-the-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*Abram journeyed from Haran... and proceeded to Shechem* (Jubilees 13:1) — the obedience and arrival of 12:4-6 walked step for step in the restored witness.'
  FROM cross_reference_threads t
  JOIN _s301_ge12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=12 AND sv.verse_number=1
  JOIN _s301_ge12_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=13 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-12-unto-thy-seed-will-i-give-this-land-the-altars-and-the-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*He built an altar... and called on the name of Yahuah (God): "You, the eternal Elohim (God), are my Elohim (God)"* (Jubilees 13:7) — the altar-worship of 12:7-8 given voice as confession.'
  FROM cross_reference_threads t
  JOIN _s301_ge12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=12 AND sv.verse_number=7
  JOIN _s301_ge12_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=13 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-12-unto-thy-seed-will-i-give-this-land-the-altars-and-the-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'*This is the land which I gave to you and to your seed after you forever, and I will make your seed like the stars of heaven* (Jasher 13:7) — 12:7 expanded: land AND seed-multiplied, spoken together.'
  FROM cross_reference_threads t
  JOIN _s301_ge12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=12 AND sv.verse_number=7
  JOIN _s301_ge12_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=13 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-12-unto-thy-seed-will-i-give-this-land-the-altars-and-the-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 10, E'*Abram built an altar in the place where Elohim (God) had spoken to him, and Abram there called upon the name of Yahuah (the Lord)* (Jasher 13:8) — the first altars and calling on the Name of 12:7-8.'
  FROM cross_reference_threads t
  JOIN _s301_ge12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=12 AND sv.verse_number=8
  JOIN _s301_ge12_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=13 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-12-unto-thy-seed-will-i-give-this-land-the-altars-and-the-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 11, E'*To your seed will I give this land; and he there built an altar to Yahuah (the Lord) who appeared to him* (Jasher 13:28) — 12:7 nearly word for word: appearing, land-word to the seed, and altar bound together.'
  FROM cross_reference_threads t
  JOIN _s301_ge12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=12 AND sv.verse_number=7
  JOIN _s301_ge12_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=13 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-12-unto-thy-seed-will-i-give-this-land-the-altars-and-the-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Sara herself received strength to conceive seed... because she judged him faithful who had promised* (Hebrews 11:11) — Sarai in Pharaoh''s house is the womb of the promise, guarded by the plagues of 12:17.'
  FROM cross_reference_threads t
  JOIN _s301_ge12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=12 AND sv.verse_number=17
  JOIN _s301_ge12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-12-the-seed-bearer-preserved-sarai-pharaoh-and-the-plagues'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Abram went into Egypt... before his wife was torn away from him* (Jubilees 13:11) — the descent and danger of 12:10-15 in the restored witness.'
  FROM cross_reference_threads t
  JOIN _s301_ge12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=12 AND sv.verse_number=11
  JOIN _s301_ge12_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=13 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-12-the-seed-bearer-preserved-sarai-pharaoh-and-the-plagues'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*When Pharaoh seized Sarai... Yahuah (God) plagued Pharaoh and his house with great plagues* (Jubilees 13:12) — 12:17 almost verbatim: the seed-bearer pried loose by the plagues.'
  FROM cross_reference_threads t
  JOIN _s301_ge12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=12 AND sv.verse_number=17
  JOIN _s301_ge12_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=13 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-12-the-seed-bearer-preserved-sarai-pharaoh-and-the-plagues'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*He suffered no man to do them wrong: yea, he reproved kings for their sakes* (Psalm 105:14) — the psalm reads 12:17 as the pattern: Pharaoh struck for laying hold of the promise-bearer.'
  FROM cross_reference_threads t
  JOIN _s301_ge12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=12 AND sv.verse_number=17
  JOIN _s301_ge12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=105 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-12-the-seed-bearer-preserved-sarai-pharaoh-and-the-plagues'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Touch not mine anointed, and do my prophets no harm* (Psalm 105:15) — Abram and Sarai are the anointed carriers of the covenant; to touch the seed is to fall under Yahuah''s hand.'
  FROM cross_reference_threads t
  JOIN _s301_ge12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=12 AND sv.verse_number=17
  JOIN _s301_ge12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=105 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-12-the-seed-bearer-preserved-sarai-pharaoh-and-the-plagues'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
