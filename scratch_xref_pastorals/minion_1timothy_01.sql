-- ----- fragment: minion_1timothy_01.sql (S235 1 Timothy 1) -----
-- =====================================================================
-- S235 minion — 1 TIMOTHY 1 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 1 TIMOTHY 1 (20 verses) — the charge to a shepherd: sound doctrine against
-- the strivers about the law, the law used lawfully, the chief of sinners, the King eternal.
-- Tag: t235c1 (temp view _s235_t235c1_lookup).
-- Sort band: floor 8400 (25-wide); used 8400, 8401, 8402.
-- Source is ALWAYS the canon 1 Timothy verse; targets span Tanakh + NT (+ extras where it holds), woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME: Paul charges Timothy to keep Ephesus in sound doctrine against those who
-- *desire to be teachers of the law, understanding neither what they say.* The letter AFFIRMS the
-- Torah: the law is GOOD if used lawfully (1:8), the vice-list (1:9-10) is the Ten Words walked
-- through, used as the Torah uses itself — to expose the lawless, NOT a ladder of self-justification
-- and NOT the law abolished. *The end of the commandment is charity* (1:5) is love the fulfilling of
-- the law (Deuteronomy 6:5 / Leviticus 19:18 / Romans 13:10), not love instead of the law. The King
-- eternal, immortal, invisible (1:17) is the one Elohim of the Shema, the living everlasting King,
-- the invisible Father whom no man can see. No replacement theology, no law-vs-grace antithesis.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST:
--   v.1-4  greeting / charge no other doctrine / fables and endless genealogies
--          Tanakh: none warranted   Extras: none warranted   NT: none warranted
--          (the load-bearing weave begins at v.5; vv.1-4 are the epistolary frame)
--   v.5    the end of the commandment is charity out of a pure heart
--          Tanakh: Deuteronomy 6:5 (love Yahuah with all thine heart), Leviticus 19:18 (love thy neighbour as thyself)
--          Extras: none warranted (Sirach fear-of-Yahuah is tangential; love-fulfils-the-law is the Torah root)
--          NT: Romans 13:10 (love is the fulfilling of the law)
--   v.6-7  swerved unto vain jangling / desiring to be teachers of the law, understanding neither
--          Tanakh: none warranted   Extras: none warranted   NT: carried in the law-used-lawfully thread
--   v.8-11 ★ the law is good if used lawfully / the law not for the righteous but the lawless [vice-list = Ten Words]
--          Tanakh: Psalm 19:7 (the law of Yahuah is perfect), Exodus 20:13 (sixth word, manslayers),
--                  Exodus 20:16 (ninth word, liars/perjurers), Exodus 21:16 (menstealers), Deuteronomy 5:17 (the killing word)
--          Extras: none warranted   NT: Romans 7:12 (the law holy/just/good), Romans 7:16 (I consent unto the law that it is good)
--   v.12-16 mercy obtained / Christ came to save sinners, of whom I am chief
--          Tanakh: none warranted   Extras: none warranted   NT: none warranted
--          (the faithful saying stands on its own; no load-bearing Tanakh quote, do not force one)
--   v.17  ★ the King eternal, immortal, invisible, the only wise Elohim
--          Tanakh: Deuteronomy 6:4 (one Yahuah), Jeremiah 10:10 (the living Elohim, an everlasting king),
--                  Exodus 33:20 (no man see me and live), Psalm 145:13 (an everlasting kingdom)
--          Extras: Tobit 13:6-7 (extol the everlasting King / the King of heaven)
--          NT: none warranted (the doxology's roots are the Tanakh divine-king texts)
--   v.18-20 the good warfare / faith and a good conscience / shipwreck / Hymenaeus and Alexander
--          Tanakh: none warranted   Extras: none warranted   NT: none warranted
--
-- THREADS (slug -> target libraries):
--   8400 1-timothy-1-the-end-of-the-commandment-is-charity-love-fulfils-the-law-deuteronomy-6  (Tanakh + NT)
--   8401 1-timothy-1-the-law-is-good-if-used-lawfully-psalm-19-romans-7  (Tanakh + NT)  [★ BLESSING — law affirmed]
--   8402 1-timothy-1-the-king-eternal-immortal-invisible-the-only-wise-elohim-deuteronomy-6-jeremiah-10  (Tanakh + Extras)
-- =====================================================================

CREATE TEMP VIEW _s235_t235c1_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-timothy-1-the-end-of-the-commandment-is-charity-love-fulfils-the-law-deuteronomy-6
  ('canon', '1-timothy', 1, 5, 'canon', 'deuteronomy', 6, 5, 'free', E'*And thou shalt love Yahuah Elohayka (the LORD thy God) with all thine heart, and with all thy soul, and with all thy might.* (Deuteronomy 6:5). Paul says *the end of the commandment is charity out of a pure heart* (1 Timothy 1:5). The aim toward which the commandment moves is the great command Moses gave — to love Yahuah (LORD) with the whole heart. The charity Paul names is not love set against the law but the very thing the law was always reaching for; the *pure heart* is the heart turned wholly to Yahuah (LORD). The strivers who *desire to be teachers of the law* (1 Timothy 1:7) have lost this end — they handle the commandment without arriving at the love it commands.'),
  ('canon', '1-timothy', 1, 5, 'canon', 'leviticus', 19, 18, 'free', E'*Thou shalt not avenge, nor bear any grudge against the children of thy people, but thou shalt love thy neighbour as thyself: I am Yahuah (LORD).* (Leviticus 19:18). The second half of the commandment''s end is here: love of neighbour, given in the Torah itself. Paul''s *charity out of a pure heart, and of a good conscience, and of faith unfeigned* (1 Timothy 1:5) is the Torah''s own *love thy neighbour as thyself* — the goal of the commandment, not a replacement for it. The law that commands this love is the law that is *good if a man use it lawfully* (1 Timothy 1:8); to use it lawfully is to be brought by it to this very love.'),
  ('canon', '1-timothy', 1, 5, 'canon', 'romans', 13, 10, 'free', E'*Love worketh no ill to his neighbour: therefore love is the fulfilling of the law.* (Romans 13:10). Paul says elsewhere exactly what he means here: love is not the abolition of the law but *the fulfilling of the law.* So *the end of the commandment is charity* (1 Timothy 1:5) — the commandment is fulfilled, brought to its purpose, in love. The two verses guard each other against the misreading that would set charity over against Torah: the love that fulfils the law and the law whose end is that love are one.'),
  -- thread: 1-timothy-1-the-law-is-good-if-used-lawfully-psalm-19-romans-7  [★ BLESSING]
  ('canon', '1-timothy', 1, 8, 'canon', 'psalms', 19, 7, 'free', E'*The law of Yahuah (LORD) is perfect, converting the soul: the testimony of Yahuah (LORD) is sure, making wise the simple.* (Psalm 19:7). When Paul writes *we know that the law is good, if a man use it lawfully* (1 Timothy 1:8), he is confessing what David sang — *the law of Yahuah (LORD) is perfect.* The law is not the problem; the misuse of it is. The strivers handle the law unlawfully, but the law itself is perfect, converting the soul. Paul does not abolish what David called perfect; he insists it be used as it is — good.'),
  ('canon', '1-timothy', 1, 8, 'canon', 'romans', 7, 12, 'free', E'*Wherefore the law is holy, and the commandment holy, and just, and good.* (Romans 7:12). Paul''s verdict on the law is the same in both letters: *the law is good* (1 Timothy 1:8) and *the law is holy, and the commandment holy, and just, and good* (Romans 7:12). The law is not made the enemy; sin is. To *use it lawfully* is to let the holy and good law do its holy and good work — exposing sin, not being blamed for it. The very word *good* binds the two confessions: what Paul calls good here he calls holy, just, and good there.'),
  ('canon', '1-timothy', 1, 8, 'canon', 'romans', 7, 16, 'free', E'*If then I do that which I would not, I consent unto the law that it is good.* (Romans 7:16). Even in the struggle with sin, Paul *consents unto the law that it is good* — the same testimony he gives Timothy, *the law is good, if a man use it lawfully* (1 Timothy 1:8). The conscience that hates its own sin is agreeing with the law against itself; that agreement is the law used lawfully. Far from freeing the believer from the law, Paul makes the believer the one who consents to it as good.'),
  ('canon', '1-timothy', 1, 9, 'canon', 'exodus', 20, 13, 'free', E'*Thou shalt not kill.* (Exodus 20:13). Paul''s list of those for whom the law is made walks the Ten Words: *for murderers of fathers and murderers of mothers, for manslayers* (1 Timothy 1:9) stands against the sixth word, *Thou shalt not kill.* The law is not made *for a righteous man, but for the lawless and disobedient* (1 Timothy 1:9) — it names the manslayer''s sin as sin precisely because Sinai forbade the shedding of blood. The vice-list is the Decalogue read as a mirror that convicts the lawless.'),
  ('canon', '1-timothy', 1, 9, 'canon', 'deuteronomy', 5, 17, 'free', E'*Thou shalt not kill.* (Deuteronomy 5:17). The sixth word is given again in the second telling of the Ten, and Paul''s *manslayers* (1 Timothy 1:9) are measured by it. The law that says *Thou shalt not kill* is the law that is *not made for a righteous man, but for the lawless* — for the very murderers Paul names. To use the law lawfully is to let it do here what Sinai gave it to do: to stand over the manslayer and call his deed transgression.'),
  ('canon', '1-timothy', 1, 9, 'canon', 'exodus', 21, 16, 'free', E'*And he that stealeth a man, and selleth him, or if he be found in his hand, he shall surely be put to death.* (Exodus 21:16). The eighth word is sharpened in the Torah''s case-law against the worst theft of all — the stealing of a man. Paul names this very sin in his list: *for menstealers* (1 Timothy 1:10). The law that condemns the kidnapper-and-slaver is the law Paul says is good if used lawfully; his vice-list is not a catalogue of vices the law has nothing to say about, but the Torah''s own crimes, each answering to a command. The menstealer stands convicted by Exodus 21:16.'),
  ('canon', '1-timothy', 1, 10, 'canon', 'exodus', 20, 16, 'free', E'*Thou shalt not bear false witness against thy neighbour.* (Exodus 20:16). The ninth word stands behind the close of Paul''s list: *for liars, for perjured persons* (1 Timothy 1:10). The law that forbids false witness is the law made for the liar and the perjurer — it names their lie as transgression. So the whole vice-list (1 Timothy 1:9-10) is the Ten Words walked through: the murderer against the sixth, the whoremonger against the seventh, the menstealer against the eighth, the liar against the ninth. The law is good, and it is good for exactly this — to expose *any other thing that is contrary to sound doctrine* (1 Timothy 1:10).'),
  -- thread: 1-timothy-1-the-king-eternal-immortal-invisible-the-only-wise-elohim-deuteronomy-6-jeremiah-10
  ('canon', '1-timothy', 1, 17, 'canon', 'deuteronomy', 6, 4, 'free', E'*Hear, O Yashar''el (Israel): Yahuah Eloheinu (The LORD our God) is one Yahuah (LORD):* (Deuteronomy 6:4). Paul''s doxology rests on the Shema: *the King eternal, immortal, invisible, the only wise Elohim (God)* (1 Timothy 1:17). The *only wise Elohim (God)* is the one Yahuah (LORD) of Yashar''el (Israel) — the one Elohim whom Moses confessed, the Father. Paul gives honour and glory not to many but to the One; his praise of *the only wise Elohim (God)* is the Shema turned into worship.'),
  ('canon', '1-timothy', 1, 17, 'canon', 'jeremiah', 10, 10, 'free', E'*But Yahuah (LORD) is the true Elohim (God), he is the living Elohim (God), and an everlasting king: at his wrath the earth shall tremble, and the nations shall not be able to abide his indignation.* (Jeremiah 10:10). Jeremiah names Yahuah (LORD) *the living Elohim (God), and an everlasting king* — the very titles of Paul''s doxology, *the King eternal, immortal* (1 Timothy 1:17). The King who is eternal and cannot die is the living and everlasting King of the prophets; Paul gathers up Jeremiah''s confession and lays it as honour and glory at the feet of the one true Elohim (God).'),
  ('canon', '1-timothy', 1, 17, 'canon', 'exodus', 33, 20, 'free', E'*And he said, Thou canst not see my face: for there shall no man see me, and live.* (Exodus 33:20). Paul calls the only wise Elohim (God) *invisible* (1 Timothy 1:17), and this is what Yahuah (LORD) told Moses: *there shall no man see me, and live.* The invisible Father is the One the doxology praises — the same Elohim (God) of whom Paul will later say he is *invisible... whom no man hath seen, nor can see* (1 Timothy 6:16). The honour and glory go to the unseen King, the Father whom no eye has beheld.'),
  ('canon', '1-timothy', 1, 17, 'canon', 'psalms', 145, 13, 'free', E'*Thy kingdom is an everlasting kingdom, and thy dominion endureth throughout all generations.* (Psalm 145:13). The *King eternal* (1 Timothy 1:17) reigns over the everlasting kingdom the psalmist praised: *thy kingdom is an everlasting kingdom.* Paul''s *for ever and ever* echoes David''s *throughout all generations.* The doxology is the psalmist''s praise of the divine King carried into the assembly — honour and glory to the One whose kingdom has no end.'),
  ('canon', '1-timothy', 1, 17, 'apocrypha', 'tobit', 13, 6, 'extras', E'*...and praise Yahuah (God) of might, and extol the everlasting King. In the land of my captivity do I praise him, and declare his might and majesty to a sinful nation.* (Tobit 13:6). The Hebrew library knows this same doxology: Tobit, in the land of his captivity, *extols the everlasting King.* Paul''s *King eternal, immortal, invisible* (1 Timothy 1:17) is the everlasting King Tobit praised — the one Elohim (God) whose might and majesty are declared even among a sinful nation. The praise of the eternal King is the abiding worship of the gathered people, in exile and in the assembly alike.'),
  ('canon', '1-timothy', 1, 17, 'apocrypha', 'tobit', 13, 7, 'extras', E'*I will extol my Elohim (God), and my soul shall praise the King of heaven, and shall rejoice in his greatness.* (Tobit 13:7). *The King of heaven* whom Tobit''s soul praises is *the King eternal, immortal, invisible, the only wise Elohim (God)* of Paul''s doxology (1 Timothy 1:17). The same blessing rises in both: honour and glory, praise and rejoicing, to the one heavenly King. Paul''s *be honour and glory for ever and ever. Amen* is Tobit''s extolling of the King of heaven carried forward into the household of Elohim (God).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s235_t235c1_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s235_t235c1_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-timothy-1-the-end-of-the-commandment-is-charity-love-fulfils-the-law-deuteronomy-6',
       E'The end of the commandment is charity — love the fulfilling of the law (Deuteronomy 6, Leviticus 19)',
       E'Against the strivers who *desire to be teachers of the law; understanding neither what they say, nor whereof they affirm* (1 Timothy 1:7), Paul sets the true aim: *Now the end of the commandment is charity out of a pure heart, and of a good conscience, and of faith unfeigned* (1 Timothy 1:5). The *end* — the goal toward which the commandment moves — is love, and that love is the Torah''s own. Moses gave the first half: *And thou shalt love Yahuah Elohayka (the LORD thy God) with all thine heart, and with all thy soul, and with all thy might* (Deuteronomy 6:5); and the second, in the Torah itself: *thou shalt love thy neighbour as thyself: I am Yahuah (LORD)* (Leviticus 19:18). This charity is not love set over against the law but the very thing the law was always reaching for — and Paul says so plainly elsewhere: *Love worketh no ill to his neighbour: therefore love is the fulfilling of the law* (Romans 13:10). Love does not abolish the commandment; it fulfils it, brings it to its purpose. So the *pure heart,* the *good conscience,* and the *faith unfeigned* are the law arriving where it always aimed. The teachers of the law who have *swerved... turned aside unto vain jangling* (1 Timothy 1:6) have lost this end: they handle the commandment without arriving at the love it commands. To know the law rightly is to be carried by it into the love of Yahuah (LORD) and of neighbour.',
       sv.verse_id, ev.verse_id, 'free', 8400
  FROM _s235_t235c1_lookup sv, _s235_t235c1_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=1 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='1-timothy' AND ev.chapter_number=1 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-timothy-1-the-law-is-good-if-used-lawfully-psalm-19-romans-7',
       E'The law is good, if a man use it lawfully — the vice-list is the Ten Words walked through (Psalm 19, Romans 7, Exodus 20)',
       E'Paul does not abolish the law; he defends it against those who handle it wrongly. *But we know that the law is good, if a man use it lawfully* (1 Timothy 1:8) — the problem is never the law, only its misuse. This is David''s confession turned into doctrine: *The law of Yahuah (LORD) is perfect, converting the soul: the testimony of Yahuah (LORD) is sure, making wise the simple* (Psalm 19:7). And it is the verdict Paul gives in Romans: *the law is holy, and the commandment holy, and just, and good* (Romans 7:12); even in the war with sin he *consents unto the law that it is good* (Romans 7:16). The very word *good* binds all three witnesses together. To *use it lawfully* is to use it as the Torah uses itself — as the standard that exposes sin, not as a ladder by which the proud justify themselves. So Paul says *the law is not made for a righteous man, but for the lawless and disobedient... for murderers... for whoremongers... for menstealers, for liars, for perjured persons* (1 Timothy 1:9-10). This list is the Ten Words walked through. *Murderers of fathers and murderers of mothers, manslayers* stand against the sixth word, *Thou shalt not kill* (Exodus 20:13; Deuteronomy 5:17); *whoremongers, them that defile themselves with mankind* against the seventh; *menstealers* against the eighth in its sharpest case-law, *he that stealeth a man, and selleth him... shall surely be put to death* (Exodus 21:16); *liars, perjured persons* against the ninth, *Thou shalt not bear false witness against thy neighbour* (Exodus 20:16). The law convicts the lawless of exactly these crimes — that is the law used lawfully. Paul is not freeing the believer from the law and binding it only on the unsaved; he is showing that the holy and good law does its holy and good work of naming sin as sin, and *if there be any other thing that is contrary to sound doctrine* (1 Timothy 1:10), the law of Yahuah (LORD) stands over it too. The perfect law of Yahuah (LORD) is affirmed, not annulled.',
       sv.verse_id, ev.verse_id, 'free', 8401
  FROM _s235_t235c1_lookup sv, _s235_t235c1_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=1 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='1-timothy' AND ev.chapter_number=1 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-timothy-1-the-king-eternal-immortal-invisible-the-only-wise-elohim-deuteronomy-6-jeremiah-10',
       E'The King eternal, immortal, invisible, the only wise Elohim (Deuteronomy 6, Jeremiah 10, Exodus 33)',
       E'Paul breaks into doxology: *Now unto the King eternal, immortal, invisible, the only wise Elohim (God), be honour and glory for ever and ever. Amen* (1 Timothy 1:17). Every title is drawn from the Tanakh''s worship of the one true Elohim (God). *The only wise Elohim (God)* is the one Yahuah (LORD) of the Shema: *Hear, O Yashar''el (Israel): Yahuah Eloheinu (The LORD our God) is one Yahuah (LORD)* (Deuteronomy 6:4) — Paul gives honour not to many but to the One, the Father. *The King eternal, immortal* is the prophet''s confession: *But Yahuah (LORD) is the true Elohim (God), he is the living Elohim (God), and an everlasting king* (Jeremiah 10:10); the King who cannot die is the living and everlasting King. *Invisible* is what Yahuah (LORD) told Moses: *Thou canst not see my face: for there shall no man see me, and live* (Exodus 33:20) — the unseen Father, of whom Paul will say again he is *invisible... whom no man hath seen, nor can see* (1 Timothy 6:16). And the *King eternal* reigns over the kingdom David praised: *Thy kingdom is an everlasting kingdom, and thy dominion endureth throughout all generations* (Psalm 145:13), Paul''s *for ever and ever* answering David''s *throughout all generations.* The Hebrew library lifts the same doxology: Tobit in his captivity *extols the everlasting King* and his soul *praises the King of heaven* (Tobit 13:6-7). All of it is honour and glory laid at the feet of the one invisible, immortal, eternal Elohim (God) — the Father, the only wise King, whom no eye has seen and whose kingdom has no end.',
       sv.verse_id, ev.verse_id, 'extras', 8402
  FROM _s235_t235c1_lookup sv, _s235_t235c1_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=1 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='1-timothy' AND ev.chapter_number=1 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-timothy-1-the-end-of-the-commandment-is-charity-love-fulfils-the-law-deuteronomy-6
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 6:5 — *thou shalt love Yahuah Elohayka (the LORD thy God) with all thine heart* the first great command; *the end of the commandment is charity out of a pure heart* (1 Timothy 1:5).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c1_lookup sv, _s235_t235c1_lookup tv
 WHERE t.slug='1-timothy-1-the-end-of-the-commandment-is-charity-love-fulfils-the-law-deuteronomy-6'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=1 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 19:18 — *thou shalt love thy neighbour as thyself: I am Yahuah (LORD)* the Torah''s own love-of-neighbour; the charity that is the commandment''s end (1 Timothy 1:5).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c1_lookup sv, _s235_t235c1_lookup tv
 WHERE t.slug='1-timothy-1-the-end-of-the-commandment-is-charity-love-fulfils-the-law-deuteronomy-6'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=1 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 13:10 — *love is the fulfilling of the law* love does not abolish but fulfils the commandment; *the end of the commandment is charity* (1 Timothy 1:5).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c1_lookup sv, _s235_t235c1_lookup tv
 WHERE t.slug='1-timothy-1-the-end-of-the-commandment-is-charity-love-fulfils-the-law-deuteronomy-6'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=1 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=13 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-timothy-1-the-law-is-good-if-used-lawfully-psalm-19-romans-7
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 19:7 — *The law of Yahuah (LORD) is perfect, converting the soul* David''s confession behind Paul''s; *the law is good, if a man use it lawfully* (1 Timothy 1:8).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c1_lookup sv, _s235_t235c1_lookup tv
 WHERE t.slug='1-timothy-1-the-law-is-good-if-used-lawfully-psalm-19-romans-7'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 7:12 — *the law is holy, and the commandment holy, and just, and good* Paul''s parallel verdict; *the law is good* (1 Timothy 1:8).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c1_lookup sv, _s235_t235c1_lookup tv
 WHERE t.slug='1-timothy-1-the-law-is-good-if-used-lawfully-psalm-19-romans-7'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=7 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 7:16 — *I consent unto the law that it is good* the conscience agreeing with the law against its own sin; the law used lawfully (1 Timothy 1:8).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c1_lookup sv, _s235_t235c1_lookup tv
 WHERE t.slug='1-timothy-1-the-law-is-good-if-used-lawfully-psalm-19-romans-7'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=7 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Exodus 20:13 — *Thou shalt not kill* the sixth word behind *manslayers* (1 Timothy 1:9); the law made for the lawless.'
  FROM cross_reference_threads t, cross_references x, _s235_t235c1_lookup sv, _s235_t235c1_lookup tv
 WHERE t.slug='1-timothy-1-the-law-is-good-if-used-lawfully-psalm-19-romans-7'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=1 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Deuteronomy 5:17 — *Thou shalt not kill* the sixth word in the second telling; *manslayers* convicted by it (1 Timothy 1:9).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c1_lookup sv, _s235_t235c1_lookup tv
 WHERE t.slug='1-timothy-1-the-law-is-good-if-used-lawfully-psalm-19-romans-7'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=1 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=5 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Exodus 21:16 — *he that stealeth a man, and selleth him... shall surely be put to death* the eighth word''s case-law behind *menstealers* (1 Timothy 1:10).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c1_lookup sv, _s235_t235c1_lookup tv
 WHERE t.slug='1-timothy-1-the-law-is-good-if-used-lawfully-psalm-19-romans-7'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=1 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=21 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Exodus 20:16 — *Thou shalt not bear false witness against thy neighbour* the ninth word behind *liars, perjured persons* (1 Timothy 1:10); the vice-list is the Ten Words walked through.'
  FROM cross_reference_threads t, cross_references x, _s235_t235c1_lookup sv, _s235_t235c1_lookup tv
 WHERE t.slug='1-timothy-1-the-law-is-good-if-used-lawfully-psalm-19-romans-7'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=1 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-timothy-1-the-king-eternal-immortal-invisible-the-only-wise-elohim-deuteronomy-6-jeremiah-10
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 6:4 — *Yahuah Eloheinu (The LORD our God) is one Yahuah (LORD)* the Shema behind *the only wise Elohim (God)* (1 Timothy 1:17); honour to the One, the Father.'
  FROM cross_reference_threads t, cross_references x, _s235_t235c1_lookup sv, _s235_t235c1_lookup tv
 WHERE t.slug='1-timothy-1-the-king-eternal-immortal-invisible-the-only-wise-elohim-deuteronomy-6-jeremiah-10'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=1 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 10:10 — *the living Elohim (God), and an everlasting king* the prophet''s titles behind *the King eternal, immortal* (1 Timothy 1:17).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c1_lookup sv, _s235_t235c1_lookup tv
 WHERE t.slug='1-timothy-1-the-king-eternal-immortal-invisible-the-only-wise-elohim-deuteronomy-6-jeremiah-10'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=1 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=10 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 33:20 — *there shall no man see me, and live* the invisible Father behind *invisible... the only wise Elohim (God)* (1 Timothy 1:17).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c1_lookup sv, _s235_t235c1_lookup tv
 WHERE t.slug='1-timothy-1-the-king-eternal-immortal-invisible-the-only-wise-elohim-deuteronomy-6-jeremiah-10'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=1 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=33 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 145:13 — *Thy kingdom is an everlasting kingdom* the kingdom of *the King eternal*; Paul''s *for ever and ever* answers *throughout all generations* (1 Timothy 1:17).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c1_lookup sv, _s235_t235c1_lookup tv
 WHERE t.slug='1-timothy-1-the-king-eternal-immortal-invisible-the-only-wise-elohim-deuteronomy-6-jeremiah-10'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=1 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=145 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Tobit 13:6 — *extol the everlasting King* the Hebrew library''s same doxology; *the King eternal, immortal, invisible* (1 Timothy 1:17).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c1_lookup sv, _s235_t235c1_lookup tv
 WHERE t.slug='1-timothy-1-the-king-eternal-immortal-invisible-the-only-wise-elohim-deuteronomy-6-jeremiah-10'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=1 AND sv.verse_number=17
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=13 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Tobit 13:7 — *my soul shall praise the King of heaven* the King of heaven who is *the King eternal, immortal, invisible, the only wise Elohim (God)* (1 Timothy 1:17).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c1_lookup sv, _s235_t235c1_lookup tv
 WHERE t.slug='1-timothy-1-the-king-eternal-immortal-invisible-the-only-wise-elohim-deuteronomy-6-jeremiah-10'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=1 AND sv.verse_number=17
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=13 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
