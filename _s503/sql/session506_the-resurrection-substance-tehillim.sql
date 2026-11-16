-- =====================================================================
-- Session 503c migration — summaries sweep — thread 21 `the-resurrection-substance-tehillim-16-and-tehillim-22-vindication-substance`: title + summary rewritten (slug kept); 14 member card(s)
-- rewritten in place with their member notes (ids, verse pairs and membership untouched). Written and read on Claude Fable 5.1 against
-- merged read-back S506 for `the-resurrection-substance-tehillim-16-and-tehillim-22-vindication-substance` from canon__luke (1), canon__mark (5), canon__matthew (12). Every note composed by script (build503c.py). Guards RAISE before any write if the live data moved. Idempotent. Nothing deleted.
-- Run: python3 api/apply_migration.py data-schema/migrations/session506_the-resurrection-substance-tehillim.sql
-- =====================================================================
\echo 'session503c — the-resurrection-substance-tehillim starting...'
BEGIN;
CREATE TEMP TABLE s503c_cards (id bigint, s_ed text, s_book text, src_ch int, src_vn int, src_text text, t_ed text, tgt_book text, tgt_ch int, tgt_vn int, old_note text, new_note text, thread_id bigint, old_mnote text, new_mnote text) ON COMMIT DROP;
INSERT INTO s503c_cards VALUES
(3216,'canon','matthew',28,1,$n$In the end of the sabbath, as it began to dawn toward the first day of the week, came Mary Magdalene and the other Mary to see the sepulchre.$n$,'canon','mark',16,1,$n$The Markan-parallel.$n$,$n$Mark 16:1 — *And when the sabbath was past, Mary Magdalene, and Mary the mother of James, and Salome, had bought sweet spices, that they might come and anoint him.* *In the end of the sabbath, as it began to dawn toward the first day of the week, came Mary Magdalene and the other Mary to see the sepulchre.* (Matthew 28:1) The same morning from the women's side. The sabbath was past and they had *bought sweet spices* to anoint a body they took to be still in the grave. Matthew gives the hour, Mark gives the errand, and both have the same faithful women walking to the same tomb.$n$,21,$n$The Markan-parallel.$n$,$n$Mark 16:1 — *had bought sweet spices, that they might come and anoint him.* The women bought spices once the sabbath was past, so they came expecting a body and not a risen man.$n$),
(3217,'canon','matthew',28,1,$n$In the end of the sabbath, as it began to dawn toward the first day of the week, came Mary Magdalene and the other Mary to see the sepulchre.$n$,'canon','luke',24,1,$n$The Lukan-parallel.$n$,$n$Luke 24:1 — *Now upon the first day of the week, very early in the morning, they came unto the sepulchre, bringing the spices which they had prepared, and certain others with them.* *In the end of the sabbath, as it began to dawn toward the first day of the week, came Mary Magdalene and the other Mary to see the sepulchre.* (Matthew 28:1) Luke gives the same dawn. They came on the first day, *very early in the morning*, carrying spices they had made ready beforehand. Matthew's women and Luke's are the same faithful witnesses, walking to a tomb they expected to find shut with him inside it.$n$,21,$n$The Lukan-parallel.$n$,$n$Luke 24:1 — *very early in the morning, they came unto the sepulchre.* Luke sets the women at the tomb at first light on the first day of the week, carrying spices for the dead.$n$),
(3218,'canon','matthew',28,1,$n$In the end of the sabbath, as it began to dawn toward the first day of the week, came Mary Magdalene and the other Mary to see the sepulchre.$n$,'canon','john',20,1,$n$The Yochanan-narrative.$n$,$n$John 20:1 — *The first day of the week cometh Mary Magdalene early, when it was yet dark, unto the sepulchre, and seeth the stone taken away from the sepulchre.* *In the end of the sabbath, as it began to dawn toward the first day of the week, came Mary Magdalene and the other Mary to see the sepulchre.* (Matthew 28:1) John names Mary Magdalene and says it was *yet dark*. Matthew has the dawn beginning to break. It is one morning seen at two moments, and in both she is among the first to come and the first to see the tomb opened.$n$,21,$n$The Yochanan-narrative.$n$,$n$John 20:1 — *cometh Mary Magdalene early, when it was yet dark, unto the sepulchre.* John puts Mary Magdalene at the tomb in the last of the dark, the same morning Matthew sees beginning to dawn.$n$),
(3219,'canon','matthew',28,1,$n$In the end of the sabbath, as it began to dawn toward the first day of the week, came Mary Magdalene and the other Mary to see the sepulchre.$n$,'canon','psalms',16,10,$n$The Tanakh-Resurrection-anchor.$n$,$n$Psalm 16:10 — *For thou wilt not leave my soul in hell; neither wilt thou suffer thine Holy One to see corruption.* *In the end of the sabbath, as it began to dawn toward the first day of the week, came Mary Magdalene and the other Mary to see the sepulchre.* (Matthew 28:1) David wrote this a thousand years before the women came. *Not leave my soul in hell* is the promise, and the one called *thine Holy One* was not left, and his body did not see corruption. Peter and Paul both said this was the verse, and the women walk into it at the end of the sabbath.$n$,21,$n$*Thou wilt not leave my soul in sheol.*$n$,$n$Psalm 16:10 — *For thou wilt not leave my soul in hell; neither wilt thou suffer thine Holy One to see corruption.* David's line is the promise the empty tomb keeps: his soul is not left and his flesh does not decay.$n$),
(3220,'canon','matthew',28,1,$n$In the end of the sabbath, as it began to dawn toward the first day of the week, came Mary Magdalene and the other Mary to see the sepulchre.$n$,'canon','psalms',22,22,$n$The substantial-vindication-substance — *I will declare thy name unto my brethren*.$n$,$n$Psalm 22:22 — *I will declare thy name unto my brethren: in the midst of the congregation will I praise thee.* *In the end of the sabbath, as it began to dawn toward the first day of the week, came Mary Magdalene and the other Mary to see the sepulchre.* (Matthew 28:1) The psalm ends its cry with a promise to tell. After the sabbath the women are the first to carry the news, and what they carry is that he is risen. The vindication starts as a message passed to *my brethren*, long before it fills *the congregation*.$n$,21,$n$The substantial-vindication-substance — *I will declare thy name unto my brethren*.$n$,$n$Psalm 22:22 — *I will declare thy name unto my brethren.* The one delivered says he will tell his brethren, and the telling begins with the women sent from the tomb.$n$),
(3221,'canon','matthew',28,1,$n$In the end of the sabbath, as it began to dawn toward the first day of the week, came Mary Magdalene and the other Mary to see the sepulchre.$n$,'canon','hosea',6,2,$n$The third-day-substance.$n$,$n$Hosea 6:2 — *After two days will he revive us: in the third day he will raise us up, and we shall live in his sight.* *In the end of the sabbath, as it began to dawn toward the first day of the week, came Mary Magdalene and the other Mary to see the sepulchre.* (Matthew 28:1) Hosea spoke *in the third day* over the house that would be raised up, and the women come at the dawn of that third day. Yahusha (Jesus) lay through the days and the sabbath ended on the morning they came. What Hosea said over the scattered house, the empty tomb begins.$n$,21,$n$*In the third day he will raise us up.*$n$,$n$Hosea 6:2 — *After two days will he revive us: in the third day he will raise us up.* Hosea's third day is the day the women find the tomb empty, the raising the scattered house was promised.$n$),
(3222,'canon','matthew',28,1,$n$In the end of the sabbath, as it began to dawn toward the first day of the week, came Mary Magdalene and the other Mary to see the sepulchre.$n$,'canon','jonah',1,17,$n$The substantial-three-days-and-three-nights pre-figuration.$n$,$n$Jonah 1:17 — *Now Yahuah (LORD) had prepared a great fish to swallow up Jonah. And Jonah was in the belly of the fish three days and three nights.* *In the end of the sabbath, as it began to dawn toward the first day of the week, came Mary Magdalene and the other Mary to see the sepulchre.* (Matthew 28:1) Jonah was *three days and three nights* in the fish, and Yahusha (Jesus) took that as his own sign. The women come at the end of the sabbath, when those days are done. Yahuah (LORD) *had prepared* the fish, and the grave had its appointed time as well.$n$,21,$n$The substantial-three-days-and-three-nights pre-figuration.$n$,$n$Jonah 1:17 — *Jonah was in the belly of the fish three days and three nights.* Jonah's three days and three nights are the sign Yahusha (Jesus) took, and the women come when they are finished.$n$),
(3223,'canon','matthew',28,1,$n$In the end of the sabbath, as it began to dawn toward the first day of the week, came Mary Magdalene and the other Mary to see the sepulchre.$n$,'canon','1-corinthians',15,20,$n$The firstfruits substance.$n$,$n$1 Corinthians 15:20 — *But now is Messiah (Christ) risen from the dead, and become the firstfruits of them that slept.* *In the end of the sabbath, as it began to dawn toward the first day of the week, came Mary Magdalene and the other Mary to see the sepulchre.* (Matthew 28:1) Paul calls the risen one *the firstfruits of them that slept*. The women come on the morning after the sabbath in Passover week, the morning the sheaf was waved. He rose first, and the rest of the harvest follows in its order.$n$,21,$n$*Messiah the firstfruits.*$n$,$n$1 Corinthians 15:20 — *risen from the dead, and become the firstfruits of them that slept.* Paul names the risen Messiah (Christ) the firstfruits, the first of the harvest waved so the rest may be accepted.$n$),
(3224,'canon','matthew',28,1,$n$In the end of the sabbath, as it began to dawn toward the first day of the week, came Mary Magdalene and the other Mary to see the sepulchre.$n$,'canon','acts',2,24,$n$The substantial-Kefa-Tehillim-16-citation.$n$,$n$Acts 2:24 — *Whom Elohim (God) hath raised up, having loosed the pains of death: because it was not possible that he should be holden of it.* *In the end of the sabbath, as it began to dawn toward the first day of the week, came Mary Magdalene and the other Mary to see the sepulchre.* (Matthew 28:1) Peter tells Yashar'el (Israel) that Elohim (God) *loosed the pains of death*, because the grave could not keep him. The women arrive to find it kept nothing. What Peter preaches is what they walk into on the morning after the sabbath, and he goes straight on to David's words in the psalm.$n$,21,$n$The substantial-Kefa-Tehillim-16-citation.$n$,$n$Acts 2:24 — *having loosed the pains of death: because it was not possible that he should be holden of it.* Peter says death could not hold him, which is what the women find at the tomb.$n$),
(3225,'canon','matthew',28,1,$n$In the end of the sabbath, as it began to dawn toward the first day of the week, came Mary Magdalene and the other Mary to see the sepulchre.$n$,'canon','acts',13,33,$n$The substantial-Paul-Tehillim-16-citation.$n$,$n$Acts 13:33 — *Elohim (God) hath fulfilled the same unto us their children, in that he hath raised up Yahusha (Jesus) again; as it is also written in the second psalm, Thou art my Son, this day have I begotten thee.* *In the end of the sabbath, as it began to dawn toward the first day of the week, came Mary Magdalene and the other Mary to see the sepulchre.* (Matthew 28:1) Paul says the promise made to the fathers is *fulfilled the same unto us their children* by the raising of Yahusha (Jesus). The women at the tomb are the first to meet it. A few verses on, Paul goes to the same psalm Peter used, that the Holy One would not see corruption.$n$,21,$n$The substantial-Paul-Tehillim-16-citation.$n$,$n$Acts 13:33 — *Elohim (God) hath fulfilled the same unto us their children, in that he hath raised up Yahusha (Jesus) again.* Paul says the promise to the fathers is kept to their children in the raising of Yahusha (Jesus).$n$),
(5362,'canon','mark',15,42,$n$And now when the even was come, because it was the preparation, that is, the day before the sabbath,$n$,'canon','psalms',16,10,$n$thread:the-resurrection-substance-tehillim-16-and-tehillim-22-vindication-substance | *Thou wilt not leave my soul in hell; neither wilt thou suffer thine Holy One to see corruption* (Tehillim/Psalm 16:10).$n$,$n$Psalm 16:10 — *For thou wilt not leave my soul in hell; neither wilt thou suffer thine Holy One to see corruption.* *And now when the even was come, because it was the preparation, that is, the day before the sabbath,* (Mark 15:42) The evening of the preparation is when the body is laid down, and the sabbath rests over it. David had written a thousand years before that the soul would not be left and the Holy One would not *see corruption*. The sabbath is the waiting, and the psalm is the promise under it.$n$,21,$n$*Thou wilt not leave my soul in hell; neither wilt thou suffer thine Holy One to see corruption* (Tehillim/Psalm 16:10).$n$,$n$Psalm 16:10 — *For thou wilt not leave my soul in hell; neither wilt thou suffer thine Holy One to see corruption.* David's promise covers the hours between the burial at evening and the dawn after the sabbath.$n$),
(5361,'canon','mark',15,42,$n$And now when the even was come, because it was the preparation, that is, the day before the sabbath,$n$,'canon','isaiah',53,9,$n$thread:the-resurrection-substance-tehillim-16-and-tehillim-22-vindication-substance | *Yoseph (Joseph) of Arimathaea craving the body — the burial in the rich man's tomb that fulfills Yeshayahu (Isaiah) 53:9.* *He made his grave with the wicked, and with the rich in his death.*$n$,$n$Isaiah 53:9 — *And he made his grave with the wicked, and with the rich in his death; because he had done no violence, neither was any deceit in his mouth.* *And now when the even was come, because it was the preparation, that is, the day before the sabbath,* (Mark 15:42) That evening a rich man asked for the body, and Isaiah had said it: *with the rich in his death*. The man who had done *no violence* dies among the wicked and is laid in a rich man's grave, and it happens on the day before the sabbath.$n$,21,$n$*Yoseph (Joseph) of Arimathaea craving the body — the burial in the rich man's tomb that fulfills Yeshayahu (Isaiah) 53:9.* *He made his grave with the wicked, and with the rich in his death.*$n$,$n$Isaiah 53:9 — *he made his grave with the wicked, and with the rich in his death.* Isaiah says where the body would be laid, and the burial on the preparation day is that grave.$n$),
(5366,'canon','mark',16,5,$n$And entering into the sepulchre, they saw a young man sitting on the right side, clothed in a long white garment; and they were affrighted.$n$,'canon','psalms',16,10,$n$thread:the-resurrection-substance-tehillim-16-and-tehillim-22-vindication-substance | *He is risen; he is not here.* Tehillim (Psalm) 16:10's *thou wilt not leave my soul in hell* carries the resurrection-substance.$n$,$n$Psalm 16:10 — *For thou wilt not leave my soul in hell; neither wilt thou suffer thine Holy One to see corruption.* *And entering into the sepulchre, they saw a young man sitting on the right side, clothed in a long white garment; and they were affrighted.* (Mark 16:5) The women see a young man in white and are afraid, and what he has for them is that the tomb is empty. David's line is the reason. The one called *thine Holy One* was not left, so there is nothing in the grave to see. The fear in the tomb answers a promise written long before.$n$,21,$n$*He is risen; he is not here.* Tehillim (Psalm) 16:10's *thou wilt not leave my soul in hell* carries the resurrection-substance.$n$,$n$Psalm 16:10 — *For thou wilt not leave my soul in hell; neither wilt thou suffer thine Holy One to see corruption.* David's promise explains the empty tomb: the soul is not left and the body does not decay.$n$),
(5367,'canon','mark',16,5,$n$And entering into the sepulchre, they saw a young man sitting on the right side, clothed in a long white garment; and they were affrighted.$n$,'canon','psalms',22,22,$n$thread:the-resurrection-substance-tehillim-16-and-tehillim-22-vindication-substance | Tehillim (Psalm) 22:22-24's *in the midst of the congregation will I praise thee* — the post-resurrection vindication-arc.$n$,$n$Psalm 22:22 — *I will declare thy name unto my brethren: in the midst of the congregation will I praise thee.* *And entering into the sepulchre, they saw a young man sitting on the right side, clothed in a long white garment; and they were affrighted.* (Mark 16:5) The women are afraid in the empty tomb, and the psalm says what comes after fear. The one delivered says he will tell *my brethren* and praise in *the congregation*. The faithful women are sent out of the tomb with news to carry, and the telling begins with them.$n$,21,$n$Tehillim (Psalm) 22:22-24's *in the midst of the congregation will I praise thee* — the post-resurrection vindication-arc.$n$,$n$Psalm 22:22 — *I will declare thy name unto my brethren.* After the deliverance comes the telling to his brethren, and the women carry the first word out of the tomb.$n$);
CREATE TEMP TABLE s503c_thread (id bigint, slug text, old_title text, new_title text, old_summary text, new_summary text) ON COMMIT DROP;
INSERT INTO s503c_thread VALUES (21, 'the-resurrection-substance-tehillim-16-and-tehillim-22-vindication-substance', $n$He is risen, as he said — Psalm 16, the third day of Hosea and Jonah, and the firstfruits sheaf (Leviticus 23; Acts 2; 1 Corinthians 15)$n$, $n$He is risen, as he said — Psalm 16, the third day of Hosea and Jonah, and the firstfruits sheaf (Leviticus 23; Acts 2; 1 Corinthians 15)$n$, $n$It ain't new. The women come to the tomb at the end of the Sabbath and are told what he had told them:

*In the end of the sabbath, as it began to dawn toward the first day of the week, came Mary Magdalene and the other Mary to see the sepulchre.* (Matthew 28:1)

*He is not here: for he is risen, as he said. Come, see the place where Yahusha (Lord) lay.* (Matthew 28:6)

*But after I am risen again, I will go before you into Galilee.* (Matthew 26:32)

David had written the rising a thousand years before, and Peter and Paul both said this was the verse:

*For thou wilt not leave my soul in hell; neither wilt thou suffer thine Holy One to see corruption.* (Psalm 16:10)

*He seeing this before spake of the resurrection of Messiah (Christ), that his soul was not left in hell, neither his flesh did see corruption.* (Acts 2:31)

*Wherefore he saith also in another psalm, Thou shalt not suffer thine Holy One to see corruption.* (Acts 13:35)

The third day was Hosea's, spoken over the house that would be raised up, and Jonah's, which Yahusha (Jesus) took as his own sign:

*After two days will he revive us: in the third day he will raise us up, and we shall live in his sight.* (Hosea 6:2)

*Now Yahuah (LORD) had prepared a great fish to swallow up Jonah. And Jonah was in the belly of the fish three days and three nights.* (Jonah 1:17)

*For as Jonah was three days and three nights in the whale’s belly; so shall the Son of Adam be three days and three nights in the heart of the earth.* (Matthew 12:40)

And the morning itself was in the Torah's calendar. The sheaf of firstfruits is waved before Yahuah (the LORD) on the morrow after the Sabbath, in Passover week, and Paul calls the risen one by the sheaf's name:

*Speak unto the children of Yashar'el (Israel), and say unto them, When ye be come into the land which I give unto you, and shall reap the harvest thereof, then ye shall bring a sheaf of the firstfruits of your harvest unto the priest:* (Leviticus 23:10)

*And he shall wave the sheaf before Yahuah (LORD), to be accepted for you: on the morrow after the sabbath the priest shall wave it.* (Leviticus 23:11)

*But now is Messiah (Christ) risen from the dead, and become the firstfruits of them that slept.* (1 Corinthians 15:20)

*But every man in his own order: Messiah (Christ) the firstfruits; afterward they that are Messiah's (Christ’s) at his coming.* (1 Corinthians 15:23)

A firstfruits sheaf is the first of a harvest, waved so that the rest may be accepted. He rose on the day the sheaf was waved, first of them that slept, and the order Paul gives is the order of the harvest: he first, afterward those that are his at his coming. The rising is also the Father's word over the trial's verdict:

*And declared to be the Son of Elohim (God) with power, according to the spirit of holiness, by the resurrection from the dead:* (Romans 1:4)

The council said blasphemy. The empty tomb on the morning of the sheaf said Son of Elohim (God), with power.$n$, $n$It ain't new. The women come to the tomb at the end of the Sabbath and are told what he had told them:

*In the end of the sabbath, as it began to dawn toward the first day of the week, came Mary Magdalene and the other Mary to see the sepulchre.* (Matthew 28:1)

*He is not here: for he is risen, as he said. Come, see the place where Yahusha (Lord) lay.* (Matthew 28:6)

*But after I am risen again, I will go before you into Galilee.* (Matthew 26:32)

David had written the rising a thousand years before, and Peter and Paul both said this was the verse:

*For thou wilt not leave my soul in hell; neither wilt thou suffer thine Holy One to see corruption.* (Psalm 16:10)

*He seeing this before spake of the resurrection of Messiah (Christ), that his soul was not left in hell, neither his flesh did see corruption.* (Acts 2:31)

*Wherefore he saith also in another psalm, Thou shalt not suffer thine Holy One to see corruption.* (Acts 13:35)

The third day was Hosea's, spoken over the house that would be raised up, and Jonah's, which Yahusha (Jesus) took as his own sign:

*After two days will he revive us: in the third day he will raise us up, and we shall live in his sight.* (Hosea 6:2)

*Now Yahuah (LORD) had prepared a great fish to swallow up Jonah. And Jonah was in the belly of the fish three days and three nights.* (Jonah 1:17)

*For as Jonah was three days and three nights in the whale’s belly; so shall the Son of Adam be three days and three nights in the heart of the earth.* (Matthew 12:40)

And the morning itself was in the Torah's calendar. The sheaf of firstfruits is waved before Yahuah (the LORD) on the morrow after the Sabbath, in Passover week, and Paul calls the risen one by the sheaf's name:

*Speak unto the children of Yashar'el (Israel), and say unto them, When ye be come into the land which I give unto you, and shall reap the harvest thereof, then ye shall bring a sheaf of the firstfruits of your harvest unto the priest:* (Leviticus 23:10)

*And he shall wave the sheaf before Yahuah (LORD), to be accepted for you: on the morrow after the sabbath the priest shall wave it.* (Leviticus 23:11)

*But now is Messiah (Christ) risen from the dead, and become the firstfruits of them that slept.* (1 Corinthians 15:20)

*But every man in his own order: Messiah (Christ) the firstfruits; afterward they that are Messiah's (Christ’s) at his coming.* (1 Corinthians 15:23)

A firstfruits sheaf is the first of a harvest, waved so that the rest may be accepted. He rose on the day the sheaf was waved, first of them that slept, and the order Paul gives is the order of the harvest: he first, afterward those that are his at his coming. The rising is also the Father's word over the trial's verdict:

*And declared to be the Son of Elohim (God) with power, according to the spirit of holiness, by the resurrection from the dead:* (Romans 1:4)

The council said blasphemy. The empty tomb on the morning of the sheaf said Son of Elohim (God), with power.$n$);

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
  IF NOT FOUND THEN RAISE EXCEPTION 'S503c: thread 21 not found under its slug'; END IF;
  SELECT count(*) INTO n FROM cross_reference_threads t JOIN s503c_thread s ON s.id = t.id
    WHERE (t.title = s.old_title AND t.summary_md = s.old_summary) OR (t.title = s.new_title AND t.summary_md = s.new_summary);
  IF n <> 1 THEN RAISE EXCEPTION 'S503c: thread 21 title/summary differ from the read-back — re-dump and rebuild'; END IF;
END $s503c$;

DO $s503c2$
DECLARE n_notes int; n_m int; n_t int; n_c int;
BEGIN
  SELECT count(*) INTO n_c FROM s503c_cards;
  UPDATE cross_references xr SET note = c.new_note FROM s503c_cards c WHERE xr.id = c.id AND xr.note IS NOT DISTINCT FROM c.old_note AND c.old_note IS DISTINCT FROM c.new_note;
  GET DIAGNOSTICS n_notes = ROW_COUNT;
  UPDATE cross_reference_thread_members m SET member_note = c.new_mnote FROM s503c_cards c WHERE m.cross_reference_id = c.id AND m.thread_id = c.thread_id AND m.member_note IS NOT DISTINCT FROM c.old_mnote AND c.old_mnote IS DISTINCT FROM c.new_mnote;
  GET DIAGNOSTICS n_m = ROW_COUNT;
  UPDATE cross_reference_threads t SET title = s.new_title, summary_md = s.new_summary FROM s503c_thread s WHERE t.id = s.id AND t.title = s.old_title AND t.summary_md = s.old_summary AND (s.old_title <> s.new_title OR s.old_summary <> s.new_summary);
  GET DIAGNOSTICS n_t = ROW_COUNT;
  RAISE NOTICE 'S503c (the-resurrection-substance-tehillim) summary: notes rewritten % / already there %; member notes rewritten % / already there %; thread rewritten % / already there %', n_notes, n_c - n_notes, n_m, n_c - n_m, n_t, 1 - n_t;
END $s503c2$;
COMMIT;
\echo 'session503c — the-resurrection-substance-tehillim done.'
