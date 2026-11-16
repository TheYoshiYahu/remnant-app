-- =====================================================================
-- Session 503c migration — summaries sweep — thread 11 `last-supper-this-is-my-body-this-is-my-blood-of-the-new-testament`: title + summary rewritten (slug kept); 0 member card(s)
-- rewritten in place with their member notes (ids, verse pairs and membership untouched). Written and read on Claude Fable 5.1 against
-- live read-back S503 (canon/matthew) · schema 1.0.0-phase4-session475. Every note composed by script (build503c.py). Guards RAISE before any write if the live data moved. Idempotent. Nothing deleted.
-- Run: python3 api/apply_migration.py data-schema/migrations/session503c_last-supper-this-is.sql
-- =====================================================================
\echo 'session503c — last-supper-this-is starting...'
BEGIN;
CREATE TEMP TABLE s503c_cards (id bigint, s_ed text, s_book text, src_ch int, src_vn int, src_text text, t_ed text, tgt_book text, tgt_ch int, tgt_vn int, old_note text, new_note text, thread_id bigint, old_mnote text, new_mnote text) ON COMMIT DROP;
-- (no card rows)
CREATE TEMP TABLE s503c_thread (id bigint, slug text, old_title text, new_title text, old_summary text, new_summary text) ON COMMIT DROP;
INSERT INTO s503c_thread VALUES (11, 'last-supper-this-is-my-body-this-is-my-blood-of-the-new-testament', $n$Last Supper This Is My Body This Is My Blood Of The New Testament$n$, $n$This is my body, this is my blood of the new testament — the Passover kept and filled, the covenant cut with both houses (Exodus 12 and 24; Jeremiah 31; Isaiah 25)$n$, $n$**`last-supper-this-is-my-body-this-is-my-blood-of-the-new-testament`** — anchor at Matt 26:26-29. The substantial-Pesach (Passover)-meal substance the King-substance walks-out + the substantial-*this is my body* + *this is my blood of the new testament* substance the substantial-Yirmeyahu (Jeremiah) 31:31-34's-new-covenant-substance + the substantial-marriage-of-the-Lamb-substance pre-figured. Framework reads the substance carefully — NOT-Roman-Catholic-transubstantiation, NOT-Reformation-memorial-only; the substantial-Pesach-meal-substance + the King-substance invests-with-the-substantial-Pesach-lamb-fulfillment-substance. 18 members.$n$, $n$It ain't new. The night he was betrayed he kept the Passover as Moses gave it, bread and cup at the table, and said what the bread and the cup were:

*And as they were eating, Yahusha (Jesus) took bread, and blessed it, and brake it, and gave it to the disciples, and said, Take, eat; this is my body.* (Matthew 26:26)

*For this is my blood of the new testament, which is shed for many for the remission of sins.* (Matthew 26:28)

The meal was the feast Moses set for ever, not a new rite put in its place:

*And this day shall be unto you for a memorial; and ye shall keep it a feast to Yahuah (LORD) throughout your generations; ye shall keep it a feast by an ordinance for ever.* (Exodus 12:14)

Paul says the lamb of that feast is who was sacrificed, and the feast is still kept:

*Purge out therefore the old leaven, that ye may be a new lump, as ye are unleavened. For even Messiah (Christ) our passover is sacrificed for us:* (1 Corinthians 5:7)

*Therefore let us keep the feast, not with old leaven, neither with the leaven of malice and wickedness; but with the unleavened bread of sincerity and truth.* (1 Corinthians 5:8)

*My blood of the new testament*: a covenant is cut in blood, and the first one was. Moses sprinkled the people and said the same words over the same thing:

*And Moses took the blood, and sprinkled it on the people, and said, Behold the blood of the covenant, which Yahuah (LORD) hath made with you concerning all these words.* (Exodus 24:8)

The new covenant is Jeremiah's, and Jeremiah names the parties. Not a church in place of a people, but the two houses of the one people, with the Torah written where it was always meant to live:

*Behold, the days come, saith Yahuah (LORD), that I will make a new covenant with the house of Yashar'el (Israel), and with the house of Yahudah (Judah):* (Jeremiah 31:31)

*But this shall be the covenant that I will make with the house of Yashar'el (Israel); After those days, saith Yahuah (LORD), I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people.* (Jeremiah 31:33)

The blood does what the Torah said blood does:

*For the life of the flesh is in the blood: and I have given it to you upon the altar to make an atonement for your souls: for it is the blood that maketh an atonement for the soul.* (Leviticus 17:11)

And the one whose blood it is was named at the river before any of it:

*The next day John seeth Yahusha (Jesus) coming unto him, and saith, Behold the Lamb of Elohim (God), which taketh away the sin of the world.* (John 1:29)

He stops drinking the cup until a day he names:

*But I say unto you, I will not drink henceforth of this fruit of the vine, until that day when I drink it new with you in my Father’s kingdom.* (Matthew 26:29)

That day is the feast on the mountain the prophet spread, and John saw the same supper from the other end:

*And in this mountain shall Yahuah Tseva'ot (LORD of hosts) make unto all people a feast of fat things, a feast of wines on the lees, of fat things full of marrow, of wines on the lees well refined.* (Isaiah 25:6)

*And he saith unto me, Write, Blessed are they which are called unto the marriage supper of the Lamb. And he saith unto me, These are the true sayings of Elohim (God).* (Revelation 19:9)

A Passover kept, a covenant cut in blood as the first was, made with both houses, Torah on the heart, and a cup set down until the feast in the kingdom. Nothing at the table was done away; everything at the table was filled.$n$);

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
  IF NOT FOUND THEN RAISE EXCEPTION 'S503c: thread 11 not found under its slug'; END IF;
  SELECT count(*) INTO n FROM cross_reference_threads t JOIN s503c_thread s ON s.id = t.id
    WHERE (t.title = s.old_title AND t.summary_md = s.old_summary) OR (t.title = s.new_title AND t.summary_md = s.new_summary);
  IF n <> 1 THEN RAISE EXCEPTION 'S503c: thread 11 title/summary differ from the read-back — re-dump and rebuild'; END IF;
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
  RAISE NOTICE 'S503c (last-supper-this-is) summary: notes rewritten % / already there %; member notes rewritten % / already there %; thread rewritten % / already there %', n_notes, n_c - n_notes, n_m, n_c - n_m, n_t, 1 - n_t;
END $s503c2$;
COMMIT;
\echo 'session503c — last-supper-this-is done.'
