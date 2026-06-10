-- =====================================================================
-- Session 218 — Acts 15 Jerusalem Council: the four-prohibitions FRAME
-- =====================================================================
-- Direct theological guidance from Yoshi (settled reading): the four things of
-- Acts 15:20,29 (pollutions of idols, fornication, things strangled, blood) are
-- the STARTING POINT / entry threshold for the gathered coming into the covenant
-- — NOT a reduction of the Law to four rules, and NOT the abolition of Torah. The
-- rest of the walk is learned PROGRESSIVELY, as Acts 15:21 says Moses is read in
-- the synagogues every sabbath. v.21 is the KEY that explains the four are a
-- beginning with Moses still being taught.
--
-- The Acts 15 threads already landed (session217, commit 65ca0c8) carry this
-- substantially; this migration sharpens the two affected threads' summary_md (and
-- the v.21 thread title) so the frame is explicit and unmistakable. UPDATE-based
-- because session217 rows are idempotent-locked (ON CONFLICT DO NOTHING). The
-- session217 migration + fragment are edited to match for rebuild consistency.
-- Verbatim verse quotes are unchanged; only the connective frame is revised.
-- Apply:  python3 api/apply_migration.py data-schema/migrations/session218_acts15_council_frame.sql
-- =====================================================================

\echo 'session218 — Acts 15 council four-prohibitions frame revision starting...'
BEGIN;

UPDATE cross_reference_threads SET
  summary_md = E'The council''s four prohibitions are the STARTING POINT for the gathered coming into the covenant — the entry threshold, not a reduction of the Torah to four rules, and not the abolition of the rest. Each is the Torah''s own statute for all who dwell in the one house, native-born and sojourner alike. *That they abstain from pollutions of idols* (Acts 15:20) is the statute for ever: *they shall no more offer their sacrifices unto devils, after whom they have gone a whoring. This shall be a statute for ever unto them throughout their generations* (Leviticus 17:7). *Fornication* heads the abominations the Torah forbids to *any of your own nation, nor any stranger that sojourneth among you* (Leviticus 18:26). *Blood* is the Torah''s express statute over *the house of Yashar''el (Israel), or … the strangers that sojourn among you* alike: *No soul of you shall eat blood, neither shall any stranger that sojourneth among you eat blood* (Leviticus 17:12; cf. 17:10). And *things strangled* — flesh whose blood was never poured out — falls under the statute of *that which died of itself, or … was torn with beasts, whether it be one of your own country, or a stranger* (Leviticus 17:15). The blood-term is older even than Sinai: *Noah and his sons swore that they would not eat any blood that was in any flesh, and he made a covenant before Yahuah Elohim (the LORD God) for ever throughout all the generations of the earth* (Jubilees 6:10), *that their names and their seed may be before Yahuah our Elohim (the LORD our God) continually* (Jubilees 6:13). The apostles lay no new burden and shut no door on the rest of the instruction; they name the threshold terms on which the gathered enter the one house. From there the fuller walk in the Father''s instruction is learned over time, for *Moses of old time hath in every city them that preach him, being read in the synagogues every sabbath day* (Acts 15:21).'
WHERE slug = 'acts-15-abstain-from-blood-and-things-strangled-the-covenant-terms-for-the-ger';

UPDATE cross_reference_threads SET
  title = E'Moses read every sabbath — the four are the beginning, the whole Torah still taught',
  summary_md = E'This is the key that unlocks the council''s four: they are a beginning, not the whole, and the rest of the Torah is neither cancelled nor closed off. James gives the reason the letter need name only the threshold terms: *For Moses of old time hath in every city them that preach him, being read in the synagogues every sabbath day* (Acts 15:21). The four prohibitions — turn from idols, from blood, from things strangled, from fornication — are where the gathered START as they come into the covenant; the whole instruction is then learned progressively, Sabbath after Sabbath, in every city, where Moses has always been read. And what is read there is life, not bondage: *Ye shall therefore keep my statutes, and my judgments: which if a man do, he shall live in them: I am Yahuah (LORD)* (Leviticus 18:5). The decree opens the door at the threshold; the Sabbath reading of Moses keeps teaching the fuller walk home. Not a reduction of the Law to four rules, but four as the entry, and the rest growing in as the Father''s instruction is heard.'
WHERE slug = 'acts-15-moses-read-every-sabbath-the-torah-still-taught-not-cancelled';

COMMIT;
\echo 'session218 — Acts 15 council four-prohibitions frame revision complete.'
