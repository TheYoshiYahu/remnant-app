-- ----- fragment: minion_1corinthians_05.sql (S228 1 Corinthians 5) -----
-- =====================================================================
-- S228 minion — 1 CORINTHIANS 5 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 1 CORINTHIANS 5 (13 verses) — THE KEEP-THE-FEAST / PASSOVER BLESSING WATCHPOINT.
-- Tag: co05 (temp view _s228_co05_lookup).
-- Sort band: floor 6700, step 3 (6700, 6703, 6706, 6709 used; under 6725).
-- Source is ALWAYS the canon 1 Corinthians verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME. Paul disciplines a fleshly assembly of called-out ones — Israel and the grafted-in
-- seed gathered at Corinth — and he does it ON TORAH GROUND, not against Torah. (1) The sin he names
-- is the one Torah curses by name: *one should have his father''s wife* (5:1) is *the nakedness of thy
-- father''s wife* Torah forbids (Leviticus 18:8) and *Cursed be he that lieth with his father''s wife*
-- (Deuteronomy 27:20). (2) The CENTERPIECE: *Purge out therefore the old leaven... For even Messiah
-- (Christ) our passover is sacrificed for us: Therefore let us keep the feast* (5:7-8). Paul does NOT
-- abolish the feast — he commands the assembly to KEEP it. Messiah is the Passover LAMB (Exodus 12 —
-- the lamb without blemish, the blood that turns the destroyer aside), the putting-away of leaven is
-- the Feast of Unleavened Bread (Exodus 12:15-20, Leviticus 23:5-8, Deuteronomy 16:3-4, Exodus 13:7),
-- and the unleavened bread is now read as *sincerity and truth.* The feast is affirmed and fulfilled,
-- never repealed. (3) The DISCIPLINE: *put away from among yourselves that wicked person* (5:13) is the
-- recurring Torah judgment formula *so shalt thou put the evil away from among you* (Deuteronomy 13:5,
-- 17:7, 19:19, 21:21, 22:21, 24:7) — Paul settles the case BY the law. No law-vs-grace antithesis, no
-- church-replacing-Israel; the discipline of the gathered seed is the discipline of the congregation
-- of Yashar''el (Israel) carried forward. Lord-rule: where *Lord* is Yahusha titular (*our Lord Yahusha
-- HaMashiach,* *the day of the Lord Yahusha*) the pull keeps *Lord* — preserved exactly.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-2   the fornication named: one should have his father''s wife; ye are puffed up
--           Tanakh: Leviticus 18:8 (the nakedness of thy father''s wife shalt thou not uncover),
--                   Deuteronomy 22:30 (a man shall not take his father''s wife), Deuteronomy 27:20
--                   (Cursed be he that lieth with his father''s wife)
--           Extras: none warranted   NT: none warranted (the root is the Torah prohibition)
--   v.3-5   deliver such an one unto Satan for the destruction of the flesh, that the spirit be saved
--           Tanakh: none warranted   Extras: none warranted
--           NT: Matthew 18:17 (tell it unto the church... let him be as an heathen man) — the
--               assembly''s judgment of the unrepentant brother
--   v.6-8   a little leaven leaveneth the whole lump; Messiah our passover; let us keep the feast [BLESSING]
--           Tanakh: Exodus 12:5 (lamb without blemish), Exodus 12:13 (when I see the blood, I will
--                   pass over you), Exodus 12:15 (the first day ye shall put away leaven out of your
--                   houses), Exodus 12:8 (unleavened bread), Exodus 13:7 (no leaven seen in all thy
--                   quarters), Leviticus 23:5-6 (the LORD''S passover... the feast of unleavened bread),
--                   Deuteronomy 16:3 (no leavened bread... seven days unleavened bread)
--           Extras: none warranted (the Torah feast is the whole load-bearing root)
--           NT: John 1:29 (Behold the Lamb of Elohim), 1 Peter 1:19 (the precious blood of Messiah,
--               as of a lamb without blemish)
--   v.9-13  keep no company with a fornicator... them that are without Elohim judgeth; put away that
--           wicked person
--           Tanakh: Deuteronomy 13:5, 17:7, 19:19, 21:21, 22:21, 24:7 (so shalt thou put the evil
--                   away from among you — the recurring discipline formula)
--           Extras: none warranted   NT: carried in the discipline thread (Matthew 18:17)
--
-- THREADS (slug -> target libraries):
--   6700 1-corinthians-5-christ-our-passover-keep-the-feast-exodus-12         (Tanakh + NT)  [BLESSING CENTERPIECE]
--   6703 1-corinthians-5-put-away-the-wicked-person-from-among-you-deuteronomy-13  (Tanakh)
--   6706 1-corinthians-5-the-fornication-torah-curses-the-fathers-wife-leviticus-18  (Tanakh)
--   6709 1-corinthians-5-deliver-such-an-one-unto-satan-and-judge-them-within-matthew-18  (NT)
-- =====================================================================

