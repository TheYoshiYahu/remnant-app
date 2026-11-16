-- =====================================================================
-- Session 503c migration — summaries sweep — thread 22 `thirty-pieces-of-silver-zekharyah-11-12-13-tanakh-prophetic-fulfillment`: title + summary rewritten (slug kept); 0 member card(s)
-- rewritten in place with their member notes (ids, verse pairs and membership untouched). Written and read on Claude Fable 5.1 against
-- live read-back S503 (canon/matthew) · schema 1.0.0-phase4-session475. Every note composed by script (build503c.py). Guards RAISE before any write if the live data moved. Idempotent. Nothing deleted.
-- Run: python3 api/apply_migration.py data-schema/migrations/session503c_thirty-pieces-of-silver.sql
-- =====================================================================
\echo 'session503c — thirty-pieces-of-silver starting...'
BEGIN;
CREATE TEMP TABLE s503c_cards (id bigint, s_ed text, s_book text, src_ch int, src_vn int, src_text text, t_ed text, tgt_book text, tgt_ch int, tgt_vn int, old_note text, new_note text, thread_id bigint, old_mnote text, new_mnote text) ON COMMIT DROP;
-- (no card rows)
CREATE TEMP TABLE s503c_thread (id bigint, slug text, old_title text, new_title text, old_summary text, new_summary text) ON COMMIT DROP;
INSERT INTO s503c_thread VALUES (22, 'thirty-pieces-of-silver-zekharyah-11-12-13-tanakh-prophetic-fulfillment', $n$Thirty Pieces Of Silver Zekharyah 11 12 13 Tanakh Prophetic Fulfillment$n$, $n$Thirty pieces of silver — the price of the shepherd, cast to the potter in the house of Yahuah (the LORD) (Zechariah 11; Exodus 21; Psalm 41)$n$, $n$**`thirty-pieces-of-silver-zekharyah-11-12-13-tanakh-prophetic-fulfillment`** — anchor at Matt 26:14-16. The substantial-thirty-pieces-of-silver substance per Zekharyah 11:12-13's-substantial-Tanakh-prophetic-substance — the substantial-Tanakh-prophetic-substance walks-out the substantial-Yahudah's-betrayal-substance + the substantial-cast-to-the-potter-substance per Matt 27:3-10. 9 members.$n$, $n$It ain't new. Judas sets a price and the priests agree to it:

*And said unto them, What will ye give me, and I will deliver him unto you? And they covenanted with him for thirty pieces of silver.* (Matthew 26:15)

Zechariah had already been paid that sum for shepherding the flock, and had already thrown it where Judas would throw it:

*And I said unto them, If ye think good, give me my price; and if not, forbear. So they weighed for my price thirty pieces of silver.* (Zechariah 11:12)

*And Yahuah (LORD) said unto me, Cast it unto the potter: a goodly price that I was prised at of them. And I took the thirty pieces of silver, and cast them to the potter in the house of Yahuah (LORD).* (Zechariah 11:13)

*A goodly price that I was prised at of them*: thirty pieces was the sum the Torah set for a slave killed by an ox, the worth of a servant's life and no more:

*If the ox shall push a manservant or a maidservant; he shall give unto their master thirty shekels of silver, and the ox shall be stoned.* (Exodus 21:32)

The shepherd of the house was valued at a gored servant, and Matthew closes the account where Zechariah left it, with the silver thrown back in the temple and spent on a potter's field:

*Then was fulfilled that which was spoken by Jeremiah the prophet, saying, And they took the thirty pieces of silver, the price of him that was valued, whom they of the children of Yashar'el (Israel) did value;* (Matthew 27:9)

*And gave them for the potter’s field, as Yahuah (Lord) appointed me.* (Matthew 27:10)

The betrayer himself was written too, by David, and Yahusha (Jesus) said so at the table with Judas still in the room:

*Yea, mine own familiar friend, in whom I trusted, which did eat of my bread, hath lifted up his heel against me.* (Psalm 41:9)

*I speak not of you all: I know whom I have chosen: but that the scripture may be fulfilled, He that eateth bread with me hath lifted up his heel against me.* (John 13:18)

The price, the potter, the house of Yahuah (the LORD), the friend who ate his bread: none of it took him by surprise. He walked into what the prophets had written and let Judas play his part in it.$n$);

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
  IF NOT FOUND THEN RAISE EXCEPTION 'S503c: thread 22 not found under its slug'; END IF;
  SELECT count(*) INTO n FROM cross_reference_threads t JOIN s503c_thread s ON s.id = t.id
    WHERE (t.title = s.old_title AND t.summary_md = s.old_summary) OR (t.title = s.new_title AND t.summary_md = s.new_summary);
  IF n <> 1 THEN RAISE EXCEPTION 'S503c: thread 22 title/summary differ from the read-back — re-dump and rebuild'; END IF;
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
  RAISE NOTICE 'S503c (thirty-pieces-of-silver) summary: notes rewritten % / already there %; member notes rewritten % / already there %; thread rewritten % / already there %', n_notes, n_c - n_notes, n_m, n_c - n_m, n_t, 1 - n_t;
END $s503c2$;
COMMIT;
\echo 'session503c — thirty-pieces-of-silver done.'
