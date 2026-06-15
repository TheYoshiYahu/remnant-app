-- ----- fragment: minion_james_02.sql (S239 James 2) -----
-- =====================================================================
-- S239 minion — JAMES 2 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: JAMES 2 (26 verses) — THE FRAMEWORK KEYSTONE CHAPTER of the book.
-- Tag: j239c2 (temp view _s239_j239c2_lookup).
-- Sort band: floor 8830, step 3 (8830, 8833, 8836, 8839, 8842 used; under 8860).
-- Source is ALWAYS the canon James verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (James = the wisdom-of-the-two-house-remnant letter, written to the twelve tribes
-- scattered abroad; the Torah is in force and being kept). Chapter 2 is the framework keystone:
-- (1) respect of persons / no partiality (2:1-9) re-speaks Leviticus 19:15 and Sirach 35:12-13 — the
-- chosen poor are rich in faith and heirs of the kingdom; (2) ★★ the royal law / the whole law / guilty
-- of all (2:8-12) — *the royal law according to the scripture* is Leviticus 19:18 (*love thy neighbour
-- as thyself*), the *whole law* the indivisible Torah (Deuteronomy 27:26), the two commands cited are the
-- Decalogue verbatim (Exodus 20:13-14 / Deuteronomy 5:17-18); believers SHALL BE JUDGED by the law of
-- liberty — the opposite of "the law is abolished"; (3) ★★★ faith perfected by works — Abraham and
-- Rahab (2:14-26) — NOT Reformation grammar, NOT a works-vs-grace antithesis: living faith is Torah-
-- obedient faith, works the COMPLETION and evidence of faith. Genesis 15:6 (the belief) and Genesis 22
-- (the obedience that *made faith perfect*) are ONE pattern read through the keystone Genesis 26:5
-- (*Abraham obeyed my voice, and kept my charge, my commandments, my statutes, and my laws*); the Second-
-- Temple library makes the same fusion (1 Maccabees 2:52, Sirach 44:20). Paul (Romans 4) is the
-- COMPLEMENT not the contradiction — same Abraham, same Genesis 15:6; Paul excludes flesh-merit boasting,
-- James requires obedient living faith. Christology: *the faith of our Lord Yahusha HaMashiach, Yahuah
-- (Lord) of glory* (2:1) and *one Elohim* (2:19, Deuteronomy 6:4) — the Father is one; the Son bears his
-- Name and glory. No co-equal-persons grammar; no modalist collapse; no replacement theology.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-7   the faith of the Lord of glory held WITHOUT respect of persons; the chosen poor
--           Tanakh: Leviticus 19:15 (respect not the person of the poor nor the mighty),
--                   Deuteronomy 1:17 / 16:19 (respect not persons in judgment), Proverbs 24:23,
--                   1 Samuel 2:8 / Psalm 113:7 / Isaiah 66:2 (the poor lifted up / the contrite),
--                   Proverbs 17:5 (mocketh the poor reproacheth his Maker)
--           Extras: Sirach 35:12-13 (Yahuah is judge, no respect of persons; hears the oppressed)
--           NT: none warranted (the partiality root is the Tanakh + Sirach)
--   v.8-12  the royal law / the whole law / guilty of all; judged by the law of liberty
--           Tanakh: Leviticus 19:18 (love thy neighbour as thyself), Exodus 20:13-14 +
--                   Deuteronomy 5:17-18 (the Decalogue verbatim), Deuteronomy 27:26 (confirmeth
--                   not all the words of this law)
--           Extras: none warranted   NT: Galatians 5:14 (all the law fulfilled in one word)
--   v.13    judgment without mercy to him that shewed no mercy; mercy rejoiceth against judgment
--           Tanakh: Micah 6:8 (love mercy, walk humbly), Proverbs 21:13 (stoppeth ears at the cry)
--           Extras: Sirach 28:1-4 (forgive thy neighbour, so shall thy sins be forgiven)
--           NT: Matthew 5:7 (blessed are the merciful)
--   v.14-17,26 faith without works is dead; shut-up compassion to the naked and destitute
--           Tanakh: none warranted (the works-of-faith root is Abraham/Rahab below)
--           Extras: none warranted   NT: 1 John 3:17 (shutteth up his bowels of compassion)
--   v.18-26 faith perfected by works — Abraham offered Yitzhaq, Rahab; one Elohim
--           Tanakh: Genesis 15:6 (Abraham believed; counted for righteousness), Genesis 22:9-12,16-18
--                   (offered Yitzhaq, obeyed my voice), Genesis 26:5 (kept my charge, my commandments),
--                   Joshua 2:11 / 6:25 (Rahab), Deuteronomy 6:4 (one Yahuah — for 2:19)
--           Extras: 1 Maccabees 2:52 (Abraham faithful in temptation, imputed for righteousness),
--                   Sirach 44:20 (kept the law of the Most High... was found faithful)
--           NT: Hebrews 11:17-19,31 (Abraham and Rahab by faith), Romans 4:3,20-21 (the COMPLEMENT)
--
-- THREADS (slug -> target libraries):
--   8830 james-2-respect-of-persons-no-partiality-leviticus-19-sirach-35        (Tanakh + Extras)
--   8833 james-2-the-royal-law-and-the-whole-law-leviticus-19-the-decalogue     (Tanakh + NT)  [★★ BLESSING]
--   8836 james-2-mercy-rejoiceth-against-judgment-micah-6-sirach-28             (Tanakh + Extras + NT)
--   8839 james-2-faith-perfected-by-works-abraham-and-rahab-genesis-15-genesis-22  (Tanakh + Extras + NT)  [★★★ KEYSTONE / BLESSING]
--   8842 james-2-shew-mercy-to-the-naked-and-destitute-compassion-1-john-3      (NT)
-- =====================================================================

