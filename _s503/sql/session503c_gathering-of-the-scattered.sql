-- =====================================================================
-- Session 503c migration — summaries sweep — thread 221 `gathering-of-the-scattered-twelve-tribes-in-sirach-and-2-esdras-and-tobit`: title + summary rewritten (slug kept); 0 member card(s)
-- rewritten in place with their member notes (ids, verse pairs and membership untouched). Written and read on Claude Fable 5.1 against
-- live read-back S503 (canon/matthew) · schema 1.0.0-phase4-session475. Every note composed by script (build503c.py). Guards RAISE before any write if the live data moved. Idempotent. Nothing deleted.
-- Run: python3 api/apply_migration.py data-schema/migrations/session503c_gathering-of-the-scattered.sql
-- =====================================================================
\echo 'session503c — gathering-of-the-scattered starting...'
BEGIN;
CREATE TEMP TABLE s503c_cards (id bigint, s_ed text, s_book text, src_ch int, src_vn int, src_text text, t_ed text, tgt_book text, tgt_ch int, tgt_vn int, old_note text, new_note text, thread_id bigint, old_mnote text, new_mnote text) ON COMMIT DROP;
-- (no card rows)
CREATE TEMP TABLE s503c_thread (id bigint, slug text, old_title text, new_title text, old_summary text, new_summary text) ON COMMIT DROP;
INSERT INTO s503c_thread VALUES (221, 'gathering-of-the-scattered-twelve-tribes-in-sirach-and-2-esdras-and-tobit', $n$The gathering of the scattered twelve tribes — Sirach (Ecclesiasticus) 36, 2 Esdras (4 Ezra) 13, and Tobit 13 (FRAMEWORK-MAJOR)$n$, $n$The gathering of the scattered twelve tribes — Sirach 36, 2 Esdras 13 and Tobit 13 behind *I am not sent but unto the lost sheep*$n$, $n$Matt 15:24's *I am not sent but unto the lost sheep of the house of Yashar'el (Israel)* — the King's-own-mission-scope statement, paired with the Matt 10:5-6's apostolic-mission-scope, reading as the load-bearing scripture-anchor for the framework's gathering-of-the-scattered-twelve-tribes thesis — read against the wisdom-stream's direct articulation of the gathering-of-the-scattered-tribes prayer-and-prophecy substance. Five moves: Sirach (Ecclesiasticus) 36:1 names the petition — *have mercy upon us, O Yahuah (God) of all, and behold us* (the wisdom-stream's-prayer-for-the-gathering); Sirach 36:11 names THE direct verbal-anchor — *gather all the tribes of Jacob together, and inherit you them, as from the beginning* (the explicit wisdom-stream-articulation of the twelve-tribes-restoration the prophets had named at Yechezk'el (Ezekiel) 37:21; Yirmeyahu (Jeremiah) 31:8-10; Hosea 1:10-11; Zekharyah (Zechariah) 10:6-10); 2 Esdras (4 Ezra) 13:40 names the ten-tribes-carried-away — *those are the ten tribes, which were carried away prisoners out of their own land in the time of Osea the king, whom Salmanasar the king of Assyria led away captive* (the wisdom-stream's-direct-articulation of the Assyrian-exile-architecture the lost-sheep-mission-scope addresses); 2 Esdras 13:48 names the remnant-within-the-borders — *but those that be left behind of your people are they that are found within my borders* (the wisdom-stream's naming of both registers the King's-mission addresses); Tobit 13:5 names the scourge-then-mercy-then-gathering-out-of-all-nations — *he will scourge us for our iniquities, and will have mercy again, and will gather us out of all nations, among whom he has scattered us* (the operative-architecture the King's-mission enacts). The framework reads the cluster as FRAMEWORK-MAJOR for the lost-sheep-mission-scope's wisdom-stream corroboration. The Pharisaic-system had built credentialing-systems on top of the binary (Yahudah (Judah) and the nations, no scattered-twelve-tribes coming-home); the wisdom-stream had preserved the architecture the prophets had named. The King's-mission at v.24 IS the operative-form of the wisdom-stream's-prayer at Sirach 36:11; the lost-sheep-of-the-house-of-Yashar'el (Israel) the King is sent-to IS the all-the-tribes-of-Ya'aqov (Jacob) the wisdom-stream had prayed for the gathering of. The framework reads the Canaanite-woman's mercy-at-the-crumbs-substance (vv.25-28) within the architecture — as the master's-table-mercy-to-the-categorical-nations-individual that does NOT collapse the seed-distinction (Red Line #7) but operates within it.$n$, $n$It ain't new. He said who he was sent to in one sentence:

*But he answered and said, I am not sent but unto the lost sheep of the house of Yashar'el (Israel).* (Matthew 15:24)

He had sent the twelve the same way: *But go rather to the lost sheep of the house of Yashar'el (Israel).* (Matthew 10:6). Who was lost? Not Yahudah (Judah) in Jerusalem, who could be found any Sabbath. The books the Reformation cut from the library say plainly who:

*Those are the ten tribes, which were carried away prisoners out of their own land in the time of Osea the king, whom Salmanasar the king of Assyria led away captive, and he carried them over the waters, and so came they into another land.* (2 Esdras 13:40)

*But those that be left behind of your people are they that are found within my borders.* (2 Esdras 13:48)

Two groups: the ten tribes beyond the waters, and the remnant inside the borders. Tobit, himself of Naphtali in that captivity, says what comes after the scattering:

*And he will scourge us for our iniquities, and will have mercy again, and will gather us out of all nations, among whom he has scattered us.* (Tobit 13:5)

And Sirach prays for it:

*Have mercy upon us, O Yahuah (God) of all, and behold us:* (Sirach 36:1)

*Gather all the tribes of Jacob together, and inherit you them, as from the beginning.* (Sirach 36:11)

The prophets had said it before them, *I will take the children of Yashar'el (Israel) from among the heathen, whither they be gone, and will gather them on every side* (Ezekiel 37:21), and Moses before the prophets: *will return and gather thee from all the nations, whither Yahuah Elohayka (the LORD thy God) hath scattered thee.* (Deuteronomy 30:3). So when he says he was sent to the lost sheep of the house of Yashar'el (Israel), the prayer of Sirach 36:11 is being answered in person, and Paul says as much: *a minister of the circumcision for the truth of Elohim (God), to confirm the promises made unto the fathers:* (Romans 15:8). After he rose the sending went *to all nations* (Matthew 28:19), because that is where the sheep are, *until the fulness of the Gentiles be come in.* (Romans 11:25). The woman of Canaan in this same passage, in the coasts of Tyre and Sidon where Elijah's widow had lived, is not an exception to his sentence. She heard, she called him Son of David, and he said *O woman, great is thy faith: be it unto thee even as thou wilt.* (Matthew 15:28). A sheep heard his voice where the house had been scattered. Anyone who holds that there is only Yahudah (Judah) and everybody else, with no ten tribes to be found, has to read every one of these books as if they were never written.$n$);

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
  IF NOT FOUND THEN RAISE EXCEPTION 'S503c: thread 221 not found under its slug'; END IF;
  SELECT count(*) INTO n FROM cross_reference_threads t JOIN s503c_thread s ON s.id = t.id
    WHERE (t.title = s.old_title AND t.summary_md = s.old_summary) OR (t.title = s.new_title AND t.summary_md = s.new_summary);
  IF n <> 1 THEN RAISE EXCEPTION 'S503c: thread 221 title/summary differ from the read-back — re-dump and rebuild'; END IF;
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
  RAISE NOTICE 'S503c (gathering-of-the-scattered) summary: notes rewritten % / already there %; member notes rewritten % / already there %; thread rewritten % / already there %', n_notes, n_c - n_notes, n_m, n_c - n_m, n_t, 1 - n_t;
END $s503c2$;
COMMIT;
\echo 'session503c — gathering-of-the-scattered done.'
