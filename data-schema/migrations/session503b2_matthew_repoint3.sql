-- =====================================================================
-- Session 503b2 (S504) migration — canon / Matthew — the RE-POINT pass. 3 card(s) whose old note meant 1 John but whose target was the gospel of John
-- re-pointed to the 1 John verse (target_verse_id UPDATE; id, source verse, thread kept; note and member note rewritten Come-and-See to the new pair):
-- 3206 Matthew 28:20 John 2:3 → 1 John 2:3; 3207 Matthew 28:20 John 5:2 → 1 John 5:2; 3634 Matthew 18:19 John 5:14 → 1 John 5:14.
-- 0 shorthand twin(s) rewritten in place with the target unchanged: .
-- Written and read on Claude Fable 5.1 against the read-back live read-back S503 (canon/matthew) · schema 1.0.0-phase4-session475. Every note composed by script (build503b.py): target verse whole
-- from parsed/canon.json, Matthew verse whole from the live text, then the prose.
-- Safety (DO block, before any write): RAISES if a card is gone, if it sits neither on its old pair with its old note nor already on its new pair with
-- its new note, if its Matthew live text moved, if its member row is missing or carries neither member note, or if another card already holds the
-- new pair. Idempotent: a re-run reports 0 everywhere. Nothing deleted, no card added.
-- Run: python3 api/apply_migration.py data-schema/migrations/session503b2_matthew_repoint3.sql
-- =====================================================================
\echo 'session503b — Matthew re-point pass starting...'
BEGIN;
CREATE TEMP TABLE _s503b_c (id BIGINT, src_ch INT, src_v INT, src_text TEXT, o_ed TEXT, o_book TEXT, o_ch INT, o_v INT, n_ed TEXT, n_book TEXT, n_ch INT, n_v INT, src TEXT, old_note TEXT, new_note TEXT, thread_id BIGINT, old_mnote TEXT, new_mnote TEXT) ON COMMIT DROP;
INSERT INTO _s503b_c VALUES
(3206,28,20,$n$Teaching them to observe all things whatsoever I have commanded you: and, lo, I am with you alway, even unto the end of the world. Amen.$n$,'canon','john',2,3,'canon','1-john',2,3,'manual',$n$The 1234-of-Truth + *if we keep his commandments*.$n$,$n$1 John 2:3 — *And hereby we do know that we know him, if we keep his commandments.* *Teaching them to observe all things whatsoever I have commanded you: and, lo, I am with you alway, even unto the end of the world. Amen.* (Matthew 28:20) The last word of the gospel is *teaching them to observe all things whatsoever I have commanded you*. John tells how anyone can know whether that word took: *if we keep his commandments*. The commission and the test are the same thing seen from two ends. What the taught are to observe is what the knower keeps; there is no knowing him apart from it.$n$,20,$n$The 1234-of-Truth + *if we keep his commandments*.$n$,$n$1 John 2:3 — *And hereby we do know that we know him, if we keep his commandments.* Keeping his commandments is how we know that we know him: the commission's *observe all things* measured from John's side.$n$),
(3207,28,20,$n$Teaching them to observe all things whatsoever I have commanded you: and, lo, I am with you alway, even unto the end of the world. Amen.$n$,'canon','john',5,2,'canon','1-john',5,2,'manual',$n$*This is the love of Elohim, that we keep his commandments.*$n$,$n$1 John 5:2 — *By this we know that we love the children of Elohim (God), when we love Elohim (God), and keep his commandments.* *Teaching them to observe all things whatsoever I have commanded you: and, lo, I am with you alway, even unto the end of the world. Amen.* (Matthew 28:20) *Teaching them to observe all things whatsoever I have commanded you* is not a cold rule laid on the gathered. John names what the keeping is: love of Elohim (God) and love of his children are known *when we love Elohim (God), and keep his commandments*. The observing the commission asks for is the shape love takes; where the commandments are dropped, the love has nothing to stand in.$n$,20,$n$*This is the love of Elohim, that we keep his commandments.*$n$,$n$1 John 5:2 — *when we love Elohim (God), and keep his commandments.* Love of Elohim (God) is known in keeping his commandments, so the commission's *observe all things* is what love looks like.$n$),
(3634,18,19,$n$Again I say unto you, That if two of you shall agree on earth as touching any thing that they shall ask, it shall be done for them of my Father which is in heaven.$n$,'canon','john',5,14,'canon','1-john',5,14,'manual',$n$John 5:14 — *Afterward Yahusha (Jesus) findeth him in the temple, and said unto him, Behold, thou art made whole: sin no more, lest a worse thing come unto thee.* *Again I say unto you, That if two of you shall agree on earth as touching any thing that they shall ask, it shall be done for them of my Father which is in heaven.* (Matthew 18:19) The man he made whole is told *sin no more, lest a worse thing come unto thee*. What the Father does at the Son's hand comes with the commandment, *My Father worketh hitherto, and I work* (John 5:17), so what two agree to ask is not a blank cheque for anything at all.$n$,$n$1 John 5:14 — *And this is the confidence that we have in him, that, if we ask any thing according to his will, he heareth us:* *Again I say unto you, That if two of you shall agree on earth as touching any thing that they shall ask, it shall be done for them of my Father which is in heaven.* (Matthew 18:19) Two who agree on earth about what they ask will have it done *of my Father which is in heaven*. John sets the measure that goes with the promise: what is asked *according to his will* is what he hears. The agreement of two is not a lever on heaven; it is two hearts asking what the Father already wills, and that asking he hears.$n$,43283,$n$John 5:14 — *Afterward Yahusha (Jesus) findeth him in the temple, and said unto him, Behold, thou art made whole: sin no more, lest a worse thing come unto thee.* The man made whole is told to sin no more, so what the Father does at the Son's hand comes with the commandment.$n$,$n$1 John 5:14 — *if we ask any thing according to his will, he heareth us.* Asking according to his will is what he hears, so two who agree on earth are agreeing with the Father, not leaning on him.$n$);
CREATE OR REPLACE TEMP VIEW _s503b_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id, v.text
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id JOIN editions e ON b.edition_id = e.id;

DO $s503b$
DECLARE r RECORD; sid BIGINT; oid BIGINT; nid BIGINT; ltext TEXT; cur RECORD; n INT; n_rp INT := 0; n_rp_same INT := 0; n_m INT := 0; n_m_same INT := 0; n_total INT;
BEGIN
  FOR r IN SELECT * FROM _s503b_c LOOP
    SELECT verse_id, text INTO sid, ltext FROM _s503b_lookup WHERE edition_slug = 'canon' AND book_slug = 'matthew' AND chapter_number = r.src_ch AND verse_number = r.src_v;
    IF sid IS NULL THEN RAISE EXCEPTION 'S503b: Matthew %:% missing', r.src_ch, r.src_v; END IF;
    IF ltext <> r.src_text THEN RAISE EXCEPTION 'S503b: live text of Matthew %:% differs from the read-back — re-dump and rebuild', r.src_ch, r.src_v; END IF;
    SELECT verse_id INTO oid FROM _s503b_lookup WHERE edition_slug = r.o_ed AND book_slug = r.o_book AND chapter_number = r.o_ch AND verse_number = r.o_v;
    SELECT verse_id INTO nid FROM _s503b_lookup WHERE edition_slug = r.n_ed AND book_slug = r.n_book AND chapter_number = r.n_ch AND verse_number = r.n_v;
    IF oid IS NULL OR nid IS NULL THEN RAISE EXCEPTION 'S503b: a target verse for card % is missing', r.id; END IF;
    SELECT * INTO cur FROM cross_references WHERE id = r.id;
    IF NOT FOUND THEN RAISE EXCEPTION 'S503b: card % is gone', r.id; END IF;
    IF cur.source_verse_id <> sid THEN RAISE EXCEPTION 'S503b: card % no longer sits on Matthew %:%', r.id, r.src_ch, r.src_v; END IF;
    IF NOT ((cur.target_verse_id = oid AND cur.note IS NOT DISTINCT FROM r.old_note) OR (cur.target_verse_id = nid AND cur.note IS NOT DISTINCT FROM r.new_note)) THEN
      RAISE EXCEPTION 'S503b: card % does not read as written to its old target (nor already as the new card) — re-dump and rebuild', r.id; END IF;
    IF oid <> nid AND EXISTS (SELECT 1 FROM cross_references x WHERE x.id <> r.id AND x.source_verse_id = sid AND x.target_verse_id = nid AND x.source = r.src) THEN
      RAISE EXCEPTION 'S503b: another card already holds the new pair for card %', r.id; END IF;
    SELECT count(*) INTO n FROM cross_reference_thread_members m WHERE m.cross_reference_id = r.id AND m.thread_id = r.thread_id AND (m.member_note IS NOT DISTINCT FROM r.old_mnote OR m.member_note IS NOT DISTINCT FROM r.new_mnote);
    IF n <> 1 THEN RAISE EXCEPTION 'S503b: card % has no member row in thread % carrying the member note this was written against', r.id, r.thread_id; END IF;
    IF EXISTS (SELECT 1 FROM cross_reference_thread_members m WHERE m.cross_reference_id = r.id AND m.thread_id <> r.thread_id) THEN
      RAISE EXCEPTION 'S503b: card % sits in another thread too — re-dump and rebuild', r.id; END IF;
  END LOOP;

  SELECT count(*) INTO n_total FROM _s503b_c;
  UPDATE cross_references x SET target_verse_id = nv.verse_id, note = c.new_note
    FROM _s503b_c c JOIN _s503b_lookup nv ON nv.edition_slug = c.n_ed AND nv.book_slug = c.n_book AND nv.chapter_number = c.n_ch AND nv.verse_number = c.n_v
   WHERE x.id = c.id AND x.note IS NOT DISTINCT FROM c.old_note AND c.old_note IS DISTINCT FROM c.new_note;
  GET DIAGNOSTICS n_rp = ROW_COUNT; n_rp_same := n_total - n_rp;
  UPDATE cross_reference_thread_members m SET member_note = c.new_mnote FROM _s503b_c c
   WHERE m.cross_reference_id = c.id AND m.thread_id = c.thread_id AND m.member_note IS NOT DISTINCT FROM c.old_mnote AND c.old_mnote IS DISTINCT FROM c.new_mnote;
  GET DIAGNOSTICS n_m = ROW_COUNT; n_m_same := n_total - n_m;

  SELECT count(*) INTO n FROM _s503b_c c JOIN cross_references x ON x.id = c.id JOIN _s503b_lookup nv ON nv.edition_slug = c.n_ed AND nv.book_slug = c.n_book AND nv.chapter_number = c.n_ch AND nv.verse_number = c.n_v
   WHERE x.target_verse_id <> nv.verse_id OR x.note IS DISTINCT FROM c.new_note;
  IF n > 0 THEN RAISE EXCEPTION 'S503b: % card(s) do not carry the new target and note', n; END IF;
  RAISE NOTICE 'S503b (matthew re-point) summary: cards re-pointed/rewritten % / already there %; member notes rewritten % / already there %', n_rp, n_rp_same, n_m, n_m_same;
END $s503b$;
COMMIT;
\echo 'session503b — Matthew re-point pass done.'
