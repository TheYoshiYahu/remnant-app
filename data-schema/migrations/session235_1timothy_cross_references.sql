-- =====================================================================
-- Session 235 — 1 Timothy FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py data-schema/migrations/session235_1timothy_cross_references.sql
-- =====================================================================

\echo 'session235 — 1 Timothy cross-references starting...'
BEGIN;

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

-- ----- fragment: minion_1timothy_02.sql (S235 1 Timothy 2) -----
-- =====================================================================
-- S235 minion — 1 TIMOTHY 2 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 1 TIMOTHY 2 (15 verses) — prayer for all men and for kings; the one
--   Elohim and the one Mediator; men and women in the assembly; the Adam-Eve order.
-- Tag: t235c2 (temp view _s235_t235c2_lookup).
-- Sort band: floor 8425 (25-wide); used 8425, 8426, 8427, 8428.
-- Source is ALWAYS the canon 1 Timothy verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME: Paul orders the assembly. First, prayer is to be made for ALL men, for
--   kings and all in authority (2:1-2) — the exile's charge to seek the peace of the city and
--   pray for the king. Elohim *will have all men to be saved* (2:4) — the Tanakh's own heart,
--   *I have no pleasure in the death of the wicked.* ★★ The load-bearing center: *there is one
--   Elohim (God), and one mediator between Elohim (God) and men, the man HaMashiach Yahusha
--   (Christ Jesus)* (2:5). This is the Shema's ONE Elohim (Deuteronomy 6:4) — the FATHER is the
--   one Elohim — and the one Mediator is the MAN, the Formed, who stands BETWEEN, as Moses stood
--   between (Deuteronomy 5:5) and as Job longed for a daysman (Job 9:33). The verse itself names
--   him *the man HaMashiach Yahusha* — keep the Father the one Elohim and the Son the Formed
--   Mediator; the verse DISTINGUISHES them; NOT co-equal persons. ★★ And 2:13-14: *Adam was
--   first formed, then Eve* — the creation ORDER of Genesis 2-3, the forming of the man first
--   and the woman drawn from him, the woman deceived in the transgression; framed as the order
--   of creation, NOT misogyny. No replacement theology, no law-vs-grace antithesis.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-2   prayer, supplication for all men; for kings and all in authority
--           Tanakh: Jeremiah 29:7 (seek the peace of the city... pray unto Yahuah for it),
--                   Ezra 6:10 (pray for the life of the king, and of his sons)
--           Extras: none warranted (no clean load-bearing witness; the Tanakh roots carry it)
--           NT: none warranted (carried in prose)
--   v.3-4   Elohim our Saviour, who will have all men to be saved
--           Tanakh: Ezekiel 18:23 (Have I any pleasure that the wicked should die?),
--                   Ezekiel 18:32 (I have no pleasure in the death of him that dieth),
--                   Ezekiel 33:11 (I have no pleasure in the death of the wicked... turn ye)
--           Extras: none warranted   NT: none warranted
--   v.5-6   one Elohim, one mediator, the man HaMashiach Yahusha [★★ BLESSING]
--           Tanakh: Deuteronomy 6:4 (Yahuah Eloheinu is one Yahuah), Deuteronomy 5:5 (I stood
--                   between Yahuah and you), Job 9:33 (neither is there any daysman betwixt us)
--           Extras: none warranted (verified Wisdom/Sirach; no clean load-bearing one-Mediator
--                   witness — the Shema + Moses + the daysman carry it)
--           NT: Galatians 3:19-20 (ordained by angels in the hand of a mediator... Elohim is one)
--   v.7     ordained a preacher and apostle, a teacher of the Gentiles
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted
--   v.8     men pray every where, lifting up holy hands, without wrath
--           Tanakh: none warranted (lifting holy hands a single recurring posture, not a
--                   load-bearing thread for this chapter)   Extras: none warranted   NT: none
--   v.9-10  women adorn in modest apparel, with good works, not gold or pearls
--           Tanakh: none warranted (no single load-bearing parallel; would be a verbal echo)
--           Extras: none warranted   NT: none warranted
--   v.11-12 the woman learn in silence, in subjection
--           Tanakh: carried in the creation-order thread at v.13-14
--           Extras: none warranted   NT: carried in 1 Corinthians 11 at v.13
--   v.13-14 Adam first formed, then Eve; the woman deceived [★★ creation order, NOT misogyny]
--           Tanakh: Genesis 2:7 (Yahuah Elohim formed man of the dust), Genesis 2:21-22 (took
--                   one of his ribs... made he a woman), Genesis 3:6 (the woman... took of the
--                   fruit), Genesis 3:13 (the serpent beguiled me, and I did eat)
--           Extras: none warranted   NT: 1 Corinthians 11:8-9 (the woman of the man; the woman
--                   for the man)
--   v.15    she shall be saved in childbearing, if they continue in faith
--           Tanakh: none warranted (the childbearing promise here is too distinct to bind
--                   cleanly to Genesis 3:15/3:16 without forcing)   Extras: none   NT: none
--
-- THREADS (slug -> target libraries):
--   8425 1-timothy-2-pray-for-all-men-and-for-kings-jeremiah-29-ezra-6                    (Tanakh)
--   8426 1-timothy-2-who-will-have-all-men-to-be-saved-ezekiel-18-33                      (Tanakh)
--   8427 1-timothy-2-one-elohim-one-mediator-the-man-deuteronomy-6-job-9                  (Tanakh + NT)  [★★ BLESSING]
--   8428 1-timothy-2-adam-was-first-formed-then-eve-the-creation-order-genesis-2-3        (Tanakh + NT)  [★★]
-- =====================================================================

