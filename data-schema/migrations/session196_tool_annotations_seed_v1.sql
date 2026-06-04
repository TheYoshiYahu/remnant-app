-- session-196 — tool_annotations seed v1 (the punch list + first authored corrections)
-- Seeded from SOURCE_TEXT_INVENTORY.md §III per-tool "framework-conflict points".
-- DEPENDS ON: session196_tool_annotations.sql (creates the table).
-- Re-runnable: every row uses ON CONFLICT (tool, entry_key) DO UPDATE.
--
-- Voice: Sacred Names + Come-and-See (quote-don't-cite) per yoshi-voice SKILL.md.
-- Authored under the 12 Red Lines. is_punch_list_only = TRUE marks a conflict point
-- logged for the authoring wheel but NOT yet given a full author-reviewed annotation;
-- the render surface shows only is_punch_list_only = FALSE rows as live corrections.
--
-- BDB / LSJ / Strong's word-callouts: the 34 high-impact Hebrew/Greek terms already
-- live, author-reviewed, in lexicon_callouts (S162). They are NOT duplicated here;
-- the bdb/lsj rows below are punch-list INDEX rows so this table is the single program
-- view of every tool's conflict surface, pointing at the lexicon_callouts home where a
-- full callout already exists and flagging the entries that still need one.

BEGIN;

-- ─────────────────────────────────────────────────────────────────────────────
-- BDB (Hebrew depth lexicon) — index rows; full word-callouts live in lexicon_callouts
-- ─────────────────────────────────────────────────────────────────────────────
INSERT INTO tool_annotations
    (tool, entry_key, term_display, conflict_summary, annotation_md, tier_required, red_lines_cited, is_punch_list_only, last_reviewed_at)
VALUES
('bdb', 'H0120', 'adam / ben adam',
 'Flattens adam and ben adam to generic "man / mankind / son of man" — erases the seed-of-Adam lineage (Red Line #12).',
 'See lexicon_callouts for the authored word-callout on the Adamic lineage; the rendered BDB surface (§26) pulls that callout. *Son of man* hides what *son of Adam* names: the specific paternal blood line on which the whole framework rests.',
 'complete_study', ARRAY['12','3','7']::TEXT[], TRUE, NULL),

('bdb', 'H1471', 'goy / goyim',
 'Glossed "nation / Gentile / heathen" — feeds the Jew/Gentile binary, missing Category 2 (scattered seed) vs Category 3 (the nations).',
 'The binary is the lie. *Goy/goyim* in the prophets carries the scattered seed of Yashar''el (Israel) living *among* the nations (Category 2), not only the nations themselves (Category 3). A gloss that collapses both into "Gentile/heathen" erases the gathering. Full authored annotation pending — punch-list logged.',
 'complete_study', ARRAY['1','3','7']::TEXT[], TRUE, NULL),

('bdb', 'H3478', 'Yisrael',
 'Treated as ethnic/national with no two-house (Yahudah + scattered Ephraim) distinction.',
 'Yashar''el (Israel) is a two-house covenant body — the house of Yahudah (Judah) and the scattered house of Yosef/Ephraim — not a single ethnic-national bloc. The lexicon''s flat gloss hides the divorce-and-gathering the prophets named. Punch-list logged.',
 'complete_study', ARRAY['3','7','11']::TEXT[], TRUE, NULL),

('bdb', 'H2233', 'zera (seed)',
 'Under-develops the scattered/dispersed-lineage sense of "seed".',
 '*Zera* is the paternal blood lineage carried forward — the seed scattered into the nations and gathered home, not a generic "offspring". Punch-list logged.',
 'complete_study', ARRAY['3','7']::TEXT[], TRUE, NULL),

('bdb', 'H1616', 'ger (stranger)',
 'Leans "proselyte/foreigner," feeding false-inclusion vs the Isaiah 56 scattered-coming-home reading.',
 'The Isaiah 56 *ger* is the scattered seed estranged from their own covenant identity by exile, coming home — not a heathen added to Yashar''el (Israel) by self-selection. Reading *ger* as "convert from the nations" is the false-inclusion gloss. Punch-list logged.',
 'complete_study', ARRAY['3','7']::TEXT[], TRUE, NULL),

('bdb', 'H8451', 'torah',
 'Framed as "law".',
 'Torah is the covenant instruction of the living Elohim (God) and the inheritance — never "the law" set against grace (Red Lines #4, #5). Punch-list logged.',
 'complete_study', ARRAY['4','5','6']::TEXT[], TRUE, NULL),

-- ─────────────────────────────────────────────────────────────────────────────
-- LSJ (Greek depth lexicon) — index rows; full word-callouts live in lexicon_callouts
-- ─────────────────────────────────────────────────────────────────────────────
('lsj', 'G1577', 'ekklesia',
 '"church/assembly" feeds church-as-Israel replacement.',
 'See lexicon_callouts for the authored callout. *Ekklesia* is the LXX''s word for the *qahal* — the called-out covenant congregation of Yashar''el (Israel) — not a new institution replacing her.',
 'complete_study', ARRAY['1','2','7']::TEXT[], TRUE, NULL),

('lsj', 'G3551', 'nomos',
 '"law" feeds antinomian Paul / Torah-as-curse.',
 'See lexicon_callouts. *Nomos* in Sha''ul (Paul) renders *torah*; the "curse of the law" is the Deuteronomy 28 exile judgment, never the Torah itself (Red Line #4).',
 'complete_study', ARRAY['2','4','5']::TEXT[], TRUE, NULL),

('lsj', 'G1484', 'ethnos / ethne',
 '"Gentiles/nations" feeds the binary, missing the scattered seed living among the nations.',
 'See lexicon_callouts. Sha''ul''s (Paul''s) "Gentiles" are often Category 2 — the lost sheep of the house of Yashar''el (Israel) living as Gentiles among the nations (Hosea 1:10; Romans 9:25–26).',
 'complete_study', ARRAY['1','3','7']::TEXT[], TRUE, NULL),

('lsj', 'G5485', 'charis (grace)',
 'Classical/Reformation register feeds sola-fide (Red Lines #5, #10).',
 'See lexicon_callouts. Grace is the means of return to him and his ways — not a cancellation of the covenant standard. The Reformation sentence is cut in half; the framework completes it (Red Line #10).',
 'complete_study', ARRAY['5','10']::TEXT[], TRUE, NULL),

('lsj', 'G0444', 'huios tou anthropou',
 '"son of man" flattening (Red Line #12).',
 'See lexicon_callouts. Restore to *son of Adam* — the lineage weight the translators flattened; the kaph-comparative carved out at Daniel 7:13 / Revelation 1:13 / 14:14.',
 'complete_study', ARRAY['12']::TEXT[], TRUE, NULL),

-- ─────────────────────────────────────────────────────────────────────────────
-- Vincent's Word Studies (NT/Greek expository) — first authored corrections
-- entry_key = '<book-slug>.<chapter>.<verse>:<greek-lemma>'
-- ─────────────────────────────────────────────────────────────────────────────
('vincents', 'romans.10.4:telos', 'telos / "end of the law"',
 'Vincent reads Christ as the terminus of the law-era — the antinomian collapse.',
 'Vincent glosses *telos nomou* (Romans 10:4) toward the inherited "Messiah is the end/termination of the law" reading. *Telos* is the goal, the aim, the destination toward which the Torah points — not its abolition. The Messiah (Christ) is the *aim* the Torah was always walking the covenant toward, the one in whom it is filled full, not emptied out. Read with Red Lines #4 and #5: the curse the Messiah redeems from is the Deuteronomy 28 exile judgment, never the Torah, and justification (by faith) and covenant conduct (by Spirit-empowered Torah) are two questions, not one contest.',
 'complete_study', ARRAY['2','4','5']::TEXT[], FALSE, '2026-06-04 00:00:00+00'),

('vincents', 'galatians.3.24:paidagogos', 'paidagogos / "schoolmaster"',
 'Vincent frames exiting the paidagogos as graduating out of the Torah.',
 'Vincent takes the *paidagogos* (Galatians 3:24) as the Torah-era the believer leaves behind at maturity. Exiting the *paidagogos* is entering full sonship — and the inheritance of the son *includes* the Torah, written now on the heart (Jeremiah 31:33; Ezekiel 36:26–27). The guardian-to-the-school is left; the Father''s house, and his instruction within it, is entered. Not graduation *out of* the covenant standard — arrival *into* it as a son rather than a ward.',
 'complete_study', ARRAY['4','5','6']::TEXT[], FALSE, '2026-06-04 00:00:00+00'),

('vincents', 'ephesians.2.15:nomos', 'nomos / "abolished the law"',
 'Vincent reads the "middle wall" passage as Torah abolished to make one new man.',
 'Vincent reads Ephesians 2:15 as the Torah itself broken down. What is broken down is the *enmity* — the circumcision-party hierarchy of flesh-access that fenced the scattered seed out (the "works of the law" performance-system, not the covenant instruction). The "one new man" is the two houses made one in the Messiah (Christ), the *gathering* the prophets promised — not a third entity replacing Yashar''el (Israel). Red Lines #1, #2, #7.',
 'complete_study', ARRAY['1','2','7']::TEXT[], FALSE, '2026-06-04 00:00:00+00'),

('vincents', 'romans.3.28:dikaioo', 'dikaioō / "justified by faith without works"',
 'Vincent reads justification as standing apart from, and against, Torah-keeping.',
 'Vincent''s *dikaioō* note pits faith against works of Torah in the Reformation grammar. Justification is by faith/promise; covenant life is by Spirit-empowered Torah observance — two different questions, never a contest (Red Line #5). The "works" Sha''ul (Paul) excludes are the circumcision-party''s flesh-performance system (*erga nomou*), never the Spirit-led keeping of the Father''s instruction the new heart is given *to do* (Ezekiel 36:27).',
 'complete_study', ARRAY['5','6','10']::TEXT[], FALSE, '2026-06-04 00:00:00+00'),

('vincents', 'matthew.16.18:ekklesia', 'ekklesia / "church"',
 'Vincent carries "church" as the new institution built on Peter.',
 'Vincent renders *ekklesia* (Matthew 16:18) as the Christian church. The word is the LXX''s *qahal* — the called-out covenant congregation. What is built is the gathered assembly of the covenant people, the lost sheep the Shepherd came for (Matthew 15:24) — not an institution standing in Yashar''el''s (Israel''s) place. Red Lines #1, #7.',
 'complete_study', ARRAY['1','7']::TEXT[], FALSE, '2026-06-04 00:00:00+00'),

-- ─────────────────────────────────────────────────────────────────────────────
-- Interlinear — gloss-cell notes (entry_key = Strong's number of the cell)
-- ─────────────────────────────────────────────────────────────────────────────
('interlinear', 'H3068', 'YHWH gloss cell',
 'The gloss cell renders the Tetragrammaton "the LORD / Jehovah", masking the Name.',
 'The §28 interlinear already restores *Yahuah* in the divine-name cells; this note marks why. The English gloss "LORD/Jehovah" is the inherited mask — the Name is *Yahuah*, four vowel-sounds (Josephus, *Wars* 5.5.7). The consonants are יהוה; the gloss column is where the mask was installed.',
 'complete_study', ARRAY['7']::TEXT[], FALSE, '2026-06-04 00:00:00+00'),

('interlinear', 'G0444', 'anthropos gloss cell',
 'The gloss cell renders huios tou anthropou "son of man", flattening the lineage.',
 'Where the interlinear gloss reads "son of man", the restored reading is *son of Adam* — the seed-of-Adam lineage the translators flattened (Red Line #12). The lemma/morphology cells are neutral; the gloss cell is where the flattening lives.',
 'complete_study', ARRAY['12']::TEXT[], FALSE, '2026-06-04 00:00:00+00'),

-- ─────────────────────────────────────────────────────────────────────────────
-- Nikkudot — the single Tetragrammaton-pointing conflict (full authored note)
-- ─────────────────────────────────────────────────────────────────────────────
('nikkudot', 'tetragrammaton', 'The pointing of יהוה',
 'The Masoretic pointing of the Tetragrammaton borrows the Adonai/Elohim vowels (the "Yehovah" form) — the inherited masking of the Name.',
 'The Nikkudot surface shows the pointed יהוה. The traditional pointing does not give the Name''s own vowels — it borrows the vowels of *Adonai* (and, beside *Adonai Yahuah*, of *Elohim*), the scribal convention that told the reader to *say something else* rather than pronounce the Name. The hybrid form read off those borrowed points ("Yehovah") is an artifact of the mask, not the pronunciation. The Name is *Yahuah* — four vowel-sounds, Ee-Ah-Oo-Ah, as Josephus described the four vowels of the priestly mitre (*Wars* 5.5.7). The pointing is otherwise neutral and trustworthy; this one set of points is where the tradition deliberately obscured what it was pointing at.',
 'complete_study', ARRAY['7']::TEXT[], FALSE, '2026-06-04 00:00:00+00'),

-- ─────────────────────────────────────────────────────────────────────────────
-- Nave's Topical Bible — the taxonomy IS the conflict (subordinate foil)
-- entry_key = topic slug
-- ─────────────────────────────────────────────────────────────────────────────
('naves', 'gentiles', 'Nave''s heading: "Gentiles"',
 'The heading itself pre-decides the binary; "Gentiles, conversion of" encodes false-inclusion.',
 'Nave''s organizes verses under a "Gentiles" heading (and sub-headings like "conversion of") that bake the Jew/Gentile binary and the inclusion gospel into the index before a verse is read. Many verses filed here speak of the scattered seed of Yashar''el (Israel) living *among* the nations — Category 2, the lost sheep coming home — not of the nations being spliced into the covenant by belief. The heading is the inherited reading; read the verses under it through the three categories (Yahudah, scattered Yisrael, the nations), not the binary. This is a clearly-labeled inherited foil, kept subordinate to the curated threads.',
 'complete_study', ARRAY['1','3','7']::TEXT[], FALSE, '2026-06-04 00:00:00+00'),

('naves', 'church', 'Nave''s heading: "Church"',
 'A "Church" heading organizes covenant-congregation verses under the replacement institution.',
 'Verses about the *qahal* / *ekklesia* — the called-out covenant congregation — are filed under "Church", importing the church-replaced-Israel reading into the index. The gathered assembly is the covenant people gathered, not an institution in Yashar''el''s (Israel''s) place. Subordinate inherited foil; read through Red Lines #1 and #7.',
 'complete_study', ARRAY['1','2','7']::TEXT[], FALSE, '2026-06-04 00:00:00+00'),

('naves', 'law', 'Nave''s heading: "Law" (abolished / Christian liberty)',
 'Sub-headings frame Torah as abolished or as bondage opposed to liberty.',
 'Nave''s files Torah verses under sub-headings that carry the antinomian reading — "the law" as the abolished bondage that "Christian liberty" replaces. Torah is the covenant instruction and the inheritance; the curse is the exile judgment of Deuteronomy 28, not the Torah (Red Lines #4, #5). Subordinate inherited foil.',
 'complete_study', ARRAY['4','5','6']::TEXT[], FALSE, '2026-06-04 00:00:00+00'),

('naves', 'israel', 'Nave''s heading: "Israel"',
 'Treats Israel as a single ethnic-national entity, no two-house / scattered-seed distinction.',
 'The "Israel" heading collapses the two-house covenant body (Yahudah + scattered Ephraim/Yosef) into one national entity, hiding the divorce, scattering, and gathering the prophets named. Read the verses filed here through the three categories. Subordinate inherited foil.',
 'complete_study', ARRAY['3','7','11']::TEXT[], FALSE, '2026-06-04 00:00:00+00'),

-- ─────────────────────────────────────────────────────────────────────────────
-- Maps — territorial framing + the dispersion/gathering overlay
-- ─────────────────────────────────────────────────────────────────────────────
('maps', 'dispersion-overlay', 'The scattering / gathering overlay',
 'Most "Holy Land" maps omit the dispersion geography entirely — the routes that scattered the ten tribes into the nations.',
 'The framework''s positive use of the map is the geography the inherited atlases leave off: the Assyrian and Babylonian exile routes that scattered the house of Yashar''el (Israel) into the nations, and the gathering the prophets promised back from them — *Isaiah 11, Jeremiah 31, Ezekiel 37, Hosea 1*. This overlay adds the scattering arrows out of the land and the gathering arrows home, so the map tells the covenant story (divorce → dispersion → second recovery) the "Israel = the land" framing hides. Rendered on our own tiles from openbible.info coordinates (CC-BY); no copyrighted atlas plate is shipped.',
 'complete_study', ARRAY['1','3','7']::TEXT[], FALSE, '2026-06-04 00:00:00+00'),

('maps', 'region:israel', 'Map label: "Israel" boundaries',
 'Boundaries are drawn as the southern kingdom / modern state rather than the twelve-tribe covenant body.',
 'When the map labels "Israel", the inherited convention draws the southern kingdom or the modern state — the same counterfeit-gathering framing (Herod''s temple then, the modern state now) that stands in for the prophetic ingathering of all twelve tribes still future (Ezekiel 20:33–38). The covenant body is the twelve tribes, scattered and gathering, not a single political boundary on the map. Annotation rides the "Israel" label.',
 'complete_study', ARRAY['3','7','11']::TEXT[], FALSE, '2026-06-04 00:00:00+00'),

-- ─────────────────────────────────────────────────────────────────────────────
-- TSK — distortion-class sweep notes (entry_key = 'sweep:<class>')
-- One row per distortion class; the standalone tool stays subordinate and opt-in.
-- ─────────────────────────────────────────────────────────────────────────────
('tsk', 'sweep:grace-vs-law', 'TSK distortion class: grace-vs-law pairings',
 'TSK cross-reference selections chain grace passages against Torah passages in the antinomian grammar.',
 'Where TSK pairs a "grace" verse against a "law" verse to teach that one displaces the other, the framework holds them together: grace is the means of return to the Father and his ways, not the cancellation of the covenant standard (Red Lines #5, #10). The standalone TSK tool is the inherited cross-reference grammar shown as a labeled foil — not the page; the curated threads are the page.',
 'complete_study', ARRAY['5','10']::TEXT[], FALSE, '2026-06-04 00:00:00+00'),

('tsk', 'sweep:jew-gentile', 'TSK distortion class: Jew/Gentile pairings',
 'TSK links assume the two-category binary, missing the scattered seed.',
 'TSK chains that read every "Gentile" verse as Category 3 (the nations) miss Category 2 — the scattered seed living among the nations, the lost sheep coming home. Read the pairs through the three categories. Labeled foil, subordinate to the curated threads.',
 'complete_study', ARRAY['1','3','7']::TEXT[], FALSE, '2026-06-04 00:00:00+00'),

('tsk', 'sweep:church-as-israel', 'TSK distortion class: church-as-Israel pairings',
 'NT-reads-OT links that assume the church fulfills/replaces Israel.',
 'TSK''s NT→OT chains often assume the church inherits Yashar''el''s (Israel''s) promises. Both olive branches are Yashar''el (Israel); no non-olive branch is grafted in (Red Line #11). The gathered assembly is the covenant people gathered, not an institution replacing them. Labeled foil.',
 'complete_study', ARRAY['1','2','7','11']::TEXT[], FALSE, '2026-06-04 00:00:00+00'),

('tsk', 'sweep:torah-as-curse', 'TSK distortion class: Torah-as-curse pairings',
 'Pairings that gloss the "curse of the law" as the Torah itself.',
 'Where TSK chains the "curse of the law" to Torah-commands as if the commands are the curse, the curse is the Deuteronomy 28 exile judgment for covenant-breaking — never the Torah, which is the inheritance (Red Line #4). Labeled foil, run through this sweep before launch.',
 'complete_study', ARRAY['4','5']::TEXT[], FALSE, '2026-06-04 00:00:00+00')

ON CONFLICT (tool, entry_key) DO UPDATE SET
    term_display       = EXCLUDED.term_display,
    conflict_summary   = EXCLUDED.conflict_summary,
    annotation_md      = EXCLUDED.annotation_md,
    tier_required      = EXCLUDED.tier_required,
    red_lines_cited    = EXCLUDED.red_lines_cited,
    is_punch_list_only = EXCLUDED.is_punch_list_only,
    last_reviewed_at   = EXCLUDED.last_reviewed_at,
    updated_at         = NOW();

DO $verify$
DECLARE
    n_total INT;
    n_live  INT;
BEGIN
    SELECT COUNT(*) INTO n_total FROM tool_annotations;
    SELECT COUNT(*) INTO n_live  FROM tool_annotations WHERE is_punch_list_only = FALSE;
    RAISE NOTICE 'session196 seed: % tool_annotations rows (% live corrections, % punch-list).',
        n_total, n_live, n_total - n_live;
    IF n_total < 25 THEN
        RAISE EXCEPTION 'session196 seed verify failed: expected >= 25 rows, got %', n_total;
    END IF;
END
$verify$;

COMMIT;