CREATE TEMP VIEW _s239_j239c2_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: james-2-respect-of-persons-no-partiality-leviticus-19-sirach-35
  ('canon', 'james', 2, 1, 'canon', 'leviticus', 19, 15, 'free', E'*Ye shall do no unrighteousness in judgment: thou shalt not respect the person of the poor, nor honour the person of the mighty: but in righteousness shalt thou judge thy neighbour.* (Leviticus 19:15). James'' rebuke — *have not the faith of our Lord Yahusha HaMashiach (Lord Jesus Christ), Yahuah (Lord) of glory, with respect of persons* (James 2:1) — stands squarely on the Torah''s own command. The same chapter that gives the royal law (Leviticus 19:18) forbids respecting the person of the poor OR the mighty; James applies it to the assembly that fawns on the man with the gold ring and shames the poor man in vile raiment. To hold the faith of the Lord of glory with partiality is to *commit sin, and are convinced of the law as transgressors* (James 2:9) — measured by this very statute.'),
  ('canon', 'james', 2, 9, 'canon', 'deuteronomy', 1, 17, 'free', E'*Ye shall not respect persons in judgment; but ye shall hear the small as well as the great; ye shall not be afraid of the face of man; for the judgment is Elohim''s (God''s): and the cause that is too hard for you, bring it unto me, and I will hear it.* (Deuteronomy 1:17). Mosheh charged the judges of Yashar''el (Israel) to *hear the small as well as the great,* for *the judgment is Elohim''s (God''s).* When James says *if ye have respect to persons, ye commit sin, and are convinced of the law as transgressors* (James 2:9), he convicts by this command: to seat the rich and footstool the poor is to usurp the judgment that belongs to Elohim (God), who shows no partiality.'),
  ('canon', 'james', 2, 9, 'canon', 'deuteronomy', 16, 19, 'free', E'*Thou shalt not wrest judgment; thou shalt not respect persons, neither take a gift: for a gift doth blind the eyes of the wise, and pervert the words of the righteous.* (Deuteronomy 16:19). The Torah binds the judge: *thou shalt not respect persons, neither take a gift.* James'' partial assembly — dazzled by *a gold ring, in goodly apparel* (James 2:2) — has let the gift blind its eyes, becoming *judges of evil thoughts* (James 2:4). The respecting of persons James names is the very corruption the Torah forbids at the gate.'),
  ('canon', 'james', 2, 9, 'canon', 'proverbs', 24, 23, 'free', E'*These things also belong to the wise. It is not good to have respect of persons in judgment.* (Proverbs 24:23). The wisdom books say plainly what James presses on the assembly: *It is not good to have respect of persons in judgment.* James'' assembly that says to the rich *Sit thou here in a good place* and to the poor *Stand thou there, or sit here under my footstool* (James 2:3) has departed from the wisdom of the Tanakh as surely as from its law — for the two are one in Yahuah (LORD).'),
  ('canon', 'james', 2, 5, 'canon', '1-samuel', 2, 8, 'free', E'*He raiseth up the poor out of the dust, and lifteth up the beggar from the dunghill, to set them among princes, and to make them inherit the throne of glory: for the pillars of the earth are the LORD''S, and he hath set the world upon them.* (1 Samuel 2:8). Channah''s song already sang what James proclaims: Yahuah (LORD) *raiseth up the poor out of the dust... to make them inherit the throne of glory.* So James: *Hath not Elohim (God) chosen the poor of this world rich in faith, and heirs of the kingdom which he hath promised to them that love him?* (James 2:5). The assembly despises whom Elohim (God) has chosen to enthrone; to shame the poor is to despise the heirs of the kingdom.'),
  ('canon', 'james', 2, 5, 'canon', 'isaiah', 66, 2, 'free', E'*For all those things hath mine hand made, and all those things have been, saith Yahuah (LORD): but to this man will I look, even to him that is poor and of a contrite spirit, and trembleth at my word.* (Isaiah 66:2). Yahuah (LORD) declares whom he regards: *him that is poor and of a contrite spirit, and trembleth at my word.* This is the man James says Elohim (God) *hath chosen... rich in faith* (James 2:5) — the very man the partial assembly seats under its footstool. To honour the rich oppressor over the poor who trembles at the word is to invert the looking of Yahuah (LORD) himself.'),
  ('canon', 'james', 2, 6, 'canon', 'proverbs', 17, 5, 'free', E'*Whoso mocketh the poor reproacheth his Maker: and he that is glad at calamities shall not be unpunished.* (Proverbs 17:5). Proverbs warns that *whoso mocketh the poor reproacheth his Maker.* James turns the same edge on the assembly: *ye have despised the poor* (James 2:6) — and despising the poor whom Elohim (God) made and chose is to reproach the Maker, the One whose faith of glory they claim to hold. The partiality is not a social slight but an offence against the Creator of both poor and rich.'),
  ('canon', 'james', 2, 1, 'apocrypha', 'ecclesiasticus', 35, 12, 'extras', E'*Do not think to corrupt with gifts; for such he will not receive: and trust not to unrighteous sacrifices; for Yahuah (God) is judge, and with him is no respect of persons.* (Sirach 35:12). The wisdom of the Hebrew library already held the framework James presses: *Yahuah (God) is judge, and with him is no respect of persons.* Because Elohim (God) judges without partiality, the assembly that holds *the faith of our Lord Yahusha HaMashiach (Lord Jesus Christ), Yahuah (Lord) of glory, with respect of persons* (James 2:1) contradicts the very character of the One it worships. James is re-speaking Sirach as much as Leviticus 19.'),
  ('canon', 'james', 2, 6, 'apocrypha', 'ecclesiasticus', 35, 13, 'extras', E'*He will not accept any person against a poor man, but will hear the prayer of the oppressed.* (Sirach 35:13). Sirach declares that Yahuah (God) *will not accept any person against a poor man, but will hear the prayer of the oppressed.* James'' assembly does the opposite — it *despised the poor* and sides with the rich who *oppress you, and draw you before the judgment seats* (James 2:6). To favour the oppressor over the oppressed is to stand against the One who hears the oppressed; the framework of the wisdom library and the apostle is one.'),

  -- thread: james-2-the-royal-law-and-the-whole-law-leviticus-19-the-decalogue  [★★ BLESSING]
  ('canon', 'james', 2, 8, 'canon', 'leviticus', 19, 18, 'free', E'*Thou shalt not avenge, nor bear any grudge against the children of thy people, but thou shalt love thy neighbour as thyself: I am Yahuah (LORD).* (Leviticus 19:18). When James writes *If ye fulfil the royal law according to the scripture, Thou shalt love thy neighbour as thyself, ye do well* (James 2:8), the *royal law according to the scripture* is this verse of the Torah, word for word. It is not a new commandment that replaced the law; it is a commandment OF the law, the summary the King himself gives — *love thy neighbour as thyself: I am Yahuah (LORD).* To fulfil the royal law is to keep the Torah, not to be freed from it.'),
  ('canon', 'james', 2, 11, 'canon', 'exodus', 20, 14, 'free', E'*Thou shalt not commit adultery.* (Exodus 20:14). James cites the Decalogue verbatim to prove the Torah is one indivisible whole: *For he that said, Do not commit adultery, said also, Do not kill* (James 2:11). The same Yahuah (LORD) who spoke *Thou shalt not commit adultery* spoke also *Thou shalt not kill*; therefore to break one is to become *a transgressor of the law* (James 2:11) as a whole. The commandments are not a menu; they are the single voice of the one Lawgiver.'),
  ('canon', 'james', 2, 11, 'canon', 'exodus', 20, 13, 'free', E'*Thou shalt not kill.* (Exodus 20:13). The second of the two words James quotes — *said also, Do not kill* (James 2:11) — is the Decalogue verbatim. James'' point is the indivisibility of the Torah: he that keeps the whole law *yet offend in one point, he is guilty of all* (James 2:10), because every word is the speech of the one Yahuah (LORD). The man who avoids adultery but kills *art become a transgressor of the law,* having broken the one law given by the one Lawgiver.'),
  ('canon', 'james', 2, 11, 'canon', 'deuteronomy', 5, 18, 'free', E'*Neither shalt thou commit adultery.* (Deuteronomy 5:18). At the renewal of the covenant Mosheh re-spoke the same word: *Neither shalt thou commit adultery.* James anchors his argument in this Decalogue — *he that said, Do not commit adultery, said also, Do not kill* (James 2:11) — to show that the Torah of Sinai and of Moab is one law, and the believer is bound to its whole, *judged by the law of liberty* (James 2:12).'),
  ('canon', 'james', 2, 11, 'canon', 'deuteronomy', 5, 17, 'free', E'*Thou shalt not kill.* (Deuteronomy 5:17). The Decalogue given again in Deuteronomy carries the same word — *Thou shalt not kill* — that James pairs with the command against adultery (James 2:11). The pairing makes the framework plain: the whole Torah stands or falls together, *for whosoever shall keep the whole law, and yet offend in one point, he is guilty of all* (James 2:10). The law is not abolished in James; it is upheld as the indivisible standard by which believers *shall be judged* (James 2:12).'),
  ('canon', 'james', 2, 10, 'canon', 'deuteronomy', 27, 26, 'free', E'*Cursed be he that confirmeth not all the words of this law to do them. And all the people shall say, Amen.* (Deuteronomy 27:26). At the Shechem covenant the people said Amen to the curse on *him that confirmeth not ALL the words of this law to do them.* This is the very principle James states: *whosoever shall keep the whole law, and yet offend in one point, he is guilty of all* (James 2:10). The Torah is to be confirmed in its wholeness; partial obedience is no obedience. James holds believers to all the words of the law, exactly as Deuteronomy does.'),
  ('canon', 'james', 2, 8, 'canon', 'galatians', 5, 14, 'free', E'*For all the law is fulfilled in one word, even in this; Thou shalt love thy neighbour as thyself.* (Galatians 5:14). Sha''ul (Paul) names the same royal law James names: *all the law is fulfilled in one word... Thou shalt love thy neighbour as thyself* — Leviticus 19:18. Far from setting Paul against James, this shows their agreement: love of neighbour is not the abolition of the Torah but its fulfilling, its summing-up. James'' *royal law according to the scripture* (James 2:8) and Paul''s *one word* in which *all the law is fulfilled* are the same commandment, the same Torah honoured by both apostles.'),

  -- thread: james-2-mercy-rejoiceth-against-judgment-micah-6-sirach-28
  ('canon', 'james', 2, 13, 'canon', 'micah', 6, 8, 'free', E'*He hath shewed thee, O man, what is good; and what doth Yahuah (LORD) require of thee, but to do justly, and to love mercy, and to walk humbly with thy Elohim (God)?* (Micah 6:8). What Yahuah (LORD) requires through Micah — *to do justly, and to love mercy, and to walk humbly* — is the very thing James presses: *he shall have judgment without mercy, that hath shewed no mercy; and mercy rejoiceth against judgment* (James 2:13). The one who loves mercy will find mercy rejoicing over him in the day of judgment; the merciless, having despised what Yahuah (LORD) requires, meets judgment without mercy.'),
  ('canon', 'james', 2, 13, 'canon', 'proverbs', 21, 13, 'free', E'*Whoso stoppeth his ears at the cry of the poor, he also shall cry himself, but shall not be heard.* (Proverbs 21:13). Proverbs sets the measure-for-measure James states: *whoso stoppeth his ears at the cry of the poor, he also shall cry himself, but shall not be heard.* So James: *he shall have judgment without mercy, that hath shewed no mercy* (James 2:13). The one who shut his ears to the poor — the very poor the partial assembly footstooled (James 2:2-6) — will himself be unheard in the day of his crying.'),
  ('canon', 'james', 2, 13, 'canon', 'matthew', 5, 7, 'free', E'*Blessed are the merciful: for they shall obtain mercy.* (Matthew 5:7). The Sermon on the Mount is James'' twin. Yahusha (Jesus) blessed the merciful — *they shall obtain mercy* — and James gives the obverse and the promise together: *he shall have judgment without mercy, that hath shewed no mercy; and mercy rejoiceth against judgment* (James 2:13). The merciful obtain mercy; over them mercy triumphs in the judgment. James is preaching the beatitude of his elder brother.'),
  ('canon', 'james', 2, 13, 'apocrypha', 'ecclesiasticus', 28, 2, 'extras', E'*Forgive your neighbour the hurt that he has done to you, so shall your sins also be forgiven when you prayest.* (Sirach 28:2). The wisdom of the library teaches the reciprocity James proclaims: *Forgive your neighbour... so shall your sins also be forgiven.* James'' *he shall have judgment without mercy, that hath shewed no mercy* (James 2:13) is the same law of mercy from the other side — Sirach asks, *He sheweth no mercy to a man, which is like himself: and does he ask forgiveness of his own sins?* (Sirach 28:4). The merciless cannot claim mercy; the framework of the wisdom books and the apostle is one.'),

  -- thread: james-2-faith-perfected-by-works-abraham-and-rahab-genesis-15-genesis-22  [★★★ KEYSTONE / BLESSING]
  ('canon', 'james', 2, 23, 'canon', 'genesis', 15, 6, 'free', E'*And he believed in Yahuah (LORD); and he counted it to him for righteousness.* (Genesis 15:6). This is the scripture James says was *fulfilled* — *Abraham believed Elohim (God), and it was imputed unto him for righteousness* (James 2:23). But mark how James reads it: the believing of Genesis 15:6 was *fulfilled* — brought to its completion — when Abraham offered Yitzhaq (Isaac) decades later (James 2:21-22). The faith that was counted for righteousness is the faith that obeyed; *by works was faith made perfect* (James 2:22). Genesis 15:6 is not set against works; it is consummated in them.'),
  ('canon', 'james', 2, 21, 'canon', 'genesis', 22, 9, 'free', E'*And they came to the place which Elohim (God) had told him of; and Abraham built an altar there, and laid the wood in order, and bound Isaac his son, and laid him on the altar upon the wood.* (Genesis 22:9). This is the work James names: *Was not Abraham our father justified by works, when he had offered Isaac his son upon the altar?* (James 2:21). The binding of Yitzhaq (Isaac) on the wood is the obedience in which the faith of Genesis 15:6 was made perfect. James does not pit this against believing; he shows that *faith wrought with his works, and by works was faith made perfect* (James 2:22) — the altar is where the belief became visible and complete.'),
  ('canon', 'james', 2, 22, 'canon', 'genesis', 22, 12, 'free', E'*And he said, Lay not thine hand upon the lad, neither do thou any thing unto him: for now I know that thou fearest Elohim (God), seeing thou hast not withheld thy son, thine only son from me.* (Genesis 22:12). The angel of Yahuah (LORD) declares the verdict: *now I know that thou fearest Elohim (God), seeing thou hast not withheld thy son.* This is precisely James'' point — *Seest thou how faith wrought with his works, and by works was faith made perfect?* (James 2:22). The not-withholding is the work; by it the unseen faith of Abraham was proved and perfected, and Elohim (God) himself says *now I know.* Living faith is the faith that obeys.'),
  ('canon', 'james', 2, 21, 'canon', 'genesis', 22, 16, 'free', E'*And said, By myself have I sworn, saith Yahuah (LORD), for because thou hast done this thing, and hast not withheld thy son, thine only son:* (Genesis 22:16). Yahuah (LORD) swears the blessing *because thou hast done this thing* — the obedience is the ground of the oath. James reads the Aqedah exactly so: Abraham was *justified by works, when he had offered Isaac his son upon the altar* (James 2:21). The doing, the not-withholding, draws forth the sworn covenant; the blessing of the multiplied seed (Genesis 22:17) follows the obeyed voice, not a faith that stayed in the heart alone.'),
  ('canon', 'james', 2, 21, 'canon', 'genesis', 22, 18, 'free', E'*And in thy seed shall all the nations of the earth be blessed; because thou hast obeyed my voice.* (Genesis 22:18). The covenant of the nations is sealed *because thou hast obeyed my voice.* This is the framework''s own grammar, and James''s: obedient faith, not bare assent, is what Yahuah (LORD) crowns. James'' *by works a man is justified, and not by faith only* (James 2:24) re-speaks *because thou hast obeyed my voice.* The obedience is not a rival to faith but its very life, the channel of the promise to all nations.'),
  ('canon', 'james', 2, 22, 'canon', 'genesis', 26, 5, 'free', E'*Because that Abraham obeyed my voice, and kept my charge, my commandments, my statutes, and my laws.* (Genesis 26:5). The keystone that holds James'' whole argument: Yahuah (LORD) testifies that Abraham *obeyed my voice, and kept my charge, my commandments, my statutes, and my laws.* The faith counted for righteousness in Genesis 15:6 was a Torah-keeping, voice-obeying faith — exactly the *faith made perfect* by *works* that James preaches (James 2:22). Read through Genesis 26:5, James'' Abraham is no proof of works-less belief but the pattern of obedient living faith: the believer and the keeper of the commandments are one man.'),
  ('canon', 'james', 2, 25, 'canon', 'joshua', 2, 11, 'free', E'*And as soon as we had heard these things, our hearts did melt, neither did there remain any more courage in any man, because of you: for Yahuah Elohaychem (the LORD your God), he is Elohim (God) in heaven above, and in earth beneath.* (Joshua 2:11). Rahab confessed the faith — *Yahuah Elohaychem (the LORD your God), he is Elohim (God) in heaven above, and in earth beneath* — and then she ACTED it, hiding the spies. James names her as the second witness: *Likewise also was not Rahab the harlot justified by works, when she had received the messengers, and had sent them out another way?* (James 2:25). Her confession alone would have been the dead faith of the devils who *believe, and tremble* (James 2:19); her hiding of the messengers made it living.'),
  ('canon', 'james', 2, 25, 'canon', 'joshua', 6, 25, 'free', E'*And Joshua saved Rahab the harlot alive, and her father''s household, and all that she had; and she dwelleth in Yashar''el (Israel) even unto this day; because she hid the messengers, which Joshua sent to spy out Jericho.* (Joshua 6:25). Rahab was saved and grafted into Yashar''el (Israel) *because she hid the messengers* — the work in which her faith was made perfect. James points to exactly this: she was *justified by works, when she had received the messengers, and had sent them out another way* (James 2:25). The harlot of Jericho becomes a daughter of the covenant by obedient faith — the two-house gathering pattern, faith proved in the deed.'),
  ('canon', 'james', 2, 23, 'canon', 'romans', 4, 3, 'free', E'*For what saith the scripture? Abraham believed Elohim (God), and it was counted unto him for righteousness.* (Romans 4:3). Sha''ul (Paul) quotes the same Genesis 15:6 that James quotes — *Abraham believed Elohim (God), and it was counted unto him for righteousness* — and the two are complement, not contradiction. Paul excludes the boasting of flesh-merit (*not of works, lest any man should boast*), James excludes the dead assent that never obeys (*faith without works is dead,* James 2:26). Both honour the same Abraham and the same scripture; Paul guards grace from earning, James guards faith from emptiness. The living faith Paul credits is the obedient faith James requires.'),
  ('canon', 'james', 2, 19, 'canon', 'deuteronomy', 6, 4, 'free', E'*Hear, O Yashar''el (Israel): Yahuah Eloheinu (The LORD our God) is one Yahuah (LORD):* (Deuteronomy 6:4). James grants the creed of Yashar''el (Israel) — *Thou believest that there is one Elohim (God); thou doest well* (James 2:19) — the Shema, *Yahuah Eloheinu (The LORD our God) is one Yahuah (LORD).* But bare monotheistic assent is not saving faith: *the devils also believe, and tremble.* The confession of the one Elohim (God) must be made alive by works, as Abraham''s and Rahab''s were. The Shema is true and good; held without obedience it is the faith of demons.'),
  ('canon', 'james', 2, 21, 'apocrypha', '1-maccabees', 2, 52, 'extras', E'*Was not Abraham found faithful in temptation, and it was imputed to him for righteousness?* (1 Maccabees 2:52). Mattithyahu''s dying charge to his sons makes the very fusion James makes: *Abraham found faithful in temptation* (the Aqedah, the offering of Yitzhaq) *and it was imputed to him for righteousness* (Genesis 15:6). The Second-Temple library already read the believing of Genesis 15 and the proving of Genesis 22 as ONE act of faithful obedience — exactly James'' *faith wrought with his works, and by works was faith made perfect* (James 2:22). James is not innovating; he is speaking the framework the Hebrew library already held.'),
  ('canon', 'james', 2, 23, 'apocrypha', 'ecclesiasticus', 44, 20, 'extras', E'*Who kept the law of the Most High, and was in covenant with him: he established the covenant in his flesh; and when he was proved, he was found faithful.* (Sirach 44:20). Sirach''s praise of Abraham binds together everything James binds: he *kept the law of the Most High,* he *was in covenant,* and *when he was proved, he was found faithful.* The keeping of the law, the covenant, and the proving (the Aqedah) are one righteousness — the obedient faith that James calls *made perfect* by works (James 2:22). The wisdom library''s Abraham is James'' Abraham: the believer who kept the commandments and was found faithful when tried.'),
  ('canon', 'james', 2, 21, 'canon', 'hebrews', 11, 17, 'free', E'*By faith Abraham, when he was tried, offered up Isaac: and he that had received the promises offered up his only begotten son,* (Hebrews 11:17). Hebrews names the same act James names, calling it the work OF faith: *By faith Abraham, when he was tried, offered up Isaac.* Where James says Abraham was *justified by works, when he had offered Isaac his son upon the altar* (James 2:21), Hebrews says it was *by faith* — and both are true, for the offering IS the faith in action. *Accounting that Elohim (God) was able to raise him up* (Hebrews 11:19): the trusting and the obeying are one; the faith and the work are not two things but one living thing.'),
  ('canon', 'james', 2, 25, 'canon', 'hebrews', 11, 31, 'free', E'*By faith the harlot Rahab perished not with them that believed not, when she had received the spies with peace.* (Hebrews 11:31). Hebrews lists Rahab among the faithful for the same deed James lists her among the justified: *the harlot Rahab perished not... when she had received the spies with peace.* James: she was *justified by works, when she had received the messengers* (James 2:25). One witness says *by faith,* the other *by works* — because the receiving of the spies was both, the faith of Joshua 2:11 made alive in the hiding of Joshua 6:25. Rahab proves the apostles agree: living faith and obedient works are inseparable.'),

  -- thread: james-2-shew-mercy-to-the-naked-and-destitute-compassion-1-john-3
  ('canon', 'james', 2, 16, 'canon', '1-john', 3, 17, 'free', E'*But whoso hath this world''s good, and seeth his brother have need, and shutteth up his bowels of compassion from him, how dwelleth the love of Elohim (God) in him?* (1 John 3:17). Yochanan (John) names the same hollow word James names: to see a brother in need and *shutteth up his bowels of compassion from him.* James'' picture is identical — *If a brother or sister be naked, and destitute of daily food, And one of you say unto them, Depart in peace, be ye warmed and filled; notwithstanding ye give them not those things which are needful to the body; what doth it profit?* (James 2:15-16). A faith that speaks blessing but withholds bread is the dead faith of James 2:17; the love of Elohim (God) does not dwell where compassion is shut up.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s239_j239c2_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s239_j239c2_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'james-2-respect-of-persons-no-partiality-leviticus-19-sirach-35',
       E'Have not the faith of the Lord of glory with respect of persons — the chosen poor (Leviticus 19, Sirach 35)',
       E'James opens the keystone chapter with a command rooted in the Torah''s own law: *My brethren, have not the faith of our Lord Yahusha HaMashiach (Lord Jesus Christ), Yahuah (Lord) of glory, with respect of persons* (James 2:1). The assembly that seats the man *with a gold ring, in goodly apparel* in a good place and tells the poor man *Stand thou there, or sit here under my footstool* (James 2:2-3) has *become judges of evil thoughts* (James 2:4) — and the standard that convicts them is Leviticus 19, the same chapter that gives the royal law: *thou shalt not respect the person of the poor, nor honour the person of the mighty: but in righteousness shalt thou judge thy neighbour* (Leviticus 19:15). The Torah forbids partiality at the gate — *the judgment is Elohim''s (God''s)* (Deuteronomy 1:17), *thou shalt not respect persons, neither take a gift* (Deuteronomy 16:19) — and the wisdom books say plainly *It is not good to have respect of persons in judgment* (Proverbs 24:23). James'' verdict is the Torah''s: *if ye have respect to persons, ye commit sin, and are convinced of the law as transgressors* (James 2:9). And the partiality is worse than unjust, for it despises the very ones Elohim (God) has chosen: *Hath not Elohim (God) chosen the poor of this world rich in faith, and heirs of the kingdom which he hath promised to them that love him?* (James 2:5). Channah sang it — Yahuah (LORD) *raiseth up the poor out of the dust... to make them inherit the throne of glory* (1 Samuel 2:8); Isaiah heard it — *to this man will I look, even to him that is poor and of a contrite spirit, and trembleth at my word* (Isaiah 66:2); Proverbs warned it — *whoso mocketh the poor reproacheth his Maker* (Proverbs 17:5). The Hebrew wisdom library held the framework whole: *Yahuah (God) is judge, and with him is no respect of persons* (Sirach 35:12), and *He will not accept any person against a poor man, but will hear the prayer of the oppressed* (Sirach 35:13). To hold the faith of the Lord of glory with partiality is to contradict the character of the One worshipped — the impartial Judge who lifts the poor and hears the oppressed.',
       sv.verse_id, ev.verse_id, 'extras', 8830
  FROM _s239_j239c2_lookup sv, _s239_j239c2_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='james' AND ev.chapter_number=2 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'james-2-the-royal-law-and-the-whole-law-leviticus-19-the-decalogue',
       E'The royal law and the whole law — guilty of all, judged by the law of liberty (Leviticus 19, the Decalogue)',
       E'*If ye fulfil the royal law according to the scripture, Thou shalt love thy neighbour as thyself, ye do well* (James 2:8). The *royal law according to the scripture* is not a new commandment that displaced the Torah; it is a commandment OF the Torah, quoted word for word: *thou shalt love thy neighbour as thyself: I am Yahuah (LORD)* (Leviticus 19:18) — the summary the King himself gives. Sha''ul (Paul) names the identical law and calls it the law''s fulfilling, not its abolition: *all the law is fulfilled in one word, even in this; Thou shalt love thy neighbour as thyself* (Galatians 5:14). And James presses the indivisibility of that law with all his weight: *whosoever shall keep the whole law, and yet offend in one point, he is guilty of all. For he that said, Do not commit adultery, said also, Do not kill* (James 2:10-11). The two commands he cites are the Decalogue verbatim — *Thou shalt not commit adultery* (Exodus 20:14) and *Thou shalt not kill* (Exodus 20:13), given again at Moab (Deuteronomy 5:17-18) — and his logic is the logic of Shechem, where all the people said Amen: *Cursed be he that confirmeth not all the words of this law to do them* (Deuteronomy 27:26). The Torah is one because the Lawgiver is one; to break a single word is to transgress the whole speech of Yahuah (LORD). So far from teaching that the law is abolished, James holds believers to the WHOLE of it and tells them they will be measured by it: *So speak ye, and so do, as they that shall be judged by the law of liberty* (James 2:12). The law of liberty is the Torah kept from a willing heart — the standard of the judgment, not a yoke removed. This is the opposite of antinomianism: the royal law, the whole law, guilty of all, judged by the law of liberty.',
       sv.verse_id, ev.verse_id, 'free', 8833
  FROM _s239_j239c2_lookup sv, _s239_j239c2_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='james' AND ev.chapter_number=2 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'james-2-mercy-rejoiceth-against-judgment-micah-6-sirach-28',
       E'Judgment without mercy to the merciless — mercy rejoiceth against judgment (Micah 6, Sirach 28, Matthew 5)',
       E'James closes the law section with the measure-for-measure of mercy: *For he shall have judgment without mercy, that hath shewed no mercy; and mercy rejoiceth against judgment* (James 2:13). This is what Yahuah (LORD) declared he requires through Micah — *what doth Yahuah (LORD) require of thee, but to do justly, and to love mercy, and to walk humbly with thy Elohim (God)?* (Micah 6:8) — and what the wisdom of Proverbs set as the rule of the unheard: *Whoso stoppeth his ears at the cry of the poor, he also shall cry himself, but shall not be heard* (Proverbs 21:13). The one who footstooled the poor (James 2:2-6) and shut his ears to their cry will himself find judgment without mercy. Yahusha (Jesus), James'' elder brother, blessed the opposite man in the Sermon on the Mount: *Blessed are the merciful: for they shall obtain mercy* (Matthew 5:7) — and James gives both sides of that beatitude in one verse: the merciless meet mercilessness, but over the merciful *mercy rejoiceth against judgment.* The Hebrew wisdom library taught the same reciprocity: *Forgive your neighbour the hurt that he has done to you, so shall your sins also be forgiven when you prayest* (Sirach 28:2), and it pressed the searching question — *He sheweth no mercy to a man, which is like himself: and does he ask forgiveness of his own sins?* (Sirach 28:4). The framework is one across the law, the prophets, the wisdom books, and the gospel: mercy shown is mercy obtained, and in the day of judgment mercy triumphs.',
       sv.verse_id, ev.verse_id, 'extras', 8836
  FROM _s239_j239c2_lookup sv, _s239_j239c2_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='james' AND ev.chapter_number=2 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'james-2-faith-perfected-by-works-abraham-and-rahab-genesis-15-genesis-22',
       E'Faith perfected by works — Abraham offered Yitzhaq, and Rahab (Genesis 15, Genesis 22, Genesis 26)',
       E'This is the framework keystone, and it must NOT be read in Reformation grammar as a works-versus-grace debate to be defused. James means what he says: living faith is Torah-obedient faith, and works are the COMPLETION and evidence of faith, not its rival. *What doth it profit, my brethren, though a man say he hath faith, and have not works? can faith save him?... faith, if it hath not works, is dead, being alone* (James 2:14,17). The proof is Abraham: *Was not Abraham our father justified by works, when he had offered Isaac his son upon the altar? Seest thou how faith wrought with his works, and by works was faith made perfect?* (James 2:21-22). James welds the two Abraham texts the framework holds as ONE pattern. The belief: *And he believed in Yahuah (LORD); and he counted it to him for righteousness* (Genesis 15:6) — which James says was *fulfilled,* brought to completion, in the offering decades later (James 2:23). The obedience that perfected it: *Abraham built an altar there... and bound Isaac his son, and laid him on the altar upon the wood* (Genesis 22:9), and the verdict of heaven, *now I know that thou fearest Elohim (God), seeing thou hast not withheld thy son* (Genesis 22:12); the oath sworn *because thou hast done this thing* (Genesis 22:16) and the nations blessed *because thou hast obeyed my voice* (Genesis 22:18). And the keystone that holds the whole: *Because that Abraham obeyed my voice, and kept my charge, my commandments, my statutes, and my laws* (Genesis 26:5) — the faith counted for righteousness was a voice-obeying, commandment-keeping faith. So *by works a man is justified, and not by faith only* (James 2:24). The Second-Temple library already read it this way: *Was not Abraham found faithful in temptation, and it was imputed to him for righteousness?* (1 Maccabees 2:52) — the very fusion of Genesis 15 and Genesis 22 James makes — and *Who kept the law of the Most High... and when he was proved, he was found faithful* (Sirach 44:20). Rahab is the second witness: she confessed *Yahuah Elohaychem (the LORD your God), he is Elohim (God) in heaven above, and in earth beneath* (Joshua 2:11) and then ACTED it, so she was *justified by works, when she had received the messengers* (James 2:25), saved alive and grafted into Yashar''el (Israel) *because she hid the messengers* (Joshua 6:25). Mere assent is the dead faith of the demons who *believe, and tremble* (James 2:19) at the Shema — *Yahuah Eloheinu (The LORD our God) is one Yahuah (LORD)* (Deuteronomy 6:4) — true and good, but lifeless without works. And Sha''ul (Paul) is the COMPLEMENT, not the contradiction: he quotes the same *Abraham believed Elohim (God), and it was counted unto him for righteousness* (Romans 4:3), excluding flesh-merit boasting where James excludes dead assent — the same Abraham, the same scripture. Hebrews binds the two witnesses by faith: *By faith Abraham, when he was tried, offered up Isaac* (Hebrews 11:17) and *By faith the harlot Rahab perished not... when she had received the spies with peace* (Hebrews 11:31) — for the offering and the receiving WERE the faith in action. *For as the body without the spirit is dead, so faith without works is dead also* (James 2:26): obedience-less belief is no living faith at all.',
       sv.verse_id, ev.verse_id, 'extras', 8839
  FROM _s239_j239c2_lookup sv, _s239_j239c2_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='james' AND ev.chapter_number=2 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'james-2-shew-mercy-to-the-naked-and-destitute-compassion-1-john-3',
       E'Depart in peace, be ye warmed — but ye give them not: faith that withholds bread is dead (1 John 3)',
       E'Between the call to mercy (James 2:13) and the keystone on faith and works, James gives the homeliest test of a living faith — the brother in need: *If a brother or sister be naked, and destitute of daily food, And one of you say unto them, Depart in peace, be ye warmed and filled; notwithstanding ye give them not those things which are needful to the body; what doth it profit?* (James 2:15-16). A faith that speaks the blessing but withholds the bread profits nothing; *even so faith, if it hath not works, is dead, being alone* (James 2:17). Yochanan (John) names the same hollow profession and weighs it the same way: *whoso hath this world''s good, and seeth his brother have need, and shutteth up his bowels of compassion from him, how dwelleth the love of Elohim (God) in him?* (1 John 3:17). The love of Elohim (God) does not dwell where compassion is shut up; the faith that warms with words alone is the dead faith James condemns. This is the seam that joins the chosen-poor of the chapter''s opening to the works-of-faith of its close: to honour the rich and footstool the poor, and then to dismiss the destitute with empty blessing, is the very faith-without-works that cannot save.',
       sv.verse_id, ev.verse_id, 'free', 8842
  FROM _s239_j239c2_lookup sv, _s239_j239c2_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='james' AND ev.chapter_number=2 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: james-2-respect-of-persons-no-partiality-leviticus-19-sirach-35
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 19:15 — *thou shalt not respect the person of the poor, nor honour the person of the mighty* the Torah command James enforces against the partial assembly (James 2:1,9).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c2_lookup sv, _s239_j239c2_lookup tv
 WHERE t.slug='james-2-respect-of-persons-no-partiality-leviticus-19-sirach-35'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 1:17 — *Ye shall not respect persons in judgment... for the judgment is Elohim''s (God''s)* the charge to the judges; the partial assembly usurps Elohim''s (God''s) impartial judgment (James 2:9).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c2_lookup sv, _s239_j239c2_lookup tv
 WHERE t.slug='james-2-respect-of-persons-no-partiality-leviticus-19-sirach-35'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=1 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 16:19 — *thou shalt not respect persons, neither take a gift* the gift that blinds; the assembly dazzled by the gold ring is blinded the same way (James 2:2-4).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c2_lookup sv, _s239_j239c2_lookup tv
 WHERE t.slug='james-2-respect-of-persons-no-partiality-leviticus-19-sirach-35'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=16 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 24:23 — *It is not good to have respect of persons in judgment* the wisdom books say plainly what James presses (James 2:9).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c2_lookup sv, _s239_j239c2_lookup tv
 WHERE t.slug='james-2-respect-of-persons-no-partiality-leviticus-19-sirach-35'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=24 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Samuel 2:8 — *He raiseth up the poor out of the dust... to make them inherit the throne of glory* Channah''s song; the poor Elohim (God) *chosen... rich in faith, and heirs of the kingdom* (James 2:5).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c2_lookup sv, _s239_j239c2_lookup tv
 WHERE t.slug='james-2-respect-of-persons-no-partiality-leviticus-19-sirach-35'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=2 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Isaiah 66:2 — *to this man will I look, even to him that is poor and of a contrite spirit, and trembleth at my word* the man Elohim (God) regards is the one the assembly footstools (James 2:5).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c2_lookup sv, _s239_j239c2_lookup tv
 WHERE t.slug='james-2-respect-of-persons-no-partiality-leviticus-19-sirach-35'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=66 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Proverbs 17:5 — *Whoso mocketh the poor reproacheth his Maker* the despising of the poor is an offence against the Creator (James 2:6).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c2_lookup sv, _s239_j239c2_lookup tv
 WHERE t.slug='james-2-respect-of-persons-no-partiality-leviticus-19-sirach-35'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=17 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'Sirach 35:12 — *Yahuah (God) is judge, and with him is no respect of persons* the wisdom library''s frame: partiality contradicts the character of the One worshipped (James 2:1).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c2_lookup sv, _s239_j239c2_lookup tv
 WHERE t.slug='james-2-respect-of-persons-no-partiality-leviticus-19-sirach-35'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=1
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=35 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 9, E'Sirach 35:13 — *He will not accept any person against a poor man, but will hear the prayer of the oppressed* the assembly sides with the oppressor against the oppressed Elohim (God) hears (James 2:6).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c2_lookup sv, _s239_j239c2_lookup tv
 WHERE t.slug='james-2-respect-of-persons-no-partiality-leviticus-19-sirach-35'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=6
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=35 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: james-2-the-royal-law-and-the-whole-law-leviticus-19-the-decalogue
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 19:18 — *thou shalt love thy neighbour as thyself: I am Yahuah (LORD)* the royal law *according to the scripture* (James 2:8), a commandment OF the Torah, not a replacement of it.'
  FROM cross_reference_threads t, cross_references x, _s239_j239c2_lookup sv, _s239_j239c2_lookup tv
 WHERE t.slug='james-2-the-royal-law-and-the-whole-law-leviticus-19-the-decalogue'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Galatians 5:14 — *all the law is fulfilled in one word... Thou shalt love thy neighbour as thyself* Paul names the same royal law and calls it the law''s fulfilling, not its abolition (James 2:8).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c2_lookup sv, _s239_j239c2_lookup tv
 WHERE t.slug='james-2-the-royal-law-and-the-whole-law-leviticus-19-the-decalogue'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=5 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 27:26 — *Cursed be he that confirmeth not all the words of this law to do them* the Shechem Amen; the Torah confirmed in its wholeness, *guilty of all* if one point is broken (James 2:10).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c2_lookup sv, _s239_j239c2_lookup tv
 WHERE t.slug='james-2-the-royal-law-and-the-whole-law-leviticus-19-the-decalogue'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=27 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Exodus 20:14 — *Thou shalt not commit adultery* the Decalogue verbatim; *he that said, Do not commit adultery* (James 2:11), the one voice of the one Lawgiver.'
  FROM cross_reference_threads t, cross_references x, _s239_j239c2_lookup sv, _s239_j239c2_lookup tv
 WHERE t.slug='james-2-the-royal-law-and-the-whole-law-leviticus-19-the-decalogue'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Exodus 20:13 — *Thou shalt not kill* the Decalogue verbatim; *said also, Do not kill* (James 2:11), proving the Torah is one indivisible whole.'
  FROM cross_reference_threads t, cross_references x, _s239_j239c2_lookup sv, _s239_j239c2_lookup tv
 WHERE t.slug='james-2-the-royal-law-and-the-whole-law-leviticus-19-the-decalogue'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Deuteronomy 5:18 — *Neither shalt thou commit adultery* the Decalogue re-spoken at Moab; the Torah of Sinai and Moab is one law (James 2:11).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c2_lookup sv, _s239_j239c2_lookup tv
 WHERE t.slug='james-2-the-royal-law-and-the-whole-law-leviticus-19-the-decalogue'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=5 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Deuteronomy 5:17 — *Thou shalt not kill* the Decalogue re-spoken at Moab; the indivisible standard by which believers *shall be judged* (James 2:11-12).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c2_lookup sv, _s239_j239c2_lookup tv
 WHERE t.slug='james-2-the-royal-law-and-the-whole-law-leviticus-19-the-decalogue'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=5 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: james-2-mercy-rejoiceth-against-judgment-micah-6-sirach-28
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Micah 6:8 — *to do justly, and to love mercy, and to walk humbly with thy Elohim (God)* what Yahuah (LORD) requires; the merciful find *mercy rejoiceth against judgment* (James 2:13).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c2_lookup sv, _s239_j239c2_lookup tv
 WHERE t.slug='james-2-mercy-rejoiceth-against-judgment-micah-6-sirach-28'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=6 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 21:13 — *Whoso stoppeth his ears at the cry of the poor, he also shall cry himself, but shall not be heard* the measure-for-measure James states: judgment without mercy to the merciless (James 2:13).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c2_lookup sv, _s239_j239c2_lookup tv
 WHERE t.slug='james-2-mercy-rejoiceth-against-judgment-micah-6-sirach-28'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=21 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 5:7 — *Blessed are the merciful: for they shall obtain mercy* the beatitude of James'' elder brother; James gives both sides in one verse (James 2:13).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c2_lookup sv, _s239_j239c2_lookup tv
 WHERE t.slug='james-2-mercy-rejoiceth-against-judgment-micah-6-sirach-28'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Sirach 28:2 — *Forgive your neighbour the hurt... so shall your sins also be forgiven* the wisdom library''s reciprocity of mercy; the merciless cannot claim mercy (James 2:13).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c2_lookup sv, _s239_j239c2_lookup tv
 WHERE t.slug='james-2-mercy-rejoiceth-against-judgment-micah-6-sirach-28'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=13
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=28 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: james-2-faith-perfected-by-works-abraham-and-rahab-genesis-15-genesis-22
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 15:6 — *he believed in Yahuah (LORD); and he counted it to him for righteousness* the belief, *fulfilled* — brought to completion — in the offering of Yitzhaq (James 2:22-23).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c2_lookup sv, _s239_j239c2_lookup tv
 WHERE t.slug='james-2-faith-perfected-by-works-abraham-and-rahab-genesis-15-genesis-22'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 22:9 — *Abraham built an altar there... and bound Isaac his son, and laid him on the altar* the work in which faith was made perfect; *justified by works, when he had offered Isaac* (James 2:21-22).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c2_lookup sv, _s239_j239c2_lookup tv
 WHERE t.slug='james-2-faith-perfected-by-works-abraham-and-rahab-genesis-15-genesis-22'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 22:12 — *now I know that thou fearest Elohim (God), seeing thou hast not withheld thy son* the verdict of heaven; by the not-withholding *faith was made perfect* (James 2:22).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c2_lookup sv, _s239_j239c2_lookup tv
 WHERE t.slug='james-2-faith-perfected-by-works-abraham-and-rahab-genesis-15-genesis-22'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 22:16 — *By myself have I sworn... because thou hast done this thing, and hast not withheld thy son* the oath sworn on the obedience; the doing draws forth the covenant (James 2:21).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c2_lookup sv, _s239_j239c2_lookup tv
 WHERE t.slug='james-2-faith-perfected-by-works-abraham-and-rahab-genesis-15-genesis-22'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Genesis 22:18 — *in thy seed shall all the nations of the earth be blessed; because thou hast obeyed my voice* the obedient faith Yahuah (LORD) crowns; *by works a man is justified, and not by faith only* (James 2:24).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c2_lookup sv, _s239_j239c2_lookup tv
 WHERE t.slug='james-2-faith-perfected-by-works-abraham-and-rahab-genesis-15-genesis-22'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Genesis 26:5 — *Abraham obeyed my voice, and kept my charge, my commandments, my statutes, and my laws* THE KEYSTONE: the faith counted for righteousness was a Torah-keeping faith (James 2:22).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c2_lookup sv, _s239_j239c2_lookup tv
 WHERE t.slug='james-2-faith-perfected-by-works-abraham-and-rahab-genesis-15-genesis-22'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=26 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Joshua 2:11 — *Yahuah Elohaychem (the LORD your God), he is Elohim (God) in heaven above, and in earth beneath* Rahab''s confession, made living by the hiding of the spies; *justified by works* (James 2:25).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c2_lookup sv, _s239_j239c2_lookup tv
 WHERE t.slug='james-2-faith-perfected-by-works-abraham-and-rahab-genesis-15-genesis-22'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=2 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'Joshua 6:25 — *she dwelleth in Yashar''el (Israel) even unto this day; because she hid the messengers* Rahab grafted into Yashar''el (Israel) by the work of faith; *justified by works, when she had received the messengers* (James 2:25).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c2_lookup sv, _s239_j239c2_lookup tv
 WHERE t.slug='james-2-faith-perfected-by-works-abraham-and-rahab-genesis-15-genesis-22'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=6 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 9, E'Deuteronomy 6:4 — *Yahuah Eloheinu (The LORD our God) is one Yahuah (LORD)* the Shema; *thou believest that there is one Elohim (God); thou doest well: the devils also believe, and tremble* (James 2:19) — assent without works is the faith of demons.'
  FROM cross_reference_threads t, cross_references x, _s239_j239c2_lookup sv, _s239_j239c2_lookup tv
 WHERE t.slug='james-2-faith-perfected-by-works-abraham-and-rahab-genesis-15-genesis-22'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 10, E'1 Maccabees 2:52 — *Was not Abraham found faithful in temptation, and it was imputed to him for righteousness?* the very fusion of Genesis 15 and Genesis 22 James makes; the Hebrew library already held it (James 2:22).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c2_lookup sv, _s239_j239c2_lookup tv
 WHERE t.slug='james-2-faith-perfected-by-works-abraham-and-rahab-genesis-15-genesis-22'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=21
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=2 AND tv.verse_number=52
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 11, E'Sirach 44:20 — *Who kept the law of the Most High... and when he was proved, he was found faithful* the keeping of the law, the covenant, and the proving are one righteousness; James'' obedient faith (James 2:23).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c2_lookup sv, _s239_j239c2_lookup tv
 WHERE t.slug='james-2-faith-perfected-by-works-abraham-and-rahab-genesis-15-genesis-22'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=23
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=44 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 12, E'Hebrews 11:17 — *By faith Abraham, when he was tried, offered up Isaac* the same act James calls *justified by works* — the offering IS the faith in action (James 2:21).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c2_lookup sv, _s239_j239c2_lookup tv
 WHERE t.slug='james-2-faith-perfected-by-works-abraham-and-rahab-genesis-15-genesis-22'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 13, E'Hebrews 11:31 — *By faith the harlot Rahab perished not... when she had received the spies with peace* the same deed James calls *justified by works* — receiving the spies was the faith made alive (James 2:25).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c2_lookup sv, _s239_j239c2_lookup tv
 WHERE t.slug='james-2-faith-perfected-by-works-abraham-and-rahab-genesis-15-genesis-22'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 14, E'Romans 4:3 — *Abraham believed Elohim (God), and it was counted unto him for righteousness* the COMPLEMENT, not contradiction: Paul excludes flesh-merit boasting, James excludes dead assent; same Abraham, same scripture (James 2:23).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c2_lookup sv, _s239_j239c2_lookup tv
 WHERE t.slug='james-2-faith-perfected-by-works-abraham-and-rahab-genesis-15-genesis-22'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=4 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: james-2-shew-mercy-to-the-naked-and-destitute-compassion-1-john-3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 John 3:17 — *seeth his brother have need, and shutteth up his bowels of compassion from him, how dwelleth the love of Elohim (God) in him?* the same hollow profession James names; faith that withholds bread is dead (James 2:15-17).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c2_lookup sv, _s239_j239c2_lookup tv
 WHERE t.slug='james-2-shew-mercy-to-the-naked-and-destitute-compassion-1-john-3'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=2 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