CREATE TEMP VIEW _s235_t235c2_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-timothy-2-pray-for-all-men-and-for-kings-jeremiah-29-ezra-6
  ('canon', '1-timothy', 2, 1, 'canon', 'jeremiah', 29, 7, 'free', E'*And seek the peace of the city whither I have caused you to be carried away captives, and pray unto Yahuah (LORD) for it: for in the peace thereof shall ye have peace.* (Jeremiah 29:7). When Yahuah (LORD) sent his people into exile he charged them to pray for the very city that held them captive, *for in the peace thereof shall ye have peace.* Paul lays the same charge on the assembly: *I exhort therefore, that, first of all, supplications, prayers, intercessions, and giving of thanks, be made for all men* (1 Timothy 2:1). The intercession that begins the ordered assembly is the exile''s old commission — to seek the welfare of all, and to pray for the place where the gathered now sojourn, *that we may lead a quiet and peaceable life in all godliness and honesty* (1 Timothy 2:2).'),
  ('canon', '1-timothy', 2, 2, 'canon', 'ezra', 6, 10, 'free', E'*That they may offer sacrifices of sweet savours unto the Elohim (God) of heaven, and pray for the life of the king, and of his sons.* (Ezra 6:10). The decree of Cyrus and Darius bound the returning remnant to *pray for the life of the king,* the very ruler under whose authority they lived. Paul says the same prayer is to rise from the assembly: *For kings, and for all that are in authority; that we may lead a quiet and peaceable life in all godliness and honesty* (1 Timothy 2:2). Intercession for the king is not a new thing under the apostle but the standing practice of Yahuah (LORD)''s people in every age — prayer offered for those set over them, that the gathered may serve their Elohim (God) in peace.'),
  -- thread: 1-timothy-2-who-will-have-all-men-to-be-saved-ezekiel-18-33
  ('canon', '1-timothy', 2, 4, 'canon', 'ezekiel', 18, 23, 'free', E'*Have I any pleasure at all that the wicked should die? saith Adonai Yahuah (the Lord GOD): and not that he should return from his ways, and live?* (Ezekiel 18:23). The heart of Elohim (God) revealed through Ezekiel takes no pleasure in the death of the wicked but longs for him to *return from his ways, and live.* This is the very heart Paul names of *Elohim (God) our Saviour; Who will have all men to be saved, and to come unto the knowledge of the truth* (1 Timothy 2:3-4). The Saviour who would have all men saved is the same Yahuah (LORD) who pleaded with the house of Yashar''el (Israel) to turn and live; the gospel''s wide mercy is the Tanakh''s own longing made plain.'),
  ('canon', '1-timothy', 2, 4, 'canon', 'ezekiel', 18, 32, 'free', E'*For I have no pleasure in the death of him that dieth, saith Adonai Yahuah (the Lord GOD): wherefore turn yourselves, and live ye.* (Ezekiel 18:32). Adonai Yahuah (the Lord GOD) declares plainly, *I have no pleasure in the death of him that dieth,* and calls, *turn yourselves, and live ye.* So Paul says Elohim (God) our Saviour *will have all men to be saved, and to come unto the knowledge of the truth* (1 Timothy 2:4). The Elohim (God) who desires that all be saved is no different in the apostle than in the prophet: he wills life, not death, and calls all to turn — which is why the assembly is to pray *for all men* (1 Timothy 2:1).'),
  ('canon', '1-timothy', 2, 4, 'canon', 'ezekiel', 33, 11, 'free', E'*Say unto them, As I live, saith Adonai Yahuah (the Lord GOD), I have no pleasure in the death of the wicked; but that the wicked turn from his way and live: turn ye, turn ye from your evil ways; for why will ye die, O house of Yashar''el (Israel)?* (Ezekiel 33:11). With an oath upon his own life Yahuah (LORD) swears, *I have no pleasure in the death of the wicked; but that the wicked turn from his way and live.* This sworn mercy is the ground of Paul''s confidence that Elohim (God) our Saviour *will have all men to be saved* (1 Timothy 2:4). The God who pressed *turn ye, turn ye* upon the house of Yashar''el (Israel) is the God whose saving will now reaches *all men* through the one Mediator — the same heart, the same call to come *unto the knowledge of the truth.*'),
  -- thread: 1-timothy-2-one-elohim-one-mediator-the-man-deuteronomy-6-job-9  [★★ BLESSING]
  ('canon', '1-timothy', 2, 5, 'canon', 'deuteronomy', 6, 4, 'free', E'*Hear, O Yashar''el (Israel): Yahuah Eloheinu (The LORD our God) is one Yahuah (LORD):* (Deuteronomy 6:4). The Shema confesses the one Elohim (God) of Yashar''el (Israel): *Yahuah Eloheinu (The LORD our God) is one Yahuah (LORD).* Paul speaks from that same confession: *For there is one Elohim (God), and one mediator between Elohim (God) and men, the man HaMashiach Yahusha (Christ Jesus)* (1 Timothy 2:5). Mark how the verse holds the two apart — the ONE Elohim (God) is the Father, the unseen source; and the one Mediator is *the man HaMashiach Yahusha (Christ Jesus),* the Formed who stands between Elohim (God) and men. The Shema is not broken but kept: there is one Elohim (God), and the Mediator is the man who brings men to him.'),
  ('canon', '1-timothy', 2, 5, 'canon', 'deuteronomy', 5, 5, 'free', E'*(I stood between Yahuah (LORD) and you at that time, to shew you the word of Yahuah (LORD): for ye were afraid by reason of the fire, and went not up into the mount;) saying,* (Deuteronomy 5:5). At Horeb Moses describes his office in one phrase: *I stood between Yahuah (LORD) and you... to shew you the word of Yahuah (LORD).* That is the mediator''s work — to stand between the one Elohim (God) and the people and bring the word across. Paul names the greater One who fills that office: *one mediator between Elohim (God) and men, the man HaMashiach Yahusha (Christ Jesus)* (1 Timothy 2:5). As Moses stood between Yahuah (LORD) and Yashar''el (Israel), so the Formed Man stands between the one Elohim (God) and all men — not a co-equal of the Father but the appointed go-between, the man who shows men the Father and brings them near.'),
  ('canon', '1-timothy', 2, 5, 'canon', 'job', 9, 33, 'free', E'*Neither is there any daysman betwixt us, that might lay his hand upon us both.* (Job 9:33). Job, crushed before the Almighty, longs for what he cannot find — *any daysman betwixt us, that might lay his hand upon us both,* an umpire who could touch both the Holy One and the man and bring them together. Paul announces that the longed-for daysman has come: *one mediator between Elohim (God) and men, the man HaMashiach Yahusha (Christ Jesus); Who gave himself a ransom for all* (1 Timothy 2:5-6). The Mediator must be able to lay his hand on both — and so he is *the man,* the Formed, who shares our flesh and is sent of the one Elohim (God); the daysman Job could not find is given to all men in the Man who ransomed them.'),
  ('canon', '1-timothy', 2, 5, 'canon', 'galatians', 3, 20, 'free', E'*Now a mediator is not a mediator of one, but Elohim (God) is one.* (Galatians 3:20). Paul reasons from the same truth twice. The law *was ordained by angels in the hand of a mediator* (Galatians 3:19), and *a mediator is not a mediator of one, but Elohim (God) is one* — a mediator by definition stands between two parties, and the one party is the one Elohim (God). It is the very logic of 1 Timothy: *there is one Elohim (God), and one mediator between Elohim (God) and men, the man HaMashiach Yahusha (Christ Jesus)* (1 Timothy 2:5). The Father is the one Elohim (God); the men are the other party; and *the man HaMashiach Yahusha (Christ Jesus)* is the one standing between — the Formed Mediator, distinguished from the one Elohim (God) he mediates toward, not collapsed into him.'),
  -- thread: 1-timothy-2-adam-was-first-formed-then-eve-the-creation-order-genesis-2-3  [★★]
  ('canon', '1-timothy', 2, 13, 'canon', 'genesis', 2, 7, 'free', E'*And Yahuah Elohim (the LORD God) formed man of the dust of the ground, and breathed into his nostrils the breath of life; and man became a living soul.* (Genesis 2:7). The forming of the man came first: *Yahuah Elohim (the LORD God) formed man of the dust of the ground.* Paul grounds his order in this very act: *For Adam was first formed, then Eve* (1 Timothy 2:13). The word reaches back to the beginning — Adam was *formed* of the dust before the woman was made; the apostle reasons not from custom but from the order of creation, the way Yahuah Elohim (the LORD God) himself set things in Genesis.'),
  ('canon', '1-timothy', 2, 13, 'canon', 'genesis', 2, 22, 'free', E'*And the rib, which Yahuah Elohim (the LORD God) had taken from man, made he a woman, and brought her unto the man.* (Genesis 2:22). The woman was made after the man and from the man: *the rib, which Yahuah Elohim (the LORD God) had taken from man, made he a woman.* This is the *then Eve* of Paul''s words: *For Adam was first formed, then Eve* (1 Timothy 2:13). The order is the order of Genesis itself — the man formed of the dust, the woman built from his side and brought to him; Paul appeals to the creation account, not to any disdain for the woman whom Yahuah Elohim (the LORD God) himself fashioned and gave.'),
  ('canon', '1-timothy', 2, 14, 'canon', 'genesis', 3, 6, 'free', E'*And when the woman saw that the tree was good for food, and that it was pleasant to the eyes, and a tree to be desired to make one wise, she took of the fruit thereof, and did eat, and gave also unto her husband with her; and he did eat.* (Genesis 3:6). In the garden *the woman... took of the fruit thereof, and did eat.* Paul recalls this moment: *And Adam was not deceived, but the woman being deceived was in the transgression* (1 Timothy 2:14). The point is the account as written — the serpent came to the woman, and the deception entered there. The apostle is not weighing the worth of the woman but reading the history of Genesis, where the deceiving and the transgression took their recorded course.'),
  ('canon', '1-timothy', 2, 14, 'canon', 'genesis', 3, 13, 'free', E'*And Yahuah Elohim (the LORD God) said unto the woman, What is this that thou hast done? And the woman said, The serpent beguiled me, and I did eat.* (Genesis 3:13). The woman''s own confession names the deception: *The serpent beguiled me, and I did eat.* This is exactly the word Paul uses: *the woman being deceived was in the transgression* (1 Timothy 2:14) — *beguiled,* *deceived,* the same garden event. Paul stands on the Genesis record of how sin entered, not on any judgment of the woman''s nature; the verse that follows holds out hope, that *she shall be saved in childbearing, if they continue in faith and charity and holiness with sobriety* (1 Timothy 2:15).'),
  ('canon', '1-timothy', 2, 13, 'canon', '1-corinthians', 11, 8, 'free', E'*For the man is not of the woman; but the woman of the man.* (1 Corinthians 11:8). Paul had already drawn the creation order in the same way to the Corinthians: *the man is not of the woman; but the woman of the man,* and *Neither was the man created for the woman; but the woman for the man* (1 Corinthians 11:8-9). It is the same appeal he makes to Timothy: *For Adam was first formed, then Eve* (1 Timothy 2:13). The order of forming — the man first, the woman drawn from and made for the man — is the consistent ground of the apostle''s teaching, rooted not in misogyny but in the way Yahuah Elohim (the LORD God) ordered the man and the woman in the beginning.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s235_t235c2_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s235_t235c2_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-timothy-2-pray-for-all-men-and-for-kings-jeremiah-29-ezra-6',
       E'Prayer and intercession for all men, for kings and all in authority (Jeremiah 29, Ezra 6)',
       E'Paul orders the assembly by setting prayer first: *I exhort therefore, that, first of all, supplications, prayers, intercessions, and giving of thanks, be made for all men; For kings, and for all that are in authority; that we may lead a quiet and peaceable life in all godliness and honesty* (1 Timothy 2:1-2). This is no innovation but the standing charge of Yahuah (LORD) to his people. When he carried Yashar''el (Israel) into exile he commanded, *seek the peace of the city whither I have caused you to be carried away captives, and pray unto Yahuah (LORD) for it: for in the peace thereof shall ye have peace* (Jeremiah 29:7). And the decree that restored the remnant bound them to *offer sacrifices of sweet savours unto the Elohim (God) of heaven, and pray for the life of the king, and of his sons* (Ezra 6:10). Intercession for the city and for the king is the old commission of the sojourning people, renewed in the assembly — that the gathered may live quietly under those set over them and serve their Elohim (God) in peace.',
       sv.verse_id, ev.verse_id, 'free', 8425
  FROM _s235_t235c2_lookup sv, _s235_t235c2_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=2 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='1-timothy' AND ev.chapter_number=2 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-timothy-2-who-will-have-all-men-to-be-saved-ezekiel-18-33',
       E'Elohim (God) our Saviour, who will have all men to be saved (Ezekiel 18, 33)',
       E'Paul gives the ground of the assembly''s wide-armed prayer: *For this is good and acceptable in the sight of Elohim (God) our Saviour; Who will have all men to be saved, and to come unto the knowledge of the truth* (1 Timothy 2:3-4). The saving will of Elohim (God) is no new thing in the gospel; it is the very heart Yahuah (LORD) bared through Ezekiel. *Have I any pleasure at all that the wicked should die? saith Adonai Yahuah (the Lord GOD): and not that he should return from his ways, and live?* (Ezekiel 18:23). *For I have no pleasure in the death of him that dieth, saith Adonai Yahuah (the Lord GOD): wherefore turn yourselves, and live ye* (Ezekiel 18:32). And he swears it upon his own life: *As I live, saith Adonai Yahuah (the Lord GOD), I have no pleasure in the death of the wicked; but that the wicked turn from his way and live: turn ye, turn ye from your evil ways; for why will ye die, O house of Yashar''el (Israel)?* (Ezekiel 33:11). The Elohim (God) our Saviour who would have all men saved is the same Yahuah (LORD) who pressed *turn ye, turn ye* upon his people — one heart that wills life and not death, now reaching out to *all men* through the one Mediator, that they may *come unto the knowledge of the truth.*',
       sv.verse_id, ev.verse_id, 'free', 8426
  FROM _s235_t235c2_lookup sv, _s235_t235c2_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=2 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='1-timothy' AND ev.chapter_number=2 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-timothy-2-one-elohim-one-mediator-the-man-deuteronomy-6-job-9',
       E'One Elohim (God), one mediator between Elohim (God) and men, the man (Deuteronomy 6, Deuteronomy 5, Job 9)',
       E'The load-bearing confession of the chapter: *For there is one Elohim (God), and one mediator between Elohim (God) and men, the man HaMashiach Yahusha (Christ Jesus); Who gave himself a ransom for all* (1 Timothy 2:5-6). Hold the two apart as the verse holds them. The ONE Elohim (God) is the Shema''s own: *Hear, O Yashar''el (Israel): Yahuah Eloheinu (The LORD our God) is one Yahuah (LORD)* (Deuteronomy 6:4) — the Father, the unseen source, the one Elohim (God) beside whom there is no other. And the one Mediator is *the man HaMashiach Yahusha (Christ Jesus),* the Formed who stands BETWEEN the one Elohim (God) and men. A mediator''s office is to stand between: as Moses said, *I stood between Yahuah (LORD) and you at that time, to shew you the word of Yahuah (LORD)* (Deuteronomy 5:5) — the go-between who carries the word across. It is the very office Job longed for and could not find: *Neither is there any daysman betwixt us, that might lay his hand upon us both* (Job 9:33), an umpire who could touch both the Holy One and the man. That daysman is now given — *the man,* who shares our flesh and is sent of the one Elohim (God), and *gave himself a ransom for all.* Paul reasons the same way to the Galatians: the law was *ordained by angels in the hand of a mediator. Now a mediator is not a mediator of one, but Elohim (God) is one* (Galatians 3:19-20) — a mediator by definition stands between two parties, and the one party is the one Elohim (God). So keep the grammar of the verse: the Father is the one Elohim (God); the Son is the man, the Formed Mediator, distinguished from the one Elohim (God) he mediates toward — not a co-equal person collapsed into the Father, but the appointed go-between who brings men near, the daysman who lays his hand on both.',
       sv.verse_id, ev.verse_id, 'free', 8427
  FROM _s235_t235c2_lookup sv, _s235_t235c2_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=2 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='1-timothy' AND ev.chapter_number=2 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-timothy-2-adam-was-first-formed-then-eve-the-creation-order-genesis-2-3',
       E'Adam was first formed, then Eve: the order of creation in Genesis 2-3 (1 Corinthians 11)',
       E'Paul grounds his charge to the assembly not in custom but in the account of the beginning: *For Adam was first formed, then Eve. And Adam was not deceived, but the woman being deceived was in the transgression* (1 Timothy 2:13-14). Both halves reach straight back to Genesis. The forming order: *Yahuah Elohim (the LORD God) formed man of the dust of the ground, and breathed into his nostrils the breath of life; and man became a living soul* (Genesis 2:7) — the man first; and then *the rib, which Yahuah Elohim (the LORD God) had taken from man, made he a woman, and brought her unto the man* (Genesis 2:22) — the woman built from the man and brought to him. This is the *first formed, then Eve.* And the deception: in the garden *the woman... took of the fruit thereof, and did eat* (Genesis 3:6), and her own word names it, *The serpent beguiled me, and I did eat* (Genesis 3:13) — *beguiled,* *deceived,* the same event Paul recalls. The apostle reads the recorded history of Genesis, the same appeal he made to the Corinthians: *the man is not of the woman; but the woman of the man. Neither was the man created for the woman; but the woman for the man* (1 Corinthians 11:8-9). This is the order of creation as Yahuah Elohim (the LORD God) set it — the man formed first, the woman drawn from and made for the man — not a verdict on the worth of the woman whom Yahuah Elohim (the LORD God) himself fashioned and gave. And the word does not end in condemnation: *Notwithstanding she shall be saved in childbearing, if they continue in faith and charity and holiness with sobriety* (1 Timothy 2:15).',
       sv.verse_id, ev.verse_id, 'free', 8428
  FROM _s235_t235c2_lookup sv, _s235_t235c2_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=2 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='1-timothy' AND ev.chapter_number=2 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-timothy-2-pray-for-all-men-and-for-kings-jeremiah-29-ezra-6
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 29:7 — *seek the peace of the city... and pray unto Yahuah (LORD) for it: for in the peace thereof shall ye have peace* the exile''s charge to pray for the city; *supplications, prayers, intercessions... be made for all men* (1 Timothy 2:1).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c2_lookup sv, _s235_t235c2_lookup tv
 WHERE t.slug='1-timothy-2-pray-for-all-men-and-for-kings-jeremiah-29-ezra-6'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=2 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=29 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezra 6:10 — *pray for the life of the king, and of his sons* the remnant''s standing charge to pray for the ruler; *For kings, and for all that are in authority* (1 Timothy 2:2).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c2_lookup sv, _s235_t235c2_lookup tv
 WHERE t.slug='1-timothy-2-pray-for-all-men-and-for-kings-jeremiah-29-ezra-6'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=2 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=6 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-timothy-2-who-will-have-all-men-to-be-saved-ezekiel-18-33
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 18:23 — *Have I any pleasure at all that the wicked should die?... and not that he should return from his ways, and live?* the heart of Elohim (God) that wills life; *Who will have all men to be saved* (1 Timothy 2:4).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c2_lookup sv, _s235_t235c2_lookup tv
 WHERE t.slug='1-timothy-2-who-will-have-all-men-to-be-saved-ezekiel-18-33'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=18 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 18:32 — *I have no pleasure in the death of him that dieth... wherefore turn yourselves, and live ye* the same saving will; *Elohim (God) our Saviour; Who will have all men to be saved* (1 Timothy 2:3-4).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c2_lookup sv, _s235_t235c2_lookup tv
 WHERE t.slug='1-timothy-2-who-will-have-all-men-to-be-saved-ezekiel-18-33'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=18 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 33:11 — *As I live... I have no pleasure in the death of the wicked; but that the wicked turn from his way and live: turn ye, turn ye* the sworn mercy of Yahuah (LORD); the ground of *Who will have all men to be saved* (1 Timothy 2:4).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c2_lookup sv, _s235_t235c2_lookup tv
 WHERE t.slug='1-timothy-2-who-will-have-all-men-to-be-saved-ezekiel-18-33'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=33 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-timothy-2-one-elohim-one-mediator-the-man-deuteronomy-6-job-9
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 6:4 — *Yahuah Eloheinu (The LORD our God) is one Yahuah (LORD)* the Shema''s one Elohim (God), the Father; *there is one Elohim (God), and one mediator... the man HaMashiach Yahusha (Christ Jesus)* (1 Timothy 2:5).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c2_lookup sv, _s235_t235c2_lookup tv
 WHERE t.slug='1-timothy-2-one-elohim-one-mediator-the-man-deuteronomy-6-job-9'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=2 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 5:5 — *I stood between Yahuah (LORD) and you at that time, to shew you the word of Yahuah (LORD)* Moses the go-between; the Formed Man who stands *between Elohim (God) and men* (1 Timothy 2:5).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c2_lookup sv, _s235_t235c2_lookup tv
 WHERE t.slug='1-timothy-2-one-elohim-one-mediator-the-man-deuteronomy-6-job-9'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=2 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=5 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Job 9:33 — *Neither is there any daysman betwixt us, that might lay his hand upon us both* the daysman Job longed for; given in *the man HaMashiach Yahusha (Christ Jesus); Who gave himself a ransom for all* (1 Timothy 2:5-6).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c2_lookup sv, _s235_t235c2_lookup tv
 WHERE t.slug='1-timothy-2-one-elohim-one-mediator-the-man-deuteronomy-6-job-9'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=2 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=9 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Galatians 3:20 — *a mediator is not a mediator of one, but Elohim (God) is one* the mediator stands between two parties, the one party being the one Elohim (God); *one Elohim (God), and one mediator... the man* (1 Timothy 2:5).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c2_lookup sv, _s235_t235c2_lookup tv
 WHERE t.slug='1-timothy-2-one-elohim-one-mediator-the-man-deuteronomy-6-job-9'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=2 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=3 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-timothy-2-adam-was-first-formed-then-eve-the-creation-order-genesis-2-3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:7 — *Yahuah Elohim (the LORD God) formed man of the dust of the ground... and man became a living soul* the man formed first; *For Adam was first formed, then Eve* (1 Timothy 2:13).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c2_lookup sv, _s235_t235c2_lookup tv
 WHERE t.slug='1-timothy-2-adam-was-first-formed-then-eve-the-creation-order-genesis-2-3'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=2 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 2:22 — *the rib, which Yahuah Elohim (the LORD God) had taken from man, made he a woman, and brought her unto the man* the woman made after and from the man; the *then Eve* of *Adam was first formed, then Eve* (1 Timothy 2:13).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c2_lookup sv, _s235_t235c2_lookup tv
 WHERE t.slug='1-timothy-2-adam-was-first-formed-then-eve-the-creation-order-genesis-2-3'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=2 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 3:6 — *the woman... took of the fruit thereof, and did eat* the deception in the garden; *the woman being deceived was in the transgression* (1 Timothy 2:14).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c2_lookup sv, _s235_t235c2_lookup tv
 WHERE t.slug='1-timothy-2-adam-was-first-formed-then-eve-the-creation-order-genesis-2-3'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=2 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 3:13 — *The serpent beguiled me, and I did eat* the woman''s own confession of the deception; *the woman being deceived was in the transgression* (1 Timothy 2:14).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c2_lookup sv, _s235_t235c2_lookup tv
 WHERE t.slug='1-timothy-2-adam-was-first-formed-then-eve-the-creation-order-genesis-2-3'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=2 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Corinthians 11:8 — *the man is not of the woman; but the woman of the man* the same creation-order appeal Paul makes; *For Adam was first formed, then Eve* (1 Timothy 2:13).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c2_lookup sv, _s235_t235c2_lookup tv
 WHERE t.slug='1-timothy-2-adam-was-first-formed-then-eve-the-creation-order-genesis-2-3'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=2 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=11 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1timothy_03.sql (S235 1 Timothy 3) -----
-- =====================================================================
-- S235 minion — 1 TIMOTHY 3 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 1 TIMOTHY 3 (16 verses) — the qualifications of overseers and deacons,
-- the house of Elohim, and the great mystery of godliness.
-- Tag: t235c3 (temp view _s235_t235c3_lookup).
-- Sort band: floor 8450, 25-wide (8450, 8451, 8452 used; under 8475).
-- Source is ALWAYS the canon 1 Timothy verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME — Paul charges Timothy how men ought to *behave in the house of Elohim (God),
-- which is the church of the living Elohim (God), the pillar and ground of the truth* (3:15), and
-- then names that truth's heart: *great is the mystery of godliness: Elohim (God) was manifest in
-- the flesh* (3:16). ★★ 3:16 is the Formed Son made manifest — the invisible Father made visible in
-- the Son who bears his Name and glory, the twin of *the image of the invisible Elohim (God)*
-- (Colossians 1:15) and of the kenosis hymn (Philippians 2:6-9) and of *the Word was made flesh*
-- (John 1:14). The Father is the one invisible Elohim; the Son is the Formed in whom he is made
-- manifest. *Received up into glory* is the exaltation BY the Father. This is NOT proof of a
-- co-equal-persons trinity and NOT a modalist collapse — it is the mystery of the invisible Elohim
-- made manifest in his Formed Son. The Hebrew library held the same: the Elect One / Son of Adam
-- *chosen and hidden before Him, before the creation of the world,* whom *the wisdom of Yahuah (God)
-- of Spirits hath revealed* (1 Enoch 48:6-7), *the light of the Gentiles* (48:4) — hidden, then
-- manifest, exactly the mystery Paul confesses. And Daniel saw *one like the Son of Adam* given
-- *dominion, and glory, and a kingdom* (Daniel 7:13-14) — received up into glory.
-- The overseer/deacon qualifications (3:2-3,8) are no innovation either: they re-speak the Torah's
-- own standard for the men set over the people — *able men, such as fear Elohim (God), men of truth,
-- hating covetousness* (Exodus 18:21).
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-3   the office of a bishop; blameless, apt to teach, not greedy of filthy lucre, not covetous
--           Tanakh: Exodus 18:21 (able men, such as fear Elohim, men of truth, hating covetousness)
--           Extras: none warranted   NT: none warranted (carried in the integrity thread)
--   v.4-5   ruling well his own house, that he may take care of the church of Elohim (God)
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted
--   v.6-7   not a novice; the condemnation and snare of the devil; a good report of them without
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted
--   v.8     the deacons grave, not doubletongued, not given to much wine, not greedy of filthy lucre
--           Tanakh: Exodus 18:21 (men of truth, hating covetousness) [folded into the integrity thread]
--           Extras: none warranted   NT: none warranted
--   v.9-13  the mystery of the faith in a pure conscience; proved; a good degree, boldness in faith
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted
--   v.14-15 the house of Elohim, the church of the living Elohim, the pillar and ground of the truth
--           Tanakh: none warranted (the on-ramp to the mystery thread; v.16 carries the weight)
--           Extras: none warranted   NT: none warranted
--   v.16    ★★ great is the mystery of godliness: Elohim was manifest in the flesh... received up
--           Tanakh: Daniel 7:13 (one like the Son of Adam came with the clouds), Daniel 7:14
--                   (there was given him dominion, and glory, and a kingdom)
--           Extras: 1 Enoch 48:6 (chosen and hidden before the creation of the world),
--                   1 Enoch 48:7 (the wisdom of Yahuah of Spirits hath revealed him),
--                   1 Enoch 48:4 (he shall be the light of the Gentiles)
--           NT: Colossians 1:15 (the image of the invisible Elohim), Colossians 1:26 (the mystery
--                   hid... now is made manifest), Philippians 2:6-9 (made himself of no reputation...
--                   highly exalted), John 1:14 (the Word was made flesh, and dwelt among us),
--                   John 1:18 (no man hath seen Elohim... the only begotten Son... hath declared him)
--
-- THREADS (slug -> target libraries):
--   8450 1-timothy-3-the-mystery-of-godliness-elohim-manifest-in-the-flesh-the-formed  (Tanakh + Extras + NT)  [BLESSING CENTERPIECE]
--   8451 1-timothy-3-the-overseer-and-deacon-able-men-that-fear-elohim-hating-covetousness-exodus-18  (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s235_t235c3_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-timothy-3-the-mystery-of-godliness-elohim-manifest-in-the-flesh-the-formed  [BLESSING CENTERPIECE]
  ('canon', '1-timothy', 3, 16, 'canon', 'colossians', 1, 15, 'free', E'*Who is the image of the invisible Elohim (God), the firstborn of every creature:* (Colossians 1:15). Paul confesses *great is the mystery of godliness: Elohim (God) was manifest in the flesh* (1 Timothy 3:16) — and here is its twin. The Father is the *invisible Elohim (God)*; the Son is his *image,* the One in whom the unseen Father is made visible. To say *Elohim (God) was manifest in the flesh* is to say the same thing the Colossian hymn says: the invisible is imaged in the Formed Son, not a second co-equal person but the very glory of the Father borne in his firstborn.'),
  ('canon', '1-timothy', 3, 16, 'canon', 'colossians', 1, 26, 'free', E'*Even the mystery which hath been hid from ages and from generations, but now is made manifest to his saints:* (Colossians 1:26). Paul names *the mystery of godliness* (1 Timothy 3:16) with the same word he uses of *the mystery which hath been hid from ages and from generations, but now is made manifest.* The pattern of the gospel is hidden-then-manifest: the eternal purpose, concealed through the generations, is now unveiled in the Son — *Elohim (God) was manifest in the flesh.* The mystery is not a riddle but a revealing: the invisible Father made manifest in his Formed Son.'),
  ('canon', '1-timothy', 3, 16, 'canon', 'philippians', 2, 7, 'free', E'*But made himself of no reputation, and took upon him the form of a servant, and was made in the likeness of men:* (Philippians 2:7). The mystery that *Elohim (God) was manifest in the flesh* (1 Timothy 3:16) is the descent the kenosis hymn sings: the One *being in the form of Elohim (God)* (Philippians 2:6) *made himself of no reputation... and was made in the likeness of men.* The flesh in which Elohim (God) was manifest is this very emptying — the Formed Son taking the servant''s form, the invisible glory veiled in true humanity.'),
  ('canon', '1-timothy', 3, 16, 'canon', 'philippians', 2, 9, 'free', E'*Wherefore Elohim (God) also hath highly exalted him, and given him a name which is above every name:* (Philippians 2:9). Paul ends the mystery with *received up into glory* (1 Timothy 3:16), and the kenosis hymn names that same lifting: *Elohim (God) also hath highly exalted him, and given him a name which is above every name.* Mark the grammar in both — it is the Father who exalts the Son, *Elohim (God) also hath highly exalted him.* The Son is *received up into glory* by the Father; the exaltation is given, not self-grasped, the Formed lifted by the One who formed him.'),
  ('canon', '1-timothy', 3, 16, 'canon', 'john', 1, 14, 'free', E'*And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* (John 1:14). *Elohim (God) was manifest in the flesh* (1 Timothy 3:16) is the same confession as *the Word was made flesh, and dwelt among us.* And John keeps the order Paul keeps: the glory beheld is *the glory as of the only begotten of the Father* — the Son''s glory is the Father''s glory shown forth in him. The Word made flesh is the invisible Elohim (God) made manifest, the Formed Son full of grace and truth.'),
  ('canon', '1-timothy', 3, 16, 'canon', 'john', 1, 18, 'free', E'*No man hath seen Elohim (God) at any time; the only begotten Son, which is in the bosom of the Father, he hath declared him.* (John 1:18). This is the hinge of the mystery. *No man hath seen Elohim (God) at any time* — the Father is the invisible Elohim (God); yet *the only begotten Son... hath declared him.* So when Paul says *Elohim (God) was manifest in the flesh* (1 Timothy 3:16), he means the unseen Father is *declared,* made manifest, in his Formed Son. The Son does not replace the Father nor stand as a second co-equal; he is the One in whose flesh the invisible Father is at last beheld.'),
  ('canon', '1-timothy', 3, 16, 'canon', 'daniel', 7, 13, 'free', E'*I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him.* (Daniel 7:13). Daniel saw *one like the Son of Adam* brought near before the Ancient of days. The mystery Paul confesses — *Elohim (God) was manifest in the flesh... seen of angels... received up into glory* (1 Timothy 3:16) — is this figure made flesh and then borne back into the presence from which he came. The Son of Adam who *came with the clouds of heaven* and was *brought near before him* is the Formed One manifested and *received up into glory.*'),
  ('canon', '1-timothy', 3, 16, 'canon', 'daniel', 7, 14, 'free', E'*And there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him: his dominion is an everlasting dominion, which shall not pass away, and his kingdom that which shall not be destroyed.* (Daniel 7:14). To the Son of Adam *there was given him dominion, and glory, and a kingdom,* that *all people, nations, and languages, should serve him.* Paul''s mystery runs the same course: *preached unto the Gentiles, believed on in the world, received up into glory* (1 Timothy 3:16). The glory and kingdom *given him* in Daniel are the *received up into glory* of the confession; mark the giving — the dominion and glory are bestowed on the Son by the Ancient of days, the Formed exalted by the Father.'),
  ('canon', '1-timothy', 3, 16, 'enoch', '1-enoch', 48, 6, 'extras', E'*And for this reason hath he been chosen and hidden before Him, Before the creation of the world and for evermore.* (1 Enoch 48:6). The Hebrew library held the very shape of Paul''s mystery. The Son of Adam, the Elect One, *hath been chosen and hidden before Him, Before the creation of the world* — hidden first, as Paul''s mystery is *hid from ages.* The *mystery of godliness: Elohim (God) was manifest in the flesh* (1 Timothy 3:16) is the unveiling of the One long hidden in the Father''s purpose: chosen and concealed before the world was, then made manifest in due time.'),
  ('canon', '1-timothy', 3, 16, 'enoch', '1-enoch', 48, 7, 'extras', E'*And the wisdom of Yahuah (God) of Spirits hath revealed him to the holy and righteous; For he hath preserved the lot of the righteous, Because they have hated and despised this world of unrighteousness... For in his name they are saved.* (1 Enoch 48:7). The One hidden before the world is now *revealed* — *the wisdom of Yahuah (God) of Spirits hath revealed him to the holy and righteous.* This is the hidden-then-manifest pattern of Paul''s confession: *Elohim (God) was manifest in the flesh... believed on in the world* (1 Timothy 3:16). The Elect One revealed, in whose name *they are saved,* is the Formed Son made manifest and believed on — the same mystery, the invisible One''s chosen Son unveiled.'),
  ('canon', '1-timothy', 3, 16, 'enoch', '1-enoch', 48, 4, 'extras', E'*He shall be a staff to the righteous whereon to stay themselves and not fall, And he shall be the light of the Gentiles, And the hope of those who are troubled of heart.* (1 Enoch 48:4). Paul''s mystery moves outward: *preached unto the Gentiles, believed on in the world* (1 Timothy 3:16). The library foresaw it: the Son of Adam *shall be the light of the Gentiles, And the hope of those who are troubled of heart.* The One manifest in the flesh and received up into glory is the very *light of the Gentiles* Enoch named — the hidden Elect One revealed, preached to the nations and believed on in the world.'),
  -- thread: 1-timothy-3-the-overseer-and-deacon-able-men-that-fear-elohim-hating-covetousness-exodus-18
  ('canon', '1-timothy', 3, 2, 'canon', 'exodus', 18, 21, 'free', E'*Moreover thou shalt provide out of all the people able men, such as fear Elohim (God), men of truth, hating covetousness; and place such over them, to be rulers of thousands, and rulers of hundreds, rulers of fifties, and rulers of tens:* (Exodus 18:21). When Jethro counselled Moses how to set men over Yashar''el (Israel), the standard was the same one Paul lays on the overseer: *A bishop then must be blameless... vigilant, sober, of good behaviour... apt to teach* (1 Timothy 3:2). The Torah''s qualifications — *able men, such as fear Elohim (God), men of truth, hating covetousness* — are the root of Paul''s; the apostle does not invent a new order but binds on the assembly the proven measure of those who lead Elohim (God)''s people.'),
  ('canon', '1-timothy', 3, 3, 'canon', 'exodus', 18, 21, 'free', E'*Moreover thou shalt provide out of all the people able men, such as fear Elohim (God), men of truth, hating covetousness; and place such over them...* (Exodus 18:21). Paul presses the same nerve the Torah pressed: the man set over Elohim (God)''s people must be *not greedy of filthy lucre... not covetous* (1 Timothy 3:3). Jethro''s charge to choose *men of truth, hating covetousness* is precisely this — the leader who loves money cannot be trusted with the flock. The overseer''s freedom from greed is no new rule but the ancient standard for the rulers of thousands and of tens.'),
  ('canon', '1-timothy', 3, 8, 'canon', 'exodus', 18, 21, 'free', E'*Likewise must the deacons be grave, not doubletongued, not given to much wine, not greedy of filthy lucre;* (1 Timothy 3:8). The deacons too are held to the Torah''s measure for those who serve the people. *Men of truth, hating covetousness* (Exodus 18:21) is what *not doubletongued* and *not greedy of filthy lucre* spell out — a single, honest tongue and hands clean of greed. The same standard Jethro gave Moses for the rulers of Yashar''el (Israel) governs both overseer and deacon in the house of Elohim (God).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s235_t235c3_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s235_t235c3_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-timothy-3-the-mystery-of-godliness-elohim-manifest-in-the-flesh-the-formed',
       E'The mystery of godliness: Elohim (God) manifest in the flesh — the Formed (Colossians 1, Philippians 2, John 1, Daniel 7, 1 Enoch 48)',
       E'Paul tells Timothy how men ought *to behave... in the house of Elohim (God), which is the church of the living Elohim (God), the pillar and ground of the truth* (1 Timothy 3:15) — and then names the truth that house is pillar to: *And without controversy great is the mystery of godliness: Elohim (God) was manifest in the flesh, justified in the Spirit, seen of angels, preached unto the Gentiles, believed on in the world, received up into glory* (1 Timothy 3:16). This is the heart of the confession, and it must be read for what it is: the invisible Father made manifest in his Formed Son. It is the twin of the Colossian hymn — *Who is the image of the invisible Elohim (God), the firstborn of every creature* (Colossians 1:15): the Father is the *invisible Elohim (God),* the Son is his *image,* the One in whom the unseen is made visible. To say *Elohim (God) was manifest in the flesh* is to say the same thing, no more and no less — not a second co-equal person, but the very glory of the invisible Father borne in his Formed Son. John keeps the same order: *the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father)* (John 1:14), and most plainly, *No man hath seen Elohim (God) at any time; the only begotten Son, which is in the bosom of the Father, he hath declared him* (John 1:18). The Father is the unseen One; the Son *declares* him — made him manifest. The mystery is hidden-then-revealed: *the mystery which hath been hid from ages and from generations, but now is made manifest to his saints* (Colossians 1:26). And *received up into glory* is the exaltation BY the Father — the descent and lifting of the kenosis hymn: the One *being in the form of Elohim (God)... made himself of no reputation, and took upon him the form of a servant, and was made in the likeness of men* (Philippians 2:6-7), wherefore *Elohim (God) also hath highly exalted him, and given him a name which is above every name* (Philippians 2:9). Mark the grammar — it is the Father who exalts; the Son is received up, not self-grasping. The Hebrew library held the very shape of this mystery. The Son of Adam, the Elect One, *hath been chosen and hidden before Him, Before the creation of the world* (1 Enoch 48:6) — hidden, as Paul''s mystery is hid from ages; and then *the wisdom of Yahuah (God) of Spirits hath revealed him to the holy and righteous* (1 Enoch 48:7), made manifest, *for in his name they are saved.* He *shall be the light of the Gentiles* (1 Enoch 48:4) — *preached unto the Gentiles, believed on in the world.* And Daniel saw the end of it: *one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days* (Daniel 7:13), to whom *there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him* (Daniel 7:14) — the glory *given him,* the Formed *received up into glory* by the Ancient of days. Harmonized: the great mystery of godliness is the one invisible Father made manifest in his Formed Son — emptied into flesh, justified in the Spirit, preached to the nations, and received up into the glory the Father gave him. It is no proof of co-equal persons and no modalist collapse; it is the unveiling of the long-hidden Elect One, the image of the invisible Elohim (God).',
       sv.verse_id, ev.verse_id, 'extras', 8450
  FROM _s235_t235c3_lookup sv, _s235_t235c3_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=3 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='1-timothy' AND ev.chapter_number=3 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-timothy-3-the-overseer-and-deacon-able-men-that-fear-elohim-hating-covetousness-exodus-18',
       E'The overseer and deacon: able men that fear Elohim (God), hating covetousness (Exodus 18)',
       E'The qualifications Paul lays on overseer and deacon are not an apostolic novelty but the Torah''s own measure for the men set over Elohim (God)''s people. *A bishop then must be blameless... vigilant, sober, of good behaviour, given to hospitality, apt to teach; Not given to wine, no striker, not greedy of filthy lucre... not covetous* (1 Timothy 3:2-3); and *Likewise must the deacons be grave, not doubletongued, not given to much wine, not greedy of filthy lucre* (1 Timothy 3:8). When Jethro counselled Moses how to set rulers over Yashar''el (Israel), he gave the same standard: *Moreover thou shalt provide out of all the people able men, such as fear Elohim (God), men of truth, hating covetousness; and place such over them, to be rulers of thousands, and rulers of hundreds, rulers of fifties, and rulers of tens* (Exodus 18:21). *Able men* — apt, capable, blameless; *such as fear Elohim (God)* — of good behaviour and sober; *men of truth* — not doubletongued; *hating covetousness* — not greedy of filthy lucre, not covetous. The leader who loves money cannot be trusted with the flock, and the man with a divided tongue cannot guard the truth. Paul binds on the house of Elohim (God) the proven measure given to Moses at the mountain: the same character required of those who judged Yashar''el (Israel) is required of those who shepherd the assembly — one continuous standard for the rulers of the people of Elohim (God).',
       sv.verse_id, ev.verse_id, 'free', 8451
  FROM _s235_t235c3_lookup sv, _s235_t235c3_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=3 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='1-timothy' AND ev.chapter_number=3 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-timothy-3-the-mystery-of-godliness-elohim-manifest-in-the-flesh-the-formed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Colossians 1:15 — *Who is the image of the invisible Elohim (God), the firstborn of every creature* the twin confession; the invisible Father imaged in the Formed Son, *Elohim (God)... manifest in the flesh* (1 Timothy 3:16).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c3_lookup sv, _s235_t235c3_lookup tv
 WHERE t.slug='1-timothy-3-the-mystery-of-godliness-elohim-manifest-in-the-flesh-the-formed'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=3 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=1 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Colossians 1:26 — *the mystery which hath been hid from ages and from generations, but now is made manifest* the same hidden-then-manifest pattern as *the mystery of godliness* (1 Timothy 3:16).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c3_lookup sv, _s235_t235c3_lookup tv
 WHERE t.slug='1-timothy-3-the-mystery-of-godliness-elohim-manifest-in-the-flesh-the-formed'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=3 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=1 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Philippians 2:7 — *made himself of no reputation, and took upon him the form of a servant, and was made in the likeness of men* the descent into the flesh in which *Elohim (God) was manifest* (1 Timothy 3:16).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c3_lookup sv, _s235_t235c3_lookup tv
 WHERE t.slug='1-timothy-3-the-mystery-of-godliness-elohim-manifest-in-the-flesh-the-formed'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=3 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Philippians 2:9 — *Elohim (God) also hath highly exalted him, and given him a name which is above every name* the Father''s exaltation behind *received up into glory* (1 Timothy 3:16); the Son lifted by the One who formed him.'
  FROM cross_reference_threads t, cross_references x, _s235_t235c3_lookup sv, _s235_t235c3_lookup tv
 WHERE t.slug='1-timothy-3-the-mystery-of-godliness-elohim-manifest-in-the-flesh-the-formed'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=3 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'John 1:14 — *the Word was made flesh, and dwelt among us... the glory as of the only begotten of the Father* the same confession as *Elohim (God) was manifest in the flesh* (1 Timothy 3:16); the Son''s glory is the Father''s glory shown forth.'
  FROM cross_reference_threads t, cross_references x, _s235_t235c3_lookup sv, _s235_t235c3_lookup tv
 WHERE t.slug='1-timothy-3-the-mystery-of-godliness-elohim-manifest-in-the-flesh-the-formed'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=3 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'John 1:18 — *No man hath seen Elohim (God) at any time; the only begotten Son... hath declared him* the hinge: the invisible Father declared, made manifest, in his Formed Son (1 Timothy 3:16).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c3_lookup sv, _s235_t235c3_lookup tv
 WHERE t.slug='1-timothy-3-the-mystery-of-godliness-elohim-manifest-in-the-flesh-the-formed'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=3 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Daniel 7:13 — *one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days* the Formed One made flesh and borne back to the presence; *received up into glory* (1 Timothy 3:16).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c3_lookup sv, _s235_t235c3_lookup tv
 WHERE t.slug='1-timothy-3-the-mystery-of-godliness-elohim-manifest-in-the-flesh-the-formed'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=3 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'Daniel 7:14 — *there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him* the glory GIVEN the Son by the Ancient of days; *preached unto the Gentiles... received up into glory* (1 Timothy 3:16).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c3_lookup sv, _s235_t235c3_lookup tv
 WHERE t.slug='1-timothy-3-the-mystery-of-godliness-elohim-manifest-in-the-flesh-the-formed'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=3 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 9, E'1 Enoch 48:6 — *for this reason hath he been chosen and hidden before Him, Before the creation of the world* the Elect One hidden, as the mystery is *hid from ages* before it is *manifest in the flesh* (1 Timothy 3:16).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c3_lookup sv, _s235_t235c3_lookup tv
 WHERE t.slug='1-timothy-3-the-mystery-of-godliness-elohim-manifest-in-the-flesh-the-formed'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=3 AND sv.verse_number=16
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=48 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 10, E'1 Enoch 48:7 — *the wisdom of Yahuah (God) of Spirits hath revealed him to the holy and righteous... For in his name they are saved* the One hidden now revealed; *Elohim (God) was manifest in the flesh... believed on in the world* (1 Timothy 3:16).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c3_lookup sv, _s235_t235c3_lookup tv
 WHERE t.slug='1-timothy-3-the-mystery-of-godliness-elohim-manifest-in-the-flesh-the-formed'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=3 AND sv.verse_number=16
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=48 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 11, E'1 Enoch 48:4 — *he shall be the light of the Gentiles, And the hope of those who are troubled of heart* the Elect One foreseen for the nations; *preached unto the Gentiles, believed on in the world* (1 Timothy 3:16).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c3_lookup sv, _s235_t235c3_lookup tv
 WHERE t.slug='1-timothy-3-the-mystery-of-godliness-elohim-manifest-in-the-flesh-the-formed'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=3 AND sv.verse_number=16
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=48 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-timothy-3-the-overseer-and-deacon-able-men-that-fear-elohim-hating-covetousness-exodus-18
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 18:21 — *able men, such as fear Elohim (God), men of truth, hating covetousness* the Torah''s measure for the rulers of the people, behind *A bishop then must be blameless... apt to teach* (1 Timothy 3:2).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c3_lookup sv, _s235_t235c3_lookup tv
 WHERE t.slug='1-timothy-3-the-overseer-and-deacon-able-men-that-fear-elohim-hating-covetousness-exodus-18'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=3 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=18 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 18:21 — *men of truth, hating covetousness* the leader who loves money cannot be trusted; behind *not greedy of filthy lucre... not covetous* (1 Timothy 3:3).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c3_lookup sv, _s235_t235c3_lookup tv
 WHERE t.slug='1-timothy-3-the-overseer-and-deacon-able-men-that-fear-elohim-hating-covetousness-exodus-18'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=3 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=18 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 18:21 — *men of truth, hating covetousness* the same standard for the deacons: *not doubletongued... not greedy of filthy lucre* (1 Timothy 3:8).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c3_lookup sv, _s235_t235c3_lookup tv
 WHERE t.slug='1-timothy-3-the-overseer-and-deacon-able-men-that-fear-elohim-hating-covetousness-exodus-18'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=3 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=18 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1timothy_04.sql (S235 1 Timothy 4) -----
-- =====================================================================
-- S235 minion — 1 TIMOTHY 4 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 1 TIMOTHY 4 (16 verses) — THE HIGHEST WATCHPOINT CHAPTER.
-- Tag: t235c4 (temp view _s235_t235c4_lookup).
-- Sort band: floor 8475 (25-wide: 8475, 8476, 8477, 8478 used; under 8500).
-- Source is ALWAYS the canon 1 Timothy verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (Paul's charge to a shepherd; sound doctrine against the strivers; one olive
-- tree, the household of Elohim; NO replacement theology, NO law-vs-grace antithesis). Chapter 4
-- warns of the LATTER-TIME APOSTASY — *seducing spirits, and doctrines of devils* (4:1) — whose
-- mark is the GNOSTIC/ascetic ban that FORBIDS marriage and COMMANDS abstinence from foods, as if
-- matter were evil. Paul's answer is creation-good: *every creature of Elohim (God) is good, and
-- nothing to be refused, if it be received with thanksgiving* (4:4), for it is *sanctified by the
-- word of Elohim (God) and prayer* (4:5). ★★ THIS IS NOT THE ABOLITION OF CLEAN AND UNCLEAN. The
-- food *sanctified by the word of Elohim* is the food the WORD already names as food — the creatures
-- Leviticus 11 / Deuteronomy 14 give for meat — now received with thanksgiving rather than under the
-- ascetic's superstitious ban. *Leviticus 11 / Deuteronomy 14 STAND.* The rebuke is the heresy that
-- calls Elohim's good provision evil, not a repeal of the difference between clean and unclean.
-- Christology kept the Formed frame (no co-equal-persons grammar); v.10 the *living Elohim, who is
-- the Saviour of all men* is the one Elohim of Isaiah 45 *a just Elohim (God) and a Saviour; there
-- is none beside me.*
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-2   the latter times, depart from the faith, seducing spirits and doctrines of devils
--           Tanakh: none warranted (the deceiving-spirits weight is carried by the Hebrew library;
--                   no single Tanakh verse is the load-bearing root of the seducing-spirits motif)
--           Extras: 1 Enoch 19:1 (spirits leading mankind astray into sacrificing to demons as gods),
--                   1 Enoch 99:2 (pervert the words of uprightness, transgress the eternal law,
--                   transform themselves into what they were not), 2 Esdras 5:1-2 (the way of truth
--                   hidden, the land barren of faith, iniquity increased)
--           NT: none warranted (carried in prose; the apostasy thread is extras-bearing)
--   v.3-5   forbidding to marry / abstain from meats; every creature good; sanctified by the word [BLESSING]
--           Tanakh: Genesis 1:31 (it was very good), Genesis 9:3 (every moving thing shall be meat),
--                   Psalm 24:1 (the earth is Yahuah's, and the fulness thereof); GUARD Leviticus 11:47
--                   / Deuteronomy 14:3 STAND (the difference between clean and unclean)
--           Extras: none warranted (the creation-good answer is canon-rooted; extras would dilute)
--           NT: 1 Corinthians 10:30-31 (give thanks; do all to the glory of Elohim)
--   v.6-10  good minister nourished in faith; godliness profitable; the living Elohim Saviour of all
--           Tanakh: Isaiah 45:21-22 (a just Elohim and a Saviour; there is none beside me; be ye
--                   saved, all the ends of the earth), Psalm 145:9 (Yahuah is good to all)
--           Extras: none warranted (Sirach 1:14 fear-of-Yahuah weighed; the godliness here is the
--                   Saviour-of-all motif, not the wisdom-incipit; held back to avoid forcing)
--           NT: none warranted (carried in prose)
--   v.11-12 command and teach; let no man despise thy youth; be an example
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted
--   v.13-16 give attendance to reading; meditate; give thyself wholly; take heed to the doctrine
--           Tanakh: Joshua 1:8 (this book of the law... meditate therein day and night),
--                   Psalm 1:2-3 (his delight is in the law of Yahuah... meditate day and night)
--           Extras: none warranted   NT: none warranted (the Scriptures Timothy read = the Tanakh)
--
-- THREADS (slug -> target libraries):
--   8475 1-timothy-4-seducing-spirits-and-doctrines-of-devils-the-latter-time-apostasy-1-enoch-2-esdras  (Extras)
--   8476 1-timothy-4-every-creature-of-elohim-is-good-received-with-thanksgiving-genesis-1               (Tanakh + NT)  [BLESSING]
--   8477 1-timothy-4-the-living-elohim-the-saviour-of-all-men-isaiah-45                                  (Tanakh)
--   8478 1-timothy-4-give-attendance-to-reading-meditate-day-and-night-joshua-1-psalm-1                  (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s235_t235c4_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-timothy-4-seducing-spirits-and-doctrines-of-devils-the-latter-time-apostasy-1-enoch-2-esdras
  ('canon', '1-timothy', 4, 1, 'enoch', '1-enoch', 19, 1, 'extras', E'*And Uriel said to me: ''Here shall stand the angels who have connected themselves with women, and their spirits assuming many different forms are defiling mankind and shall lead them astray into sacrificing to demons as gods, here shall they stand, till the day of the great judgement in which they shall be judged till they are made an end of.* (1 Enoch 19:1). The restored library already named the engine of the latter-time error: spirits *assuming many different forms* that *lead them astray into sacrificing to demons as gods.* Paul writes that *in the latter times some shall depart from the faith, giving heed to seducing spirits, and doctrines of devils* (1 Timothy 4:1). The *seducing spirits* and *doctrines of devils* are these very deceiving spirits of Enoch''s vision — not a new threat but the old work of the fallen, leading men to honour demons under a show of doctrine, until the day of the great judgement makes an end of them.'),
  ('canon', '1-timothy', 4, 1, 'enoch', '1-enoch', 99, 2, 'extras', E'*Woe to them who pervert the words of uprightness, And transgress the eternal law, And transform themselves into what they were not [into sinners]: They shall be trodden under foot upon the earth.* (1 Enoch 99:2). The library marks the apostates of the last days as those who *pervert the words of uprightness* and *transgress the eternal law* — who *transform themselves into what they were not.* This is exactly the departure Paul foresees: *some shall depart from the faith, giving heed to seducing spirits, and doctrines of devils; Speaking lies in hypocrisy; having their conscience seared with a hot iron* (1 Timothy 4:1-2). The conscience *seared* and the lies spoken *in hypocrisy* are the marks of those who pervert the words of uprightness and transgress the eternal law — the same latter-day falling-away, told twice across the one library.'),
  ('canon', '1-timothy', 4, 1, 'apocrypha', '2-esdras', 5, 1, 'extras', E'*Nevertheless as concerning the tokens, behold, the days shall come, that they which dwell upon earth shall be taken in a great number, and the way of truth shall be hidden, and the land shall be barren of faith.* (2 Esdras 5:1). The Hebrew library foretells the same sign of the end: *the way of truth shall be hidden, and the land shall be barren of faith.* Paul speaks of that very season — *in the latter times some shall depart from the faith* (1 Timothy 4:1). The land *barren of faith* is the field in which the *seducing spirits, and doctrines of devils* do their work; the hiding of the way of truth and the departing from the faith are one and the same latter-day apostasy.'),
  ('canon', '1-timothy', 4, 1, 'apocrypha', '2-esdras', 5, 2, 'extras', E'*But iniquity shall be increased above that which now you see, or that you have heard long ago.* (2 Esdras 5:2). The library tells of iniquity *increased above that which now you see* in the last days — the rising tide against which Paul warns Timothy that *in the latter times some shall depart from the faith, giving heed to seducing spirits, and doctrines of devils* (1 Timothy 4:1). The multiplied iniquity and the departure from the faith belong to the same foretold hour; Paul charges the shepherd to hold the assembly in sound doctrine while the deceiving spirits press their lies.'),
  -- thread: 1-timothy-4-every-creature-of-elohim-is-good-received-with-thanksgiving-genesis-1  [BLESSING]
  ('canon', '1-timothy', 4, 4, 'canon', 'genesis', 1, 31, 'free', E'*And Elohim (God) saw every thing that he had made, and, behold, it was very good. And the evening and the morning were the sixth day.* (Genesis 1:31). At the close of creation *Elohim (God) saw every thing that he had made, and, behold, it was very good.* This is the ground of Paul''s answer to the ascetics: *For every creature of Elohim (God) is good, and nothing to be refused, if it be received with thanksgiving* (1 Timothy 4:4). The very-good creation cannot be the evil thing the doctrine of devils makes it; what the Maker pronounced good no man may call defiled. Mark the guard carefully — this rebukes the heresy that calls Elohim''s good provision evil; it does NOT abolish the difference between clean and unclean. The creation is good, and the food the word of Elohim names as food is received now with thanksgiving, not under the ascetic''s superstitious ban.'),
  ('canon', '1-timothy', 4, 3, 'canon', 'genesis', 9, 3, 'free', E'*Every moving thing that liveth shall be meat for you; even as the green herb have I given you all things.* (Genesis 9:3). To Noah, Elohim (God) gave the creatures for food: *every moving thing that liveth shall be meat for you.* Paul rebukes those *commanding to abstain from meats, which Elohim (God) hath created to be received with thanksgiving of them which believe and know the truth* (1 Timothy 4:3). The meats are Elohim''s own gift, *created to be received* — so the ascetic ban that forbids them despises the Giver. This is not a charter to eat what the word forbids; *them which believe and know the truth* are those who receive Elohim''s appointed provision with thanksgiving, the food the word already names for meat.'),
  ('canon', '1-timothy', 4, 4, 'canon', 'psalms', 24, 1, 'free', E'*The earth is the LORD''S, and the fulness thereof; the world, and they that dwell therein.* (Psalm 24:1). *The earth is the LORD''S, and the fulness thereof* — all that fills it is his, and his is good. So Paul declares *every creature of Elohim (God) is good, and nothing to be refused, if it be received with thanksgiving* (1 Timothy 4:4). Because the earth and its fulness belong to Yahuah (LORD), what he gives for food is received as from his hand with thanks; the slander of the ascetic, who calls Elohim''s fulness evil, is overturned by the simple confession that the earth is his.'),
  ('canon', '1-timothy', 4, 4, 'canon', '1-corinthians', 10, 30, 'free', E'*For if I by grace be a partaker, why am I evil spoken of for that for which I give thanks?* (1 Corinthians 10:30). Paul had already bound eating to thanksgiving: *if I by grace be a partaker,* the food is received *for that for which I give thanks.* The same principle answers the ascetics here — *every creature of Elohim (God) is good, and nothing to be refused, if it be received with thanksgiving* (1 Timothy 4:4). The thanksgiving is the key: the partaker who blesses Elohim (God) over the food the word gives him receives it as the good gift it is, not as the defilement the doctrine of devils pretends.'),
  ('canon', '1-timothy', 4, 5, 'canon', '1-corinthians', 10, 31, 'free', E'*Whether therefore ye eat, or drink, or whatsoever ye do, do all to the glory of Elohim (God).* (1 Corinthians 10:31). The whole of life, eating and drinking included, is to be done *to the glory of Elohim (God).* This is why food is *sanctified by the word of Elohim (God) and prayer* (1 Timothy 4:5): received to his glory, with the word that names it for food and the prayer of thanksgiving over it, the meal becomes a holy thing. To eat to his glory with thanks is the opposite of the superstitious abstinence Paul rebukes — and the opposite, too, of treating the word''s own distinctions as nothing.'),
  -- thread: 1-timothy-4-the-living-elohim-the-saviour-of-all-men-isaiah-45
  ('canon', '1-timothy', 4, 10, 'canon', 'isaiah', 45, 21, 'free', E'*Tell ye, and bring them near; yea, let them take counsel together: who hath declared this from ancient time? who hath told it from that time? have not I Yahuah (LORD)? and there is no Elohim (God) else beside me; a just Elohim (God) and a Saviour; there is none beside me.* (Isaiah 45:21). Yahuah (LORD) names himself *a just Elohim (God) and a Saviour; there is none beside me.* Paul trusts in this same One: *we trust in the living Elohim (God), who is the Saviour of all men, specially of those that believe* (1 Timothy 4:10). The *Saviour of all men* is the *just Elohim and a Saviour* of Isaiah — the one living Elohim beside whom there is no other, whose salvation reaches out to all the ends of the earth and rests upon those who believe.'),
  ('canon', '1-timothy', 4, 10, 'canon', 'isaiah', 45, 22, 'free', E'*Look unto me, and be ye saved, all the ends of the earth: for I am Elohim (God), and there is none else.* (Isaiah 45:22). The call goes out to the whole world: *Look unto me, and be ye saved, all the ends of the earth.* This is the breadth Paul confesses — *the living Elohim (God), who is the Saviour of all men, specially of those that believe* (1 Timothy 4:10). The Saviour of all men is the One who bids all the ends of the earth look to him and be saved; the *specially of those that believe* is the *be ye saved* answered by those who turn and look. One Elohim, none else, the Saviour held out to all and laid hold of by faith.'),
  ('canon', '1-timothy', 4, 10, 'canon', 'psalms', 145, 9, 'free', E'*Yahuah (LORD) is good to all: and his tender mercies are over all his works.* (Psalm 145:9). *Yahuah (LORD) is good to all,* his mercies *over all his works.* So Paul names him *the living Elohim (God), who is the Saviour of all men, specially of those that believe* (1 Timothy 4:10). The goodness that reaches all his works is the saving goodness reaching all men; the living Elohim whose tender mercies cover creation is the Saviour in whom the labouring and reproached servant trusts.'),
  -- thread: 1-timothy-4-give-attendance-to-reading-meditate-day-and-night-joshua-1-psalm-1
  ('canon', '1-timothy', 4, 13, 'canon', 'joshua', 1, 8, 'free', E'*This book of the law shall not depart out of thy mouth; but thou shalt meditate therein day and night, that thou mayest observe to do according to all that is written therein: for then thou shalt make thy way prosperous, and then thou shalt have good success.* (Joshua 1:8). To Joshua, Yahuah (LORD) charged that *this book of the law shall not depart out of thy mouth; but thou shalt meditate therein day and night.* Paul lays the same charge on Timothy: *Till I come, give attendance to reading, to exhortation, to doctrine* (1 Timothy 4:13), and *Meditate upon these things; give thyself wholly to them* (1 Timothy 4:15). The reading Timothy attends to is the Scriptures he had — the book of the law and the prophets; the meditation Paul commands is the meditation Joshua was given, the unbroken attending to the word that makes the way prosperous.'),
  ('canon', '1-timothy', 4, 15, 'canon', 'psalms', 1, 2, 'free', E'*But his delight is in the law of Yahuah (LORD); and in his law doth he meditate day and night.* (Psalm 1:2). The blessed man''s *delight is in the law of Yahuah (LORD); and in his law doth he meditate day and night.* Paul charges Timothy, *Meditate upon these things; give thyself wholly to them; that thy profiting may appear to all* (1 Timothy 4:15). The meditation that profits is the meditation of the first psalm — delighting in the law of Yahuah (LORD) without ceasing — for the man who so meditates *shall be like a tree planted by the rivers of water... and whatsoever he doeth shall prosper* (Psalm 1:3), the very profiting Paul says will appear to all.'),
  ('canon', '1-timothy', 4, 16, 'canon', 'psalms', 1, 3, 'free', E'*And he shall be like a tree planted by the rivers of water, that bringeth forth his fruit in his season; his leaf also shall not wither; and whatsoever he doeth shall prosper.* (Psalm 1:3). The man who meditates in the law is *like a tree planted by the rivers of water... and whatsoever he doeth shall prosper.* Paul promises the like fruit to the shepherd who attends to the word: *Take heed unto thyself, and unto the doctrine; continue in them: for in doing this thou shalt both save thyself, and them that hear thee* (1 Timothy 4:16). The continuing in the doctrine is the planting by the rivers; the saving of self and hearers is the fruit that does not wither — the prospering of the one whose delight is in the law of Yahuah (LORD).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s235_t235c4_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s235_t235c4_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-timothy-4-seducing-spirits-and-doctrines-of-devils-the-latter-time-apostasy-1-enoch-2-esdras',
       E'Seducing spirits and doctrines of devils: the latter-time apostasy (1 Enoch, 2 Esdras)',
       E'Paul opens the chapter with a warning the whole library had already sounded: *Now the Spirit speaketh expressly, that in the latter times some shall depart from the faith, giving heed to seducing spirits, and doctrines of devils; Speaking lies in hypocrisy; having their conscience seared with a hot iron* (1 Timothy 4:1-2). The *seducing spirits* are no new menace. The restored library names their work plainly: *their spirits assuming many different forms are defiling mankind and shall lead them astray into sacrificing to demons as gods* (1 Enoch 19:1) — the fallen, leading men to honour demons under a show of doctrine, *till the day of the great judgement.* And the library marks the apostates of the last days as those who *pervert the words of uprightness, And transgress the eternal law, And transform themselves into what they were not* (1 Enoch 99:2) — the perverted word and the seared conscience are one. The signs of the season match as well: *the days shall come... and the way of truth shall be hidden, and the land shall be barren of faith* (2 Esdras 5:1), for *iniquity shall be increased above that which now you see* (2 Esdras 5:2). The land barren of faith is the field where the doctrines of devils take root, and the departing from the faith is the hiding of the way of truth. Against this foretold hour Paul charges the shepherd to hold the assembly in sound doctrine — for the latter-time deceit is the old work of deceiving spirits, told across the one library and now pressing upon Timothy''s own day.',
       sv.verse_id, ev.verse_id, 'extras', 8475
  FROM _s235_t235c4_lookup sv, _s235_t235c4_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=4 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='1-timothy' AND ev.chapter_number=4 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-timothy-4-every-creature-of-elohim-is-good-received-with-thanksgiving-genesis-1',
       E'Every creature of Elohim is good, received with thanksgiving (Genesis 1)',
       E'Against the doctrine of devils that is *Forbidding to marry, and commanding to abstain from meats* (1 Timothy 4:3), Paul sets the creation itself. The meats are *which Elohim (God) hath created to be received with thanksgiving of them which believe and know the truth* (1 Timothy 4:3), *For every creature of Elohim (God) is good, and nothing to be refused, if it be received with thanksgiving: For it is sanctified by the word of Elohim (God) and prayer* (1 Timothy 4:4-5). The root is the verdict spoken at the close of the sixth day: *And Elohim (God) saw every thing that he had made, and, behold, it was very good* (Genesis 1:31). What the Maker pronounced *very good* no man may call defiled; the ascetic ban that names Elohim''s good provision evil is the slander Paul rebukes. The creatures were given for food to Noah — *Every moving thing that liveth shall be meat for you; even as the green herb have I given you all things* (Genesis 9:3) — and *The earth is the LORD''S, and the fulness thereof* (Psalm 24:1), so what he gives is received as from his hand. Paul had already bound eating to thanksgiving: *if I by grace be a partaker, why am I evil spoken of for that for which I give thanks?* (1 Corinthians 10:30), and *Whether therefore ye eat, or drink, or whatsoever ye do, do all to the glory of Elohim (God)* (1 Corinthians 10:31). Mark the guard with care. This is NOT the abolition of clean and unclean. The food *sanctified by the word of Elohim* is the food the WORD already names as food — the creatures Yahuah (LORD) gave for meat, the difference between clean and unclean still standing: *To make a difference between the unclean and the clean, and between the beast that may be eaten and the beast that may not be eaten* (Leviticus 11:47), *Thou shalt not eat any abominable thing* (Deuteronomy 14:3). Leviticus 11 and Deuteronomy 14 stand. What Paul overturns is the heresy that calls creation evil and forbids what Elohim made good; *them which believe and know the truth* are those who receive Elohim''s appointed provision with thanksgiving, sanctified by the word that names it for food and by the prayer of blessing over it.',
       sv.verse_id, ev.verse_id, 'free', 8476
  FROM _s235_t235c4_lookup sv, _s235_t235c4_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=4 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='1-timothy' AND ev.chapter_number=4 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-timothy-4-the-living-elohim-the-saviour-of-all-men-isaiah-45',
       E'The living Elohim, the Saviour of all men (Isaiah 45)',
       E'Paul gives the reason he and his fellows labour and endure reproach: *For therefore we both labour and suffer reproach, because we trust in the living Elohim (God), who is the Saviour of all men, specially of those that believe* (1 Timothy 4:10). The *Saviour of all men* is no new name for Elohim. Yahuah (LORD) declared it through Isaiah: *there is no Elohim (God) else beside me; a just Elohim (God) and a Saviour; there is none beside me* (Isaiah 45:21), and his salvation is held out to the whole world — *Look unto me, and be ye saved, all the ends of the earth: for I am Elohim (God), and there is none else* (Isaiah 45:22). The one living Elohim, beside whom there is no other, is the Saviour whose call reaches all the ends of the earth and whose salvation rests upon those who look and believe — Paul''s *specially of those that believe.* And the breadth of his goodness is the breadth the psalmist sang: *Yahuah (LORD) is good to all: and his tender mercies are over all his works* (Psalm 145:9). The goodness over all his works is the saving goodness offered to all men; the living Elohim whose mercies cover creation is the One in whom the labouring servant trusts.',
       sv.verse_id, ev.verse_id, 'free', 8477
  FROM _s235_t235c4_lookup sv, _s235_t235c4_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=4 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='1-timothy' AND ev.chapter_number=4 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-timothy-4-give-attendance-to-reading-meditate-day-and-night-joshua-1-psalm-1',
       E'Give attendance to reading; meditate day and night (Joshua 1, Psalm 1)',
       E'Paul charges the young shepherd to live in the word: *Till I come, give attendance to reading, to exhortation, to doctrine* (1 Timothy 4:13); *Meditate upon these things; give thyself wholly to them; that thy profiting may appear to all* (1 Timothy 4:15); *Take heed unto thyself, and unto the doctrine; continue in them: for in doing this thou shalt both save thyself, and them that hear thee* (1 Timothy 4:16). The reading Timothy attends to is the Scriptures he had — the law and the prophets — and the charge to meditate is the charge given of old. To Joshua, Yahuah (LORD) said *This book of the law shall not depart out of thy mouth; but thou shalt meditate therein day and night, that thou mayest observe to do according to all that is written therein: for then thou shalt make thy way prosperous* (Joshua 1:8). And the blessed man of the first psalm is the man whose *delight is in the law of Yahuah (LORD); and in his law doth he meditate day and night* (Psalm 1:2), who *shall be like a tree planted by the rivers of water, that bringeth forth his fruit in his season... and whatsoever he doeth shall prosper* (Psalm 1:3). The meditation that profits Timothy and saves his hearers is the unbroken meditation in the word that made Joshua''s way prosperous and made the psalmist''s man fruitful — the same word, the same delight, the same fruit that does not wither.',
       sv.verse_id, ev.verse_id, 'free', 8478
  FROM _s235_t235c4_lookup sv, _s235_t235c4_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=4 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='1-timothy' AND ev.chapter_number=4 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    -- seducing spirits / latter-time apostasy
    ('1-timothy-4-seducing-spirits-and-doctrines-of-devils-the-latter-time-apostasy-1-enoch-2-esdras', 'canon','1-timothy',4,1, 'enoch','1-enoch',19,1, 1, E'1 Enoch 19:1 — the deceiving spirits *assuming many different forms... lead them astray into sacrificing to demons as gods,* the very *seducing spirits, and doctrines of devils* of 1 Timothy 4:1.'),
    ('1-timothy-4-seducing-spirits-and-doctrines-of-devils-the-latter-time-apostasy-1-enoch-2-esdras', 'canon','1-timothy',4,1, 'enoch','1-enoch',99,2, 2, E'1 Enoch 99:2 — the apostates *pervert the words of uprightness, And transgress the eternal law, And transform themselves into what they were not,* matching the *lies in hypocrisy* and *conscience seared* of 1 Timothy 4:1-2.'),
    ('1-timothy-4-seducing-spirits-and-doctrines-of-devils-the-latter-time-apostasy-1-enoch-2-esdras', 'canon','1-timothy',4,1, 'apocrypha','2-esdras',5,1, 3, E'2 Esdras 5:1 — *the way of truth shall be hidden, and the land shall be barren of faith,* the same departing from the faith Paul names at 1 Timothy 4:1.'),
    ('1-timothy-4-seducing-spirits-and-doctrines-of-devils-the-latter-time-apostasy-1-enoch-2-esdras', 'canon','1-timothy',4,1, 'apocrypha','2-esdras',5,2, 4, E'2 Esdras 5:2 — *iniquity shall be increased above that which now you see,* the rising tide of the latter-time apostasy of 1 Timothy 4:1.'),
    -- every creature good [BLESSING]
    ('1-timothy-4-every-creature-of-elohim-is-good-received-with-thanksgiving-genesis-1', 'canon','1-timothy',4,4, 'canon','genesis',1,31, 1, E'Genesis 1:31 — *behold, it was very good,* the creation-verdict that grounds *every creature of Elohim (God) is good* (1 Timothy 4:4). The very-good creation cannot be the evil thing the ascetics make it.'),
    ('1-timothy-4-every-creature-of-elohim-is-good-received-with-thanksgiving-genesis-1', 'canon','1-timothy',4,3, 'canon','genesis',9,3, 2, E'Genesis 9:3 — *every moving thing that liveth shall be meat for you,* Elohim''s own gift of the creatures for food, against those *commanding to abstain from meats* (1 Timothy 4:3).'),
    ('1-timothy-4-every-creature-of-elohim-is-good-received-with-thanksgiving-genesis-1', 'canon','1-timothy',4,4, 'canon','psalms',24,1, 3, E'Psalm 24:1 — *the earth is the LORD''S, and the fulness thereof,* so his good gift is received from his hand, never refused as defiled (1 Timothy 4:4).'),
    ('1-timothy-4-every-creature-of-elohim-is-good-received-with-thanksgiving-genesis-1', 'canon','1-timothy',4,4, 'canon','1-corinthians',10,30, 4, E'1 Corinthians 10:30 — *for that for which I give thanks,* the thanksgiving that receives the food as Elohim''s good gift (1 Timothy 4:4).'),
    ('1-timothy-4-every-creature-of-elohim-is-good-received-with-thanksgiving-genesis-1', 'canon','1-timothy',4,5, 'canon','1-corinthians',10,31, 5, E'1 Corinthians 10:31 — *do all to the glory of Elohim (God),* why the food is *sanctified by the word of Elohim (God) and prayer* (1 Timothy 4:5).'),
    -- saviour of all men
    ('1-timothy-4-the-living-elohim-the-saviour-of-all-men-isaiah-45', 'canon','1-timothy',4,10, 'canon','isaiah',45,21, 1, E'Isaiah 45:21 — *a just Elohim (God) and a Saviour; there is none beside me,* the one living Elohim who is *the Saviour of all men* (1 Timothy 4:10).'),
    ('1-timothy-4-the-living-elohim-the-saviour-of-all-men-isaiah-45', 'canon','1-timothy',4,10, 'canon','isaiah',45,22, 2, E'Isaiah 45:22 — *be ye saved, all the ends of the earth,* the breadth of the Saviour of all men, answered by those who believe (1 Timothy 4:10).'),
    ('1-timothy-4-the-living-elohim-the-saviour-of-all-men-isaiah-45', 'canon','1-timothy',4,10, 'canon','psalms',145,9, 3, E'Psalm 145:9 — *Yahuah (LORD) is good to all: and his tender mercies are over all his works,* the saving goodness reaching all men (1 Timothy 4:10).'),
    -- meditate / reading
    ('1-timothy-4-give-attendance-to-reading-meditate-day-and-night-joshua-1-psalm-1', 'canon','1-timothy',4,13, 'canon','joshua',1,8, 1, E'Joshua 1:8 — *thou shalt meditate therein day and night,* the charge to live in the book of the law that lies behind *give attendance to reading* (1 Timothy 4:13).'),
    ('1-timothy-4-give-attendance-to-reading-meditate-day-and-night-joshua-1-psalm-1', 'canon','1-timothy',4,15, 'canon','psalms',1,2, 2, E'Psalm 1:2 — *in his law doth he meditate day and night,* the delight-meditation behind *Meditate upon these things; give thyself wholly to them* (1 Timothy 4:15).'),
    ('1-timothy-4-give-attendance-to-reading-meditate-day-and-night-joshua-1-psalm-1', 'canon','1-timothy',4,16, 'canon','psalms',1,3, 3, E'Psalm 1:3 — *whatsoever he doeth shall prosper,* the fruit of the man planted by the word, matching *thou shalt both save thyself, and them that hear thee* (1 Timothy 4:16).')
  ) AS m(thread_slug, src_edition, src_slug, src_ch, src_v, tgt_edition, tgt_slug, tgt_ch, tgt_v, sort_order, member_note)
  JOIN cross_reference_threads t ON t.slug = m.thread_slug
  JOIN _s235_t235c4_lookup sv ON sv.edition_slug=m.src_edition AND sv.book_slug=m.src_slug AND sv.chapter_number=m.src_ch AND sv.verse_number=m.src_v
  JOIN _s235_t235c4_lookup tv ON tv.edition_slug=m.tgt_edition AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1timothy_05.sql (S235 1 Timothy 5) -----
-- =====================================================================
-- S235 minion — 1 TIMOTHY 5 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 1 TIMOTHY 5 (25 verses) — the honour of elders and widows, with the TORAH'S OWN WITNESSES.
-- Tag: t235c5 (temp view _s235_t235c5_lookup).
-- Sort band: floor 8500 (25-wide: 8500, 8501, 8502 used; under 8525).
-- Source is ALWAYS the canon 1 Timothy verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (the apostle's charge to a shepherd; the law is GOOD, used lawfully — NOT abolished).
-- This chapter is the clearest place in the letter where Paul reaches straight into the Torah and binds
-- it on the assembly AS SCRIPTURE. He orders the household of Elohim by the same statutes Yahuah (LORD)
-- gave at Sinai: rise up before the hoary head (5:1 / Leviticus 19:32); defend the widow (5:3 / Exodus
-- 22:22, Deuteronomy 10:18); and — the load-bearing center — *For the scripture saith, Thou shalt not
-- muzzle the ox that treadeth out the corn. And, The labourer is worthy of his reward* (5:18), a DIRECT
-- quotation of Deuteronomy 25:4 with the wage-law of Leviticus 19:13, the Torah called *scripture* and
-- made the rule for the elders' double honour; and *Against an elder receive not an accusation, but
-- before two or three witnesses* (5:19), the witness-rule of Deuteronomy 19:15 bound on the church.
-- NO replacement theology, no law-vs-grace antithesis: the Torah is the apostle's authority here, quoted
-- by name and applied to the gathered. NT-Lord rule preserved exactly as the pull renders each place.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-2   rebuke not an elder, but intreat him as a father; elder women as mothers
--           Tanakh: Leviticus 19:32 (rise up before the hoary head, honour the face of the old man)
--           Extras: Sirach 3:8 (honour father and mother in word and deed), Sirach 3:12 (help thy
--                   father in his age), Tobit 4:3 (honour thy mother all the days of thy life)
--           NT: none warranted (the honour-the-elder root is the Torah's; carried in prose)
--   v.3-8   honour widows that are widows indeed; provide for thine own or deny the faith
--           Tanakh: Exodus 22:22 (ye shall not afflict any widow), Deuteronomy 10:18 (he doth execute
--                   the judgment of the fatherless and widow)
--           Extras: Sirach 4:10 (be as a father to the fatherless, and instead of an husband to their
--                   mother), Tobit 4:7 (give alms... turn not thy face from any poor)
--           NT: none warranted (the widow-defence root is the Torah's)
--   v.9-16  the widow's roll / good works / the younger widows / let the household relieve them
--           Tanakh: none warranted (washed-the-saints'-feet / good-works are described, not quoting a
--                   single Torah verse; the widow-care weight is carried at 5:3-8)
--           Extras: none warranted   NT: none warranted
--   v.17-19 the elders worthy of double honour; muzzle not the ox; two or three witnesses  [BLESSING]
--           Tanakh: Deuteronomy 25:4 (thou shalt not muzzle the ox when he treadeth out the corn),
--                   Leviticus 19:13 (the wages of him that is hired shall not abide... till morning),
--                   Deuteronomy 19:15 (at the mouth of two or three witnesses shall the matter be
--                   established)
--           Extras: Tobit 4:14 (let not the wages of any man... tarry with thee), Sirach 7:20 (defraud
--                   not... the hireling that bestoweth himself wholly for thee)
--           NT: 1 Corinthians 9:9 (thou shalt not muzzle the mouth of the ox — Paul's own twin quote),
--               Luke 10:7 (the labourer is worthy of his hire), Matthew 18:16 (two or three witnesses),
--               2 Corinthians 13:1 (in the mouth of two or three witnesses)
--   v.20-25 rebuke before all / charge without partiality / lay hands suddenly on no man / wine / sins
--           Tanakh: none warranted (general pastoral charge; no single load-bearing Torah quotation —
--                   5:21 "without partiality" echoes Leviticus 19:15 thematically but is carried in
--                   the honour-the-elder weave, not a distinct quote-thread)
--           Extras: none warranted   NT: none warranted
--
-- THREADS (slug -> target libraries):
--   8500 1-timothy-5-muzzle-not-the-ox-two-or-three-witnesses-deuteronomy-25-19  (Tanakh + Extras + NT)  [BLESSING CENTERPIECE]
--   8501 1-timothy-5-intreat-an-elder-as-a-father-rise-up-before-the-hoary-head-leviticus-19  (Tanakh + Extras)
--   8502 1-timothy-5-honour-widows-that-are-widows-indeed-exodus-22-deuteronomy-10  (Tanakh + Extras)
-- =====================================================================

CREATE TEMP VIEW _s235_t235c5_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-timothy-5-muzzle-not-the-ox-two-or-three-witnesses-deuteronomy-25-19  [BLESSING CENTERPIECE]
  ('canon', '1-timothy', 5, 18, 'canon', 'deuteronomy', 25, 4, 'free', E'*Thou shalt not muzzle the ox when he treadeth out the corn.* (Deuteronomy 25:4). Paul quotes this Torah commandment by name and calls it *scripture*: *For the scripture saith, Thou shalt not muzzle the ox that treadeth out the corn* (1 Timothy 5:18), making it the ground for honouring *the elders that rule well... especially they who labour in the word and doctrine* (1 Timothy 5:17). The ox that labours eats of the threshing-floor; the elder who labours in the word is worthy of his keep. Far from setting the law aside, the apostle reaches into Deuteronomy and binds it on the assembly as the living rule for the support of those who serve it.'),
  ('canon', '1-timothy', 5, 18, 'canon', 'leviticus', 19, 13, 'free', E'*Thou shalt not defraud thy neighbour, neither rob him: the wages of him that is hired shall not abide with thee all night until the morning.* (Leviticus 19:13). The Torah''s wage-law stands behind the second half of Paul''s charge: *The labourer is worthy of his reward* (1 Timothy 5:18). The hired man''s wage must not be held back; the one who labours is owed his due without delay. When Paul presses that the labouring elder be *counted worthy of double honour* (1 Timothy 5:17), he is speaking the heart of Leviticus — the worker''s wage withheld is robbery, and the assembly owes its labourers honestly and promptly.'),
  ('canon', '1-timothy', 5, 19, 'canon', 'deuteronomy', 19, 15, 'free', E'*One witness shall not rise up against a man for any iniquity, or for any sin, in any sin that he sinneth: at the mouth of two witnesses, or at the mouth of three witnesses, shall the matter be established.* (Deuteronomy 19:15). Paul takes the Torah''s witness-rule straight into the order of the assembly: *Against an elder receive not an accusation, but before two or three witnesses* (1 Timothy 5:19). No charge may stand on a single tongue; a matter is established only *at the mouth of two or three witnesses.* The same statute Moses gave for the courts of Yashar''el (Israel) governs how an elder may be accused — the Torah quoted as binding scripture for the household of Elohim (God).'),
  ('canon', '1-timothy', 5, 18, 'apocrypha', 'tobit', 4, 14, 'extras', E'*Let not the wages of any man, which has wrought for you, tarry with you, but give him it out of hand: for if you serve Yahuah (God), he will also repay you* (Tobit 4:14). Tobit charges his son with the very wage-justice behind Paul''s *The labourer is worthy of his reward* (1 Timothy 5:18): the worker''s wage must not be made to *tarry,* but paid *out of hand.* The Hebrew library held the same Torah-rooted conscience that Paul applies to the labouring elder — the one who works is owed his due promptly, and Yahuah (God) himself stands surety for the wage honestly paid.'),
  ('canon', '1-timothy', 5, 17, 'apocrypha', 'ecclesiasticus', 7, 20, 'extras', E'*Whereas your servant works truly, entreat him not evil, nor the hireling that bestoweth himself wholly for you* (Sirach 7:20). The wise man guards the hireling *that bestoweth himself wholly* in the work — exactly the labourer Paul has in view when he asks that *the elders that rule well be counted worthy of double honour, especially they who labour in the word and doctrine* (1 Timothy 5:17). The one who spends himself fully in the service is not to be dealt with grudgingly; the assembly owes its labouring elders the honour their toil has earned.'),
  ('canon', '1-timothy', 5, 18, 'canon', '1-corinthians', 9, 9, 'free', E'*For it is written in the law of Moses, Thou shalt not muzzle the mouth of the ox that treadeth out the corn. Doth Elohim (God) take care for oxen?* (1 Corinthians 9:9). Paul cites the same Torah verse in both letters to make the same point: the labourer in the gospel may live of the gospel. Here he names its source — *it is written in the law of Moses* — and to Timothy he names its authority — *For the scripture saith* (1 Timothy 5:18). The apostle''s settled habit is to ground the support of the Lord''s workers in Deuteronomy 25:4, treating the law of Moses as the living word that *altogether for our sakes* was written.'),
  ('canon', '1-timothy', 5, 18, 'canon', 'luke', 10, 7, 'free', E'*And in the same house remain, eating and drinking such things as they give: for the labourer is worthy of his hire. Go not from house to house.* (Luke 10:7). Paul''s second clause, *The labourer is worthy of his reward* (1 Timothy 5:18), repeats the very words of Yahusha (Jesus) to the seventy: *the labourer is worthy of his hire.* The Master sent his labourers out to be kept by those they served; Paul builds the elders'' double honour on that same word, set beside the Torah''s muzzle-not-the-ox — the saying of the Lord and the commandment of Moses standing together as one rule.'),
  ('canon', '1-timothy', 5, 19, 'canon', 'matthew', 18, 16, 'free', E'*But if he will not hear thee, then take with thee one or two more, that in the mouth of two or three witnesses every word may be established.* (Matthew 18:16). Yahusha (Jesus) made the Torah''s witness-rule the pattern for discipline in the assembly, *that in the mouth of two or three witnesses every word may be established* — the very rule Paul lays on accusations against an elder: *before two or three witnesses* (1 Timothy 5:19). The Master and the apostle alike take Deuteronomy 19:15 as the standing law for how a charge is brought among the gathered.'),
  ('canon', '1-timothy', 5, 19, 'canon', '2-corinthians', 13, 1, 'free', E'*This is the third time I am coming to you. In the mouth of two or three witnesses shall every word be established.* (2 Corinthians 13:1). Paul invokes Deuteronomy 19:15 to govern his own dealing with the Corinthians, *In the mouth of two or three witnesses shall every word be established* — the same Torah-rule he binds on Timothy for the accusation of an elder, *before two or three witnesses* (1 Timothy 5:19). Across his letters the apostle treats the witness-law of Moses as the unbroken standard for establishing any matter in the household of Elohim (God).'),
  -- thread: 1-timothy-5-intreat-an-elder-as-a-father-rise-up-before-the-hoary-head-leviticus-19
  ('canon', '1-timothy', 5, 1, 'canon', 'leviticus', 19, 32, 'free', E'*Thou shalt rise up before the hoary head, and honour the face of the old man, and fear thy Elohim (God): I am Yahuah (LORD).* (Leviticus 19:32). The Torah commands reverence for the aged, *rise up before the hoary head, and honour the face of the old man* — and Paul speaks the same honour into the assembly: *Rebuke not an elder, but intreat him as a father* (1 Timothy 5:1). The old man is not to be sharply reproved but entreated as a father; the apostle''s pastoral order is the living shape of Leviticus 19:32, reverence for the elder grounded in the fear of Elohim (God).'),
  ('canon', '1-timothy', 5, 1, 'apocrypha', 'ecclesiasticus', 3, 8, 'extras', E'*Honour your father and mother both in word and deed, that a blessing may come upon you from them* (Sirach 3:8). The wise man unfolds the honour due to father and mother *both in word and deed* — and Paul orders the same posture toward the elders of the assembly: *Rebuke not an elder, but intreat him as a father; and the younger men as brethren; The elder women as mothers; the younger as sisters, with all purity* (1 Timothy 5:1-2). The household of Elohim (God) is ordered as a family, every age honoured in its place, the elder treated with the very reverence the Torah and the wisdom of the fathers command toward a parent.'),
  ('canon', '1-timothy', 5, 1, 'apocrypha', 'ecclesiasticus', 3, 12, 'extras', E'*My son, help your father in his age, and grieve him not as long as he lives* (Sirach 3:12). The counsel to *help your father in his age, and grieve him not* is the very tenderness Paul commands toward the aged in the assembly: *Rebuke not an elder, but intreat him as a father* (1 Timothy 5:1). The elder is not to be grieved with sharp rebuke but borne with as one bears with an aging father; the framework''s ordering of the household keeps the honour of the old man the wisdom of the fathers taught.'),
  ('canon', '1-timothy', 5, 2, 'apocrypha', 'tobit', 4, 3, 'extras', E'*My son, when I am dead, bury me; and despise not your mother, but honour her all the days of your life, and do that which shall please her, and grieve her not* (Tobit 4:3). Tobit charges his son to *honour her all the days of your life* and *grieve her not* — the very reverence Paul commands toward the older women of the assembly: *The elder women as mothers; the younger as sisters, with all purity* (1 Timothy 5:2). The aged woman of the congregation is to be honoured as a man honours his own mother; the apostle orders the household by the same reverence for parents the Hebrew library held sacred.'),
  -- thread: 1-timothy-5-honour-widows-that-are-widows-indeed-exodus-22-deuteronomy-10
  ('canon', '1-timothy', 5, 3, 'canon', 'exodus', 22, 22, 'free', E'*Ye shall not afflict any widow, or fatherless child.* (Exodus 22:22). The Torah sets the widow and the fatherless under Yahuah''s (LORD''s) own protection — *ye shall not afflict any widow* — with the warning that he will surely hear their cry. Paul takes up that same defence in the assembly: *Honour widows that are widows indeed* (1 Timothy 5:3). The widow Moses guarded from affliction is the widow Paul commands the household to honour and relieve; the apostle''s care for the desolate widow is the Torah''s care brought into the gathered people.'),
  ('canon', '1-timothy', 5, 3, 'canon', 'deuteronomy', 10, 18, 'free', E'*He doth execute the judgment of the fatherless and widow, and loveth the stranger, in giving him food and raiment.* (Deuteronomy 10:18). Yahuah (LORD) himself *doth execute the judgment of the fatherless and widow* — he is the widow''s defender, feeding and clothing the helpless. Paul calls the assembly to share that very work: *Honour widows that are widows indeed* (1 Timothy 5:3), and *Now she that is a widow indeed, and desolate, trusteth in Elohim (God), and continueth in supplications and prayers night and day* (1 Timothy 5:5). The desolate widow trusts the Elohim (God) who executes her judgment; the household honours her because Yahuah (LORD) himself loves and provides for her.'),
  ('canon', '1-timothy', 5, 3, 'apocrypha', 'ecclesiasticus', 4, 10, 'extras', E'*Be as a father to the fatherless, and instead of an husband to their mother: so shall you be as the son of the Most High, and he shall love you more than your mother does* (Sirach 4:10). The wise man calls the righteous to stand *instead of an husband* to the widow and *as a father* to the fatherless — the very ministry Paul lays on the assembly: *Honour widows that are widows indeed* (1 Timothy 5:3), and *let them relieve them, and let not the church be charged; that it may relieve them that are widows indeed* (1 Timothy 5:16). The household becomes husband and father to the widow and orphan, taking up the care the Hebrew library taught is the mark of a son of the Most High.'),
  ('canon', '1-timothy', 5, 16, 'apocrypha', 'tobit', 4, 7, 'extras', E'*Give alms of your substance; and when you give alms, let not your eye be envious, neither turn your face from any poor, and the face of Yahuah (God) shall not be turned away from you* (Tobit 4:7). Tobit''s charge to give alms and *turn not your face from any poor* is the open-handed care Paul orders the believing household to extend to its widows: *If any man or woman that believeth have widows, let them relieve them, and let not the church be charged; that it may relieve them that are widows indeed* (1 Timothy 5:16). The believer relieves his own widows so the assembly''s care is kept for the truly desolate — the same generosity the library blesses, the face never turned from the poor.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s235_t235c5_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s235_t235c5_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-timothy-5-muzzle-not-the-ox-two-or-three-witnesses-deuteronomy-25-19',
       E'Muzzle not the ox, and two or three witnesses — the Torah quoted as scripture (Deuteronomy 25, 19)',
       E'Here Paul reaches straight into the Torah and binds it on the assembly AS SCRIPTURE. Ordering the support and the discipline of the elders, he writes: *Let the elders that rule well be counted worthy of double honour, especially they who labour in the word and doctrine. For the scripture saith, Thou shalt not muzzle the ox that treadeth out the corn. And, The labourer is worthy of his reward* (1 Timothy 5:17-18). The first half is a direct quotation of Moses: *Thou shalt not muzzle the ox when he treadeth out the corn* (Deuteronomy 25:4) — the labouring ox eats of the threshing-floor, and so the labouring elder is worthy of his keep. Mark the word Paul uses: *the scripture saith.* The Torah is not abolished; it is the apostle''s authority, quoted by name as the living rule for the household of Elohim (God). The second half, *The labourer is worthy of his reward,* speaks the heart of the Torah''s wage-law — *the wages of him that is hired shall not abide with thee all night until the morning* (Leviticus 19:13) — the worker owed his due without delay. The Hebrew library held the same conscience: *Let not the wages of any man, which has wrought for you, tarry with you, but give him it out of hand* (Tobit 4:14), and *entreat him not evil, nor the hireling that bestoweth himself wholly for you* (Sirach 7:20). And Paul did not invent the application; he cites the very same Torah verse to the Corinthians — *For it is written in the law of Moses, Thou shalt not muzzle the mouth of the ox that treadeth out the corn* (1 Corinthians 9:9) — setting it beside the word of the Master himself: *the labourer is worthy of his hire* (Luke 10:7). The commandment of Moses and the saying of Yahusha (Jesus) stand together as one rule for the keeping of the Lord''s workers. Then comes the second Torah-quotation, governing how an elder may be accused: *Against an elder receive not an accusation, but before two or three witnesses* (1 Timothy 5:19). This is the witness-rule of Deuteronomy: *at the mouth of two witnesses, or at the mouth of three witnesses, shall the matter be established* (Deuteronomy 19:15). No charge may stand on a single tongue. Yahusha (Jesus) had already made that statute the pattern for the assembly — *that in the mouth of two or three witnesses every word may be established* (Matthew 18:16) — and Paul applied it to himself before the Corinthians — *In the mouth of two or three witnesses shall every word be established* (2 Corinthians 13:1). From the support of the elders to the accusation of an elder, the law of Moses is the apostle''s standing scripture; the Torah quoted as binding, not set aside.',
       sv.verse_id, ev.verse_id, 'extras', 8500
  FROM _s235_t235c5_lookup sv, _s235_t235c5_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=5 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='1-timothy' AND ev.chapter_number=5 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-timothy-5-intreat-an-elder-as-a-father-rise-up-before-the-hoary-head-leviticus-19',
       E'Intreat an elder as a father — rise up before the hoary head (Leviticus 19)',
       E'Paul orders the household of Elohim (God) as a family, every age honoured in its place: *Rebuke not an elder, but intreat him as a father; and the younger men as brethren; The elder women as mothers; the younger as sisters, with all purity* (1 Timothy 5:1-2). The elder is not to be sharply reproved but entreated as a father; the older woman honoured as a mother. This is the living shape of the Torah''s command for the aged: *Thou shalt rise up before the hoary head, and honour the face of the old man, and fear thy Elohim (God): I am Yahuah (LORD)* (Leviticus 19:32). Reverence for the elder is grounded in the fear of Elohim (God), and the wisdom of the fathers carried that same charge: *Honour your father and mother both in word and deed, that a blessing may come upon you from them* (Sirach 3:8), and *My son, help your father in his age, and grieve him not as long as he lives* (Sirach 3:12) — the aged not grieved with sharp rebuke but borne with as one bears with an aging father. So too for the older woman: *honour her all the days of your life, and do that which shall please her, and grieve her not* (Tobit 4:3). The apostle does not loose the assembly from this honour; he binds it on the gathered people, ordering the church by the very reverence for the elder the Torah and the wisdom of the fathers command toward a parent.',
       sv.verse_id, ev.verse_id, 'extras', 8501
  FROM _s235_t235c5_lookup sv, _s235_t235c5_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=5 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='1-timothy' AND ev.chapter_number=5 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-timothy-5-honour-widows-that-are-widows-indeed-exodus-22-deuteronomy-10',
       E'Honour widows that are widows indeed — the widow defended (Exodus 22, Deuteronomy 10)',
       E'*Honour widows that are widows indeed* (1 Timothy 5:3). Paul takes up into the assembly the defence of the widow that runs through the whole Torah. At Sinai Yahuah (LORD) set the widow under his own protection: *Ye shall not afflict any widow, or fatherless child* (Exodus 22:22), with the warning that he will surely hear their cry. And he names himself their defender: *He doth execute the judgment of the fatherless and widow, and loveth the stranger, in giving him food and raiment* (Deuteronomy 10:18). The desolate widow Paul describes is the one who casts herself on that very Elohim (God): *Now she that is a widow indeed, and desolate, trusteth in Elohim (God), and continueth in supplications and prayers night and day* (1 Timothy 5:5). Because Yahuah (LORD) himself loves and provides for her, the household must honour and relieve her. The wisdom of the fathers laid the same charge on the righteous: *Be as a father to the fatherless, and instead of an husband to their mother: so shall you be as the son of the Most High* (Sirach 4:10), and *turn not your face from any poor* (Tobit 4:7). Paul orders that the believing family bear its own widows first — *If any man or woman that believeth have widows, let them relieve them, and let not the church be charged; that it may relieve them that are widows indeed* (1 Timothy 5:16) — so the assembly''s care is kept for the truly desolate. The widow Moses guarded from affliction is the widow the household is commanded to honour; the apostle''s care for the desolate is the Torah''s care brought into the gathered people.',
       sv.verse_id, ev.verse_id, 'extras', 8502
  FROM _s235_t235c5_lookup sv, _s235_t235c5_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=5 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='1-timothy' AND ev.chapter_number=5 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-timothy-5-muzzle-not-the-ox-two-or-three-witnesses-deuteronomy-25-19
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 25:4 — *Thou shalt not muzzle the ox when he treadeth out the corn* the Torah Paul quotes by name as *scripture* for the elders'' double honour (1 Timothy 5:17-18).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c5_lookup sv, _s235_t235c5_lookup tv
 WHERE t.slug='1-timothy-5-muzzle-not-the-ox-two-or-three-witnesses-deuteronomy-25-19'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=5 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=25 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 19:13 — *the wages of him that is hired shall not abide with thee all night until the morning* the Torah''s wage-law behind *The labourer is worthy of his reward* (1 Timothy 5:18).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c5_lookup sv, _s235_t235c5_lookup tv
 WHERE t.slug='1-timothy-5-muzzle-not-the-ox-two-or-three-witnesses-deuteronomy-25-19'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=5 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 19:15 — *at the mouth of two witnesses, or at the mouth of three witnesses, shall the matter be established* the witness-rule Paul binds on accusations against an elder: *before two or three witnesses* (1 Timothy 5:19).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c5_lookup sv, _s235_t235c5_lookup tv
 WHERE t.slug='1-timothy-5-muzzle-not-the-ox-two-or-three-witnesses-deuteronomy-25-19'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=5 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=19 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Tobit 4:14 — *Let not the wages of any man, which has wrought for you, tarry with you, but give him it out of hand* the library''s same wage-justice behind *The labourer is worthy of his reward* (1 Timothy 5:18).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c5_lookup sv, _s235_t235c5_lookup tv
 WHERE t.slug='1-timothy-5-muzzle-not-the-ox-two-or-three-witnesses-deuteronomy-25-19'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=5 AND sv.verse_number=18
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=4 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Sirach 7:20 — *entreat him not evil, nor the hireling that bestoweth himself wholly for you* the labourer who spends himself fully, owed the honour of the elders who *labour in the word and doctrine* (1 Timothy 5:17).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c5_lookup sv, _s235_t235c5_lookup tv
 WHERE t.slug='1-timothy-5-muzzle-not-the-ox-two-or-three-witnesses-deuteronomy-25-19'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=5 AND sv.verse_number=17
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=7 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'1 Corinthians 9:9 — *For it is written in the law of Moses, Thou shalt not muzzle the mouth of the ox that treadeth out the corn* Paul''s own twin quote of Deuteronomy 25:4 grounding the worker''s keep in the law of Moses (1 Timothy 5:18).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c5_lookup sv, _s235_t235c5_lookup tv
 WHERE t.slug='1-timothy-5-muzzle-not-the-ox-two-or-three-witnesses-deuteronomy-25-19'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=5 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=9 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Luke 10:7 — *the labourer is worthy of his hire* the word of Yahusha (Jesus) to the seventy, repeated by Paul beside muzzle-not-the-ox: *The labourer is worthy of his reward* (1 Timothy 5:18).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c5_lookup sv, _s235_t235c5_lookup tv
 WHERE t.slug='1-timothy-5-muzzle-not-the-ox-two-or-three-witnesses-deuteronomy-25-19'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=5 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=10 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'Matthew 18:16 — *that in the mouth of two or three witnesses every word may be established* Yahusha (Jesus) making Deuteronomy 19:15 the assembly''s rule, the same rule Paul lays on accusing an elder (1 Timothy 5:19).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c5_lookup sv, _s235_t235c5_lookup tv
 WHERE t.slug='1-timothy-5-muzzle-not-the-ox-two-or-three-witnesses-deuteronomy-25-19'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=5 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=18 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 9, E'2 Corinthians 13:1 — *In the mouth of two or three witnesses shall every word be established* Paul invoking the same Torah witness-rule, the unbroken standard he binds on Timothy (1 Timothy 5:19).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c5_lookup sv, _s235_t235c5_lookup tv
 WHERE t.slug='1-timothy-5-muzzle-not-the-ox-two-or-three-witnesses-deuteronomy-25-19'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=5 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=13 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-timothy-5-intreat-an-elder-as-a-father-rise-up-before-the-hoary-head-leviticus-19
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 19:32 — *Thou shalt rise up before the hoary head, and honour the face of the old man, and fear thy Elohim (God)* the Torah''s reverence for the aged behind *intreat him as a father* (1 Timothy 5:1).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c5_lookup sv, _s235_t235c5_lookup tv
 WHERE t.slug='1-timothy-5-intreat-an-elder-as-a-father-rise-up-before-the-hoary-head-leviticus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Sirach 3:8 — *Honour your father and mother both in word and deed* the wisdom of the fathers behind ordering the assembly as a family, the elder entreated as a father (1 Timothy 5:1).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c5_lookup sv, _s235_t235c5_lookup tv
 WHERE t.slug='1-timothy-5-intreat-an-elder-as-a-father-rise-up-before-the-hoary-head-leviticus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Sirach 3:12 — *help your father in his age, and grieve him not* the aged not grieved with sharp rebuke, the heart of *Rebuke not an elder, but intreat him as a father* (1 Timothy 5:1).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c5_lookup sv, _s235_t235c5_lookup tv
 WHERE t.slug='1-timothy-5-intreat-an-elder-as-a-father-rise-up-before-the-hoary-head-leviticus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Tobit 4:3 — *honour her all the days of your life... and grieve her not* the reverence for an aging mother behind *The elder women as mothers* (1 Timothy 5:2).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c5_lookup sv, _s235_t235c5_lookup tv
 WHERE t.slug='1-timothy-5-intreat-an-elder-as-a-father-rise-up-before-the-hoary-head-leviticus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=5 AND sv.verse_number=2
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=4 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-timothy-5-honour-widows-that-are-widows-indeed-exodus-22-deuteronomy-10
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 22:22 — *Ye shall not afflict any widow, or fatherless child* the widow set under Yahuah''s (LORD''s) own protection, honoured now in the assembly (1 Timothy 5:3).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c5_lookup sv, _s235_t235c5_lookup tv
 WHERE t.slug='1-timothy-5-honour-widows-that-are-widows-indeed-exodus-22-deuteronomy-10'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=5 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=22 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 10:18 — *He doth execute the judgment of the fatherless and widow... in giving him food and raiment* Yahuah (LORD) himself the widow''s defender, the Elohim (God) on whom the desolate widow trusts (1 Timothy 5:3,5).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c5_lookup sv, _s235_t235c5_lookup tv
 WHERE t.slug='1-timothy-5-honour-widows-that-are-widows-indeed-exodus-22-deuteronomy-10'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=5 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=10 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Sirach 4:10 — *Be as a father to the fatherless, and instead of an husband to their mother* the library''s charge to stand for the widow and orphan, the ministry laid on the household (1 Timothy 5:3,16).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c5_lookup sv, _s235_t235c5_lookup tv
 WHERE t.slug='1-timothy-5-honour-widows-that-are-widows-indeed-exodus-22-deuteronomy-10'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=5 AND sv.verse_number=3
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=4 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Tobit 4:7 — *when you give alms... turn not your face from any poor* the open-handed care Paul orders the believing household to extend to its widows (1 Timothy 5:16).'
  FROM cross_reference_threads t, cross_references x, _s235_t235c5_lookup sv, _s235_t235c5_lookup tv
 WHERE t.slug='1-timothy-5-honour-widows-that-are-widows-indeed-exodus-22-deuteronomy-10'
   AND sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=5 AND sv.verse_number=16
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=4 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1timothy_06.sql (S235 1 Timothy 6) -----
-- =====================================================================
-- S235 minion — 1 TIMOTHY 6 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 1 TIMOTHY 6 (21 verses) — servants and masters, godliness with contentment,
--   the love of money, the good fight, the King of kings, the charge to the rich.
-- Tag: t235c6 (temp view _s235_t235c6_lookup).
-- Sort band: floor 8525, 25-wide (8525, 8526, 8527, 8528 used; under 8550).
-- Source is ALWAYS the canon 1 Timothy verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (Paul's charge to a shepherd; sound doctrine, the one olive tree, no law-vs-grace
--   antithesis, no replacement theology). Chapter 6 closes the letter: contentment over covetousness,
--   the love of money as the root of all evil, the good fight, and the doxology to the blessed and only
--   Potentate — the King of kings and Lord of lords, who only hath immortality, dwelling in the light
--   which no man can approach unto, whom no man hath seen nor can see. This last is the INVISIBLE,
--   IMMORTAL FATHER, the one Elohim of the Shema: keep the Father the one invisible Elohim and source;
--   no co-equal-persons grammar. The charge to the rich re-speaks the Torah's own warning (Deut 8:17-18)
--   and the gospel treasure-in-heaven (Matt 6:19-21).
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-2   servants under the yoke count masters worthy of honour
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted
--           (the household-code root is carried in Ephesians/Colossians; no load-bearing single root here)
--   v.3-5   if any teach otherwise... supposing that gain is godliness
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted
--           (the "teach otherwise" rebuke is intra-letter; covered by ch1's sound-doctrine apparatus)
--   v.6-8   godliness with contentment is great gain; we brought nothing into this world
--           Tanakh: Job 1:21 (naked came I out of my mother's womb), Ecclesiastes 5:15 (naked shall he return)
--           Extras: none warranted   NT: Hebrews 13:5 (be content; I will never leave thee)
--   v.9-10  they that will be rich fall into a snare; the love of money the root of all evil [STAR]
--           Tanakh: Proverbs 23:4-5 (labour not to be rich; riches make wings), Ecclesiastes 5:10
--                   (he that loveth silver shall not be satisfied)
--           Extras: Sirach/Ecclesiasticus 31:5 (he that loves gold shall not be justified)
--           NT: none warranted (the root-of-evil saying is itself the NT locus)
--   v.11-14 flee these things; fight the good fight; keep this commandment
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted
--           (exhortation language; no single load-bearing root)
--   v.15-16 the King of kings, and Lord of lords; Who only hath immortality, dwelling in the light
--           Tanakh: Deuteronomy 10:17 (Lord of lords... a great Elohim), Daniel 2:47 (a Lord of kings),
--                   Psalm 104:2 (who coverest thyself with light), Exodus 33:20 (no man see me, and live),
--                   Psalm 136:3 (the Lord of lords)
--           Extras: none warranted   NT: none warranted (the invisible Father is the Tanakh root)
--   v.17-19 charge the rich; trust in the living Elohim; lay up a good foundation
--           Tanakh: Psalm 62:10 (if riches increase, set not your heart upon them),
--                   Deuteronomy 8:17-18 (it is he that giveth thee power to get wealth)
--           Extras: Tobit 4:7-9 (give alms; thou layest up a good treasure against the day of necessity)
--           NT: Matthew 6:19-21 (lay up treasures in heaven; where your treasure is)
--   v.20-21 keep that which is committed; avoid profane babblings
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted (intra-letter charge)
--
-- THREADS (slug -> target libraries):
--   8525 1-timothy-6-godliness-with-contentment-we-brought-nothing-into-this-world-job-1-ecclesiastes-5  (Tanakh + NT)
--   8526 1-timothy-6-the-love-of-money-is-the-root-of-all-evil-proverbs-23-ecclesiastes-5-sirach-31      (Tanakh + Extras)
--   8527 1-timothy-6-the-king-of-kings-and-lord-of-lords-who-only-hath-immortality-deuteronomy-10-psalm-104  (Tanakh)
--   8528 1-timothy-6-the-charge-to-the-rich-laying-up-a-good-foundation-deuteronomy-8-psalm-62-tobit-4   (Tanakh + Extras + NT)
-- =====================================================================

CREATE TEMP VIEW _s235_t235c6_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-timothy-6-godliness-with-contentment-we-brought-nothing-into-this-world-job-1-ecclesiastes-5
  ('canon', '1-timothy', 6, 7, 'canon', 'job', 1, 21, 'free', E'*And said, Naked came I out of my mother''s womb, and naked shall I return thither: Yahuah (LORD) gave, and Yahuah (LORD) hath taken away; blessed be the name of Yahuah (LORD).* (Job 1:21). Stripped of all his substance in a single day, Job confesses the bare truth of every life: *Naked came I out of my mother''s womb, and naked shall I return thither.* Paul says the same to Timothy: *For we brought nothing into this world, and it is certain we can carry nothing out* (1 Timothy 6:7). The man who feared Elohim (God) and lost everything still blessed the name of Yahuah (LORD); his contentment in the dust is the very *godliness with contentment* (1 Timothy 6:6) Paul calls *great gain.* What we cannot carry out we must not set our hearts upon.'),
  ('canon', '1-timothy', 6, 7, 'canon', 'ecclesiastes', 5, 15, 'free', E'*As he came forth of his mother''s womb, naked shall he return to go as he came, and shall take nothing of his labour, which he may carry away in his hand.* (Ecclesiastes 5:15). The Preacher draws the same lesson Paul draws: the man who heaps up riches *shall take nothing of his labour, which he may carry away in his hand.* Paul writes *we brought nothing into this world, and it is certain we can carry nothing out* (1 Timothy 6:7). Because the grave receives us as naked as the womb sent us forth, *having food and raiment let us be therewith content* (1 Timothy 6:8) — the wisdom of Qoheleth become the apostle''s charge.'),
  ('canon', '1-timothy', 6, 8, 'canon', 'hebrews', 13, 5, 'free', E'*Let your conversation be without covetousness; and be content with such things as ye have: for he hath said, I will never leave thee, nor forsake thee.* (Hebrews 13:5). The same apostolic doctrine sounds in Hebrews: *be content with such things as ye have,* and the ground of that contentment is the abiding presence of Yahuah (LORD) himself — *I will never leave thee, nor forsake thee.* Paul tells Timothy *having food and raiment let us be therewith content* (1 Timothy 6:8). The one who has the living Elohim (God) needs no hedge of riches; contentment rests not on what is in the hand but on the One who never departs.'),
  -- thread: 1-timothy-6-the-love-of-money-is-the-root-of-all-evil-proverbs-23-ecclesiastes-5-sirach-31
  ('canon', '1-timothy', 6, 9, 'canon', 'proverbs', 23, 4, 'free', E'*Labour not to be rich: cease from thine own wisdom. Wilt thou set thine eyes upon that which is not? for riches certainly make themselves wings; they fly away as an eagle toward heaven.* (Proverbs 23:4-5). Wisdom warns against the very craving Paul names: *Labour not to be rich,* for riches *fly away as an eagle toward heaven.* Paul says *they that will be rich fall into temptation and a snare, and into many foolish and hurtful lusts, which drown men in destruction and perdition* (1 Timothy 6:9). The eyes set upon what takes wings are the eyes that fall into the snare; the apostle and the proverb sound one warning against the will to be rich.'),
  ('canon', '1-timothy', 6, 10, 'canon', 'ecclesiastes', 5, 10, 'free', E'*He that loveth silver shall not be satisfied with silver; nor he that loveth abundance with increase: this is also vanity.* (Ecclesiastes 5:10). The Preacher exposes the bottomless thirst of greed: *He that loveth silver shall not be satisfied with silver.* This is the root Paul names: *For the love of money is the root of all evil: which while some coveted after, they have erred from the faith, and pierced themselves through with many sorrows* (1 Timothy 6:10). The love that cannot be satisfied draws a man off the path; the never-filled craving of Qoheleth becomes, in Paul, the wandering from the faith and the self-inflicted sorrows of the covetous.'),
  ('canon', '1-timothy', 6, 10, 'apocrypha', 'ecclesiasticus', 31, 5, 'extras', E'*He that loves gold shall not be justified, and he that followeth corruption shall have enough thereof.* (Ecclesiasticus 31:5). The Hebrew library says it plainly: *He that loves gold shall not be justified.* For *Gold has been the ruin of many, and their destruction was present* (Ecclesiasticus 31:6), and the love of it *is a stumblingblock to them that sacrifice to it* (Ecclesiasticus 31:7). Paul gathers the same wisdom into one phrase: *the love of money is the root of all evil... they have erred from the faith, and pierced themselves through with many sorrows* (1 Timothy 6:10). The covetous man is not justified but ruined; the apostle does not invent the warning but re-speaks what the wisdom of the fathers already knew.'),
  -- thread: 1-timothy-6-the-king-of-kings-and-lord-of-lords-who-only-hath-immortality-deuteronomy-10-psalm-104
  ('canon', '1-timothy', 6, 15, 'canon', 'deuteronomy', 10, 17, 'free', E'*For Yahuah Elohaychem (the LORD your God) is Elohim (God) of gods, and Lord of lords, a great Elohim (God), a mighty, and a terrible, which regardeth not persons, nor taketh reward:* (Deuteronomy 10:17). Moses names Yahuah (LORD) *Elohim (God) of gods, and Lord of lords.* Paul gives the same titles to *the blessed and only Potentate, the King of kings, and Lord of lords* (1 Timothy 6:15). The *Lord of lords* of the Torah is the one Elohim (God) Paul magnifies — the invisible Father, the only Potentate, before whom every crowned head is a subject; the doxology of the apostle is the confession of Moses.'),
  ('canon', '1-timothy', 6, 15, 'canon', 'daniel', 2, 47, 'free', E'*The king answered unto Daniel, and said, Of a truth it is, that your Elohim (God) is a Elohim (God) of gods, and a Yahuah (Lord) of kings, and a revealer of secrets, seeing thou couldest reveal this secret.* (Daniel 2:47). Nebuchadnezzar, greatest of earthly monarchs, falls before the One who is *a Yahuah (Lord) of kings.* This is the title Paul renders *the King of kings, and Lord of lords* (1 Timothy 6:15) — the *blessed and only Potentate* who outranks every potentate. The pagan king confessed what the apostle declares: there is one above all kings, the Elohim (God) of gods, the only wise Elohim (God) of 1 Timothy 1:17.'),
  ('canon', '1-timothy', 6, 15, 'canon', 'psalms', 136, 3, 'free', E'*O give thanks to the Lord of lords: for his mercy endureth for ever.* (Psalm 136:3). The Psalm calls Yahuah (LORD) *the Lord of lords,* the Maker of heaven and earth whose mercy endureth for ever. Paul takes up the same name for *the blessed and only Potentate, the King of kings, and Lord of lords* (1 Timothy 6:15). The One whom the Psalmist thanks as Lord of lords is the One to whom Paul ascribes *honour and power everlasting* (1 Timothy 6:16) — the same enthroned Elohim (God), praised in the sanctuary and confessed in the apostle''s doxology.'),
  ('canon', '1-timothy', 6, 16, 'canon', 'psalms', 104, 2, 'free', E'*Who coverest thyself with light as with a garment: who stretchest out the heavens like a curtain:* (Psalm 104:2). The Psalmist beholds Yahuah (LORD) *clothed with honour and majesty,* who *coverest thyself with light as with a garment.* Paul says of him that he is the One *Who only hath immortality, dwelling in the light which no man can approach unto* (1 Timothy 6:16). The light that is the garment of Yahuah (LORD) in the Psalm is the unapproachable light in which the invisible Father dwells; the apostle does not name a new Elohim (God) but the One the Psalmist already clothed in light.'),
  ('canon', '1-timothy', 6, 16, 'canon', 'exodus', 33, 20, 'free', E'*And he said, Thou canst not see my face: for there shall no man see me, and live.* (Exodus 33:20). When Moses begged to see the glory, Yahuah (LORD) answered *there shall no man see me, and live.* Paul speaks of the same hidden majesty: the One *whom no man hath seen, nor can see: to whom be honour and power everlasting* (1 Timothy 6:16). The Father no man can see and live is the invisible Elohim (God) of 1 Timothy 1:17, the King eternal, immortal, invisible; the unseeable Yahuah (LORD) of the mount is the One who only hath immortality, dwelling in the light no man can approach.'),
  -- thread: 1-timothy-6-the-charge-to-the-rich-laying-up-a-good-foundation-deuteronomy-8-psalm-62-tobit-4
  ('canon', '1-timothy', 6, 17, 'canon', 'psalms', 62, 10, 'free', E'*Trust not in oppression, and become not vain in robbery: if riches increase, set not your heart upon them.* (Psalm 62:10). The Psalmist charges the heart not to fasten on wealth: *if riches increase, set not your heart upon them.* Paul charges the rich in the same spirit: *that they be not highminded, nor trust in uncertain riches, but in the living Elohim (God)* (1 Timothy 6:17). Riches are *uncertain* — they make themselves wings — so the heart is to rest not on them but on the living Elohim (God) who *giveth us richly all things to enjoy.*'),
  ('canon', '1-timothy', 6, 17, 'canon', 'deuteronomy', 8, 18, 'free', E'*But thou shalt remember Yahuah Elohayka (the LORD thy God): for it is he that giveth thee power to get wealth, that he may establish his covenant which he sware unto thy fathers, as it is this day.* (Deuteronomy 8:18). Moses warns Yashar''el (Israel) against the proud heart that says *My power and the might of mine hand hath gotten me this wealth* (Deuteronomy 8:17), and answers it: *it is he that giveth thee power to get wealth.* Paul charges the rich *that they be not highminded, nor trust in uncertain riches, but in the living Elohim (God), who giveth us richly all things to enjoy* (1 Timothy 6:17). The wealth is a gift, not a self-made trophy; the Giver, not the gift, is to be trusted — the Torah''s charge become the apostle''s.'),
  ('canon', '1-timothy', 6, 18, 'apocrypha', 'tobit', 4, 9, 'extras', E'*For you layest up a good treasure for thyself against the day of necessity.* (Tobit 4:9). Tobit counsels his son to give alms — *If you have abundance give alms accordingly: if you have but a little, be not afraid to give according to that little* (Tobit 4:8) — for by it *you layest up a good treasure for thyself against the day of necessity.* Paul charges the rich *That they do good, that they be rich in good works, ready to distribute, willing to communicate; Laying up in store for themselves a good foundation against the time to come* (1 Timothy 6:18-19). The good treasure laid up against the day of necessity is the good foundation laid up against the time to come; the Hebrew library''s wisdom of almsgiving is the apostle''s charge to the rich.'),
  ('canon', '1-timothy', 6, 19, 'canon', 'matthew', 6, 20, 'free', E'*But lay up for yourselves treasures in heaven, where neither moth nor rust doth corrupt, and where thieves do not break through nor steal:* (Matthew 6:20). Yahusha (Jesus) commanded *lay up for yourselves treasures in heaven... For where your treasure is, there will your heart be also* (Matthew 6:20-21). Paul gives the rich the very same instruction: *Laying up in store for themselves a good foundation against the time to come, that they may lay hold on eternal life* (1 Timothy 6:19). The good works of the rich are the heavenly treasure of the gospel; what is given away is not lost but laid up where neither moth nor rust corrupts, a foundation that lays hold on eternal life.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s235_t235c6_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s235_t235c6_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-timothy-6-godliness-with-contentment-we-brought-nothing-into-this-world-job-1-ecclesiastes-5',
       E'Godliness with contentment is great gain — we brought nothing into this world (Job 1, Ecclesiastes 5)',
       E'Paul sets contentment over covetousness: *But godliness with contentment is great gain. For we brought nothing into this world, and it is certain we can carry nothing out. And having food and raiment let us be therewith content* (1 Timothy 6:6-8). The root of that contentment is the bare truth Job confessed when he was stripped of everything in a single day: *Naked came I out of my mother''s womb, and naked shall I return thither: Yahuah (LORD) gave, and Yahuah (LORD) hath taken away; blessed be the name of Yahuah (LORD)* (Job 1:21). The Preacher draws the same lesson over the man who heaps up riches: *As he came forth of his mother''s womb, naked shall he return to go as he came, and shall take nothing of his labour, which he may carry away in his hand* (Ecclesiastes 5:15). Because the grave receives us as naked as the womb sent us forth, the heart must not be fastened on what cannot be carried out. The same apostolic doctrine sounds in Hebrews: *be content with such things as ye have: for he hath said, I will never leave thee, nor forsake thee* (Hebrews 13:5) — the ground of contentment is not the fullness of the hand but the abiding presence of Yahuah (LORD), who is himself the believer''s portion. Godliness with contentment is great gain precisely because the One who never departs is gain that no thief can take and no death can strip away.',
       sv.verse_id, ev.verse_id, 'free', 8525
  FROM _s235_t235c6_lookup sv, _s235_t235c6_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=6 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='1-timothy' AND ev.chapter_number=6 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-timothy-6-the-love-of-money-is-the-root-of-all-evil-proverbs-23-ecclesiastes-5-sirach-31',
       E'The love of money is the root of all evil (Proverbs 23, Ecclesiastes 5, Sirach 31)',
       E'Paul names the deadly craving: *But they that will be rich fall into temptation and a snare, and into many foolish and hurtful lusts, which drown men in destruction and perdition. For the love of money is the root of all evil: which while some coveted after, they have erred from the faith, and pierced themselves through with many sorrows* (1 Timothy 6:9-10). This is no new saying — it gathers up the whole witness of the wisdom of the fathers. Proverbs warned against the very will to be rich: *Labour not to be rich: cease from thine own wisdom. Wilt thou set thine eyes upon that which is not? for riches certainly make themselves wings; they fly away as an eagle toward heaven* (Proverbs 23:4-5). The Preacher exposed its bottomless thirst: *He that loveth silver shall not be satisfied with silver; nor he that loveth abundance with increase: this is also vanity* (Ecclesiastes 5:10). And the Hebrew library says it plainest of all: *He that loves gold shall not be justified, and he that followeth corruption shall have enough thereof* (Ecclesiasticus 31:5), for *Gold has been the ruin of many, and their destruction was present* (Ecclesiasticus 31:6). The eyes set on what takes wings fall into the snare; the love that can never be satisfied draws a man off the path; the lover of gold is not justified but ruined. Paul does not invent the warning but re-speaks it — the never-filled craving becomes, in him, the wandering from the faith and the self-inflicted sorrows of the covetous.',
       sv.verse_id, ev.verse_id, 'extras', 8526
  FROM _s235_t235c6_lookup sv, _s235_t235c6_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=6 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='1-timothy' AND ev.chapter_number=6 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-timothy-6-the-king-of-kings-and-lord-of-lords-who-only-hath-immortality-deuteronomy-10-psalm-104',
       E'The King of kings, and Lord of lords — who only hath immortality, dwelling in unapproachable light (Deuteronomy 10, Psalm 104, Exodus 33)',
       E'The letter closes on a great doxology to *the blessed and only Potentate, the King of kings, and Lord of lords; Who only hath immortality, dwelling in the light which no man can approach unto; whom no man hath seen, nor can see: to whom be honour and power everlasting. Amen* (1 Timothy 6:15-16). This is the invisible, immortal Father, the one Elohim (God) of the Shema — the *King eternal, immortal, invisible, the only wise Elohim (God)* of 1 Timothy 1:17. Every title is the Tanakh''s own. Moses named Yahuah (LORD) *Elohim (God) of gods, and Lord of lords, a great Elohim (God), a mighty, and a terrible* (Deuteronomy 10:17); the Psalm gives thanks *to the Lord of lords: for his mercy endureth for ever* (Psalm 136:3); and Nebuchadnezzar, greatest of earthly monarchs, confessed Daniel''s Elohim (God) to be *a Elohim (God) of gods, and a Yahuah (Lord) of kings* (Daniel 2:47). The unapproachable light is the Psalmist''s vision of Yahuah (LORD), *Who coverest thyself with light as with a garment* (Psalm 104:2). And the One *whom no man hath seen, nor can see* is the very Yahuah (LORD) who told Moses *Thou canst not see my face: for there shall no man see me, and live* (Exodus 33:20). Paul names no new Elohim (God): the King of kings and Lord of lords, who only hath immortality and dwells in light no man can approach, is the invisible Father of the Tanakh, to whom alone be honour and power everlasting.',
       sv.verse_id, ev.verse_id, 'free', 8527
  FROM _s235_t235c6_lookup sv, _s235_t235c6_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=6 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='1-timothy' AND ev.chapter_number=6 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-timothy-6-the-charge-to-the-rich-laying-up-a-good-foundation-deuteronomy-8-psalm-62-tobit-4',
       E'The charge to the rich — laying up a good foundation against the time to come (Deuteronomy 8, Psalm 62, Tobit 4, Matthew 6)',
       E'Paul turns to those with much: *Charge them that are rich in this world, that they be not highminded, nor trust in uncertain riches, but in the living Elohim (God), who giveth us richly all things to enjoy; That they do good, that they be rich in good works, ready to distribute, willing to communicate; Laying up in store for themselves a good foundation against the time to come, that they may lay hold on eternal life* (1 Timothy 6:17-19). The charge re-speaks the Torah''s own warning against the proud heart: Moses cautioned Yashar''el (Israel) lest it say *My power and the might of mine hand hath gotten me this wealth* (Deuteronomy 8:17), answering, *thou shalt remember Yahuah Elohayka (the LORD thy God): for it is he that giveth thee power to get wealth* (Deuteronomy 8:18) — the wealth is a gift, not a self-made trophy. The Psalmist charged the heart not to fasten on it: *if riches increase, set not your heart upon them* (Psalm 62:10). The Hebrew library taught that alms are treasure laid up: *If you have abundance give alms accordingly: if you have but a little, be not afraid to give according to that little: For you layest up a good treasure for thyself against the day of necessity* (Tobit 4:8-9). And Yahusha (Jesus) gave the same instruction the apostle now gives the rich: *lay up for yourselves treasures in heaven... For where your treasure is, there will your heart be also* (Matthew 6:20-21). The good works of the rich are the heavenly treasure; what is given away is not lost but laid up as a good foundation against the time to come, that they may lay hold on eternal life.',
       sv.verse_id, ev.verse_id, 'extras', 8528
  FROM _s235_t235c6_lookup sv, _s235_t235c6_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-timothy' AND sv.chapter_number=6 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='1-timothy' AND ev.chapter_number=6 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    -- godliness with contentment (8525)
    ('1-timothy-6-godliness-with-contentment-we-brought-nothing-into-this-world-job-1-ecclesiastes-5', 'canon','1-timothy',6,7, 'canon','job',1,21, 1, E'*Naked came I out of my mother''s womb, and naked shall I return thither: Yahuah (LORD) gave, and Yahuah (LORD) hath taken away; blessed be the name of Yahuah (LORD)* (Job 1:21) — Job stripped of all yet blessing Yahuah (LORD) is the godliness with contentment behind *we brought nothing into this world* (1 Timothy 6:7).'),
    ('1-timothy-6-godliness-with-contentment-we-brought-nothing-into-this-world-job-1-ecclesiastes-5', 'canon','1-timothy',6,7, 'canon','ecclesiastes',5,15, 2, E'*As he came forth of his mother''s womb, naked shall he return to go as he came, and shall take nothing of his labour, which he may carry away in his hand* (Ecclesiastes 5:15) — the Preacher''s witness behind *it is certain we can carry nothing out* (1 Timothy 6:7).'),
    ('1-timothy-6-godliness-with-contentment-we-brought-nothing-into-this-world-job-1-ecclesiastes-5', 'canon','1-timothy',6,8, 'canon','hebrews',13,5, 3, E'*be content with such things as ye have: for he hath said, I will never leave thee, nor forsake thee* (Hebrews 13:5) — the same apostolic charge, the abiding presence of Yahuah (LORD) the ground of *having food and raiment let us be therewith content* (1 Timothy 6:8).'),
    -- love of money (8526)
    ('1-timothy-6-the-love-of-money-is-the-root-of-all-evil-proverbs-23-ecclesiastes-5-sirach-31', 'canon','1-timothy',6,9, 'canon','proverbs',23,4, 1, E'*Labour not to be rich... for riches certainly make themselves wings; they fly away as an eagle toward heaven* (Proverbs 23:4-5) — the will to be rich that *fall[s] into temptation and a snare* (1 Timothy 6:9).'),
    ('1-timothy-6-the-love-of-money-is-the-root-of-all-evil-proverbs-23-ecclesiastes-5-sirach-31', 'canon','1-timothy',6,10, 'canon','ecclesiastes',5,10, 2, E'*He that loveth silver shall not be satisfied with silver* (Ecclesiastes 5:10) — the bottomless craving behind *the love of money is the root of all evil* (1 Timothy 6:10).'),
    ('1-timothy-6-the-love-of-money-is-the-root-of-all-evil-proverbs-23-ecclesiastes-5-sirach-31', 'canon','1-timothy',6,10, 'apocrypha','ecclesiasticus',31,5, 3, E'*He that loves gold shall not be justified, and he that followeth corruption shall have enough thereof* (Ecclesiasticus 31:5) — the Hebrew library''s witness that the lover of gold is ruined, not justified, behind *the love of money is the root of all evil* (1 Timothy 6:10).'),
    -- King of kings (8527)
    ('1-timothy-6-the-king-of-kings-and-lord-of-lords-who-only-hath-immortality-deuteronomy-10-psalm-104', 'canon','1-timothy',6,15, 'canon','deuteronomy',10,17, 1, E'*Yahuah Elohaychem (the LORD your God) is Elohim (God) of gods, and Lord of lords* (Deuteronomy 10:17) — Moses'' title for the invisible Father behind *the King of kings, and Lord of lords* (1 Timothy 6:15).'),
    ('1-timothy-6-the-king-of-kings-and-lord-of-lords-who-only-hath-immortality-deuteronomy-10-psalm-104', 'canon','1-timothy',6,15, 'canon','daniel',2,47, 2, E'*your Elohim (God) is a Elohim (God) of gods, and a Yahuah (Lord) of kings* (Daniel 2:47) — Nebuchadnezzar''s confession behind *the King of kings* (1 Timothy 6:15).'),
    ('1-timothy-6-the-king-of-kings-and-lord-of-lords-who-only-hath-immortality-deuteronomy-10-psalm-104', 'canon','1-timothy',6,15, 'canon','psalms',136,3, 3, E'*O give thanks to the Lord of lords: for his mercy endureth for ever* (Psalm 136:3) — the Psalm''s title behind *Lord of lords* (1 Timothy 6:15).'),
    ('1-timothy-6-the-king-of-kings-and-lord-of-lords-who-only-hath-immortality-deuteronomy-10-psalm-104', 'canon','1-timothy',6,16, 'canon','psalms',104,2, 4, E'*Who coverest thyself with light as with a garment* (Psalm 104:2) — the light that is Yahuah (LORD)''s garment behind *dwelling in the light which no man can approach unto* (1 Timothy 6:16).'),
    ('1-timothy-6-the-king-of-kings-and-lord-of-lords-who-only-hath-immortality-deuteronomy-10-psalm-104', 'canon','1-timothy',6,16, 'canon','exodus',33,20, 5, E'*there shall no man see me, and live* (Exodus 33:20) — the unseeable Yahuah (LORD) of the mount behind *whom no man hath seen, nor can see* (1 Timothy 6:16).'),
    -- charge to the rich (8528)
    ('1-timothy-6-the-charge-to-the-rich-laying-up-a-good-foundation-deuteronomy-8-psalm-62-tobit-4', 'canon','1-timothy',6,17, 'canon','psalms',62,10, 1, E'*if riches increase, set not your heart upon them* (Psalm 62:10) — the heart not fastened on wealth behind *nor trust in uncertain riches, but in the living Elohim (God)* (1 Timothy 6:17).'),
    ('1-timothy-6-the-charge-to-the-rich-laying-up-a-good-foundation-deuteronomy-8-psalm-62-tobit-4', 'canon','1-timothy',6,17, 'canon','deuteronomy',8,18, 2, E'*it is he that giveth thee power to get wealth* (Deuteronomy 8:18) — wealth as gift, not self-made trophy, behind *the living Elohim (God), who giveth us richly all things to enjoy* (1 Timothy 6:17).'),
    ('1-timothy-6-the-charge-to-the-rich-laying-up-a-good-foundation-deuteronomy-8-psalm-62-tobit-4', 'canon','1-timothy',6,18, 'apocrypha','tobit',4,9, 3, E'*you layest up a good treasure for thyself against the day of necessity* (Tobit 4:9) — alms as treasure laid up, behind *ready to distribute... Laying up in store for themselves a good foundation* (1 Timothy 6:18-19).'),
    ('1-timothy-6-the-charge-to-the-rich-laying-up-a-good-foundation-deuteronomy-8-psalm-62-tobit-4', 'canon','1-timothy',6,19, 'canon','matthew',6,20, 4, E'*lay up for yourselves treasures in heaven... For where your treasure is, there will your heart be also* (Matthew 6:20-21) — Yahusha (Jesus)'' instruction behind *Laying up in store for themselves a good foundation against the time to come* (1 Timothy 6:19).')
  ) AS m(slug, src_edition,src_slug,src_ch,src_v, tgt_edition,tgt_slug,tgt_ch,tgt_v, sort_order, member_note)
  JOIN cross_reference_threads t ON t.slug = m.slug
  JOIN _s235_t235c6_lookup sv ON sv.edition_slug=m.src_edition AND sv.book_slug=m.src_slug AND sv.chapter_number=m.src_ch AND sv.verse_number=m.src_v
  JOIN _s235_t235c6_lookup tv ON tv.edition_slug=m.tgt_edition AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session235 — 1 Timothy cross-references complete.'
