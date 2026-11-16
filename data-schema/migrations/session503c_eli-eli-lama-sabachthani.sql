-- =====================================================================
-- Session 503c migration — summaries sweep — thread 6 `eli-eli-lama-sabachthani-the-tehillim-22-citation-and-the-tehillim-22-as-a-whole-substance`: title + summary rewritten (slug kept); 0 member card(s)
-- rewritten in place with their member notes (ids, verse pairs and membership untouched). Written and read on Claude Fable 5.1 against
-- live read-back S503 (canon/matthew) · schema 1.0.0-phase4-session475. Every note composed by script (build503c.py). Guards RAISE before any write if the live data moved. Idempotent. Nothing deleted.
-- Run: python3 api/apply_migration.py data-schema/migrations/session503c_eli-eli-lama-sabachthani.sql
-- =====================================================================
\echo 'session503c — eli-eli-lama-sabachthani starting...'
BEGIN;
CREATE TEMP TABLE s503c_cards (id bigint, s_ed text, s_book text, src_ch int, src_vn int, src_text text, t_ed text, tgt_book text, tgt_ch int, tgt_vn int, old_note text, new_note text, thread_id bigint, old_mnote text, new_mnote text) ON COMMIT DROP;
-- (no card rows)
CREATE TEMP TABLE s503c_thread (id bigint, slug text, old_title text, new_title text, old_summary text, new_summary text) ON COMMIT DROP;
INSERT INTO s503c_thread VALUES (6, 'eli-eli-lama-sabachthani-the-tehillim-22-citation-and-the-tehillim-22-as-a-whole-substance', $n$Eli Eli Lama Sabachthani The Tehillim 22 Citation And The Tehillim 22 As A Whole Substance$n$, $n$Eli, Eli, lama sabachthani — the first line of Psalm 22, and the whole psalm behind it (Hebrews 2; Psalm 31)$n$, $n$**`eli-eli-lama-sabachthani-the-tehillim-22-citation-and-the-tehillim-22-as-a-whole-substance`** — **FRAMEWORK-MAJOR anchor at Matt 27:46.** The substantial-King-substance cites-the-opening-verse-of-Tehillim (Psalm) 22 substance at-the-substantial-substance-of-the-Cross-substance + the substantial-Tehillim 22-as-a-whole walks-from-suffering-into-vindication-substance. Framework reads — substance is-NOT-the-substantial-substance-of-the-categorical-substance-of-the-Father-substantially-forsaking-the-Son-substance the inherited-Christian-collapse walks; the substance is the substantial-rabbinic-citation-of-the-opening-verse-substance summoning-the-whole-Psalm-substance + the substantial-substance-of-the-Cross-substance walks-the-Tehillim 22 substance comprehensively. 15 members.$n$, $n$It ain't new. At the ninth hour he cries out in the words of David:

*And about the ninth hour Yahusha (Jesus) cried with a loud voice, saying, Eli, Eli, lama sabachthani? that is to say, My Elohim (God), my Elohim (God), why hast thou forsaken me?* (Matthew 27:46)

*My Elohim (God), my Elohim (God), why hast thou forsaken me? why art thou so far from helping me, and from the words of my roaring?* (Psalm 22:1)

A man who names the first line of a psalm has the whole psalm in his mouth, and the psalm does not end in the forsaking. It turns, and the one who was forsaken speaks of his brethren:

*I will declare thy name unto my brethren: in the midst of the congregation will I praise thee.* (Psalm 22:22)

The letter to the Hebrews puts that verse in his mouth and tells who the brethren are:

*For both he that sanctifieth and they who are sanctified are all of one: for which cause he is not ashamed to call them brethren,* (Hebrews 2:11)

*Saying, I will declare thy name unto my brethren, in the midst of the church will I sing praise unto thee.* (Hebrews 2:12)

*All of one*: the brethren are kin, the seed of the fathers he took flesh among. The psalm then reaches past the congregation to the ends of the world, and the word for what they do is *remember*, which is what a people does who once knew him:

*All the ends of the world shall remember and turn unto Yahuah (LORD): and all the kindreds of the nations shall worship before thee.* (Psalm 22:27)

*They shall come, and shall declare his righteousness unto a people that shall be born, that he hath done this.* (Psalm 22:31)

The cry was not a man losing his Father. He said as much the night before:

*Behold, the hour cometh, yea, is now come, that ye shall be scattered, every man to his own, and shall leave me alone: and yet I am not alone, because the Father is with me.* (John 16:32)

And his last words were another psalm of David, the hand he committed his spirit into being the Father's:

*Into thine hand I commit my spirit: thou hast redeemed me, O Yahuah Elohim (LORD God) of truth.* (Psalm 31:5)

*And when Yahusha (Jesus) had cried with a loud voice, he said, Father, into thy hands I commend my spirit: and having said thus, he gave up the ghost.* (Luke 23:46)

Why hast thou forsaken me is the first line of a psalm that ends with a people born and a righteousness declared. He quoted the whole of it by its opening, and the rest of the afternoon walked through it line by line.$n$);

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
  IF NOT FOUND THEN RAISE EXCEPTION 'S503c: thread 6 not found under its slug'; END IF;
  SELECT count(*) INTO n FROM cross_reference_threads t JOIN s503c_thread s ON s.id = t.id
    WHERE (t.title = s.old_title AND t.summary_md = s.old_summary) OR (t.title = s.new_title AND t.summary_md = s.new_summary);
  IF n <> 1 THEN RAISE EXCEPTION 'S503c: thread 6 title/summary differ from the read-back — re-dump and rebuild'; END IF;
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
  RAISE NOTICE 'S503c (eli-eli-lama-sabachthani) summary: notes rewritten % / already there %; member notes rewritten % / already there %; thread rewritten % / already there %', n_notes, n_c - n_notes, n_m, n_c - n_m, n_t, 1 - n_t;
END $s503c2$;
COMMIT;
\echo 'session503c — eli-eli-lama-sabachthani done.'
