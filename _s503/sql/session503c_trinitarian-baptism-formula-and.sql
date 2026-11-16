-- =====================================================================
-- Session 503c migration — summaries sweep — thread 23 `trinitarian-baptism-formula-and-the-name-of-yahusha-in-the-formless-formed-grid`: title + summary rewritten (slug kept); 0 member card(s)
-- rewritten in place with their member notes (ids, verse pairs and membership untouched). Written and read on Claude Fable 5.1 against
-- live read-back S503 (canon/matthew) · schema 1.0.0-phase4-session475. Every note composed by script (build503c.py). Guards RAISE before any write if the live data moved. Idempotent. Nothing deleted.
-- Run: python3 api/apply_migration.py data-schema/migrations/session503c_trinitarian-baptism-formula-and.sql
-- =====================================================================
\echo 'session503c — trinitarian-baptism-formula-and starting...'
BEGIN;
CREATE TEMP TABLE s503c_cards (id bigint, s_ed text, s_book text, src_ch int, src_vn int, src_text text, t_ed text, tgt_book text, tgt_ch int, tgt_vn int, old_note text, new_note text, thread_id bigint, old_mnote text, new_mnote text) ON COMMIT DROP;
-- (no card rows)
CREATE TEMP TABLE s503c_thread (id bigint, slug text, old_title text, new_title text, old_summary text, new_summary text) ON COMMIT DROP;
INSERT INTO s503c_thread VALUES (23, 'trinitarian-baptism-formula-and-the-name-of-yahusha-in-the-formless-formed-grid', $n$Trinitarian Baptism Formula And The Name Of Yahusha In The Formless Formed Grid$n$, $n$Baptizing them in the name of the Father, and of the Son, and of the Ruach HaKodesh (Holy Spirit) — one name, Yah, and the apostles baptizing in it (Psalm 68; Acts 2; John 17)$n$, $n$**`trinitarian-baptism-formula-and-the-name-of-yahusha-in-the-formless-formed-grid`** — **FRAMEWORK-MAJOR anchor at Matt 28:19.** The substantial-Trinitarian-baptism-formula-substance the King-substance walks-out at-the-substantial-Great-Commission walks the substantial-Father-Son-Spirit-relational-architecture-substance per the Formless-Formed grid + the substantial-apostolic-substance walked the substantial-baptism-IN-the-name-of-Yahusha per Acts 2:38 + 8:16 + 10:48 + 19:5. Framework rules out Trinitarian-three-co-equal-persons-substance + modalist-collapse + Arian-created-being. 16 members.$n$, $n$It ain't new. The charge names three and says *name*, not names:

*Go ye therefore, and teach all nations, baptizing them in the name of the Father, and of the Son, and of the Ruach HaKodesh (Holy Spirit):* (Matthew 28:19)

There is one name that the Father, the Son and the Spirit all carry. The psalm sings it short, the name the translators left as JAH:

*Sing unto Elohim (God), sing praises to his name: extol him that rideth upon the heavens by his name JAH, and rejoice before him.* (Psalm 68:4)

Yah. It is in the Father's name, Yahuah (the LORD). It is in the Son's name, Yahusha (Jesus), which Matthew opened his gospel with and told the meaning of:

*And she shall bring forth a son, and thou shalt call his name Yahusha (JESUS): for he shall save his people from their sins.* (Matthew 1:21)

*Behold, a virgin shall be with child, and shall bring forth a son, and they shall call his name Emmanuel, which being interpreted is, Elohim (God) with us.* (Matthew 1:23)

*Yahusha (JESUS)*, Yah saves; *Emmanuel*, Elohim (God) with us. The Spirit is sent in the same name:

*But the Comforter, which is the Ruach HaKodesh (Holy Spirit), whom the Father will send in my name, he shall teach you all things, and bring all things to your remembrance, whatsoever I have said unto you.* (John 14:26)

And heaven praises by it, HalleluYah, praise Yah:

*And after these things I heard a great voice of much people in heaven, saying, Alleluia; Salvation, and glory, and honour, and power, unto Yahuah Eloheinu (the Lord our God):* (Revelation 19:1)

So watch what the apostles did with the charge. Every baptism in Acts is in one name, and it is the Son's name, which is the Father's name:

*Then Peter said unto them, Repent, and be baptized every one of you in the name of Yahusha HaMashiach (Jesus Christ) for the remission of sins, and ye shall receive the gift of the Ruach HaKodesh (Holy Spirit).* (Acts 2:38)

*(For as yet he was fallen upon none of them: only they were baptized in the name of the Lord Yahusha (Lord Jesus).)* (Acts 8:16)

*When they heard this, they were baptized in the name of the Lord Yahusha (Lord Jesus).* (Acts 19:5)

They were not disobeying the charge; they had understood it. The Son came in his Father's name and made it known:

*I am come in my Father’s name, and ye receive me not: if another shall come in his own name, him ye will receive.* (John 5:43)

*I have manifested thy name unto the men which thou gavest me out of the world: thine they were, and thou gavest them me; and they have kept thy word.* (John 17:6)

At his own baptism all three are in the scene, and none is the other:

*And Yahusha (Jesus), when he was baptized, went up straightway out of the water: and, lo, the heavens were opened unto him, and he saw the Spirit of Elohim (God) descending like a dove, and lighting upon him:* (Matthew 3:16)

*And lo a voice from heaven, saying, This is my beloved Son, in whom I am well pleased.* (Matthew 3:17)

Hear what the scriptures hold together, in their own words and no borrowed one. He is Elohim (God):

*Who, being in the form of Elohim (God), thought it not robbery to be equal with Elohim (God):* (Philippians 2:6)

And he has a Father, and the Father is the one Elohim (God):

*But to us there is but one Elohim (God), the Father, of whom are all things, and we in him; and one Lord Yahusha HaMashiach (Lord Jesus Christ), by whom are all things, and we by him.* (1 Corinthians 8:6)

*Hear, O Yashar'el (Israel): Yahuah Eloheinu (The LORD our God) is one Yahuah (LORD):* (Deuteronomy 6:4)

Both are so, and the prayer the night before he died holds both, the Father who sent and the oneness they share:

*And now I am no more in the world, but these are in the world, and I come to thee. Holy Father, keep through thine own name those whom thou hast given me, that they may be one, as we are.* (John 17:11)

*That they all may be one; as thou, Father, art in me, and I in thee, that they also may be one in us: that the world may believe that thou hast sent me.* (John 17:21)

The Father is the source, without form, whom no man has seen. The Son is the Formed, the Word who came in the flesh, Elohim (God) and sent by his Father. The Spirit is sent in that name. The one name is Yah, borne by the Father, the Son and the Spirit alike, and that is the name the gathered are baptized into: not three who are each the whole and not one wearing three faces, but one name on all three, HalleluYah.$n$);

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
  IF NOT FOUND THEN RAISE EXCEPTION 'S503c: thread 23 not found under its slug'; END IF;
  SELECT count(*) INTO n FROM cross_reference_threads t JOIN s503c_thread s ON s.id = t.id
    WHERE (t.title = s.old_title AND t.summary_md = s.old_summary) OR (t.title = s.new_title AND t.summary_md = s.new_summary);
  IF n <> 1 THEN RAISE EXCEPTION 'S503c: thread 23 title/summary differ from the read-back — re-dump and rebuild'; END IF;
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
  RAISE NOTICE 'S503c (trinitarian-baptism-formula-and) summary: notes rewritten % / already there %; member notes rewritten % / already there %; thread rewritten % / already there %', n_notes, n_c - n_notes, n_m, n_c - n_m, n_t, 1 - n_t;
END $s503c2$;
COMMIT;
\echo 'session503c — trinitarian-baptism-formula-and done.'
