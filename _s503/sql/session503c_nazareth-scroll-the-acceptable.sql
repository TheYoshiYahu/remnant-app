-- =====================================================================
-- Session 503c migration — summaries sweep — thread 554 `nazareth-scroll-the-acceptable-year-stopped-mid-verse-and-the-individual-mercy-contrast-cases`: title + summary rewritten (slug kept); 0 member card(s)
-- rewritten in place with their member notes (ids, verse pairs and membership untouched). Written and read on Claude Fable 5.1 against
-- live read-back S496 (canon/luke) · schema 1.0.0-phase4-session475. Every note composed by script (build503c.py). Guards RAISE before any write if the live data moved. Idempotent. Nothing deleted.
-- Run: python3 api/apply_migration.py data-schema/migrations/session503c_nazareth-scroll-the-acceptable.sql
-- =====================================================================
\echo 'session503c — nazareth-scroll-the-acceptable starting...'
BEGIN;
CREATE TEMP TABLE s503c_cards (id bigint, s_ed text, s_book text, src_ch int, src_vn int, src_text text, t_ed text, tgt_book text, tgt_ch int, tgt_vn int, old_note text, new_note text, thread_id bigint, old_mnote text, new_mnote text) ON COMMIT DROP;
-- (no card rows)
CREATE TEMP TABLE s503c_thread (id bigint, slug text, old_title text, new_title text, old_summary text, new_summary text) ON COMMIT DROP;
INSERT INTO s503c_thread VALUES (554, 'nazareth-scroll-the-acceptable-year-stopped-mid-verse-and-the-individual-mercy-contrast-cases', $n$The Nazareth scroll — the acceptable year stopped mid-verse, and the individual-mercy contrast cases$n$, $n$The Nazareth scroll — the acceptable year read, the day of vengeance left for its day, and the widow of Sidon and Naaman named (Isaiah 61; 1 Kings 17; 2 Kings 5)$n$, $n$At the Natsareth (Nazareth) synagogue, the King reads Yeshayahu (Isaiah) 61:1-2a and stops — *the acceptable year of Yahuah (the LORD)* is fulfilled today; *the day of vengeance of our Elohim (God)* is left unread because it is not yet today. The cutting is theological. The first coming is the acceptable year of liberty-to-the-captives — the scattered-seed-gathering language being inaugurated. The day of vengeance is the dreadful day still future. Then the King points to Eliyahu (Elijah) and the widow of Tsarephath (Zarephath), and Elisha and Naaman the Syrian — the individual-mercy contrast cases the framework holds against the false-inclusion-gospel. Foreign-origin individuals receive mercy without absorption into the seed-of-promise; absorption requires the marriage covenant Rachav (Rahab) and Ruth walked through. The crowd's murder-rage (vv.28-29 — they try to throw him off the cliff) is the read: they hear the contrast cases as a threat to the flesh-credential gospel and they want him dead for it. FRAMEWORK-MAJOR: the Spirit-anointed-Elect-One self-identification, the eschatological cut at *the acceptable year,* and the contrast-cases-as-the-tell.$n$, $n$It ain't new. On the Sabbath in Nazareth he is handed Isaiah and reads:

*The Spirit of Yahuah (Lord) is upon me, because he hath anointed me to preach the gospel to the poor; he hath sent me to heal the brokenhearted, to preach deliverance to the captives, and recovering of sight to the blind, to set at liberty them that are bruised,* (Luke 4:18)

*To preach the acceptable year of Yahuah (Lord).* (Luke 4:19)

Then he closes the book. Isaiah's sentence goes on: *To proclaim the acceptable year of Yahuah (LORD), and the day of vengeance of our Elohim (God); to comfort all that mourn;* (Isaiah 61:2). He stopped at the comma. *This day is this scripture fulfilled in your ears.* (Luke 4:21) is said of the acceptable year and the liberty to the captives, not of the day of vengeance, which was not that day and is not yet. The first coming is the one; the dreadful day is the other.

They take it well until he says where the word went the last time Yahuah (God) sent a prophet in a famine:

*But I tell you of a truth, many widows were in Yashar'el (Israel) in the days of Elijah, when the heaven was shut up three years and six months, when great famine was throughout all the land;* (Luke 4:25)

*But unto none of them was Elijah sent, save unto Sarepta, a city of Sidon, unto a woman that was a widow.* (Luke 4:26)

*And many lepers were in Yashar'el (Israel) in the time of Elisha the prophet; and none of them was cleansed, saving Naaman the Syrian.* (Luke 4:27)

Both were outside the land, among the nations, and both answered the word when it came: *Now by this I know that thou art a man of Elohim (God), and that the word of Yahuah (LORD) in thy mouth is truth.* (1 Kings 17:24); *Behold, now I know that there is no Elohim (God) in all the earth, but in Yashar'el (Israel)* (2 Kings 5:15). Neither was an outsider handed a kindness. Each heard and followed, which is how his sheep are known: *My sheep hear my voice, and I know them, and they follow me:* (John 10:27), and *other sheep I have, which are not of this fold: them also I must bring, and they shall hear my voice* (John 10:16). Seed of the house, revealed outside its borders by its hearing. That is what the synagogue could not bear: that the favour had gone out past the land to people they counted as nothing, and passed over a house that trusted its birth. *And all they in the synagogue, when they heard these things, were filled with wrath,* (Luke 4:28) and they led him to the brow of the hill to cast him down.$n$);

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
  IF NOT FOUND THEN RAISE EXCEPTION 'S503c: thread 554 not found under its slug'; END IF;
  SELECT count(*) INTO n FROM cross_reference_threads t JOIN s503c_thread s ON s.id = t.id
    WHERE (t.title = s.old_title AND t.summary_md = s.old_summary) OR (t.title = s.new_title AND t.summary_md = s.new_summary);
  IF n <> 1 THEN RAISE EXCEPTION 'S503c: thread 554 title/summary differ from the read-back — re-dump and rebuild'; END IF;
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
  RAISE NOTICE 'S503c (nazareth-scroll-the-acceptable) summary: notes rewritten % / already there %; member notes rewritten % / already there %; thread rewritten % / already there %', n_notes, n_c - n_notes, n_m, n_c - n_m, n_t, 1 - n_t;
END $s503c2$;
COMMIT;
\echo 'session503c — nazareth-scroll-the-acceptable done.'
