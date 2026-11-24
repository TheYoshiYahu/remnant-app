-- =====================================================================
-- Session 458a — 2026-11-23 — 1 Enoch 71:13–14: the Ethiopic address to Enoch restored.
-- Yoshi (Nov 23): "it must say you are the son of adam." Charles 1917 turned the angel's words to Enoch into the third person
-- ("This is the Son of Man who is born unto righteousness") and added a bracketed "lost passage" note at verse 13. Both are his.
-- This puts the direct address back in 71:14 and takes the bracketed note out of 71:13. Two rows, ids kept, nothing else touched.
-- Guarded: each row must hold either the old text or the new text, or the whole migration stops. Idempotent.
-- Run: python3 api/apply_migration.py data-schema/migrations/session458a_enoch_71_address.sql
-- =====================================================================
BEGIN;
CREATE OR REPLACE TEMP VIEW s458a_v AS
SELECT v.id, v.verse_number, v.text FROM verses v JOIN chapters c ON c.id = v.chapter_id JOIN books b ON b.id = c.book_id JOIN editions e ON e.id = b.edition_id
 WHERE e.slug = 'enoch' AND b.slug = '1-enoch' AND c.chapter_number = 71 AND v.verse_number IN (13, 14);
DO $$ DECLARE n INT; BEGIN
  SELECT count(*) INTO n FROM s458a_v WHERE (verse_number = 13 AND text IN ($t$And that Head of Days came with Michael and Gabriel, Raphael and Phanuel, thousands and ten thousands of angels without number. [Lost passage wherein the Son of Adam was described as accompanying the Head of Days, and Enoch asked one of the angels (as in xlvi. 3) concerning the Son of Adam as to who he was.]$t$, $t$And that Head of Days came with Michael and Gabriel, Raphael and Phanuel, thousands and ten thousands of angels without number.$t$)) OR (verse_number = 14 AND text IN ($t$And he (i.e. the angel) came to me and greeted me with His voice, and said unto me: ‘This is the Son of Adam who is born unto righteousness, And righteousness abides over him, And the righteousness of the Head of Days forsakes him not.’$t$, $t$And he came to me and greeted me with his voice, and said unto me: ‘You are the son of Adam who was born unto righteousness, And righteousness abides over you, And the righteousness of the Head of Days forsakes you not.’$t$));
  IF n <> 2 THEN RAISE EXCEPTION 'S458a: expected 1 Enoch 71:13 and 71:14 to hold the known old or new text; % of 2 match — read the live verses before this commits', n; END IF;
END $$;
UPDATE verses SET text = $t$And that Head of Days came with Michael and Gabriel, Raphael and Phanuel, thousands and ten thousands of angels without number.$t$ WHERE id = (SELECT id FROM s458a_v WHERE verse_number = 13) AND text = $t$And that Head of Days came with Michael and Gabriel, Raphael and Phanuel, thousands and ten thousands of angels without number. [Lost passage wherein the Son of Adam was described as accompanying the Head of Days, and Enoch asked one of the angels (as in xlvi. 3) concerning the Son of Adam as to who he was.]$t$;
UPDATE verses SET text = $t$And he came to me and greeted me with his voice, and said unto me: ‘You are the son of Adam who was born unto righteousness, And righteousness abides over you, And the righteousness of the Head of Days forsakes you not.’$t$ WHERE id = (SELECT id FROM s458a_v WHERE verse_number = 14) AND text = $t$And he (i.e. the angel) came to me and greeted me with His voice, and said unto me: ‘This is the Son of Adam who is born unto righteousness, And righteousness abides over him, And the righteousness of the Head of Days forsakes him not.’$t$;
DO $$ DECLARE n INT; BEGIN
  SELECT count(*) INTO n FROM s458a_v WHERE (verse_number = 13 AND text = $t$And that Head of Days came with Michael and Gabriel, Raphael and Phanuel, thousands and ten thousands of angels without number.$t$) OR (verse_number = 14 AND text = $t$And he came to me and greeted me with his voice, and said unto me: ‘You are the son of Adam who was born unto righteousness, And righteousness abides over you, And the righteousness of the Head of Days forsakes you not.’$t$);
  IF n <> 2 THEN RAISE EXCEPTION 'S458a: after the update % of 2 verses hold the new text', n; END IF;
END $$;
COMMIT;
