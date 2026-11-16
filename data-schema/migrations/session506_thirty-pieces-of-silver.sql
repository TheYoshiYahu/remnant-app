-- =====================================================================
-- Session 503c migration — summaries sweep — thread 22 `thirty-pieces-of-silver-zekharyah-11-12-13-tanakh-prophetic-fulfillment`: title + summary rewritten (slug kept); 11 member card(s)
-- rewritten in place with their member notes (ids, verse pairs and membership untouched). Written and read on Claude Fable 5.1 against
-- merged read-back S506 for `thirty-pieces-of-silver-zekharyah-11-12-13-tanakh-prophetic-fulfillment` from canon__mark (3), canon__matthew (10). Every note composed by script (build503c.py). Guards RAISE before any write if the live data moved. Idempotent. Nothing deleted.
-- Run: python3 api/apply_migration.py data-schema/migrations/session506_thirty-pieces-of-silver.sql
-- =====================================================================
\echo 'session503c — thirty-pieces-of-silver starting...'
BEGIN;
CREATE TEMP TABLE s503c_cards (id bigint, s_ed text, s_book text, src_ch int, src_vn int, src_text text, t_ed text, tgt_book text, tgt_ch int, tgt_vn int, old_note text, new_note text, thread_id bigint, old_mnote text, new_mnote text) ON COMMIT DROP;
INSERT INTO s503c_cards VALUES
(3087,'canon','matthew',26,14,$n$Then one of the twelve, called Judas Iscariot, went unto the chief priests,$n$,'canon','matthew',27,3,$n$The substantial-Yahudah's-remorse + the cast-to-the-potter substance.$n$,$n$Matthew 27:3 — *Then Judas, which had betrayed him, when he saw that he was condemned, repented himself, and brought again the thirty pieces of silver to the chief priests and elders,* *Then one of the twelve, called Judas Iscariot, went unto the chief priests,* (Matthew 26:14) The man who went to the chief priests to bargain goes back to the same men with the money in his hand. The silver returns to the ones who weighed it out. Then it is cast down in the temple, as Zechariah threw his thirty into the house of Yahuah (LORD).$n$,22,$n$The substantial-Yahudah's-remorse + the cast-to-the-potter substance.$n$,$n$Matthew 27:3 — *brought again the thirty pieces of silver to the chief priests and elders.* Judas carries the thirty pieces back to the same chief priests he first went to, and casts them down in the temple.$n$),
(3088,'canon','matthew',26,14,$n$Then one of the twelve, called Judas Iscariot, went unto the chief priests,$n$,'canon','zechariah',11,12,$n$The Tanakh-prophetic-anchor.$n$,$n$Zechariah 11:12 — *And I said unto them, If ye think good, give me my price; and if not, forbear. So they weighed for my price thirty pieces of silver.* *Then one of the twelve, called Judas Iscariot, went unto the chief priests,* (Matthew 26:14) Judas has gone to the priests, and the next verse sets the sum. It was already weighed out to the shepherd. Zechariah the prophet asked for his wages with *give me my price*, and they counted him out thirty pieces of silver.$n$,22,$n$*They weighed for my price thirty pieces of silver ... Cast it unto the potter.*$n$,$n$Zechariah 11:12 — *So they weighed for my price thirty pieces of silver.* The shepherd's price of thirty pieces of silver is the same sum the priests will count out for Judas's bargain.$n$),
(3089,'canon','matthew',26,14,$n$Then one of the twelve, called Judas Iscariot, went unto the chief priests,$n$,'canon','exodus',21,32,$n$*Thirty shekels of silver* — the price-of-a-slave.$n$,$n$Exodus 21:32 — *If the ox shall push a manservant or a maidservant; he shall give unto their master thirty shekels of silver, and the ox shall be stoned.* *Then one of the twelve, called Judas Iscariot, went unto the chief priests,* (Matthew 26:14) Thirty is not a random sum. The Torah sets it as the price of a servant killed by an ox. The priests set on Yahusha (Jesus) the worth of a gored servant's life, and no more.$n$,22,$n$*Thirty shekels of silver* — the price-of-a-slave.$n$,$n$Exodus 21:32 — *he shall give unto their master thirty shekels of silver.* The Torah's price for a servant killed by an ox is the thirty the priests agree to pay.$n$),
(3090,'canon','matthew',26,14,$n$Then one of the twelve, called Judas Iscariot, went unto the chief priests,$n$,'canon','psalms',41,9,$n$The familiar-friend betrayal-substance.$n$,$n$Psalm 41:9 — *Yea, mine own familiar friend, in whom I trusted, which did eat of my bread, hath lifted up his heel against me.* *Then one of the twelve, called Judas Iscariot, went unto the chief priests,* (Matthew 26:14) Judas is one of the twelve, a man who sat at the table. David wrote of a friend who *did eat of my bread* and turned on him. The man going to the priests is that friend, and he was in the writings before he was at the table.$n$,22,$n$*Mine own familiar friend ... hath lifted up his heel against me.*$n$,$n$Psalm 41:9 — *in whom I trusted, which did eat of my bread, hath lifted up his heel against me.* David's trusted friend who ate his bread and turned on him is the betrayer Judas becomes.$n$),
(3091,'canon','matthew',26,14,$n$Then one of the twelve, called Judas Iscariot, went unto the chief priests,$n$,'canon','john',13,18,$n$The King-substance's-citation of Tehillim 41:9.$n$,$n$John 13:18 — *I speak not of you all: I know whom I have chosen: but that the scripture may be fulfilled, He that eateth bread with me hath lifted up his heel against me.* *Then one of the twelve, called Judas Iscariot, went unto the chief priests,* (Matthew 26:14) Yahusha (Jesus) says it with Judas still in the room. He knows whom he chose, and he gives David's line about the friend who eats his bread and lifts his heel. The man who goes to the priests does not catch him off guard.$n$,22,$n$The King-substance's-citation of Tehillim 41:9.$n$,$n$John 13:18 — *I know whom I have chosen: but that the scripture may be fulfilled.* Yahusha (Jesus) names the betrayal as written, and says he knew who he chose.$n$),
(3092,'canon','matthew',26,14,$n$Then one of the twelve, called Judas Iscariot, went unto the chief priests,$n$,'canon','john',6,70,$n$*One of you is a devil.*$n$,$n$John 6:70 — *Yahusha (Jesus) answered them, Have not I chosen you twelve, and one of you is a devil?* *Then one of the twelve, called Judas Iscariot, went unto the chief priests,* (Matthew 26:14) Long before Judas went to the priests, Yahusha (Jesus) told the twelve that one of them was a devil. The next verse names Judas. The betrayal was seen from far back on the road, the same as the prophets had it.$n$,22,$n$*One of you is a devil* — the substantial-Yahudah-substance pre-named.$n$,$n$John 6:70 — *Have not I chosen you twelve, and one of you is a devil?* Yahusha (Jesus) names the traitor among the twelve long before the silver is counted.$n$),
(3093,'canon','matthew',26,14,$n$Then one of the twelve, called Judas Iscariot, went unto the chief priests,$n$,'canon','acts',1,16,$n$The substantial-Yahudah-substance + the substantial-Tehillim 69:25 + 109:8 substance.$n$,$n$Acts 1:16 — *Men and brethren, this scripture must needs have been fulfilled, which the Ruach HaKodesh (Holy Spirit) by the mouth of David spake before concerning Judas, which was guide to them that took Yahusha (Jesus).* *Then one of the twelve, called Judas Iscariot, went unto the chief priests,* (Matthew 26:14) Peter reads the whole matter back to the hundred and twenty. David spoke it beforehand about Judas, who led the men to Yahusha (Jesus). What Judas did on his way to the priests had already come out of the mouth of David.$n$,22,$n$The substantial-Yahudah-substance + the substantial-Tehillim 69:25 + 109:8 substance.$n$,$n$Acts 1:16 — *this scripture must needs have been fulfilled, which the Ruach HaKodesh (Holy Spirit) by the mouth of David spake before concerning Judas.* Peter says David spoke beforehand about Judas, so the betrayal was written ahead.$n$),
(3094,'canon','matthew',26,14,$n$Then one of the twelve, called Judas Iscariot, went unto the chief priests,$n$,'canon','proverbs',27,6,$n$*The kisses of an enemy are deceitful.*$n$,$n$Proverbs 27:6 — *Faithful are the wounds of a friend; but the kisses of an enemy are deceitful.* *Then one of the twelve, called Judas Iscariot, went unto the chief priests,* (Matthew 26:14) The proverb sorts friends from enemies. Judas is called one of the twelve, a friend at the table, yet he goes to the priests to deal. Proverbs says what that is, however friendly the hand: an enemy's kiss is deceitful.$n$,22,$n$*The kisses of an enemy are deceitful.*$n$,$n$Proverbs 27:6 — *Faithful are the wounds of a friend; but the kisses of an enemy are deceitful.* A friend's wounds can be trusted, but a false friend's show of love hides the betrayal.$n$),
(5305,'canon','mark',14,10,$n$And Judas Iscariot, one of the twelve, went unto the chief priests, to betray him unto them.$n$,'canon','zechariah',11,12,$n$thread:thirty-pieces-of-silver-zekharyah-11-12-13-tanakh-prophetic-fulfillment | *Yahudah Iscariot going to the chief priests to betray the King for money.* *They weighed for my price thirty pieces of silver* (Zecharyah/Zechariah 11:12-13).$n$,$n$Zechariah 11:12 — *And I said unto them, If ye think good, give me my price; and if not, forbear. So they weighed for my price thirty pieces of silver.* *And Judas Iscariot, one of the twelve, went unto the chief priests, to betray him unto them.* (Mark 14:10) Judas goes to hand Yahusha (Jesus) over, and the money the priests promise next has a history. Zechariah had already been weighed out thirty pieces of silver as his price for shepherding. The price Judas takes is the shepherd's price.$n$,22,$n$*Yahudah Iscariot going to the chief priests to betray the King for money.* *They weighed for my price thirty pieces of silver* (Zecharyah/Zechariah 11:12-13).$n$,$n$Zechariah 11:12 — *So they weighed for my price thirty pieces of silver.* The thirty pieces weighed to the shepherd are the price Judas takes for Yahusha (Jesus).$n$),
(5306,'canon','mark',14,10,$n$And Judas Iscariot, one of the twelve, went unto the chief priests, to betray him unto them.$n$,'canon','matthew',26,14,$n$thread:thirty-pieces-of-silver-zekharyah-11-12-13-tanakh-prophetic-fulfillment | The Matthean parallel of the betrayal-for-silver.$n$,$n$Matthew 26:14 — *Then one of the twelve, called Judas Iscariot, went unto the chief priests,* *And Judas Iscariot, one of the twelve, went unto the chief priests, to betray him unto them.* (Mark 14:10) Matthew tells the same moment and the same man, walking to the chief priests. Mark says he came to betray. Matthew's next lines add what he asked and what they gave, thirty pieces of silver, and that sum is Zechariah's.$n$,22,$n$The Matthean parallel of the betrayal-for-silver.$n$,$n$Matthew 26:14 — *one of the twelve, called Judas Iscariot, went unto the chief priests.* Matthew gives the same going to the priests and goes on to the bargain for silver.$n$),
(5307,'canon','mark',14,10,$n$And Judas Iscariot, one of the twelve, went unto the chief priests, to betray him unto them.$n$,'canon','john',13,2,$n$thread:thirty-pieces-of-silver-zekharyah-11-12-13-tanakh-prophetic-fulfillment | *The devil having now put into the heart of Judas Iscariot* (Yochanan/John 13:2).$n$,$n$John 13:2 — *And supper being ended, the devil having now put into the heart of Judas Iscariot, Simon’s son, to betray him;* *And Judas Iscariot, one of the twelve, went unto the chief priests, to betray him unto them.* (Mark 14:10) Mark shows Judas going. John shows what was in his heart before he went. Yahusha (Jesus) knew his hour was come, and was not taken by surprise by the man who carried out the bargain.$n$,22,$n$*The devil having now put into the heart of Judas Iscariot* (Yochanan/John 13:2).$n$,$n$John 13:2 — *the devil having now put into the heart of Judas Iscariot, Simon’s son, to betray him.* John shows what was in Judas's heart at supper before he went to the priests.$n$);
CREATE TEMP TABLE s503c_thread (id bigint, slug text, old_title text, new_title text, old_summary text, new_summary text) ON COMMIT DROP;
INSERT INTO s503c_thread VALUES (22, 'thirty-pieces-of-silver-zekharyah-11-12-13-tanakh-prophetic-fulfillment', $n$Thirty pieces of silver — the price of the shepherd, cast to the potter in the house of Yahuah (the LORD) (Zechariah 11; Exodus 21; Psalm 41)$n$, $n$Thirty pieces of silver — the price of the shepherd, cast to the potter in the house of Yahuah (the LORD) (Zechariah 11; Exodus 21; Psalm 41)$n$, $n$It ain't new. Judas sets a price and the priests agree to it:

*And said unto them, What will ye give me, and I will deliver him unto you? And they covenanted with him for thirty pieces of silver.* (Matthew 26:15)

Zechariah had already been paid that sum for shepherding the flock, and had already thrown it where Judas would throw it:

*And I said unto them, If ye think good, give me my price; and if not, forbear. So they weighed for my price thirty pieces of silver.* (Zechariah 11:12)

*And Yahuah (LORD) said unto me, Cast it unto the potter: a goodly price that I was prised at of them. And I took the thirty pieces of silver, and cast them to the potter in the house of Yahuah (LORD).* (Zechariah 11:13)

*A goodly price that I was prised at of them*: thirty pieces was the sum the Torah set for a slave killed by an ox, the worth of a servant's life and no more:

*If the ox shall push a manservant or a maidservant; he shall give unto their master thirty shekels of silver, and the ox shall be stoned.* (Exodus 21:32)

The shepherd of the house was valued at a gored servant, and Matthew closes the account where Zechariah left it, with the silver thrown back in the temple and spent on a potter's field:

*Then was fulfilled that which was spoken by Jeremiah the prophet, saying, And they took the thirty pieces of silver, the price of him that was valued, whom they of the children of Yashar'el (Israel) did value;* (Matthew 27:9)

*And gave them for the potter’s field, as Yahuah (Lord) appointed me.* (Matthew 27:10)

The betrayer himself was written too, by David, and Yahusha (Jesus) said so at the table with Judas still in the room:

*Yea, mine own familiar friend, in whom I trusted, which did eat of my bread, hath lifted up his heel against me.* (Psalm 41:9)

*I speak not of you all: I know whom I have chosen: but that the scripture may be fulfilled, He that eateth bread with me hath lifted up his heel against me.* (John 13:18)

The price, the potter, the house of Yahuah (the LORD), the friend who ate his bread: none of it took him by surprise. He walked into what the prophets had written and let Judas play his part in it.$n$, $n$It ain't new. Judas sets a price and the priests agree to it:

*And said unto them, What will ye give me, and I will deliver him unto you? And they covenanted with him for thirty pieces of silver.* (Matthew 26:15)

Zechariah had already been paid that sum for shepherding the flock, and had already thrown it where Judas would throw it:

*And I said unto them, If ye think good, give me my price; and if not, forbear. So they weighed for my price thirty pieces of silver.* (Zechariah 11:12)

*And Yahuah (LORD) said unto me, Cast it unto the potter: a goodly price that I was prised at of them. And I took the thirty pieces of silver, and cast them to the potter in the house of Yahuah (LORD).* (Zechariah 11:13)

*A goodly price that I was prised at of them*: thirty pieces was the sum the Torah set for a slave killed by an ox, the worth of a servant's life and no more:

*If the ox shall push a manservant or a maidservant; he shall give unto their master thirty shekels of silver, and the ox shall be stoned.* (Exodus 21:32)

The shepherd of the house was valued at a gored servant, and Matthew closes the account where Zechariah left it, with the silver thrown back in the temple and spent on a potter's field:

*Then was fulfilled that which was spoken by Jeremiah the prophet, saying, And they took the thirty pieces of silver, the price of him that was valued, whom they of the children of Yashar'el (Israel) did value;* (Matthew 27:9)

*And gave them for the potter’s field, as Yahuah (Lord) appointed me.* (Matthew 27:10)

The betrayer himself was written too, by David, and Yahusha (Jesus) said so at the table with Judas still in the room:

*Yea, mine own familiar friend, in whom I trusted, which did eat of my bread, hath lifted up his heel against me.* (Psalm 41:9)

*I speak not of you all: I know whom I have chosen: but that the scripture may be fulfilled, He that eateth bread with me hath lifted up his heel against me.* (John 13:18)

The price, the potter, the house of Yahuah (the LORD), the friend who ate his bread: none of it took him by surprise. He walked into what the prophets had written and let Judas play his part in it.$n$);

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
  IF NOT FOUND THEN RAISE EXCEPTION 'S503c: thread 22 not found under its slug'; END IF;
  SELECT count(*) INTO n FROM cross_reference_threads t JOIN s503c_thread s ON s.id = t.id
    WHERE (t.title = s.old_title AND t.summary_md = s.old_summary) OR (t.title = s.new_title AND t.summary_md = s.new_summary);
  IF n <> 1 THEN RAISE EXCEPTION 'S503c: thread 22 title/summary differ from the read-back — re-dump and rebuild'; END IF;
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
  RAISE NOTICE 'S503c (thirty-pieces-of-silver) summary: notes rewritten % / already there %; member notes rewritten % / already there %; thread rewritten % / already there %', n_notes, n_c - n_notes, n_m, n_c - n_m, n_t, 1 - n_t;
END $s503c2$;
COMMIT;
\echo 'session503c — thirty-pieces-of-silver done.'
