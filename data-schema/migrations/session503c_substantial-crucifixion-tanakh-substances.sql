-- =====================================================================
-- Session 503c migration — summaries sweep — thread 19 `substantial-crucifixion-tanakh-substances-tehillim-22-and-yeshayahu-53-and-zekharyah-12-10`: title + summary rewritten (slug kept); 0 member card(s)
-- rewritten in place with their member notes (ids, verse pairs and membership untouched). Written and read on Claude Fable 5.1 against
-- live read-back S503 (canon/matthew) · schema 1.0.0-phase4-session475. Every note composed by script (build503c.py). Guards RAISE before any write if the live data moved. Idempotent. Nothing deleted.
-- Run: python3 api/apply_migration.py data-schema/migrations/session503c_substantial-crucifixion-tanakh-substances.sql
-- =====================================================================
\echo 'session503c — substantial-crucifixion-tanakh-substances starting...'
BEGIN;
CREATE TEMP TABLE s503c_cards (id bigint, s_ed text, s_book text, src_ch int, src_vn int, src_text text, t_ed text, tgt_book text, tgt_ch int, tgt_vn int, old_note text, new_note text, thread_id bigint, old_mnote text, new_mnote text) ON COMMIT DROP;
-- (no card rows)
CREATE TEMP TABLE s503c_thread (id bigint, slug text, old_title text, new_title text, old_summary text, new_summary text) ON COMMIT DROP;
INSERT INTO s503c_thread VALUES (19, 'substantial-crucifixion-tanakh-substances-tehillim-22-and-yeshayahu-53-and-zekharyah-12-10', $n$Substantial Crucifixion Tanakh Substances Tehillim 22 And Yeshayahu 53 And Zekharyah 12 10$n$, $n$The crucifixion as the prophets wrote it — Psalm 22, Isaiah 53, Zechariah 12 and 13, Amos 8, Psalm 69, each in its own words$n$, $n$**`substantial-crucifixion-tanakh-substances-tehillim-22-and-yeshayahu-53-and-zekharyah-12-10`** — **FRAMEWORK-MAJOR anchor at Matt 27:33-50.** The substantial-Tanakh-Cross-substance — the substantial-Tehillim (Psalm) 22 substance + the substantial-Yeshayahu (Isaiah) 53 substance + the substantial-Zekharyah (Zechariah) 12:10 substance the substantial-Cross-substance walks-out. The substantial-substance-of-the-Tehillim 22-as-a-whole walks-from-suffering-into-vindication; the substantial-Yeshayahu 53 substance walks-the-substantial-Suffering-Servant; the substantial-Zekharyah 12:10 substance walks-the-substantial-look-on-him-whom-they-pierced + the surviving-third-substance per `_COMMENTARY_SUMMATION.md` §V. 26 members.$n$, $n$It ain't new. Matthew tells the afternoon plainly and keeps pointing at the older scriptures, and the scriptures were already there in detail. The garments:

*And they crucified him, and parted his garments, casting lots: that it might be fulfilled which was spoken by the prophet, They parted my garments among them, and upon my vesture did they cast lots.* (Matthew 27:35)

*They part my garments among them, and cast lots upon my vesture.* (Psalm 22:18)

The mockery, down to the shaking heads and the taunt about trusting:

*And they that passed by reviled him, wagging their heads,* (Matthew 27:39)

*All they that see me laugh me to scorn: they shoot out the lip, they shake the head, saying,* (Psalm 22:7)

*He trusted in Elohim (God); let him deliver him now, if he will have him: for he said, I am the Son of Elohim (God).* (Matthew 27:43)

*He trusted on Yahuah (LORD) that he would deliver him: let him deliver him, seeing he delighted in him.* (Psalm 22:8)

The hands and feet:

*For dogs have compassed me: the assembly of the wicked have inclosed me: they pierced my hands and my feet.* (Psalm 22:16)

The vinegar:

*And straightway one of them ran, and took a spunge, and filled it with vinegar, and put it on a reed, and gave him to drink.* (Matthew 27:48)

*They gave me also gall for my meat; and in my thirst they gave me vinegar to drink.* (Psalm 69:21)

The darkness at noon, which Amos had set in the day of Yahuah (the LORD):

*Now from the sixth hour there was darkness over all the land unto the ninth hour.* (Matthew 27:45)

*And it shall come to pass in that day, saith Adonai Yahuah (the Lord GOD), that I will cause the sun to go down at noon, and I will darken the earth in the clear day:* (Amos 8:9)

Isaiah had written the man himself, despised, silent, wounded for others, buried among the rich:

*He is despised and rejected of men; a man of sorrows, and acquainted with grief: and we hid as it were our faces from him; he was despised, and we esteemed him not.* (Isaiah 53:3)

*But he was wounded for our transgressions, he was bruised for our iniquities: the chastisement of our peace was upon him; and with his stripes we are healed.* (Isaiah 53:5)

*He was oppressed, and he was afflicted, yet he opened not his mouth: he is brought as a lamb to the slaughter, and as a sheep before her shearers is dumb, so he openeth not his mouth.* (Isaiah 53:7)

*And he made his grave with the wicked, and with the rich in his death; because he had done no violence, neither was any deceit in his mouth.* (Isaiah 53:9)

Zechariah had written the sword against the shepherd and the scattering of the sheep, and who it is that was pierced:

*Awake, O sword, against my shepherd, and against the man that is my fellow, saith Yahuah Tseva'ot (LORD of hosts): smite the shepherd, and the sheep shall be scattered: and I will turn mine hand upon the little ones.* (Zechariah 13:7)

*And I will pour upon the house of David, and upon the inhabitants of Jerusalem, the spirit of grace and of supplications: and they shall look upon me whom they have pierced, and they shall mourn for him, as one mourneth for his only son, and shall be in bitterness for him, as one that is in bitterness for his firstborn.* (Zechariah 12:10)

Mark the speaker in Zechariah. Yahuah (the LORD) says *they shall look upon me whom they have pierced*, and then *they shall mourn for him*. The pierced one is Yahuah (the LORD) in the flesh, and he has a Father; both stand in one verse. The crown of thorns sits beside the oldest curse in the book, read line on line and not as a stated fulfilment:

*And when they had platted a crown of thorns, they put it upon his head, and a reed in his right hand: and they bowed the knee before him, and mocked him, saying, Hail, King of the Yahudim (Jews)!* (Matthew 27:29)

*Thorns also and thistles shall it bring forth to thee; and thou shalt eat the herb of the field;* (Genesis 3:18)

And the body taken down before night was the Torah kept at the cross:

*His body shall not remain all night upon the tree, but thou shalt in any wise bury him that day; (for he that is hanged is accursed of Elohim (God);) that thy land be not defiled, which Yahuah Elohayka (the LORD thy God) giveth thee for an inheritance.* (Deuteronomy 21:23)

Nothing that afternoon was new. Psalm, prophet and Torah had each written their part of it, and Matthew lets the reader see them come together.$n$);

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
  IF NOT FOUND THEN RAISE EXCEPTION 'S503c: thread 19 not found under its slug'; END IF;
  SELECT count(*) INTO n FROM cross_reference_threads t JOIN s503c_thread s ON s.id = t.id
    WHERE (t.title = s.old_title AND t.summary_md = s.old_summary) OR (t.title = s.new_title AND t.summary_md = s.new_summary);
  IF n <> 1 THEN RAISE EXCEPTION 'S503c: thread 19 title/summary differ from the read-back — re-dump and rebuild'; END IF;
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
  RAISE NOTICE 'S503c (substantial-crucifixion-tanakh-substances) summary: notes rewritten % / already there %; member notes rewritten % / already there %; thread rewritten % / already there %', n_notes, n_c - n_notes, n_m, n_c - n_m, n_t, 1 - n_t;
END $s503c2$;
COMMIT;
\echo 'session503c — substantial-crucifixion-tanakh-substances done.'
