-- =====================================================================
-- Session 503c migration — summaries sweep — thread 8 `great-commission-all-nations-as-territories-of-the-scattered-seed-not-categorical-three-categories-substance`: title + summary rewritten (slug kept); 0 member card(s)
-- rewritten in place with their member notes (ids, verse pairs and membership untouched). Written and read on Claude Fable 5.1 against
-- live read-back S503 (canon/matthew) · schema 1.0.0-phase4-session475. Every note composed by script (build503c.py). Guards RAISE before any write if the live data moved. Idempotent. Nothing deleted.
-- Run: python3 api/apply_migration.py data-schema/migrations/session503c_great-commission-all-nations.sql
-- =====================================================================
\echo 'session503c — great-commission-all-nations starting...'
BEGIN;
CREATE TEMP TABLE s503c_cards (id bigint, s_ed text, s_book text, src_ch int, src_vn int, src_text text, t_ed text, tgt_book text, tgt_ch int, tgt_vn int, old_note text, new_note text, thread_id bigint, old_mnote text, new_mnote text) ON COMMIT DROP;
-- (no card rows)
CREATE TEMP TABLE s503c_thread (id bigint, slug text, old_title text, new_title text, old_summary text, new_summary text) ON COMMIT DROP;
INSERT INTO s503c_thread VALUES (8, 'great-commission-all-nations-as-territories-of-the-scattered-seed-not-categorical-three-categories-substance', $n$Great Commission All Nations As Territories Of The Scattered Seed Not Categorical Three Categories Substance$n$, $n$Go ye therefore, and teach all nations — all power given him, and the sheep sought where they were scattered (Matthew 10 and 15; Hosea 1; Isaiah 11; James 1)$n$, $n$**`great-commission-all-nations-as-territories-of-the-scattered-seed-not-categorical-three-categories-substance`** — **FRAMEWORK-MAJOR anchor at Matt 28:18-20.** The substantial-Great-Commission-substance walks the substantial-territorial-extension-of-the-mission-scope-substance NOT-categorical-Three-Categories-#3-substance per Red Line #7 + `lost-sheep-mission-scope` thread (DUAL-FRAMEWORK-MAJOR-anchored at Matt 10:5-6 + Matt 15:24). The substantial-*panta ta ethnē*-substance is the substantial-territorial-substance the substantial-scattered-seed-of-both-houses-of-Yashar'el (Israel) is-substantially-among-substance per Yeshayahu 11:11-12 + Yechezk'el 37:15-28 + the substantial-Tanakh-substance. Framework rules out the inherited-Christian-collapse of-the-Great-Commission-as-categorical-Gentile-inclusion-substance. 21 members.$n$, $n$It ain't new. The risen one sends the eleven with a word about power and a word about nations:

*And Yahusha (Jesus) came and spake unto them, saying, All power is given unto me in heaven and in earth.* (Matthew 28:18)

*Go ye therefore, and teach all nations, baptizing them in the name of the Father, and of the Son, and of the Ruach HaKodesh (Holy Spirit):* (Matthew 28:19)

*All power is given unto me*: given, by the Father, and Daniel had already seen the giving:

*And there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him: his dominion is an everlasting dominion, which shall not pass away, and his kingdom that which shall not be destroyed.* (Daniel 7:14)

Then *all nations*. Before his death the sending had a fence on it, and he told the twelve who they were sent to:

*These twelve Yahusha (Jesus) sent forth, and commanded them, saying, Go not into the way of the Gentiles, and into any city of the Samaritans enter ye not:* (Matthew 10:5)

*But go rather to the lost sheep of the house of Yashar'el (Israel).* (Matthew 10:6)

*But he answered and said, I am not sent but unto the lost sheep of the house of Yashar'el (Israel).* (Matthew 15:24)

The sheep did not change after the rising; the fence came down, because the sheep were out past it. The prophets had said where the lost sheep of the house were: in the nations, under another name, waiting to be called sons again:

*Yet the number of the children of Yashar'el (Israel) shall be as the sand of the sea, which cannot be measured nor numbered; and it shall come to pass, that in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God).* (Hosea 1:10)

*And it shall come to pass in that day, that Yahuah (Lord) shall set his hand again the second time to recover the remnant of his people, which shall be left, from Assyria, and from Egypt, and from Pathros, and from Cush, and from Elam, and from Shinar, and from Hamath, and from the islands of the sea.* (Isaiah 11:11)

*And he shall set up an ensign for the nations, and shall assemble the outcasts of Yashar'el (Israel), and gather together the dispersed of Yahudah (Judah) from the four corners of the earth.* (Isaiah 11:12)

*And say unto them, Thus saith Adonai Yahuah (the Lord GOD); Behold, I will take the children of Yashar'el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land:* (Ezekiel 37:21)

Paul quotes Hosea's verse for the ones he was sent to:

*And it shall come to pass, that in the place where it was said unto them, Ye are not my people; there shall they be called the children of the living Elohim (God).* (Romans 9:26)

And the letters are addressed to the same people in the same places. James writes to the tribes, Peter to the scattered:

*James, a servant of Elohim (God) and of the Lord Yahusha HaMashiach (Lord Jesus Christ), to the twelve tribes which are scattered abroad, greeting.* (James 1:1)

*Peter, an apostle of Yahusha HaMashiach (Jesus Christ), to the strangers scattered throughout Pontus, Galatia, Cappadocia, Asia, and Bithynia,* (1 Peter 1:1)

*All nations* is where the sheep are, not who the sheep are. The errand is the one errand, the lost sheep of the house of Yashar'el (Israel), now sought in every place they were driven to, because the death that frees the divorced house has been died. The nations themselves come up to the mountain in the reign, to be taught, and that is a different hour and a different verse:

*And many nations shall come, and say, Come, and let us go up to the mountain of Yahuah (LORD), and to the house of the Elohim (God) of Jacob; and he will teach us of his ways, and we will walk in his paths: for the law shall go forth of Zion, and the word of Yahuah (LORD) from Jerusalem.* (Micah 4:2)

The gospel of the kingdom goes to all nations for a witness, and the end comes when the sheep in them have heard:

*And this gospel of the kingdom shall be preached in all the world for a witness unto all nations; and then shall the end come.* (Matthew 24:14)$n$);

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
  IF NOT FOUND THEN RAISE EXCEPTION 'S503c: thread 8 not found under its slug'; END IF;
  SELECT count(*) INTO n FROM cross_reference_threads t JOIN s503c_thread s ON s.id = t.id
    WHERE (t.title = s.old_title AND t.summary_md = s.old_summary) OR (t.title = s.new_title AND t.summary_md = s.new_summary);
  IF n <> 1 THEN RAISE EXCEPTION 'S503c: thread 8 title/summary differ from the read-back — re-dump and rebuild'; END IF;
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
  RAISE NOTICE 'S503c (great-commission-all-nations) summary: notes rewritten % / already there %; member notes rewritten % / already there %; thread rewritten % / already there %', n_notes, n_c - n_notes, n_m, n_c - n_m, n_t, 1 - n_t;
END $s503c2$;
COMMIT;
\echo 'session503c — great-commission-all-nations done.'
