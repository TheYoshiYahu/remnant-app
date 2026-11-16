-- =====================================================================
-- Session 503c migration — summaries sweep — thread 571 `rich-man-and-lazaros-the-framework-honest-sheol-with-two-compartments-and-the-mosheh-and-the-prophets-test`: title + summary rewritten (slug kept); 0 member card(s)
-- rewritten in place with their member notes (ids, verse pairs and membership untouched). Written and read on Claude Fable 5.1 against
-- live read-back S496 (canon/luke) · schema 1.0.0-phase4-session475. Every note composed by script (build503c.py). Guards RAISE before any write if the live data moved. Idempotent. Nothing deleted.
-- Run: python3 api/apply_migration.py data-schema/migrations/session503c_rich-man-and-lazaros.sql
-- =====================================================================
\echo 'session503c — rich-man-and-lazaros starting...'
BEGIN;
CREATE TEMP TABLE s503c_cards (id bigint, s_ed text, s_book text, src_ch int, src_vn int, src_text text, t_ed text, tgt_book text, tgt_ch int, tgt_vn int, old_note text, new_note text, thread_id bigint, old_mnote text, new_mnote text) ON COMMIT DROP;
-- (no card rows)
CREATE TEMP TABLE s503c_thread (id bigint, slug text, old_title text, new_title text, old_summary text, new_summary text) ON COMMIT DROP;
INSERT INTO s503c_thread VALUES (571, 'rich-man-and-lazaros-the-framework-honest-sheol-with-two-compartments-and-the-mosheh-and-the-prophets-test', $n$The rich man and Lazaros — Sheol with its divisions, and *they have Mosheh and the prophets*$n$, $n$The rich man and Lazarus — Abraham's bosom, the torment, the great gulf, and *they have Moses and the prophets*$n$, $n$Lazaros, full of sores and laid at the gate with the dogs licking him, dies and *was carried by the angels into Abraham’s bosom: the rich man also died, and was buried;* (Luke 16:22). *And in hell he lift up his eyes, being in torments, and seeth Abraham afar off, and Lazarus in his bosom.* (Luke 16:23). The dead in this parable remember, the rich man knows he has five brothers; they see, across a gulf; they are still themselves, Lazaros still Lazaros and the rich man still the rich man. And the two places are divided: *And beside all this, between us and you there is a great gulf fixed: so that they which would pass from hence to you cannot; neither can they pass to us, that would come from thence.* (Luke 16:26). Two inherited teachings both stumble here. The one that says the dead sleep without knowing anything has to explain away a conversation. The one that says the torment is the final and eternal state has to ignore that this is Sheol before the resurrection, a holding place and not a verdict. Enoch was shown the holding place and told how it is arranged: *And he answered me and said unto me: ‘These three have been made that the spirits of the dead might be separated. And such a division has been made for the spirits of the righteous, in which there is the bright spring of water.* (1 Enoch 22:9). *And such has been made for sinners when they die and are buried in the earth and judgement has not been executed on them in their lifetime.* (1 Enoch 22:10). *Here their spirits shall be set apart in this great pain till the great day of judgement and punishment and torment of those who curse for ever and retribution for their spirits. There He shall bind them for ever.* (1 Enoch 22:11). Awake, divided, and waiting for the great day: that is what the rich man is doing, and the parable only makes sense if that is where he is. Then the parable turns to the living. The rich man wants a messenger sent to his brothers, and Abraham answers, *they have Mosheh (Moses) and the prophets; let them hear them. If they hear not Mosheh (Moses) and the prophets, neither will they be persuaded, though one rose from the dead* (Luke 16:29, 31). That is the King's standing test against every gospel that sets the Torah aside, and it was proved in the open when another Lazaros was raised at John 11 and the chief priests set about killing him. Five brothers, the leadership of the house of Yahudah (Judah), who would not hear Moses, and so did not believe when one rose.$n$, $n$It ain't new. Luke tells it in his own words, and the words are enough:

*And it came to pass, that the beggar died, and was carried by the angels into Abraham’s bosom: the rich man also died, and was buried;* (Luke 16:22)

*And in hell he lift up his eyes, being in torments, and seeth Abraham afar off, and Lazarus in his bosom.* (Luke 16:23)

*And beside all this, between us and you there is a great gulf fixed: so that they which would pass from hence to you cannot; neither can they pass to us, that would come from thence.* (Luke 16:26)

Abraham's bosom on one side, torments on the other, a great gulf fixed between, and both men awake. The rich man sees, speaks, remembers his five brothers, feels the flame and asks for water. Lazarus is comforted. Abraham answers. Two teachings handed down both have to argue with the page. The one that says the dead know nothing until the resurrection has a dead man holding a conversation. The one that says this flame is the final judgment has Abraham say *now he is comforted, and thou art tormented.* (Luke 16:25) while the five brothers are still alive on the earth and no one has risen. Luke says bosom, torments, gulf, and a man waiting; he does not say the end has come. David had said the grave gives back: *But Elohim (God) will redeem my soul from the power of the grave: for he shall receive me. Selah.* (Psalm 49:15)

Then the parable turns to the living:

*Abraham saith unto him, They have Moses and the prophets; let them hear them.* (Luke 16:29)

*And he said unto him, If they hear not Moses and the prophets, neither will they be persuaded, though one rose from the dead.* (Luke 16:31)

That is the test he leaves standing against every gospel that sets Moses aside, and it was tried in the open. Another Lazarus did rise, *he cried with a loud voice, Lazarus, come forth.* (John 11:43), and *the chief priests consulted that they might put Lazarus also to death;* (John 12:10). Men who would not hear Moses were not persuaded by one risen from the dead, exactly as Abraham had said. *For had ye believed Moses, ye would have believed me: for he wrote of me.* (John 5:46)$n$);

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
  IF NOT FOUND THEN RAISE EXCEPTION 'S503c: thread 571 not found under its slug'; END IF;
  SELECT count(*) INTO n FROM cross_reference_threads t JOIN s503c_thread s ON s.id = t.id
    WHERE (t.title = s.old_title AND t.summary_md = s.old_summary) OR (t.title = s.new_title AND t.summary_md = s.new_summary);
  IF n <> 1 THEN RAISE EXCEPTION 'S503c: thread 571 title/summary differ from the read-back — re-dump and rebuild'; END IF;
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
  RAISE NOTICE 'S503c (rich-man-and-lazaros) summary: notes rewritten % / already there %; member notes rewritten % / already there %; thread rewritten % / already there %', n_notes, n_c - n_notes, n_m, n_c - n_m, n_t, 1 - n_t;
END $s503c2$;
COMMIT;
\echo 'session503c — rich-man-and-lazaros done.'
