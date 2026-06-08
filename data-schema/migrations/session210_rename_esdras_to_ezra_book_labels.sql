-- S210 — Rename the two Esdras books to their Ezra numbering (Yoshi, S210)
--
-- The KJV/Charles Apocrypha's "1 Esdras" and "2 Esdras" ARE the books the
-- Vulgate numbers 3 Ezra and 4 Ezra (canonical Ezra/Nehemiah being 1/2 Ezra
-- in that scheme). This is the historically-correct numbering, not a relabel
-- for taste. Per the conventional-English book-name rule (voice skill) these
-- stay in English — just renumbered.
--
-- Reader discoverability: every English reader knows these as "Esdras" (the
-- KJV name), and search matches on the visible title string, so the display
-- carries BOTH names — "3 Ezra (also called 1 Esdras)" — so a reader looking
-- for either number finds the book.
--
-- DISPLAY ONLY. The internal slugs ('1-esdras', '2-esdras') are the stable
-- keys used across the books table, paragraph-start maps, deep links, and all
-- cross-reference thread keys. They are deliberately left unchanged — keeping
-- "esdras" in the slug preserves every existing reference and link.
--
-- Scope: books.title is the reader-facing display name (api serves it; the
-- /read book list and every cross-reference card resolve a book's name from
-- this column by slug). The slug is unique PER EDITION, so the same slug
-- exists in both the KJV-1611 apocrypha edition and the Charles-1913 vol 1
-- apocrypha edition; the WHERE-by-slug below updates every edition that
-- carries the book. (1 Esdras lives in both editions; 2 Esdras lives only in
-- the KJV-1611 apocrypha edition — Charles moved 4 Ezra to vol 2.)
--
-- Mirrors the parsed-JSON book_title edits made the same session
-- (source-texts/parsed/apocrypha.json, apocrypha-charles-vol1.json) so that a
-- clean-DB rebuild via seed.py produces the same labels this UPDATE lands on
-- production. In-place UPDATE, never a reseed (Rule 10, S149). Idempotent.

BEGIN;

UPDATE books
   SET title = '3 Ezra (also called 1 Esdras)'
 WHERE slug = '1-esdras'
   AND title <> '3 Ezra (also called 1 Esdras)';

UPDATE books
   SET title = '4 Ezra (also called 2 Esdras)'
 WHERE slug = '2-esdras'
   AND title <> '4 Ezra (also called 2 Esdras)';

COMMIT;
