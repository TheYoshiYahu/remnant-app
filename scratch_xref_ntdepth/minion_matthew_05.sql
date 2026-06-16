-- ----- fragment: minion_matthew_05.sql (S260 Matthew depth) -----
-- ============================================================================
-- Matthew 5 — full-library cross-reference threads (NT DEPTH pass)
-- 8 threads: Beatitudes / salt-light / ★★★ Torah-never-abolished / anger /
-- lust-divorce / swear-not / eye-for-eye / love-enemies-be-perfect
-- sort_order band: 11120, step +3
-- ============================================================================

-- 3a. Temp view ------------------------------------------------------------
CREATE TEMP VIEW _mt05_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1',
   'pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- 3b. cross_references rows -------------------------------------------------
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES

  -- (a) 5:1-12 Beatitudes -------------------------------------------------
  ('canon','matthew',5,3,'canon','isaiah',61,1, 'free', E'*The Spirit of Adonai Yahuah (the Lord GOD) is upon me; because Yahuah (LORD) hath anointed me to preach good tidings unto the meek; he hath sent me to bind up the brokenhearted, to proclaim liberty to the captives...* (Isaiah 61:1). The Beatitudes are not a new ladder of merit — they are Yahusha (JESUS) reading His own anointing-scroll over the crowd. The poor, the meek, the mourning, the brokenhearted: these are the very people Isaiah said the Anointed One was sent to comfort.'),
  ('canon','matthew',5,4,'canon','isaiah',61,2, 'free', E'*To proclaim the acceptable year of Yahuah (LORD), and the day of vengeance of our Elohim (God); to comfort all that mourn* (Isaiah 61:2). *Blessed are they that mourn: for they shall be comforted* (Matthew 5:4) — the comfort is Isaiah''s own word, the mourners of Zion answered.'),
  ('canon','matthew',5,5,'canon','psalms',37,11, 'free', E'*But the meek shall inherit the earth; and shall delight themselves in the abundance of peace* (Psalm 37:11). Yahusha (JESUS) quotes the psalm almost word for word — *Blessed are the meek: for they shall inherit the earth.* The inheritance of the land is no abolished promise; it is reaffirmed to the lowly.'),
  ('canon','matthew',5,8,'canon','psalms',24,4, 'free', E'*He that hath clean hands, and a pure heart; who hath not lifted up his soul unto vanity, nor sworn deceitfully* (Psalm 24:4) — he shall ascend the hill of Yahuah (LORD). *Blessed are the pure in heart: for they shall see Elohim (God)* (Matthew 5:8). The pure heart that climbs the holy hill is the heart that sees Him.'),
  ('canon','matthew',5,3,'canon','isaiah',66,2, 'free', E'*...but to this man will I look, even to him that is poor and of a contrite spirit, and trembleth at my word* (Isaiah 66:2). *Blessed are the poor in spirit* (Matthew 5:3) — the One who fills heaven and earth looks to the poor and trembling. The first Beatitude is Isaiah''s own measure of the man Yahuah (LORD) regards.'),
  ('canon','matthew',5,3,'canon','luke',6,20, 'free', E'*And he lifted up his eyes on his disciples, and said, Blessed be ye poor: for yours is the kingdom of Elohim (God)* (Luke 6:20). The companion proclamation on the plain — the same blessing on the poor, the hungry, the weeping, the hated.'),

  -- (b) 5:13-16 salt & light ----------------------------------------------
  ('canon','matthew',5,13,'canon','leviticus',2,13, 'free', E'*And every oblation of thy meat offering shalt thou season with salt; neither shalt thou suffer the salt of the covenant of thy Elohim (God) to be lacking from thy meat offering: with all thine offerings thou shalt offer salt* (Leviticus 2:13). *Ye are the salt of the earth* (Matthew 5:13). Salt is the covenant-seasoning of every offering — to be salt is to be the people of the unbroken covenant, preserving and seasoning the world.'),
  ('canon','matthew',5,14,'canon','isaiah',42,6, 'free', E'*I Yahuah (LORD) have called thee in righteousness... and give thee for a covenant of the people, for a light of the Gentiles* (Isaiah 42:6). *Ye are the light of the world* (Matthew 5:14). The light His servant carries is the light Isaiah foretold — set to the nations, not hidden.'),
  ('canon','matthew',5,14,'canon','isaiah',49,6, 'free', E'*It is a light thing that thou shouldest be my servant to raise up the tribes of Jacob, and to restore the preserved of Yashar''el (Israel): I will also give thee for a light to the Gentiles* (Isaiah 49:6). The light gathers the scattered tribes AND reaches the nations — two-house and stranger together, the city that cannot be hid.'),
  ('canon','matthew',5,16,'canon','isaiah',60,1, 'free', E'*Arise, shine; for thy light is come, and the glory of Yahuah (LORD) is risen upon thee* (Isaiah 60:1). *Let your light so shine before men, that they may see your good works, and glorify your Father which is in heaven* (Matthew 5:16). The shining is reflected glory — the Father glorified, never the lamp.'),

  -- (c) ★★★ 5:17-20 Torah-never-abolished — THE BANNER -------------------
  ('canon','matthew',5,17,'canon','deuteronomy',4,2, 'free', E'*Ye shall not add unto the word which I command you, neither shall ye diminish ought from it, that ye may keep the commandments of Yahuah Elohaychem (the LORD your God)* (Deuteronomy 4:2). *Think not that I am come to destroy the law, or the prophets... but to fulfil* (Matthew 5:17). To destroy the law would be to diminish from it — the very thing Moses forbade. Yahusha (JESUS) stands inside the Torah''s own guard, not against it.'),
  ('canon','matthew',5,17,'canon','deuteronomy',12,32, 'free', E'*What thing soever I command you, observe to do it: thou shalt not add thereto, nor diminish from it* (Deuteronomy 12:32). The same hedge, twice spoken. The One who fulfils the law is the One who keeps the command not to subtract from it.'),
  ('canon','matthew',5,18,'canon','psalms',119,89, 'free', E'*For ever, O Yahuah (LORD), thy word is settled in heaven* (Psalm 119:89). *Till heaven and earth pass, one jot or one tittle shall in no wise pass from the law* (Matthew 5:18). The word is fixed above the heavens — it outlasts the very sky it is settled in.'),
  ('canon','matthew',5,18,'canon','psalms',119,142, 'free', E'*Thy righteousness is an everlasting righteousness, and thy law is the truth* (Psalm 119:142). The law is not a passing arrangement but everlasting truth — which is why not one tittle can fail.'),
  ('canon','matthew',5,18,'canon','psalms',119,160, 'free', E'*Thy word is true from the beginning: and every one of thy righteous judgments endureth for ever* (Psalm 119:160). Every judgment endures *for ever* — the jot and the tittle included.'),
  ('canon','matthew',5,18,'canon','isaiah',40,8, 'free', E'*The grass withereth, the flower fadeth: but the word of our Elohim (God) shall stand for ever* (Isaiah 40:8). Heaven and earth are grass and flower; the word stands when they fade. Matthew 5:18 is Isaiah''s contrast made a promise about the Torah.'),
  ('canon','matthew',5,19,'canon','malachi',4,4, 'free', E'*Remember ye the law of Moses my servant, which I commanded unto him in Horeb for all Yashar''el (Israel), with the statutes and judgments* (Malachi 4:4). The last word of the prophets before Yahusha (JESUS) is *remember the law* — so He, breaking nothing, honours the least commandment and calls great whoever does and teaches them (Matthew 5:19).'),
  ('canon','matthew',5,18,'enoch','1-enoch',99,2, 'extras', E'*Woe to them who pervert the words of uprightness, And transgress the eternal law, And transform themselves into what they were not* (1 Enoch 99:2). The library itself pronounces the woe Matthew 5:19 implies — the one who breaks the least commandment and teaches men so is the perverter of the eternal law.'),
  ('canon','matthew',5,18,'apocrypha','baruch-with-the-letter-of-jeremiah',4,1, 'extras', E'*This is the book of the commandments of Yahuah (God), and the law that endureth for ever: all they that keep it shall come to life; but such as leave it shall die* (Baruch 4:1). *The law that endureth for ever* — Baruch says it in the very words of Matthew 5:18. To keep it is life; to leave it, death.'),
  ('canon','matthew',5,17,'apocrypha','ecclesiasticus',24,23, 'extras', E'*All these things are the book of the covenant of the most high Yahuah (God), even the law which Moses commanded for an heritage to the congregations of Jacob* (Sirach 24:23). Wisdom herself is identified with the Torah — the heritage of Jacob. Yahusha (JESUS) does not come to disinherit the congregations but to fulfil their inheritance.'),
  ('canon','matthew',5,18,'canon','luke',16,17, 'free', E'*And it is easier for heaven and earth to pass, than one tittle of the law to fail* (Luke 16:17). The same banner on Luke''s lips — sharper still: not merely *shall not* pass, but it is *easier* for the cosmos to dissolve than for a single stroke of the law to fail.'),

  -- (d) 5:21-26 anger = root of murder ------------------------------------
  ('canon','matthew',5,21,'canon','exodus',20,13, 'free', E'*Thou shalt not kill* (Exodus 20:13). *Ye have heard that it was said... Thou shalt not kill* (Matthew 5:21). Yahusha (JESUS) does not loosen the sixth word — He drives it to its root. The hand that kills began as a heart that hated.'),
  ('canon','matthew',5,22,'canon','leviticus',19,17, 'free', E'*Thou shalt not hate thy brother in thine heart: thou shalt in any wise rebuke thy neighbour, and not suffer sin upon him* (Leviticus 19:17). The Torah already forbade the inward hatred behind the deed. *Whosoever is angry with his brother... shall be in danger of the judgment* (Matthew 5:22) — this is Leviticus deepened, not displaced.'),
  ('canon','matthew',5,22,'canon','genesis',4,5, 'free', E'*But unto Cain and to his offering he had not respect. And Cain was very wroth, and his countenance fell* (Genesis 4:5). The first murder began as the first anger. Yahusha (JESUS) reaches back to Cain to show that *whosoever is angry with his brother* already stands where the killer stood.'),
  ('canon','matthew',5,24,'canon','genesis',4,7, 'free', E'*If thou doest well, shalt thou not be accepted? and if thou doest not well, sin lieth at the door. And unto thee shall be his desire, and thou shalt rule over him* (Genesis 4:7). *First be reconciled to thy brother, and then come and offer thy gift* (Matthew 5:24). Yahuah (LORD) warned Cain to master the anger before it mastered him — the gift at the altar is worthless while the brother is wronged.'),
  ('canon','matthew',5,22,'canon','leviticus',19,18, 'free', E'*Thou shalt not avenge, nor bear any grudge against the children of thy people, but thou shalt love thy neighbour as thyself: I am Yahuah (LORD)* (Leviticus 19:18). The grudge nursed in the heart is the seed of the council and the fire. The command to love the neighbour already pulled it up by the root.'),

  -- (e) 5:27-32 lust / adultery / divorce ---------------------------------
  ('canon','matthew',5,27,'canon','exodus',20,14, 'free', E'*Thou shalt not commit adultery* (Exodus 20:14). *Ye have heard that it was said... Thou shalt not commit adultery* (Matthew 5:27). Again the commandment stands; again Yahusha (JESUS) drives it inward — to the look that has already broken it in the heart.'),
  ('canon','matthew',5,28,'canon','job',31,1, 'free', E'*I made a covenant with mine eyes; why then should I think upon a maid?* (Job 31:1). Long before the Sermon, righteous Job had made the very covenant Yahusha (JESUS) commands — a guard on the eye, not merely the hand. *Whosoever looketh on a woman to lust after her hath committed adultery with her already in his heart* (Matthew 5:28).'),
  ('canon','matthew',5,28,'canon','proverbs',6,25, 'free', E'*Lust not after her beauty in thine heart; neither let her take thee with her eyelids* (Proverbs 6:25). Wisdom already forbade the inward lust — *in thine heart* — that Matthew 5:28 names. The heart-adultery is an old warning made plain.'),
  ('canon','matthew',5,31,'canon','deuteronomy',24,1, 'free', E'*When a man hath taken a wife... then let him write her a bill of divorcement, and give it in her hand, and send her out of his house* (Deuteronomy 24:1). *It hath been said, Whosoever shall put away his wife, let him give her a writing of divorcement* (Matthew 5:31). The certificate was a restraint on a hard heart, not a license; Yahusha (JESUS) restores the union to its first intent.'),
  ('canon','matthew',5,32,'canon','malachi',2,16, 'free', E'*...Therefore take heed to your spirit, and let none deal treacherously against the wife of his youth* (Malachi 2:15). Yahuah (LORD) is witness between a man and the wife of his covenant (Malachi 2:14); He hates the treacherous putting-away. Matthew 5:32 stands squarely on Malachi — divorce wielded against the covenant-wife is treachery.'),

  -- (f) 5:33-37 swear not / yea yea ---------------------------------------
  ('canon','matthew',5,33,'canon','leviticus',19,12, 'free', E'*And ye shall not swear by my name falsely, neither shalt thou profane the name of thy Elohim (God): I am Yahuah (LORD)* (Leviticus 19:12). *Thou shalt not forswear thyself, but shalt perform unto Yahuah (Lord) thine oaths* (Matthew 5:33). The Torah forbade the false oath and the profaned Name — Yahusha (JESUS) guards the Name so jealously He removes the occasion for the oath entirely.'),
  ('canon','matthew',5,33,'canon','numbers',30,2, 'free', E'*If a man vow a vow unto Yahuah (LORD), or swear an oath to bind his soul with a bond; he shall not break his word, he shall do according to all that proceedeth out of his mouth* (Numbers 30:2). The vow is binding; the mouth must be kept. *Let your yea be yea* is this command made the rule of every word.'),
  ('canon','matthew',5,33,'canon','deuteronomy',23,21, 'free', E'*When thou shalt vow a vow unto Yahuah Elohayka (the LORD thy God), thou shalt not slack to pay it... and it would be sin in thee* (Deuteronomy 23:21). Better not to vow at all than to vow and not pay (Deuteronomy 23:22-23). Yahusha (JESUS) reaches the heart of it: *Swear not at all... let your communication be, Yea, yea* (Matthew 5:34, 37).'),
  ('canon','matthew',5,34,'apocrypha','ecclesiasticus',23,9, 'extras', E'*Accustom not your mouth to swearing; neither use thyself to the naming of the Holy One* (Sirach 23:9). The library''s own wisdom anticipates the Sermon — *a man that useth much swearing shall be filled with iniquity* (23:11). *Swear not at all* (Matthew 5:34) is Sirach''s counsel brought to its full edge.'),
  ('canon','matthew',5,37,'canon','james',5,12, 'free', E'*But above all things, my brethren, swear not, neither by heaven, neither by the earth, neither by any other oath: but let your yea be yea; and your nay, nay; lest ye fall into condemnation* (James 5:12). James preserves the Master''s word almost verbatim — the plain truthful word that needs no oath behind it.'),

  -- (g) 5:38-42 eye for an eye / resist not -------------------------------
  ('canon','matthew',5,38,'canon','exodus',21,24, 'free', E'*Eye for eye, tooth for tooth, hand for hand, foot for foot* (Exodus 21:24). *Ye have heard... An eye for an eye, and a tooth for a tooth* (Matthew 5:38). The law of measured recompense was a limit on vengeance set in the court — never a charter for private revenge. Yahusha (JESUS) lifts the disciple above retaliation altogether.'),
  ('canon','matthew',5,38,'canon','leviticus',24,20, 'free', E'*Breach for breach, eye for eye, tooth for tooth: as he hath caused a blemish in a man, so shall it be done to him again* (Leviticus 24:20). The equal-measure standard of the judges — proportion, not passion. The Sermon does not abolish the court''s justice; it forbids the heart''s reprisal.'),
  ('canon','matthew',5,38,'canon','deuteronomy',19,21, 'free', E'*And thine eye shall not pity; but life shall go for life, eye for eye, tooth for tooth, hand for hand, foot for foot* (Deuteronomy 19:21). Set in the law of witnesses and judges — civic justice, not the believer''s license to strike back.'),
  ('canon','matthew',5,39,'canon','proverbs',20,22, 'free', E'*Say not thou, I will recompense evil; but wait on Yahuah (LORD), and he shall save thee* (Proverbs 20:22). *Resist not evil* (Matthew 5:39) is wisdom''s old word — leave the recompense to Yahuah (LORD), do not seize it yourself.'),
  ('canon','matthew',5,39,'canon','lamentations',3,30, 'free', E'*He giveth his cheek to him that smiteth him: he is filled full with reproach* (Lamentations 3:30). *Whosoever shall smite thee on thy right cheek, turn to him the other also* (Matthew 5:39). The offered cheek is already the posture of the righteous sufferer in the Tanakh.'),
  ('canon','matthew',5,39,'canon','isaiah',50,6, 'free', E'*I gave my back to the smiters, and my cheeks to them that plucked off the hair: I hid not my face from shame and spitting* (Isaiah 50:6). The Servant Himself first turned the cheek He commands. *Resist not evil* is the path the Master walked to the cross.'),

  -- (h) 5:43-48 love your enemies / be perfect ----------------------------
  ('canon','matthew',5,43,'canon','leviticus',19,18, 'free', E'*...but thou shalt love thy neighbour as thyself: I am Yahuah (LORD)* (Leviticus 19:18). *Thou shalt love thy neighbour* — Yahusha (JESUS) quotes the Torah; but *hate thine enemy* was never written there. He strips off the added gloss and gives the commandment back whole: love that reaches even the enemy.'),
  ('canon','matthew',5,44,'canon','exodus',23,4, 'free', E'*If thou meet thine enemy''s ox or his ass going astray, thou shalt surely bring it back to him again* (Exodus 23:4). The Torah already commanded kindness to the enemy''s very beast (Exodus 23:5). *Love your enemies* (Matthew 5:44) is the heart of a law that already bent the hand toward the foe.'),
  ('canon','matthew',5,44,'canon','proverbs',25,21, 'free', E'*If thine enemy be hungry, give him bread to eat; and if he be thirsty, give him water to drink* (Proverbs 25:21). Wisdom commanded enemy-love in deed long before the Sermon — *for thou shalt heap coals of fire upon his head, and Yahuah (LORD) shall reward thee* (25:22).'),
  ('canon','matthew',5,44,'canon','romans',12,20, 'free', E'*Therefore if thine enemy hunger, feed him; if he thirst, give him drink: for in so doing thou shalt heap coals of fire on his head* (Romans 12:20). Sha''ul carries Proverbs and the Sermon forward unchanged — the enemy fed, vengeance left to Yahuah (LORD).'),
  ('canon','matthew',5,48,'canon','leviticus',19,2, 'free', E'*Speak unto all the congregation of the children of Yashar''el (Israel)... Ye shall be holy: for I Yahuah Elohaychem (the LORD your God) am holy* (Leviticus 19:2). *Be ye therefore perfect, even as your Father which is in heaven is perfect* (Matthew 5:48). The call to mirror the Father''s holiness is the heart of the holiness code — Leviticus 19 itself, the chapter of loving the neighbour.'),
  ('canon','matthew',5,48,'canon','deuteronomy',18,13, 'free', E'*Thou shalt be perfect with Yahuah Elohayka (the LORD thy God)* (Deuteronomy 18:13). The very word *perfect* is Moses''. To *be ye therefore perfect* is to walk wholly with the Father — an old command, not a new impossibility.'),
  ('canon','matthew',5,44,'canon','luke',6,27, 'free', E'*But I say unto you which hear, Love your enemies, do good to them which hate you* (Luke 6:27). The plain''s parallel — love, bless, do good, pray — *and ye shall be the children of the Highest: for he is kind unto the unthankful and to the evil* (Luke 6:35).')

)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _mt05_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _mt05_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- 3c. Threads --------------------------------------------------------------

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-5-blessed-are-the-poor-in-spirit-the-beatitudes-isaiah-61-psalm-37',
       E'Blessed are the poor in spirit — the Beatitudes (Isaiah 61; Psalm 37; Isaiah 66)',
       E'When Yahusha (JESUS) opens His mouth on the mountain, He is not inventing a new ethic — He is reading His own anointing-scroll over the crowd. *The Spirit of Adonai Yahuah (the Lord GOD) is upon me; because Yahuah (LORD) hath anointed me to preach good tidings unto the meek; he hath sent me to bind up the brokenhearted* (Isaiah 61:1), *to comfort all that mourn* (Isaiah 61:2). The poor, the meek, the mourning — these are exactly the ones Isaiah said the Anointed One came to lift. *Blessed are they that mourn: for they shall be comforted* is Isaiah''s own promise; *Blessed are the meek: for they shall inherit the earth* is Psalm 37 almost word for word — *the meek shall inherit the earth; and shall delight themselves in the abundance of peace* (Psalm 37:11). The land-inheritance is no cancelled promise but a reaffirmed one. *Blessed are the poor in spirit* answers Isaiah 66:2 — *to this man will I look, even to him that is poor and of a contrite spirit, and trembleth at my word.* *Blessed are the pure in heart: for they shall see Elohim (God)* climbs Psalm 24''s holy hill — *He that hath clean hands, and a pure heart... shall receive the blessing from Yahuah (LORD)* (Psalm 24:4). And the companion proclamation on the plain seals it: *Blessed be ye poor: for yours is the kingdom of Elohim (God)* (Luke 6:20). Come and see — the Beatitudes are the Tanakh''s own song of the lowly, sung by the One it foretold.',
       sv.verse_id, ev.verse_id, 'free', 11120
  FROM _mt05_lookup sv, _mt05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=5 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-5-ye-are-the-salt-and-light-leviticus-2-isaiah-42-49-60',
       E'Ye are the salt of the earth and the light of the world (Leviticus 2; Isaiah 42, 49, 60)',
       E'*Ye are the salt of the earth* (Matthew 5:13). Salt is the covenant-seasoning of the altar: *every oblation of thy meat offering shalt thou season with salt; neither shalt thou suffer the salt of the covenant of thy Elohim (God) to be lacking* (Leviticus 2:13). To be salt is to be the people of the unbroken covenant — preserving, seasoning, never to lose its savour. *Ye are the light of the world* (Matthew 5:14) carries Isaiah''s servant-calling: *I Yahuah (LORD) have called thee in righteousness... and give thee for a covenant of the people, for a light of the Gentiles* (Isaiah 42:6). That light does double work — *to raise up the tribes of Jacob, and to restore the preserved of Yashar''el (Israel): I will also give thee for a light to the Gentiles* (Isaiah 49:6): scattered Israel gathered home AND the nations brought in, the city on the hill that cannot be hid. And the shining itself is reflected glory, not the lamp''s own: *Arise, shine; for thy light is come, and the glory of Yahuah (LORD) is risen upon thee* (Isaiah 60:1) — so *let your light so shine before men, that they may see your good works, and glorify your Father which is in heaven* (Matthew 5:16). The Father is glorified; the lamp only carries His light.',
       sv.verse_id, ev.verse_id, 'free', 11123
  FROM _mt05_lookup sv, _mt05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=5 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-5-think-not-that-i-am-come-to-destroy-the-law-one-jot-or-one-tittle-deuteronomy-4-psalm-119-baruch-4',
       E'Think not that I am come to destroy the law — one jot or one tittle (Deuteronomy 4; Psalm 119; Isaiah 40; Malachi 4; Baruch 4; Sirach 24; 1 Enoch 99; Luke 16)',
       E'Here is the banner over the whole Sermon — and over this entire library: *Think not that I am come to destroy the law, or the prophets: I am not come to destroy, but to fulfil* (Matthew 5:17). To destroy the law would be to *diminish* from it, the very thing Moses twice forbade: *Ye shall not add unto the word which I command you, neither shall ye diminish ought from it* (Deuteronomy 4:2); *thou shalt not add thereto, nor diminish from it* (Deuteronomy 12:32). Yahusha (JESUS) stands inside the Torah''s own guard, never against it. *Till heaven and earth pass, one jot or one tittle shall in no wise pass from the law, till all be fulfilled* (Matthew 5:18) — because *for ever, O Yahuah (LORD), thy word is settled in heaven* (Psalm 119:89); *thy righteousness is an everlasting righteousness, and thy law is the truth* (Psalm 119:142); *thy word is true from the beginning: and every one of thy righteous judgments endureth for ever* (Psalm 119:160). Heaven and earth are grass and flower — *the grass withereth, the flower fadeth: but the word of our Elohim (God) shall stand for ever* (Isaiah 40:8). The last word of the prophets before Him was *Remember ye the law of Moses my servant... with the statutes and judgments* (Malachi 4:4) — so He honours even the least commandment and calls *great* whoever does and teaches them (Matthew 5:19). The whole library testifies with one voice: *This is the book of the commandments of Yahuah (God), and the law that endureth for ever: all they that keep it shall come to life; but such as leave it shall die* (Baruch 4:1) — *the law that endureth for ever*, in the very words of verse 18. Wisdom herself is the Torah: *All these things are the book of the covenant of the most high Yahuah (God), even the law which Moses commanded for an heritage to the congregations of Jacob* (Sirach 24:23). And the woe Matthew 5:19 implies, the library pronounces aloud: *Woe to them who pervert the words of uprightness, And transgress the eternal law, And transform themselves into what they were not* (1 Enoch 99:2). Luke sharpens the banner to its finest point: *it is easier for heaven and earth to pass, than one tittle of the law to fail* (Luke 16:17). Come and see — Messiah upholds the Torah; He does not abolish it. Grace is no license. The antitheses that follow do not loosen a single command; they drive each one down to its heart, where the law was always aimed.',
       sv.verse_id, ev.verse_id, 'extras', 11126
  FROM _mt05_lookup sv, _mt05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=5 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-5-whosoever-is-angry-anger-the-root-of-murder-exodus-20-leviticus-19-genesis-4',
       E'Whosoever is angry — anger, the root of murder (Exodus 20; Leviticus 19; Genesis 4)',
       E'*Ye have heard that it was said by them of old time, Thou shalt not kill* (Matthew 5:21) — the sixth word, *Thou shalt not kill* (Exodus 20:13). Yahusha (JESUS) does not loosen it; He drives it to its root. *Whosoever is angry with his brother without a cause shall be in danger of the judgment* (Matthew 5:22). The Torah had already forbidden the inward hatred behind the deed: *Thou shalt not hate thy brother in thine heart* (Leviticus 19:17), and *Thou shalt not avenge, nor bear any grudge against the children of thy people, but thou shalt love thy neighbour as thyself: I am Yahuah (LORD)* (Leviticus 19:18). The first murder shows the chain plainly: *unto Cain and to his offering he had not respect. And Cain was very wroth, and his countenance fell* (Genesis 4:5) — and Yahuah (LORD) warned him before he ever lifted his hand: *if thou doest not well, sin lieth at the door. And unto thee shall be his desire, and thou shalt rule over him* (Genesis 4:7). The anger came first; the blood came after. So *if thou bring thy gift to the altar, and there rememberest that thy brother hath ought against thee... first be reconciled to thy brother, and then come and offer thy gift* (Matthew 5:24). Come and see — this is the sixth commandment deepened, not displaced: the hand is held by guarding the heart.',
       sv.verse_id, ev.verse_id, 'free', 11129
  FROM _mt05_lookup sv, _mt05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=5 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-5-whosoever-looketh-to-lust-adultery-and-divorce-exodus-20-job-31-deuteronomy-24-malachi-2',
       E'Whosoever looketh to lust — adultery and divorce (Exodus 20; Job 31; Proverbs 6; Deuteronomy 24; Malachi 2)',
       E'*Ye have heard that it was said by them of old time, Thou shalt not commit adultery* (Matthew 5:27) — the seventh word, *Thou shalt not commit adultery* (Exodus 20:14). Again the commandment stands whole; again Yahusha (JESUS) drives it inward: *whosoever looketh on a woman to lust after her hath committed adultery with her already in his heart* (Matthew 5:28). This is no novelty — righteous Job had made the very covenant long before: *I made a covenant with mine eyes; why then should I think upon a maid?* (Job 31:1). And Wisdom had already forbidden the inward lust by name: *Lust not after her beauty in thine heart; neither let her take thee with her eyelids* (Proverbs 6:25). On divorce, the certificate of Deuteronomy was a restraint on a hard heart, not a license — *let him write her a bill of divorcement, and give it in her hand, and send her out of his house* (Deuteronomy 24:1) — and Malachi names the abuse of it for what it is: *Yahuah (LORD) hath been witness between thee and the wife of thy youth, against whom thou hast dealt treacherously: yet is she thy companion, and the wife of thy covenant* (Malachi 2:14), so *take heed to your spirit, and let none deal treacherously against the wife of his youth* (Malachi 2:15). Come and see — Yahusha (JESUS) restores marriage to its first intent and guards it at the eye, exactly where the Tanakh already stood.',
       sv.verse_id, ev.verse_id, 'free', 11132
  FROM _mt05_lookup sv, _mt05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=27
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=5 AND ev.verse_number=32
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-5-swear-not-at-all-let-your-yea-be-yea-leviticus-19-numbers-30-deuteronomy-23-sirach-23-james-5',
       E'Swear not at all — let your yea be yea (Leviticus 19; Numbers 30; Deuteronomy 23; Sirach 23; James 5)',
       E'*Thou shalt not forswear thyself, but shalt perform unto Yahuah (Lord) thine oaths* (Matthew 5:33). The Torah forbade the false oath and the profaned Name: *ye shall not swear by my name falsely, neither shalt thou profane the name of thy Elohim (God): I am Yahuah (LORD)* (Leviticus 19:12); and it bound the vow absolutely — *if a man vow a vow unto Yahuah (LORD), or swear an oath to bind his soul with a bond; he shall not break his word, he shall do according to all that proceedeth out of his mouth* (Numbers 30:2); *when thou shalt vow a vow unto Yahuah Elohayka (the LORD thy God), thou shalt not slack to pay it... and it would be sin in thee* (Deuteronomy 23:21). Yahusha (JESUS) guards the Name so jealously that He removes the occasion for the casual oath entirely: *Swear not at all... let your communication be, Yea, yea; Nay, nay* (Matthew 5:34, 37). The library''s own wisdom said the same: *Accustom not your mouth to swearing; neither use thyself to the naming of the Holy One... a man that useth much swearing shall be filled with iniquity* (Sirach 23:9, 11). And His brother Ya''aqob (James) keeps the word almost unchanged: *swear not, neither by heaven, neither by the earth, neither by any other oath: but let your yea be yea; and your nay, nay; lest ye fall into condemnation* (James 5:12). Come and see — the plain truthful word that needs no oath behind it is the law''s own reverence for the Name, brought to its full edge.',
       sv.verse_id, ev.verse_id, 'extras', 11135
  FROM _mt05_lookup sv, _mt05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=33
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=5 AND ev.verse_number=37
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-5-an-eye-for-an-eye-resist-not-evil-exodus-21-leviticus-24-deuteronomy-19-isaiah-50',
       E'An eye for an eye — resist not evil, turn the other cheek (Exodus 21; Leviticus 24; Deuteronomy 19; Proverbs 20; Lamentations 3; Isaiah 50)',
       E'*Ye have heard that it hath been said, An eye for an eye, and a tooth for a tooth* (Matthew 5:38) — *Eye for eye, tooth for tooth, hand for hand, foot for foot* (Exodus 21:24); *as he hath caused a blemish in a man, so shall it be done to him again* (Leviticus 24:20); *life shall go for life, eye for eye, tooth for tooth* (Deuteronomy 19:21). That measured recompense was a limit on vengeance, set in the court of the judges — never a charter for private revenge. Wisdom had already drawn the line for the individual: *Say not thou, I will recompense evil; but wait on Yahuah (LORD), and he shall save thee* (Proverbs 20:22). So *resist not evil: but whosoever shall smite thee on thy right cheek, turn to him the other also* (Matthew 5:39) is no overturning of the law''s justice; it forbids the heart''s reprisal and walks the path of the righteous sufferer: *He giveth his cheek to him that smiteth him: he is filled full with reproach* (Lamentations 3:30). The Servant Himself first turned the cheek He commands: *I gave my back to the smiters, and my cheeks to them that plucked off the hair: I hid not my face from shame and spitting* (Isaiah 50:6). Come and see — the court still measures justice, but the disciple leaves the recompense to Yahuah (LORD) and follows the Master to the cross.',
       sv.verse_id, ev.verse_id, 'free', 11138
  FROM _mt05_lookup sv, _mt05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=38
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=5 AND ev.verse_number=42
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-5-love-your-enemies-be-ye-perfect-leviticus-19-exodus-23-proverbs-25-deuteronomy-18-romans-12',
       E'Love your enemies — be ye perfect as your Father (Leviticus 19; Exodus 23; Proverbs 25; Leviticus 19:2; Deuteronomy 18; Romans 12; Luke 6)',
       E'*Ye have heard that it hath been said, Thou shalt love thy neighbour, and hate thine enemy* (Matthew 5:43). But *hate thine enemy* was never written in the Torah — only *thou shalt love thy neighbour as thyself: I am Yahuah (LORD)* (Leviticus 19:18). Yahusha (JESUS) strips off the added gloss and gives the command back whole: *Love your enemies, bless them that curse you, do good to them that hate you* (Matthew 5:44). And the law had already bent the hand toward the foe — *if thou meet thine enemy''s ox or his ass going astray, thou shalt surely bring it back to him again* (Exodus 23:4); and Wisdom in deed: *if thine enemy be hungry, give him bread to eat; and if he be thirsty, give him water to drink* (Proverbs 25:21), which Sha''ul carries forward unchanged — *if thine enemy hunger, feed him; if he thirst, give him drink* (Romans 12:20). The plain''s parallel seals it: *Love your enemies, do good to them which hate you* (Luke 6:27). The whole reaches its summit in *Be ye therefore perfect, even as your Father which is in heaven is perfect* (Matthew 5:48) — the heart of the holiness code itself: *Ye shall be holy: for I Yahuah Elohaychem (the LORD your God) am holy* (Leviticus 19:2), and Moses'' own word, *Thou shalt be perfect with Yahuah Elohayka (the LORD thy God)* (Deuteronomy 18:13). Come and see — to love the enemy and walk whole with the Father is no new impossibility; it is the Torah''s deepest aim, the holiness of the One who *maketh his sun to rise on the evil and on the good.*',
       sv.verse_id, ev.verse_id, 'free', 11141
  FROM _mt05_lookup sv, _mt05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=43
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=5 AND ev.verse_number=48
ON CONFLICT (slug) DO NOTHING;