CREATE TEMP VIEW _s228_co05_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-corinthians-5-christ-our-passover-keep-the-feast-exodus-12  [BLESSING CENTERPIECE]
  ('canon', '1-corinthians', 5, 7, 'canon', 'exodus', 12, 5, 'free', E'*Your lamb shall be without blemish, a male of the first year: ye shall take it out from the sheep, or from the goats:* (Exodus 12:5). The Passover lamb of Egypt had to be *without blemish* — and Paul names the One it always pointed to: *For even Messiah (Christ) our passover is sacrificed for us* (1 Corinthians 5:7). The unblemished lamb chosen on the tenth day and slain on the fourteenth is the Messiah; the feast is not abolished but filled, its lamb revealed. Paul does not loose the assembly from the Passover — he tells them whose blood the lamb foretold.'),
  ('canon', '1-corinthians', 5, 7, 'canon', 'exodus', 12, 13, 'free', E'*And the blood shall be to you for a token upon the houses where ye are: and when I see the blood, I will pass over you, and the plague shall not be upon you to destroy you, when I smite the land of Egypt.* (Exodus 12:13). The blood on the door turned the destroyer aside; Yahuah (LORD) passed over the houses marked by the lamb. *Messiah (Christ) our passover is sacrificed for us* (1 Corinthians 5:7) — the blood that now stands between the gathered seed and judgment is the blood the door-posts foretold. The Passover is the same Passover; the Lamb is the Messiah.'),
  ('canon', '1-corinthians', 5, 7, 'canon', 'exodus', 12, 15, 'free', E'*Seven days shall ye eat unleavened bread; even the first day ye shall put away leaven out of your houses: for whosoever eateth leavened bread from the first day until the seventh day, that soul shall be cut off from Yashar''el (Israel).* (Exodus 12:15). The Feast of Unleavened Bread begins with putting leaven out of the house. Paul speaks the very command to the assembly: *Purge out therefore the old leaven, that ye may be a new lump, as ye are unleavened* (1 Corinthians 5:7). The literal sweeping-out of leaven becomes the sweeping-out of *malice and wickedness* — but the feast that taught it stands; Paul keeps it and tells them to keep it.'),
  ('canon', '1-corinthians', 5, 8, 'canon', 'exodus', 12, 8, 'free', E'*And they shall eat the flesh in that night, roast with fire, and unleavened bread; and with bitter herbs they shall eat it.* (Exodus 12:8). The lamb was eaten with *unleavened bread* — and Paul reads that very bread as the shape of the redeemed life: *Therefore let us keep the feast, not with old leaven, neither with the leaven of malice and wickedness; but with the unleavened bread of sincerity and truth* (1 Corinthians 5:8). *Let us keep the feast* — the Feast of Unleavened Bread is affirmed, and its bread is now sincerity and truth. The feast is not severed from the assembly; it is fulfilled in them.'),
  ('canon', '1-corinthians', 5, 7, 'canon', 'exodus', 13, 7, 'free', E'*Unleavened bread shall be eaten seven days; and there shall no leavened bread be seen with thee, neither shall there be leaven seen with thee in all thy quarters.* (Exodus 13:7). No leaven was to be seen in all the borders of Yashar''el (Israel) through the seven feast-days. Paul presses the same total purge upon the assembly: *a little leaven leaveneth the whole lump. Purge out therefore the old leaven* (1 Corinthians 5:6-7). The thoroughness Torah required of the houses of Yashar''el (Israel) is the thoroughness the gathered seed owes — the leaven of wickedness wholly put away.'),
  ('canon', '1-corinthians', 5, 8, 'canon', 'leviticus', 23, 6, 'free', E'*And on the fifteenth day of the same month is the feast of unleavened bread unto Yahuah (LORD): seven days ye must eat unleavened bread.* (Leviticus 23:6). Among the appointed feasts of Yahuah (LORD), the fifteenth day opens *the feast of unleavened bread.* This is the very feast Paul commands the assembly to keep: *Therefore let us keep the feast... with the unleavened bread of sincerity and truth* (1 Corinthians 5:8). The feast of unleavened bread is named in the calendar of Yahuah''s (LORD''s) own appointed times; Paul does not abolish that appointment but binds the assembly to it, its meaning now full.'),
  ('canon', '1-corinthians', 5, 7, 'canon', 'leviticus', 23, 5, 'free', E'*In the fourteenth day of the first month at even is the LORD''S passover.* (Leviticus 23:5). The Passover stands first among the feasts of Yahuah (LORD), kept on the fourteenth at even. *Messiah (Christ) our passover is sacrificed for us* (1 Corinthians 5:7): the appointed Passover of Yahuah''s (LORD''s) calendar finds its Lamb. The feast is not a shadow discarded but an appointment kept and filled — the day Yahuah (LORD) set apart now bearing the name of the One it foretold.'),
  ('canon', '1-corinthians', 5, 8, 'canon', 'deuteronomy', 16, 3, 'free', E'*Thou shalt eat no leavened bread with it; seven days shalt thou eat unleavened bread therewith, even the bread of affliction; for thou camest forth out of the land of Egypt in haste: that thou mayest remember the day when thou camest forth out of the land of Egypt all the days of thy life.* (Deuteronomy 16:3). The unleavened bread is the *bread of affliction,* eaten to remember the deliverance out of Egypt all the days of one''s life. Paul keeps the remembrance and gives it its fullness: *let us keep the feast... with the unleavened bread of sincerity and truth* (1 Corinthians 5:8). The feast that remembers the first redemption now remembers the greater — *Messiah (Christ) our passover* — and the bread of affliction becomes the bread of sincerity and truth.'),
  ('canon', '1-corinthians', 5, 7, 'canon', 'john', 1, 29, 'free', E'*The next day John seeth Yahusha (Jesus) coming unto him, and saith, Behold the Lamb of Elohim (God), which taketh away the sin of the world.* (John 1:29). John the Immerser names Yahusha (Jesus) *the Lamb of Elohim (God)* — the Passover lamb in person. Paul says the same: *Messiah (Christ) our passover is sacrificed for us* (1 Corinthians 5:7). The lamb of Exodus 12, the Lamb of Elohim (God) pointed out at the Jordan, and the Passover sacrificed for the assembly are one and the same — Yahusha (Jesus), the unblemished Lamb whose blood turns the destroyer aside.'),
  ('canon', '1-corinthians', 5, 7, 'canon', '1-peter', 1, 19, 'free', E'*But with the precious blood of Messiah (Christ), as of a lamb without blemish and without spot:* (1 Peter 1:19). The Passover lamb had to be *without blemish* (Exodus 12:5), and Peter names the redemption-price by that very pattern: *the precious blood of Messiah (Christ), as of a lamb without blemish and without spot.* It is the same confession Paul makes — *Messiah (Christ) our passover is sacrificed for us* (1 Corinthians 5:7). The unblemished lamb of the feast is the Messiah, his blood the ransom; the apostolic witness reads the Passover not as abolished but as fulfilled in him.'),
  -- thread: 1-corinthians-5-put-away-the-wicked-person-from-among-you-deuteronomy-13
  ('canon', '1-corinthians', 5, 13, 'canon', 'deuteronomy', 13, 5, 'free', E'*And that prophet, or that dreamer of dreams, shall be put to death; because he hath spoken to turn you away from Yahuah Elohaychem (the LORD your God)... So shalt thou put the evil away from the midst of thee.* (Deuteronomy 13:5). Paul closes the discipline of the assembly with a Torah formula: *Therefore put away from among yourselves that wicked person* (1 Corinthians 5:13). It is the recurring judgment-word of Deuteronomy — *so shalt thou put the evil away from the midst of thee.* Paul settles the case by the law; the discipline of the gathered seed is the discipline of the congregation of Yashar''el (Israel) carried forward, not set aside.'),
  ('canon', '1-corinthians', 5, 13, 'canon', 'deuteronomy', 17, 7, 'free', E'*The hands of the witnesses shall be first upon him to put him to death, and afterward the hands of all the people. So thou shalt put the evil away from among you.* (Deuteronomy 17:7). The Torah''s charge against the idolater ends with the words Paul takes up almost verbatim: *put away from among yourselves that wicked person* (1 Corinthians 5:13). *So thou shalt put the evil away from among you* — the formula that purged Yashar''el (Israel) of the corrupting evil is the formula by which Paul purges the assembly. The leaven and the evil-person are the same charge: a little corruption left in leavens the whole.'),
  ('canon', '1-corinthians', 5, 13, 'canon', 'deuteronomy', 19, 19, 'free', E'*Then shall ye do unto him, as he had thought to have done unto his brother: so shalt thou put the evil away from among you.* (Deuteronomy 19:19). Against the false witness Torah repeats the standing word, *so shalt thou put the evil away from among you* — the same word Paul speaks over the unrepentant fornicator: *put away from among yourselves that wicked person* (1 Corinthians 5:13). The assembly that judges *them that are within* (1 Corinthians 5:12) does so on the authority of the law that purged the camp of evil.'),
  ('canon', '1-corinthians', 5, 13, 'canon', 'deuteronomy', 21, 21, 'free', E'*And all the men of his city shall stone him with stones, that he die: so shalt thou put evil away from among you; and all Yashar''el (Israel) shall hear, and fear.* (Deuteronomy 21:21). The stubborn and rebellious son is judged that *all Yashar''el (Israel) shall hear, and fear* — and the evil put away. Paul''s *put away from among yourselves that wicked person* (1 Corinthians 5:13) carries the same purpose: the leaven removed *that ye may be a new lump* (1 Corinthians 5:7). The discipline is not cruelty but the keeping of the assembly clean, the very logic of the Torah formula.'),
  ('canon', '1-corinthians', 5, 13, 'canon', 'deuteronomy', 22, 21, 'free', E'*Then they shall bring out the damsel to the door of her father''s house, and the men of her city shall stone her with stones that she die: because she hath wrought folly in Yashar''el (Israel), to play the whore in her father''s house: so shalt thou put evil away from among you.* (Deuteronomy 22:21). The sexual-sin case in Torah closes with *so shalt thou put evil away from among you* — and it is a sexual sin Paul is judging, *such fornication as is not so much as named among the Gentiles* (1 Corinthians 5:1). His verdict is the Torah verdict: *put away from among yourselves that wicked person* (1 Corinthians 5:13). The folly wrought is purged from the assembly as it was purged from Yashar''el (Israel).'),
  ('canon', '1-corinthians', 5, 13, 'canon', 'deuteronomy', 24, 7, 'free', E'*If a man be found stealing any of his brethren of the children of Yashar''el (Israel), and maketh merchandise of him, or selleth him; then that thief shall die; and thou shalt put evil away from among you.* (Deuteronomy 24:7). Once more the Torah closes its judgment with *thou shalt put evil away from among you.* Across the offences of Deuteronomy the formula stands unchanged, and Paul speaks it over the Corinthian assembly: *put away from among yourselves that wicked person* (1 Corinthians 5:13). The apostle does not improvise a new church-order; he applies the law''s own enduring command to the gathered seed.'),
  -- thread: 1-corinthians-5-the-fornication-torah-curses-the-fathers-wife-leviticus-18
  ('canon', '1-corinthians', 5, 1, 'canon', 'leviticus', 18, 8, 'free', E'*The nakedness of thy father''s wife shalt thou not uncover: it is thy father''s nakedness.* (Leviticus 18:8). The sin Paul reports is named in the Torah by the very relation: *that one should have his father''s wife* (1 Corinthians 5:1) is *the nakedness of thy father''s wife* the law forbids. What the assembly tolerated and was *puffed up* over (1 Corinthians 5:2), Torah had already marked as forbidden — Paul judges by the standard of holiness Yahuah (LORD) gave Yashar''el (Israel), not by the leniency of the nations.'),
  ('canon', '1-corinthians', 5, 1, 'canon', 'deuteronomy', 22, 30, 'free', E'*A man shall not take his father''s wife, nor discover his father''s skirt.* (Deuteronomy 22:30). The law is plain: *a man shall not take his father''s wife.* Yet the Corinthian assembly harboured exactly this — *one should have his father''s wife* (1 Corinthians 5:1) — and gloried instead of mourning. Paul holds the Torah''s line: the relationship is not a matter of opinion but a thing the law of Yahuah (LORD) had long forbidden to Yashar''el (Israel) and to the stranger grafted among them.'),
  ('canon', '1-corinthians', 5, 1, 'canon', 'deuteronomy', 27, 20, 'free', E'*Cursed be he that lieth with his father''s wife; because he uncovereth his father''s skirt. And all the people shall say, Amen.* (Deuteronomy 27:20). From Mount Ebal the curse was pronounced and all the people answered *Amen* over the man who *lieth with his father''s wife.* This is the sin Paul finds in the assembly — *that one should have his father''s wife* (1 Corinthians 5:1) — and the boasting over it is boasting over what stands under the covenant curse. Paul''s judgment to *deliver such an one unto Satan for the destruction of the flesh* (1 Corinthians 5:5) honours the seriousness the Torah-curse already declared.'),
  -- thread: 1-corinthians-5-deliver-such-an-one-unto-satan-and-judge-them-within-matthew-18
  ('canon', '1-corinthians', 5, 5, 'canon', 'matthew', 18, 17, 'free', E'*And if he shall neglect to hear them, tell it unto the church: but if he neglect to hear the church, let him be unto thee as an heathen man and a publican.* (Matthew 18:17). Yahusha (Jesus) gave the assembly authority to judge the unrepentant brother: the final step is to *tell it unto the church,* and the one who will not hear is put outside. Paul exercises that very authority — *To deliver such an one unto Satan for the destruction of the flesh, that the spirit may be saved in the day of the Lord Yahusha (Lord Jesus)* (1 Corinthians 5:5) — for *do not ye judge them that are within?* (1 Corinthians 5:12). The discipline is the Master''s own ordinance for his gathered people, aimed not at destruction but that *the spirit may be saved.*')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s228_co05_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s228_co05_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-corinthians-5-christ-our-passover-keep-the-feast-exodus-12',
       E'Messiah our passover — purge the old leaven and keep the feast (Exodus 12)',
       E'Paul does not abolish the feast; he commands the assembly to keep it. *Purge out therefore the old leaven, that ye may be a new lump, as ye are unleavened. For even Messiah (Christ) our passover is sacrificed for us: Therefore let us keep the feast, not with old leaven, neither with the leaven of malice and wickedness; but with the unleavened bread of sincerity and truth* (1 Corinthians 5:7-8). Every word rests on the Passover of Egypt. The lamb was *without blemish, a male of the first year* (Exodus 12:5), and *Messiah (Christ) our passover* is that unblemished Lamb — *Behold the Lamb of Elohim (God), which taketh away the sin of the world* (John 1:29), *the precious blood of Messiah (Christ), as of a lamb without blemish and without spot* (1 Peter 1:19). The blood marked the door, *and when I see the blood, I will pass over you, and the plague shall not be upon you to destroy you* (Exodus 12:13) — the blood that now stands between the gathered seed and judgment. And the purging of leaven is the Feast of Unleavened Bread itself: *even the first day ye shall put away leaven out of your houses* (Exodus 12:15), *there shall no leavened bread be seen with thee... in all thy quarters* (Exodus 13:7); for these are the appointed feasts of Yahuah (LORD) — *In the fourteenth day of the first month at even is the LORD''S passover. And on the fifteenth day of the same month is the feast of unleavened bread unto Yahuah (LORD): seven days ye must eat unleavened bread* (Leviticus 23:5-6), *the bread of affliction... that thou mayest remember the day when thou camest forth out of the land of Egypt* (Deuteronomy 16:3). Paul takes the whole appointment and tells the assembly to keep it — *let us keep the feast.* The lamb is revealed as the Messiah; the literal leaven swept from the house becomes *malice and wickedness* swept from the assembly; the unleavened bread becomes *sincerity and truth.* The feast is not a shadow discarded but an appointed time of Yahuah (LORD) kept and filled in the gathered seed — Israel and the grafted-in — who eat the Passover whose Lamb has come.',
       sv.verse_id, ev.verse_id, 'free', 6700
  FROM _s228_co05_lookup sv, _s228_co05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=5 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='1-corinthians' AND ev.chapter_number=5 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-corinthians-5-put-away-the-wicked-person-from-among-you-deuteronomy-13',
       E'Put away from among yourselves that wicked person (Deuteronomy''s "put the evil away")',
       E'Paul ends the chapter with a Torah formula, word for word: *Therefore put away from among yourselves that wicked person* (1 Corinthians 5:13). Throughout Deuteronomy the judgment of a corrupting offence closes with the same charge — *So shalt thou put the evil away from the midst of thee* (Deuteronomy 13:5, against the prophet who turns the people from Yahuah Elohaychem, the LORD your God); *So thou shalt put the evil away from among you* (Deuteronomy 17:7, against the idolater); *so shalt thou put the evil away from among you* (Deuteronomy 19:19, against the false witness); *so shalt thou put evil away from among you; and all Yashar''el (Israel) shall hear, and fear* (Deuteronomy 21:21, against the rebellious son); *so shalt thou put evil away from among you* (Deuteronomy 22:21, against the one who wrought folly in Yashar''el, Israel); *and thou shalt put evil away from among you* (Deuteronomy 24:7, against the man-stealer). Paul is judging exactly this kind of corrupting sin — *such fornication as is not so much as named among the Gentiles* (1 Corinthians 5:1) — and he settles it on the law''s own authority: *do not ye judge them that are within?* (1 Corinthians 5:12). This is the same logic as the leaven — *a little leaven leaveneth the whole lump* (1 Corinthians 5:6) — the corruption left in the camp spreads. The discipline of the gathered seed is not a new church-order invented against Torah but the enduring command of the law carried forward into the assembly: the evil purged that the whole lump be kept clean.',
       sv.verse_id, ev.verse_id, 'free', 6703
  FROM _s228_co05_lookup sv, _s228_co05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=5 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='1-corinthians' AND ev.chapter_number=5 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-corinthians-5-the-fornication-torah-curses-the-fathers-wife-leviticus-18',
       E'The fornication Torah curses — his father''s wife (Leviticus 18, Deuteronomy 27)',
       E'The sin that opens the chapter is the one the Torah had already named and cursed. *It is reported commonly that there is fornication among you... that one should have his father''s wife* (1 Corinthians 5:1) — and the law forbids it by the very relation: *The nakedness of thy father''s wife shalt thou not uncover: it is thy father''s nakedness* (Leviticus 18:8); *A man shall not take his father''s wife, nor discover his father''s skirt* (Deuteronomy 22:30); and from Mount Ebal the covenant curse: *Cursed be he that lieth with his father''s wife; because he uncovereth his father''s skirt. And all the people shall say, Amen* (Deuteronomy 27:20). The assembly was *puffed up* (1 Corinthians 5:2) over a thing that stands under the curse of the law — they boasted where they should have mourned. Paul measures the case not by the leniency of the nations but by the holiness Yahuah (LORD) gave Yashar''el (Israel); and his sentence, *to deliver such an one unto Satan for the destruction of the flesh, that the spirit may be saved in the day of the Lord Yahusha (Lord Jesus)* (1 Corinthians 5:5), honours the gravity the Torah-curse already declared, while aiming at the man''s final salvation.',
       sv.verse_id, ev.verse_id, 'free', 6706
  FROM _s228_co05_lookup sv, _s228_co05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=5 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='1-corinthians' AND ev.chapter_number=5 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-corinthians-5-deliver-such-an-one-unto-satan-and-judge-them-within-matthew-18',
       E'Deliver such an one unto Satan — the assembly judges them that are within (Matthew 18)',
       E'Paul exercises an authority Yahusha (Jesus) had given the assembly to judge an unrepentant brother. *In the name of our Lord Yahusha HaMashiach (Lord Jesus Christ), when ye are gathered together... To deliver such an one unto Satan for the destruction of the flesh, that the spirit may be saved in the day of the Lord Yahusha (Lord Jesus)* (1 Corinthians 5:4-5); for *do not ye judge them that are within?* (1 Corinthians 5:12). This is the last step of the Master''s own order of discipline: *if he shall neglect to hear them, tell it unto the church: but if he neglect to hear the church, let him be unto thee as an heathen man and a publican* (Matthew 18:17). The one who will not be reclaimed is put outside the fellowship of the gathered — *with such an one no not to eat* (1 Corinthians 5:11) — yet the aim is not destruction but restoration, *that the spirit may be saved.* The same chapter binds this to the feast: the offender is the *old leaven* that must be purged *that ye may be a new lump* (1 Corinthians 5:7); the assembly keeps itself unleavened by putting the unrepentant out, on the Master''s authority and the law''s.',
       sv.verse_id, ev.verse_id, 'free', 6709
  FROM _s228_co05_lookup sv, _s228_co05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=5 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='1-corinthians' AND ev.chapter_number=5 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-corinthians-5-christ-our-passover-keep-the-feast-exodus-12
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 12:5 — *Your lamb shall be without blemish, a male of the first year* the Passover lamb the feast required; *Messiah (Christ) our passover is sacrificed for us* (1 Corinthians 5:7).'
  FROM cross_reference_threads t, cross_references x, _s228_co05_lookup sv, _s228_co05_lookup tv
 WHERE t.slug='1-corinthians-5-christ-our-passover-keep-the-feast-exodus-12'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=5 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 12:13 — *when I see the blood, I will pass over you, and the plague shall not be upon you to destroy you* the blood that turns the destroyer aside; the blood of *Messiah (Christ) our passover* (1 Corinthians 5:7).'
  FROM cross_reference_threads t, cross_references x, _s228_co05_lookup sv, _s228_co05_lookup tv
 WHERE t.slug='1-corinthians-5-christ-our-passover-keep-the-feast-exodus-12'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=5 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 12:15 — *even the first day ye shall put away leaven out of your houses* the Feast of Unleavened Bread begins; *Purge out therefore the old leaven, that ye may be a new lump* (1 Corinthians 5:7).'
  FROM cross_reference_threads t, cross_references x, _s228_co05_lookup sv, _s228_co05_lookup tv
 WHERE t.slug='1-corinthians-5-christ-our-passover-keep-the-feast-exodus-12'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=5 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Exodus 12:8 — *roast with fire, and unleavened bread* the lamb eaten with unleavened bread; *with the unleavened bread of sincerity and truth* (1 Corinthians 5:8).'
  FROM cross_reference_threads t, cross_references x, _s228_co05_lookup sv, _s228_co05_lookup tv
 WHERE t.slug='1-corinthians-5-christ-our-passover-keep-the-feast-exodus-12'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=5 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Exodus 13:7 — *there shall no leavened bread be seen with thee... in all thy quarters* the total purge Torah required; *a little leaven leaveneth the whole lump* (1 Corinthians 5:6).'
  FROM cross_reference_threads t, cross_references x, _s228_co05_lookup sv, _s228_co05_lookup tv
 WHERE t.slug='1-corinthians-5-christ-our-passover-keep-the-feast-exodus-12'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=5 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=13 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Leviticus 23:5 — *In the fourteenth day of the first month at even is the LORD''S passover* the Passover among Yahuah''s (LORD''s) appointed feasts; *Messiah (Christ) our passover is sacrificed for us* (1 Corinthians 5:7).'
  FROM cross_reference_threads t, cross_references x, _s228_co05_lookup sv, _s228_co05_lookup tv
 WHERE t.slug='1-corinthians-5-christ-our-passover-keep-the-feast-exodus-12'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=5 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Leviticus 23:6 — *the feast of unleavened bread unto Yahuah (LORD): seven days ye must eat unleavened bread* the appointed feast; *Therefore let us keep the feast* (1 Corinthians 5:8).'
  FROM cross_reference_threads t, cross_references x, _s228_co05_lookup sv, _s228_co05_lookup tv
 WHERE t.slug='1-corinthians-5-christ-our-passover-keep-the-feast-exodus-12'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=5 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'Deuteronomy 16:3 — *seven days shalt thou eat unleavened bread therewith, even the bread of affliction... that thou mayest remember the day when thou camest forth out of the land of Egypt* the feast of remembrance; now kept *with the unleavened bread of sincerity and truth* (1 Corinthians 5:8).'
  FROM cross_reference_threads t, cross_references x, _s228_co05_lookup sv, _s228_co05_lookup tv
 WHERE t.slug='1-corinthians-5-christ-our-passover-keep-the-feast-exodus-12'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=5 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=16 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 9, E'John 1:29 — *Behold the Lamb of Elohim (God), which taketh away the sin of the world* Yahusha (Jesus) named the Passover Lamb; *Messiah (Christ) our passover is sacrificed for us* (1 Corinthians 5:7).'
  FROM cross_reference_threads t, cross_references x, _s228_co05_lookup sv, _s228_co05_lookup tv
 WHERE t.slug='1-corinthians-5-christ-our-passover-keep-the-feast-exodus-12'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=5 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 10, E'1 Peter 1:19 — *the precious blood of Messiah (Christ), as of a lamb without blemish and without spot* the unblemished Passover lamb of Exodus 12:5 fulfilled; *Messiah (Christ) our passover is sacrificed for us* (1 Corinthians 5:7).'
  FROM cross_reference_threads t, cross_references x, _s228_co05_lookup sv, _s228_co05_lookup tv
 WHERE t.slug='1-corinthians-5-christ-our-passover-keep-the-feast-exodus-12'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=5 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=1 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-corinthians-5-put-away-the-wicked-person-from-among-you-deuteronomy-13
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 13:5 — *So shalt thou put the evil away from the midst of thee* the formula against the prophet who turns the people away; *put away from among yourselves that wicked person* (1 Corinthians 5:13).'
  FROM cross_reference_threads t, cross_references x, _s228_co05_lookup sv, _s228_co05_lookup tv
 WHERE t.slug='1-corinthians-5-put-away-the-wicked-person-from-among-you-deuteronomy-13'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=5 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=13 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 17:7 — *So thou shalt put the evil away from among you* the formula against the idolater, almost word for word; *put away from among yourselves that wicked person* (1 Corinthians 5:13).'
  FROM cross_reference_threads t, cross_references x, _s228_co05_lookup sv, _s228_co05_lookup tv
 WHERE t.slug='1-corinthians-5-put-away-the-wicked-person-from-among-you-deuteronomy-13'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=5 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=17 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 19:19 — *so shalt thou put the evil away from among you* the formula against the false witness; the assembly that *judge[s] them that are within* (1 Corinthians 5:12) on this authority.'
  FROM cross_reference_threads t, cross_references x, _s228_co05_lookup sv, _s228_co05_lookup tv
 WHERE t.slug='1-corinthians-5-put-away-the-wicked-person-from-among-you-deuteronomy-13'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=5 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=19 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Deuteronomy 21:21 — *so shalt thou put evil away from among you; and all Yashar''el (Israel) shall hear, and fear* the formula against the rebellious son; the leaven removed *that ye may be a new lump* (1 Corinthians 5:7,13).'
  FROM cross_reference_threads t, cross_references x, _s228_co05_lookup sv, _s228_co05_lookup tv
 WHERE t.slug='1-corinthians-5-put-away-the-wicked-person-from-among-you-deuteronomy-13'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=5 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=21 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Deuteronomy 22:21 — *so shalt thou put evil away from among you* the formula against the sexual sin in Yashar''el (Israel); Paul judges a sexual sin, *put away from among yourselves that wicked person* (1 Corinthians 5:1,13).'
  FROM cross_reference_threads t, cross_references x, _s228_co05_lookup sv, _s228_co05_lookup tv
 WHERE t.slug='1-corinthians-5-put-away-the-wicked-person-from-among-you-deuteronomy-13'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=5 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=22 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Deuteronomy 24:7 — *thou shalt put evil away from among you* the formula against the man-stealer; the enduring command applied to the assembly, *put away from among yourselves that wicked person* (1 Corinthians 5:13).'
  FROM cross_reference_threads t, cross_references x, _s228_co05_lookup sv, _s228_co05_lookup tv
 WHERE t.slug='1-corinthians-5-put-away-the-wicked-person-from-among-you-deuteronomy-13'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=5 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=24 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-corinthians-5-the-fornication-torah-curses-the-fathers-wife-leviticus-18
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 18:8 — *The nakedness of thy father''s wife shalt thou not uncover: it is thy father''s nakedness* the relation the law forbids; *that one should have his father''s wife* (1 Corinthians 5:1).'
  FROM cross_reference_threads t, cross_references x, _s228_co05_lookup sv, _s228_co05_lookup tv
 WHERE t.slug='1-corinthians-5-the-fornication-torah-curses-the-fathers-wife-leviticus-18'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=18 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 22:30 — *A man shall not take his father''s wife, nor discover his father''s skirt* the plain prohibition; the assembly harboured *one should have his father''s wife* (1 Corinthians 5:1).'
  FROM cross_reference_threads t, cross_references x, _s228_co05_lookup sv, _s228_co05_lookup tv
 WHERE t.slug='1-corinthians-5-the-fornication-torah-curses-the-fathers-wife-leviticus-18'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=22 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 27:20 — *Cursed be he that lieth with his father''s wife... And all the people shall say, Amen* the covenant curse from Ebal; the assembly *puffed up* over what stands cursed (1 Corinthians 5:1-2).'
  FROM cross_reference_threads t, cross_references x, _s228_co05_lookup sv, _s228_co05_lookup tv
 WHERE t.slug='1-corinthians-5-the-fornication-torah-curses-the-fathers-wife-leviticus-18'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=27 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-corinthians-5-deliver-such-an-one-unto-satan-and-judge-them-within-matthew-18
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 18:17 — *tell it unto the church: but if he neglect to hear the church, let him be unto thee as an heathen man and a publican* the Master''s order of discipline; *To deliver such an one unto Satan... that the spirit may be saved* (1 Corinthians 5:5).'
  FROM cross_reference_threads t, cross_references x, _s228_co05_lookup sv, _s228_co05_lookup tv
 WHERE t.slug='1-corinthians-5-deliver-such-an-one-unto-satan-and-judge-them-within-matthew-18'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=5 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=18 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
