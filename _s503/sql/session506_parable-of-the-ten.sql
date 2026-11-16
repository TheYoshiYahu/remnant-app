-- =====================================================================
-- Session 503c migration — summaries sweep — thread 14 `parable-of-the-ten-virgins-oil-substance-as-heart-torah-walking-life`: title + summary rewritten (slug kept); 12 member card(s)
-- rewritten in place with their member notes (ids, verse pairs and membership untouched). Written and read on Claude Fable 5.1 against
-- merged read-back S506 for `parable-of-the-ten-virgins-oil-substance-as-heart-torah-walking-life` from canon__ezekiel (1), canon__genesis (1), canon__luke (2), canon__matthew (10). Every note composed by script (build503c.py). Guards RAISE before any write if the live data moved. Idempotent. Nothing deleted.
-- Run: python3 api/apply_migration.py data-schema/migrations/session506_parable-of-the-ten.sql
-- =====================================================================
\echo 'session503c — parable-of-the-ten starting...'
BEGIN;
CREATE TEMP TABLE s503c_cards (id bigint, s_ed text, s_book text, src_ch int, src_vn int, src_text text, t_ed text, tgt_book text, tgt_ch int, tgt_vn int, old_note text, new_note text, thread_id bigint, old_mnote text, new_mnote text) ON COMMIT DROP;
INSERT INTO s503c_cards VALUES
(2962,'canon','matthew',25,1,$n$Then shall the kingdom of heaven be likened unto ten virgins, which took their lamps, and went forth to meet the bridegroom.$n$,'canon','matthew',7,21,$n$*Lord, Lord ... I never knew you* — direct echo.$n$,$n$Matthew 7:21 — *Not every one that saith unto me, Adonai (Lord), Adonai (Lord), shall enter into the kingdom of heaven; but he that doeth the will of my Father which is in heaven.* *Then shall the kingdom of heaven be likened unto ten virgins, which took their lamps, and went forth to meet the bridegroom.* (Matthew 25:1) The ten went out with lamps to meet the bridegroom, and here is who gets in. Not the ones who only say *Adonai (Lord)*, but the one who does the will of the Father. The virgins who come knocking later call him by that same title, and it does not open the door.$n$,14,$n$The *Lord, Lord* + *I never knew you* direct-echo.$n$,$n$Matthew 7:21 — *but he that doeth the will of my Father which is in heaven.* Entering the kingdom is for the one who does the Father's will, not for the one who only calls out the title.$n$),
(2963,'canon','matthew',25,1,$n$Then shall the kingdom of heaven be likened unto ten virgins, which took their lamps, and went forth to meet the bridegroom.$n$,'canon','ezekiel',36,26,$n$The new-heart + Ruach — the substantial-oil-substance.$n$,$n$Ezekiel 36:26 — *A new heart also will I give you, and a new spirit will I put within you: and I will take away the stony heart out of your flesh, and I will give you an heart of flesh.* *Then shall the kingdom of heaven be likened unto ten virgins, which took their lamps, and went forth to meet the bridegroom.* (Matthew 25:1) A lamp can be carried by anyone. What fills the vessel is given. Yahuah (LORD) promises *a new heart* and *a new spirit* put within, with the stony heart taken out. That is the oil the wise had with their lamps and the foolish did not.$n$,14,$n$The new-heart + Ruach substance — the substantial-oil-substance.$n$,$n$Ezekiel 36:26 — *A new heart also will I give you, and a new spirit will I put within you.* The new heart and new spirit put within are the oil that keeps the lamp burning.$n$),
(2964,'canon','matthew',25,1,$n$Then shall the kingdom of heaven be likened unto ten virgins, which took their lamps, and went forth to meet the bridegroom.$n$,'canon','jeremiah',31,33,$n$The heart-Torah substance.$n$,$n$Jeremiah 31:33 — *But this shall be the covenant that I will make with the house of Yashar'el (Israel); After those days, saith Yahuah (LORD), I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people.* *Then shall the kingdom of heaven be likened unto ten virgins, which took their lamps, and went forth to meet the bridegroom.* (Matthew 25:1) The covenant is made with the house of Yashar'el (Israel), and the virgins are of that house. What fills the vessel is Torah, *my law* put *in their inward parts* and written on the heart. Nothing is replaced. The law itself becomes what a person carries inside.$n$,14,$n$The heart-Torah substance.$n$,$n$Jeremiah 31:33 — *I will put my law in their inward parts, and write it in their hearts.* Torah written on the heart is the oil carried inside the vessel.$n$),
(2965,'canon','matthew',25,1,$n$Then shall the kingdom of heaven be likened unto ten virgins, which took their lamps, and went forth to meet the bridegroom.$n$,'canon','zechariah',4,1,$n$The Tanakh-oil-substance.$n$,$n$Zechariah 4:1 — *And the angel that talked with me came again, and waked me, as a man that is wakened out of his sleep,* *Then shall the kingdom of heaven be likened unto ten virgins, which took their lamps, and went forth to meet the bridegroom.* (Matthew 25:1) The prophet is waked, as from sleep, to see a lampstand that keeps burning because oil is fed to it. The ten virgins carry lamps, and this is the vision that says what a lamp needs. A lamp is not its own fire. It burns on what is poured in.$n$,14,$n$The two-anointed-ones + the substantial-Tanakh-oil-substance.$n$,$n$Zechariah 4:1 — *waked me, as a man that is wakened out of his sleep.* The prophet is roused to see a lampstand kept burning by oil fed to it, the picture behind the virgins' lamps.$n$),
(2966,'canon','matthew',25,1,$n$Then shall the kingdom of heaven be likened unto ten virgins, which took their lamps, and went forth to meet the bridegroom.$n$,'canon','leviticus',8,10,$n$The anointing-with-oil substance — kings-and-priests.$n$,$n$Leviticus 8:10 — *And Moses took the anointing oil, and anointed the tabernacle and all that was therein, and sanctified them.* *Then shall the kingdom of heaven be likened unto ten virgins, which took their lamps, and went forth to meet the bridegroom.* (Matthew 25:1) Oil in the Torah is poured on what is set apart, the tabernacle *and all that was therein*. The oil goes into the vessels. The virgins went out with lamps, and the wise had the oil to go with them.$n$,14,$n$The anointing-with-oil substance — kings-and-priests.$n$,$n$Leviticus 8:10 — *Moses took the anointing oil, and anointed the tabernacle and all that was therein.* Oil is poured on the vessels set apart to Yahuah (LORD), and the wise virgins had oil in theirs.$n$),
(2967,'canon','matthew',25,1,$n$Then shall the kingdom of heaven be likened unto ten virgins, which took their lamps, and went forth to meet the bridegroom.$n$,'canon','matthew',22,1,$n$The marriage-feast + the wedding-garment substance.$n$,$n$Matthew 22:1 — *And Yahusha (Jesus) answered and spake unto them again by parables, and said,* *Then shall the kingdom of heaven be likened unto ten virgins, which took their lamps, and went forth to meet the bridegroom.* (Matthew 25:1) Yahusha (Jesus) is still speaking in parables, and the next one is a wedding too. The kingdom is likened to a marriage, and the ten virgins go out to meet the bridegroom. Both stories ask who gets into the wedding and who stays outside.$n$,14,$n$The marriage-feast-parable + the wedding-garment substance — the substantial-precursor.$n$,$n$Matthew 22:1 — *answered and spake unto them again by parables.* Yahusha (Jesus) goes on speaking in parables about the kingdom and a marriage, and the virgins' story is one of them.$n$),
(2968,'canon','matthew',25,1,$n$Then shall the kingdom of heaven be likened unto ten virgins, which took their lamps, and went forth to meet the bridegroom.$n$,'canon','genesis',7,16,$n$The Tanakh-shut-door (Noach's ark).$n$,$n$Genesis 7:16 — *And they that went in, went in male and female of all flesh, as Elohim (God) had commanded him: and Yahuah (LORD) shut him in.* *Then shall the kingdom of heaven be likened unto ten virgins, which took their lamps, and went forth to meet the bridegroom.* (Matthew 25:1) Yahuah (LORD) shut a door once before. The ones inside had done as they were commanded, and he shut them in. Everyone left outside stayed outside. The late virgins knock at a door shut the same way, on the side of those who did what he said.$n$,14,$n$*Yahuah (the LORD) shut him in* — the Tanakh-shut-door substance.$n$,$n$Genesis 7:16 — *as Elohim (God) had commanded him: and Yahuah (LORD) shut him in.* Yahuah (LORD) shut the door on those who had done as commanded, the same kind of shut door the virgins meet.$n$),
(2970,'canon','matthew',25,1,$n$Then shall the kingdom of heaven be likened unto ten virgins, which took their lamps, and went forth to meet the bridegroom.$n$,'canon','proverbs',1,7,$n$The fear-of-Yahuah as-the-beginning-of-knowledge.$n$,$n$Proverbs 1:7 — *The fear of Yahuah (LORD) is the beginning of knowledge: but fools despise wisdom and instruction.* *Then shall the kingdom of heaven be likened unto ten virgins, which took their lamps, and went forth to meet the bridegroom.* (Matthew 25:1) The ten are split into wise and foolish, and this verse draws the same line. The fool is the one who despises *wisdom and instruction*. The foolish virgins took lamps and no oil. The beginning of knowledge is the fear of Yahuah (LORD), and it shows in what a person carries.$n$,14,$n$The fear-of-Yahuah as-the-beginning-of-knowledge.$n$,$n$Proverbs 1:7 — *but fools despise wisdom and instruction.* The fool is the one who despises instruction, and the foolish virgins are the ones who went out with no oil.$n$),
(2971,'canon','matthew',25,1,$n$Then shall the kingdom of heaven be likened unto ten virgins, which took their lamps, and went forth to meet the bridegroom.$n$,'canon','proverbs',9,1,$n$The wise-substance.$n$,$n$Proverbs 9:1 — *Wisdom hath builded her house, she hath hewn out her seven pillars:* *Then shall the kingdom of heaven be likened unto ten virgins, which took their lamps, and went forth to meet the bridegroom.* (Matthew 25:1) Wisdom builds a house and gets it ready, *hath hewn out* her pillars before anyone comes. The wise virgins prepared the same way, with oil in their vessels, and they were the ones who went in with the bridegroom.$n$,14,$n$The wise-substance.$n$,$n$Proverbs 9:1 — *Wisdom hath builded her house, she hath hewn out her seven pillars.* Wisdom prepares ahead, as the wise virgins did when they took oil with their lamps.$n$),
(2972,'canon','matthew',25,1,$n$Then shall the kingdom of heaven be likened unto ten virgins, which took their lamps, and went forth to meet the bridegroom.$n$,'canon','proverbs',9,13,$n$The foolish-substance.$n$,$n$Proverbs 9:13 — *A foolish woman is clamorous: she is simple, and knoweth nothing.* *Then shall the kingdom of heaven be likened unto ten virgins, which took their lamps, and went forth to meet the bridegroom.* (Matthew 25:1) The foolish woman is *clamorous* and *knoweth nothing*. The foolish virgins match her: lamps, a loud cry at the door, and nothing in the vessel. Being loud is not being wise. Having the lamp is not the same as knowing him.$n$,14,$n$The foolish-substance.$n$,$n$Proverbs 9:13 — *A foolish woman is clamorous: she is simple, and knoweth nothing.* The foolish one is loud and knows nothing, like the virgins crying at the shut door.$n$),
(2973,'canon','matthew',25,1,$n$Then shall the kingdom of heaven be likened unto ten virgins, which took their lamps, and went forth to meet the bridegroom.$n$,'canon','isaiah',55,1,$n$*Come, buy wine and milk without money.*$n$,$n$Isaiah 55:1 — *Ho, every one that thirsteth, come ye to the waters, and he that hath no money; come ye, buy, and eat; yea, come, buy wine and milk without money and without price.* *Then shall the kingdom of heaven be likened unto ten virgins, which took their lamps, and went forth to meet the bridegroom.* (Matthew 25:1) What the vessel needs is offered to whoever thirsts and comes, without money. In the parable the foolish go off to buy only when the bridegroom is already on his way. What Isaiah calls everyone to take *without money and without price*, they went looking for too late.$n$,14,$n$*Come, buy wine and milk without money.*$n$,$n$Isaiah 55:1 — *come ye, buy, and eat; yea, come, buy wine and milk without money and without price.* The call to come and take freely is the supply the foolish virgins went looking for too late.$n$),
(2974,'canon','matthew',25,1,$n$Then shall the kingdom of heaven be likened unto ten virgins, which took their lamps, and went forth to meet the bridegroom.$n$,'canon','revelation',19,7,$n$The marriage-of-the-Lamb.$n$,$n$Revelation 19:7 — *Let us be glad and rejoice, and give honour to him: for the marriage of the Lamb is come, and his wife hath made herself ready.* *Then shall the kingdom of heaven be likened unto ten virgins, which took their lamps, and went forth to meet the bridegroom.* (Matthew 25:1) The bridegroom the virgins go out to meet is here the Lamb, and the marriage has come. His wife *hath made herself ready*, and that is what the parable asks. Those who were ready went in. Being ready is oil in the vessel, the law walked in.$n$,14,$n$The marriage-of-the-Lamb substance.$n$,$n$Revelation 19:7 — *the marriage of the Lamb is come, and his wife hath made herself ready.* The wife who has made herself ready is the ready virgin who goes in to the marriage.$n$);
CREATE TEMP TABLE s503c_thread (id bigint, slug text, old_title text, new_title text, old_summary text, new_summary text) ON COMMIT DROP;
INSERT INTO s503c_thread VALUES (14, 'parable-of-the-ten-virgins-oil-substance-as-heart-torah-walking-life', $n$The ten virgins — oil in the vessel, the shut door, and I know you not (Ezekiel 36; Zechariah 4; Matthew 7)$n$, $n$The ten virgins — oil in the vessel, the shut door, and I know you not (Ezekiel 36; Zechariah 4; Matthew 7)$n$, $n$It ain't new. Ten virgins go out to meet the bridegroom, all with lamps, and the parable turns on one thing they did not all carry:

*They that were foolish took their lamps, and took no oil with them:* (Matthew 25:3)

*But the wise took oil in their vessels with their lamps.* (Matthew 25:4)

A lamp with no oil burns for a while on what it was lit with and then goes out. The prophets had already said what fills the vessel so the lamp keeps burning, and it is not the lamp:

*A new heart also will I give you, and a new spirit will I put within you: and I will take away the stony heart out of your flesh, and I will give you an heart of flesh.* (Ezekiel 36:26)

*And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them.* (Ezekiel 36:27)

*But this shall be the covenant that I will make with the house of Yashar'el (Israel); After those days, saith Yahuah (LORD), I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people.* (Jeremiah 31:33)

The Spirit put within, and the Torah written in the heart so that a man walks in the statutes: that is oil in the vessel. Zechariah saw a lampstand that burned because oil was fed to it, and heard what the oil was:

*And said unto me, What seest thou? And I said, I have looked, and behold a candlestick all of gold, with a bowl upon the top of it, and his seven lamps thereon, and seven pipes to the seven lamps, which are upon the top thereof:* (Zechariah 4:2)

*Then he answered and spake unto me, saying, This is the word of Yahuah (LORD) unto Zerubbabel, saying, Not by might, nor by power, but by my spirit, saith Yahuah Tseva'ot (LORD of hosts).* (Zechariah 4:6)

Then the door:

*And while they went to buy, the bridegroom came; and they that were ready went in with him to the marriage: and the door was shut.* (Matthew 25:10)

*Afterward came also the other virgins, saying, Adonai (Lord), Adonai (Lord), open to us.* (Matthew 25:11)

*But he answered and said, Verily I say unto you, I know you not.* (Matthew 25:12)

Mark who is outside. Not strangers, not the tares, but virgins who went out to meet him, with lamps, calling him *Adonai (Lord)*. They are of the house, and the door is shut on them. He had said it before, and said what the shut door is about:

*Not every one that saith unto me, Adonai (Lord), Adonai (Lord), shall enter into the kingdom of heaven; but he that doeth the will of my Father which is in heaven.* (Matthew 7:21)

*And then will I profess unto them, I never knew you: depart from me, ye that work iniquity.* (Matthew 7:23)

Luke has the same knock and the same answer:

*When once the master of the house is risen up, and hath shut to the door, and ye begin to stand without, and to knock at the door, saying, Adonai (Lord), Adonai (Lord), open unto us; and he shall answer and say unto you, I know you not whence ye are:* (Luke 13:25)

Yahuah (the LORD) shut a door once before, on the whole earth, with the ones inside who had done as he commanded:

*And they that went in, went in male and female of all flesh, as Elohim (God) had commanded him: and Yahuah (LORD) shut him in.* (Genesis 7:16)

The virgins outside had the lamp and the name and the right road, and no oil. The sifting at the door is of the house, the ones who called him *Adonai (Lord)* and did not walk in the statutes, and the warning is to the house:

*Watch therefore, for ye know neither the day nor the hour wherein the Son of Adam cometh.* (Matthew 25:13)$n$, $n$It ain't new. Ten virgins go out to meet the bridegroom, all with lamps, and the parable turns on one thing they did not all carry:

*They that were foolish took their lamps, and took no oil with them:* (Matthew 25:3)

*But the wise took oil in their vessels with their lamps.* (Matthew 25:4)

A lamp with no oil burns for a while on what it was lit with and then goes out. The prophets had already said what fills the vessel so the lamp keeps burning, and it is not the lamp:

*A new heart also will I give you, and a new spirit will I put within you: and I will take away the stony heart out of your flesh, and I will give you an heart of flesh.* (Ezekiel 36:26)

*And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them.* (Ezekiel 36:27)

*But this shall be the covenant that I will make with the house of Yashar'el (Israel); After those days, saith Yahuah (LORD), I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people.* (Jeremiah 31:33)

The Spirit put within, and the Torah written in the heart so that a man walks in the statutes: that is oil in the vessel. Zechariah saw a lampstand that burned because oil was fed to it, and heard what the oil was:

*And said unto me, What seest thou? And I said, I have looked, and behold a candlestick all of gold, with a bowl upon the top of it, and his seven lamps thereon, and seven pipes to the seven lamps, which are upon the top thereof:* (Zechariah 4:2)

*Then he answered and spake unto me, saying, This is the word of Yahuah (LORD) unto Zerubbabel, saying, Not by might, nor by power, but by my spirit, saith Yahuah Tseva'ot (LORD of hosts).* (Zechariah 4:6)

Then the door:

*And while they went to buy, the bridegroom came; and they that were ready went in with him to the marriage: and the door was shut.* (Matthew 25:10)

*Afterward came also the other virgins, saying, Adonai (Lord), Adonai (Lord), open to us.* (Matthew 25:11)

*But he answered and said, Verily I say unto you, I know you not.* (Matthew 25:12)

Mark who is outside. Not strangers, not the tares, but virgins who went out to meet him, with lamps, calling him *Adonai (Lord)*. They are of the house, and the door is shut on them. He had said it before, and said what the shut door is about:

*Not every one that saith unto me, Adonai (Lord), Adonai (Lord), shall enter into the kingdom of heaven; but he that doeth the will of my Father which is in heaven.* (Matthew 7:21)

*And then will I profess unto them, I never knew you: depart from me, ye that work iniquity.* (Matthew 7:23)

Luke has the same knock and the same answer:

*When once the master of the house is risen up, and hath shut to the door, and ye begin to stand without, and to knock at the door, saying, Adonai (Lord), Adonai (Lord), open unto us; and he shall answer and say unto you, I know you not whence ye are:* (Luke 13:25)

Yahuah (the LORD) shut a door once before, on the whole earth, with the ones inside who had done as he commanded:

*And they that went in, went in male and female of all flesh, as Elohim (God) had commanded him: and Yahuah (LORD) shut him in.* (Genesis 7:16)

The virgins outside had the lamp and the name and the right road, and no oil. The sifting at the door is of the house, the ones who called him *Adonai (Lord)* and did not walk in the statutes, and the warning is to the house:

*Watch therefore, for ye know neither the day nor the hour wherein the Son of Adam cometh.* (Matthew 25:13)$n$);

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
  IF NOT FOUND THEN RAISE EXCEPTION 'S503c: thread 14 not found under its slug'; END IF;
  SELECT count(*) INTO n FROM cross_reference_threads t JOIN s503c_thread s ON s.id = t.id
    WHERE (t.title = s.old_title AND t.summary_md = s.old_summary) OR (t.title = s.new_title AND t.summary_md = s.new_summary);
  IF n <> 1 THEN RAISE EXCEPTION 'S503c: thread 14 title/summary differ from the read-back — re-dump and rebuild'; END IF;
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
  RAISE NOTICE 'S503c (parable-of-the-ten) summary: notes rewritten % / already there %; member notes rewritten % / already there %; thread rewritten % / already there %', n_notes, n_c - n_notes, n_m, n_c - n_m, n_t, 1 - n_t;
END $s503c2$;
COMMIT;
\echo 'session503c — parable-of-the-ten done.'
