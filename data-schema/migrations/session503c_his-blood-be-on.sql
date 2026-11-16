-- =====================================================================
-- Session 503c migration — summaries sweep — thread 10 `his-blood-be-on-us-and-on-our-children-system-not-people-and-the-yom-kippur-blood-substance`: title + summary rewritten (slug kept); 0 member card(s)
-- rewritten in place with their member notes (ids, verse pairs and membership untouched). Written and read on Claude Fable 5.1 against
-- live read-back S503 (canon/matthew) · schema 1.0.0-phase4-session475. Every note composed by script (build503c.py). Guards RAISE before any write if the live data moved. Idempotent. Nothing deleted.
-- Run: python3 api/apply_migration.py data-schema/migrations/session503c_his-blood-be-on.sql
-- =====================================================================
\echo 'session503c — his-blood-be-on starting...'
BEGIN;
CREATE TEMP TABLE s503c_cards (id bigint, s_ed text, s_book text, src_ch int, src_vn int, src_text text, t_ed text, tgt_book text, tgt_ch int, tgt_vn int, old_note text, new_note text, thread_id bigint, old_mnote text, new_mnote text) ON COMMIT DROP;
-- (no card rows)
CREATE TEMP TABLE s503c_thread (id bigint, slug text, old_title text, new_title text, old_summary text, new_summary text) ON COMMIT DROP;
INSERT INTO s503c_thread VALUES (10, 'his-blood-be-on-us-and-on-our-children-system-not-people-and-the-yom-kippur-blood-substance', $n$His Blood Be On Us And On Our Children System Not People And The Yom Kippur Blood Substance$n$, $n$His blood be on us, and on our children — the court that owned the blood, and the house that mourns him (Deuteronomy 21; Acts 5; Zechariah 12)$n$, $n$**`his-blood-be-on-us-and-on-our-children-system-not-people-and-the-yom-kippur-blood-substance`** — anchor at Matt 27:25. The substantial-Yerushalayim-crowd-at-the-substantial-Sanhedrin-leadership-moment-substance the substantial-substance walked-out + the substantial-substance the framework's-system-not-people-posture per `_COMMENTARY_SUMMATION.md` §VII + Red Line #9's-Jew-hate-never-justifiable-substance + the substantial-Yom Kippur-blood-substance walking-substantially-into-the-substantial-Cross-blood-substance per Zekharyah 12:10's-look-on-him-whom-they-pierced-substance + the substantial-substance-of-the-surviving-third per `_COMMENTARY_SUMMATION.md` §V. 14 members.$n$, $n$It ain't new. Pilate washes his hands and the crowd in his court takes the blood on itself:

*When Pilate saw that he could prevail nothing, but that rather a tumult was made, he took water, and washed his hands before the multitude, saying, I am innocent of the blood of this just person: see ye to it.* (Matthew 27:24)

*Then answered all the people, and said, His blood be on us, and on our children.* (Matthew 27:25)

This has been read for seventeen centuries as a curse a whole people laid on its own children. Read what the words were in the Torah. Innocent blood is a charge against the ones who shed it or let it be shed, and the elders of the nearest city answered for it; the prayer was that it not be laid to the people's charge:

*Be merciful, O Yahuah (LORD), unto thy people Yashar'el (Israel), whom thou hast redeemed, and lay not innocent blood unto thy people of Yashar'el's (Israel’s) charge. And the blood shall be forgiven them.* (Deuteronomy 21:8)

Jeremiah said the same to the men who wanted him dead, and the men, not the nation, would carry it:

*But know ye for certain, that if ye put me to death, ye shall surely bring innocent blood upon yourselves, and upon this city, and upon the inhabitants thereof: for of a truth Yahuah (LORD) hath sent me unto you to speak all these words in your ears.* (Jeremiah 26:15)

The rulers knew whose charge the blood was. Weeks later, in the same city, they said so to the apostles:

*Saying, Did not we straitly command you that ye should not teach in this name? and, behold, ye have filled Jerusalem with your doctrine, and intend to bring this man’s blood upon us.* (Acts 5:28)

*Upon us*: the council that tried him. Yahusha (Jesus) had already set the blood where it belonged, on the ones who killed the prophets and would kill him, the rulers of the city, in the same breath that he wept over her:

*That upon you may come all the righteous blood shed upon the earth, from the blood of righteous Abel unto the blood of Zechariah son of Barachias, whom ye slew between the temple and the altar.* (Matthew 23:35)

*O Jerusalem, Jerusalem, thou that killest the prophets, and stonest them which are sent unto thee, how often would I have gathered thy children together, even as a hen gathereth her chickens under her wings, and ye would not!* (Matthew 23:37)

*How often would I have gathered thy children*. The children are the ones he wanted to gather, not the ones cursed. The blood that cries from the ground was Abel's, and it cried against his brother, not against a people:

*And he said, What hast thou done? the voice of thy brother’s blood crieth unto me from the ground.* (Genesis 4:10)

And this blood speaks differently from Abel's:

*And to Yahusha (Jesus) the mediator of the new covenant, and to the blood of sprinkling, that speaketh better things than that of Abel.* (Hebrews 12:24)

The prophets say what the house that pierced him does with his blood at the end. It mourns him, the same house, and a third of it is left:

*And I will pour upon the house of David, and upon the inhabitants of Jerusalem, the spirit of grace and of supplications: and they shall look upon me whom they have pierced, and they shall mourn for him, as one mourneth for his only son, and shall be in bitterness for him, as one that is in bitterness for his firstborn.* (Zechariah 12:10)

*And it shall come to pass, that in all the land, saith Yahuah (LORD), two parts therein shall be cut off and die; but the third shall be left therein.* (Zechariah 13:8)

The blood fell on the court that owned it and on the city that stood in it forty years later. It is not a curse on the people of Yahudah (Judah) or on their children. The same people are the house of David that looks on him whom they pierced and mourns.$n$);

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
  IF NOT FOUND THEN RAISE EXCEPTION 'S503c: thread 10 not found under its slug'; END IF;
  SELECT count(*) INTO n FROM cross_reference_threads t JOIN s503c_thread s ON s.id = t.id
    WHERE (t.title = s.old_title AND t.summary_md = s.old_summary) OR (t.title = s.new_title AND t.summary_md = s.new_summary);
  IF n <> 1 THEN RAISE EXCEPTION 'S503c: thread 10 title/summary differ from the read-back — re-dump and rebuild'; END IF;
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
  RAISE NOTICE 'S503c (his-blood-be-on) summary: notes rewritten % / already there %; member notes rewritten % / already there %; thread rewritten % / already there %', n_notes, n_c - n_notes, n_m, n_c - n_m, n_t, 1 - n_t;
END $s503c2$;
COMMIT;
\echo 'session503c — his-blood-be-on done.'
