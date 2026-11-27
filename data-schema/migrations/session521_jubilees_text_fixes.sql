-- =====================================================================
-- Session 521 migration — 2026-11-27 — Jubilees text corrections
-- Found while the Jubilees print edition was compared verse by verse against Charles 1917
-- (App/_s521/jub1917.py: 1,307 verses, no words dropped or added) and against the 1902 scan.
--   * Charles's margin years inside the verse: 4:20, 4:27, 8:1, 11:9, 45:1
--   * scan misreadings: 9:2 Sherri -> Shem; 8:16 cast -> east; 34:6 housel -> house,; bum -> burn (41:18, 25, 26);
--     com -> corn (26:31, 43:22); stray marks at 9:1, 15:31, 21:20, 22:25, 31:13, 43:10
--   * "Lord" said to a man, an idol and an angel had been given the Name: 13:28 Our lord Abram; 22:18 my lord (a stone);
--     32:25 Lord (Jacob to the angel)
--   * "Gentiles" restored where Charles reads Gentiles and the text had "nations" (23 places, 13 verses; 44:34 "seventy Gentile nations")
-- Rule 10: UPDATE in place; ids, verse numbers and card links untouched. Verses are touched only in the Jubilees edition.
-- The same replacements run over every surface that quotes verse text so quotations stay verbatim with the text.
-- The short Gentiles fragments run only on rows that cite the verse they come from.
-- Idempotent: a second run changes 0 rows.
-- Run:  python3 api/apply_migration.py data-schema/migrations/session521_jubilees_text_fixes.sql
-- =====================================================================
BEGIN;
CREATE TEMP TABLE _s521_long(old_t TEXT, new_t TEXT) ON COMMIT DROP;
INSERT INTO _s521_long VALUES
  ($f$Dânêl, 587 AM. the daughter$f$, $f$Dânêl, the daughter$f$),
  ($f$fourteenth 652 A M. jubilee$f$, $f$fourteenth jubilee$f$),
  ($f$first week, 1373 A M. in the beginning$f$, $f$first week, in the beginning$f$),
  ($f$in the first 1800 A M. year thereof$f$, $f$in the first year thereof$f$),
  ($f$country of Egypt, 2172 A M. into$f$, $f$country of Egypt, into$f$),
  ($f$Sherri also divided$f$, $f$Shem also divided$f$),
  ($f$of the whole cast,$f$, $f$of the whole east,$f$),
  ($f$to the west . of him$f$, $f$to the west of him$f$),
  ($f$from his housel he$f$, $f$from his house, he$f$),
  ($f$forth to bum her$f$, $f$forth to burn her$f$),
  ($f$he may bum therein$f$, $f$he may burn therein$f$),
  ($f$let them bum them$f$, $f$let them burn them$f$),
  ($f$let them bum the man$f$, $f$let them burn the man$f$),
  ($f$blessing him. 26:$f$, $f$blessing him.$f$),
  ($f$children of men ; for$f$, $f$children of men; for$f$),
  ($f$every kind of death..$f$, $f$every kind of death.$f$),
  ($f$said to him:, $f$, $f$said to him: $f$),
  ($f$have done evil.. Know$f$, $f$have done evil. Know$f$),
  ($f$plenty of com and wine$f$, $f$plenty of corn and wine$f$),
  ($f$which carried com,$f$, $f$which carried corn,$f$),
  ($f$Our Yahuah (God) Abram$f$, $f$Our lord Abram$f$),
  ($f$You are my Yahuah (God) and you are my deliverer$f$, $f$You are my lord and you are my deliverer$f$),
  ($f$Yahuah (God), how can I remember$f$, $f$Lord, how can I remember$f$),
  ($f$reckoned among the seventy nations.$f$, $f$reckoned among the seventy Gentile nations.$f$),
  ($f$and they will walk after the nations, and after their uncleanness,$f$, $f$and they will walk after the Gentiles, and after their uncleanness,$f$),
  ($f$deliver them into the hand of the nations for captivity, and for$f$, $f$deliver them into the hand of the Gentiles for captivity, and for$f$),
  ($f$shall scatter them amongst the nations.$f$, $f$shall scatter them amongst the Gentiles.$f$),
  ($f$turn to Me from amongst the nations with all their heart and$f$, $f$turn to Me from amongst the Gentiles with all their heart and$f$),
  ($f$gather them from amongst all the nations, and they will seek Me,$f$, $f$gather them from amongst all the Gentiles, and they will seek Me,$f$),
  ($f$hands of their enemies, the nations, lest they should rule$f$, $f$hands of their enemies, the Gentiles, lest they should rule$f$),
  ($f$not uncover themselves as the nations uncover themselves.$f$, $f$not uncover themselves as the Gentiles uncover themselves.$f$),
  ($f$according to the feasts of the nations after their error and$f$, $f$according to the feasts of the Gentiles after their error and$f$),
  ($f$treated their members like the nations, so that they may be removed$f$, $f$treated their members like the Gentiles, so that they may be removed$f$),
  ($f$the seed of his sons should be nations, and be reckoned with$f$, $f$the seed of his sons should be Gentiles, and be reckoned with$f$),
  ($f$should not be reckoned among the nations.$f$, $f$should not be reckoned among the Gentiles.$f$),
  ($f$against them the sinners of the nations, who have neither mercy$f$, $f$against them the sinners of the Gentiles, who have neither mercy$f$),
  ($f$the hand of the sinners, the nations; But none will be saved.$f$, $f$the hand of the sinners, the Gentiles; But none will be saved.$f$),
  ($f$the hands of the sinners the nations and in the hands of the$f$, $f$the hands of the sinners the Gentiles and in the hands of the$f$),
  ($f$man who is of the seed of the nations he shall surely die, and$f$, $f$man who is of the seed of the Gentiles he shall surely die, and$f$),
  ($f$give their daughters to the nations, and not to take for their$f$, $f$give their daughters to the Gentiles, and not to take for their$f$),
  ($f$any of the daughters of the nations, for this is abominable$f$, $f$any of the daughters of the Gentiles, for this is abominable$f$),
  ($f$who take the daughters of the nations; for this is unclean and$f$, $f$who take the daughters of the Gentiles; for this is unclean and$f$),
  ($f$wife of the daughters of the nations, or has given any of its$f$, $f$wife of the daughters of the Gentiles, or has given any of its$f$),
  ($f$to a man who is of any of the nations.$f$, $f$to a man who is of any of the Gentiles.$f$),
  ($f$land and region. Then will the nations fear before your face,$f$, $f$land and region. Then will the Gentiles fear before your face,$f$),
  ($f$and be reckoned with the nations; but$f$, $f$and be reckoned with the Gentiles; but$f$);
