-- =====================================================================
-- Session 503c migration — summaries sweep — thread 636 `luke-4-the-individual-mercy-contrast-cases-elijah-elisha-and-the-famine-in-sirach-48`: title + summary rewritten (slug kept); 0 member card(s)
-- rewritten in place with their member notes (ids, verse pairs and membership untouched). Written and read on Claude Fable 5.1 against
-- live read-back S496 (canon/luke) · schema 1.0.0-phase4-session475. Every note composed by script (build503c.py). Guards RAISE before any write if the live data moved. Idempotent. Nothing deleted.
-- Run: python3 api/apply_migration.py data-schema/migrations/session503c_luke-4-the-individual.sql
-- =====================================================================
\echo 'session503c — luke-4-the-individual starting...'
BEGIN;
CREATE TEMP TABLE s503c_cards (id bigint, s_ed text, s_book text, src_ch int, src_vn int, src_text text, t_ed text, tgt_book text, tgt_ch int, tgt_vn int, old_note text, new_note text, thread_id bigint, old_mnote text, new_mnote text) ON COMMIT DROP;
-- (no card rows)
CREATE TEMP TABLE s503c_thread (id bigint, slug text, old_title text, new_title text, old_summary text, new_summary text) ON COMMIT DROP;
INSERT INTO s503c_thread VALUES (636, 'luke-4-the-individual-mercy-contrast-cases-elijah-elisha-and-the-famine-in-sirach-48', $n$The individual-mercy contrast cases — Elias, Eliseus, and the famine in Sirach 48$n$, $n$Elijah's famine and Elisha's spirit — Sirach 48 behind the widow of Sidon and Naaman$n$, $n$At Natsareth (Nazareth) the King names the two contrast cases that turn the synagogue to murder-rage: *many widows were in Yashar'el (Israel) in the days of Elijah... but unto none of them was Elijah sent, save unto Sarepta, a city of Sidon, unto a woman that was a widow. And many lepers were in Yashar'el (Israel) in the time of Elisha the prophet; and none of them was cleansed, saving Naaman the Syrian* (Luke 4:25-27). These are the INDIVIDUAL-MERCY-WITHOUT-ABSORPTION cases the framework holds against the false-inclusion gospel: foreign-origin individuals — the Tsidonian (Sidonian) widow, the Syrian commander — receive mercy without being thereby made covenant-seed. Absorption into the seed-of-promise runs through the marriage-covenant alone (Rachav/Rahab, Ruth); the contrast cases prove the directional non-symmetry. The Hebrew library carries the prophets behind both cases. Sirach (Ecclesiasticus) 48:1-3 names Eliyahu (Elijah) the fire-prophet who *by the word of Yahuah (God)... shut up the heaven* — the very famine the King names. Sirach 48:12 names *Elisha* (Elisha) *filled with his spirit* — the prophet who cleansed the Syrian. The crowd hears the contrast cases as a threat to the flesh-credential gospel of *we have Avraham (Abraham) to our father* and wants the King dead for it. The Hebrew library names the prophets; the King reads their individual-mercy cases as the tell that exposes the flesh-credential lie.$n$, $n$It ain't new. The two names he sets before Nazareth are the two prophets Sirach praises back to back. Elijah first:

*Then stood up Elias the prophet as fire, and his word burned like a lamp.* (Sirach 48:1)

*By the word of Yahuah (God) he shut up the heaven, and also three times brought down fire.* (Sirach 48:3)

That shut heaven is the famine he names in the synagogue: *many widows were in Yashar'el (Israel) in the days of Elijah, when the heaven was shut up three years and six months* (Luke 4:25). Then Elisha:

*Elias it was, who was covered with a whirlwind: and Eliseus was filled with his spirit: while he lived, he was not moved with the presence of any prince, neither could any bring him into subjection.* (Sirach 48:12)

Filled with Elijah's spirit, and the one leper he cleansed was *Naaman the Syrian* (Luke 4:27). Sirach knows both prophets as Yashar'el (Israel)'s own and does nothing to soften where their work landed. In the famine the word went to a widow in Sidon, and the leper made clean was a Syrian, while many in the land went without. They were not strangers shown a favour; they were the ones who heard. *Now by this I know that thou art a man of Elohim (God), and that the word of Yahuah (LORD) in thy mouth is truth.* (1 Kings 17:24). *Behold, now I know that there is no Elohim (God) in all the earth, but in Yashar'el (Israel)* (2 Kings 5:15). Seed of the house revealed outside its borders by its hearing, which is how his sheep are always known: *My sheep hear my voice, and I know them, and they follow me:* (John 10:27). Nazareth heard the same two stories told back to them and *were filled with wrath* (Luke 4:28).$n$);

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
  IF NOT FOUND THEN RAISE EXCEPTION 'S503c: thread 636 not found under its slug'; END IF;
  SELECT count(*) INTO n FROM cross_reference_threads t JOIN s503c_thread s ON s.id = t.id
    WHERE (t.title = s.old_title AND t.summary_md = s.old_summary) OR (t.title = s.new_title AND t.summary_md = s.new_summary);
  IF n <> 1 THEN RAISE EXCEPTION 'S503c: thread 636 title/summary differ from the read-back — re-dump and rebuild'; END IF;
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
  RAISE NOTICE 'S503c (luke-4-the-individual) summary: notes rewritten % / already there %; member notes rewritten % / already there %; thread rewritten % / already there %', n_notes, n_c - n_notes, n_m, n_c - n_m, n_t, 1 - n_t;
END $s503c2$;
COMMIT;
\echo 'session503c — luke-4-the-individual done.'
