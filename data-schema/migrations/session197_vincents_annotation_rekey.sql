-- S197 — re-key the 5 vincents tool_annotations rows from lemma-level
-- ('romans.10.4:telos') to verse-level ('romans.10.4'), per the S196
-- checkpoint decision: the band attaches per verse regardless of which
-- head-phrase the reader is on. None of the 5 share a verse, so no
-- collisions on the UNIQUE(tool, entry_key). Idempotent: split_part is a
-- no-op on rows already at verse level.

BEGIN;

UPDATE tool_annotations
   SET entry_key = split_part(entry_key, ':', 1)
 WHERE tool = 'vincents' AND entry_key LIKE '%:%';

DO $v$ DECLARE bad INT; BEGIN
  SELECT COUNT(*) INTO bad FROM tool_annotations WHERE tool='vincents' AND entry_key LIKE '%:%';
  IF bad > 0 THEN RAISE EXCEPTION 'vincents rekey left % lemma keys', bad; END IF;
  RAISE NOTICE 'session197 vincents annotation rekey: all rows verse-level.';
END $v$;

COMMIT;
