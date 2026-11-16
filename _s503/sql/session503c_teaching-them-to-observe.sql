-- =====================================================================
-- Session 503c migration — summaries sweep — thread 20 `teaching-them-to-observe-all-things-i-have-commanded-you-heart-torah-closing-the-anti-antinomian-bookend`: title + summary rewritten (slug kept); 0 member card(s)
-- rewritten in place with their member notes (ids, verse pairs and membership untouched). Written and read on Claude Fable 5.1 against
-- live read-back S503 (canon/matthew) · schema 1.0.0-phase4-session475. Every note composed by script (build503c.py). Guards RAISE before any write if the live data moved. Idempotent. Nothing deleted.
-- Run: python3 api/apply_migration.py data-schema/migrations/session503c_teaching-them-to-observe.sql
-- =====================================================================
\echo 'session503c — teaching-them-to-observe starting...'
BEGIN;
CREATE TEMP TABLE s503c_cards (id bigint, s_ed text, s_book text, src_ch int, src_vn int, src_text text, t_ed text, tgt_book text, tgt_ch int, tgt_vn int, old_note text, new_note text, thread_id bigint, old_mnote text, new_mnote text) ON COMMIT DROP;
-- (no card rows)
CREATE TEMP TABLE s503c_thread (id bigint, slug text, old_title text, new_title text, old_summary text, new_summary text) ON COMMIT DROP;
INSERT INTO s503c_thread VALUES (20, 'teaching-them-to-observe-all-things-i-have-commanded-you-heart-torah-closing-the-anti-antinomian-bookend', $n$Teaching Them To Observe All Things I Have Commanded You Heart Torah Closing The Anti Antinomian Bookend$n$, $n$Teaching them to observe all things whatsoever I have commanded you — the Torah taught to the gathered, the last word of the gospel (Matthew 5 and 7; John 14; Revelation 22)$n$, $n$**`teaching-them-to-observe-all-things-i-have-commanded-you-heart-torah-closing-the-anti-antinomian-bookend`** — anchor at Matt 28:20. The substantial-King's-Great-Commission-charge walks the substantial-heart-Torah-substance per `heart-torah-not-abolition` thread (FRAMEWORK-MAJOR) — DIRECTLY-CLOSES the substantial-Matt 5:17-19-anti-antinomian-declaration-of-the-Sermon-substance. 14 members.$n$, $n$It ain't new. The last charge of the gospel is a teaching charge, and what is taught is obedience:

*Teaching them to observe all things whatsoever I have commanded you: and, lo, I am with you alway, even unto the end of the world. Amen.* (Matthew 28:20)

*All things whatsoever I have commanded you*. He had said at the start what he commanded, and it was not a new law in place of Moses':

*Think not that I am come to destroy the law, or the prophets: I am not come to destroy, but to fulfil.* (Matthew 5:17)

*For verily I say unto you, Till heaven and earth pass, one jot or one tittle shall in no wise pass from the law, till all be fulfilled.* (Matthew 5:18)

*Whosoever therefore shall break one of these least commandments, and shall teach men so, he shall be called the least in the kingdom of heaven: but whosoever shall do and teach them, the same shall be called great in the kingdom of heaven.* (Matthew 5:19)

Doing and teaching the least commandments is what makes a man great in the kingdom; teaching men to break them is what makes him least. The gospel closes on that same word, *teaching them to observe*. And the Sermon said who gets in:

*Not every one that saith unto me, Adonai (Lord), Adonai (Lord), shall enter into the kingdom of heaven; but he that doeth the will of my Father which is in heaven.* (Matthew 7:21)

The night before he died he said it again as love:

*If ye love me, keep my commandments.* (John 14:15)

*He that hath my commandments, and keepeth them, he it is that loveth me: and he that loveth me shall be loved of my Father, and I will love him, and will manifest myself to him.* (John 14:21)

John's letter says it as knowing him:

*And hereby we do know that we know him, if we keep his commandments.* (1 John 2:3)

*By this we know that we love the children of Elohim (God), when we love Elohim (God), and keep his commandments.* (1 John 5:2)

Paul says faith does not void it, and James says faith without the doing is dead:

*Do we then make void the law through faith? Elohim (God) forbid: yea, we establish the law.* (Romans 3:31)

*What doth it profit, my brethren, though a man say he hath faith, and have not works? can faith save him?* (James 2:14)

And how the gathered keep it was promised before any of them, the Spirit within causing the walking:

*And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them.* (Ezekiel 36:27)

The book ends on the same note, twice:

*Here is the patience of the saints: here are they that keep the commandments of Elohim (God), and the faith of Yahusha (Jesus).* (Revelation 14:12)

*Blessed are they that do his commandments, that they may have right to the tree of life, and may enter in through the gates into the city.* (Revelation 22:14)

The gospel that began with *not one jot or one tittle* ends with *teaching them to observe all things*. What the sent ones carried to all nations was the Father's commandments, taught to the gathered sheep, with him present to the end.$n$);

DO $s503c$
DECLARE r record; x record; n int;
BEGIN
  FOR r IN SELECT * FROM s503c_cards LOOP
    SELECT xr.id, xr.note, sv.text AS stext, se.slug AS sed, sb.slug AS sbook, sc.chapter_number AS sch, sv.verse_number AS svn, te.slug AS ted, tb.slug AS tbook, tc.chapter_number AS tch, tv.verse_number AS tvn
      INTO x FROM cross_references xr
      JOIN verses sv ON sv.id = xr.source_verse_id JOIN chapters sc ON sc.id = sv.chapter_id JOIN books sb ON sb.id = sc.book_id JOIN editions se ON se.id = sb.edition_id
      JOIN verses tv ON tv.id = xr.target_verse_id JOIN chapters tc ON tc.id = tv.chapter_id JOIN books tb ON tb.id = tc.book_id JOIN editions te ON te.id = tb.edition_id
      WHERE xr.id = r.id;
    IF NOT FOUND THEN RAISE EXCEPTION 'S503c: card % is gone', r.id; END IF;
    IF x.sed <> r.s_ed OR x.sbook <> r.s_book OR x.sch <> r.src_ch OR x.svn <> r.src_vn OR x.ted <> r.t_ed OR x.tbook <> r.tgt_book OR x.tch <> r.tgt_ch OR x.tvn <> r.tgt_vn THEN
      RAISE EXCEPTION 'S503c: card % no longer sits on the verse pair this was written for', r.id; END IF;
    IF x.stext <> r.src_text THEN RAISE EXCEPTION 'S503c: live text of % %:% differs from the read-back — re-dump and rebuild', r.s_book, r.src_ch, r.src_vn; END IF;
    IF x.note IS DISTINCT FROM r.old_note AND x.note IS DISTINCT FROM r.new_note THEN RAISE EXCEPTION 'S503c: the live note of card % differs from the read-back — re-dump and rebuild', r.id; END IF;
    SELECT count(*) INTO n FROM cross_reference_thread_members m WHERE m.cross_reference_id = r.id AND m.thread_id = r.thread_id AND (m.member_note IS NOT DISTINCT FROM r.old_mnote OR m.member_note IS NOT DISTINCT FROM r.new_mnote);
    IF n <> 1 THEN RAISE EXCEPTION 'S503c: card % has no member row in thread % carrying the member note this was written against', r.id, r.thread_id; END IF;
  END LOOP;
  SELECT t.* INTO x FROM cross_reference_threads t JOIN s503c_thread s ON s.id = t.id AND s.slug = t.slug;
  IF NOT FOUND THEN RAISE EXCEPTION 'S503c: thread 20 not found under its slug'; END IF;
  SELECT count(*) INTO n FROM cross_reference_threads t JOIN s503c_thread s ON s.id = t.id
    WHERE (t.title = s.old_title AND t.summary_md = s.old_summary) OR (t.title = s.new_title AND t.summary_md = s.new_summary);
  IF n <> 1 THEN RAISE EXCEPTION 'S503c: thread 20 title/summary differ from the read-back — re-dump and rebuild'; END IF;
END $s503c$;

DO $s503c2$
DECLARE n_notes int; n_m int; n_t int; n_c int;
BEGIN
  SELECT count(*) INTO n_c FROM s503c_cards;
  UPDATE cross_references xr SET note = c.new_note FROM s503c_cards c WHERE xr.id = c.id AND xr.note IS NOT DISTINCT FROM c.old_note AND c.old_note IS DISTINCT FROM c.new_note;
  GET DIAGNOSTICS n_notes = ROW_COUNT;
  UPDATE cross_reference_thread_members m SET member_note = c.new_mnote FROM s503c_cards c WHERE m.cross_reference_id = c.id AND m.thread_id = c.thread_id AND m.member_note IS NOT DISTINCT FROM c.old_mnote AND c.old_mnote IS DISTINCT FROM c.new_mnote;
  GET DIAGNOSTICS n_m = ROW_COUNT;
  UPDATE cross_reference_threads t SET title = s.new_title, summary_md = s.new_summary FROM s503c_thread s WHERE t.id = s.id AND t.title = s.old_title AND t.summary_md = s.old_summary;
  GET DIAGNOSTICS n_t = ROW_COUNT;
  RAISE NOTICE 'S503c (teaching-them-to-observe) summary: notes rewritten % / already there %; member notes rewritten % / already there %; thread rewritten % / already there %', n_notes, n_c - n_notes, n_m, n_c - n_m, n_t, 1 - n_t;
END $s503c2$;
COMMIT;
\echo 'session503c — teaching-them-to-observe done.'
