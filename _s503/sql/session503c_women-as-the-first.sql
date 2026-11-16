-- =====================================================================
-- Session 503c migration — summaries sweep — thread 25 `women-as-the-first-witnesses-of-the-resurrection-and-the-faithful-witness-substance`: title + summary rewritten (slug kept); 0 member card(s)
-- rewritten in place with their member notes (ids, verse pairs and membership untouched). Written and read on Claude Fable 5.1 against
-- live read-back S503 (canon/matthew) · schema 1.0.0-phase4-session475. Every note composed by script (build503c.py). Guards RAISE before any write if the live data moved. Idempotent. Nothing deleted.
-- Run: python3 api/apply_migration.py data-schema/migrations/session503c_women-as-the-first.sql
-- =====================================================================
\echo 'session503c — women-as-the-first starting...'
BEGIN;
CREATE TEMP TABLE s503c_cards (id bigint, s_ed text, s_book text, src_ch int, src_vn int, src_text text, t_ed text, tgt_book text, tgt_ch int, tgt_vn int, old_note text, new_note text, thread_id bigint, old_mnote text, new_mnote text) ON COMMIT DROP;
-- (no card rows)
CREATE TEMP TABLE s503c_thread (id bigint, slug text, old_title text, new_title text, old_summary text, new_summary text) ON COMMIT DROP;
INSERT INTO s503c_thread VALUES (25, 'women-as-the-first-witnesses-of-the-resurrection-and-the-faithful-witness-substance', $n$Women As The First Witnesses Of The Resurrection And The Faithful Witness Substance$n$, $n$The women who followed from Galilee — at the cross, at the burial, and first at the empty tomb (Luke 8; John 20; Deuteronomy 19)$n$, $n$**`women-as-the-first-witnesses-of-the-resurrection-and-the-faithful-witness-substance`** — anchor at Matt 28:1-10. The substantial-women-substance walks the substantial-substance-of-the-substantial-first-witnesses-of-the-Resurrection-substance from-the-substantial-Cross + burial + Resurrection. 9 members.$n$, $n$It ain't new. The same women are at every station. They had followed him from Galilee and kept him out of their own means:

*And certain women, which had been healed of evil spirits and infirmities, Mary called Magdalene, out of whom went seven devils,* (Luke 8:2)

*And Joanna the wife of Chuza Herod’s steward, and Susanna, and many others, which ministered unto him of their substance.* (Luke 8:3)

They stood at the cross when the twelve were gone:

*And many women were there beholding afar off, which followed Yahusha (Jesus) from Galilee, ministering unto him:* (Matthew 27:55)

*Among which was Mary Magdalene, and Mary the mother of James and Joses, and the mother of Zebedee’s children.* (Matthew 27:56)

*Now there stood by the cross of Yahusha (Jesus) his mother, and his mother’s sister, Mary the wife of Cleophas, and Mary Magdalene.* (John 19:25)

They sat at the burial:

*And there was Mary Magdalene, and the other Mary, sitting over against the sepulchre.* (Matthew 27:61)

And they came first to the tomb and were the first told, the first sent, and the first he met:

*In the end of the sabbath, as it began to dawn toward the first day of the week, came Mary Magdalene and the other Mary to see the sepulchre.* (Matthew 28:1)

*And go quickly, and tell his disciples that he is risen from the dead; and, behold, he goeth before you into Galilee; there shall ye see him: lo, I have told you.* (Matthew 28:7)

*And as they went to tell his disciples, behold, Yahusha (Jesus) met them, saying, All hail. And they came and held him by the feet, and worshipped him.* (Matthew 28:9)

*Then said Yahusha (Jesus) unto them, Be not afraid: go tell my brethren that they go into Galilee, and there shall they see me.* (Matthew 28:10)

Mark says it outright, and John tells what Mary was given to carry:

*Now when Yahusha (Jesus) was risen early the first day of the week, he appeared first to Mary Magdalene, out of whom he had cast seven devils.* (Mark 16:9)

*Yahusha (Jesus) saith unto her, Touch me not; for I am not yet ascended to my Father: but go to my brethren, and say unto them, I ascend unto my Father, and your Father; and to my Elohim (God), and your Elohim (God).* (John 20:17)

*Mary Magdalene came and told the disciples that she had seen Yahusha (Lord), and that he had spoken these things unto her.* (John 20:18)

*Go tell my brethren*: the first witness of the rising is a woman carrying the word to the men. The Torah establishes a matter at the mouth of two or three witnesses, and there were two Marys at the tomb, the same two who had sat at the grave and stood at the cross:

*One witness shall not rise up against a man for any iniquity, or for any sin, in any sin that he sinneth: at the mouth of two witnesses, or at the mouth of three witnesses, shall the matter be established.* (Deuteronomy 19:15)

Who can find such a woman, the proverb asks, and the gospels answer with names: Mary Magdalene, the other Mary, Joanna, Susanna, and many others, who saw the death, the burial and the empty grave with their own eyes and were believed by the brethren because they were sent.

*Who can find a virtuous woman? for her price is far above rubies.* (Proverbs 31:10)$n$);

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
  IF NOT FOUND THEN RAISE EXCEPTION 'S503c: thread 25 not found under its slug'; END IF;
  SELECT count(*) INTO n FROM cross_reference_threads t JOIN s503c_thread s ON s.id = t.id
    WHERE (t.title = s.old_title AND t.summary_md = s.old_summary) OR (t.title = s.new_title AND t.summary_md = s.new_summary);
  IF n <> 1 THEN RAISE EXCEPTION 'S503c: thread 25 title/summary differ from the read-back — re-dump and rebuild'; END IF;
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
  RAISE NOTICE 'S503c (women-as-the-first) summary: notes rewritten % / already there %; member notes rewritten % / already there %; thread rewritten % / already there %', n_notes, n_c - n_notes, n_m, n_c - n_m, n_t, 1 - n_t;
END $s503c2$;
COMMIT;
\echo 'session503c — women-as-the-first done.'
