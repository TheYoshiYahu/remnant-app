-- =====================================================================
-- Session 499 migration — 2026-11-13
-- Noe -> Noah: the King James New Testament carries the Greek spelling of
-- the patriarch's name (Matthew 24:37-38; Luke 3:36; Luke 17:26-27) and
-- the KJV Apocrypha does once (Tobit 4:12); the Apocalypse of Paul once.
-- One man, one name across both testaments. Yoshi's call, Nov 13 2026.
--
-- Rule 10: UPDATE in place, ids and verse numbers untouched, no card moves.
-- Word-boundary regex (\mNoe\M) so only the bare name changes — nothing
-- inside another word. The same replacement runs over every surface that
-- quotes verse text (commentary bodies, cross-reference notes, thread
-- summaries, member notes) so quotations stay verbatim with the live text.
-- Idempotent: a re-run finds nothing to change.
-- Run:  python3 api/apply_migration.py data-schema/migrations/session499_noe_to_noah.sql
-- =====================================================================
\echo 'session499 — Noe -> Noah starting...'
BEGIN;

DO $before$
DECLARE v INT; c INT; x INT; t INT; m INT;
BEGIN
    SELECT count(*) INTO v FROM verses WHERE text ~ '\mNoe\M';
    SELECT count(*) INTO c FROM commentary_entries WHERE body ~ '\mNoe\M';
    SELECT count(*) INTO x FROM cross_references WHERE note ~ '\mNoe\M';
    SELECT count(*) INTO t FROM cross_reference_threads WHERE summary_md ~ '\mNoe\M';
    SELECT count(*) INTO m FROM cross_reference_thread_members WHERE member_note ~ '\mNoe\M';
    RAISE NOTICE 'S499 BEFORE  verses: %  commentary: %  xref notes: %  thread summaries: %  member notes: %', v, c, x, t, m;
END $before$;

UPDATE verses SET text = regexp_replace(text, '\mNoe\M', 'Noah', 'g') WHERE text ~ '\mNoe\M';
UPDATE commentary_entries SET body = regexp_replace(body, '\mNoe\M', 'Noah', 'g') WHERE body ~ '\mNoe\M';
UPDATE cross_references SET note = regexp_replace(note, '\mNoe\M', 'Noah', 'g') WHERE note ~ '\mNoe\M';
UPDATE cross_reference_threads SET summary_md = regexp_replace(summary_md, '\mNoe\M', 'Noah', 'g') WHERE summary_md ~ '\mNoe\M';
UPDATE cross_reference_thread_members SET member_note = regexp_replace(member_note, '\mNoe\M', 'Noah', 'g') WHERE member_note ~ '\mNoe\M';

DO $after$
DECLARE v INT; n INT;
BEGIN
    SELECT count(*) INTO v FROM verses WHERE text ~ '\mNoe\M';
    SELECT count(*) INTO n FROM verses WHERE text ~ '\mNoah\M';
    RAISE NOTICE 'S499 AFTER   verses still saying Noe: % (expect 0)  verses saying Noah: %', v, n;
END $after$;

COMMIT;
\echo 'session499 — done.'
