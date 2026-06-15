-- ----- fragment: minion_james_05.sql (S239 James 5) -----
-- =====================================================================
-- S239 minion — JAMES 5 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: JAMES 5 (20 verses). Tag: j239c5 (temp view _s239_j239c5_lookup).
-- Sort band: floor 8920, step 3 (8920, 8923, 8926, 8929, 8932, 8935, 8938 — under 8950).
-- Source is ALWAYS the canon James verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (James = the wisdom-of-the-two-house-remnant letter to the twelve tribes scattered
-- abroad; the Torah is in force and being kept). Chapter 5 closes the letter: the rich who defraud the
-- hireling are judged by the very Torah that protects the labourer's wage; the gathered are bidden to
-- patience unto the coming of Yahuah (Lord), husbandmen waiting for the early and latter rain; the
-- patience of Job and the tender mercy of Yahuah (Lord) are held up; the third word is honored — swear
-- not, let your yea be yea; the prayer of faith over the sick, the confession of faults; Elias who prayed
-- and shut and opened heaven; and the one who turns the sinner back from the error of his way. No
-- replacement theology, no law-vs-grace antithesis: ★ 5:12 swear-not guards the Name and the vow (the
-- third word kept), NOT an abolition of the lawful oath. *the coming of Yahuah (Lord)* (5:7-8) is the
-- coming of the Formed Son who bears the Father's Name and glory.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-6   ye rich men weep and howl; the hire of the labourers kept back by fraud crieth
--           Tanakh: Leviticus 19:13 (the wages of him that is hired shall not abide all night),
--                   Deuteronomy 24:14-15 (give him his hire... lest he cry against thee unto Yahuah),
--                   Malachi 3:5 (a swift witness against those that oppress the hireling), Amos 8:4
--                   (ye that swallow up the needy), Isaiah 5:8-9 (woe... join house to house), Jeremiah
--                   22:13 (woe... that useth his neighbour's service without wages)
--           Extras: Sirach 34:21-22 (the bread of the needy is their life; he that defraudeth the
--                   labourer of his hire is a bloodshedder)
--           NT: none warranted (the cry-of-the-oppressed root is the Tanakh/Sirach weave)
--   v.7-8   be patient unto the coming; the husbandman waiteth for the early and latter rain
--           Tanakh: Deuteronomy 11:14 (the first rain and the latter rain), Joel 2:23 (the former rain
--                   and the latter rain), Hosea 6:3 (he shall come unto us as the rain), Habakkuk 2:3
--                   (the vision... though it tarry, wait for it)
--           Extras: none warranted   NT: none warranted (the coming carried in prose)
--   v.9     the judge standeth before the door
--           Tanakh: none warranted (the coming/judge carried in the patience thread)
--           Extras: none warranted   NT: none warranted
--   v.10-11 the patience of Job; the end of Yahuah; very pitiful and of tender mercy
--           Tanakh: Job 42:10-12 (Yahuah turned the captivity of Job... blessed the latter end), Psalm
--                   103:8 (Yahuah is merciful and gracious, slow to anger), Exodus 34:6 (merciful and
--                   gracious, longsuffering, abundant in goodness and truth)
--           Extras: none warranted   NT: none warranted
--   v.12    swear not... but let your yea be yea; and your nay, nay
--           Tanakh: Leviticus 19:12 (ye shall not swear by my name falsely), Exodus 20:7 (take not the
--                   name in vain), Deuteronomy 23:21-23 (when thou vowest a vow... thou shalt not slack
--                   to pay it), Ecclesiastes 5:4-5 (when thou vowest... defer not to pay it)
--           Extras: Sirach 23:9-10 (accustom not thy mouth to swearing; neither use thyself to the
--                   naming of the Holy One)
--           NT: Matthew 5:34-37 (Swear not at all... let your communication be Yea, yea; Nay, nay)
--   v.13-16 is any sick... the prayer of faith shall save the sick; confess your faults
--           Tanakh: Psalm 30:2 (O Yahuah my Elohim, I cried unto thee, and thou hast healed me),
--                   Psalm 32:5 (I will confess my transgressions... and thou forgavest)
--           Extras: Sirach 38:9 (my son, in thy sickness... pray unto Yahuah, and he will make thee whole)
--           NT: Mark 6:13 (anointed with oil many that were sick, and healed them)
--   v.17-18 Elias prayed... it rained not three years; he prayed again and the heaven gave rain
--           Tanakh: 1 Kings 17:1 (there shall not be dew nor rain these years, but according to my word),
--                   1 Kings 18:1 (I will send rain upon the earth), 1 Kings 18:45 (the heaven was black
--                   with clouds... a great rain), Deuteronomy 11:17 (he shut up the heaven, that there
--                   be no rain)
--           Extras: Sirach 48:1-3 (Elias the prophet as fire... by the word of Yahuah he shut up the heaven)
--           NT: none warranted (the Elias narrative is the 1 Kings root)
--   v.19-20 he which converteth the sinner from the error of his way shall save a soul from death
--           Tanakh: Ezekiel 33:8-9 (warn the wicked... thou hast delivered thy soul), Daniel 12:3 (they
--                   that turn many to righteousness as the stars), Proverbs 10:12 (love covereth all sins)
--           Extras: Tobit 12:9 (alms doth deliver from death, and shall purge away all sin)
--           NT: 1 Peter 4:8 (charity shall cover the multitude of sins)
--
-- THREADS (slug -> target libraries):
--   8920 james-5-the-hire-kept-back-by-fraud-crieth-leviticus-19-deuteronomy-24   (Tanakh + Extras)  [BLESSING]
--   8923 james-5-patience-unto-the-coming-the-early-and-latter-rain-deuteronomy-11-joel-2   (Tanakh)
--   8926 james-5-the-patience-of-job-the-end-of-yahuah-tender-mercy-job-42-psalm-103   (Tanakh)
--   8929 james-5-swear-not-let-your-yea-be-yea-leviticus-19-exodus-20   (Tanakh + Extras + NT)
--   8932 james-5-the-prayer-of-faith-anoint-the-sick-confess-faults-psalm-30-sirach-38   (Tanakh + Extras + NT)
--   8935 james-5-elias-prayed-and-the-heaven-gave-rain-1-kings-17-18   (Tanakh + Extras)
--   8938 james-5-turn-the-sinner-and-hide-a-multitude-of-sins-ezekiel-33-proverbs-10   (Tanakh + Extras + NT)
-- =====================================================================

CREATE TEMP VIEW _s239_j239c5_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: james-5-the-hire-kept-back-by-fraud-crieth-leviticus-19-deuteronomy-24  [BLESSING]
  ('canon', 'james', 5, 4, 'canon', 'leviticus', 19, 13, 'free', E'*Thou shalt not defraud thy neighbour, neither rob him: the wages of him that is hired shall not abide with thee all night until the morning.* (Leviticus 19:13). The Torah forbids the very wrong James indicts: *the hire of the labourers who have reaped down your fields, which is of you kept back by fraud, crieth* (James 5:4). The wage that may not even *abide all night* is the wage the rich have *kept back by fraud* — James holds them to Leviticus 19, the holiness code that protects the hireling, and reads their withheld wages as theft from the neighbour.'),
  ('canon', 'james', 5, 4, 'canon', 'deuteronomy', 24, 15, 'free', E'*At his day thou shalt give him his hire, neither shall the sun go down upon it; for he is poor, and setteth his heart upon it: lest he cry against thee unto Yahuah (LORD), and it be sin unto thee.* (Deuteronomy 24:15). Here is the very cry James hears: the unpaid hireling *cry against thee unto Yahuah (LORD).* James says *the cries of them which have reaped are entered into the ears of Yahuah (Lord) of sabaoth* (James 5:4) — the Torah already warned that the withheld hire becomes a cry that reaches Yahuah (LORD) and *be sin unto thee.* The defrauded labourer''s wage is a covenant lawsuit, and Yahuah (Lord) of hosts is the one who hears it.'),
  ('canon', 'james', 5, 4, 'canon', 'malachi', 3, 5, 'free', E'*And I will come near to you to judgment; and I will be a swift witness against the sorcerers, and against the adulterers, and against false swearers, and against those that oppress the hireling in his wages, the widow, and the fatherless, and that turn aside the stranger from his right, and fear not me, saith Yahuah Tseva''ot (LORD of hosts).* (Malachi 3:5). Yahuah Tseva''ot (LORD of hosts) names himself a *swift witness against those that oppress the hireling in his wages* — and James addresses the cries of the reapers to *the ears of Yahuah (Lord) of sabaoth* (James 5:4), the same LORD of hosts. The oppressed hireling''s wage stands among the sins Yahuah comes near to judge; James pronounces that judgment already entered into his ears.'),
  ('canon', 'james', 5, 4, 'canon', 'jeremiah', 22, 13, 'free', E'*Woe unto him that buildeth his house by unrighteousness, and his chambers by wrong; that useth his neighbour''s service without wages, and giveth him not for his work;* (Jeremiah 22:13). Jeremiah''s *woe* falls on the man who *useth his neighbour''s service without wages* — the exact charge James lays on the rich whose labourers'' *hire... is of you kept back by fraud* (James 5:4). The prophet and the apostle speak one verdict: to take a man''s work and withhold his pay is *unrighteousness* and *wrong* that builds a house under a curse.'),
  ('canon', 'james', 5, 4, 'canon', 'amos', 8, 4, 'free', E'*Hear this, O ye that swallow up the needy, even to make the poor of the land to fail,* (Amos 8:4). Amos cries against those who *swallow up the needy,* the merchants who falsify the balances and trample the poor — the same oppressing rich James addresses, *ye rich men, weep and howl for your miseries that shall come upon you* (James 5:1), who have *kept back by fraud* the hire of their reapers (James 5:4). The prophetic woe on the devourers of the poor is the woe James renews on the last-days rich who have *heaped treasure together for the last days.*'),
  ('canon', 'james', 5, 1, 'canon', 'isaiah', 5, 8, 'free', E'*Woe unto them that join house to house, that lay field to field, till there be no place, that they may be placed alone in the midst of the earth!* (Isaiah 5:8). Isaiah''s *woe* on the land-grasping rich who *join house to house* and *lay field to field* is the woe James renews on the *rich men* whose *riches are corrupted* and whose *gold and silver is cankered* (James 5:1-3). Both prophets answer the hoarding of the powerful with the rust and ruin that shall *be a witness against you* — the vineyard of Yahuah Tseva''ot (LORD of hosts) looked for righteousness and found a cry.'),
  ('canon', 'james', 5, 4, 'apocrypha', 'ecclesiasticus', 34, 22, 'extras', E'*He that takes away his neighbour''s living slayeth him; and he that defraudeth the labourer of his hire is a bloodshedder.* (Sirach 34:22). The Hebrew wisdom-library says it as starkly as James: *the bread of the needy is their life: he that defraudeth him thereof is a man of blood* (Sirach 34:21), and *he that defraudeth the labourer of his hire is a bloodshedder.* This is the very deed James indicts — the hire *kept back by fraud* (James 5:4) — named bloodshed. The withheld wage is not a small thing but the taking of a man''s life-bread; Sirach and James together read the defrauded labourer''s cry as the cry of innocent blood entering the ears of Yahuah (Lord) of sabaoth.'),
  -- thread: james-5-patience-unto-the-coming-the-early-and-latter-rain-deuteronomy-11-joel-2
  ('canon', 'james', 5, 7, 'canon', 'deuteronomy', 11, 14, 'free', E'*That I will give you the rain of your land in his due season, the first rain and the latter rain, that thou mayest gather in thy corn, and thy wine, and thine oil.* (Deuteronomy 11:14). The covenant promise of *the first rain and the latter rain* is the very figure James gives the waiting saints: *the husbandman waiteth for the precious fruit of the earth, and hath long patience for it, until he receive the early and latter rain* (James 5:7). The farmer cannot hasten the harvest; he waits the two seasons of rain Yahuah (LORD) gives *in his due season* — so the gathered are to wait *unto the coming of Yahuah (Lord)* with the husbandman''s patience.'),
  ('canon', 'james', 5, 7, 'canon', 'joel', 2, 23, 'free', E'*Be glad then, ye children of Zion, and rejoice in Yahuah Elohaychem (the LORD your God): for he hath given you the former rain moderately, and he will cause to come down for you the rain, the former rain, and the latter rain in the first month.* (Joel 2:23). Joel bids the children of Zion rejoice in *the former rain, and the latter rain* — the same two rains James sets before the patient husbandman who *waiteth for the precious fruit of the earth... until he receive the early and latter rain* (James 5:7). The rain that ripens the harvest is Yahuah''s gift in his season; the waiting is not idle but glad, for *the coming of Yahuah (Lord) draweth nigh* (James 5:8) as surely as the latter rain.'),
  ('canon', 'james', 5, 8, 'canon', 'hosea', 6, 3, 'free', E'*Then shall we know, if we follow on to know Yahuah (LORD): his going forth is prepared as the morning; and he shall come unto us as the rain, as the latter and former rain unto the earth.* (Hosea 6:3). Hosea makes the coming of Yahuah (LORD) itself the rain: *he shall come unto us as the rain, as the latter and former rain unto the earth.* James joins the same two images — the husbandman who waits *the early and latter rain* and the heart established because *the coming of Yahuah (Lord) draweth nigh* (James 5:7-8). The latter rain and the coming are one expectation; he who comes as surely as the rain is the One the patient await.'),
  ('canon', 'james', 5, 7, 'canon', 'habakkuk', 2, 3, 'free', E'*For the vision is yet for an appointed time, but at the end it shall speak, and not lie: though it tarry, wait for it; because it will surely come, it will not tarry.* (Habakkuk 2:3). Habakkuk''s word to the waiting is James''s word: *though it tarry, wait for it; because it will surely come.* James bids the brethren *be patient therefore... unto the coming of Yahuah (Lord)* and *stablish your hearts* (James 5:7-8) — the vision at the appointed time that *will surely come* is the coming for which the husbandman has *long patience.* The delay is not failure but the appointed waiting; the One who comes will not tarry past his time.'),
  -- thread: james-5-the-patience-of-job-the-end-of-yahuah-tender-mercy-job-42-psalm-103
  ('canon', 'james', 5, 11, 'canon', 'job', 42, 10, 'free', E'*And Yahuah (LORD) turned the captivity of Job, when he prayed for his friends: also Yahuah (LORD) gave Job twice as much as he had before.* (Job 42:10). James points to *the patience of Job, and... the end of Yahuah (Lord)* (James 5:11) — and here is that end: *Yahuah (LORD) turned the captivity of Job... gave Job twice as much as he had before,* and *blessed the latter end of Job more than his beginning* (Job 42:10,12). The endurance James commends is vindicated in Job''s outcome; the One who let Job be tried is the One who restored him double, *very pitiful, and of tender mercy.*'),
  ('canon', 'james', 5, 11, 'canon', 'psalms', 103, 8, 'free', E'*Yahuah (LORD) is merciful and gracious, slow to anger, and plenteous in mercy.* (Psalm 103:8). James draws the lesson of Job''s end straight from the Psalter''s confession of Yahuah''s character: *that Yahuah (Lord) is very pitiful, and of tender mercy* (James 5:11). *Merciful and gracious, slow to anger, and plenteous in mercy* — the *end of Yahuah (Lord)* the patient see is no other than the LORD who is plenteous in mercy; the suffering is bounded by the tender mercy that crowns it.'),
  ('canon', 'james', 5, 11, 'canon', 'exodus', 34, 6, 'free', E'*And Yahuah (LORD) passed by before him, and proclaimed, Yahuah (LORD), Yahuah Elohim (The LORD God), merciful and gracious, longsuffering, and abundant in goodness and truth,* (Exodus 34:6). When James says *Yahuah (Lord) is very pitiful, and of tender mercy* (James 5:11) he speaks the Name Yahuah (LORD) proclaimed of himself at Sinai: *merciful and gracious, longsuffering, and abundant in goodness and truth.* The character revealed to Moses on the mountain is the *end of Yahuah (Lord)* the enduring saints behold — the same merciful and longsuffering LORD who tried and then doubled Job.'),
  -- thread: james-5-swear-not-let-your-yea-be-yea-leviticus-19-exodus-20
  ('canon', 'james', 5, 12, 'canon', 'leviticus', 19, 12, 'free', E'*And ye shall not swear by my name falsely, neither shalt thou profane the name of thy Elohim (God): I am Yahuah (LORD).* (Leviticus 19:12). James''s *swear not... but let your yea be yea; and your nay, nay* (James 5:12) guards the Torah''s own command: *ye shall not swear by my name falsely, neither shalt thou profane the name of thy Elohim (God).* The apostle is not abolishing the lawful oath but honoring the Name and the truth of speech the holiness code requires — the reverence that will not drag the Name into careless or false swearing, but lets a plain word stand as a man''s bond.'),
  ('canon', 'james', 5, 12, 'canon', 'exodus', 20, 7, 'free', E'*Thou shalt not take the name of Yahuah Elohayka (the LORD thy God) in vain; for Yahuah (LORD) will not hold him guiltless that taketh his name in vain.* (Exodus 20:7). The third word of the Decalogue stands behind James''s charge: *swear not, neither by heaven, neither by the earth, neither by any other oath* (James 5:12). To swear lightly is to take the Name *in vain* — and the oaths *by heaven... by the earth* are oaths that invoke Yahuah''s throne and footstool by proxy. James keeps the third word: let the yea be yea, that the Name be not made guiltless-breaking in vain.'),
  ('canon', 'james', 5, 12, 'canon', 'deuteronomy', 23, 21, 'free', E'*When thou shalt vow a vow unto Yahuah Elohayka (the LORD thy God), thou shalt not slack to pay it: for Yahuah Elohayka (the LORD thy God) will surely require it of thee; and it would be sin in thee.* (Deuteronomy 23:21). The Torah binds the vow: *thou shalt not slack to pay it... it would be sin in thee.* James''s remedy is to make every word a kept word — *let your yea be yea; and your nay, nay* (James 5:12) — so that a man need not bind himself with oaths he may fail to pay. The honoring of the vow and the honoring of plain speech are one reverence: speech before Yahuah (LORD) that does not trifle and does not fail.'),
  ('canon', 'james', 5, 12, 'canon', 'ecclesiastes', 5, 4, 'free', E'*When thou vowest a vow unto Elohim (God), defer not to pay it; for he hath no pleasure in fools: pay that which thou hast vowed.* (Ecclesiastes 5:4). The Preacher warns against the rash vow — *defer not to pay it... Better is it that thou shouldest not vow, than that thou shouldest vow and not pay* (Ecclesiastes 5:4-5). James''s *swear not... let your yea be yea* (James 5:12) is the same wisdom drawn to its point: guard the mouth, that no word spoken before Elohim (God) prove a fool''s broken vow. The fear of Elohim teaches few words and faithful ones.'),
  ('canon', 'james', 5, 12, 'apocrypha', 'ecclesiasticus', 23, 9, 'extras', E'*Accustom not your mouth to swearing; neither use thyself to the naming of the Holy One.* (Sirach 23:9). The Hebrew wisdom-library says it almost in James''s own words: *accustom not thy mouth to swearing; neither use thyself to the naming of the Holy One* (Sirach 23:9), for *he that sweareth and nameth Yahuah (God) continually shall not be faultless* (Sirach 23:10). This is the reverence James commands — *swear not... but let your yea be yea* (James 5:12). Not the abolition of the lawful oath, but the refusal to make the Holy Name a habit of the careless tongue.'),
  ('canon', 'james', 5, 12, 'canon', 'matthew', 5, 34, 'free', E'*But I say unto you, Swear not at all; neither by heaven; for it is Elohim''s (God''s) throne;* (Matthew 5:34). James re-speaks his brother''s word from the mount almost exactly: *swear not, neither by heaven, neither by the earth* (James 5:12) echoes *Swear not at all; neither by heaven; for it is Elohim''s (God''s) throne; Nor by the earth; for it is his footstool* (Matthew 5:34-35), and James''s *let your yea be yea; and your nay, nay* is the Master''s *let your communication be, Yea, yea; Nay, nay.* The oaths by heaven and earth invoke Yahuah by his throne and footstool; both the Master and his half-brother bid plain truthful speech that needs no oath, the Name honored and the word kept.'),
  -- thread: james-5-the-prayer-of-faith-anoint-the-sick-confess-faults-psalm-30-sirach-38
  ('canon', 'james', 5, 15, 'canon', 'psalms', 30, 2, 'free', E'*O Yahuah (LORD) my Elohim (God), I cried unto thee, and thou hast healed me.* (Psalm 30:2). David''s testimony is the ground of James''s promise: *I cried unto thee, and thou hast healed me.* James bids the sick *call for the elders... and let them pray over him,* for *the prayer of faith shall save the sick, and Yahuah (Lord) shall raise him up* (James 5:14-15). It is Yahuah (Lord) who raises and heals in answer to the cry; the prayer of faith reaches the same LORD who healed the psalmist.'),
  ('canon', 'james', 5, 16, 'canon', 'psalms', 32, 5, 'free', E'*I acknowledged my sin unto thee, and mine iniquity have I not hid. I said, I will confess my transgressions unto Yahuah (LORD); and thou forgavest the iniquity of my sin. Selah.* (Psalm 32:5). James joins healing to confession — *Confess your faults one to another, and pray one for another, that ye may be healed* (James 5:16); *if he have committed sins, they shall be forgiven him* (James 5:15). David found the same path: *I acknowledged my sin... I will confess my transgressions unto Yahuah (LORD); and thou forgavest.* The confessing mouth and the forgiving LORD are the wholeness James prays over the sick — body and soul healed together.'),
  ('canon', 'james', 5, 14, 'apocrypha', 'ecclesiasticus', 38, 9, 'extras', E'*My son, in your sickness be not negligent: but pray to Yahuah (God), and he will make you whole.* (Sirach 38:9). The Hebrew wisdom-library already directed the sick to prayer: *in thy sickness... pray unto Yahuah (God), and he will make thee whole,* and *leave off from sin, and order thy hands aright, and cleanse thy heart from all wickedness* (Sirach 38:9-10). James says the same — *Is any sick among you? let him... pray... and if he have committed sins, they shall be forgiven him* (James 5:14-15). Prayer to Yahuah and the leaving of sin are the wisdom-library''s medicine of the soul, which James lays on the assembly.'),
  ('canon', 'james', 5, 14, 'canon', 'mark', 6, 13, 'free', E'*And they cast out many devils, and anointed with oil many that were sick, and healed them.* (Mark 6:13). The twelve, sent out, *anointed with oil many that were sick, and healed them* — the very practice James commands the elders: *let them pray over him, anointing him with oil in the name of Yahuah (Lord)* (James 5:14). The apostolic anointing of the sick that began in the Master''s sending continues in the gathered assembly; the oil is the sign, but *the prayer of faith* in the Name is what saves the sick (James 5:15).'),
  -- thread: james-5-elias-prayed-and-the-heaven-gave-rain-1-kings-17-18
  ('canon', 'james', 5, 17, 'canon', '1-kings', 17, 1, 'free', E'*And Elijah the Tishbite, who was of the inhabitants of Gilead, said unto Ahab, As Yahuah Elohim (the LORD God) of Yashar''el (Israel) liveth, before whom I stand, there shall not be dew nor rain these years, but according to my word.* (1 Kings 17:1). James says *Elias... prayed earnestly that it might not rain: and it rained not on the earth by the space of three years and six months* (James 5:17) — and here is the word: *there shall not be dew nor rain these years, but according to my word.* The prophet who shut the heaven was *a man subject to like passions as we are,* yet his earnest prayer held back the rain; James offers him as proof that *the effectual fervent prayer of a righteous man availeth much* (James 5:16).'),
  ('canon', 'james', 5, 18, 'canon', '1-kings', 18, 1, 'free', E'*And it came to pass after many days, that the word of Yahuah (LORD) came to Elijah in the third year, saying, Go, shew thyself unto Ahab; and I will send rain upon the earth.* (1 Kings 18:1). After the long drought, *the word of Yahuah (LORD)* came in *the third year* — matching James''s *three years and six months* — *and I will send rain upon the earth.* James says *he prayed again, and the heaven gave rain, and the earth brought forth her fruit* (James 5:18). The shutting and the opening of heaven both answer the prophet''s prayer; the same LORD who held back the rain at his word now sends it.'),
  ('canon', 'james', 5, 18, 'canon', '1-kings', 18, 45, 'free', E'*And it came to pass in the mean while, that the heaven was black with clouds and wind, and there was a great rain. And Ahab rode, and went to Jezreel.* (1 Kings 18:45). Elijah cast himself down upon Carmel and prayed, and at the seventh look a little cloud arose, *and the heaven was black with clouds and wind, and there was a great rain.* This is James''s *he prayed again, and the heaven gave rain, and the earth brought forth her fruit* (James 5:18). The earnest prayer of the righteous man opened the heavens; the great rain is the answer that James sets before the praying assembly.'),
  ('canon', 'james', 5, 17, 'canon', 'deuteronomy', 11, 17, 'free', E'*And then the LORD''S wrath be kindled against you, and he shut up the heaven, that there be no rain, and that the land yield not her fruit; and lest ye perish quickly from off the good land which Yahuah (LORD) giveth you.* (Deuteronomy 11:17). The Torah warned that covenant unfaithfulness would make Yahuah (LORD) *shut up the heaven, that there be no rain* — and Elijah''s drought is that very judgment loosed by prayer: *he prayed earnestly that it might not rain: and it rained not* (James 5:17). The prophet''s prayer aligned with the covenant''s own sanction; the shut heaven was the LORD''s word against Ahab''s house, answered through a righteous man''s earnest plea.'),
  ('canon', 'james', 5, 17, 'apocrypha', 'ecclesiasticus', 48, 1, 'extras', E'*Then stood up Elias the prophet as fire, and his word burned like a lamp.* (Sirach 48:1). The Hebrew library remembers Elias exactly as James invokes him: *Elias the prophet as fire... by the word of Yahuah (God) he shut up the heaven, and also three times brought down fire* (Sirach 48:1,3). James names the same prophet whose prayer *shut up the heaven* — *it rained not on the earth by the space of three years and six months* (James 5:17). The wisdom-library and the apostle both hold up Elias as the man whose word, by the word of Yahuah, governed the rain and the fire of heaven.'),
  -- thread: james-5-turn-the-sinner-and-hide-a-multitude-of-sins-ezekiel-33-proverbs-10
  ('canon', 'james', 5, 20, 'canon', 'ezekiel', 33, 8, 'free', E'*When I say unto the wicked, O wicked man, thou shalt surely die; if thou dost not speak to warn the wicked from his way, that wicked man shall die in his iniquity; but his blood will I require at thine hand.* (Ezekiel 33:8). The watchman charge stands behind James''s closing word: *if thou warn the wicked of his way to turn from it... thou hast delivered thy soul* (Ezekiel 33:9). James says *he which converteth the sinner from the error of his way shall save a soul from death* (James 5:20). To turn a brother back is the watchman''s deliverance — the soul saved from death is both the sinner''s and, as Ezekiel teaches, the one who warned him.'),
  ('canon', 'james', 5, 20, 'canon', 'daniel', 12, 3, 'free', E'*And they that be wise shall shine as the brightness of the firmament; and they that turn many to righteousness as the stars for ever and ever.* (Daniel 12:3). Daniel sets the glory of the soul-winner: *they that turn many to righteousness as the stars for ever and ever.* James calls the same work blessed — *he which converteth the sinner from the error of his way shall save a soul from death* (James 5:19-20). To convert the erring is to turn one to righteousness; the apostle ends his letter with the labour Daniel crowns with everlasting light.'),
  ('canon', 'james', 5, 20, 'canon', 'proverbs', 10, 12, 'free', E'*Hatred stirreth up strifes: but love covereth all sins.* (Proverbs 10:12). James''s closing phrase is Proverbs'' word: *love covereth all sins.* He says the one who turns the sinner *shall save a soul from death, and shall hide a multitude of sins* (James 5:20). The hiding of sins is no concealment of guilt but the covering love works when it restores the erring — the same love that, drawing a brother back from the error of his way, covers the multitude of his sins before Yahuah (LORD).'),
  ('canon', 'james', 5, 20, 'canon', '1-peter', 4, 8, 'free', E'*And above all things have fervent charity among yourselves: for charity shall cover the multitude of sins.* (1 Peter 4:8). Peter speaks James''s own conclusion in the same Proverbs-rooted words: *charity shall cover the multitude of sins.* James says the one who converts the sinner *shall hide a multitude of sins* (James 5:20). Two apostles end on one note — the fervent love that turns and restores the brother covers a multitude of sins, the love that is the perfecting of the royal law James pressed throughout his letter.'),
  ('canon', 'james', 5, 20, 'apocrypha', 'tobit', 12, 9, 'extras', E'*For alms does deliver from death, and shall purge away all sin. Those that exercise alms and righteousness shall be filled with life:* (Tobit 12:9). The Hebrew library held that mercy *doth deliver from death, and shall purge away all sin* — and James says the one who turns the sinner back *shall save a soul from death, and shall hide a multitude of sins* (James 5:20). The deed of righteous love that delivers from death in Tobit is the soul-saving, sin-covering work James crowns at the close of his letter; the merciful act that purges sin is the turning of a brother from the error of his way.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s239_j239c5_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s239_j239c5_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'james-5-the-hire-kept-back-by-fraud-crieth-leviticus-19-deuteronomy-24',
       E'The hire of the labourers kept back by fraud crieth (Leviticus 19, Deuteronomy 24)',
       E'James closes his letter with a prophetic woe on the oppressing rich: *Go to now, ye rich men, weep and howl for your miseries that shall come upon you... Behold, the hire of the labourers who have reaped down your fields, which is of you kept back by fraud, crieth: and the cries of them which have reaped are entered into the ears of Yahuah (Lord) of sabaoth* (James 5:1,4). This is no new ethic but the Torah''s own protection of the hireling, pressed to judgment. The holiness code forbids the very deed: *Thou shalt not defraud thy neighbour, neither rob him: the wages of him that is hired shall not abide with thee all night until the morning* (Leviticus 19:13). Deuteronomy makes the unpaid wage a cry that reaches Yahuah himself: *At his day thou shalt give him his hire, neither shall the sun go down upon it; for he is poor, and setteth his heart upon it: lest he cry against thee unto Yahuah (LORD), and it be sin unto thee* (Deuteronomy 24:15). That is exactly the cry James hears — *entered into the ears of Yahuah (Lord) of sabaoth,* the LORD of hosts who declares himself *a swift witness... against those that oppress the hireling in his wages* (Malachi 3:5). The prophets had already cried the same woe: *Woe unto him... that useth his neighbour''s service without wages, and giveth him not for his work* (Jeremiah 22:13); *Hear this, O ye that swallow up the needy* (Amos 8:4); *Woe unto them that join house to house, that lay field to field* (Isaiah 5:8), against whom the cankered gold *shall be a witness* (James 5:3). And the Hebrew wisdom-library names the deed for what it is: *The bread of the needy is their life: he that defraudeth him thereof is a man of blood... he that defraudeth the labourer of his hire is a bloodshedder* (Sirach 34:21-22). The withheld wage is not a small injustice but the taking of a man''s life-bread — bloodshed whose cry enters the ears of Yahuah (Lord) of sabaoth. James does not abolish the Torah; he wields it, holding the last-days rich to the law that guards the poor man''s hire.',
       sv.verse_id, ev.verse_id, 'extras', 8920
  FROM _s239_j239c5_lookup sv, _s239_j239c5_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='james' AND ev.chapter_number=5 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'james-5-patience-unto-the-coming-the-early-and-latter-rain-deuteronomy-11-joel-2',
       E'Patience unto the coming: the husbandman and the early and latter rain (Deuteronomy 11, Joel 2)',
       E'*Be patient therefore, brethren, unto the coming of Yahuah (Lord). Behold, the husbandman waiteth for the precious fruit of the earth, and hath long patience for it, until he receive the early and latter rain. Be ye also patient; stablish your hearts: for the coming of Yahuah (Lord) draweth nigh* (James 5:7-8). James draws his figure of patience from the covenant rhythm of the land. The two rains are Yahuah''s gift in their seasons: *I will give you the rain of your land in his due season, the first rain and the latter rain, that thou mayest gather in thy corn, and thy wine, and thine oil* (Deuteronomy 11:14); *he will cause to come down for you the rain, the former rain, and the latter rain in the first month* (Joel 2:23). The farmer cannot hasten the harvest — he waits the early rain that sprouts and the latter rain that fills, with long patience. So the gathered wait the coming, for Hosea makes the coming itself the rain: *he shall come unto us as the rain, as the latter and former rain unto the earth* (Hosea 6:3). And the waiting is not doubt but appointed expectation, as Habakkuk taught: *the vision is yet for an appointed time... though it tarry, wait for it; because it will surely come, it will not tarry* (Habakkuk 2:3). The coming of Yahuah (Lord) — the coming of the Formed Son who bears the Father''s Name and glory — is as certain as the latter rain that ripens the field; the husbandman''s patience is the saint''s, the heart established because the harvest is sure.',
       sv.verse_id, ev.verse_id, 'free', 8923
  FROM _s239_j239c5_lookup sv, _s239_j239c5_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='james' AND ev.chapter_number=5 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'james-5-the-patience-of-job-the-end-of-yahuah-tender-mercy-job-42-psalm-103',
       E'The patience of Job and the end of Yahuah: very pitiful, and of tender mercy (Job 42, Psalm 103, Exodus 34)',
       E'*Behold, we count them happy which endure. Ye have heard of the patience of Job, and have seen the end of Yahuah (Lord); that Yahuah (Lord) is very pitiful, and of tender mercy* (James 5:11). James points the suffering saints to Job, not for the trial only but for its outcome — *the end of Yahuah (Lord),* the conclusion the LORD wrote on Job''s endurance: *Yahuah (LORD) turned the captivity of Job, when he prayed for his friends: also Yahuah (LORD) gave Job twice as much as he had before* (Job 42:10), and *blessed the latter end of Job more than his beginning.* The trial was real and the restoration double; the One who let Job be proved is the One who crowned his patience. And James reads that *end* as a revelation of Yahuah''s very character — *very pitiful, and of tender mercy* — which is the Name Yahuah proclaimed of himself: *Yahuah (LORD) is merciful and gracious, slow to anger, and plenteous in mercy* (Psalm 103:8), the Name spoken at Sinai, *merciful and gracious, longsuffering, and abundant in goodness and truth* (Exodus 34:6). The patience of the saints rests on the known character of the LORD: the same merciful, longsuffering Yahuah who tried Job and then restored him double is the One whose tender mercy bounds every affliction the enduring bear.',
       sv.verse_id, ev.verse_id, 'free', 8926
  FROM _s239_j239c5_lookup sv, _s239_j239c5_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='james' AND ev.chapter_number=5 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'james-5-swear-not-let-your-yea-be-yea-leviticus-19-exodus-20',
       E'Swear not, but let your yea be yea: the Name and the vow honored (Leviticus 19, Exodus 20, Matthew 5)',
       E'*But above all things, my brethren, swear not, neither by heaven, neither by the earth, neither by any other oath: but let your yea be yea; and your nay, nay; lest ye fall into condemnation* (James 5:12). Read through the framework, this is the third word kept, not the lawful oath abolished. The Torah forbids the false and profane oath: *ye shall not swear by my name falsely, neither shalt thou profane the name of thy Elohim (God): I am Yahuah (LORD)* (Leviticus 19:12); and the Decalogue itself, *Thou shalt not take the name of Yahuah Elohayka (the LORD thy God) in vain; for Yahuah (LORD) will not hold him guiltless that taketh his name in vain* (Exodus 20:7). The oaths *by heaven... by the earth* invoke Yahuah''s throne and footstool by proxy; to swear them lightly is to drag the Name into careless speech. The Torah also binds the vow once made — *thou shalt not slack to pay it... it would be sin in thee* (Deuteronomy 23:21) — and the Preacher warns, *When thou vowest a vow unto Elohim (God), defer not to pay it; for he hath no pleasure in fools* (Ecclesiastes 5:4). The Hebrew wisdom-library says it almost as James does: *Accustom not thy mouth to swearing; neither use thyself to the naming of the Holy One* (Sirach 23:9). And James simply re-speaks his half-brother''s word from the mount: *Swear not at all; neither by heaven; for it is Elohim''s (God''s) throne* (Matthew 5:34), *let your communication be, Yea, yea; Nay, nay.* The remedy is not lawlessness but truthfulness — a plain word that stands as a man''s bond, so the Name need never be invoked to prop up speech that should have been honest all along. The Name and the vow are honored, not the lawful oath cast off.',
       sv.verse_id, ev.verse_id, 'extras', 8929
  FROM _s239_j239c5_lookup sv, _s239_j239c5_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='james' AND ev.chapter_number=5 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'james-5-the-prayer-of-faith-anoint-the-sick-confess-faults-psalm-30-sirach-38',
       E'The prayer of faith over the sick, the oil, and the confession of faults (Psalm 30, Sirach 38, Mark 6)',
       E'*Is any sick among you? let him call for the elders of the church; and let them pray over him, anointing him with oil in the name of Yahuah (Lord): And the prayer of faith shall save the sick, and Yahuah (Lord) shall raise him up; and if he have committed sins, they shall be forgiven him. Confess your faults one to another, and pray one for another, that ye may be healed. The effectual fervent prayer of a righteous man availeth much* (James 5:14-16). The healing is Yahuah''s, sought as David sought it: *O Yahuah (LORD) my Elohim (God), I cried unto thee, and thou hast healed me* (Psalm 30:2). The Hebrew wisdom-library directed the sick to the same prayer: *My son, in thy sickness... pray unto Yahuah (God), and he will make thee whole; leave off from sin, and order thy hands aright* (Sirach 38:9-10) — prayer and the leaving of sin together, as James joins healing to forgiveness. The anointing with oil is the apostolic sign that began in the Master''s sending: the twelve *anointed with oil many that were sick, and healed them* (Mark 6:13). And James weds the body''s healing to the soul''s — *Confess your faults one to another... that ye may be healed* — as David found: *I will confess my transgressions unto Yahuah (LORD); and thou forgavest the iniquity of my sin* (Psalm 32:5). The oil is the token, but the prayer of faith in the Name of Yahuah (Lord) is what saves and raises; the confessing mouth and the forgiving LORD make the whole man whole.',
       sv.verse_id, ev.verse_id, 'extras', 8932
  FROM _s239_j239c5_lookup sv, _s239_j239c5_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='james' AND ev.chapter_number=5 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'james-5-elias-prayed-and-the-heaven-gave-rain-1-kings-17-18',
       E'Elias prayed, and the heaven was shut and opened (1 Kings 17-18, Sirach 48)',
       E'*Elias was a man subject to like passions as we are, and he prayed earnestly that it might not rain: and it rained not on the earth by the space of three years and six months. And he prayed again, and the heaven gave rain, and the earth brought forth her fruit* (James 5:17-18). James offers Elias as the living proof of his maxim, *the effectual fervent prayer of a righteous man availeth much* (James 5:16) — not a superhuman but *a man subject to like passions as we are.* The shutting of heaven was his word: *As Yahuah Elohim (the LORD God) of Yashar''el (Israel) liveth, before whom I stand, there shall not be dew nor rain these years, but according to my word* (1 Kings 17:1) — the very covenant sanction the Torah named, *he shut up the heaven, that there be no rain* (Deuteronomy 11:17). And the opening was the answer to prayer: *the word of Yahuah (LORD) came to Elijah in the third year... I will send rain upon the earth* (1 Kings 18:1); the prophet cast himself down upon Carmel, and *the heaven was black with clouds and wind, and there was a great rain* (1 Kings 18:45). The Hebrew library remembers him just as James does: *Elias the prophet as fire... by the word of Yahuah (God) he shut up the heaven, and also three times brought down fire* (Sirach 48:1,3). The same righteous man''s earnest prayer that bound the rain loosed it again — proof that the prayer of the gathered, men of like passions, avails much with Yahuah (LORD).',
       sv.verse_id, ev.verse_id, 'extras', 8935
  FROM _s239_j239c5_lookup sv, _s239_j239c5_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='james' AND ev.chapter_number=5 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'james-5-turn-the-sinner-and-hide-a-multitude-of-sins-ezekiel-33-proverbs-10',
       E'He which converteth the sinner shall save a soul and hide a multitude of sins (Ezekiel 33, Daniel 12, Proverbs 10)',
       E'James ends his letter on the turning of the erring brother: *Brethren, if any of you do err from the truth, and one convert him; Let him know, that he which converteth the sinner from the error of his way shall save a soul from death, and shall hide a multitude of sins* (James 5:19-20). This is the watchman''s charge of Ezekiel: *if thou dost not speak to warn the wicked from his way, that wicked man shall die in his iniquity; but his blood will I require at thine hand* — yet *if thou warn the wicked... thou hast delivered thy soul* (Ezekiel 33:8-9). To turn a brother back is to save a soul from death, the watchman''s own deliverance. Daniel crowns the work with everlasting light: *they that turn many to righteousness as the stars for ever and ever* (Daniel 12:3). And the closing phrase is the wisdom of Proverbs — *Hatred stirreth up strifes: but love covereth all sins* (Proverbs 10:12) — the covering not of concealment but of restoring love, which Peter speaks in the same words: *charity shall cover the multitude of sins* (1 Peter 4:8). The Hebrew library held the same of righteous mercy: *alms doth deliver from death, and shall purge away all sin* (Tobit 12:9). So James closes as he began, with the royal law made perfect in deed: the love that turns the wanderer home delivers a soul from death and covers a multitude of sins before Yahuah (LORD).',
       sv.verse_id, ev.verse_id, 'extras', 8938
  FROM _s239_j239c5_lookup sv, _s239_j239c5_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=19
   AND ev.edition_slug='canon' AND ev.book_slug='james' AND ev.chapter_number=5 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: james-5-the-hire-kept-back-by-fraud-crieth-leviticus-19-deuteronomy-24
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 19:13 — *the wages of him that is hired shall not abide with thee all night until the morning* the Torah forbids the very deed; *the hire of the labourers... kept back by fraud, crieth* (James 5:4).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c5_lookup sv, _s239_j239c5_lookup tv
 WHERE t.slug='james-5-the-hire-kept-back-by-fraud-crieth-leviticus-19-deuteronomy-24'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 24:15 — *give him his hire... lest he cry against thee unto Yahuah (LORD), and it be sin unto thee* the unpaid wage becomes a cry; *the cries of them which have reaped are entered into the ears of Yahuah (Lord) of sabaoth* (James 5:4).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c5_lookup sv, _s239_j239c5_lookup tv
 WHERE t.slug='james-5-the-hire-kept-back-by-fraud-crieth-leviticus-19-deuteronomy-24'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=24 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Malachi 3:5 — *a swift witness... against those that oppress the hireling in his wages* Yahuah Tseva''ot (LORD of hosts) the witness; the cry entered into the ears of Yahuah (Lord) of sabaoth (James 5:4).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c5_lookup sv, _s239_j239c5_lookup tv
 WHERE t.slug='james-5-the-hire-kept-back-by-fraud-crieth-leviticus-19-deuteronomy-24'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jeremiah 22:13 — *woe unto him... that useth his neighbour''s service without wages, and giveth him not for his work* the prophet''s woe on the wage-withholder; the hire kept back by fraud (James 5:4).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c5_lookup sv, _s239_j239c5_lookup tv
 WHERE t.slug='james-5-the-hire-kept-back-by-fraud-crieth-leviticus-19-deuteronomy-24'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=22 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Amos 8:4 — *ye that swallow up the needy, even to make the poor of the land to fail* the prophetic woe on the devourers of the poor; the rich men who weep and howl (James 5:1).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c5_lookup sv, _s239_j239c5_lookup tv
 WHERE t.slug='james-5-the-hire-kept-back-by-fraud-crieth-leviticus-19-deuteronomy-24'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=8 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Isaiah 5:8 — *woe unto them that join house to house, that lay field to field* the woe on the land-grasping rich; the cankered gold a witness against them (James 5:1-3).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c5_lookup sv, _s239_j239c5_lookup tv
 WHERE t.slug='james-5-the-hire-kept-back-by-fraud-crieth-leviticus-19-deuteronomy-24'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Sirach 34:22 — *he that defraudeth the labourer of his hire is a bloodshedder* the Hebrew library names the deed bloodshed; the bread of the needy is their life (Sirach 34:21), the hire kept back by fraud (James 5:4).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c5_lookup sv, _s239_j239c5_lookup tv
 WHERE t.slug='james-5-the-hire-kept-back-by-fraud-crieth-leviticus-19-deuteronomy-24'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=4
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=34 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: james-5-patience-unto-the-coming-the-early-and-latter-rain-deuteronomy-11-joel-2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 11:14 — *the first rain and the latter rain* the covenant gift of the two rains; the husbandman waits *until he receive the early and latter rain* (James 5:7).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c5_lookup sv, _s239_j239c5_lookup tv
 WHERE t.slug='james-5-patience-unto-the-coming-the-early-and-latter-rain-deuteronomy-11-joel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=11 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joel 2:23 — *the former rain, and the latter rain* the children of Zion bidden rejoice in the two rains; the patient husbandman of James 5:7.'
  FROM cross_reference_threads t, cross_references x, _s239_j239c5_lookup sv, _s239_j239c5_lookup tv
 WHERE t.slug='james-5-patience-unto-the-coming-the-early-and-latter-rain-deuteronomy-11-joel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hosea 6:3 — *he shall come unto us as the rain, as the latter and former rain unto the earth* the coming itself made the rain; *the coming of Yahuah (Lord) draweth nigh* (James 5:8).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c5_lookup sv, _s239_j239c5_lookup tv
 WHERE t.slug='james-5-patience-unto-the-coming-the-early-and-latter-rain-deuteronomy-11-joel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=6 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Habakkuk 2:3 — *though it tarry, wait for it; because it will surely come, it will not tarry* the appointed waiting; *be patient... unto the coming of Yahuah (Lord)* (James 5:7).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c5_lookup sv, _s239_j239c5_lookup tv
 WHERE t.slug='james-5-patience-unto-the-coming-the-early-and-latter-rain-deuteronomy-11-joel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='habakkuk' AND tv.chapter_number=2 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: james-5-the-patience-of-job-the-end-of-yahuah-tender-mercy-job-42-psalm-103
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Job 42:10 — *Yahuah (LORD) turned the captivity of Job... gave Job twice as much as he had before* the end of Yahuah on Job''s endurance; *ye have heard of the patience of Job, and have seen the end of Yahuah (Lord)* (James 5:11).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c5_lookup sv, _s239_j239c5_lookup tv
 WHERE t.slug='james-5-the-patience-of-job-the-end-of-yahuah-tender-mercy-job-42-psalm-103'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=42 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 103:8 — *Yahuah (LORD) is merciful and gracious, slow to anger, and plenteous in mercy* the Psalter''s confession; *Yahuah (Lord) is very pitiful, and of tender mercy* (James 5:11).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c5_lookup sv, _s239_j239c5_lookup tv
 WHERE t.slug='james-5-the-patience-of-job-the-end-of-yahuah-tender-mercy-job-42-psalm-103'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=103 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 34:6 — *merciful and gracious, longsuffering, and abundant in goodness and truth* the Name Yahuah proclaimed at Sinai; the *end of Yahuah (Lord)* the enduring behold (James 5:11).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c5_lookup sv, _s239_j239c5_lookup tv
 WHERE t.slug='james-5-the-patience-of-job-the-end-of-yahuah-tender-mercy-job-42-psalm-103'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=34 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: james-5-swear-not-let-your-yea-be-yea-leviticus-19-exodus-20
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 19:12 — *ye shall not swear by my name falsely, neither shalt thou profane the name of thy Elohim (God)* the holiness code guards the Name; *swear not... let your yea be yea* (James 5:12).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c5_lookup sv, _s239_j239c5_lookup tv
 WHERE t.slug='james-5-swear-not-let-your-yea-be-yea-leviticus-19-exodus-20'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 20:7 — *Thou shalt not take the name of Yahuah Elohayka (the LORD thy God) in vain* the third word of the Decalogue; the oaths by heaven and earth invoke the Name by proxy (James 5:12).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c5_lookup sv, _s239_j239c5_lookup tv
 WHERE t.slug='james-5-swear-not-let-your-yea-be-yea-leviticus-19-exodus-20'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 23:21 — *when thou vowest a vow unto Yahuah... thou shalt not slack to pay it* the Torah binds the vow; let the plain word stand so no oath fails (James 5:12).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c5_lookup sv, _s239_j239c5_lookup tv
 WHERE t.slug='james-5-swear-not-let-your-yea-be-yea-leviticus-19-exodus-20'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=23 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ecclesiastes 5:4 — *when thou vowest a vow unto Elohim (God), defer not to pay it; for he hath no pleasure in fools* the Preacher''s warning against the rash vow; guard the mouth (James 5:12).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c5_lookup sv, _s239_j239c5_lookup tv
 WHERE t.slug='james-5-swear-not-let-your-yea-be-yea-leviticus-19-exodus-20'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=5 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Sirach 23:9 — *accustom not thy mouth to swearing; neither use thyself to the naming of the Holy One* the wisdom-library almost in James''s words; not the oath abolished but the Name honored (James 5:12).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c5_lookup sv, _s239_j239c5_lookup tv
 WHERE t.slug='james-5-swear-not-let-your-yea-be-yea-leviticus-19-exodus-20'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=12
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=23 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Matthew 5:34 — *Swear not at all; neither by heaven; for it is Elohim''s (God''s) throne* the Master''s word from the mount; James re-speaks his half-brother: *let your yea be yea; and your nay, nay* (James 5:12).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c5_lookup sv, _s239_j239c5_lookup tv
 WHERE t.slug='james-5-swear-not-let-your-yea-be-yea-leviticus-19-exodus-20'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: james-5-the-prayer-of-faith-anoint-the-sick-confess-faults-psalm-30-sirach-38
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 30:2 — *O Yahuah (LORD) my Elohim (God), I cried unto thee, and thou hast healed me* David''s testimony; *the prayer of faith shall save the sick, and Yahuah (Lord) shall raise him up* (James 5:15).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c5_lookup sv, _s239_j239c5_lookup tv
 WHERE t.slug='james-5-the-prayer-of-faith-anoint-the-sick-confess-faults-psalm-30-sirach-38'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=30 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Sirach 38:9 — *in thy sickness... pray unto Yahuah (God), and he will make thee whole* the wisdom-library''s medicine of the soul; *Is any sick among you? let him... pray* (James 5:14).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c5_lookup sv, _s239_j239c5_lookup tv
 WHERE t.slug='james-5-the-prayer-of-faith-anoint-the-sick-confess-faults-psalm-30-sirach-38'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=14
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=38 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Mark 6:13 — *anointed with oil many that were sick, and healed them* the apostolic anointing from the Master''s sending; *anointing him with oil in the name of Yahuah (Lord)* (James 5:14).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c5_lookup sv, _s239_j239c5_lookup tv
 WHERE t.slug='james-5-the-prayer-of-faith-anoint-the-sick-confess-faults-psalm-30-sirach-38'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=6 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 32:5 — *I will confess my transgressions unto Yahuah (LORD); and thou forgavest the iniquity of my sin* David''s confession and forgiveness; *Confess your faults one to another... that ye may be healed* (James 5:16).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c5_lookup sv, _s239_j239c5_lookup tv
 WHERE t.slug='james-5-the-prayer-of-faith-anoint-the-sick-confess-faults-psalm-30-sirach-38'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=32 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: james-5-elias-prayed-and-the-heaven-gave-rain-1-kings-17-18
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Kings 17:1 — *there shall not be dew nor rain these years, but according to my word* the prophet''s word shutting heaven; *he prayed earnestly that it might not rain: and it rained not* (James 5:17).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c5_lookup sv, _s239_j239c5_lookup tv
 WHERE t.slug='james-5-elias-prayed-and-the-heaven-gave-rain-1-kings-17-18'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=17 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Kings 18:1 — *the word of Yahuah (LORD) came to Elijah in the third year... I will send rain upon the earth* the opening after the drought; *he prayed again, and the heaven gave rain* (James 5:18).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c5_lookup sv, _s239_j239c5_lookup tv
 WHERE t.slug='james-5-elias-prayed-and-the-heaven-gave-rain-1-kings-17-18'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=18 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Kings 18:45 — *the heaven was black with clouds and wind, and there was a great rain* the answer to Elijah''s prayer on Carmel; *the earth brought forth her fruit* (James 5:18).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c5_lookup sv, _s239_j239c5_lookup tv
 WHERE t.slug='james-5-elias-prayed-and-the-heaven-gave-rain-1-kings-17-18'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=18 AND tv.verse_number=45
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Deuteronomy 11:17 — *he shut up the heaven, that there be no rain* the covenant sanction loosed by Elijah''s prayer; *it rained not on the earth by the space of three years and six months* (James 5:17).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c5_lookup sv, _s239_j239c5_lookup tv
 WHERE t.slug='james-5-elias-prayed-and-the-heaven-gave-rain-1-kings-17-18'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=11 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Sirach 48:1 — *Elias the prophet as fire... he shut up the heaven* (48:1,3) the Hebrew library''s memory of Elias; the prophet whose earnest prayer governed the rain (James 5:17).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c5_lookup sv, _s239_j239c5_lookup tv
 WHERE t.slug='james-5-elias-prayed-and-the-heaven-gave-rain-1-kings-17-18'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=17
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=48 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: james-5-turn-the-sinner-and-hide-a-multitude-of-sins-ezekiel-33-proverbs-10
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 33:8 — *warn the wicked from his way... thou hast delivered thy soul* (33:8-9) the watchman''s charge; *he which converteth the sinner from the error of his way shall save a soul from death* (James 5:20).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c5_lookup sv, _s239_j239c5_lookup tv
 WHERE t.slug='james-5-turn-the-sinner-and-hide-a-multitude-of-sins-ezekiel-33-proverbs-10'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=33 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 12:3 — *they that turn many to righteousness as the stars for ever and ever* the soul-winner crowned with light; *converteth the sinner from the error of his way* (James 5:20).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c5_lookup sv, _s239_j239c5_lookup tv
 WHERE t.slug='james-5-turn-the-sinner-and-hide-a-multitude-of-sins-ezekiel-33-proverbs-10'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 10:12 — *love covereth all sins* the restoring love; *shall hide a multitude of sins* (James 5:20).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c5_lookup sv, _s239_j239c5_lookup tv
 WHERE t.slug='james-5-turn-the-sinner-and-hide-a-multitude-of-sins-ezekiel-33-proverbs-10'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=10 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Peter 4:8 — *charity shall cover the multitude of sins* Peter''s Proverbs-rooted word; two apostles on one note, *shall hide a multitude of sins* (James 5:20).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c5_lookup sv, _s239_j239c5_lookup tv
 WHERE t.slug='james-5-turn-the-sinner-and-hide-a-multitude-of-sins-ezekiel-33-proverbs-10'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=4 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Tobit 12:9 — *alms doth deliver from death, and shall purge away all sin* righteous love that delivers from death; *shall save a soul from death* (James 5:20).'
  FROM cross_reference_threads t, cross_references x, _s239_j239c5_lookup sv, _s239_j239c5_lookup tv
 WHERE t.slug='james-5-turn-the-sinner-and-hide-a-multitude-of-sins-ezekiel-33-proverbs-10'
   AND sv.edition_slug='canon' AND sv.book_slug='james' AND sv.chapter_number=5 AND sv.verse_number=20
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=12 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