CREATE TEMP TABLE _s521_short(cite TEXT, old_t TEXT, new_t TEXT) ON COMMIT DROP;
INSERT INTO _s521_short VALUES
  ($f$Jubilees 1:9$f$, $f$after the nations$f$, $f$after the Gentiles$f$),
  ($f$Jubilees 1:13$f$, $f$of the nations$f$, $f$of the Gentiles$f$),
  ($f$Jubilees 1:13$f$, $f$amongst the nations$f$, $f$amongst the Gentiles$f$),
  ($f$Jubilees 1:15$f$, $f$amongst the nations$f$, $f$amongst the Gentiles$f$),
  ($f$Jubilees 1:15$f$, $f$all the nations$f$, $f$all the Gentiles$f$),
  ($f$Jubilees 1:19$f$, $f$enemies, the nations$f$, $f$enemies, the Gentiles$f$),
  ($f$Jubilees 3:31$f$, $f$as the nations$f$, $f$as the Gentiles$f$),
  ($f$Jubilees 6:35$f$, $f$of the nations$f$, $f$of the Gentiles$f$),
  ($f$Jubilees 15:34$f$, $f$like the nations$f$, $f$like the Gentiles$f$),
  ($f$Jubilees 16:17$f$, $f$should be nations$f$, $f$should be Gentiles$f$),
  ($f$Jubilees 16:17$f$, $f$with the nations$f$, $f$with the Gentiles$f$),
  ($f$Jubilees 16:17$f$, $f$among the nations$f$, $f$among the Gentiles$f$),
  ($f$Jubilees 23:23$f$, $f$of the nations$f$, $f$of the Gentiles$f$),
  ($f$Jubilees 23:24$f$, $f$sinners, the nations$f$, $f$sinners, the Gentiles$f$),
  ($f$Jubilees 24:28$f$, $f$sinners the nations$f$, $f$sinners the Gentiles$f$),
  ($f$Jubilees 30:7$f$, $f$of the nations$f$, $f$of the Gentiles$f$),
  ($f$Jubilees 30:11$f$, $f$to the nations$f$, $f$to the Gentiles$f$),
  ($f$Jubilees 30:11$f$, $f$of the nations$f$, $f$of the Gentiles$f$),
  ($f$Jubilees 30:13$f$, $f$of the nations$f$, $f$of the Gentiles$f$),
  ($f$Jubilees 30:14$f$, $f$of the nations$f$, $f$of the Gentiles$f$),
  ($f$Jubilees 31:18$f$, $f$will the nations$f$, $f$will the Gentiles$f$);
