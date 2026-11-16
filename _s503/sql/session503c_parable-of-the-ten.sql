-- =====================================================================
-- Session 503c migration — summaries sweep — thread 14 `parable-of-the-ten-virgins-oil-substance-as-heart-torah-walking-life`: title + summary rewritten (slug kept); 0 member card(s)
-- rewritten in place with their member notes (ids, verse pairs and membership untouched). Written and read on Claude Fable 5.1 against
-- live read-back S503 (canon/matthew) · schema 1.0.0-phase4-session475. Every note composed by script (build503c.py). Guards RAISE before any write if the live data moved. Idempotent. Nothing deleted.
-- Run: python3 api/apply_migration.py data-schema/migrations/session503c_parable-of-the-ten.sql
-- =====================================================================
\echo 'session503c — parable-of-the-ten starting...'
BEGIN;
CREATE TEMP TABLE s503c_cards (id bigint, s_ed text, s_book text, src_ch int, src_vn int, src_text text, t_ed text, tgt_book text, tgt_ch int, tgt_vn int, old_note text, new_note text, thread_id bigint, old_mnote text, new_mnote text) ON COMMIT DROP;
-- (no card rows)
CREATE TEMP TABLE s503c_thread (id bigint, slug text, old_title text, new_title text, old_summary text, new_summary text) ON COMMIT DROP;
INSERT INTO s503c_thread VALUES (14, 'parable-of-the-ten-virgins-oil-substance-as-heart-torah-walking-life', $n$Parable Of The Ten Virgins Oil Substance As Heart Torah Walking Life$n$, $n$The ten virgins — oil in the vessel, the shut door, and I know you not (Ezekiel 36; Zechariah 4; Matthew 7)$n$, $n$**`parable-of-the-ten-virgins-oil-substance-as-heart-torah-walking-life`** — anchor at Matt 25:1-13. The substantial-substance-of-the-oil-substance walks the substantial-heart-Torah-walking-life-substance per `heart-torah-not-abolition` thread (FRAMEWORK-MAJOR — PROPOSED at Matt 5) + the substantial-substance-of-the-substance-of-the-new-heart-substance per Yechezk'el 36:26-27. The substantial-shut-door + *Lord, Lord, open to us* + *I know you not* directly echo Matt 7:21-23's `lord-lord-and-torahlessness` thread (FRAMEWORK-MAJOR). 14 members.$n$, $n$It ain't new. Ten virgins go out to meet the bridegroom, all with lamps, and the parable turns on one thing they did not all carry:

*They that were foolish took their lamps, and took no oil with them:* (Matthew 25:3)

*But the wise took oil in their vessels with their lamps.* (Matthew 25:4)

A lamp with no oil burns for a while on what it was lit with and then goes out. The prophets had already said what fills the vessel so the lamp keeps burning, and it is not the lamp:

*A new heart also will I give you, and a new spirit will I put within you: and I will take away the stony heart out of your flesh, and I will give you an heart of flesh.* (Ezekiel 36:26)

*And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them.* (Ezekiel 36:27)

*But this shall be the covenant that I will make with the house of Yashar'el (Israel); After those days, saith Yahuah (LORD), I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people.* (Jeremiah 31:33)

The Spirit put within, and the Torah written in the heart so that a man walks in the statutes: that is oil in the vessel. Zechariah saw a lampstand that burned because oil was fed to it, and heard what the oil was:

*And said unto me, What seest thou? And I said, I have looked, and behold a candlestick all of gold, with a bowl upon the top of it, and his seven lamps thereon, and seven pipes to the seven lamps, which are upon the top thereof:* (Zechariah 4:2)

*Then he answered and spake unto me, saying, This is the word of Yahuah (LORD) unto Zerubbabel, saying, Not by might, nor by power, but by my spirit, saith Yahuah Tseva'ot (LORD of hosts).* (Zechariah 4:6)

Then the door:

*And while they went to buy, the bridegroom came; and they that were ready went in with him to the marriage: and the door was shut.* (Matthew 25:10)

*Afterward came also the other virgins, saying, Adonai (Lord), Adonai (Lord), open to us.* (Matthew 25:11)

*But he answered and said, Verily I say unto you, I know you not.* (Matthew 25:12)

Mark who is outside. Not strangers, not the tares, but virgins who went out to meet him, with lamps, calling him *Adonai (Lord)*. They are of the house, and the door is shut on them. He had said it before, and said what the shut door is about:

*Not every one that saith unto me, Adonai (Lord), Adonai (Lord), shall enter into the kingdom of heaven; but he that doeth the will of my Father which is in heaven.* (Matthew 7:21)

*And then will I profess unto them, I never knew you: depart from me, ye that work iniquity.* (Matthew 7:23)

Luke has the same knock and the same answer:

*When once the master of the house is risen up, and hath shut to the door, and ye begin to stand without, and to knock at the door, saying, Adonai (Lord), Adonai (Lord), open unto us; and he shall answer and say unto you, I know you not whence ye are:* (Luke 13:25)

Yahuah (the LORD) shut a door once before, on the whole earth, with the ones inside who had done as he commanded:

*And they that went in, went in male and female of all flesh, as Elohim (God) had commanded him: and Yahuah (LORD) shut him in.* (Genesis 7:16)

The virgins outside had the lamp and the name and the right road, and no oil. The sifting at the door is of the house, the ones who called him *Adonai (Lord)* and did not walk in the statutes, and the warning is to the house:

*Watch therefore, for ye know neither the day nor the hour wherein the Son of Adam cometh.* (Matthew 25:13)$n$);

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
  IF NOT FOUND THEN RAISE EXCEPTION 'S503c: thread 14 not found under its slug'; END IF;
  SELECT count(*) INTO n FROM cross_reference_threads t JOIN s503c_thread s ON s.id = t.id
    WHERE (t.title = s.old_title AND t.summary_md = s.old_summary) OR (t.title = s.new_title AND t.summary_md = s.new_summary);
  IF n <> 1 THEN RAISE EXCEPTION 'S503c: thread 14 title/summary differ from the read-back — re-dump and rebuild'; END IF;
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
  RAISE NOTICE 'S503c (parable-of-the-ten) summary: notes rewritten % / already there %; member notes rewritten % / already there %; thread rewritten % / already there %', n_notes, n_c - n_notes, n_m, n_c - n_m, n_t, 1 - n_t;
END $s503c2$;
COMMIT;
\echo 'session503c — parable-of-the-ten done.'
