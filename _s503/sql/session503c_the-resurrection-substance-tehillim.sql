-- =====================================================================
-- Session 503c migration — summaries sweep — thread 21 `the-resurrection-substance-tehillim-16-and-tehillim-22-vindication-substance`: title + summary rewritten (slug kept); 0 member card(s)
-- rewritten in place with their member notes (ids, verse pairs and membership untouched). Written and read on Claude Fable 5.1 against
-- live read-back S503 (canon/matthew) · schema 1.0.0-phase4-session475. Every note composed by script (build503c.py). Guards RAISE before any write if the live data moved. Idempotent. Nothing deleted.
-- Run: python3 api/apply_migration.py data-schema/migrations/session503c_the-resurrection-substance-tehillim.sql
-- =====================================================================
\echo 'session503c — the-resurrection-substance-tehillim starting...'
BEGIN;
CREATE TEMP TABLE s503c_cards (id bigint, s_ed text, s_book text, src_ch int, src_vn int, src_text text, t_ed text, tgt_book text, tgt_ch int, tgt_vn int, old_note text, new_note text, thread_id bigint, old_mnote text, new_mnote text) ON COMMIT DROP;
-- (no card rows)
CREATE TEMP TABLE s503c_thread (id bigint, slug text, old_title text, new_title text, old_summary text, new_summary text) ON COMMIT DROP;
INSERT INTO s503c_thread VALUES (21, 'the-resurrection-substance-tehillim-16-and-tehillim-22-vindication-substance', $n$The Resurrection Substance Tehillim 16 And Tehillim 22 Vindication Substance$n$, $n$He is risen, as he said — Psalm 16, the third day of Hosea and Jonah, and the firstfruits sheaf (Leviticus 23; Acts 2; 1 Corinthians 15)$n$, $n$**`the-resurrection-substance-tehillim-16-and-tehillim-22-vindication-substance`** — anchor at Matt 28:1-10. The substantial-Resurrection-substance walks the substantial-Tehillim (Psalm) 16:10 substance (*thou wilt not leave my soul in sheol; neither wilt thou suffer thine Holy One to see corruption*) + Tehillim 22:22-31's-substantial-vindication-substance + Hosheia (Hosea) 6:2 substance + the substantial-firstfruits-substance per 1 Corinthians 15:20-23. 12 members.$n$, $n$It ain't new. The women come to the tomb at the end of the Sabbath and are told what he had told them:

*In the end of the sabbath, as it began to dawn toward the first day of the week, came Mary Magdalene and the other Mary to see the sepulchre.* (Matthew 28:1)

*He is not here: for he is risen, as he said. Come, see the place where Yahusha (Lord) lay.* (Matthew 28:6)

*But after I am risen again, I will go before you into Galilee.* (Matthew 26:32)

David had written the rising a thousand years before, and Peter and Paul both said this was the verse:

*For thou wilt not leave my soul in hell; neither wilt thou suffer thine Holy One to see corruption.* (Psalm 16:10)

*He seeing this before spake of the resurrection of Messiah (Christ), that his soul was not left in hell, neither his flesh did see corruption.* (Acts 2:31)

*Wherefore he saith also in another psalm, Thou shalt not suffer thine Holy One to see corruption.* (Acts 13:35)

The third day was Hosea's, spoken over the house that would be raised up, and Jonah's, which Yahusha (Jesus) took as his own sign:

*After two days will he revive us: in the third day he will raise us up, and we shall live in his sight.* (Hosea 6:2)

*Now Yahuah (LORD) had prepared a great fish to swallow up Jonah. And Jonah was in the belly of the fish three days and three nights.* (Jonah 1:17)

*For as Jonah was three days and three nights in the whale’s belly; so shall the Son of Adam be three days and three nights in the heart of the earth.* (Matthew 12:40)

And the morning itself was in the Torah's calendar. The sheaf of firstfruits is waved before Yahuah (the LORD) on the morrow after the Sabbath, in Passover week, and Paul calls the risen one by the sheaf's name:

*Speak unto the children of Yashar'el (Israel), and say unto them, When ye be come into the land which I give unto you, and shall reap the harvest thereof, then ye shall bring a sheaf of the firstfruits of your harvest unto the priest:* (Leviticus 23:10)

*And he shall wave the sheaf before Yahuah (LORD), to be accepted for you: on the morrow after the sabbath the priest shall wave it.* (Leviticus 23:11)

*But now is Messiah (Christ) risen from the dead, and become the firstfruits of them that slept.* (1 Corinthians 15:20)

*But every man in his own order: Messiah (Christ) the firstfruits; afterward they that are Messiah's (Christ’s) at his coming.* (1 Corinthians 15:23)

A firstfruits sheaf is the first of a harvest, waved so that the rest may be accepted. He rose on the day the sheaf was waved, first of them that slept, and the order Paul gives is the order of the harvest: he first, afterward those that are his at his coming. The rising is also the Father's word over the trial's verdict:

*And declared to be the Son of Elohim (God) with power, according to the spirit of holiness, by the resurrection from the dead:* (Romans 1:4)

The council said blasphemy. The empty tomb on the morning of the sheaf said Son of Elohim (God), with power.$n$);

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
  IF NOT FOUND THEN RAISE EXCEPTION 'S503c: thread 21 not found under its slug'; END IF;
  SELECT count(*) INTO n FROM cross_reference_threads t JOIN s503c_thread s ON s.id = t.id
    WHERE (t.title = s.old_title AND t.summary_md = s.old_summary) OR (t.title = s.new_title AND t.summary_md = s.new_summary);
  IF n <> 1 THEN RAISE EXCEPTION 'S503c: thread 21 title/summary differ from the read-back — re-dump and rebuild'; END IF;
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
  RAISE NOTICE 'S503c (the-resurrection-substance-tehillim) summary: notes rewritten % / already there %; member notes rewritten % / already there %; thread rewritten % / already there %', n_notes, n_c - n_notes, n_m, n_c - n_m, n_t, 1 - n_t;
END $s503c2$;
COMMIT;
\echo 'session503c — the-resurrection-substance-tehillim done.'
