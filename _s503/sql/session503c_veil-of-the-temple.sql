-- =====================================================================
-- Session 503c migration — summaries sweep — thread 24 `veil-of-the-temple-rent-and-the-substantial-access-to-the-father-through-the-cross`: title + summary rewritten (slug kept); 0 member card(s)
-- rewritten in place with their member notes (ids, verse pairs and membership untouched). Written and read on Claude Fable 5.1 against
-- live read-back S503 (canon/matthew) · schema 1.0.0-phase4-session475. Every note composed by script (build503c.py). Guards RAISE before any write if the live data moved. Idempotent. Nothing deleted.
-- Run: python3 api/apply_migration.py data-schema/migrations/session503c_veil-of-the-temple.sql
-- =====================================================================
\echo 'session503c — veil-of-the-temple starting...'
BEGIN;
CREATE TEMP TABLE s503c_cards (id bigint, s_ed text, s_book text, src_ch int, src_vn int, src_text text, t_ed text, tgt_book text, tgt_ch int, tgt_vn int, old_note text, new_note text, thread_id bigint, old_mnote text, new_mnote text) ON COMMIT DROP;
-- (no card rows)
CREATE TEMP TABLE s503c_thread (id bigint, slug text, old_title text, new_title text, old_summary text, new_summary text) ON COMMIT DROP;
INSERT INTO s503c_thread VALUES (24, 'veil-of-the-temple-rent-and-the-substantial-access-to-the-father-through-the-cross', $n$Veil Of The Temple Rent And The Substantial Access To The Father Through The Cross$n$, $n$The veil of the temple rent from the top to the bottom — the way into the holiest opened, and the Sabbath still kept (Exodus 26; Leviticus 16; Hebrews 10)$n$, $n$**`veil-of-the-temple-rent-and-the-substantial-access-to-the-father-through-the-cross`** — anchor at Matt 27:51. The substantial-veil-rent-substance walks the substantial-substance-of-the-Father's-act-substance + the substantial-access-to-the-Father-substance through-the-substantial-Cross-substance per Hebrews 10:19-22. Framework reads carefully — NOT-the-substantial-substance-of-the-categorical-abrogation-of-the-Torah-substance the inherited-Christian-collapse walks; the substantial-substance is the substantial-Yom Kippur-substance walking-substantially-into-the-substantial-Cross-fulfillment-substance. 11 members.$n$, $n$It ain't new. At his death the veil tore, and it tore from the top:

*And, behold, the veil of the temple was rent in twain from the top to the bottom; and the earth did quake, and the rocks rent;* (Matthew 27:51)

*And the sun was darkened, and the veil of the temple was rent in the midst.* (Luke 23:45)

The veil was Moses' veil, hung to divide the holy from the most holy where the ark stood:

*And thou shalt hang up the vail under the taches, that thou mayest bring in thither within the vail the ark of the testimony: and the vail shall divide unto you between the holy place and the most holy.* (Exodus 26:33)

And behind it only one man came, once a year, on pain of death:

*And Yahuah (LORD) said unto Moses, Speak unto Aaron thy brother, that he come not at all times into the holy place within the vail before the mercy seat, which is upon the ark; that he die not: for I will appear in the cloud upon the mercy seat.* (Leviticus 16:2)

The letter to the Hebrews says what the tearing opened, and names the veil for what it stood for:

*Having therefore, brethren, boldness to enter into the holiest by the blood of Yahusha (Jesus),* (Hebrews 10:19)

*By a new and living way, which he hath consecrated for us, through the veil, that is to say, his flesh;* (Hebrews 10:20)

His flesh torn, the way in laid open, and the tearing from the top down because it was the Father's hand and not a man's. Isaiah had set a torn covering on the same mountain where the feast is spread:

*And he will destroy in this mountain the face of the covering cast over all people, and the vail that is spread over all nations.* (Isaiah 25:7)

What the torn veil does not mean is that the house or its service was done away. The women who watched him die kept the Sabbath that same week according to the commandment, and the apostles went on going up to the temple:

*And they returned, and prepared spices and ointments; and rested the sabbath day according to the commandment.* (Luke 23:56)

The veil opened the way to the Father through the Son's flesh. It did not close the Torah. The same afternoon that tore the veil kept the commandment about the body on the tree, and the next day was a Sabbath kept.$n$);

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
  IF NOT FOUND THEN RAISE EXCEPTION 'S503c: thread 24 not found under its slug'; END IF;
  SELECT count(*) INTO n FROM cross_reference_threads t JOIN s503c_thread s ON s.id = t.id
    WHERE (t.title = s.old_title AND t.summary_md = s.old_summary) OR (t.title = s.new_title AND t.summary_md = s.new_summary);
  IF n <> 1 THEN RAISE EXCEPTION 'S503c: thread 24 title/summary differ from the read-back — re-dump and rebuild'; END IF;
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
  RAISE NOTICE 'S503c (veil-of-the-temple) summary: notes rewritten % / already there %; member notes rewritten % / already there %; thread rewritten % / already there %', n_notes, n_c - n_notes, n_m, n_c - n_m, n_t, 1 - n_t;
END $s503c2$;
COMMIT;
\echo 'session503c — veil-of-the-temple done.'