DO $s521$
DECLARE r RECORD; n INT; tv INT := 0; tc INT := 0; tx INT := 0; tt INT := 0; tm INT := 0; left_over INT;
BEGIN
  FOR r IN SELECT * FROM _s521_long LOOP
    UPDATE verses v SET text = replace(v.text, r.old_t, r.new_t)
      FROM chapters c JOIN books b ON b.id = c.book_id AND b.slug = 'jubilees'
                      JOIN editions e ON e.id = b.edition_id AND e.slug = 'jubilees'
     WHERE c.id = v.chapter_id AND position(r.old_t in v.text) > 0;
    GET DIAGNOSTICS n = ROW_COUNT; tv := tv + n;
    UPDATE commentary_entries SET body = replace(body, r.old_t, r.new_t) WHERE position(r.old_t in body) > 0;
    GET DIAGNOSTICS n = ROW_COUNT; tc := tc + n;
    UPDATE cross_references SET note = replace(note, r.old_t, r.new_t) WHERE position(r.old_t in note) > 0;
    GET DIAGNOSTICS n = ROW_COUNT; tx := tx + n;
    UPDATE cross_reference_threads SET summary_md = replace(summary_md, r.old_t, r.new_t) WHERE position(r.old_t in summary_md) > 0;
    GET DIAGNOSTICS n = ROW_COUNT; tt := tt + n;
    UPDATE cross_reference_thread_members SET member_note = replace(member_note, r.old_t, r.new_t) WHERE position(r.old_t in member_note) > 0;
    GET DIAGNOSTICS n = ROW_COUNT; tm := tm + n;
  END LOOP;
  FOR r IN SELECT * FROM _s521_short LOOP
    UPDATE commentary_entries SET body = replace(body, r.old_t, r.new_t)
     WHERE position(r.cite in body) > 0 AND position(r.old_t in body) > 0;
    GET DIAGNOSTICS n = ROW_COUNT; tc := tc + n;
    UPDATE cross_references SET note = replace(note, r.old_t, r.new_t)
     WHERE position(r.cite in note) > 0 AND position(r.old_t in note) > 0;
    GET DIAGNOSTICS n = ROW_COUNT; tx := tx + n;
    UPDATE cross_reference_threads SET summary_md = replace(summary_md, r.old_t, r.new_t)
     WHERE position(r.cite in summary_md) > 0 AND position(r.old_t in summary_md) > 0;
    GET DIAGNOSTICS n = ROW_COUNT; tt := tt + n;
    UPDATE cross_reference_thread_members SET member_note = replace(member_note, r.old_t, r.new_t)
     WHERE position(r.cite in member_note) > 0 AND position(r.old_t in member_note) > 0;
    GET DIAGNOSTICS n = ROW_COUNT; tm := tm + n;
  END LOOP;
  SELECT count(*) INTO left_over FROM verses v JOIN chapters c ON c.id = v.chapter_id
    JOIN books b ON b.id = c.book_id AND b.slug = 'jubilees' JOIN editions e ON e.id = b.edition_id AND e.slug = 'jubilees'
   WHERE EXISTS (SELECT 1 FROM _s521_long l WHERE position(l.old_t in v.text) > 0);
  RAISE NOTICE 'S521 Jubilees fixes — verse updates: %  commentary: %  xref notes: %  thread summaries: %  member notes: %  | Jubilees verses still carrying a defect: % (expect 0)', tv, tc, tx, tt, tm, left_over;
  IF left_over <> 0 THEN RAISE EXCEPTION 'S521: % Jubilees verses still carry a defect — nothing changed', left_over; END IF;
END $s521$;
COMMIT;
