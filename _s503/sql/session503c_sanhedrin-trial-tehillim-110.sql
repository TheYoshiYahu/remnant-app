-- =====================================================================
-- Session 503c migration — summaries sweep — thread 17 `sanhedrin-trial-tehillim-110-and-daniel-7-self-identification-at-the-kings-own-mouth`: title + summary rewritten (slug kept); 0 member card(s)
-- rewritten in place with their member notes (ids, verse pairs and membership untouched). Written and read on Claude Fable 5.1 against
-- live read-back S503 (canon/matthew) · schema 1.0.0-phase4-session475. Every note composed by script (build503c.py). Guards RAISE before any write if the live data moved. Idempotent. Nothing deleted.
-- Run: python3 api/apply_migration.py data-schema/migrations/session503c_sanhedrin-trial-tehillim-110.sql
-- =====================================================================
\echo 'session503c — sanhedrin-trial-tehillim-110 starting...'
BEGIN;
CREATE TEMP TABLE s503c_cards (id bigint, s_ed text, s_book text, src_ch int, src_vn int, src_text text, t_ed text, tgt_book text, tgt_ch int, tgt_vn int, old_note text, new_note text, thread_id bigint, old_mnote text, new_mnote text) ON COMMIT DROP;
-- (no card rows)
CREATE TEMP TABLE s503c_thread (id bigint, slug text, old_title text, new_title text, old_summary text, new_summary text) ON COMMIT DROP;
INSERT INTO s503c_thread VALUES (17, 'sanhedrin-trial-tehillim-110-and-daniel-7-self-identification-at-the-kings-own-mouth', $n$Sanhedrin Trial Tehillim 110 And Daniel 7 Self Identification At The Kings Own Mouth$n$, $n$Hereafter shall ye see the Son of Adam at the right hand of power — the trial, Psalm 110 and Daniel 7 at his own mouth (Mark 14; Acts 7; Hebrews 1)$n$, $n$**`sanhedrin-trial-tehillim-110-and-daniel-7-self-identification-at-the-kings-own-mouth`** — **FRAMEWORK-MAJOR anchor at Matt 26:64.** The substantial-confluence at-the-King's-own-mouth-substance of the substantial-Tehillim (Psalm) 110:1 substance + the substantial-Daniel 7:13-14 substance per Red Line #12 + the substantial-direct-Messianic-self-identification-substance at-the-substantial-Sanhedrin-substance. The framework reads the substance as title-naming-at-the-King's-own-mouth (NOT-the-substantial-kaph-comparative-substance the framework's-Daniel 7:13 / Hitgalut 1:13 / Hitgalut 14:14-substance preserves-substance). 20 members.$n$, $n$It ain't new. The high priest puts him under oath, and the answer is two scriptures:

*Yahusha (Jesus) saith unto him, Thou hast said: nevertheless I say unto you, Hereafter shall ye see the Son of Adam sitting on the right hand of power, and coming in the clouds of heaven.* (Matthew 26:64)

Mark hears the plain word before the scriptures:

*And Yahusha (Jesus) said, I am: and ye shall see the Son of Adam sitting on the right hand of power, and coming in the clouds of heaven.* (Mark 14:62)

The seat is David's psalm:

*Yahuah (LORD) said unto my Lord, Sit thou at my right hand, until I make thine enemies thy footstool.* (Psalm 110:1)

He had already set that psalm before the Pharisees in the temple and asked them a question nobody answered:

*If David then call him Adonai (Lord), how is he his son?* (Matthew 22:45)

The clouds are Daniel's:

*I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him.* (Daniel 7:13)

*And there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him: his dominion is an everlasting dominion, which shall not pass away, and his kingdom that which shall not be destroyed.* (Daniel 7:14)

Daniel says *like* the Son of Adam, because he was shown a figure who looked like a man and was more than one. At the trial the man standing in the room says it of himself without the *like*: the one Daniel saw is the one under oath, and the everlasting dominion of the next verse is his. Daniel keeps his *like*; the trial is where the name is claimed outright. The high priest understood both scriptures and what they say together:

*Then the high priest rent his clothes, saying, He hath spoken blasphemy; what further need have we of witnesses? behold, now ye have heard his blasphemy.* (Matthew 26:65)

He tore his clothes because the one at the right hand of Yahuah (the LORD), the one who comes with the clouds, had just said he was the man in front of him. He is Elohim (God) and he has a Father: the psalm has two speakers, the vision has the Ancient of days and the one brought before him, and the trial has the same two.

The seat was taken soon after. Stephen saw it, and the letters keep returning to it:

*But he, being full of the Ruach HaKodesh (Holy Spirit), looked up stedfastly into heaven, and saw the glory of Elohim (God), and Yahusha (Jesus) standing on the right hand of Elohim (God),* (Acts 7:55)

*Who being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power, when he had by himself purged our sins, sat down on the right hand of the Majesty on high;* (Hebrews 1:3)

And the coming with the clouds is still ahead, said in his own words on the mount and in John's words at the opening of the Revelation, each book speaking for itself:

*And then shall appear the sign of the Son of Adam in heaven: and then shall all the tribes of the earth mourn, and they shall see the Son of Adam coming in the clouds of heaven with power and great glory.* (Matthew 24:30)

*Behold, he cometh with clouds; and every eye shall see him, and they also which pierced him: and all kindreds of the earth shall wail because of him. Even so, Amen.* (Revelation 1:7)

Two scriptures, said under oath, condemned him to death. They are the two the whole library goes on saying of him.$n$);

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
  IF NOT FOUND THEN RAISE EXCEPTION 'S503c: thread 17 not found under its slug'; END IF;
  SELECT count(*) INTO n FROM cross_reference_threads t JOIN s503c_thread s ON s.id = t.id
    WHERE (t.title = s.old_title AND t.summary_md = s.old_summary) OR (t.title = s.new_title AND t.summary_md = s.new_summary);
  IF n <> 1 THEN RAISE EXCEPTION 'S503c: thread 17 title/summary differ from the read-back — re-dump and rebuild'; END IF;
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
  RAISE NOTICE 'S503c (sanhedrin-trial-tehillim-110) summary: notes rewritten % / already there %; member notes rewritten % / already there %; thread rewritten % / already there %', n_notes, n_c - n_notes, n_m, n_c - n_m, n_t, 1 - n_t;
END $s503c2$;
COMMIT;
\echo 'session503c — sanhedrin-trial-tehillim-110 done.'
