-- session352_delete_mrjames_apocryphal_nt.sql
--
-- S352 — DELETE the M.R. James "Apocryphal New Testament" set (Yoshi decision,
-- 2026-06-21). These 5 books were never built into clean readable scripture:
-- the stored verse rows are M.R. James's raw scholarly apparatus (editorial
-- introductions, manuscript-collation notes, tables of contents, OCR-garbled
-- fragments) with broken verse numbering (continuous-across-chapters,
-- starts-at-v22 fragments). They are docetic/Marian and were already excluded
-- from the picker (S351); this removes the underlying data entirely so they no
-- longer appear or render.
--
-- The set (edition mrjames-apocryphal-nt, id=10):
--   805 book-of-james-protevangelium  'The Book of James, or Protevangelium'
--   806 gospel-peter                  'The Gospel of Peter'
--   807 gospel-nicodemus-acts-pilate  'The Gospel of Nicodemus, or Acts of Pilate'
--   808 apocalypse-of-peter           'The Apocalypse of Peter'
--   809 apocalypse-of-paul            'The Apocalypse of Paul'
-- (There is NO separate Infancy Gospel of Thomas book; Thomas material only
--  appears inside the Protevangelium's text.)
--
-- SAFETY (verified against prod before writing this migration):
--   * 0 cross_references reference these verses (source or target) — no RESTRICT block.
--   * 0 cross_reference_threads are anchored in these books.
--   * 0 commentary_entries reference these chapters/verses — no RESTRICT block.
--   * chapters.book_id and verses.chapter_id are ON DELETE CASCADE, so deleting
--     the books removes their chapters and verses automatically.
-- KEEPERS ARE UNTOUCHED — this migration only ever names edition
-- 'mrjames-apocryphal-nt'. Enoch, Jasher, Jubilees, the Apocrypha proper, the
-- pseudepigrapha, Josephus, the Apostolic Fathers (incl. Barnabas) are not affected.
--
-- Reversible: `git revert` this commit + re-import the edition via seed.py.

BEGIN;

-- Delete the 5 books (cascades to their chapters + verses).
DELETE FROM books
 WHERE edition_id = (SELECT id FROM editions WHERE slug = 'mrjames-apocryphal-nt')
   AND slug IN (
     'book-of-james-protevangelium',
     'gospel-peter',
     'gospel-nicodemus-acts-pilate',
     'apocalypse-of-peter',
     'apocalypse-of-paul'
   );

-- Remove the now-empty edition row (only books.edition_id references editions).
DELETE FROM editions WHERE slug = 'mrjames-apocryphal-nt';

COMMIT;