-- 3d. Thread members -------------------------------------------------------

-- (a) Beatitudes members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 61:1 — *...he hath anointed me to preach good tidings unto the meek; he hath sent me to bind up the brokenhearted...* The anointing-scroll Yahusha (JESUS) reads over the crowd.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-blessed-are-the-poor-in-spirit-the-beatitudes-isaiah-61-psalm-37'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=61 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 61:2 — *...to comfort all that mourn.* Blessed are they that mourn: for they shall be comforted.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-blessed-are-the-poor-in-spirit-the-beatitudes-isaiah-61-psalm-37'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=61 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 37:11 — *But the meek shall inherit the earth.* Quoted almost word for word in Matthew 5:5; the land-inheritance reaffirmed to the lowly.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-blessed-are-the-poor-in-spirit-the-beatitudes-isaiah-61-psalm-37'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=37 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 66:2 — *...to him that is poor and of a contrite spirit, and trembleth at my word.* The measure of the man Yahuah (LORD) regards — Blessed are the poor in spirit.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-blessed-are-the-poor-in-spirit-the-beatitudes-isaiah-61-psalm-37'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=66 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Psalm 24:4 — *He that hath clean hands, and a pure heart...* shall ascend the holy hill. Blessed are the pure in heart: for they shall see Elohim (God).'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-blessed-are-the-poor-in-spirit-the-beatitudes-isaiah-61-psalm-37'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=24 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Luke 6:20 — *Blessed be ye poor: for yours is the kingdom of Elohim (God).* The companion proclamation on the plain.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-blessed-are-the-poor-in-spirit-the-beatitudes-isaiah-61-psalm-37'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=6 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- (b) salt & light members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 2:13 — *...the salt of the covenant of thy Elohim (God)...* To be salt is to be the people of the unbroken covenant.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-ye-are-the-salt-and-light-leviticus-2-isaiah-42-49-60'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=2 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 42:6 — *...give thee for a covenant of the people, for a light of the Gentiles.* The light to the nations the servant carries.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-ye-are-the-salt-and-light-leviticus-2-isaiah-42-49-60'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=42 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 49:6 — *...to restore the preserved of Yashar''el (Israel): I will also give thee for a light to the Gentiles.* The tribes gathered AND the nations brought in.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-ye-are-the-salt-and-light-leviticus-2-isaiah-42-49-60'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=49 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 60:1 — *Arise, shine; for thy light is come, and the glory of Yahuah (LORD) is risen upon thee.* The shining is reflected glory; the Father glorified, not the lamp.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-ye-are-the-salt-and-light-leviticus-2-isaiah-42-49-60'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=60 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- (c) ★★★ Torah-banner members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 4:2 — *Ye shall not add unto the word... neither shall ye diminish ought from it...* To destroy the law would be to diminish it — the very thing Moses forbade.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-think-not-that-i-am-come-to-destroy-the-law-one-jot-or-one-tittle-deuteronomy-4-psalm-119-baruch-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 12:32 — *...thou shalt not add thereto, nor diminish from it.* The same hedge, twice spoken.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-think-not-that-i-am-come-to-destroy-the-law-one-jot-or-one-tittle-deuteronomy-4-psalm-119-baruch-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=12 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 119:89 — *For ever, O Yahuah (LORD), thy word is settled in heaven.* The word outlasts the very sky it is settled in.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-think-not-that-i-am-come-to-destroy-the-law-one-jot-or-one-tittle-deuteronomy-4-psalm-119-baruch-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=119 AND tv.verse_number=89
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 119:142 — *...thy law is the truth.* Not a passing arrangement but everlasting truth.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-think-not-that-i-am-come-to-destroy-the-law-one-jot-or-one-tittle-deuteronomy-4-psalm-119-baruch-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=119 AND tv.verse_number=142
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Psalm 119:160 — *...every one of thy righteous judgments endureth for ever.* The jot and tittle included.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-think-not-that-i-am-come-to-destroy-the-law-one-jot-or-one-tittle-deuteronomy-4-psalm-119-baruch-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=119 AND tv.verse_number=160
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Isaiah 40:8 — *...but the word of our Elohim (God) shall stand for ever.* Heaven and earth are grass and flower; the word stands when they fade.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-think-not-that-i-am-come-to-destroy-the-law-one-jot-or-one-tittle-deuteronomy-4-psalm-119-baruch-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=40 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Malachi 4:4 — *Remember ye the law of Moses my servant... with the statutes and judgments.* The last word of the prophets: remember the law.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-think-not-that-i-am-come-to-destroy-the-law-one-jot-or-one-tittle-deuteronomy-4-psalm-119-baruch-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'1 Enoch 99:2 — *Woe to them who pervert the words of uprightness, And transgress the eternal law...* The library pronounces aloud the woe Matthew 5:19 implies.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-think-not-that-i-am-come-to-destroy-the-law-one-jot-or-one-tittle-deuteronomy-4-psalm-119-baruch-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=18
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=99 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 9, E'Baruch 4:1 — *...the law that endureth for ever: all they that keep it shall come to life; but such as leave it shall die.* The law that endureth for ever — in the very words of verse 18.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-think-not-that-i-am-come-to-destroy-the-law-one-jot-or-one-tittle-deuteronomy-4-psalm-119-baruch-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=18
   AND tv.edition_slug='apocrypha' AND tv.book_slug='baruch-with-the-letter-of-jeremiah' AND tv.chapter_number=4 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 10, E'Sirach 24:23 — *...even the law which Moses commanded for an heritage to the congregations of Jacob.* Wisdom herself is the Torah, the heritage of Jacob.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-think-not-that-i-am-come-to-destroy-the-law-one-jot-or-one-tittle-deuteronomy-4-psalm-119-baruch-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=17
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=24 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 11, E'Luke 16:17 — *And it is easier for heaven and earth to pass, than one tittle of the law to fail.* The same banner, sharper still.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-think-not-that-i-am-come-to-destroy-the-law-one-jot-or-one-tittle-deuteronomy-4-psalm-119-baruch-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=16 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- (d) anger members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 20:13 — *Thou shalt not kill.* The sixth word, which Yahusha (JESUS) drives to its root, not loosens.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-whosoever-is-angry-anger-the-root-of-murder-exodus-20-leviticus-19-genesis-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 19:17 — *Thou shalt not hate thy brother in thine heart...* The Torah already forbade the inward hatred behind the deed.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-whosoever-is-angry-anger-the-root-of-murder-exodus-20-leviticus-19-genesis-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 19:18 — *Thou shalt not avenge, nor bear any grudge... but thou shalt love thy neighbour as thyself.* The grudge in the heart is the seed of the council and the fire.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-whosoever-is-angry-anger-the-root-of-murder-exodus-20-leviticus-19-genesis-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 4:5 — *...And Cain was very wroth, and his countenance fell.* The first murder began as the first anger.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-whosoever-is-angry-anger-the-root-of-murder-exodus-20-leviticus-19-genesis-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Genesis 4:7 — *...sin lieth at the door. And unto thee shall be his desire, and thou shalt rule over him.* The warning to master the anger before the gift at the altar means anything.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-whosoever-is-angry-anger-the-root-of-murder-exodus-20-leviticus-19-genesis-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- (e) lust / divorce members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 20:14 — *Thou shalt not commit adultery.* The seventh word, driven inward to the look that has already broken it.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-whosoever-looketh-to-lust-adultery-and-divorce-exodus-20-job-31-deuteronomy-24-malachi-2'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Job 31:1 — *I made a covenant with mine eyes; why then should I think upon a maid?* Righteous Job had made the very covenant Yahusha (JESUS) commands.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-whosoever-looketh-to-lust-adultery-and-divorce-exodus-20-job-31-deuteronomy-24-malachi-2'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=31 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 6:25 — *Lust not after her beauty in thine heart...* Wisdom already forbade the inward lust by name.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-whosoever-looketh-to-lust-adultery-and-divorce-exodus-20-job-31-deuteronomy-24-malachi-2'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=6 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Deuteronomy 24:1 — *...then let him write her a bill of divorcement...* The certificate was a restraint on a hard heart, not a license.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-whosoever-looketh-to-lust-adultery-and-divorce-exodus-20-job-31-deuteronomy-24-malachi-2'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=24 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Malachi 2:15 — *...let none deal treacherously against the wife of his youth.* Yahuah (LORD) hates the treacherous putting-away; Matthew 5:32 stands on Malachi.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-whosoever-looketh-to-lust-adultery-and-divorce-exodus-20-job-31-deuteronomy-24-malachi-2'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=2 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- (f) swear-not members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 19:12 — *And ye shall not swear by my name falsely, neither shalt thou profane the name of thy Elohim (God)...* The Torah forbade the false oath and the profaned Name.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-swear-not-at-all-let-your-yea-be-yea-leviticus-19-numbers-30-deuteronomy-23-sirach-23-james-5'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 30:2 — *...he shall not break his word, he shall do according to all that proceedeth out of his mouth.* The vow is binding; the mouth must be kept.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-swear-not-at-all-let-your-yea-be-yea-leviticus-19-numbers-30-deuteronomy-23-sirach-23-james-5'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=30 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 23:21 — *...thou shalt not slack to pay it... and it would be sin in thee.* Better not to vow at all than to vow and not pay.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-swear-not-at-all-let-your-yea-be-yea-leviticus-19-numbers-30-deuteronomy-23-sirach-23-james-5'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=23 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Sirach 23:9 — *Accustom not your mouth to swearing; neither use thyself to the naming of the Holy One.* The library''s own wisdom anticipates the Sermon.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-swear-not-at-all-let-your-yea-be-yea-leviticus-19-numbers-30-deuteronomy-23-sirach-23-james-5'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=34
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=23 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'James 5:12 — *...swear not... but let your yea be yea; and your nay, nay; lest ye fall into condemnation.* His brother keeps the Master''s word almost verbatim.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-swear-not-at-all-let-your-yea-be-yea-leviticus-19-numbers-30-deuteronomy-23-sirach-23-james-5'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=37
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=5 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- (g) eye-for-eye members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 21:24 — *Eye for eye, tooth for tooth, hand for hand, foot for foot.* A limit on vengeance set in the court, not a charter for private revenge.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-an-eye-for-an-eye-resist-not-evil-exodus-21-leviticus-24-deuteronomy-19-isaiah-50'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=38
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=21 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 24:20 — *Breach for breach, eye for eye, tooth for tooth...* The equal-measure standard of the judges: proportion, not passion.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-an-eye-for-an-eye-resist-not-evil-exodus-21-leviticus-24-deuteronomy-19-isaiah-50'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=38
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=24 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 19:21 — *...life shall go for life, eye for eye, tooth for tooth...* Set in the law of witnesses and judges — civic justice, not the believer''s license.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-an-eye-for-an-eye-resist-not-evil-exodus-21-leviticus-24-deuteronomy-19-isaiah-50'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=38
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=19 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 20:22 — *Say not thou, I will recompense evil; but wait on Yahuah (LORD)...* Wisdom''s old word: leave the recompense to Yahuah (LORD).'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-an-eye-for-an-eye-resist-not-evil-exodus-21-leviticus-24-deuteronomy-19-isaiah-50'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=39
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=20 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Lamentations 3:30 — *He giveth his cheek to him that smiteth him...* The offered cheek is already the posture of the righteous sufferer in the Tanakh.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-an-eye-for-an-eye-resist-not-evil-exodus-21-leviticus-24-deuteronomy-19-isaiah-50'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=39
   AND tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=3 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Isaiah 50:6 — *I gave my back to the smiters, and my cheeks to them that plucked off the hair...* The Servant first turned the cheek He commands.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-an-eye-for-an-eye-resist-not-evil-exodus-21-leviticus-24-deuteronomy-19-isaiah-50'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=39
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=50 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- (h) love-enemies members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 19:18 — *...thou shalt love thy neighbour as thyself: I am Yahuah (LORD).* Yahusha (JESUS) quotes the Torah; *hate thine enemy* was never written there.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-love-your-enemies-be-ye-perfect-leviticus-19-exodus-23-proverbs-25-deuteronomy-18-romans-12'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=43
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 23:4 — *If thou meet thine enemy''s ox or his ass going astray, thou shalt surely bring it back to him again.* The law already bent the hand toward the foe.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-love-your-enemies-be-ye-perfect-leviticus-19-exodus-23-proverbs-25-deuteronomy-18-romans-12'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=44
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=23 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 25:21 — *If thine enemy be hungry, give him bread to eat; and if he be thirsty, give him water to drink.* Wisdom commanded enemy-love in deed long before the Sermon.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-love-your-enemies-be-ye-perfect-leviticus-19-exodus-23-proverbs-25-deuteronomy-18-romans-12'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=44
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=25 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 12:20 — *Therefore if thine enemy hunger, feed him; if he thirst, give him drink...* Sha''ul carries Proverbs and the Sermon forward unchanged.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-love-your-enemies-be-ye-perfect-leviticus-19-exodus-23-proverbs-25-deuteronomy-18-romans-12'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=44
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=12 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Leviticus 19:2 — *Ye shall be holy: for I Yahuah Elohaychem (the LORD your God) am holy.* The heart of the holiness code — Be ye therefore perfect.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-love-your-enemies-be-ye-perfect-leviticus-19-exodus-23-proverbs-25-deuteronomy-18-romans-12'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=48
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Deuteronomy 18:13 — *Thou shalt be perfect with Yahuah Elohayka (the LORD thy God).* The very word *perfect* is Moses''.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-love-your-enemies-be-ye-perfect-leviticus-19-exodus-23-proverbs-25-deuteronomy-18-romans-12'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=48
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Luke 6:27 — *Love your enemies, do good to them which hate you.* The plain''s parallel, sealing the command.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-love-your-enemies-be-ye-perfect-leviticus-19-exodus-23-proverbs-25-deuteronomy-18-romans-12'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=44
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=6 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
