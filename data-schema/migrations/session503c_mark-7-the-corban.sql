-- =====================================================================
-- Session 503c migration — summaries sweep — thread 622 `mark-7-the-corban-tradition-voids-the-fifth-commandment-in-sirach`: title + summary rewritten (slug kept); 0 member card(s)
-- rewritten in place with their member notes (ids, verse pairs and membership untouched). Written and read on Claude Fable 5.1 against
-- live read-back S496 (canon/mark) · schema 1.0.0-phase4-session475. Every note composed by script (build503c.py). Guards RAISE before any write if the live data moved. Idempotent. Nothing deleted.
-- Run: python3 api/apply_migration.py data-schema/migrations/session503c_mark-7-the-corban.sql
-- =====================================================================
\echo 'session503c — mark-7-the-corban starting...'
BEGIN;
CREATE TEMP TABLE s503c_cards (id bigint, s_ed text, s_book text, src_ch int, src_vn int, src_text text, t_ed text, tgt_book text, tgt_ch int, tgt_vn int, old_note text, new_note text, thread_id bigint, old_mnote text, new_mnote text) ON COMMIT DROP;
-- (no card rows)
CREATE TEMP TABLE s503c_thread (id bigint, slug text, old_title text, new_title text, old_summary text, new_summary text) ON COMMIT DROP;
INSERT INTO s503c_thread VALUES (622, 'mark-7-the-corban-tradition-voids-the-fifth-commandment-in-sirach', $n$The corban tradition voids the fifth commandment — Sirach$n$, $n$Corban — the tradition that makes *Honour thy father and thy mother* of none effect (Exodus 20; Isaiah 29; Sirach 3)$n$, $n$Mark 7:6-13 is the framework's central diagnostic in the King's own mouth: the man-made tradition that voids the commandment of Elohim (God). The corban device is the load-bearing example — *if a man shall say to his father or mother, It is Corban, that is to say, a gift... he shall be free* — and the verdict is *Making the word of Elohim (God) of none effect through your tradition.* The commandment the device voids is the fifth — *Honour thy father and thy mother* — and the Hebrew library's wisdom-stream had already bound that commandment to the fear of Yahuah and named the cost of withholding it. Sirach (Ecclesiasticus) 3:7 makes honour-of-parents the very test of the fear of Yahuah: *He that fears Yahuah (God) will honour his father, and will do service to his parents, as to his masters.* Sirach 3:8 binds honour to deed, not word only: *Honour your father and mother both in word and deed, that a blessing may come upon you from them* — the exact word-AND-deed the corban ruling severs, permitting honour in vow-formula while forbidding the deed of provision. Sirach 3:9 names the cost: *the blessing of the father establishes the houses of children; but the curse of the mother rooteth out foundations.* The tradition that voids the commandment forfeits the blessing and invites the uprooting. The same flesh-credentialing system that exalts the tradition of the elders over the word of Elohim is the Judaizer architecture the King names here and the apostolic letters confront later; the wisdom-stream had already exposed it by its own standard.$n$, $n$It ain't new. He tells them what their tradition does to the commandment, and he begins with Isaiah's words:

*He answered and said unto them, Well hath Isaiah prophesied of you hypocrites, as it is written, This people honoureth me with their lips, but their heart is far from me.* (Mark 7:6)

*Howbeit in vain do they worship me, teaching for doctrines the commandments of men.* (Mark 7:7)

Then the case:

*For Moses said, Honour thy father and thy mother; and, Whoso curseth father or mother, let him die the death:* (Mark 7:10)

*But ye say, If a man shall say to his father or mother, It is Corban, that is to say, a gift, by whatsoever thou mightest be profited by me; he shall be free.* (Mark 7:11)

*And ye suffer him no more to do ought for his father or his mother;* (Mark 7:12)

*Making the word of Elohim (God) of none effect through your tradition, which ye have delivered: and many such like things do ye.* (Mark 7:13)

A man says the word over what his parents needed, and the ruling sets him free of them. The commandment stands written, *Honour thy father and thy mother: that thy days may be long upon the land which Yahuah Elohayka (the LORD thy God) giveth thee.* (Exodus 20:12), and a ruling of men is laid over it until it does nothing. Sirach had already tied that honour to the fear of Yahuah (God), and to the deed and not the saying only:

*He that fears Yahuah (God) will honour his father, and will do service to his parents, as to his masters.* (Sirach 3:7)

*Honour your father and mother both in word and deed, that a blessing may come upon you from them.* (Sirach 3:8)

*For the blessing of the father establishes the houses of children; but the curse of the mother rooteth out foundations.* (Sirach 3:9)

Word and deed. The corban ruling keeps the word and forbids the deed, and so forfeits the blessing Sirach names. The same thing is done every time a teaching of men is set above a commandment of Elohim (God), whether it is a Pharisee's ruling or a pulpit's, and his verdict on it does not change: *Full well ye reject the commandment of Elohim (God), that ye may keep your own tradition.* (Mark 7:9)$n$);

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
  IF NOT FOUND THEN RAISE EXCEPTION 'S503c: thread 622 not found under its slug'; END IF;
  SELECT count(*) INTO n FROM cross_reference_threads t JOIN s503c_thread s ON s.id = t.id
    WHERE (t.title = s.old_title AND t.summary_md = s.old_summary) OR (t.title = s.new_title AND t.summary_md = s.new_summary);
  IF n <> 1 THEN RAISE EXCEPTION 'S503c: thread 622 title/summary differ from the read-back — re-dump and rebuild'; END IF;
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
  RAISE NOTICE 'S503c (mark-7-the-corban) summary: notes rewritten % / already there %; member notes rewritten % / already there %; thread rewritten % / already there %', n_notes, n_c - n_notes, n_m, n_c - n_m, n_t, 1 - n_t;
END $s503c2$;
COMMIT;
\echo 'session503c — mark-7-the-corban done.'
